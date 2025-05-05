from django.urls import path
from . import views


urlpatterns = [
    path('',views.home,name="patients.index"),
    path('/<int:patient_id>/',views.patient_detail, name='patient.detail'),
    path('/<int:patient_id>/delete',views.patient_delete, name='patient.delete'),

    # path('patients/add/', views.patient_create, name='patients.create'),
]
