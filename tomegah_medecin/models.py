from django.db import models

from tomegah_personne.models import Personne


# Create your models here.
class Medecin(Personne):
    titre_medecin = models.CharField(max_length=50)
    specialites = models.ManyToManyField('tomegah_specialite.Specialite', through='tomegah_specialite.AffecterSpecialite', blank=True)
    def __str__(self):
        return f"Dr. {self.nom} {self.prenom} "

    
