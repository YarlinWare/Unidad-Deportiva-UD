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
