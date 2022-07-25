from django.db import models
from datetime import datetime
from django.contrib.auth.models import User

# Create your models here.
# Tipo Documento
class TipoDocumento(models.Model):
    id_tipo_documento = models.SmallIntegerField(primary_key=True, null=False, unique=True)
    abreviacion = models.CharField(max_length=5, null=False)
    desc_tipo = models.CharField(max_length=50, null=False)
    def __str__(self):
        """Return describe type person."""
        return self.desc_tipo

# Persona
class Persona(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    cod_persona = models.CharField(max_length=11, primary_key=True, null=False, unique=True)
    # To do - Foreing Key
    id_tipo_documento = models.ForeignKey(TipoDocumento, default='no registra', on_delete=models.CASCADE, null=False, blank=False)
    numero_documento = models.CharField(max_length=11, null=False, blank=False, default='00000000000')

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        """Return username."""
        return self.user.username

# Estudiante
class Estudiante(models.Model):
    cod_estudiante = models.CharField(max_length=11, primary_key=True, null=False, unique=True)
    nombre = models.CharField(max_length=30, default='no registra', null=False)
    apellido = models.CharField(max_length=30, default='no registra', null=False)
    fecha_inscripcion = models.DateField(default=datetime.today, null=False)
    fecha_nacimiento = models.DateField(default=datetime.today,null=False)
    correo = models.EmailField(max_length=40, default='example@example.com', null=False)
    def __str__(self):
        """Return describe type person."""
        return '{} {}'.format(self.apellido, self.nombre)

class Rol(models.Model):
    rol = models.DecimalField(max_digits=4, decimal_places=1, null=False, blank=False, primary_key=True)
    def __str__(self):
        """Return describe type person."""
        return self.rol