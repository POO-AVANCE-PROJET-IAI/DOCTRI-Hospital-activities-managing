from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from tomegah_consultation.models import Consultation

# Create your views here.

@login_required
def home(request):
    consultations = Consultation.objects.all()
    return render(request, 'tomegah_consultation/consultation_list.html', {
            'consultations': consultations,
        })
    
    

@login_required
def consultation_detail(request, consultation_id):
    consultation = Consultation.objects.get(id=consultation_id)
    return render(request, 'tomegah_consultation/consultation_detail.html', {
            'consultation': consultation,
        })


@login_required
def consultation_create(request):
    return render(request, 'tomegah_consultation/consultation_create.html', {})



@login_required
def consultation_update(request, consultation_id):
    consultation = Consultation.objects.get(id=consultation_id)
    return render(request, 'tomegah_consultation/consultation_update.html', {})

@login_required
def consultation_delete(request, consultation_id):
    consultation = Consultation.objects.get(id=consultation_id)
    return render(request, 'tomegah_consultation/consultation_delete.html', {})
    