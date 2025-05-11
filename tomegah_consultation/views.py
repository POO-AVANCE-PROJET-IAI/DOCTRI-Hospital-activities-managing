from django.http import Http404
from django.shortcuts import render, get_object_or_404, redirect, render
from django.contrib.auth.decorators import login_required
from django.urls import reverse
from tomegah_consultation import forms
from tomegah_consultation.models import Consultation
from django.views.generic import View
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import redirect
from django.contrib import messages
from django.template.loader import render_to_string
from django.http import JsonResponse

from tomegah_patient.models import Patient


@login_required
def home(request):
    consultations = Consultation.objects.all()
    return render(
        request,
        "tomegah_consultation/consultation_list.html",
        {
            "consultations": consultations,
            "lien_nouveau": reverse("consultation.create"),
        },
    )


@login_required
def consultation_detail(request, consultation_id):
    consultation = Consultation.objects.get(id=consultation_id)
    return render(
        request,
        "tomegah_consultation/consultation_detail.html",
        {
            "consultation": consultation,
        },
    )


class ConsultationCreateView(LoginRequiredMixin, View):
    template_name = "tomegah_consultation/consultation_create.html"
    form_class = forms.ConsultationForm
    login_url = "login"

    def get(self, request, patient_id):
        patient = get_object_or_404(Patient, id=patient_id)
        consultations = Consultation.objects.all()
        if not patient:
            messages.error(request, "Patient non trouvé.")
            return redirect("consultations.index")
        form = self.form_class()
        return render(
            request,
            self.template_name,
            {"form": form, "patient": patient, "consultations": consultations},
        )

    def post(self, request, patient_id):
        form = self.form_class(request.POST)
        if form.is_valid():
            consultation = form.save()
            messages.success(request, "Consultation créée avec succès")

            return redirect("consultations.index")
        else:
            messages.error(request, "Erreur lors de la création de la consultation")

            return render(request, self.template_name, {"form": form})


class ConsultationAddActeView(LoginRequiredMixin, View):
    template_name = "tomegah_consultation/consultation_add_acte.html"
    login_url = "login"

    def get(self, request, consultation_id, patient_id):
        consultations_patient = list(Consultation.objects.filter(patient_id=patient_id))
        consultation_actuelle = next(
            (c for c in consultations_patient if c.id == consultation_id), None
        )
        if not consultation_actuelle:
            raise Http404("Consultation introuvable pour ce patient")

        form = forms.ConsultationActeForm(instance=consultation_actuelle)
        return render(
            request,
            self.template_name,
            {
                "form": form,
                "consultations_patient": consultations_patient,
                "consultation_actuelle": consultation_actuelle,
            },
        )

    def post(self, request, consultation_id, patient_id):
        consultations_patient = Consultation.objects.filter(patient_id=patient_id)
        try:
            consultation_actuelle = consultations_patient.get(id=consultation_id)
        except Consultation.DoesNotExist:
            raise Http404("Consultation introuvable pour ce patient")

        form = forms.ConsultationActeForm(request.POST, instance=consultation_actuelle)

        if form.is_valid():
            print(f"hey there {form.cleaned_data}")
            form.save()
            print(f"acte après save: {consultation_actuelle.acte_id}")
            messages.success(request, "Consultation mise à jour avec l'acte médical.")

            if request.headers.get("x-requested-with") == "XMLHttpRequest":
                table_html = render_to_string(
                    "partials/_actes_table.html",
                    {"consultations_patient": consultations_patient},
                )
                success_html = render_to_string(
                    "partials/_success_message.html",
                    {"messages": messages.get_messages(request)},
                )
                return JsonResponse(
                    {
                        "success": True,
                        "table_html": table_html,
                        "message_html": success_html,
                    }
                )

        else:
            print(f"hey there {form.errors}")
            if request.headers.get("x-requested-with") == "XMLHttpRequest":
                errors_html = render_to_string(
                    "partials/_form_errors.html", {"form": form}
                )
                return JsonResponse({"success": False, "errors_html": errors_html})

        # Fallback en cas de requête normale (non AJAX)
        return render(
            request,
            self.template_name,
            {
                "form": form,
                "consultations_patient": consultations_patient,
                "consultation_actuelle": consultation_actuelle,
            },
        )


@login_required
def consultation_update(request, consultation_id):
    consultation = Consultation.objects.get(id=consultation_id)
    return render(request, "tomegah_consultation/consultation_update.html", {})


@login_required
def consultation_delete(request, consultation_id):
    consultation = Consultation.objects.get(id=consultation_id)
    return render(request, "tomegah_consultation/consultation_delete.html", {})
