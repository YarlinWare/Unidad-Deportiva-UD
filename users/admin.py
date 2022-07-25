# Django
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

# Models
from django.contrib.auth.models import User
from users.models import Persona, TipoPersona


# Register your models here.
class ComisarioEventoAdmin(admin.ModelAdmin):
	list_display = ('consec_comisario', 'created', 'updated' )
	#list_display_links = ('cod_persona',)
	readonly_fields = ('created', 'updated')

class TareaAdmin(admin.ModelAdmin):
	readonly_fields = ('created', 'updated')

class TipoPersonaAdmin(admin.ModelAdmin):
	readonly_fields = ('created', 'updated')

class UserAdmin(admin.ModelAdmin):
	readonly_fields = ('created', 'updated')

class PersonaAdmin(admin.ModelAdmin):
	list_display = ('user', 'cod_persona','created', 'updated' )
	list_display_links = ('user', 'cod_persona',)
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
				('cod_persona', 'user', 'id_tipo_persona_fk'),
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
admin.site.register(TipoPersona, TipoPersonaAdmin)