from django.db import models
from authentication.models import Utilisateur
from tomegah_acte.models import Acte
from tomegah_medecin.models import Medecin
from tomegah_patient.models import Patient
import uuid

# Create your models here.
# Create your models here.
class Consultation(models.Model):
    codeconsultation = models.CharField(max_length=10, unique=True)
    dateconsultation = models.DateField()
    datefinvaliditeconsultation = models.DateField()
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    medecin = models.ForeignKey(Medecin, on_delete=models.SET_NULL, null=True)
    utilisateur = models.ForeignKey(Utilisateur, on_delete=models.SET_NULL,null=True)
    acte = models.ForeignKey(Acte, on_delete=models.SET_NULL, null=True)
    temperaturePatient = models.DecimalField(max_digits=5, decimal_places=2, default=None, null=True)
    agePatient = models.IntegerField(default=None, null=True)
    def save(self, *args, **kwargs):
        if not self.codeconsultation:
            self.codeconsultation = str(uuid.uuid4())[:20]
        super().save(*args, **kwargs)