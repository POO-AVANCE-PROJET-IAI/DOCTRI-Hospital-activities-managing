from django import forms

from .models import Consultation
...

class ConsultationForm(forms.ModelForm):
   class Meta:
     model = Consultation
     exclude = ['medecin', 'acte', 'codeconsultation']
     
class ConsultationActeForm(forms.ModelForm):
    class Meta:
        model = Consultation
        fields = ['medecin', 'acte']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['medecin'].required = True
        self.fields['acte'].required = True

    def clean(self):
        cleaned_data = super().clean()
        medecin = cleaned_data.get('medecin')
        acte = cleaned_data.get('acte')

        errors = {}
        if not medecin:
            errors['medecin'] = "Veuillez sélectionner un médecin."
        if not acte:
            errors['acte'] = "Veuillez sélectionner un acte."

        if errors:
            raise forms.ValidationError(errors)

        return cleaned_data
