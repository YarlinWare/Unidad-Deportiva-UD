from django.contrib import admin
from .models import Actividad, Dia, Espacio, Hora, InscritoPractLibre, Periodo, Prestamo, Programacion, TipoEspacio

class HoraAdmin(admin.ModelAdmin):
    list_display = ('id_hora','hora')
    list_display_link = ('id_hora','hora')
    ordering = ('id_hora','hora')
    search_fields = ('id_hora','hora')

class EspacioAdmin(admin.ModelAdmin):
    list_display = ('cod_espacio','nom_espacio', 'tipo_espacio')
    list_display_link = ('cod_espacio','nom_espacio', 'tipo_espacio')
    ordering = ('cod_espacio','nom_espacio', 'tipo_espacio')
    search_fields = ('cod_espacio','nom_espacio', 'tipo_espacio')

class ProgramacionAdmin(admin.ModelAdmin):
    list_display = ('actividad','deporte_fk','cupo','no_inscritos','espacio', 'hora_inicio','dia')
    list_display_link = ('actividad','deporte_fk','cupo','no_inscritos','espacio', 'hora_inicio','dia')
    ordering = ('actividad','deporte_fk','cupo','no_inscritos','espacio', 'hora_inicio','dia')
    search_fields = ('actividad','deporte_fk','cupo','no_inscritos','espacio', 'hora_inicio','dia')

class InscritoPractLibreAdmin(admin.ModelAdmin):
    list_display = ('estudiante','programacion','empleado')

# Register your models here.
admin.site.register(Actividad)
admin.site.register(Dia)
admin.site.register(Espacio,EspacioAdmin)
admin.site.register(Hora,HoraAdmin)
admin.site.register(InscritoPractLibre,InscritoPractLibreAdmin)
admin.site.register(Periodo)
admin.site.register(Prestamo)
admin.site.register(Programacion,ProgramacionAdmin)
admin.site.register(TipoEspacio)
