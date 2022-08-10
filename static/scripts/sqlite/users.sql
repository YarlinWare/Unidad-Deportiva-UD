BEGIN;
--
-- Create model Cargo
--
CREATE TABLE "users_cargo" ("id_cargo" varchar(2) NOT NULL PRIMARY KEY, "desc_cargo" varchar(20) NOT NULL);
--
-- Create model Empleado
--
CREATE TABLE "users_empleado" ("cod_empleado" varchar(4) NOT NULL PRIMARY KEY, "nom_empleado" varchar(20) NOT NULL, "apell_empleado" varchar(20) NOT NULL, "fecha_registro" date NOT NULL, "correo_ud" varchar(30) NOT NULL);
--
-- Create model Estudiante
--
CREATE TABLE "users_estudiante" ("cod_estu" varchar(12) NOT NULL PRIMARY KEY, "nom_estu" varchar(30) NOT NULL, "apell_estu" varchar(30) NOT NULL, "fecha_reg_estu" date NOT NULL, "fecha_nac_estu" date NOT NULL, "correo_ud_estu" varchar(40) NOT NULL, "espacio_id" varchar(2) NOT NULL REFERENCES "programming_espacio" ("cod_espacio") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model Rol
--
CREATE TABLE "users_rol" ("id_rol" varchar(1) NOT NULL PRIMARY KEY, "desc_rol" varchar(15) NOT NULL);
--
-- Create model TipoDocumento
--
CREATE TABLE "users_tipodocumento" ("id_tipo_documento" smallint NOT NULL PRIMARY KEY, "abreviacion" varchar(5) NOT NULL, "desc_tipo" varchar(50) NOT NULL);
--
-- Create model Responsable
--
CREATE TABLE "users_responsable" ("consec_responsable" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "fecha_inicio" date NOT NULL, "fecha_fin" date NOT NULL, "empleado_id" varchar(4) NOT NULL REFERENCES "users_empleado" ("cod_empleado") DEFERRABLE INITIALLY DEFERRED, "estudiante_id" varchar(12) NULL REFERENCES "users_estudiante" ("cod_estu") DEFERRABLE INITIALLY DEFERRED, "programacion_id" integer NULL REFERENCES "programming_programacion" ("consec_program") DEFERRABLE INITIALLY DEFERRED, "rol_id" varchar(1) NULL REFERENCES "users_rol" ("id_rol") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model Persona
--
CREATE TABLE "users_persona" ("numero_documento" varchar(11) NOT NULL PRIMARY KEY, "correo" varchar(40) NOT NULL, "picture" varchar(100) NULL, "created" datetime NOT NULL, "updated" datetime NOT NULL, "id_tipo_documento_id" smallint NOT NULL REFERENCES "users_tipodocumento" ("id_tipo_documento") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL UNIQUE REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model EstudianteUser
--
CREATE TABLE "users_estudianteuser" ("cod_estudiante" varchar(11) NOT NULL PRIMARY KEY, "nombre" varchar(30) NOT NULL, "apellido" varchar(30) NOT NULL, "fecha_inscripcion" date NOT NULL, "fecha_nacimiento" date NOT NULL, "correo_institucional" varchar(40) NOT NULL, "identificacion_id" varchar(11) NOT NULL UNIQUE REFERENCES "users_persona" ("numero_documento") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model EmpleadoCargo
--
CREATE TABLE "users_empleadocargo" ("consec" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "fecha_cargo" date NOT NULL, "fecha_fin_cargo" date NOT NULL, "cargo_id" varchar(2) NOT NULL REFERENCES "users_cargo" ("id_cargo") DEFERRABLE INITIALLY DEFERRED, "empleado_id" varchar(4) NOT NULL REFERENCES "users_empleado" ("cod_empleado") DEFERRABLE INITIALLY DEFERRED, "espacio_id" varchar(2) NOT NULL REFERENCES "programming_espacio" ("cod_espacio") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model AsisResponsable
--
CREATE TABLE "users_asisresponsable" ("consec_asis_responsable" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "fecha_asis_responsable" date NOT NULL, "hora_asis_responsable" time NOT NULL, "responsable_id" integer NULL REFERENCES "users_responsable" ("consec_responsable") DEFERRABLE INITIALLY DEFERRED);
CREATE INDEX "users_estudiante_espacio_id_4bbedfd0" ON "users_estudiante" ("espacio_id");
CREATE INDEX "users_responsable_empleado_id_908a795a" ON "users_responsable" ("empleado_id");
CREATE INDEX "users_responsable_estudiante_id_6b09e19d" ON "users_responsable" ("estudiante_id");
CREATE INDEX "users_responsable_programacion_id_bd46b634" ON "users_responsable" ("programacion_id");
CREATE INDEX "users_responsable_rol_id_58d94007" ON "users_responsable" ("rol_id");
CREATE INDEX "users_persona_id_tipo_documento_id_8bf9b37e" ON "users_persona" ("id_tipo_documento_id");
CREATE INDEX "users_empleadocargo_cargo_id_80278e65" ON "users_empleadocargo" ("cargo_id");
CREATE INDEX "users_empleadocargo_empleado_id_e674cb00" ON "users_empleadocargo" ("empleado_id");
CREATE INDEX "users_empleadocargo_espacio_id_546fc24d" ON "users_empleadocargo" ("espacio_id");
CREATE UNIQUE INDEX "users_asisresponsable_consec_asis_responsable_responsable_id_b117c7ac_uniq" ON "users_asisresponsable" ("consec_asis_responsable", "responsable_id");
CREATE INDEX "users_asisresponsable_responsable_id_587bf36a" ON "users_asisresponsable" ("responsable_id");
COMMIT;
