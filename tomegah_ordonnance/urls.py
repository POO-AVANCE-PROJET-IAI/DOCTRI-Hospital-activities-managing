from django.urls import path
from . import views


urlpatterns = [
    path('', views.home, name="ordonnance.index"),
    path('/imprimer/<int:pk>', views.imprimer_ordonnance, name='ordonnance.imprimer'),
    path('/<int:pk>/pdf/', views.telecharger_ordonnance_pdf, name='telecharger_ordonnance_pdf'),

]
