from django.db import models

from users.models import AsisResponsable, Empleado, Estudiante

class TipoEspacio(models.Model):
    id_tipo_espacio = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    desc_tipo_espacio = models.CharField(max_length=30, default='', null=False, verbose_name='Descripción')

    def __str__(self):
        return self.desc_tipo_espacio

class Espacio(models.Model):
    cod_espacio = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    nom_espacio = models.CharField(max_length=30, default='', null=False, verbose_name='Espacio')
    #
    tipo_espacio = models.ForeignKey('programming.TipoEspacio', on_delete=models.CASCADE, verbose_name='Tipo de espacio')
    def __str__(self):
        return self.nom_espacio

class Periodo(models.Model):
    id_periodo = models.CharField(max_length=5, default='00001',primary_key=True, null=False, unique=True)

    def __str__(self):
        return self.id_periodo

class Actividad(models.Model):
    id_actividad = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    desc_actividad = models.CharField(max_length=30, default='', null=False, verbose_name='Actividad')

    def __str__(self):
        return self.desc_actividad

class Hora(models.Model):
    id_hora = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    hora = models.TimeField(null=False, unique=True)

    def __str__(self):
        return '{}'.format(self.hora)

class Dia(models.Model):
    id_dia = models.CharField(max_length=1, default='1',primary_key=True, null=False, unique=True, verbose_name='N° Día')
    nom_dia = models.CharField(max_length=10, default='', null=False, verbose_name='Día')

    def __str__(self):
        return self.nom_dia

class Prestamo(models.Model):
    consec_prestamo = models.AutoField(primary_key=True, null=False, unique=True)
    elemento_deportivo = models.ForeignKey('sports.ElementoDeportivo', on_delete=models.CASCADE, default='1')
    asis_responsable = models.ForeignKey('users.AsisResponsable', on_delete=models.CASCADE, verbose_name='Asistente responsable', default='1')

    def __str__(self):
        return self.consec_prestamo

# Create your models here.
class Programacion(models.Model):
    consec_program = models.AutoField(primary_key=True, null=False, unique=True)
    cupo = models.IntegerField( default='001', null=False, verbose_name='Cupos')
    no_inscritos = models.IntegerField( default='001', null=True, verbose_name='N° Inscritos')
    #
    periodo = models.ForeignKey('programming.Periodo', on_delete=models.CASCADE, default='00001')
    actividad = models.ForeignKey('programming.Actividad', on_delete=models.CASCADE, default='01')
    hora_inicio = models.ForeignKey('programming.Hora', on_delete=models.CASCADE, verbose_name='Hora inicio', default='01')
    #hora_final = models.ForeignKey(Hora, on_delete=models.CASCADE, verbose_name='Hora fin')
    dia = models.ForeignKey('programming.Dia', on_delete=models.CASCADE, default='1')
    deporte_fk = models.ForeignKey('sports.Deporte', on_delete=models.CASCADE, default='01', verbose_name='Deporte')
    espacio = models.ForeignKey('programming.Espacio', on_delete=models.CASCADE, null=True, blank=False, default='01')

    def __str__(self):
        """Return username."""
        return '{} - {}'.format(self.actividad,self.deporte_fk)

class InscritoPractLibre(models.Model):
    consec_practica = models.AutoField(primary_key=True, null=False, unique=True)
    #
    programacion = models.ForeignKey('programming.Programacion', on_delete=models.CASCADE, null=True, default='1')
    estudiante = models.ForeignKey('users.Estudiante', on_delete=models.CASCADE, null=True, default='20221020001')
    empleado = models.ForeignKey('users.Empleado', on_delete=models.CASCADE, null=True, blank=True, default='0001')

    def __str__(self):
        return '{}'.format(self.estudiante)
    """ class Meta:
        unique_together = (('consec_practica', 'programacion'),) """
