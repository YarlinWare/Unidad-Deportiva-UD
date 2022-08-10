from django.db import models

from sports.models import Deporte, ElementoDeportivo
from users.models import AsisResponsable, Empleado, Estudiante

class TipoEspacio(models.Model):
    id_tipo_espacio = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    desc_tipo_espacio = models.CharField(max_length=30, default='', null=False)

    def __str__(self):
        return self.desc_tipo_espacio

class Espacio(models.Model):
    cod_espacio = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    nom_espacio = models.CharField(max_length=30, default='', null=False)
    #
    tipo_espacio = models.ForeignKey(TipoEspacio, on_delete=models.CASCADE, verbose_name='Tipo de espacio')
    def __str__(self):
        return self.nom_espacio

class Periodo(models.Model):
    id_periodo = models.CharField(max_length=5, default='00001',primary_key=True, null=False, unique=True)

    def __str__(self):
        return self.id_periodo

class Actividad(models.Model):
    id_actividad = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    desc_actividad = models.CharField(max_length=30, default='', null=False)

    def __str__(self):
        return self.desc_actividad

class Hora(models.Model):
    id_hora = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)

    def __str__(self):
        return self.id_hora

class Dia(models.Model):
    id_dia = models.CharField(max_length=1, default='1',primary_key=True, null=False, unique=True)
    nom_dia = models.CharField(max_length=10, default='', null=False)

    def __str__(self):
        return self.nom_dia

class Prestamo(models.Model):
    consec_prestamo = models.AutoField(max_length=4, primary_key=True, null=False, unique=True)
    elemento_deportivo = models.ForeignKey(ElementoDeportivo, on_delete=models.CASCADE)
    asis_responsable = models.ForeignKey(AsisResponsable, on_delete=models.CASCADE, verbose_name='Asistente responsable')

    def __str__(self):
        return self.consec_prestamo


# Create your models here.
class Programacion(models.Model):
    consec_program = models.AutoField(max_length=4, primary_key=True, null=False, unique=True)
    cupo = models.IntegerField(max_length=3, default='001', null=False)
    no_inscritos = models.IntegerField(max_length=3, default='001', null=True)
    #
    periodo = models.ForeignKey(Periodo, on_delete=models.CASCADE)
    actividad = models.ForeignKey(Actividad, on_delete=models.CASCADE)
    hora_inicio = models.ForeignKey(Hora, on_delete=models.CASCADE)
    hora_final = models.ForeignKey(Hora, on_delete=models.CASCADE)
    dia = models.ForeignKey(Dia, on_delete=models.CASCADE)
    deporte = models.ForeignKey(Deporte, on_delete=models.CASCADE)
    espacio = models.ForeignKey(Espacio, on_delete=models.CASCADE, null=True, blank=False)

    def __str__(self):
        """Return username."""
        return self.cupo

class InscritoPractLibre(models.Model):
    consec_practica = models.AutoField(max_length=4, primary_key=True, null=False, unique=True)
    #
    programacion = models.ForeignKey(Programacion, on_delete=models.CASCADE, null=True)
    estudiante = models.ForeignKey(Estudiante, on_delete=models.CASCADE, null=True)
    empleado = models.ForeignKey(Empleado, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.consec_practica
    class Meta:
        unique_together = (('consec_practica', 'programacion'),)
