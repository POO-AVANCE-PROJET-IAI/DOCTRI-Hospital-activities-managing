from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from tomegah_consultation.models import Consultation
from tomegah_facture.forms import FactureForm
from tomegah_facture.models import Facture
from django.contrib import messages
from django.template.loader import render_to_string
from django.http import HttpResponse
from weasyprint import HTML
import tempfile

@login_required
def home(request):
    factures = Facture.objects.all()
    return render(request, "tomegah_facture/facture_list.html", {"factures": factures})


@login_required
def creer_facture(request, consultation_id):
    if request.method == "GET":
        try:
            consultation = Consultation.objects.get(id=consultation_id)
        except Consultation.DoesNotExist:
            messages.error(request, "Consultation non trouvée.")
            return redirect("consultation.index")
    form = FactureForm()
    if request.method == "POST":
        form = FactureForm(request.POST)
        consultation_id = request.POST.get("consultation_id")
        consultation = get_object_or_404(Consultation, pk=consultation_id)

        if form.is_valid():
            facture = form.save(commit=False)
            facture.medecin = consultation.medecin
            facture.typefacture = consultation.acte.type_acte.libelle
            facture.montant_facture = consultation.acte.montant_acte
            facture.dateenreg_facture = consultation.dateconsultation
            facture.montant_payefacture = 0
            facture.reste_a_payer = consultation.acte.montant_acte
            facture.consultation = consultation
            facture.utilisateur = request.user
            facture.save()
            message = messages.success(request, "Facture créée avec succès.")
            return redirect("facture.index")
        else:
            form = FactureForm()

    return render(
        request,
        "tomegah_facture/facture_create.html",
        {
            "form": form,
            "consultation": consultation,  # si consultation est transmise ici
        },
    )


@login_required
def payer_facture(request, facture_id):
    if request.method == "POST":
        montant_a_payer = float(request.POST.get("montant_a_payer", 0))
        montant_paye = float(request.POST.get("montant_paye", 0))
        facture = get_object_or_404(Facture, id=facture_id)
        if facture.utilisateur != request.user:
            messages.error(request, "Accès non autorisé à cette facture.")
            return redirect("facture.index")
        # Cas: trop payé
        if montant_paye > montant_a_payer:
            messages.error(request, "Le montant payé dépasse le montant dû.")
            return redirect("facture.index")

        # Mise à jour du montant payé
        facture.montant_payefacture += montant_paye

        # Mise à jour de l'état
        if facture.montant_payefacture == facture.montant_facture:
            facture.etat_facture = "pA"
        elif facture.montant_payefacture < facture.montant_facture:
            facture.etat_facture = ""

        facture.save()

        messages.success(request, "Paiement enregistré avec succès.")
        return redirect("facture.index")

    return redirect("facture.create")


def imprimer_facture(request, facture_id):
    facture = get_object_or_404(Facture, id=facture_id)

    html_string = render_to_string('tomegah_facture/facture_pdf.html', {'facture': facture})
    
    html = HTML(string=html_string, base_url=request.build_absolute_uri())

    result = html.write_pdf()

    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = f'inline; filename=facture_{facture.code_facture}.pdf'
    response.write(result)

    return response