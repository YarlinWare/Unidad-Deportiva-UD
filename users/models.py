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
    # To do - Foreing Key
    id_tipo_documento = models.ForeignKey(TipoDocumento, default='no registra', on_delete=models.CASCADE, null=False, blank=False)
    numero_documento = models.CharField(max_length=11, primary_key=True, null=False, blank=False, default='00000000000')
    correo = models.EmailField(max_length=40, default='example@example.com', null=False)
    picture = models.ImageField(
        upload_to="users/picture",
        blank=True,
        null=True
    )
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    def __str__(self):
        """Return username."""
        return self.user.username

# Estudiante
class Estudiante(models.Model):
    cod_estudiante = models.CharField(max_length=11, primary_key=True, null=False, unique=True)
    #identificacion = models.OneToOneField(Persona, on_delete=models.CASCADE,default='00000000000')
    nombre = models.CharField(max_length=30, default='no registra', null=False)
    apellido = models.CharField(max_length=30, default='no registra', null=False)
    fecha_inscripcion = models.DateField(default=datetime.today, null=False)
    fecha_nacimiento = models.DateField(default=datetime.today,null=False)
    correo_institucional = models.EmailField(max_length=40, default='example@correo.udistrital.edu.co', null=False)
    def __str__(self):
        """Return describe type person."""
        return '{} {}'.format(self.apellido, self.nombre)

class Rol(models.Model):
    rol = models.CharField(max_length=4, null=False, blank=False, primary_key=True)
    descripcion = models.CharField(max_length=50, null=False)
    def __str__(self):
        """Return describe type person."""
        return self.descripcion

# Create your models here.

class Empleado(models.Model):
    ''' Profile model
        proxy model that extends the base data with other information
    '''
    user = models.OneToOneField(User,on_delete=models.CASCADE, default='0')
    cod_empleado = models.CharField(max_length=11, primary_key=True, null=False, unique=True)
    rol = models.OneToOneField(Rol,on_delete=models.CASCADE)
    """ created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True) """

    def __str__(self):
        """Return username."""
        return self.user.username
