from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from tomegah_patient.models import Patient

# Create your views here.

@login_required
def home(request):
    patients = Patient.objects.all()
    return render(request, 'tomegah_patient/patient_list.html', {'patients': patients})