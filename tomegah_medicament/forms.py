from django import forms
from tomegah_medicament.models import Medicament


class MedicamentForm(forms.ModelForm):
    class Meta:
        model = Medicament
        exclude = [
            "code_medicament",
        ]
        widgets = {
            "libelle_medicament": forms.TextInput(
                attrs={
                    "class": "w-full border border-gray-300 rounded-md px-3 py-2 mt-1 text-sm"
                }
            ),
            "forme": forms.TextInput(
                attrs={
                    "class": "w-full border border-gray-300 rounded-md px-3 py-2 mt-1 text-sm"
                }
            ),
            "dosage": forms.TextInput(
                attrs={
                    "class": "w-full border border-gray-300 rounded-md px-3 py-2 mt-1 text-sm"
                }
            ),
            "voie_administration": forms.TextInput(
                attrs={
                    "class": "w-full border border-gray-300 rounded-md px-3 py-2 mt-1 text-sm"
                }
            )
        }
