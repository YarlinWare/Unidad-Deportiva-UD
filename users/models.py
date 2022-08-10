from django.db import models
from datetime import datetime
from django.contrib.auth.models import User

# Create your models here.
# Tipo Documento
class TipoDocumento(models.Model):
    id_tipo_documento = models.SmallIntegerField(primary_key=True, null=False, unique=True)
    abreviacion = models.CharField(max_length=5, null=False)
    desc_tipo = models.CharField(max_length=50, null=False, verbose_name='Tipo')
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
class EstudianteUser(models.Model):
    cod_estudiante = models.CharField(max_length=11, primary_key=True, null=False, unique=True)
    identificacion = models.OneToOneField(Persona, on_delete=models.CASCADE,default='00000000000')
    nombre = models.CharField(max_length=30, default='no registra', null=False)
    apellido = models.CharField(max_length=30, default='no registra', null=False)
    fecha_inscripcion = models.DateField(default=datetime.today, null=False)
    fecha_nacimiento = models.DateField(default=datetime.today,null=False)
    correo_institucional = models.EmailField(max_length=40, default='example@correo.udistrital.edu.co', null=False)
    def __str__(self):
        """Return describe type person."""
        return '{} {}'.format(self.apellido, self.nombre)

# Estudiante
class Estudiante(models.Model):
    cod_estu = models.CharField(max_length=12, default='20221020001', primary_key=True, null=False, unique=True, verbose_name='Código')
    nom_estu = models.CharField(max_length=30, default='', null=False, verbose_name='Nombre')
    apell_estu = models.CharField(max_length=30, default='', null=False, verbose_name='Apellido')
    fecha_reg_estu = models.DateField(default=datetime.today, null=False, verbose_name='Fecha registro')
    fecha_nac_estu = models.DateField(default=datetime.today,null=False, verbose_name='Fecha nacimiento')
    correo_ud_estu = models.EmailField(max_length=40, default='example@correo.udistrital.edu.co', null=False, verbose_name='Correo')
    #
    espacio = models.ForeignKey('programming.Espacio', on_delete=models.CASCADE, verbose_name='Pertenece', default='01')

    def __str__(self):
        """Return describe type person."""
        return '{} {}'.format(self.apell_estu, self.nom_estu)

class Rol(models.Model):
    id_rol = models.CharField(max_length=1, default='0', null=False, blank=False, primary_key=True)
    desc_rol = models.CharField(max_length=15, default='', null=False, verbose_name='Descripción')
    def __str__(self):
        """Return describe rol."""
        return self.desc_rol

# Create your models here.
class Empleado(models.Model):
    ''' Profile model '''
    cod_empleado = models.CharField(max_length=4, default='0001',primary_key=True, null=False, unique=True, verbose_name='Código')
    nom_empleado = models.CharField(max_length=20, default='', null=False, verbose_name='Nombre')
    apell_empleado = models.CharField(max_length=20, default='', null=False, verbose_name='Apellido')
    fecha_registro =models.DateField(default=datetime.today, null=False, verbose_name='Registro')
    correo_ud = models.EmailField(max_length=30, default='example@udistrital.edu.co', null=False, verbose_name='Correo')

    def __str__(self):
        """Return username."""
        return '{} {}'.format(self.apell_empleado, self.nom_empleado)

# Create your models here.
class Cargo(models.Model):
    ''' Profile model '''
    id_cargo = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    desc_cargo = models.CharField(max_length=20, default='', null=False, verbose_name='Cargo')
    def __str__(self):
        """Return username."""
        return self.desc_cargo

# Create your models here.
class EmpleadoCargo(models.Model):
    ''' Profile model '''
    consec = models.AutoField(primary_key=True, null=False, unique=True)
    fecha_cargo =models.DateField(default=datetime.today, null=False, verbose_name='Fecha inicio cargo')
    fecha_fin_cargo =models.DateField(default=datetime.today, null=False, verbose_name='Fecha fin cargo')
    #
    cargo = models.ForeignKey('users.Cargo', on_delete=models.CASCADE, default='01')
    espacio = models.ForeignKey('programming.Espacio', on_delete=models.CASCADE, default='01')
    empleado = models.ForeignKey('users.Empleado', on_delete=models.CASCADE, default='0001')

    def __str__(self):
        """Return username."""
        return '{} {}'.format(self.consec, self.fecha_cargo)

# Create your models here.
class Responsable(models.Model):
    ''' Profile model '''
    consec_responsable = models.AutoField(primary_key=True, null=False, unique=True)
    fecha_inicio =models.DateField(default=datetime.today, null=False)
    fecha_fin =models.DateField(default=datetime.today, null=False)
    #
    programacion = models.ForeignKey('programming.Programacion', on_delete=models.CASCADE, null=True, default='1', verbose_name='Programación')
    rol = models.ForeignKey('users.Rol', on_delete=models.CASCADE, null=True, default='0')
    empleado = models.ForeignKey('users.Empleado', on_delete=models.CASCADE, null=False, default='0001')
    estudiante = models.ForeignKey('users.Estudiante', on_delete=models.CASCADE, null=True, default='20221020001')
    def __str__(self):
        """Return username."""
        return '{} - {}'.format(self.empleado, self.rol)
    """ class Meta:
        unique_together = (('consec_responsable', 'programacion'),) """

# Create your models here.
class AsisResponsable(models.Model):
    ''' Profile model '''
    consec_asis_responsable = models.AutoField(primary_key=True, null=False, unique=True)
    fecha_asis_responsable =models.DateField(default=datetime.today, null=False, verbose_name='Fecha asistente responsable')
    hora_asis_responsable =models.DateField(default=datetime.ctime, null=False, verbose_name='Hora asistente responsable')
    #
    responsable = models.ForeignKey('users.Responsable', on_delete=models.CASCADE, null=True, default='1')
    def __str__(self):
        """Return username."""
        return '{}: {} a las {}'.format(self.responsable, self.fecha_asis_responsable, self.hora_asis_responsable)
    class Meta:
        unique_together = (('consec_asis_responsable', 'responsable'),)









