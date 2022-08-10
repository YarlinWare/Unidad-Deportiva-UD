from django.contrib import admin
from .models import Deporte,ElementoDeportivo,Estado,Marca,TipoElemento

# Register your models here.
admin.site.register(Deporte)
admin.site.register(ElementoDeportivo)
admin.site.register(Estado)
admin.site.register(Marca)
admin.site.register(TipoElemento)