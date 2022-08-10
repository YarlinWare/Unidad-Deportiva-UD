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
