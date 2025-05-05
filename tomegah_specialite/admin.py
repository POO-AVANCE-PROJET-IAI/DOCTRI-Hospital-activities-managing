from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import Specialite, AffecterSpecialite

@admin.register(Specialite)
class SpecialiteAdmin(admin.ModelAdmin):
    list_display = ('code', 'libelle')
    search_fields = ('code', 'libelle')

@admin.register(AffecterSpecialite)
class AffecterSpecialiteAdmin(admin.ModelAdmin):
    list_display = ('medecin', 'specialite', 'date_affectation')
    search_fields = ('medecin__nom', 'specialite__libelle')
    autocomplete_fields = ['medecin', 'specialite']
