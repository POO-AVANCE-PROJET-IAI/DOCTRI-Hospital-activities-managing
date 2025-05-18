from django import forms
from tomegah_ordonnance_detail.models import OrdonnanceDetail


class OrdonnanceDetailForm(forms.ModelForm):
    class Meta:
        model = OrdonnanceDetail
        fields = ['medicament', 'posologie_medicament']
        widgets = {
            "posologie_medicament": forms.TextInput(
                attrs={"class": "w-full border border-gray-300 rounded-md px-3 py-2 mt-1 text-sm"}
            ),
            "medicament": forms.Select(
                attrs={
                    "class": "w-full border border-gray-300 rounded-md px-3 py-2 mt-1 text-sm"
                }
            ),
        }
        
OrdonnanceDetailFormSet = forms.modelformset_factory(
    OrdonnanceDetail,
    form=OrdonnanceDetailForm,
    extra=3,  
    can_delete=False,
)