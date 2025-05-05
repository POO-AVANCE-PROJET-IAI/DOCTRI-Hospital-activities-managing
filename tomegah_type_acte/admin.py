from django.contrib import admin
from .models import TypeActe

@admin.register(TypeActe)
class TypeActeAdmin(admin.ModelAdmin):
    list_display = ('code', 'libelle')
    search_fields = ('code', 'libelle')
