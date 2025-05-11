from django.urls import path
from . import views


urlpatterns = [
    path('', views.home, name="ordonnance.index"),
    path('ordonnance/<int:consutation_id>/', views.creer_ordonnance, name="ordonnance.create"),
]
