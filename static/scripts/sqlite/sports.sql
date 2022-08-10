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
