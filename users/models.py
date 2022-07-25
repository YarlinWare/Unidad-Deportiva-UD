from django.db import models
from django.contrib.auth.models import User

# Tipo persona
class TipoPersona(models.Model):

    id_tipo_persona = models.CharField(max_length=3, primary_key=True, null=False, unique=True)
    desc_tipo_persona = models.CharField(max_length=30, null=False)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    # To do - Foreing key

    def __str__(self):
        """Return describe type person."""
        return self.desc_tipo_persona

# Persona
class Persona(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    cod_persona = models.CharField(max_length=4, primary_key=True, null=False, unique=True)

    # To do - Foreing Key
    id_tipo_persona_fk = models.ForeignKey(TipoPersona, on_delete=models.CASCADE, null=False, blank=False)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        """Return username."""
        return self.user.username