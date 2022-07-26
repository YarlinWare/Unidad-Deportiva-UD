# Generated by Django 4.0.6 on 2022-08-10 15:48

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('programming', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Cargo',
            fields=[
                ('id_cargo', models.CharField(default='01', max_length=2, primary_key=True, serialize=False, unique=True)),
                ('desc_cargo', models.CharField(default='', max_length=20, verbose_name='Cargo')),
            ],
        ),
        migrations.CreateModel(
            name='Empleado',
            fields=[
                ('cod_empleado', models.CharField(default='0001', max_length=4, primary_key=True, serialize=False, unique=True, verbose_name='Código')),
                ('nom_empleado', models.CharField(default='', max_length=20, verbose_name='Nombre')),
                ('apell_empleado', models.CharField(default='', max_length=20, verbose_name='Apellido')),
                ('fecha_registro', models.DateField(default=datetime.datetime.today, verbose_name='Registro')),
                ('correo_ud', models.EmailField(default='example@udistrital.edu.co', max_length=30, verbose_name='Correo')),
            ],
        ),
        migrations.CreateModel(
            name='Estudiante',
            fields=[
                ('cod_estu', models.CharField(default='20221020001', max_length=12, primary_key=True, serialize=False, unique=True, verbose_name='Código')),
                ('nom_estu', models.CharField(default='', max_length=30, verbose_name='Nombre')),
                ('apell_estu', models.CharField(default='', max_length=30, verbose_name='Apellido')),
                ('fecha_reg_estu', models.DateField(default=datetime.datetime.today, verbose_name='Fecha registro')),
                ('fecha_nac_estu', models.DateField(default=datetime.datetime.today, verbose_name='Fecha nacimiento')),
                ('correo_ud_estu', models.EmailField(default='example@correo.udistrital.edu.co', max_length=40, verbose_name='Correo')),
                ('espacio', models.ForeignKey(default='01', on_delete=django.db.models.deletion.CASCADE, to='programming.espacio', verbose_name='Pertenece')),
            ],
        ),
        migrations.CreateModel(
            name='Rol',
            fields=[
                ('id_rol', models.CharField(default='0', max_length=1, primary_key=True, serialize=False)),
                ('desc_rol', models.CharField(default='', max_length=15, verbose_name='Descripción')),
            ],
        ),
        migrations.CreateModel(
            name='TipoDocumento',
            fields=[
                ('id_tipo_documento', models.SmallIntegerField(primary_key=True, serialize=False, unique=True)),
                ('abreviacion', models.CharField(max_length=5)),
                ('desc_tipo', models.CharField(max_length=50, verbose_name='Tipo')),
            ],
        ),
        migrations.CreateModel(
            name='Responsable',
            fields=[
                ('consec_responsable', models.AutoField(primary_key=True, serialize=False, unique=True)),
                ('fecha_inicio', models.DateField(default=datetime.datetime.today)),
                ('fecha_fin', models.DateField(default=datetime.datetime.today)),
                ('empleado', models.ForeignKey(default='0001', on_delete=django.db.models.deletion.CASCADE, to='users.empleado')),
                ('estudiante', models.ForeignKey(default='20221020001', null=True, on_delete=django.db.models.deletion.CASCADE, to='users.estudiante')),
                ('programacion', models.ForeignKey(default='1', null=True, on_delete=django.db.models.deletion.CASCADE, to='programming.programacion', verbose_name='Programación')),
                ('rol', models.ForeignKey(default='0', null=True, on_delete=django.db.models.deletion.CASCADE, to='users.rol')),
            ],
        ),
        migrations.CreateModel(
            name='Persona',
            fields=[
                ('numero_documento', models.CharField(default='00000000000', max_length=11, primary_key=True, serialize=False)),
                ('correo', models.EmailField(default='example@example.com', max_length=40)),
                ('picture', models.ImageField(blank=True, null=True, upload_to='users/picture')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('id_tipo_documento', models.ForeignKey(default='no registra', on_delete=django.db.models.deletion.CASCADE, to='users.tipodocumento')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='EstudianteUser',
            fields=[
                ('cod_estudiante', models.CharField(max_length=11, primary_key=True, serialize=False, unique=True)),
                ('nombre', models.CharField(default='no registra', max_length=30)),
                ('apellido', models.CharField(default='no registra', max_length=30)),
                ('fecha_inscripcion', models.DateField(default=datetime.datetime.today)),
                ('fecha_nacimiento', models.DateField(default=datetime.datetime.today)),
                ('correo_institucional', models.EmailField(default='example@correo.udistrital.edu.co', max_length=40)),
                ('identificacion', models.OneToOneField(default='00000000000', on_delete=django.db.models.deletion.CASCADE, to='users.persona')),
            ],
        ),
        migrations.CreateModel(
            name='EmpleadoCargo',
            fields=[
                ('consec', models.AutoField(primary_key=True, serialize=False, unique=True)),
                ('fecha_cargo', models.DateField(default=datetime.datetime.today, verbose_name='Fecha inicio cargo')),
                ('fecha_fin_cargo', models.DateField(default=datetime.datetime.today, verbose_name='Fecha fin cargo')),
                ('cargo', models.ForeignKey(default='01', on_delete=django.db.models.deletion.CASCADE, to='users.cargo')),
                ('empleado', models.ForeignKey(default='0001', on_delete=django.db.models.deletion.CASCADE, to='users.empleado')),
                ('espacio', models.ForeignKey(default='01', on_delete=django.db.models.deletion.CASCADE, to='programming.espacio')),
            ],
        ),
        migrations.CreateModel(
            name='AsisResponsable',
            fields=[
                ('consec_asis_responsable', models.AutoField(primary_key=True, serialize=False, unique=True)),
                ('fecha_asis_responsable', models.DateField(default=datetime.datetime.today, verbose_name='Fecha asistente responsable')),
                ('hora_asis_responsable', models.TimeField(default=datetime.datetime.today, verbose_name='Hora asistente responsable')),
                ('responsable', models.ForeignKey(default='1', null=True, on_delete=django.db.models.deletion.CASCADE, to='users.responsable')),
            ],
            options={
                'unique_together': {('consec_asis_responsable', 'responsable')},
            },
        ),
    ]
