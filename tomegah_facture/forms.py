from django import forms
from tomegah_facture.models import Facture

class FactureForm(forms.ModelForm):
    class Meta:
        model = Facture
        exclude = [
            'typefacture',
            'datepaiement_facture',
            'montant_payefacture',
            'reste_a_payer',
            'utilisateur',
            'code_facture',
            'dateenreg_facture',
            'etat_facture',
            'consultation',
            'medecin',
            'montant_facture',
        ]
        widgets = {
            'code_facture': forms.TextInput(attrs={
                'class': 'w-full border border-gray-300 rounded-md px-3 py-2 mt-1 text-sm'
            }),
            'dateenreg_facture': forms.DateInput(attrs={
                'type': 'date',
                'class': 'w-full border border-gray-300 rounded-md px-3 py-2 mt-1 text-sm'
            }),
            'montant_facture': forms.NumberInput(attrs={
                'class': 'w-full border border-gray-300 rounded-md px-3 py-2 mt-1 text-sm'
            }),
            'etat_facture': forms.Select(attrs={
                'class': 'w-full border border-gray-300 rounded-md px-3 py-2 mt-1 text-sm'
            }),
            'medecin': forms.Select(attrs={
                'class': 'w-full border border-gray-300 rounded-md px-3 py-2 mt-1 text-sm'
            }),
            'consultation': forms.Select(attrs={
                'class': 'w-full border border-gray-300 rounded-md px-3 py-2 mt-1 text-sm'
            }),
        }
