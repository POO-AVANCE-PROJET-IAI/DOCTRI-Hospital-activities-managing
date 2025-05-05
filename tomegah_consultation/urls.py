from django.urls import path
from . import views


urlpatterns = [
    path('',views.home,name="consultations.index"),
    path('/<int:consultation_id>/',views.consultation_detail, name='consultation.detail'),
    path('/<int:consultation_id>/delete',views.consultation_delete, name='consultation.delete'),
    path('/add/', views.consultation_create, name='consultation.create'),
        path('/<int:consultation_id>/change', views.consultation_create, name='consultation.create'),

]
