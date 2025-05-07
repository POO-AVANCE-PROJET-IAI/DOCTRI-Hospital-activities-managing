from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.urls import reverse
from tomegah_consultation import forms
from tomegah_consultation.models import Consultation
from django.views.generic import View
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import redirect
from django.contrib import messages

@login_required
def home(request):
    consultations = Consultation.objects.all()
    return render(request, 'tomegah_consultation/consultation_list.html', {
            'consultations': consultations,
            'lien_nouveau': reverse('consultation.create'),
        })
    
@login_required
def consultation_detail(request, consultation_id):
    consultation = Consultation.objects.get(id=consultation_id)
    return render(request, 'tomegah_consultation/consultation_detail.html', {
            'consultation': consultation,
        })

class ConsultationCreateView(LoginRequiredMixin, View):
    template_name = 'tomegah_consultation/consultation_create.html'
    form_class = forms.ConsultationForm
    login_url = 'login'

    def get(self, request):
        form = self.form_class()
        return render(request, self.template_name, {'form': form})

    def post(self, request):
        form = self.form_class(request.POST)
        if form.is_valid():
            consultation = form.save()
            messages.success(request, 'Consultation créée avec succès')

            return redirect('consultations.index')  
        else:
            messages.error(request, 'Erreur lors de la création de la consultation')

            return render(request, self.template_name, {'form': form})



@login_required
def consultation_update(request, consultation_id):
    consultation = Consultation.objects.get(id=consultation_id)
    return render(request, 'tomegah_consultation/consultation_update.html', {})

@login_required
def consultation_delete(request, consultation_id):
    consultation = Consultation.objects.get(id=consultation_id)
    return render(request, 'tomegah_consultation/consultation_delete.html', {})
    