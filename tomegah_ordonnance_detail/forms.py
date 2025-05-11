from django import forms
from tomegah_ordonnance_detail.models import OrdonnanceDetail


class OrdonnanceDetailForm(forms.ModelForm):
    class Meta:
        model = OrdonnanceDetail
        fields = ['medicament', 'posologie_medicament']
        
        
OrdonnanceDetailFormSet = forms.modelformset_factory(
    OrdonnanceDetail,
    form=OrdonnanceDetailForm,
    extra=3,  # 3 lignes de médicaments par défaut
    can_delete=False,
)