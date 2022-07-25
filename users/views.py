from django.contrib.auth import authenticate, login, logout
from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User

# Exception
from django.db.utils import IntegrityError

#Utils
from users.models import Persona, TipoPersona

from .serializers import PersonaSerializer,TipoPersonaSerializer
from rest_framework import viewsets

# Create your views here.

def home(request):
    return redirect('users:login')

def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user:
            login(request, user)
            return redirect('admin:index')
        else:
            return render(request, 'users/login.html', { 'error': 'Usuario o contraseña invalido.'})
    # Si el usuario ya está autenticado
    if request.method == 'GET':
        if request.user.is_authenticated:
            return redirect('posts:feed')

    return render(request, 'users/login.html')

@login_required
def logout_view(request):
    logout(request)
    return redirect('users:login')

def signup_view(request):
    if request.method == 'POST':

        username = request.POST['username']
        passwd = request.POST['passwd']
        passwd_confirmation = request.POST['passwd_confirmation']

        if passwd != passwd_confirmation:
            return render(request, 'users/signup_view.html', {'error': 'La confirmación de la contraseña no coincide'})

        user = User.objects.create_user(username=username, password=passwd)
        #try:
        #    user = User.objects.create_user(username=username, password=passwd)
        #except IntegrityError:
            # return render(request, 'users/signup_view.html', {'error': 'El nombre de usuario ya está en uso'})

        user.first_name = request.POST['first_name']
        user.last_name = request.POST['last_name']
        user.email = request.POST['email']
        user.id = len(User.objects.all()) +1
        user.save()

        persona = Persona(user=user)
        persona.cod_persona = request.POST['cod_persona']
        persona.id_tipo_persona_fk = request.POST['tipo_persona']
        persona.save()
        return redirect('users:login')

    return render(request, 'users/signup_view.html')


class PersonasViewSet(viewsets.ModelViewSet):
    queryset = Persona.objects.all()
    serializer_class = PersonaSerializer

class TipoPersonasViewSet(viewsets.ModelViewSet):
    queryset = TipoPersona.objects.all()
    serializer_class = TipoPersonaSerializer