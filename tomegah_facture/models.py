import uuid
from django.db import models

from tomegah_consultation.models import Consultation
from tomegah_medecin.models import Medecin


# Create your models here.
class Facture(models.Model):
    class EtatFacture(models.TextChoices):
        Impayee = "Im", "Impayée"
        Payee = "Payée", "Payée"
        Partiellement = "Partie. payée", "Partiellement payée"
    code_facture = models.CharField(max_length=20, unique=True)
    typefacture = models.CharField(max_length=100)
    dateenreg_facture = models.DateField()
    datepaiement_facture = models.DateField(null=True, blank=True)
    montant_facture = models.IntegerField()
    montant_payefacture = models.IntegerField()
    etat_facture = models.CharField(
        choices=EtatFacture.choices, max_length=15, default=EtatFacture.Impayee
    )
    medecin = models.ForeignKey(Medecin, on_delete=models.SET_NULL, null=True)
    consultation = models.ForeignKey(Consultation, on_delete=models.SET_NULL, null=True)
    utilisateur = models.ForeignKey(
        "authentication.Utilisateur", on_delete=models.SET_NULL, null=True
    )

    def save(self, *args, **kwargs):
        if not self.code_facture:
            self.code_facture = str(uuid.uuid4())[:20]
        super().save(*args, **kwargs)
