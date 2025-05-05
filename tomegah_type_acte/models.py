from django.db import models

# Create your models here.
class TypeActe(models.Model):
    code = models.IntegerField(unique=True)
    libelle = models.CharField(max_length=100)
    def __str__(self):
        return f"Spécialité: {self.code} - {self.libelle}"