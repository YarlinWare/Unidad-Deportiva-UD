from rest_framework import serializers
from .models import Persona, TipoPersona, User

class PersonaSerializer(serializers.ModelSerializer):

    class Meta:
        model = Persona
        fields = '__all__'

class TipoPersonaSerializer(serializers.ModelSerializer):

    class Meta:
        model = TipoPersona
        fields = '__all__'