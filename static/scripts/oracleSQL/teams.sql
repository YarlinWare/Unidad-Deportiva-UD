--
-- Create model Equipo
--
CREATE TABLE "TEAMS_EQUIPO" ("CONSEC_EQUIPO" NUMBER(11) GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY, "FECHA_RESOL" DATE NOT NULL, "DEPORTE_ID" NVARCHAR2(2) NOT NULL, "EMPLEADO_ID" NVARCHAR2(4) NOT NULL);
--
-- Create model MiembroEquipo
--
CREATE TABLE "TEAMS_MIEMBROEQUIPO" ("ITEMMIEMBRO" NUMBER(11) GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY, "EQUIPO_ID" NUMBER(11) NOT NULL, "ESTUDIANTE_ID" NVARCHAR2(12) NOT NULL);
--
-- Create model AsisMiembroEquipo
--
CREATE TABLE "TEAMS_ASISMIEMBROEQUIPO" ("CON_MIEMBRO_EQUIPO" NUMBER(11) GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY, "MIEMBRO_EQUIPO_ID" NUMBER(11) NOT NULL, "PROGRAMACION_ID" NUMBER(11) NOT NULL);
ALTER TABLE "TEAMS_EQUIPO" ADD CONSTRAINT "TEAMS_EQU_DEPORTE_I_525BEF07_F" FOREIGN KEY ("DEPORTE_ID") REFERENCES "SPORTS_DEPORTE" ("ID_DEPORTE") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "TEAMS_EQUIPO" ADD CONSTRAINT "TEAMS_EQU_EMPLEADO__87CF0FB7_F" FOREIGN KEY ("EMPLEADO_ID") REFERENCES "USERS_EMPLEADO" ("COD_EMPLEADO") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "TEAMS_EQUI_DEPORTE_ID_525BEF07" ON "TEAMS_EQUIPO" ("DEPORTE_ID");
CREATE INDEX "TEAMS_EQUI_EMPLEADO_I_87CF0FB7" ON "TEAMS_EQUIPO" ("EMPLEADO_ID");
ALTER TABLE "TEAMS_MIEMBROEQUIPO" ADD CONSTRAINT "TEAMS_MIE_EQUIPO_ID_852BB46E_F" FOREIGN KEY ("EQUIPO_ID") REFERENCES "TEAMS_EQUIPO" ("CONSEC_EQUIPO") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "TEAMS_MIEMBROEQUIPO" ADD CONSTRAINT "TEAMS_MIE_ESTUDIANT_E019A3C3_F" FOREIGN KEY ("ESTUDIANTE_ID") REFERENCES "USERS_ESTUDIANTE" ("COD_ESTU") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "TEAMS_MIEM_EQUIPO_ID_852BB46E" ON "TEAMS_MIEMBROEQUIPO" ("EQUIPO_ID");
CREATE INDEX "TEAMS_MIEM_ESTUDIANTE_E019A3C3" ON "TEAMS_MIEMBROEQUIPO" ("ESTUDIANTE_ID");
ALTER TABLE "TEAMS_ASISMIEMBROEQUIPO" ADD CONSTRAINT "TEAMS_ASI_MIEMBRO_E_3C8029AB_F" FOREIGN KEY ("MIEMBRO_EQUIPO_ID") REFERENCES "TEAMS_MIEMBROEQUIPO" ("ITEMMIEMBRO") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "TEAMS_ASISMIEMBROEQUIPO" ADD CONSTRAINT "TEAMS_ASI_PROGRAMAC_45FA87EB_F" FOREIGN KEY ("PROGRAMACION_ID") REFERENCES "PROGRAMMING_PROGRAMACION" ("CONSEC_PROGRAM") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "TEAMS_ASIS_MIEMBRO_EQ_3C8029AB" ON "TEAMS_ASISMIEMBROEQUIPO" ("MIEMBRO_EQUIPO_ID");
CREATE INDEX "TEAMS_ASIS_PROGRAMACI_45FA87EB" ON "TEAMS_ASISMIEMBROEQUIPO" ("PROGRAMACION_ID");
