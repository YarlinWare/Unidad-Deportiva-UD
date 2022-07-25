# Django
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

# Models
from django.contrib.auth.models import User
from users.models import Persona, Estudiante, Rol, TipoDocumento, Empleado

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
admin.site.register(Estudiante)
admin.site.register(Rol)
admin.site.register(TipoDocumento)
admin.site.register(Empleado)