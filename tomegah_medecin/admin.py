from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import Medecin
from tomegah_specialite.models import AffecterSpecialite

class AffecterSpecialiteInline(admin.TabularInline):
    model = AffecterSpecialite
    extra = 1
    autocomplete_fields = ['specialite']

@admin.register(Medecin)
class MedecinAdmin(admin.ModelAdmin):
    list_display = ('nom', 'prenom', 'titre_medecin')
    search_fields = ('nom', 'prenom', 'titre_medecin')
    inlines = [AffecterSpecialiteInline]
