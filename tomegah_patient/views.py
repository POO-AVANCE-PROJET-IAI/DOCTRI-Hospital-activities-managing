from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from tomegah_patient.forms import PatientForm
from tomegah_patient.models import Patient
from django.views import View
# Create your views here.

@login_required
def home(request):
    patients = Patient.objects.all()
    form = PatientForm()

    if request.method == 'POST':
        form = PatientForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('patients.index')  # ou HttpResponseRedirect si AJAX

    return render(request, 'tomegah_patient/patient_list.html', {
            'patients': patients,
            'form': form
        })


@login_required
def patient_detail(request, patient_id):
    patient = Patient.objects.get(id=patient_id)
    if request.method == 'POST':
        form = PatientForm(request.POST, instance=patient)
        if form.is_valid():
            form.save()
            return redirect('patients.index')
    else:
        form = PatientForm(instance=patient)
    return render(request, 'tomegah_patient/patient_detail.html', {
        'patient': patient,
        'form': form
        })

@login_required
def patient_delete(request, patient_id):
    patient = Patient.objects.get(id=patient_id)
    if request.method == 'POST':
        patient.delete()
        return redirect('patients.index')
    return render(request, 'tomegah_patient/patient_delete.html', {
        'patient': patient
    })
