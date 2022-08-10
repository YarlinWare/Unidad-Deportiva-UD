from django.contrib import admin
from .models import Deporte,ElementoDeportivo,Estado,Marca,TipoElemento

class DeporteAdmin(admin.ModelAdmin):
    #fields = ['espacio', 'tipo_elemento']
    list_display = ('nom_deporte','get_espacio','get_tipo_elemento')
    """ def get_products(self, obj):
        return "\n".join([p.espacio for p in obj.product.all()]) """
    def get_espacio(self, obj):
        return "\n".join([e.nom_espacio for e in obj.espacio.all()])
    def get_tipo_elemento(self, obj):
        return "\n".join([e.desc_tipo_elemento for e in obj.tipo_elemento.all()])

class ElementoDeportivoAdmin(admin.ModelAdmin):
    #fields = ['espacio', 'tipo_elemento']
    list_display = ('tipo_elemento','estado','marca','espacio')

# Register your models here.
admin.site.register(Deporte,DeporteAdmin)
admin.site.register(ElementoDeportivo,ElementoDeportivoAdmin)
admin.site.register(Estado)
admin.site.register(Marca)
admin.site.register(TipoElemento)