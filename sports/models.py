from tkinter import CASCADE
from django.db import models
from datetime import datetime
from programming.models import Espacio, Programacion

class TipoElemento(models.Model):
    id_tipo_elemento = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    desc_tipo_elemento = models.CharField(max_length=40, default='', null=False)
    def __str__(self):
        return self.desc_tipo_elemento
    def __unicode__(self):
        return self.desc_tipo_elemento

class Deporte(models.Model):
    id_deporte = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    programacion = models.ManyToManyField(Programacion, default='')
    tipo_elemento = models.ManyToManyField(TipoElemento, default='')
    nom_deporte = models.CharField(max_length=20, default='', null=False, verbose_name='Nombre deporte')
    def __str__(self):
        return self.nom_deporte

class Estado(models.Model):
    id_estado = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    desc_estado = models.CharField(max_length=20, default='', null=False)
    def __str__(self):
        return self.desc_estado

class Marca(models.Model):
    id_marca = models.CharField(max_length=2, default='01',primary_key=True, null=False, unique=True)
    nom_marca = models.CharField(max_length=20, default='', null=False, verbose_name='Nombre marca')
    def __str__(self):
        return self.nom_marca

class ElementoDeportivo(models.Model):
    consec_elemento = models.AutoField(max_length=5, primary_key=True, null=False, unique=True)
    fecha_registro =models.DateField(default=datetime.today, null=False)
    #
    tipo_elemento = models.ForeignKey(TipoElemento, on_delete=models.CASCADE, default='')
    estado = models.ForeignKey(Estado, on_delete=models.CASCADE, default='')
    marca = models.ForeignKey(Marca, on_delete=models.CASCADE, default='')
    espacio = models.ForeignKey(Espacio, on_delete=models.CASCADE, default='', blank=False, null=True)
    def __str__(self):
        return self.consec_elemento