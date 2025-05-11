from django.urls import path
from . import views


urlpatterns = [
    path('',views.home,name="consultations.index"),
    path('/create/<int:patient_id>',views.ConsultationCreateView.as_view(), name='consultation.create'),
    path('/<int:consultation_id>/add/acte/<int:patient_id>',views.ConsultationAddActeView.as_view(), name='consultation.add.acte'),
    path('/<int:consultation_id>/',views.consultation_detail, name='consultation.detail'),
    path('/<int:consultation_id>/delete',views.consultation_delete, name='consultation.delete'),
    path('/add/', views.ConsultationCreateView.as_view(), name='consultation.create'),
]
