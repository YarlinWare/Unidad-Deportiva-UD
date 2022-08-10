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

BEGIN;
--
-- Create model Actividad
--
CREATE TABLE "programming_actividad" ("id_actividad" varchar(2) NOT NULL PRIMARY KEY, "desc_actividad" varchar(30) NOT NULL);
--
-- Create model Dia
--
CREATE TABLE "programming_dia" ("id_dia" varchar(1) NOT NULL PRIMARY KEY, "nom_dia" varchar(10) NOT NULL);
--
-- Create model Espacio
--
CREATE TABLE "programming_espacio" ("cod_espacio" varchar(2) NOT NULL PRIMARY KEY, "nom_espacio" varchar(30) NOT NULL);
--
-- Create model Hora
--
CREATE TABLE "programming_hora" ("id_hora" varchar(2) NOT NULL PRIMARY KEY, "hora" time NOT NULL UNIQUE);
--
-- Create model InscritoPractLibre
--
CREATE TABLE "programming_inscritopractlibre" ("consec_practica" integer NOT NULL PRIMARY KEY AUTOINCREMENT);
--
-- Create model Periodo
--
CREATE TABLE "programming_periodo" ("id_periodo" varchar(5) NOT NULL PRIMARY KEY);
--
-- Create model Prestamo
--
CREATE TABLE "programming_prestamo" ("consec_prestamo" integer NOT NULL PRIMARY KEY AUTOINCREMENT);
--
-- Create model TipoEspacio
--
CREATE TABLE "programming_tipoespacio" ("id_tipo_espacio" varchar(2) NOT NULL PRIMARY KEY, "desc_tipo_espacio" varchar(30) NOT NULL);
--
-- Create model Programacion
--
CREATE TABLE "programming_programacion" ("consec_program" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "cupo" integer NOT NULL, "no_inscritos" integer NULL, "actividad_id" varchar(2) NOT NULL REFERENCES "programming_actividad" ("id_actividad") DEFERRABLE INITIALLY DEFERRED);
CREATE INDEX "programming_programacion_actividad_id_ea82119a" ON "programming_programacion" ("actividad_id");
COMMIT;

