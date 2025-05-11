from django.db import models
import uuid

from tomegah_acte.models import Acte
from tomegah_facture.models import Facture

# Create your models here.

class FactureDetail(models.Model):
    code_detailfacture = models.CharField(max_length=20, unique=True)
    facture = models.ForeignKey(Facture, on_delete=models.CASCADE, related_name="details")
    acte = models.ForeignKey(Acte, on_delete=models.CASCADE)
    montant_facturedetail = models.IntegerField()
    def save(self, *args, **kwargs):
        if not self.code_detailfacture:
            self.code_detailfacture = str(uuid.uuid4())[:20]
        super().save(*args, **kwargs)

# Create your models here.
