--
-- Create model Estado
--
CREATE TABLE "SPORTS_ESTADO" ("ID_ESTADO" NVARCHAR2(2) NOT NULL PRIMARY KEY, "DESC_ESTADO" NVARCHAR2(20) NULL);
--
-- Create model Marca
--
CREATE TABLE "SPORTS_MARCA" ("ID_MARCA" NVARCHAR2(2) NOT NULL PRIMARY KEY, "NOM_MARCA" NVARCHAR2(20) NULL);
--
-- Create model TipoElemento
--
CREATE TABLE "SPORTS_TIPOELEMENTO" ("ID_TIPO_ELEMENTO" NVARCHAR2(2) NOT NULL PRIMARY KEY, "DESC_TIPO_ELEMENTO" NVARCHAR2(40) NULL);
--
-- Create model ElementoDeportivo
--
CREATE TABLE "SPORTS_ELEMENTODEPORTIVO" ("CONSEC_ELEMENTO" NUMBER(11) GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY, "FECHA_REGISTRO" DATE NOT NULL, "ESPACIO_ID" NVARCHAR2(2) NULL, "ESTADO_ID" NVARCHAR2(2) NOT NULL, "MARCA_ID" NVARCHAR2(2) NOT NULL, "TIPO_ELEMENTO_ID" NVARCHAR2(2) NOT NULL);
--
-- Create model Deporte
--
CREATE TABLE "SPORTS_DEPORTE" ("ID_DEPORTE" NVARCHAR2(2) NOT NULL PRIMARY KEY, "NOM_DEPORTE" NVARCHAR2(20) NULL);
CREATE TABLE "SPORTS_DEPORTE_ESPACIO" ("ID" NUMBER(19) GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY, "DEPORTE_ID" NVARCHAR2(2) NOT NULL, "ESPACIO_ID" NVARCHAR2(2) NOT NULL);
CREATE TABLE "SPORTS_DEPORTE_TIPO_ELEMENTO" ("ID" NUMBER(19) GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY, "DEPORTE_ID" NVARCHAR2(2) NOT NULL, "TIPOELEMENTO_ID" NVARCHAR2(2) NOT NULL);
ALTER TABLE "SPORTS_ELEMENTODEPORTIVO" ADD CONSTRAINT "SPORTS_EL_ESPACIO_I_F23B7D3A_F" FOREIGN KEY ("ESPACIO_ID") REFERENCES "PROGRAMMING_ESPACIO" ("COD_ESPACIO") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "SPORTS_ELEMENTODEPORTIVO" ADD CONSTRAINT "SPORTS_EL_ESTADO_ID_266A7739_F" FOREIGN KEY ("ESTADO_ID") REFERENCES "SPORTS_ESTADO" ("ID_ESTADO") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "SPORTS_ELEMENTODEPORTIVO" ADD CONSTRAINT "SPORTS_EL_MARCA_ID_7FADD66E_F" FOREIGN KEY ("MARCA_ID") REFERENCES "SPORTS_MARCA" ("ID_MARCA") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "SPORTS_ELEMENTODEPORTIVO" ADD CONSTRAINT "SPORTS_EL_TIPO_ELEM_A6933804_F" FOREIGN KEY ("TIPO_ELEMENTO_ID") REFERENCES "SPORTS_TIPOELEMENTO" ("ID_TIPO_ELEMENTO") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "SPORTS_ELE_ESPACIO_ID_F23B7D3A" ON "SPORTS_ELEMENTODEPORTIVO" ("ESPACIO_ID");
CREATE INDEX "SPORTS_ELE_ESTADO_ID_266A7739" ON "SPORTS_ELEMENTODEPORTIVO" ("ESTADO_ID");
CREATE INDEX "SPORTS_ELE_MARCA_ID_7FADD66E" ON "SPORTS_ELEMENTODEPORTIVO" ("MARCA_ID");
CREATE INDEX "SPORTS_ELE_TIPO_ELEME_A6933804" ON "SPORTS_ELEMENTODEPORTIVO" ("TIPO_ELEMENTO_ID");
ALTER TABLE "SPORTS_DEPORTE_ESPACIO" ADD CONSTRAINT "SPORTS_DE_DEPORTE_I_96F6559C_U" UNIQUE ("DEPORTE_ID", "ESPACIO_ID");
ALTER TABLE "SPORTS_DEPORTE_ESPACIO" ADD CONSTRAINT "SPORTS_DE_DEPORTE_I_2FC7F2E2_F" FOREIGN KEY ("DEPORTE_ID") REFERENCES "SPORTS_DEPORTE" ("ID_DEPORTE") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "SPORTS_DEPORTE_ESPACIO" ADD CONSTRAINT "SPORTS_DE_ESPACIO_I_2C9D14AA_F" FOREIGN KEY ("ESPACIO_ID") REFERENCES "PROGRAMMING_ESPACIO" ("COD_ESPACIO") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "SPORTS_DEP_DEPORTE_ID_2FC7F2E2" ON "SPORTS_DEPORTE_ESPACIO" ("DEPORTE_ID");
CREATE INDEX "SPORTS_DEP_ESPACIO_ID_2C9D14AA" ON "SPORTS_DEPORTE_ESPACIO" ("ESPACIO_ID");
ALTER TABLE "SPORTS_DEPORTE_TIPO_ELEMENTO" ADD CONSTRAINT "SPORTS_DE_DEPORTE_I_2016FC48_U" UNIQUE ("DEPORTE_ID", "TIPOELEMENTO_ID");
ALTER TABLE "SPORTS_DEPORTE_TIPO_ELEMENTO" ADD CONSTRAINT "SPORTS_DE_DEPORTE_I_7E3D00AB_F" FOREIGN KEY ("DEPORTE_ID") REFERENCES "SPORTS_DEPORTE" ("ID_DEPORTE") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "SPORTS_DEPORTE_TIPO_ELEMENTO" ADD CONSTRAINT "SPORTS_DE_TIPOELEME_4DF2ADA4_F" FOREIGN KEY ("TIPOELEMENTO_ID") REFERENCES "SPORTS_TIPOELEMENTO" ("ID_TIPO_ELEMENTO") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "SPORTS_DEP_DEPORTE_ID_7E3D00AB" ON "SPORTS_DEPORTE_TIPO_ELEMENTO" ("DEPORTE_ID");
CREATE INDEX "SPORTS_DEP_TIPOELEMEN_4DF2ADA4" ON "SPORTS_DEPORTE_TIPO_ELEMENTO" ("TIPOELEMENTO_ID");
