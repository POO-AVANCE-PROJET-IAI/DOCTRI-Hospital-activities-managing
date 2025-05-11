from django import forms
from tomegah_ordonnance.models import Ordonnance


class OrdonnanceForm(forms.ModelForm):
    class Meta:
        model = Ordonnance
        exclude = [
            "code_ordonnance",
        ]
        widgets = {
            "date_ordonnance": forms.TextInput(
                attrs={
                    "class": "w-full border border-gray-300 rounded-md px-3 py-2 mt-1 text-sm"
                }
            ),
        }
