from django.db import models
from datetime import datetime

class TipoElemento(models.Model):
    id_tipo_elemento = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    desc_tipo_elemento = models.CharField(max_length=40, default='', null=False, verbose_name='Tipo elemento')
    def __str__(self):
        return self.desc_tipo_elemento
    def __unicode__(self):
        return self.desc_tipo_elemento

class Deporte(models.Model):
    id_deporte = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    espacio = models.ManyToManyField('programming.Espacio', default='01')
    tipo_elemento = models.ManyToManyField('sports.TipoElemento', default='01')
    nom_deporte = models.CharField(max_length=20, default='', null=False, verbose_name='Nombre deporte')
    def __str__(self):
        return self.nom_deporte
    def get_espacio(self):
        return "\n".join([e.nom_espacio for e in self.espacio.all()])
    def get_tipo_elemento(self):
        return "\n".join([e.desc_tipo_elemento for e in self.tipo_elemento.all()])

class Estado(models.Model):
    id_estado = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    desc_estado = models.CharField(max_length=20, default='', null=False, verbose_name='Estado')
    def __str__(self):
        return self.desc_estado

class Marca(models.Model):
    id_marca = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    nom_marca = models.CharField(max_length=20, default='', null=False, verbose_name='Nombre marca')
    def __str__(self):
        return self.nom_marca

class ElementoDeportivo(models.Model):
    consec_elemento = models.AutoField(primary_key=True, null=False, unique=True)
    fecha_registro =models.DateField(default=datetime.today, null=False)
    #
    tipo_elemento = models.ForeignKey('sports.TipoElemento', on_delete=models.CASCADE, default='01')
    estado = models.ForeignKey('sports.Estado', on_delete=models.CASCADE, default='01')
    marca = models.ForeignKey('sports.Marca', on_delete=models.CASCADE, default='01')
    espacio = models.ForeignKey('programming.Espacio', on_delete=models.CASCADE, default='01', blank=False, null=True)
    def __str__(self):
        return '{}'.format(self.tipo_elemento)