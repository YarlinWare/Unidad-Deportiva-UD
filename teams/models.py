from django.db import models
from datetime import datetime

class Equipo(models.Model):
    ''' Equipo model '''
    consec_equipo = models.AutoField(primary_key=True, null=False, unique=True)
    fecha_resol =models.DateField(default=datetime.today, null=False, verbose_name='Fecha resolución')
    #
    deporte = models.ForeignKey('sports.Deporte', on_delete=models.CASCADE, default='01')
    empleado = models.ForeignKey('users.Empleado', on_delete=models.CASCADE, default='1', verbose_name='Entrenador')
    def __str__(self):
        return '{}'.format(self.deporte)

class MiembroEquipo(models.Model):
    itemMiembro = models.AutoField(primary_key=True, null=False, unique=True)
    #
    equipo = models.ForeignKey(Equipo, on_delete=models.CASCADE, default='1')
    estudiante = models.ForeignKey('users.Estudiante', on_delete=models.CASCADE, verbose_name='Pertenece', default='20221020001')
    def __str__(self):
        return '{}'.format(self.estudiante)
    """ class Meta:
        unique_together = (('itemMiembro', 'equipo'),) """

class AsisMiembroEquipo(models.Model):
    con_miembro_equipo = models.AutoField( primary_key=True, null=False, unique=True)
    #
    programacion = models.ForeignKey('programming.Programacion', on_delete=models.CASCADE, default='1')
    miembro_equipo = models.ForeignKey(MiembroEquipo, on_delete=models.CASCADE, default='1', verbose_name='Miembro equipo')
    def __str__(self):
        return '{}'.format(self.miembro_equipo)
    """ class Meta:
        unique_together = (('con_miembro_equipo', 'programacion'),) """


#