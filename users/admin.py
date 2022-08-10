# Django
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

# Models
from django.contrib.auth.models import User
from users.models import Persona, Estudiante, Rol, TipoDocumento, Empleado, EmpleadoCargo, Cargo, Responsable, AsisResponsable

class UserAdmin(admin.ModelAdmin):
	readonly_fields = ('created', 'updated')

class PersonaAdmin(admin.ModelAdmin):
	list_display = ('user','created', 'updated' )
	list_display_links = ('user',)
	search_fields = ['user__email',
					'user__first_name',
					'user__last_name',
					'user__email',
					'user__username'
					]
	list_filter = [
					'created',
					'updated',
					'user__is_staff',
					'user__is_active'
				]
	fieldsets = (
		('Persona', {
			'fields':(
				('user'),
			)
		}),
		('Metadata', {
			'fields':(
				('created','updated'),
			)
		}),
	)
	readonly_fields = ('created', 'updated')

class EmpleadoCargoAdmin(admin.ModelAdmin):
	list_display = ('consec','cargo','espacio','empleado')

class EstudianteAdmin(admin.ModelAdmin):
	list_display = ('cod_estu','nom_estu','apell_estu','correo_ud_estu','espacio')

class TipoDocumentoAdmin(admin.ModelAdmin):
	list_display = ('abreviacion','desc_tipo')

# Persona in-line admin for users
class PersonaInline(admin.StackedInline):
	model = Persona
	can_delete = False
	verbose_name_plural = 'Personas'

# Add person admin to base user admin
class UserAdmin(BaseUserAdmin):
	inlines = (PersonaInline,)

admin.site.unregister(User)
admin.site.register(User, UserAdmin)
admin.site.register(Persona, PersonaAdmin)

# Register your models here.
admin.site.register(Estudiante,EstudianteAdmin)
admin.site.register(Rol)
admin.site.register(TipoDocumento,TipoDocumentoAdmin)
admin.site.register(Empleado)
admin.site.register(EmpleadoCargo,EmpleadoCargoAdmin)
admin.site.register(Cargo)
admin.site.register(Responsable)
admin.site.register(AsisResponsable)