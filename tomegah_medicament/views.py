from django.shortcuts import redirect, render

from tomegah_medicament.forms import MedicamentForm
from tomegah_medicament.models import Medicament
from django.contrib import messages
from django.contrib.auth.decorators import login_required

# Create your views here.
@login_required

def home(request):
    medicaments = Medicament.objects.all()
    form = MedicamentForm(request.POST or None)

    if request.method == "POST":
        if form.is_valid():
            form.save()
            messages.success(request, "Médicament créé avec succès.")
            return redirect("medicament.index")
        else:
            messages.error(request, "Erreur dans le formulaire.")

    context = {
        "form": form,
        "medicaments": medicaments,
    }
    return render(request, "tomegah_medicament/medicament_list.html", context)