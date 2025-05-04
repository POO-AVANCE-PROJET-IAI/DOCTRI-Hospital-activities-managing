from django import forms
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth import authenticate, get_user_model

class CustomLoginForm(AuthenticationForm):
    username = forms.EmailField(
        label="Adresse mail",
        widget=forms.EmailInput(attrs={
            'id': 'email',
            'name': 'email',
            'autocomplete': 'email',
            'required': True,
            'class': 'block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-indigo-600 sm:text-sm/6',
            'placeholder': 'Adresse mail'
        })
    )
    password = forms.CharField(
        label="Mot de passe",
        widget=forms.PasswordInput(attrs={
            'id': 'password',
            'name': 'password',
            'autocomplete': 'current-password',
            'required': True,
            'class': 'block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-indigo-600 sm:text-sm/6',
            'placeholder': 'Mot de passe'
        })
    )

    error_messages = {
        'invalid_login': "Identifiants incorrects. Veuillez réessayer.",
        'inactive': "Ce compte est désactivé.",
    }
    
    def clean(self):
        email = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')

        if email and password:
            self.user_cache = authenticate(self.request, username=email, password=password)
            if self.user_cache is None:
                raise forms.ValidationError(
                    self.error_messages['invalid_login'],
                    code='invalid_login',
                )
            elif not self.user_cache.is_active:
                raise forms.ValidationError(
                    self.error_messages['inactive'],
                    code='inactive',
                )

        return self.cleaned_data
    

class SignupForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        model = get_user_model()
        fields = ['username', 'email', 'first_name','last_name']