from django.urls import path
from . import views


urlpatterns = [
    path('', views.home, name="facture.index"),
    path('/<int:consultation_id>',views.creer_facture,name="facture.create"),
    path('/payer/<int:facture_id>', views.payer_facture, name='facture.payer'),
    path('factures/imprimer/<int:facture_id>', views.imprimer_facture, name='facture.imprimer'),


]
