import uuid
from django.db import models

# Create your models here.
from django.db import models

from tomegah_consultation.models import Consultation
from tomegah_medecin.models import Medecin

# Create your models here.
class Ordonnance(models.Model):
    code_ordonnance = models.CharField(max_length=20, unique=True)
    date_ordonnance = models.DateField()
    consultation = models.ForeignKey(Consultation, on_delete=models.CASCADE)
    medecin = models.ForeignKey(Medecin, on_delete=models.SET_NULL, null=True)
    def save(self, *args, **kwargs):
        if not self.code_ordonnance:
            self.code_ordonnance = str(uuid.uuid4())[:20]
        super().save(*args, **kwargs)