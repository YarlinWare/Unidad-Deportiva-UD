from django.db import models
from datetime import datetime
from programming.models import Programacion

from sports.models import Deporte
from users.models import Empleado, Estudiante

class Equipo(models.Model):
    ''' Equipo model '''
    consec_equipo = models.AutoField(max_length=3, primary_key=True, null=False, unique=True)
    fecha_resol =models.DateField(default=datetime.today, null=False)
    #
    deporte = models.ForeignKey(Deporte, on_delete=models.CASCADE, default='')
    empleado = models.ForeignKey(Empleado, on_delete=models.CASCADE, default='', verbose_name='Entrenador')
    def __str__(self):
        return self.consec_equipo

class MiembroEquipo(models.Model):
    itemMiembro = models.AutoField(max_length=3, primary_key=True, null=False, unique=True)
    #
    equipo = models.ForeignKey(Equipo, on_delete=models.CASCADE, default='')
    estudiante = models.ForeignKey(Estudiante, on_delete=models.CASCADE, verbose_name='Pertenece')
    def __str__(self):
        return self.itemMiembro
    class Meta:
        unique_together = (('itemMiembro', 'equipo'),)

class AsisMiembroEquipo(models.Model):
    con_miembro_equipo = models.AutoField(max_length=4, primary_key=True, null=False, unique=True)
    #
    programacion = models.ForeignKey(Programacion, on_delete=models.CASCADE, default='')
    miembro_equipo = models.ForeignKey(Programacion, on_delete=models.CASCADE, default='', verbose_name='Miembro equipo')
    def __str__(self):
        return self.con_miembro_equipo
    class Meta:
        unique_together = (('con_miembro_equipo', 'programacion'),)


#