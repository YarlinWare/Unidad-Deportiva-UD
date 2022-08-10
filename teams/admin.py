from django.contrib import admin
from .models import AsisMiembroEquipo, Equipo, MiembroEquipo

# Register your models here.
admin.site.register(AsisMiembroEquipo)
admin.site.register(Equipo)
admin.site.register(MiembroEquipo)