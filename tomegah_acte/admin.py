from django.contrib import admin
from .models import Acte

@admin.register(Acte)
class ActeAdmin(admin.ModelAdmin):
    list_display = ('code_acte', 'libelle_acte', 'montant_acte', 'type_acte', 'Specialite')
    search_fields = ('code_acte', 'libelle_acte')
    list_filter = ('type_acte', 'Specialite')
    autocomplete_fields = ['type_acte', 'Specialite']
