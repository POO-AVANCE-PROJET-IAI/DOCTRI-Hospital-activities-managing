import uuid
from django.db import models

class Medicament(models.Model):

    class Forme(models.TextChoices):
        COMPRIME = "Comprimé", "Comprimé"
        SIROP = "Sirop", "Sirop"
        INJECTION = "Injection", "Injection"
        POMMADE = "Pommade", "Pommade"
        GELULE = "Gélule", "Gélule"
        SPRAY = "Spray", "Spray"

    class VoieAdministration(models.TextChoices):
        ORALE = "Orale", "Orale"
        CUTANEE = "Cutanée", "Cutanée"
        INTRAVEINEUSE = "Intraveineuse", "Intraveineuse"
        INTRAMUSCULAIRE = "Intramusculaire", "Intramusculaire"
        NASALE = "Nasale", "Nasale"
        OCULAIRE = "Oculaire", "Oculaire"

    code_medicament = models.CharField(max_length=20, unique=True)
    libelle_medicament = models.CharField(max_length=100)
    forme = models.CharField(
        max_length=20,
        choices=Forme.choices,
        default=Forme.COMPRIME
    )
    dosage = models.CharField(max_length=20, blank=True, null=True)  
    voie_administration = models.CharField(
        max_length=30,
        choices=VoieAdministration.choices,
        default=VoieAdministration.ORALE
    )

    def save(self, *args, **kwargs):
        if not self.code_medicament:
            self.code_medicament = str(uuid.uuid4())[:20]
        super().save(*args, **kwargs)

    def __str__(self):
        return f"{self.libelle_medicament} ({self.dosage})"
