from django.db import models

from tomegah_medecin.models import Medecin

# Create your models here.

class Specialite(models.Model):
    code = models.CharField(max_length=10, unique=True)
    libelle = models.CharField(max_length=60)

    def __str__(self):
        return f"Spécialité: {self.libelle} - {self.code}"

class AffecterSpecialite(models.Model):
    medecin = models.ForeignKey('tomegah_medecin.Medecin', on_delete=models.CASCADE)
    specialite = models.ForeignKey(Specialite, on_delete=models.CASCADE)
    date_affectation = models.DateField(auto_now_add=True)

    class Meta:
        unique_together = ("medecin", "specialite")

    def __str__(self):
        return f"{self.medecin} - {self.specialite}"

