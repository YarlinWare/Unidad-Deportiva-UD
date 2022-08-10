BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "teams_asismiembroequipo" (
	"con_miembro_equipo"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"miembro_equipo_id"	integer NOT NULL,
	"programacion_id"	integer NOT NULL,
	FOREIGN KEY("programacion_id") REFERENCES "programming_programacion"("consec_program") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("miembro_equipo_id") REFERENCES "teams_miembroequipo"("itemMiembro") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "teams_miembroequipo" (
	"itemMiembro"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"equipo_id"	integer NOT NULL,
	"estudiante_id"	varchar(12) NOT NULL,
	FOREIGN KEY("equipo_id") REFERENCES "teams_equipo"("consec_equipo") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("estudiante_id") REFERENCES "users_estudiante"("cod_estu") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "teams_equipo" (
	"consec_equipo"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"fecha_resol"	date NOT NULL,
	"deporte_id"	varchar(2) NOT NULL,
	"empleado_id"	varchar(4) NOT NULL,
	FOREIGN KEY("deporte_id") REFERENCES "sports_deporte"("id_deporte") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("empleado_id") REFERENCES "users_empleado"("cod_empleado") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "programming_espacio" (
	"cod_espacio"	varchar(2) NOT NULL,
	"nom_espacio"	varchar(30) NOT NULL,
	"tipo_espacio_id"	varchar(2) NOT NULL,
	FOREIGN KEY("tipo_espacio_id") REFERENCES "programming_tipoespacio"("id_tipo_espacio") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("cod_espacio")
);
CREATE TABLE IF NOT EXISTS "programming_inscritopractlibre" (
	"consec_practica"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"empleado_id"	varchar(4),
	"estudiante_id"	varchar(12),
	"programacion_id"	integer,
	FOREIGN KEY("programacion_id") REFERENCES "programming_programacion"("consec_program") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("estudiante_id") REFERENCES "users_estudiante"("cod_estu") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("empleado_id") REFERENCES "users_empleado"("cod_empleado") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "programming_prestamo" (
	"consec_prestamo"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"asis_responsable_id"	integer NOT NULL,
	"elemento_deportivo_id"	integer NOT NULL,
	FOREIGN KEY("asis_responsable_id") REFERENCES "users_asisresponsable"("consec_asis_responsable") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("elemento_deportivo_id") REFERENCES "sports_elementodeportivo"("consec_elemento") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "programming_programacion" (
	"consec_program"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"cupo"	integer NOT NULL,
	"no_inscritos"	integer,
	"actividad_id"	varchar(2) NOT NULL,
	"deporte_fk_id"	varchar(2) NOT NULL,
	"dia_id"	varchar(1) NOT NULL,
	"espacio_id"	varchar(2),
	"hora_inicio_id"	varchar(2) NOT NULL,
	"periodo_id"	varchar(5) NOT NULL,
	FOREIGN KEY("periodo_id") REFERENCES "programming_periodo"("id_periodo") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("hora_inicio_id") REFERENCES "programming_hora"("id_hora") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dia_id") REFERENCES "programming_dia"("id_dia") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("deporte_fk_id") REFERENCES "sports_deporte"("id_deporte") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("actividad_id") REFERENCES "programming_actividad"("id_actividad") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("espacio_id") REFERENCES "programming_espacio"("cod_espacio") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "sports_deporte_tipo_elemento" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"deporte_id"	varchar(2) NOT NULL,
	"tipoelemento_id"	varchar(2) NOT NULL,
	FOREIGN KEY("tipoelemento_id") REFERENCES "sports_tipoelemento"("id_tipo_elemento") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("deporte_id") REFERENCES "sports_deporte"("id_deporte") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "sports_deporte_espacio" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"deporte_id"	varchar(2) NOT NULL,
	"espacio_id"	varchar(2) NOT NULL,
	FOREIGN KEY("espacio_id") REFERENCES "programming_espacio"("cod_espacio") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("deporte_id") REFERENCES "sports_deporte"("id_deporte") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "sports_deporte" (
	"id_deporte"	varchar(2) NOT NULL,
	"nom_deporte"	varchar(20) NOT NULL,
	PRIMARY KEY("id_deporte")
);
CREATE TABLE IF NOT EXISTS "sports_elementodeportivo" (
	"consec_elemento"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"fecha_registro"	date NOT NULL,
	"espacio_id"	varchar(2),
	"estado_id"	varchar(2) NOT NULL,
	"marca_id"	varchar(2) NOT NULL,
	"tipo_elemento_id"	varchar(2) NOT NULL,
	FOREIGN KEY("tipo_elemento_id") REFERENCES "sports_tipoelemento"("id_tipo_elemento") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("marca_id") REFERENCES "sports_marca"("id_marca") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("estado_id") REFERENCES "sports_estado"("id_estado") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("espacio_id") REFERENCES "programming_espacio"("cod_espacio") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "sports_tipoelemento" (
	"id_tipo_elemento"	varchar(2) NOT NULL,
	"desc_tipo_elemento"	varchar(40) NOT NULL,
	PRIMARY KEY("id_tipo_elemento")
);
CREATE TABLE IF NOT EXISTS "sports_marca" (
	"id_marca"	varchar(2) NOT NULL,
	"nom_marca"	varchar(20) NOT NULL,
	PRIMARY KEY("id_marca")
);
CREATE TABLE IF NOT EXISTS "sports_estado" (
	"id_estado"	varchar(2) NOT NULL,
	"desc_estado"	varchar(20) NOT NULL,
	PRIMARY KEY("id_estado")
);
CREATE TABLE IF NOT EXISTS "users_asisresponsable" (
	"consec_asis_responsable"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"fecha_asis_responsable"	date NOT NULL,
	"hora_asis_responsable"	date NOT NULL,
	"responsable_id"	integer,
	FOREIGN KEY("responsable_id") REFERENCES "users_responsable"("consec_responsable") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "users_empleadocargo" (
	"consec"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"fecha_cargo"	date NOT NULL,
	"fecha_fin_cargo"	date NOT NULL,
	"cargo_id"	varchar(2) NOT NULL,
	"empleado_id"	varchar(4) NOT NULL,
	"espacio_id"	varchar(2) NOT NULL,
	FOREIGN KEY("cargo_id") REFERENCES "users_cargo"("id_cargo") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("espacio_id") REFERENCES "programming_espacio"("cod_espacio") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("empleado_id") REFERENCES "users_empleado"("cod_empleado") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "users_estudianteuser" (
	"cod_estudiante"	varchar(11) NOT NULL,
	"nombre"	varchar(30) NOT NULL,
	"apellido"	varchar(30) NOT NULL,
	"fecha_inscripcion"	date NOT NULL,
	"fecha_nacimiento"	date NOT NULL,
	"correo_institucional"	varchar(40) NOT NULL,
	"identificacion_id"	varchar(11) NOT NULL UNIQUE,
	FOREIGN KEY("identificacion_id") REFERENCES "users_persona"("numero_documento") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("cod_estudiante")
);
CREATE TABLE IF NOT EXISTS "users_persona" (
	"numero_documento"	varchar(11) NOT NULL,
	"correo"	varchar(40) NOT NULL,
	"picture"	varchar(100),
	"created"	datetime NOT NULL,
	"updated"	datetime NOT NULL,
	"id_tipo_documento_id"	smallint NOT NULL,
	"user_id"	integer NOT NULL UNIQUE,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("id_tipo_documento_id") REFERENCES "users_tipodocumento"("id_tipo_documento") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("numero_documento")
);
CREATE TABLE IF NOT EXISTS "users_responsable" (
	"consec_responsable"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"fecha_inicio"	date NOT NULL,
	"fecha_fin"	date NOT NULL,
	"empleado_id"	varchar(4) NOT NULL,
	"estudiante_id"	varchar(12),
	"programacion_id"	integer,
	"rol_id"	varchar(1),
	FOREIGN KEY("rol_id") REFERENCES "users_rol"("id_rol") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("programacion_id") REFERENCES "programming_programacion"("consec_program") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("empleado_id") REFERENCES "users_empleado"("cod_empleado") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("estudiante_id") REFERENCES "users_estudiante"("cod_estu") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "users_tipodocumento" (
	"id_tipo_documento"	smallint NOT NULL,
	"abreviacion"	varchar(5) NOT NULL,
	"desc_tipo"	varchar(50) NOT NULL,
	PRIMARY KEY("id_tipo_documento")
);
CREATE TABLE IF NOT EXISTS "users_rol" (
	"id_rol"	varchar(1) NOT NULL,
	"desc_rol"	varchar(15) NOT NULL,
	PRIMARY KEY("id_rol")
);
CREATE TABLE IF NOT EXISTS "users_estudiante" (
	"cod_estu"	varchar(12) NOT NULL,
	"nom_estu"	varchar(30) NOT NULL,
	"apell_estu"	varchar(30) NOT NULL,
	"fecha_reg_estu"	date NOT NULL,
	"fecha_nac_estu"	date NOT NULL,
	"correo_ud_estu"	varchar(40) NOT NULL,
	"espacio_id"	varchar(2) NOT NULL,
	FOREIGN KEY("espacio_id") REFERENCES "programming_espacio"("cod_espacio") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("cod_estu")
);
CREATE TABLE IF NOT EXISTS "users_empleado" (
	"cod_empleado"	varchar(4) NOT NULL,
	"nom_empleado"	varchar(20) NOT NULL,
	"apell_empleado"	varchar(20) NOT NULL,
	"fecha_registro"	date NOT NULL,
	"correo_ud"	varchar(30) NOT NULL,
	PRIMARY KEY("cod_empleado")
);
CREATE TABLE IF NOT EXISTS "users_cargo" (
	"id_cargo"	varchar(2) NOT NULL,
	"desc_cargo"	varchar(20) NOT NULL,
	PRIMARY KEY("id_cargo")
);
CREATE TABLE IF NOT EXISTS "programming_tipoespacio" (
	"id_tipo_espacio"	varchar(2) NOT NULL,
	"desc_tipo_espacio"	varchar(30) NOT NULL,
	PRIMARY KEY("id_tipo_espacio")
);
CREATE TABLE IF NOT EXISTS "programming_periodo" (
	"id_periodo"	varchar(5) NOT NULL,
	PRIMARY KEY("id_periodo")
);
CREATE TABLE IF NOT EXISTS "programming_hora" (
	"id_hora"	varchar(2) NOT NULL,
	"hora"	time NOT NULL UNIQUE,
	PRIMARY KEY("id_hora")
);
CREATE TABLE IF NOT EXISTS "programming_dia" (
	"id_dia"	varchar(1) NOT NULL,
	"nom_dia"	varchar(10) NOT NULL,
	PRIMARY KEY("id_dia")
);
CREATE TABLE IF NOT EXISTS "programming_actividad" (
	"id_actividad"	varchar(2) NOT NULL,
	"desc_actividad"	varchar(30) NOT NULL,
	PRIMARY KEY("id_actividad")
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(150) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag">=0),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL
);
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('wkjrtjy3oljlsma7gh2ygz2d2hfx0rh5','.eJxVjMsOwiAQRf-FtSGlPAZcuvcbyDAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxZnocTpd0tID247yHdst1nS3NZlSnJX5EG7vM6Zn5fD_Tuo2Ou3ZkUI6AuwNpkGPSJkUIEKqsQq0WiQNLL3AWwGB8HRYEvxmLQja1i8PwubOMk:1oLbhV:9m1bEZA6H5oUBJnt8oXSfQbVq4mjG8W4oM50HtUu_Nk','2022-08-24 02:44:05.912464');
INSERT INTO "programming_espacio" ("cod_espacio","nom_espacio","tipo_espacio_id") VALUES ('01','Unidad deportiva el Salitre','01'),
 ('S1','Sede Deportiva El Dorado','02'),
 ('S2','Sede Deportiva Millonarios FC','02'),
 ('S3','Club deportivo Cafam Madelena','02'),
 ('C1','Campo de Fútbol Millonarios FC','03'),
 ('P1','Pista Millonarios FC','04'),
 ('N1','Piscina Millonarios FC','06'),
 ('C2','Campo de Atletismo El Dorado','03'),
 ('P2','Pista BMX El Dorado','04'),
 ('N2','Piscina Olimpica El Dorado','06'),
 ('C3','Campo de patinaje Cafam','03'),
 ('P3','Pista Ciclismo Cafam','04'),
 ('N3','Piscina Infantil Cafam','06'),
 ('M1','Sala Máquinas Millonarios FC','07'),
 ('M2','Sala Máquinas El Dorado','07'),
 ('M3','Sala Máquinas Cafam','07'),
 ('U1','Unidad deportiva el Salitre','01'),
 ('K0','Salón 1 Millonarios FC','05'),
 ('K1','Salón 2 Millonarios FC','05'),
 ('K2','Salón 3 Millonarios FC','05'),
 ('K3','Salón 4 Millonarios FC','05'),
 ('K4','Salón 5 Millonarios FC','05'),
 ('K5','Salón 6 Millonarios FC','05'),
 ('K6','Salón 7 Millonarios FC','05'),
 ('K7','Salón 8 Millonarios FC','05'),
 ('K8','Salón 9 Millonarios FC','05'),
 ('K9','Salón 10 Millonarios FC','05'),
 ('L1','Salón 1 El Dorado','05'),
 ('L2','Salón 2 El Dorado','05'),
 ('L3','Salón 3 El Dorado','05'),
 ('L4','Salón 4 El Dorado','05'),
 ('L5','Salón 5 El Dorado','05'),
 ('L6','Salón 6 El Dorado','05'),
 ('L7','Salón 7 El Dorado','05'),
 ('L8','Salón 8 El Dorado','05'),
 ('L9','Salón 9 El Dorado','05'),
 ('L0','Salón 10 El Dorado','05'),
 ('J0','Salón 1 Cafam Madelena','05'),
 ('J1','Salón 2 Cafam Madelena','05'),
 ('J2','Salón 3 Cafam Madelena','05'),
 ('J3','Salón 4 Cafam Madelena','05'),
 ('J4','Salón 5 Cafam Madelena','05'),
 ('J5','Salón 6 Cafam Madelena','05'),
 ('J6','Salón 7 Cafam Madelena','05'),
 ('J7','Salón 8 Cafam Madelena','05'),
 ('J8','Salón 9 Cafam Madelena','05'),
 ('J9','Salón 10 Cafam Madelena','05');
INSERT INTO "sports_deporte_tipo_elemento" ("id","deporte_id","tipoelemento_id") VALUES (1,'01','07'),
 (2,'01','11'),
 (3,'02','05'),
 (4,'03','04'),
 (5,'04','06'),
 (6,'05','03'),
 (7,'06','02'),
 (8,'07','02'),
 (9,'08','13'),
 (10,'09','06'),
 (11,'10','10'),
 (12,'10','08'),
 (13,'11','10'),
 (14,'11','12'),
 (15,'11','08'),
 (16,'12','06'),
 (17,'12','07'),
 (18,'12','11');
INSERT INTO "sports_deporte_espacio" ("id","deporte_id","espacio_id") VALUES (1,'01','01'),
 (2,'02','01'),
 (3,'03','01'),
 (4,'04','01'),
 (5,'05','01'),
 (6,'06','01'),
 (7,'07','01'),
 (8,'08','01'),
 (9,'09','01'),
 (10,'10','01'),
 (11,'11','01'),
 (12,'12','01');
INSERT INTO "sports_deporte" ("id_deporte","nom_deporte") VALUES ('01','Atletismo'),
 ('02','Tenis'),
 ('03','Tenis Mesa'),
 ('04','Natación'),
 ('05','Voleibol'),
 ('06','Futbol'),
 ('07','Futbol sala'),
 ('08','Bádminton'),
 ('09','Aeróbicos'),
 ('10','Boxeo'),
 ('11','Artes Marciales'),
 ('12','Gimnasia Olimpica');
INSERT INTO "sports_tipoelemento" ("id_tipo_elemento","desc_tipo_elemento") VALUES ('01','Balón Baloncesto'),
 ('02','Balón Futbol'),
 ('03','Balón Voleibol'),
 ('04','Pelota Tenis mesa'),
 ('05','Pelota Tenis campo'),
 ('06','Colchoneta'),
 ('07','Lazo salto'),
 ('08','Guantes Box'),
 ('09','Malla Volibol'),
 ('10','Saco Boxeo'),
 ('11','Aros hula-hula'),
 ('12','Chaleco Boxeo'),
 ('13','Malla Pimpón');
INSERT INTO "sports_marca" ("id_marca","nom_marca") VALUES ('01','Nike'),
 ('02','Adidas'),
 ('03','Puma'),
 ('04','Reebok'),
 ('05','Fila'),
 ('06','Asics'),
 ('07','Kappa'),
 ('08','The North Face'),
 ('09','Under Armour'),
 ('10','Under Armour'),
 ('11','Converse'),
 ('12','TI Colombia');
INSERT INTO "sports_estado" ("id_estado","desc_estado") VALUES ('01','Activo'),
 ('02','Prestado'),
 ('03','Dañado'),
 ('04','Perdido'),
 ('05','De baja');
INSERT INTO "users_empleadocargo" ("consec","fecha_cargo","fecha_fin_cargo","cargo_id","empleado_id","espacio_id") VALUES (1,'2022-08-10','2022-08-10','03','0001','C1'),
 (2,'2022-08-10','2022-08-10','03','0001','C1'),
 (3,'2022-08-10','2022-08-10','02','0002','S2'),
 (4,'2022-08-10','2022-08-10','02','0003','S1'),
 (5,'2022-08-10','2022-08-10','02','0004','S1'),
 (6,'2022-08-10','2022-08-10','02','0005','S3'),
 (7,'2022-08-10','2022-08-10','01','0006','01'),
 (8,'2022-08-10','2022-08-10','01','0007','01'),
 (9,'2022-08-10','2022-08-10','06','0008','S1'),
 (10,'2022-08-10','2022-08-10','06','0009','S2'),
 (11,'2022-08-10','2022-08-10','06','0010','S3');
INSERT INTO "users_rol" ("id_rol","desc_rol") VALUES ('1','Director Deport'),
 ('2','Docente'),
 ('3','Entranador');
INSERT INTO "users_estudiante" ("cod_estu","nom_estu","apell_estu","fecha_reg_estu","fecha_nac_estu","correo_ud_estu","espacio_id") VALUES ('20221020001','DANA JULIETH','PEDRAZA MARTINEZ','2022-08-10','2022-08-10','djpedrazam@correo.udistrital.edu.co','S1'),
 ('20221020002','NICOLAS GUSTAVO','FRANCO PINILLA','2022-08-10','2022-08-10','fpnicolasg@correo.udistrital.edu.co','S2'),
 ('20221020003','ANDERSON CAMILO','JIMENEZ VILLAREAL','2022-08-10','2022-08-10','acjimenezv@correo.udistrital.edu.co','S3'),
 ('20221020004','SANTIAGO ANDRES','ZAMBRANO VASQUEZ','2022-08-10','2022-08-10','sazambranov@correo.udistrital.edu.co','S1'),
 ('20221020005','JUAN DAVID','OSORIO GONZALEZ','2022-08-10','2022-08-10','jdosoriog@correo.udistrital.edu.co','S2'),
 ('20221020006','EDISSON DAVID','CRESPO JAMIOY','2022-08-10','2022-08-10','edcrespoj@correo.udistrital.edu.co','S3'),
 ('20221020007','KAROL ESTEFANIA','AGUILAR PALACIOS','2022-08-10','2022-08-10','keaguilarp@correo.udistrital.edu.co','S1'),
 ('20221020008','DANA JULIETH','FRANCO PINILLA','2022-08-10','2022-08-10','djfrancop@correo.udistrital.edu.co','S2'),
 ('20221020009','NICOLAS GUSTAVO','PEDRAZA MARTINEZ','2022-08-10','2022-08-10','ngpedrazam@correo.udistrital.edu.co','S3'),
 ('20221020010','ANDERSON CAMILO','ZAMBRANO VASQUEZ','2022-08-10','2022-08-10','aczambranov@correo.udistrital.edu.co','S1');
INSERT INTO "users_empleado" ("cod_empleado","nom_empleado","apell_empleado","fecha_registro","correo_ud") VALUES ('0001','Jhony','Sanchez','2022-08-10','jhonysanche@udistrital.edu.co'),
 ('0002','Daniel','Garcia','2022-08-10','dgarcia@udistrital.edu.co'),
 ('0003','Alejandro','Cortes','2022-08-10','acortes@udistrital.edu.co'),
 ('0004','Viviana','Garcia','2022-08-10','vgarcia@udistrital.edu.co'),
 ('0005','Angie','Bustos','2022-08-10','abustos@udistrital.edu.co'),
 ('0006','Juan','Herrera','2022-08-10','jherrera@udistrital.edu.co'),
 ('0007','Juan','Ramirez','2022-08-10','jramirez@udistrital.edu.co'),
 ('0008','Alejandro','Gaviria','2022-08-10','agaviria@udistrital.edu.co'),
 ('0009','Diego','Tellez','2022-08-10','dtellez@udistrital.edu.co'),
 ('0010','Esteban','Olaya','2022-08-10','eolaya@udistrital.edu.co');
INSERT INTO "users_cargo" ("id_cargo","desc_cargo") VALUES ('01','Auxiliar'),
 ('02','Docente'),
 ('03','Director Deportivo'),
 ('04','Admin Deportivo'),
 ('05','Fisioterapeuta'),
 ('06','Entrenador');
INSERT INTO "programming_tipoespacio" ("id_tipo_espacio","desc_tipo_espacio") VALUES ('01','Unidad'),
 ('02','Sede'),
 ('03','Campo'),
 ('04','Pista'),
 ('05','Salón'),
 ('06','Piscina'),
 ('07','Sala de máquinas'),
 ('08','Muro de escalar');
INSERT INTO "programming_periodo" ("id_periodo") VALUES ('20191'),
 ('20192'),
 ('20193'),
 ('20201'),
 ('20202'),
 ('20203'),
 ('20211'),
 ('20212'),
 ('20213'),
 ('20221');
INSERT INTO "programming_hora" ("id_hora","hora") VALUES ('01','06:00:00'),
 ('02','07:00:00'),
 ('03','08:00:00'),
 ('04','09:00:00'),
 ('05','10:00:00'),
 ('06','11:00:00'),
 ('07','12:00:00'),
 ('08','13:00:00'),
 ('09','14:00:00'),
 ('10','15:00:00'),
 ('11','16:00:00'),
 ('12','17:00:00'),
 ('13','18:00:00'),
 ('14','19:00:00'),
 ('15','20:00:00'),
 ('16','21:00:00'),
 ('17','22:00:00');
INSERT INTO "programming_dia" ("id_dia","nom_dia") VALUES ('1','Domingo'),
 ('2','Lunes'),
 ('3','Martes'),
 ('4','Miércoles'),
 ('5','Jueves'),
 ('6','Viernes'),
 ('7','Sábado');
INSERT INTO "programming_actividad" ("id_actividad","desc_actividad") VALUES ('CU','Curso'),
 ('EN','Entrenamiento'),
 ('PR','Práctica');
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","last_name","email","is_staff","is_active","date_joined","first_name") VALUES (1,'pbkdf2_sha256$320000$lTPbNIyepHYGkTRH59uJQK$sxRpil5g1nQ8qOiEBnG4yQx8Fd85LdilkbDXcuNf2hA=','2022-08-10 02:44:05.908235',1,'admin','','',1,1,'2022-08-10 02:43:55.057857','');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,7,'add_cargo','Can add cargo'),
 (26,7,'change_cargo','Can change cargo'),
 (27,7,'delete_cargo','Can delete cargo'),
 (28,7,'view_cargo','Can view cargo'),
 (29,8,'add_empleado','Can add empleado'),
 (30,8,'change_empleado','Can change empleado'),
 (31,8,'delete_empleado','Can delete empleado'),
 (32,8,'view_empleado','Can view empleado'),
 (33,9,'add_estudiante','Can add estudiante'),
 (34,9,'change_estudiante','Can change estudiante'),
 (35,9,'delete_estudiante','Can delete estudiante'),
 (36,9,'view_estudiante','Can view estudiante'),
 (37,10,'add_rol','Can add rol'),
 (38,10,'change_rol','Can change rol'),
 (39,10,'delete_rol','Can delete rol'),
 (40,10,'view_rol','Can view rol'),
 (41,11,'add_tipodocumento','Can add tipo documento'),
 (42,11,'change_tipodocumento','Can change tipo documento'),
 (43,11,'delete_tipodocumento','Can delete tipo documento'),
 (44,11,'view_tipodocumento','Can view tipo documento'),
 (45,12,'add_responsable','Can add responsable'),
 (46,12,'change_responsable','Can change responsable'),
 (47,12,'delete_responsable','Can delete responsable'),
 (48,12,'view_responsable','Can view responsable'),
 (49,13,'add_persona','Can add persona'),
 (50,13,'change_persona','Can change persona'),
 (51,13,'delete_persona','Can delete persona'),
 (52,13,'view_persona','Can view persona'),
 (53,14,'add_estudianteuser','Can add estudiante user'),
 (54,14,'change_estudianteuser','Can change estudiante user'),
 (55,14,'delete_estudianteuser','Can delete estudiante user'),
 (56,14,'view_estudianteuser','Can view estudiante user'),
 (57,15,'add_empleadocargo','Can add empleado cargo'),
 (58,15,'change_empleadocargo','Can change empleado cargo'),
 (59,15,'delete_empleadocargo','Can delete empleado cargo'),
 (60,15,'view_empleadocargo','Can view empleado cargo'),
 (61,16,'add_asisresponsable','Can add asis responsable'),
 (62,16,'change_asisresponsable','Can change asis responsable'),
 (63,16,'delete_asisresponsable','Can delete asis responsable'),
 (64,16,'view_asisresponsable','Can view asis responsable'),
 (65,17,'add_actividad','Can add actividad'),
 (66,17,'change_actividad','Can change actividad'),
 (67,17,'delete_actividad','Can delete actividad'),
 (68,17,'view_actividad','Can view actividad'),
 (69,18,'add_dia','Can add dia'),
 (70,18,'change_dia','Can change dia'),
 (71,18,'delete_dia','Can delete dia'),
 (72,18,'view_dia','Can view dia'),
 (73,19,'add_espacio','Can add espacio'),
 (74,19,'change_espacio','Can change espacio'),
 (75,19,'delete_espacio','Can delete espacio'),
 (76,19,'view_espacio','Can view espacio'),
 (77,20,'add_hora','Can add hora'),
 (78,20,'change_hora','Can change hora'),
 (79,20,'delete_hora','Can delete hora'),
 (80,20,'view_hora','Can view hora'),
 (81,21,'add_inscritopractlibre','Can add inscrito pract libre'),
 (82,21,'change_inscritopractlibre','Can change inscrito pract libre'),
 (83,21,'delete_inscritopractlibre','Can delete inscrito pract libre'),
 (84,21,'view_inscritopractlibre','Can view inscrito pract libre'),
 (85,22,'add_periodo','Can add periodo'),
 (86,22,'change_periodo','Can change periodo'),
 (87,22,'delete_periodo','Can delete periodo'),
 (88,22,'view_periodo','Can view periodo'),
 (89,23,'add_prestamo','Can add prestamo'),
 (90,23,'change_prestamo','Can change prestamo'),
 (91,23,'delete_prestamo','Can delete prestamo'),
 (92,23,'view_prestamo','Can view prestamo'),
 (93,24,'add_tipoespacio','Can add tipo espacio'),
 (94,24,'change_tipoespacio','Can change tipo espacio'),
 (95,24,'delete_tipoespacio','Can delete tipo espacio'),
 (96,24,'view_tipoespacio','Can view tipo espacio'),
 (97,25,'add_programacion','Can add programacion'),
 (98,25,'change_programacion','Can change programacion'),
 (99,25,'delete_programacion','Can delete programacion'),
 (100,25,'view_programacion','Can view programacion'),
 (101,26,'add_equipo','Can add equipo'),
 (102,26,'change_equipo','Can change equipo'),
 (103,26,'delete_equipo','Can delete equipo'),
 (104,26,'view_equipo','Can view equipo'),
 (105,27,'add_miembroequipo','Can add miembro equipo'),
 (106,27,'change_miembroequipo','Can change miembro equipo'),
 (107,27,'delete_miembroequipo','Can delete miembro equipo'),
 (108,27,'view_miembroequipo','Can view miembro equipo'),
 (109,28,'add_asismiembroequipo','Can add asis miembro equipo'),
 (110,28,'change_asismiembroequipo','Can change asis miembro equipo'),
 (111,28,'delete_asismiembroequipo','Can delete asis miembro equipo'),
 (112,28,'view_asismiembroequipo','Can view asis miembro equipo'),
 (113,29,'add_estado','Can add estado'),
 (114,29,'change_estado','Can change estado'),
 (115,29,'delete_estado','Can delete estado'),
 (116,29,'view_estado','Can view estado'),
 (117,30,'add_marca','Can add marca'),
 (118,30,'change_marca','Can change marca'),
 (119,30,'delete_marca','Can delete marca'),
 (120,30,'view_marca','Can view marca'),
 (121,31,'add_tipoelemento','Can add tipo elemento'),
 (122,31,'change_tipoelemento','Can change tipo elemento'),
 (123,31,'delete_tipoelemento','Can delete tipo elemento'),
 (124,31,'view_tipoelemento','Can view tipo elemento'),
 (125,32,'add_elementodeportivo','Can add elemento deportivo'),
 (126,32,'change_elementodeportivo','Can change elemento deportivo'),
 (127,32,'delete_elementodeportivo','Can delete elemento deportivo'),
 (128,32,'view_elementodeportivo','Can view elemento deportivo'),
 (129,33,'add_deporte','Can add deporte'),
 (130,33,'change_deporte','Can change deporte'),
 (131,33,'delete_deporte','Can delete deporte'),
 (132,33,'view_deporte','Can view deporte');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'users','cargo'),
 (8,'users','empleado'),
 (9,'users','estudiante'),
 (10,'users','rol'),
 (11,'users','tipodocumento'),
 (12,'users','responsable'),
 (13,'users','persona'),
 (14,'users','estudianteuser'),
 (15,'users','empleadocargo'),
 (16,'users','asisresponsable'),
 (17,'programming','actividad'),
 (18,'programming','dia'),
 (19,'programming','espacio'),
 (20,'programming','hora'),
 (21,'programming','inscritopractlibre'),
 (22,'programming','periodo'),
 (23,'programming','prestamo'),
 (24,'programming','tipoespacio'),
 (25,'programming','programacion'),
 (26,'teams','equipo'),
 (27,'teams','miembroequipo'),
 (28,'teams','asismiembroequipo'),
 (29,'sports','estado'),
 (30,'sports','marca'),
 (31,'sports','tipoelemento'),
 (32,'sports','elementodeportivo'),
 (33,'sports','deporte');
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (1,'2022-08-10 02:44:43.113180','01','01','[{"added": {}}]',20,1,1),
 (2,'2022-08-10 02:50:40.471614','02','02','[{"added": {}}]',20,1,1),
 (3,'2022-08-10 02:50:48.602978','03','03','[{"added": {}}]',20,1,1),
 (4,'2022-08-10 02:50:56.283447','04','04','[{"added": {}}]',20,1,1),
 (5,'2022-08-10 02:51:03.182300','05','05','[{"added": {}}]',20,1,1),
 (6,'2022-08-10 02:51:09.495465','06','06','[{"added": {}}]',20,1,1),
 (7,'2022-08-10 02:51:20.317641','07','07','[{"added": {}}]',20,1,1),
 (8,'2022-08-10 02:51:29.049093','08','08','[{"added": {}}]',20,1,1),
 (9,'2022-08-10 02:51:36.961321','09','09','[{"added": {}}]',20,1,1),
 (10,'2022-08-10 02:51:44.641841','10','10','[{"added": {}}]',20,1,1),
 (11,'2022-08-10 02:51:53.082627','11','11','[{"added": {}}]',20,1,1),
 (12,'2022-08-10 02:51:59.012619','12','12','[{"added": {}}]',20,1,1),
 (13,'2022-08-10 02:52:19.537730','13','13','[{"added": {}}]',20,1,1),
 (14,'2022-08-10 02:52:26.875392','14','14','[{"added": {}}]',20,1,1),
 (15,'2022-08-10 02:52:44.270388','15','15','[{"added": {}}]',20,1,1),
 (16,'2022-08-10 02:52:51.495708','16','16','[{"added": {}}]',20,1,1),
 (17,'2022-08-10 02:52:57.679967','17','17','[{"added": {}}]',20,1,1),
 (18,'2022-08-10 02:53:37.306979','01','Nike','[{"added": {}}]',30,1,1),
 (19,'2022-08-10 02:53:43.989093','02','Adidas','[{"added": {}}]',30,1,1),
 (20,'2022-08-10 02:53:50.816487','03','Puma','[{"added": {}}]',30,1,1),
 (21,'2022-08-10 02:53:56.475563','04','Reebok','[{"added": {}}]',30,1,1),
 (22,'2022-08-10 02:54:02.772216','05','Fila','[{"added": {}}]',30,1,1),
 (23,'2022-08-10 02:54:08.913290','06','Asics','[{"added": {}}]',30,1,1),
 (24,'2022-08-10 02:54:14.858304','07','Kappa','[{"added": {}}]',30,1,1),
 (25,'2022-08-10 02:54:21.125995','08','The North Face','[{"added": {}}]',30,1,1),
 (26,'2022-08-10 02:54:27.293661','09','Under Armour','[{"added": {}}]',30,1,1),
 (27,'2022-08-10 02:54:35.260202','10','Under Armour','[{"added": {}}]',30,1,1),
 (28,'2022-08-10 02:54:46.910455','11','Converse','[{"added": {}}]',30,1,1),
 (29,'2022-08-10 02:54:54.763464','12','TI Colombia','[{"added": {}}]',30,1,1),
 (30,'2022-08-10 02:56:37.677098','1','Director Deport','[{"added": {}}]',10,1,1),
 (31,'2022-08-10 02:56:43.273948','2','Docente','[{"added": {}}]',10,1,1),
 (32,'2022-08-10 02:56:48.854871','3','Entranador','[{"added": {}}]',10,1,1),
 (33,'2022-08-10 02:57:02.217459','01','Auxiliar','[{"added": {}}]',7,1,1),
 (34,'2022-08-10 02:57:07.867313','02','Docente','[{"added": {}}]',7,1,1),
 (35,'2022-08-10 02:57:17.201927','03','Director Deportivo','[{"added": {}}]',7,1,1),
 (36,'2022-08-10 02:57:30.837291','04','Admin Deportivo','[{"added": {}}]',7,1,1),
 (37,'2022-08-10 02:57:37.234618','05','Fisioterapeuta','[{"added": {}}]',7,1,1),
 (38,'2022-08-10 02:57:43.289284','06','Entrenador','[{"added": {}}]',7,1,1),
 (39,'2022-08-10 03:00:01.077756','01','Espacio 1','[{"added": {}}]',19,1,1),
 (40,'2022-08-10 03:00:06.970146','01','Atletismo','[{"added": {}}]',33,1,1),
 (41,'2022-08-10 03:01:02.665863','02','Tenis','[{"added": {}}]',33,1,1),
 (42,'2022-08-10 03:01:14.672154','03','Tenis Mesa','[{"added": {}}]',33,1,1),
 (43,'2022-08-10 03:01:58.060305','04','Natación','[{"added": {}}]',33,1,1),
 (44,'2022-08-10 03:02:15.538687','05','Voleibol','[{"added": {}}]',33,1,1),
 (45,'2022-08-10 03:02:25.289984','06','Futbol','[{"added": {}}]',33,1,1),
 (46,'2022-08-10 03:02:48.843855','07','Futbol sala','[{"added": {}}]',33,1,1),
 (47,'2022-08-10 03:03:22.644363','08','Bádminton','[{"added": {}}]',33,1,1),
 (48,'2022-08-10 03:03:37.222380','09','Aeróbicos','[{"added": {}}]',33,1,1),
 (49,'2022-08-10 03:03:49.570588','10','Boxeo','[{"added": {}}]',33,1,1),
 (50,'2022-08-10 03:04:06.759718','11','Artes Marciales','[{"added": {}}]',33,1,1),
 (51,'2022-08-10 03:04:38.199935','12','Gimnasia Olimpica','[{"added": {}}]',33,1,1),
 (52,'2022-08-10 03:10:07.407119','01','Unidad deportiva el Salitre','[{"changed": {"fields": ["Nom espacio"]}}]',19,1,2),
 (53,'2022-08-10 03:10:54.657060','S1','Sede Deportiva El Dorado','[{"added": {}}]',19,1,1),
 (54,'2022-08-10 03:11:17.035122','S2','Sede Deportiva Millonarios FC','[{"added": {}}]',19,1,1),
 (55,'2022-08-10 03:11:51.605486','S3','Club deportivo Cafam Madelena','[{"added": {}}]',19,1,1),
 (56,'2022-08-10 03:14:39.628536','C1','Campo de Fútbol Millonarios FC','[{"added": {}}]',19,1,1),
 (57,'2022-08-10 03:15:13.506795','P1','Piscina Millonarios FC','[{"added": {}}]',19,1,1),
 (58,'2022-08-10 03:15:42.951951','P1','Pista Millonarios FC','[{"changed": {"fields": ["Nom espacio"]}}]',19,1,2),
 (59,'2022-08-10 03:16:05.946314','N1','Piscina Millonarios FC','[{"added": {}}]',19,1,1),
 (60,'2022-08-10 03:16:47.147866','C2','Campo de Atletismo El Dorado','[{"added": {}}]',19,1,1),
 (61,'2022-08-10 03:17:12.182018','P2','Pista BMX El Dorado','[{"added": {}}]',19,1,1),
 (62,'2022-08-10 03:17:29.158781','N2','Piscina Olimpica El Dorado','[{"added": {}}]',19,1,1),
 (63,'2022-08-10 03:18:28.834230','C3','Campo de patinaje Cafam','[{"added": {}}]',19,1,1),
 (64,'2022-08-10 03:18:54.682035','P3','Pista Ciclismo Cafam','[{"added": {}}]',19,1,1),
 (65,'2022-08-10 03:19:11.962555','N3','Piscina Infantil Cafam','[{"added": {}}]',19,1,1),
 (66,'2022-08-10 03:19:55.281785','M1','Sala Máquinas Millonarios FC','[{"added": {}}]',19,1,1),
 (67,'2022-08-10 03:20:19.365247','M2','Sala Máquinas El Dorado','[{"added": {}}]',19,1,1),
 (68,'2022-08-10 03:20:39.698956','M3','Sala Máquinas Cafam','[{"added": {}}]',19,1,1),
 (69,'2022-08-10 03:23:10.653095','U1','Unidad deportiva el Salitre','[{"changed": {"fields": ["Cod espacio"]}}]',19,1,2),
 (70,'2022-08-10 03:23:48.402975','K0','Salón 1 Millonarios FC','[{"added": {}}]',19,1,1),
 (71,'2022-08-10 03:24:06.056522','K1','Salón 2 Millonarios FC','[{"added": {}}]',19,1,1),
 (72,'2022-08-10 03:24:25.047675','K2','Salón 3 Millonarios FC','[{"added": {}}]',19,1,1),
 (73,'2022-08-10 03:24:33.369125','K3','Salón 4 Millonarios FC','[{"added": {}}]',19,1,1),
 (74,'2022-08-10 03:24:44.159152','K4','Salón 5 Millonarios FC','[{"added": {}}]',19,1,1),
 (75,'2022-08-10 03:24:52.596540','K5','Salón 6 Millonarios FC','[{"added": {}}]',19,1,1),
 (76,'2022-08-10 03:25:00.867115','K6','Salón 7 Millonarios FC','[{"added": {}}]',19,1,1),
 (77,'2022-08-10 03:25:09.055060','K7','Salón 8 Millonarios FC','[{"added": {}}]',19,1,1),
 (78,'2022-08-10 03:25:16.405591','K8','Salón 9 Millonarios FC','[{"added": {}}]',19,1,1),
 (79,'2022-08-10 03:25:30.314470','K9','Salón 10 Millonarios FC','[{"added": {}}]',19,1,1),
 (80,'2022-08-10 03:25:51.879380','L1','Salón 1 El Dorado','[{"added": {}}]',19,1,1),
 (81,'2022-08-10 03:26:02.308167','L2','Salón 2 El Dorado','[{"added": {}}]',19,1,1),
 (82,'2022-08-10 03:26:13.358319','L3','Salón 3 El Dorado','[{"added": {}}]',19,1,1),
 (83,'2022-08-10 03:26:23.530899','L4','Salón 4 El Dorado','[{"added": {}}]',19,1,1),
 (84,'2022-08-10 03:26:31.491517','L5','Salón 5 El Dorado','[{"added": {}}]',19,1,1),
 (85,'2022-08-10 03:26:38.756458','L6','Salón 6 El Dorado','[{"added": {}}]',19,1,1),
 (86,'2022-08-10 03:26:45.972625','L7','Salón 7 El Dorado','[{"added": {}}]',19,1,1),
 (87,'2022-08-10 03:26:55.519361','L8','Salón 8 El Dorado','[{"added": {}}]',19,1,1),
 (88,'2022-08-10 03:27:08.028691','L9','Salón 9 El Dorado','[{"added": {}}]',19,1,1),
 (89,'2022-08-10 03:27:23.971937','L0','Salón 10 El Dorado','[{"added": {}}]',19,1,1),
 (90,'2022-08-10 03:27:57.985891','J0','Salón 1 Cafam Madelena','[{"added": {}}]',19,1,1),
 (91,'2022-08-10 03:28:11.179842','J1','Salón 2 Cafam Madelena','[{"added": {}}]',19,1,1),
 (92,'2022-08-10 03:28:17.792080','J2','Salón 3 Cafam Madelena','[{"added": {}}]',19,1,1),
 (93,'2022-08-10 03:28:29.405809','J3','Salón 4 Cafam Madelena','[{"added": {}}]',19,1,1),
 (94,'2022-08-10 03:28:39.026854','J4','Salón 4 Cafam Madelena','[{"added": {}}]',19,1,1),
 (95,'2022-08-10 03:28:53.548086','J5','Salón 4 Cafam Madelena','[{"changed": {"fields": ["Cod espacio"]}}]',19,1,2),
 (96,'2022-08-10 03:29:16.442490','J4','Salón 5 Cafam Madelena','[{"changed": {"fields": ["Nom espacio"]}}]',19,1,2),
 (97,'2022-08-10 03:29:23.471732','J5','Salón 6 Cafam Madelena','[{"changed": {"fields": ["Nom espacio"]}}]',19,1,2),
 (98,'2022-08-10 03:29:31.831685','J6','Salón 7 Cafam Madelena','[{"added": {}}]',19,1,1),
 (99,'2022-08-10 03:29:42.453334','J7','Salón 8 Cafam Madelena','[{"added": {}}]',19,1,1),
 (100,'2022-08-10 03:29:51.034921','J8','Salón 9 Cafam Madelena','[{"added": {}}]',19,1,1),
 (101,'2022-08-10 03:30:01.704275','J9','Salón 10 Cafam Madelena','[{"added": {}}]',19,1,1),
 (102,'2022-08-10 03:34:43.708129','0001','Sanchez Jhony','[{"added": {}}]',8,1,1),
 (103,'2022-08-10 03:35:08.436762','0002','Garcia Daniel','[{"added": {}}]',8,1,1),
 (104,'2022-08-10 03:35:26.061627','0003','Cortes Alejandro','[{"added": {}}]',8,1,1),
 (105,'2022-08-10 03:35:42.397847','0004','Garcia Viviana','[{"added": {}}]',8,1,1),
 (106,'2022-08-10 03:36:05.071899','0005','Bustos Angie','[{"added": {}}]',8,1,1),
 (107,'2022-08-10 03:36:25.179436','0006','Herrera Juan','[{"added": {}}]',8,1,1),
 (108,'2022-08-10 03:36:42.217998','0007','Ramirez Juan','[{"added": {}}]',8,1,1),
 (109,'2022-08-10 03:37:03.074648','0008','Gaviria Alejandro','[{"added": {}}]',8,1,1),
 (110,'2022-08-10 03:37:36.170182','0009','Tellez Diego','[{"added": {}}]',8,1,1),
 (111,'2022-08-10 03:37:56.600646','0010','Olaya Esteban','[{"added": {}}]',8,1,1),
 (112,'2022-08-10 03:38:33.217042','1','1 2022-08-10','[{"added": {}}]',15,1,1),
 (113,'2022-08-10 03:38:39.465530','2','2 2022-08-10','[{"added": {}}]',15,1,1),
 (114,'2022-08-10 03:39:14.051893','3','3 2022-08-10','[{"added": {}}]',15,1,1),
 (115,'2022-08-10 03:39:23.832777','4','4 2022-08-10','[{"added": {}}]',15,1,1),
 (116,'2022-08-10 03:39:37.436037','5','5 2022-08-10','[{"added": {}}]',15,1,1),
 (117,'2022-08-10 03:40:04.591608','5','5 2022-08-10','[{"changed": {"fields": ["Espacio"]}}]',15,1,2),
 (118,'2022-08-10 03:40:12.442158','4','4 2022-08-10','[{"changed": {"fields": ["Espacio"]}}]',15,1,2),
 (119,'2022-08-10 03:40:18.563196','3','3 2022-08-10','[{"changed": {"fields": ["Espacio"]}}]',15,1,2),
 (120,'2022-08-10 03:42:54.792968','6','6 2022-08-10','[{"added": {}}]',15,1,1),
 (121,'2022-08-10 03:43:09.601282','7','7 2022-08-10','[{"added": {}}]',15,1,1),
 (122,'2022-08-10 03:43:13.022194','8','8 2022-08-10','[{"added": {}}]',15,1,1),
 (123,'2022-08-10 03:43:35.199543','9','9 2022-08-10','[{"added": {}}]',15,1,1),
 (124,'2022-08-10 03:43:43.293226','10','10 2022-08-10','[{"added": {}}]',15,1,1),
 (125,'2022-08-10 03:43:51.405931','11','11 2022-08-10','[{"added": {}}]',15,1,1),
 (126,'2022-08-10 03:45:18.592122','20221020001','PEDRAZA MARTINEZ DANA JULIETH','[{"added": {}}]',9,1,1),
 (127,'2022-08-10 03:45:43.346912','20221020002','FRANCO PINILLA NICOLAS GUSTAVO','[{"added": {}}]',9,1,1),
 (128,'2022-08-10 03:46:04.475095','20221020003','JIMENEZ VILLAREAL ANDERSON CAMILO','[{"added": {}}]',9,1,1),
 (129,'2022-08-10 03:53:32.684831','20221020004','ZAMBRANO VASQUEZ SANTIAGO ANDRES','[{"added": {}}]',9,1,1),
 (130,'2022-08-10 03:53:54.793207','20221020005','OSORIO GONZALEZ JUAN DAVID','[{"added": {}}]',9,1,1),
 (131,'2022-08-10 03:54:19.414571','20221020006','CRESPO JAMIOY EDISSON DAVID','[{"added": {}}]',9,1,1),
 (132,'2022-08-10 03:54:44.241073','20221020007','AGUILAR PALACIOS KAROL ESTEFANIA','[{"added": {}}]',9,1,1),
 (133,'2022-08-10 03:55:35.680288','20221020008','FRANCO PINILLA DANA JULIETH','[{"added": {}}]',9,1,1),
 (134,'2022-08-10 03:56:16.386332','20221020009','PEDRAZA MARTINEZ NICOLAS GUSTAVO','[{"added": {}}]',9,1,1),
 (135,'2022-08-10 03:56:45.248020','20221020010','ZAMBRANO VASQUEZ ANDERSON CAMILO','[{"added": {}}]',9,1,1),
 (136,'2022-08-10 03:58:36.381160','1','Domingo','[{"added": {}}]',18,1,1),
 (137,'2022-08-10 03:58:41.542578','2','Lunes','[{"added": {}}]',18,1,1),
 (138,'2022-08-10 03:58:46.781991','3','Martes','[{"added": {}}]',18,1,1),
 (139,'2022-08-10 03:58:57.106419','4','Miércoles','[{"added": {}}]',18,1,1),
 (140,'2022-08-10 03:59:02.088135','5','Jueves','[{"added": {}}]',18,1,1),
 (141,'2022-08-10 03:59:10.572075','6','Viernes','[{"added": {}}]',18,1,1),
 (142,'2022-08-10 03:59:20.417268','7','Sábado','[{"added": {}}]',18,1,1);
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2022-08-10 02:43:34.845667'),
 (2,'auth','0001_initial','2022-08-10 02:43:34.869843'),
 (3,'admin','0001_initial','2022-08-10 02:43:34.885043'),
 (4,'admin','0002_logentry_remove_auto_add','2022-08-10 02:43:34.899351'),
 (5,'admin','0003_logentry_add_action_flag_choices','2022-08-10 02:43:34.915986'),
 (6,'contenttypes','0002_remove_content_type_name','2022-08-10 02:43:34.945306'),
 (7,'auth','0002_alter_permission_name_max_length','2022-08-10 02:43:34.958134'),
 (8,'auth','0003_alter_user_email_max_length','2022-08-10 02:43:34.973110'),
 (9,'auth','0004_alter_user_username_opts','2022-08-10 02:43:34.984721'),
 (10,'auth','0005_alter_user_last_login_null','2022-08-10 02:43:34.998806'),
 (11,'auth','0006_require_contenttypes_0002','2022-08-10 02:43:35.002520'),
 (12,'auth','0007_alter_validators_add_error_messages','2022-08-10 02:43:35.013674'),
 (13,'auth','0008_alter_user_username_max_length','2022-08-10 02:43:35.028687'),
 (14,'auth','0009_alter_user_last_name_max_length','2022-08-10 02:43:35.052594'),
 (15,'auth','0010_alter_group_name_max_length','2022-08-10 02:43:35.078682'),
 (16,'auth','0011_update_proxy_permissions','2022-08-10 02:43:35.091020'),
 (17,'auth','0012_alter_user_first_name_max_length','2022-08-10 02:43:35.116435'),
 (18,'programming','0001_initial','2022-08-10 02:43:35.142595'),
 (19,'users','0001_initial','2022-08-10 02:43:35.211117'),
 (20,'sports','0001_initial','2022-08-10 02:43:35.251578'),
 (21,'programming','0002_initial','2022-08-10 02:43:35.451462'),
 (22,'sessions','0001_initial','2022-08-10 02:43:35.467088'),
 (23,'teams','0001_initial','2022-08-10 02:43:35.558567');
CREATE INDEX IF NOT EXISTS "teams_asismiembroequipo_programacion_id_45fa87eb" ON "teams_asismiembroequipo" (
	"programacion_id"
);
CREATE INDEX IF NOT EXISTS "teams_asismiembroequipo_miembro_equipo_id_3c8029ab" ON "teams_asismiembroequipo" (
	"miembro_equipo_id"
);
CREATE INDEX IF NOT EXISTS "teams_miembroequipo_estudiante_id_e019a3c3" ON "teams_miembroequipo" (
	"estudiante_id"
);
CREATE INDEX IF NOT EXISTS "teams_miembroequipo_equipo_id_852bb46e" ON "teams_miembroequipo" (
	"equipo_id"
);
CREATE INDEX IF NOT EXISTS "teams_equipo_empleado_id_87cf0fb7" ON "teams_equipo" (
	"empleado_id"
);
CREATE INDEX IF NOT EXISTS "teams_equipo_deporte_id_525bef07" ON "teams_equipo" (
	"deporte_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "programming_espacio_tipo_espacio_id_b34d022f" ON "programming_espacio" (
	"tipo_espacio_id"
);
CREATE INDEX IF NOT EXISTS "programming_inscritopractlibre_programacion_id_fa5eb95d" ON "programming_inscritopractlibre" (
	"programacion_id"
);
CREATE INDEX IF NOT EXISTS "programming_inscritopractlibre_estudiante_id_bc7ac244" ON "programming_inscritopractlibre" (
	"estudiante_id"
);
CREATE INDEX IF NOT EXISTS "programming_inscritopractlibre_empleado_id_7a2300d0" ON "programming_inscritopractlibre" (
	"empleado_id"
);
CREATE INDEX IF NOT EXISTS "programming_prestamo_elemento_deportivo_id_255d674c" ON "programming_prestamo" (
	"elemento_deportivo_id"
);
CREATE INDEX IF NOT EXISTS "programming_prestamo_asis_responsable_id_8df45299" ON "programming_prestamo" (
	"asis_responsable_id"
);
CREATE INDEX IF NOT EXISTS "programming_programacion_periodo_id_bb23bab8" ON "programming_programacion" (
	"periodo_id"
);
CREATE INDEX IF NOT EXISTS "programming_programacion_hora_inicio_id_792e12d8" ON "programming_programacion" (
	"hora_inicio_id"
);
CREATE INDEX IF NOT EXISTS "programming_programacion_espacio_id_e00f3239" ON "programming_programacion" (
	"espacio_id"
);
CREATE INDEX IF NOT EXISTS "programming_programacion_dia_id_6195e384" ON "programming_programacion" (
	"dia_id"
);
CREATE INDEX IF NOT EXISTS "programming_programacion_deporte_fk_id_b5b49465" ON "programming_programacion" (
	"deporte_fk_id"
);
CREATE INDEX IF NOT EXISTS "programming_programacion_actividad_id_ea82119a" ON "programming_programacion" (
	"actividad_id"
);
CREATE INDEX IF NOT EXISTS "sports_deporte_tipo_elemento_tipoelemento_id_4df2ada4" ON "sports_deporte_tipo_elemento" (
	"tipoelemento_id"
);
CREATE INDEX IF NOT EXISTS "sports_deporte_tipo_elemento_deporte_id_7e3d00ab" ON "sports_deporte_tipo_elemento" (
	"deporte_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "sports_deporte_tipo_elemento_deporte_id_tipoelemento_id_2016fc48_uniq" ON "sports_deporte_tipo_elemento" (
	"deporte_id",
	"tipoelemento_id"
);
CREATE INDEX IF NOT EXISTS "sports_deporte_espacio_espacio_id_2c9d14aa" ON "sports_deporte_espacio" (
	"espacio_id"
);
CREATE INDEX IF NOT EXISTS "sports_deporte_espacio_deporte_id_2fc7f2e2" ON "sports_deporte_espacio" (
	"deporte_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "sports_deporte_espacio_deporte_id_espacio_id_96f6559c_uniq" ON "sports_deporte_espacio" (
	"deporte_id",
	"espacio_id"
);
CREATE INDEX IF NOT EXISTS "sports_elementodeportivo_tipo_elemento_id_a6933804" ON "sports_elementodeportivo" (
	"tipo_elemento_id"
);
CREATE INDEX IF NOT EXISTS "sports_elementodeportivo_marca_id_7fadd66e" ON "sports_elementodeportivo" (
	"marca_id"
);
CREATE INDEX IF NOT EXISTS "sports_elementodeportivo_estado_id_266a7739" ON "sports_elementodeportivo" (
	"estado_id"
);
CREATE INDEX IF NOT EXISTS "sports_elementodeportivo_espacio_id_f23b7d3a" ON "sports_elementodeportivo" (
	"espacio_id"
);
CREATE INDEX IF NOT EXISTS "users_asisresponsable_responsable_id_587bf36a" ON "users_asisresponsable" (
	"responsable_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "users_asisresponsable_consec_asis_responsable_responsable_id_b117c7ac_uniq" ON "users_asisresponsable" (
	"consec_asis_responsable",
	"responsable_id"
);
CREATE INDEX IF NOT EXISTS "users_empleadocargo_espacio_id_546fc24d" ON "users_empleadocargo" (
	"espacio_id"
);
CREATE INDEX IF NOT EXISTS "users_empleadocargo_empleado_id_e674cb00" ON "users_empleadocargo" (
	"empleado_id"
);
CREATE INDEX IF NOT EXISTS "users_empleadocargo_cargo_id_80278e65" ON "users_empleadocargo" (
	"cargo_id"
);
CREATE INDEX IF NOT EXISTS "users_persona_id_tipo_documento_id_8bf9b37e" ON "users_persona" (
	"id_tipo_documento_id"
);
CREATE INDEX IF NOT EXISTS "users_responsable_rol_id_58d94007" ON "users_responsable" (
	"rol_id"
);
CREATE INDEX IF NOT EXISTS "users_responsable_programacion_id_bd46b634" ON "users_responsable" (
	"programacion_id"
);
CREATE INDEX IF NOT EXISTS "users_responsable_estudiante_id_6b09e19d" ON "users_responsable" (
	"estudiante_id"
);
CREATE INDEX IF NOT EXISTS "users_responsable_empleado_id_908a795a" ON "users_responsable" (
	"empleado_id"
);
CREATE INDEX IF NOT EXISTS "users_estudiante_espacio_id_4bbedfd0" ON "users_estudiante" (
	"espacio_id"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
COMMIT;