BEGIN;
--
-- Add field deporte_fk to programacion
--
CREATE TABLE "new__programming_programacion" ("deporte_fk_id" varchar(2) NOT NULL REFERENCES "sports_deporte" ("id_deporte") DEFERRABLE INITIALLY DEFERRED, "consec_program" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "cupo" integer NOT NULL, "no_inscritos" integer NULL, "actividad_id" varchar(2) NOT NULL REFERENCES "programming_actividad" ("id_actividad") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__programming_programacion" ("consec_program", "cupo", "no_inscritos", "actividad_id", "deporte_fk_id") SELECT "consec_program", "cupo", "no_inscritos", "actividad_id", '01' FROM "programming_programacion";
DROP TABLE "programming_programacion";
ALTER TABLE "new__programming_programacion" RENAME TO "programming_programacion";
CREATE INDEX "programming_programacion_deporte_fk_id_b5b49465" ON "programming_programacion" ("deporte_fk_id");
CREATE INDEX "programming_programacion_actividad_id_ea82119a" ON "programming_programacion" ("actividad_id");
--
-- Add field dia to programacion
--
CREATE TABLE "new__programming_programacion" ("consec_program" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "cupo" integer NOT NULL, "no_inscritos" integer NULL, "actividad_id" varchar(2) NOT NULL REFERENCES "programming_actividad" ("id_actividad") DEFERRABLE INITIALLY DEFERRED, "deporte_fk_id" varchar(2) NOT NULL REFERENCES "sports_deporte" ("id_deporte") DEFERRABLE INITIALLY DEFERRED, "dia_id" varchar(1) NOT NULL REFERENCES "programming_dia" ("id_dia") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__programming_programacion" ("consec_program", "cupo", "no_inscritos", "actividad_id", "deporte_fk_id", "dia_id") SELECT "consec_program", "cupo", "no_inscritos", "actividad_id", "deporte_fk_id", '1' FROM "programming_programacion";
DROP TABLE "programming_programacion";
ALTER TABLE "new__programming_programacion" RENAME TO "programming_programacion";
CREATE INDEX "programming_programacion_actividad_id_ea82119a" ON "programming_programacion" ("actividad_id");
CREATE INDEX "programming_programacion_deporte_fk_id_b5b49465" ON "programming_programacion" ("deporte_fk_id");
CREATE INDEX "programming_programacion_dia_id_6195e384" ON "programming_programacion" ("dia_id");
--
-- Add field espacio to programacion
--
CREATE TABLE "new__programming_programacion" ("consec_program" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "cupo" integer NOT NULL, "no_inscritos" integer NULL, "actividad_id" varchar(2) NOT NULL REFERENCES "programming_actividad" ("id_actividad") DEFERRABLE INITIALLY DEFERRED, "deporte_fk_id" varchar(2) NOT NULL REFERENCES "sports_deporte" ("id_deporte") DEFERRABLE INITIALLY DEFERRED, "dia_id" varchar(1) NOT NULL REFERENCES "programming_dia" ("id_dia") DEFERRABLE INITIALLY DEFERRED, "espacio_id" varchar(2) NULL REFERENCES "programming_espacio" ("cod_espacio") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__programming_programacion" ("consec_program", "cupo", "no_inscritos", "actividad_id", "deporte_fk_id", "dia_id", "espacio_id") SELECT "consec_program", "cupo", "no_inscritos", "actividad_id", "deporte_fk_id", "dia_id", '01' FROM "programming_programacion";
DROP TABLE "programming_programacion";
ALTER TABLE "new__programming_programacion" RENAME TO "programming_programacion";
CREATE INDEX "programming_programacion_actividad_id_ea82119a" ON "programming_programacion" ("actividad_id");
CREATE INDEX "programming_programacion_deporte_fk_id_b5b49465" ON "programming_programacion" ("deporte_fk_id");
CREATE INDEX "programming_programacion_dia_id_6195e384" ON "programming_programacion" ("dia_id");
CREATE INDEX "programming_programacion_espacio_id_e00f3239" ON "programming_programacion" ("espacio_id");
--
-- Add field hora_inicio to programacion
--
CREATE TABLE "new__programming_programacion" ("consec_program" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "cupo" integer NOT NULL, "no_inscritos" integer NULL, "actividad_id" varchar(2) NOT NULL REFERENCES "programming_actividad" ("id_actividad") DEFERRABLE INITIALLY DEFERRED, "deporte_fk_id" varchar(2) NOT NULL REFERENCES "sports_deporte" ("id_deporte") DEFERRABLE INITIALLY DEFERRED, "dia_id" varchar(1) NOT NULL REFERENCES "programming_dia" ("id_dia") DEFERRABLE INITIALLY DEFERRED, "espacio_id" varchar(2) NULL REFERENCES "programming_espacio" ("cod_espacio") DEFERRABLE INITIALLY DEFERRED, "hora_inicio_id" varchar(2) NOT NULL REFERENCES "programming_hora" ("id_hora") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__programming_programacion" ("consec_program", "cupo", "no_inscritos", "actividad_id", "deporte_fk_id", "dia_id", "espacio_id", "hora_inicio_id") SELECT "consec_program", "cupo", "no_inscritos", "actividad_id", "deporte_fk_id", "dia_id", "espacio_id", '01' FROM "programming_programacion";
DROP TABLE "programming_programacion";
ALTER TABLE "new__programming_programacion" RENAME TO "programming_programacion";
CREATE INDEX "programming_programacion_actividad_id_ea82119a" ON "programming_programacion" ("actividad_id");
CREATE INDEX "programming_programacion_deporte_fk_id_b5b49465" ON "programming_programacion" ("deporte_fk_id");
CREATE INDEX "programming_programacion_dia_id_6195e384" ON "programming_programacion" ("dia_id");
CREATE INDEX "programming_programacion_espacio_id_e00f3239" ON "programming_programacion" ("espacio_id");
CREATE INDEX "programming_programacion_hora_inicio_id_792e12d8" ON "programming_programacion" ("hora_inicio_id");
--
-- Add field periodo to programacion
--
CREATE TABLE "new__programming_programacion" ("consec_program" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "cupo" integer NOT NULL, "no_inscritos" integer NULL, "actividad_id" varchar(2) NOT NULL REFERENCES "programming_actividad" ("id_actividad") DEFERRABLE INITIALLY DEFERRED, "deporte_fk_id" varchar(2) NOT NULL REFERENCES "sports_deporte" ("id_deporte") DEFERRABLE INITIALLY DEFERRED, "dia_id" varchar(1) NOT NULL REFERENCES "programming_dia" ("id_dia") DEFERRABLE INITIALLY DEFERRED, "espacio_id" varchar(2) NULL REFERENCES "programming_espacio" ("cod_espacio") DEFERRABLE INITIALLY DEFERRED, "hora_inicio_id" varchar(2) NOT NULL REFERENCES "programming_hora" ("id_hora") DEFERRABLE INITIALLY DEFERRED, "periodo_id" varchar(5) NOT NULL REFERENCES "programming_periodo" ("id_periodo") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__programming_programacion" ("consec_program", "cupo", "no_inscritos", "actividad_id", "deporte_fk_id", "dia_id", "espacio_id", "hora_inicio_id", "periodo_id") SELECT "consec_program", "cupo", "no_inscritos", "actividad_id", "deporte_fk_id", "dia_id", "espacio_id", "hora_inicio_id", '00001' FROM "programming_programacion";
DROP TABLE "programming_programacion";
ALTER TABLE "new__programming_programacion" RENAME TO "programming_programacion";
CREATE INDEX "programming_programacion_actividad_id_ea82119a" ON "programming_programacion" ("actividad_id");
CREATE INDEX "programming_programacion_deporte_fk_id_b5b49465" ON "programming_programacion" ("deporte_fk_id");
CREATE INDEX "programming_programacion_dia_id_6195e384" ON "programming_programacion" ("dia_id");
CREATE INDEX "programming_programacion_espacio_id_e00f3239" ON "programming_programacion" ("espacio_id");
CREATE INDEX "programming_programacion_hora_inicio_id_792e12d8" ON "programming_programacion" ("hora_inicio_id");
CREATE INDEX "programming_programacion_periodo_id_bb23bab8" ON "programming_programacion" ("periodo_id");
--
-- Add field asis_responsable to prestamo
--
CREATE TABLE "new__programming_prestamo" ("consec_prestamo" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "asis_responsable_id" integer NOT NULL REFERENCES "users_asisresponsable" ("consec_asis_responsable") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__programming_prestamo" ("consec_prestamo", "asis_responsable_id") SELECT "consec_prestamo", 1 FROM "programming_prestamo";
DROP TABLE "programming_prestamo";
ALTER TABLE "new__programming_prestamo" RENAME TO "programming_prestamo";
CREATE INDEX "programming_prestamo_asis_responsable_id_8df45299" ON "programming_prestamo" ("asis_responsable_id");
--
-- Add field elemento_deportivo to prestamo
--
CREATE TABLE "new__programming_prestamo" ("consec_prestamo" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "asis_responsable_id" integer NOT NULL REFERENCES "users_asisresponsable" ("consec_asis_responsable") DEFERRABLE INITIALLY DEFERRED, "elemento_deportivo_id" integer NOT NULL REFERENCES "sports_elementodeportivo" ("consec_elemento") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__programming_prestamo" ("consec_prestamo", "asis_responsable_id", "elemento_deportivo_id") SELECT "consec_prestamo", "asis_responsable_id", 1 FROM "programming_prestamo";
DROP TABLE "programming_prestamo";
ALTER TABLE "new__programming_prestamo" RENAME TO "programming_prestamo";
CREATE INDEX "programming_prestamo_asis_responsable_id_8df45299" ON "programming_prestamo" ("asis_responsable_id");
CREATE INDEX "programming_prestamo_elemento_deportivo_id_255d674c" ON "programming_prestamo" ("elemento_deportivo_id");
--
-- Add field empleado to inscritopractlibre
--
CREATE TABLE "new__programming_inscritopractlibre" ("consec_practica" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "empleado_id" varchar(4) NULL REFERENCES "users_empleado" ("cod_empleado") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__programming_inscritopractlibre" ("consec_practica", "empleado_id") SELECT "consec_practica", '0001' FROM "programming_inscritopractlibre";
DROP TABLE "programming_inscritopractlibre";
ALTER TABLE "new__programming_inscritopractlibre" RENAME TO "programming_inscritopractlibre";
CREATE INDEX "programming_inscritopractlibre_empleado_id_7a2300d0" ON "programming_inscritopractlibre" ("empleado_id");
--
-- Add field estudiante to inscritopractlibre
--
CREATE TABLE "new__programming_inscritopractlibre" ("consec_practica" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "empleado_id" varchar(4) NULL REFERENCES "users_empleado" ("cod_empleado") DEFERRABLE INITIALLY DEFERRED, "estudiante_id" varchar(12) NULL REFERENCES "users_estudiante" ("cod_estu") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__programming_inscritopractlibre" ("consec_practica", "empleado_id", "estudiante_id") SELECT "consec_practica", "empleado_id", '20221020001' FROM "programming_inscritopractlibre";
DROP TABLE "programming_inscritopractlibre";
ALTER TABLE "new__programming_inscritopractlibre" RENAME TO "programming_inscritopractlibre";
CREATE INDEX "programming_inscritopractlibre_empleado_id_7a2300d0" ON "programming_inscritopractlibre" ("empleado_id");
CREATE INDEX "programming_inscritopractlibre_estudiante_id_bc7ac244" ON "programming_inscritopractlibre" ("estudiante_id");
--
-- Add field programacion to inscritopractlibre
--
CREATE TABLE "new__programming_inscritopractlibre" ("consec_practica" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "empleado_id" varchar(4) NULL REFERENCES "users_empleado" ("cod_empleado") DEFERRABLE INITIALLY DEFERRED, "estudiante_id" varchar(12) NULL REFERENCES "users_estudiante" ("cod_estu") DEFERRABLE INITIALLY DEFERRED, "programacion_id" integer NULL REFERENCES "programming_programacion" ("consec_program") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__programming_inscritopractlibre" ("consec_practica", "empleado_id", "estudiante_id", "programacion_id") SELECT "consec_practica", "empleado_id", "estudiante_id", 1 FROM "programming_inscritopractlibre";
DROP TABLE "programming_inscritopractlibre";
ALTER TABLE "new__programming_inscritopractlibre" RENAME TO "programming_inscritopractlibre";
CREATE INDEX "programming_inscritopractlibre_empleado_id_7a2300d0" ON "programming_inscritopractlibre" ("empleado_id");
CREATE INDEX "programming_inscritopractlibre_estudiante_id_bc7ac244" ON "programming_inscritopractlibre" ("estudiante_id");
CREATE INDEX "programming_inscritopractlibre_programacion_id_fa5eb95d" ON "programming_inscritopractlibre" ("programacion_id");
--
-- Add field tipo_espacio to espacio
--
CREATE TABLE "new__programming_espacio" ("cod_espacio" varchar(2) NOT NULL PRIMARY KEY, "nom_espacio" varchar(30) NOT NULL, "tipo_espacio_id" varchar(2) NOT NULL REFERENCES "programming_tipoespacio" ("id_tipo_espacio") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "new__programming_espacio" ("cod_espacio", "nom_espacio", "tipo_espacio_id") SELECT "cod_espacio", "nom_espacio", NULL FROM "programming_espacio";
DROP TABLE "programming_espacio";
ALTER TABLE "new__programming_espacio" RENAME TO "programming_espacio";
CREATE INDEX "programming_espacio_tipo_espacio_id_b34d022f" ON "programming_espacio" ("tipo_espacio_id");
COMMIT;

BEGIN;
--
-- Create model Equipo
--
CREATE TABLE "teams_equipo" ("consec_equipo" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "fecha_resol" date NOT NULL, "deporte_id" varchar(2) NOT NULL REFERENCES "sports_deporte" ("id_deporte") DEFERRABLE INITIALLY DEFERRED, "empleado_id" varchar(4) NOT NULL REFERENCES "users_empleado" ("cod_empleado") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model MiembroEquipo
--
CREATE TABLE "teams_miembroequipo" ("itemMiembro" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "equipo_id" integer NOT NULL REFERENCES "teams_equipo" ("consec_equipo") DEFERRABLE INITIALLY DEFERRED, "estudiante_id" varchar(12) NOT NULL REFERENCES "users_estudiante" ("cod_estu") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model AsisMiembroEquipo
--
CREATE TABLE "teams_asismiembroequipo" ("con_miembro_equipo" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "miembro_equipo_id" integer NOT NULL REFERENCES "teams_miembroequipo" ("itemMiembro") DEFERRABLE INITIALLY DEFERRED, "programacion_id" integer NOT NULL REFERENCES "programming_programacion" ("consec_program") DEFERRABLE INITIALLY DEFERRED);
CREATE INDEX "teams_equipo_deporte_id_525bef07" ON "teams_equipo" ("deporte_id");
CREATE INDEX "teams_equipo_empleado_id_87cf0fb7" ON "teams_equipo" ("empleado_id");
CREATE INDEX "teams_miembroequipo_equipo_id_852bb46e" ON "teams_miembroequipo" ("equipo_id");
CREATE INDEX "teams_miembroequipo_estudiante_id_e019a3c3" ON "teams_miembroequipo" ("estudiante_id");
CREATE INDEX "teams_asismiembroequipo_miembro_equipo_id_3c8029ab" ON "teams_asismiembroequipo" ("miembro_equipo_id");
CREATE INDEX "teams_asismiembroequipo_programacion_id_45fa87eb" ON "teams_asismiembroequipo" ("programacion_id");
COMMIT;

BEGIN;
--
-- Create model Estado
--
CREATE TABLE "sports_estado" ("id_estado" varchar(2) NOT NULL PRIMARY KEY, "desc_estado" varchar(20) NOT NULL);
--
-- Create model Marca
--
CREATE TABLE "sports_marca" ("id_marca" varchar(2) NOT NULL PRIMARY KEY, "nom_marca" varchar(20) NOT NULL);
--
-- Create model TipoElemento
--
CREATE TABLE "sports_tipoelemento" ("id_tipo_elemento" varchar(2) NOT NULL PRIMARY KEY, "desc_tipo_elemento" varchar(40) NOT NULL);
--
-- Create model ElementoDeportivo
--
CREATE TABLE "sports_elementodeportivo" ("consec_elemento" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "fecha_registro" date NOT NULL, "espacio_id" varchar(2) NULL REFERENCES "programming_espacio" ("cod_espacio") DEFERRABLE INITIALLY DEFERRED, "estado_id" varchar(2) NOT NULL REFERENCES "sports_estado" ("id_estado") DEFERRABLE INITIALLY DEFERRED, "marca_id" varchar(2) NOT NULL REFERENCES "sports_marca" ("id_marca") DEFERRABLE INITIALLY DEFERRED, "tipo_elemento_id" varchar(2) NOT NULL REFERENCES "sports_tipoelemento" ("id_tipo_elemento") DEFERRABLE INITIALLY DEFERRED);
--
-- Create model Deporte
--
CREATE TABLE "sports_deporte" ("id_deporte" varchar(2) NOT NULL PRIMARY KEY, "nom_deporte" varchar(20) NOT NULL);
CREATE TABLE "sports_deporte_espacio" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "deporte_id" varchar(2) NOT NULL REFERENCES "sports_deporte" ("id_deporte") DEFERRABLE INITIALLY DEFERRED, "espacio_id" varchar(2) NOT NULL REFERENCES "programming_espacio" ("cod_espacio") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "sports_deporte_tipo_elemento" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "deporte_id" varchar(2) NOT NULL REFERENCES "sports_deporte" ("id_deporte") DEFERRABLE INITIALLY DEFERRED, "tipoelemento_id" varchar(2) NOT NULL REFERENCES "sports_tipoelemento" ("id_tipo_elemento") DEFERRABLE INITIALLY DEFERRED);
CREATE INDEX "sports_elementodeportivo_espacio_id_f23b7d3a" ON "sports_elementodeportivo" ("espacio_id");
CREATE INDEX "sports_elementodeportivo_estado_id_266a7739" ON "sports_elementodeportivo" ("estado_id");
CREATE INDEX "sports_elementodeportivo_marca_id_7fadd66e" ON "sports_elementodeportivo" ("marca_id");
CREATE INDEX "sports_elementodeportivo_tipo_elemento_id_a6933804" ON "sports_elementodeportivo" ("tipo_elemento_id");
CREATE UNIQUE INDEX "sports_deporte_espacio_deporte_id_espacio_id_96f6559c_uniq" ON "sports_deporte_espacio" ("deporte_id", "espacio_id");
CREATE INDEX "sports_deporte_espacio_deporte_id_2fc7f2e2" ON "sports_deporte_espacio" ("deporte_id");
CREATE INDEX "sports_deporte_espacio_espacio_id_2c9d14aa" ON "sports_deporte_espacio" ("espacio_id");
CREATE UNIQUE INDEX "sports_deporte_tipo_elemento_deporte_id_tipoelemento_id_2016fc48_uniq" ON "sports_deporte_tipo_elemento" ("deporte_id", "tipoelemento_id");
CREATE INDEX "sports_deporte_tipo_elemento_deporte_id_7e3d00ab" ON "sports_deporte_tipo_elemento" ("deporte_id");
CREATE INDEX "sports_deporte_tipo_elemento_tipoelemento_id_4df2ada4" ON "sports_deporte_tipo_elemento" ("tipoelemento_id");
COMMIT;
