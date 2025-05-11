from django.db import models

from tomegah_medicament.models import Medicament
from tomegah_ordonnance.models import Ordonnance

# Create your models here.

class OrdonnanceDetail(models.Model):
    code_ordonnancedetail = models.CharField(max_length=20, unique=True)
    ordonnance = models.ForeignKey(Ordonnance, on_delete=models.CASCADE, related_name="details")
    medicament = models.ForeignKey(Medicament, on_delete=models.SET_NULL, null=True)
    posologie_medicament = models.CharField(max_length=1000)
