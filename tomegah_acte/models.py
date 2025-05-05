from django.db import models

from tomegah_type_acte.models import TypeActe

class Acte(models.Model):
    code_acte = models.CharField(max_length=10, unique=True)
    libelle_acte = models.CharField(max_length=100)
    montant_acte = models.IntegerField()
    type_acte = models.ForeignKey(TypeActe, on_delete=models.CASCADE)
    Specialite = models.ForeignKey('tomegah_specialite.Specialite', on_delete=models.CASCADE)
