from django.urls import path
from . import views
from django.contrib.auth.views import (
    LoginView,
    LogoutView,
    PasswordChangeView,
    PasswordChangeDoneView,
)
from authentication.forms import CustomLoginForm

urlpatterns = [
    path(
        "",
        LoginView.as_view(
            template_name="authentication/login.html",
            authentication_form=CustomLoginForm,
            redirect_authenticated_user=True,
        ),
        name="login",
    ),
    path("signup/", views.signup_page,  name="signup"),
    path("logout/", LogoutView.as_view(), name="logout"),
    
    # path(
    #     "change-password/",
    #     PasswordChangeView.as_view(
    #         template_name="authentication/change_password_form.html",
    #     ),
    #     name="password_change",
    # ),
    # path(
    #     "change-password-done/",
    #     PasswordChangeDoneView.as_view(
    #         template_name="authentication/password_change_done.html"
    #     ),
    #     name="password_change_done",
    # ),

    
]
