from django.urls import path
from . import views


urlpatterns = [
    path('',views.home,name="patients.index"),
    # path('patients/<int:patient_id>/',views.patient_detail, name='patient.detail'),
    # path('patients/add/', views.patient_create, name='patients.create'),
]
