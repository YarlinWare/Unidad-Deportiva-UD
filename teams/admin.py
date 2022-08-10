from django.contrib import admin
from .models import AsisMiembroEquipo, Equipo, MiembroEquipo

class EquipoAdmin(admin.ModelAdmin):
	list_display = ('deporte','empleado')

class MiembroEquipoAdmin(admin.ModelAdmin):
	list_display = ('equipo','estudiante')

class AsisMiembroEquipoAdmin(admin.ModelAdmin):
	list_display = ('programacion','miembro_equipo')

# Register your models here.
admin.site.register(AsisMiembroEquipo,AsisMiembroEquipoAdmin)
admin.site.register(Equipo,EquipoAdmin)
admin.site.register(MiembroEquipo,MiembroEquipoAdmin)