import uuid
from django.db import models

# Create your models here.
class Medicament(models.Model):
    code_medicament = models.CharField(max_length=20, unique=True)
    libelle_medicament = models.CharField(max_length=100)
    def save(self, *args, **kwargs):
        if not self.code_medicament:
            self.code_medicament = str(uuid.uuid4())[:20]
        super().save(*args, **kwargs)
