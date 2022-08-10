from django.contrib import admin
from .models import Actividad, Dia, Espacio, Hora, inscritoPractLibre, Periodo, Prestamo, Programacion, TipoEspacio

# Register your models here.
admin.site.register(Actividad)
admin.site.register(Dia)
admin.site.register(Espacio)
admin.site.register(Hora)
admin.site.register(inscritoPractLibre)
admin.site.register(Periodo)
admin.site.register(Prestamo)
admin.site.register(Programacion)
admin.site.register(TipoEspacio)
