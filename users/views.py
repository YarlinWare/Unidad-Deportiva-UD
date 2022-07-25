from datetime import datetime
from decimal import Decimal
from unicodedata import decimal
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User

# Exception
from django.db.utils import IntegrityError
from django.db import connection

#Utils
from users.models import Persona, Rol

from .serializers import PersonaSerializer
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
            #return redirect('admin:index')
            return redirect('home:feed')
        else:
            return render(request, 'users/login.html', { 'error': 'Usuario o contraseña invalido.'})
    # Si el usuario ya está autenticado
    if request.method == 'GET':
        if request.user.is_authenticated:
            return redirect('home:feed')

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

        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        email = request.POST['email']
        id = len(User.objects.all()) +1
        is_staff=False
        is_active=True
        date_joined='1998-12-25'

        with connection.cursor() as cursor:
            cursor.execute(
                "INSERT INTO AUTH_USER (username, password, is_superuser,last_name,first_name,email, id,is_staff,is_active,date_joined) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);",
                [username,passwd, False,last_name, first_name,email,id,is_staff,is_active,date_joined]
            )
            row = cursor.fetchone()

        #user = User.objects.create_user(username=username, password=passwd)
        #user = User.objects.raw("INSERT INTO AUTH_USER (username, password) VALUES ({username},{password});".format(username=username, password=passwd))
        #try:
        #    user = User.objects.create_user(username=username, password=passwd)
        #except IntegrityError:
            # return render(request, 'users/signup_view.html', {'error': 'El nombre de usuario ya está en uso'})

        """ user.first_name = request.POST['first_name']
        user.last_name = request.POST['last_name']
        user.email = request.POST['email']
        user.id = len(User.objects.all()) +1
        user.save()

        persona = Persona(user=user)
        persona.cod_persona = request.POST['cod_persona']
        persona.id_tipo_persona_fk = request.POST['tipo_persona']
        persona.save() """
        return redirect('users:signup_employee')

    return render(request, 'users/signup_view.html')


def signup_employee(request):
    roles = Rol.objects.all()
    usuarios = User.objects.all()
    if request.method == 'POST':
        user = request.POST['user']
        cod_empleado = request.POST['cod_empleado']
        rol = request.POST['rol']
        with connection.cursor() as cursor:
            cursor.execute(
                "INSERT INTO USERS_EMPLEADO (cod_empleado,rol_id, user_id) VALUES (%s,%s,%s)",
                [cod_empleado,rol,int(user)]
            )
            row = cursor.fetchone()
        return redirect('admin:index')
    return render(request, 'employee/signup_employee.html', {'roles': roles,'usuarios':usuarios})

class PersonasViewSet(viewsets.ModelViewSet):
    queryset = Persona.objects.all()
    serializer_class = PersonaSerializer