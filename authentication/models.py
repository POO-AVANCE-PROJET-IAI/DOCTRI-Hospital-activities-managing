from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.




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

class Utilisateur(AbstractUser):
    pass


class Specialite(models.Model):
    code = models.CharField(max_length=10, unique=True)
    libelle = models.CharField(max_length=60)
    
    def __str__(self):
        return f"Spécialité: {self.nom} - {self.code}"


class Medecin(Personne):
    titre_medecin = models.CharField(max_length=50)
    specialites = models.ManyToManyField(Specialite, through='AffecterSpecialite', blank=True)


class Patient(Personne):
    dateenreg = models.DateField(auto_now_add=True)
    def __str__(self):
        return f"Patient: {self.nom} {self.prenom} - {self.code} - {self.civilite}"

class AffecterSpecialite(models.Model):
    medecin = models.ForeignKey(Medecin, on_delete=models.CASCADE)
    specialite = models.ForeignKey(Specialite, on_delete=models.CASCADE)
    dateaffectation = models.DateField()
    actif = models.BooleanField(default=True)


class TypeActe(models.Model):
    code = models.IntegerField(max_length=10,unique=True)
    libelle = models.CharField(max_length=100)
    
class Acte(models.Model):
    code_acte = models.CharField(max_length=10, unique=True)
    libelle_acte = models.CharField(max_length=100)
    montant_acte = models.IntegerField()
    type_acte = models.ForeignKey(TypeActe, on_delete=models.CASCADE)
    Specialite = models.ForeignKey(Specialite, on_delete=models.CASCADE)

class Consultation(models.Model):
    codeconsultation = models.CharField(max_length=10, unique=True)
    dateconsultation = models.DateField()
    datefinvaliditeconsultation = models.DateField()
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    medecin = models.ForeignKey(Medecin, on_delete=models.SET_NULL, null=True)
    utilisateur = models.ForeignKey(Utilisateur, on_delete=models.SET_NULL,null=True)
    acte = models.ForeignKey(Acte, on_delete=models.CASCADE)

class Facture(models.Model):
    code_facture = models.CharField(max_length=20, unique=True)
    typefacture = models.CharField(max_length=100)
    dateenreg_facture = models.DateField()
    datepaiement_facture = models.DateField(null=True, blank=True)
    montant_facture = models.IntegerField()
    montant_payefacture = models.IntegerField()
    medecin = models.ForeignKey(Medecin, on_delete=models.SET_NULL, null=True)    
    consultation = models.ForeignKey(Consultation, on_delete=models.SET_NULL, null=True)
    
    
class FactureDetail(models.Model):
    code_detailfacture = models.CharField(max_length=20, unique=True)
    facture = models.ForeignKey(Facture, on_delete=models.CASCADE, related_name="details")
    acte = models.ForeignKey(Acte, on_delete=models.CASCADE)
    montant_facturedetail = models.IntegerField()
    

class Medicament(models.Model):
    code_medicament = models.CharField(max_length=20, unique=True)
    libelle_medicament = models.CharField(max_length=100)
    
    
class Ordonnance(models.Model):
    code_ordonnance = models.CharField(max_length=20, unique=True)
    date_ordonnance = models.DateField()
    consultation = models.ForeignKey(Consultation, on_delete=models.CASCADE)


class OrdonnanceDetail(models.Model):
    code_ordonnancedetail = models.CharField(max_length=20, unique=True)
    ordonnance = models.ForeignKey(Ordonnance, on_delete=models.CASCADE, related_name="details")
    medicament = models.ForeignKey(Medicament, on_delete=models.SET_NULL, null=True)
    posologie_medicament = models.CharField(max_length=1000)



