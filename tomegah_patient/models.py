from django.db import models

from tomegah_personne.models import Personne


class Patient(Personne):
    dateenreg = models.DateField(auto_now_add=True)
    def __str__(self):
        return f"Patient: {self.nom} {self.prenom} - {self.code} - {self.civilite}"