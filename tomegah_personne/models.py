# personnes/models.py
from django.db import models

class Personne(models.Model):
    class Civilite(models.TextChoices):
        M = 'M', 'Monsieur'
        MM = 'MM', 'Madame'
        ML = 'ML', 'Mademoiselle'
    code = models.CharField(max_length=10, unique=True)
    nom = models.CharField(max_length=50)
    prenom = models.CharField(max_length=100)
    datenaissance = models.DateField()
    civilite = models.fields.CharField(choices=Civilite.choices, max_length=3)

    def __str__(self):
        return f"{self.nom} {self.prenom}"
