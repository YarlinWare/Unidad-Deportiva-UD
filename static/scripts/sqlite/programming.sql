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
