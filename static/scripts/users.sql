BEGIN;
--
-- Create model Estudiante
--
CREATE TABLE "users_estudiante" ("cod_estudiante" varchar(11) NOT NULL PRIMARY KEY, "nombre" varchar(30) NOT NULL, "apellido" varchar(30) NOT NULL, "fecha_inscripcion" date NOT NULL, "fecha_nacimiento" date NOT NULL, "correo_institucional" varchar(40) NOT NULL);
--
-- Create model Rol
--
CREATE TABLE "users_rol" ("rol" varchar(4) NOT NULL PRIMARY KEY, "descripcion" varchar(50) NOT NULL);
--
-- Create model TipoDocumento
--
CREATE TABLE "users_tipodocumento" ("id_tipo_documento" smallint NOT NULL PRIMARY KEY, "abreviacion" varchar(5) NOT NULL, "desc_tipo" varchar(50) NOT NULL);
--
-- Create model Persona
--
CREATE TABLE "users_persona" ("numero_documento" varchar(11) NOT NULL PRIMARY KEY, "correo" varchar(40) NOT NULL, "picture" varchar(100) NULL, "created" datetime NOT NULL, "updated" datetime NOT NULL, "id_tipo_documento_id" smallint NOT NULL REFERENCES "users_tipodocumento" ("id_tipo_documento") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL UNIQUE REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model Empleado
--
CREATE TABLE "users_empleado" ("cod_empleado" varchar(11) NOT NULL PRIMARY KEY, "rol_id" varchar(4) NOT NULL UNIQUE REFERENCES "users_rol" ("rol") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL UNIQUE REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE INDEX "users_persona_id_tipo_documento_id_8bf9b37e" ON "users_persona" ("id_tipo_documento_id");
COMMIT;
