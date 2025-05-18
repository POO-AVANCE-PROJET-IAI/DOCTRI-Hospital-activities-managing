from django.http import HttpResponse
from django.shortcuts import get_object_or_404, redirect, render
from django.urls import reverse

from tomegah_consultation.models import Consultation
from tomegah_medicament.forms import MedicamentForm
from tomegah_ordonnance.forms import OrdonnanceForm
from tomegah_ordonnance.models import Ordonnance
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.shortcuts import render, get_object_or_404
from .models import Ordonnance
from tomegah_ordonnance_detail.models import OrdonnanceDetail
from django.template.loader import get_template
from weasyprint import HTML
import tempfile

# Create your views here.

from django.contrib import messages
from tomegah_consultation.models import Consultation
from tomegah_ordonnance_detail.forms import OrdonnanceDetailFormSet
from tomegah_ordonnance_detail.models import OrdonnanceDetail


@login_required
def home(request):
    consultation_id = request.GET.get("consultation_id")
    selected_consultation = None
    consultations = []

    if consultation_id:
        try:
            selected_consultation = Consultation.objects.get(id=consultation_id)
            consultations = [selected_consultation]
        except Consultation.DoesNotExist:
            messages.error(request, "La consultation spécifiée n'existe pas.")
    else:
        messages.info(request, "Aucune consultation n'a été choisie.")

    if request.method == "POST":
        ordonnanceForm = OrdonnanceForm(request.POST)
        detailFormset = OrdonnanceDetailFormSet(
            request.POST, queryset=OrdonnanceDetail.objects.none()
        )

        if ordonnanceForm.is_valid() and detailFormset.is_valid():
            ordonnance = ordonnanceForm.save(commit=False)
            if not selected_consultation:
                consultation_id = request.POST.get("consultation")
                if consultation_id:
                    try:
                        selected_consultation = Consultation.objects.get(
                            id=consultation_id
                        )
                    except Consultation.DoesNotExist:
                        messages.error(request, "Consultation invalide.")
                        return redirect("ordonnance.index")

            ordonnance.consultation = selected_consultation

            ordonnance.save()

            for detail_form in detailFormset:
                if detail_form.cleaned_data and not detail_form.cleaned_data.get(
                    "DELETE", False
                ):
                    code = detail_form.cleaned_data.get("code")
                    if code:
                        detail = detail_form.save(commit=False)
                        detail.ordonnance = ordonnance
                        detail.save()

            messages.success(request, "Ordonnance et médicaments créés avec succès.")
            return redirect(
                f"{reverse('ordonnance.index')}?consultation_id={selected_consultation.id}&done=1"
            )
        else:
            messages.error(request, "Erreur dans le formulaire.")
    else:
        ordonnanceForm = OrdonnanceForm(
            initial=(
                {"consultation": selected_consultation}
                if selected_consultation
                else None
            )
        )
        detailFormset = OrdonnanceDetailFormSet(
            queryset=OrdonnanceDetail.objects.none()
        )

    ordonnances = Ordonnance.objects.all()

    return render(
        request,
        "tomegah_ordonnance/ordonnance_list.html",
        {
            "ordonnances": ordonnances,
            "ordonnanceForm": ordonnanceForm,
            "detailFormset": detailFormset,
            "consultations": consultations,
            "selected_consultation": selected_consultation,
        },
    )


def creer_ordonnance(request, consultation_id):
    if request.method == "GET":
        try:
            consultation = Consultation.objects.get(id=consultation_id)
        except Consultation.DoesNotExist:
            messages.error(request, "Consultation non trouvée.")
            return redirect("consultation.index")
        medicamentForm = MedicamentForm()
        ordonnanceForm = OrdonnanceForm()
        ordonnances = Ordonnance.objects.filter(consultation=consultation)
    return render(
        request,
        "tomegah_ordonnance/ordonnance_create.html",
        {
            "ordonnanceForm": ordonnanceForm,
            "medicamentForm": medicamentForm,
            "consultations": consultation,
            "ordonnances": ordonnances,
        },
    )


@login_required
def imprimer_ordonnance(request, pk):
    ordonnance = get_object_or_404(Ordonnance, pk=pk)
    details = ordonnance.details.select_related("medicament").all()
    return render(
        request,
        "tomegah_ordonnance/ordonnance_print_template.html",
        {
            "ordonnance": ordonnance,
            "details": details,
        },
    )


@login_required
def telecharger_ordonnance_pdf(request, pk):
    ordonnance = get_object_or_404(Ordonnance, pk=pk)
    details = ordonnance.details.select_related("medicament").all()

    # Charger le template HTML
    template = get_template("tomegah_ordonnance/ordonnance_pdf.html")
    html_content = template.render({"ordonnance": ordonnance, "details": details})

    # Créer un fichier PDF temporaire
    response = HttpResponse(content_type="application/pdf")
    response['Content-Disposition'] = f'inline; filename="Ordonnance_{ordonnance.id}.pdf"'


    # Générer le PDF avec WeasyPrint
    HTML(string=html_content).write_pdf(response)
    return response
