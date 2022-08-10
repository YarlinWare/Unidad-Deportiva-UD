## Bases de Datos I 2022-3 Grupo-81

#### Proyecto final para la asignatura Bases de Datos 1.


El proyecto actualmente trabaja con el lenguaje de programación de Python y el framework Django adicional maneja otras tecnologías como Bootstrap y en web HTML5 y CSS3.


### Crear Base de Datos

Para la creación de bases de datos se debe realizar los pasos:
    - Creación de script de los modelos
    - Ejecución de script dentro de la base de datos

### Crear entorno virtual

Crear entorno virtual junto al directorio donde se encuentra el proyecto
```
$ virtualenv env
```

### Activar entorno virtual

#### En linux
```
$ souce env/bin/activate
```
#### En windows
```
$ source env/Scripts/activate
```
#### Installar dependencias con el entorno activado

Estando dentro del proyecto Olimpiadas_ud/
```
(env)$ pip install -r requirements.txt
```
### Ejecutar proyecto

Configurar pase de datos en el proyecto en OracleSQL 19
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.oracle',
        'NAME': (
                '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))'
                '(CONNECT_DATA=(SERVICE_NAME=orcl)))'
                ),
        'USER': <user>,
        'PASSWORD': <password>,
    },
}
```

Creación de script de los modelos
```
(env)$ python manage.py makemigrations
(env)$ python manage.py makemigrations programming teams sports users
```

Ejecución de script dentro de la base de datos
```
(env)$ python manage.py migrate
```

Ejecutar proyecto
```
(env)$ python manage.py runserver
```

### Crear usuarios o superususarios desde la terminal/consola
```
(env)$ python manage.py createsuperuser
```
```
(env)$ python manage.py createuser
```
### Carga de datos

Para la carga de datos, puede ingresar a la carpeta que se encuentra en :

 undDeportivaUD/statics/scripts/
 
 y ejecutar los scripts correspondientes a la base de datos deseada

#### Carga de datos iniciales

Detro del proyecto encontramos archivos separados para la carga de tablas de manera individual, pero existe un archivo llamado '0.global.json', el cuál nos permitirá cargar la base de datos por completa, llenando todas las tablas, para ello ejecutaremos el siguiente comando:
```
(env)$ python manage.py loaddata statics/scripts/json/0.global.json
```

#### Tablas de la base de datos

A continuación se enuncian las tablas de la base de datos:
```
AUTH_GROUP
AUTH_GROUP_PERMISSIONS
AUTH_PERMISSION
AUTH_USER
AUTH_USER_GROUPS
AUTH_USER_USER_PERMISSIONS
DJANGO_ADMIN_LOG
DJANGO_CONTENT_TYPE
DJANGO_MIGRATIONS
DJANGO_SESSION
PROGRAMMING_ACTIVIDAD
PROGRAMMING_DIA
PROGRAMMING_ESPACIO
PROGRAMMING_HORA
PROGRAMMING_INSCRITOPRACTLIBRE
PROGRAMMING_PERIODO
PROGRAMMING_PRESTAMO
PROGRAMMING_PROGRAMACION
PROGRAMMING_TIPOESPACIO
SPORTS_DEPORTE
SPORTS_DEPORTE_ESPACIO
SPORTS_DEPORTE_TIPO_ELEMENTO
SPORTS_ELEMENTODEPORTIVO
SPORTS_ESTADO
SPORTS_MARCA
SPORTS_TIPOELEMENTO
TEAMS_ASISMIEMBROEQUIPO
TEAMS_EQUIPO
TEAMS_MIEMBROEQUIPO
USERS_ASISRESPONSABLE
USERS_CARGO
USERS_EMPLEADO
USERS_EMPLEADOCARGO
USERS_ESTUDIANTE
USERS_ESTUDIANTEUSER
USERS_PERSONA
USERS_RESPONSABLE
USERS_ROL
USERS_TIPODOCUMENTO
```

### Ruta de Administrador

 <http://localhost:8000/admin/>

## Diagrama

![]()

> Diagrama Base de Datos 


# Lista de rutas

El sistema de rutas actualmente vigentes son:

| Sección  |  Ruta | URL |
| ------------ | ------------ | ------------ |
| Admin | admin/ | http://localhost:8000/admin/ |
| Users | login/ | http://localhost:8000/login/ |
| Users | logout/ | http://localhost:8000/logout/ |
| Users | signup/ | http://localhost:8000/signup/ |


# Usuaros de prueba

| usuario  |  contraseña |
| ------------ | ------------ |
| admin | admin |

# Información

| Nombre  |  Email |
| ------------ | ------------ |
|  Cristhian Yara |  cmyarap@gmail.com |