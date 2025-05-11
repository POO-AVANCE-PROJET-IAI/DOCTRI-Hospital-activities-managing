from django.shortcuts import redirect, render

from tomegah_consultation.models import Consultation
from tomegah_medicament.forms import MedicamentForm
from tomegah_medicament.models import Medicament
from tomegah_ordonnance.forms import OrdonnanceForm
from tomegah_ordonnance.models import Ordonnance
from django.contrib.auth.decorators import login_required
from django.contrib import messages


# Create your views here.
@login_required
def home(request):
    ordonnances = Ordonnance.objects.all()
    medicaments = Medicament.objects.all()
    
    return render(
        request,
        "tomegah_ordonnance/ordonnance_list.html",
        {"ordonnances": ordonnances, "medicaments": medicaments},
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