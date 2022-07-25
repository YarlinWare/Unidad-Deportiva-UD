
-- Carga de datos

-- 1 Inscripcion de deportes
INSERT INTO sports_deporte
    VALUES('ATH','Atletismo', 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_deporte
    VALUES('BDM','Bádminton', 2, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO sports_deporte
    VALUES('BKB','Baloncesto', 5, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO sports_deporte
    VALUES('HBL','Balonmano', 7, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO sports_deporte
    VALUES('BSB','Béisbol Sóftbol', 9, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO sports_deporte
    VALUES('BTH','Biatlón', 8, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO sports_deporte
    VALUES('BOX','Boxeo', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO sports_deporte
    VALUES('BMF','Ciclismo BMX Freestyle', 10, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('BMX','Ciclismo BMX Racing', 10, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('MTB','Ciclismo de Montaña', 50, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('CTR','Ciclismo de Pista', 24, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('CRD','Ciclismo de Ruta', 30, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('CLB','Escalada Deportiva', 8, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('FEN','Esgrima', 2, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('FBL','Fútbol', 11, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('FBS','Fútbol Sala', 5, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('GAC','Gimnasia Acrobática', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('GAR','Gimnasia Artística', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('GTR','Gimnasia en Trampolín', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('GRY','Gimnasia Rítmica', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('GLF','Golf', 2, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('HOC','Hockey sobre Césped', 11, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('IHO','Hockey sobre Hielo', 6, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('JUD','Judo', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('KTE','Karate', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('WRE','Lucha', 1, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('SWM','Natación', 2, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('OWS','Natación Aguas Abiertas', 6, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('SWA','Natación Artística', 8, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
    
INSERT INTO sports_deporte
    VALUES('FSK','Patinaje Artístico', 2, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

-- 2. Carga datos tipo persona
INSERT INTO users_tipopersona
    VALUES ('1','Administrador', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO users_tipopersona
    VALUES ('2','Comisario',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

-- 3. Inscribir personas Auth-user
INSERT INTO auth_user (id,first_name,last_name,username,email,password, last_login, date_joined)
	VALUES 	('2', 'Elon', 'Musk', 'Elon', 'elon@olimpiadas.udistrital.co', '12346578', CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO auth_user (id,first_name,last_name,username,email,password, last_login, date_joined)
    VALUES ('3', 'Bernard', 'Arnault', 'bernard', 'Bernard@olimpiadas.udistrital.co', '12346578', CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO auth_user (id,first_name,last_name,username,email,password, last_login, date_joined)
    VALUES ('4', 'Bill', 'Gates', 'Bill', 'bill@olimpiadas.udistrital.co', '12346578', CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO auth_user (id,first_name,last_name,username,email,password, last_login, date_joined)
    VALUES ('5', 'Mark', 'Zuckerberg', 'Mark', 'mark@olimpiadas.udistrital.co', '12346578', CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO auth_user (id,first_name,last_name,username,email,password, last_login, date_joined)
    VALUES ('6', 'Warren', 'Buffett', 'Warren', 'warren@olimpiadas.udistrital.co', '12346578', CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO auth_user (id,first_name,last_name,username,email,password, last_login, date_joined)
    VALUES ('7', 'Larry', 'Ellison', 'Larry', 'larry@olimpiadas.udistrital.co', '12346578', CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO auth_user (id,first_name,last_name,username,email,password, last_login, date_joined)
    VALUES ('8', 'Larry', 'Page', 'Larry323', 'larry@olimpiadas.udistrital.co', '12346578', CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO auth_user (id,first_name,last_name,username,email,password, last_login, date_joined)
    VALUES ('9', 'Sergey', 'Brin', 'Sergey', 'sergey@olimpiadas.udistrital.co', '12346578', CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO auth_user (id,first_name,last_name,username,email,password, last_login, date_joined)
    VALUES ('10', 'Mukesh', 'Ambani', 'Mukesh', 'mukesh@olimpiadas.udistrital.co', '12346578', CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
INSERT INTO auth_user (id,first_name,last_name,username,email,password, last_login, date_joined)
    VALUES ('11', 'Jeff', 'Bezos', 'Jeff', 'jeff@olimpiadas.udistrital.co', '12346578', CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
-- 3.1. Inscribir personas
INSERT INTO users_persona (cod_persona, created, updated, user_id, id_tipo_persona_fk_id)
	VALUES ('0111', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '11', '1');
INSERT INTO users_persona (cod_persona, created, updated, user_id, id_tipo_persona_fk_id)
	VALUES ('0091', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '2', '2');
INSERT INTO users_persona (cod_persona, created, updated, user_id, id_tipo_persona_fk_id)
	VALUES ('0121', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '3', '2');
INSERT INTO users_persona (cod_persona, created, updated, user_id, id_tipo_persona_fk_id)
	VALUES ('0054', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '4', '2');
INSERT INTO users_persona (cod_persona, created, updated, user_id, id_tipo_persona_fk_id)
	VALUES ('0037', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '5', '1');
INSERT INTO users_persona (cod_persona, created, updated, user_id, id_tipo_persona_fk_id)
	VALUES ('0061', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '6', '2');
INSERT INTO users_persona (cod_persona, created, updated, user_id, id_tipo_persona_fk_id)
	VALUES ('0087', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '7', '2');
INSERT INTO users_persona (cod_persona, created, updated, user_id, id_tipo_persona_fk_id)
	VALUES ('0007', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '8', '2');
INSERT INTO users_persona (cod_persona, created, updated, user_id, id_tipo_persona_fk_id)
	VALUES ('0023', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '9', '2');
INSERT INTO users_persona (cod_persona, created, updated, user_id, id_tipo_persona_fk_id)
	VALUES ('0011', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '10', '2');

-- 4. Carga datos de sedes
-- TO DO (cod_persona, created, updated, user_id, id_tipo_persona_fk_id)

INSERT INTO campus_sede 
	VALUES 	('00001','Soccer City', 90000, 'Sudáfrica', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_sede 
	VALUES 	('00002','Rungardo May Day', 90000, 'Corea del Norte', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_sede 
	VALUES 	('00003','Signal Iduna Park', 90000, 'Alemania', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_sede 
	VALUES 	('00004','Old Trafford', 90000, 'Inglaterra', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_sede 
	VALUES 	('00005','Estadio Nacional de Pekín', 90000, 'China', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_sede 
	VALUES 	('00006','Estadio Alberto José Armando', 90000, 'Argentina', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_sede 
	VALUES 	('00007','E. Antonio Vespucio Liberti', 90000, 'Argentina', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_sede 
	VALUES 	('00008','Estadio Azteca', 90000, 'México', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_sede 
	VALUES 	('00009','Estadio Wembley', 90000, 'Inglaterra', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_sede 
	VALUES 	('00010','Estadio Da Luz', 90000, 'Portugal', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_sede 
	VALUES 	('00012','Estadio Maracaná', 90000, 'Brasil', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_sede 
	VALUES 	('00013','Estadio Giuseppe Meazza', 90000, 'Italia', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_sede 
	VALUES 	('00014','Allianz Aren', 90000, 'Alemania', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_sede 
	VALUES 	('00015','Estadio Santiago Bernabeu', 90000, 'España', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_sede 
	VALUES 	('00016','Estadio Camp Nou', 90000, 'España', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Unicos
/*
INSERT INTO campus_unico
	VALUES 	('0001', 200, '00001', 'FBL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_unico (id_unico,area_unico,id_complejo_fk_id,id_deporte_fk_id,created,updated)
	VALUES 	('0002', 200, '00001', 'FBL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_unico (id_unico,area_unico,id_complejo_fk_id,id_deporte_fk_id,created,updated)
	VALUES 	('0003', 200, '00001', 'FBL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_unico (id_unico,area_unico,id_complejo_fk_id,id_deporte_fk_id,created,updated)
	VALUES 	('0004', 200, '00001', 'FBL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_unico (id_unico,area_unico,id_complejo_fk_id,id_deporte_fk_id,created,updated)
	VALUES 	('0005', 200, '00001', 'FBL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_unico (id_unico,area_unico,id_complejo_fk_id,id_deporte_fk_id,created,updated)
	VALUES 	('0006', 200, '00001', 'FBL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
*/
-- polideportivos
/*
INSERT INTO campus_polideportivo
	VALUES 	('0007', '00001', 'ATH', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_polideportivo
	VALUES 	('0008', '00001', 'BDM', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_polideportivo
	VALUES 	('0009', '00001', 'BKB', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_polideportivo
	VALUES 	('0010', '00001', 'HBL', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_polideportivo
	VALUES 	('0011', '00001', 'BSB', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_polideportivo
	VALUES 	('0012', '00001', 'BTH', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_polideportivo
	VALUES 	('0013', '00001', 'BOX', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_polideportivo
	VALUES 	('0014', '00001', 'BMF', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_polideportivo
	VALUES 	('0015', '00001', 'BMX', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_polideportivo
	VALUES 	('0016', '00001', 'MTB', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_polideportivo
	VALUES 	('0017', '00001', 'CTR', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_polideportivo
	VALUES 	('0018', '00001', 'BMX', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
*/

-- 5 Registrar 20 equipos deporte
-- (id_equipo, nom_equipo, n_partes, created, updated)
INSERT INTO sports_equipo
	VALUES 	('001','Bicicleta', 100, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('002','Palo de golf', 300, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('003','Bicicleta fija', 50, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('004','Espinilleras', 200, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('005','Bate de béisbol', 425, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('006','Balón de baloncesto', 80, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('007','Patín sobre ruedas', 40, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('008','Traje de baño', 600, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('009','Raqueta', 83, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('010','Calzado deportivo', 758, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('011','Balón de fútbol', 263, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('012','Bicicleta de montaña', 111, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('013','Balón de voleibol', 80, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('014','Pelota de tenis', 999, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('015','Pelota de golf', 999, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('016','Guantes', 98, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('017','Volante de bádminton', 50, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('018','Guante de boxeo', 63, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('019','Headgear', 60, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_equipo
	VALUES 	('020','Pelota de béisbol', 999, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Tabla de rompimiento deporte/equipo (id, deporte_id, equipo_id)
INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(1,'FBL','011');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(2,'BMF','001');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(3,'BMX','001');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(4,'MTB','012');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(5,'CTR','003');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(6,'FBL','004');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(7,'FBL','016');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(8,'BOX','018');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(9,'BOX','019');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(10,'SWM','008');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(11,'OWS','008');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(12,'SWA','008');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES  (13,'FSK','007');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(14,'BKB','006');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(15,'BDM','017');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(16,'FBS','011');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(17,'BSB','005');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(18,'BSB','020');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(19,'FBS','004');

INSERT INTO sports_deporte_id_equipo_fk (id, deporte_id, equipo_id)
	VALUES 	(20,'FBS','016');


-- 7. Carga datos de estado
INSERT INTO sports_estado (id_estado, desc_estado, created, updated)
	VALUES 	('1','Libre', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_estado (id_estado, desc_estado, created, updated)
	VALUES ('2','Dañado', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_estado (id_estado, desc_estado, created, updated)
	VALUES ('3','Perdido', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_estado (id_estado, desc_estado, created, updated)
	VALUES ('4','Prestado', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_estado (id_estado, desc_estado, created, updated)
	VALUES ('5','Préstamo evento', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_estado (id_estado, desc_estado, created, updated)
	VALUES ('6','Préstamo práctica', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 8. Carga datos de Tareas
INSERT INTO users_tarea (id_tarea, desc_tarea, created, updated)
	VALUES 	('1','Juez', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO users_tarea (id_tarea, desc_tarea, created, updated)
	VALUES 	('2','Observador', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Otros
INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('001','Centro', 'Centro', '00001', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('002','Esquina N', 'Norte', '00001', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('003','Esquina NE', 'Nort-Este', '00001', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('004','Esquina NO', 'Nort-Oeste', '00001', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('005','Esquina S', 'Sur', '00001', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('006','Esquina SE', 'Sur-Este', '00001', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('007','Esquina SO', 'Sur-Oeste', '00001', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('008','Esquina E', 'Este', '00001', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('009','Esquina O', 'Oeste', '00001', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES  ('010','Centro', 'Centro', '00002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('011','Esquina N', 'Norte', '00002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('012','Esquina NE', 'Nort-Este', '00002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('013','Esquina NO', 'Nort-Oeste', '00002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('014','Esquina S', 'Sur', '00002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('015','Esquina SE', 'Sur-Este', '00002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('016','Esquina SO', 'Sur-Oeste', '00002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('017','Esquina E', 'Este', '00002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('018','Esquina O', 'Oeste', '00002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES  ('019','Centro', 'Centro', '00003', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('020','Esquina N', 'Norte', '00003', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('021','Esquina NE', 'Nort-Este', '00003', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('022','Esquina NO', 'Nort-Oeste', '00003', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('023','Esquina S', 'Sur', '00003', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('024','Esquina SE', 'Sur-Este', '00003', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('025','Esquina SO', 'Sur-Oeste', '00003', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('026','Esquina E', 'Este', '00003', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('027','Esquina O', 'Oeste', '00003', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES  ('028','Centro', 'Centro', '00004', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('029','Esquina N', 'Norte', '00004', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('030','Esquina NE', 'Nort-Este', '00004', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('031','Esquina NO', 'Nort-Oeste', '00004', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('032','Esquina S', 'Sur', '00004', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('033','Esquina SE', 'Sur-Este', '00004', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('034','Esquina SO', 'Sur-Oeste', '00004', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('035','Esquina E', 'Este', '00004', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO campus_area (id_area, nom_area, ubicacion, id_complejo_fk_id, created, updated)
	VALUES 	('036','Esquina O', 'Oeste', '00004', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Eventos
-- (consec_evento, fecha_hora, duracion, n_participante, id_complejo_fk_id, id_deporte_fk_id, id_area_fk_id, cod_persona_fk_id, created, updated)
-- HH24:MI:SS.FF
INSERT INTO campus_evento
	VALUES (1, CURRENT_DATE, TO_DATE('21:02:44', 'hh24:mi:ss'), 8, '00001', 'FBL', '003', '0111', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_evento
	VALUES (2, CURRENT_DATE, TO_DATE('21:02:44', 'hh24:mi:ss'), 8, '00002', 'FBL', '002', '0054', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Agregar inventario
-- (consec_inventario, n_piezas, id_complejo_fk_id, id_estado_fk_id, id_equipo_fk_id, created, updated)
INSERT INTO sports_inventario
	VALUES 	(1, 600, '00001', 1, '001', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES  (2, 600, '00001', 1, '002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(3, 600, '00001', 1, '003', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(4, 600, '00001', 1, '004', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(5, 600, '00001', 1, '005', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(6, 600, '00001', 1, '006', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(7, 600, '00001', 1, '007', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(8, 600, '00001', 1, '008', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(9, 600, '00001', 1, '009', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(10, 600, '00001', 1, '010', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(11, 600, '00001', 1, '011', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(12, 600, '00001', 1, '012', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(13, 600, '00001', 1, '013', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(14, 600, '00001', 1, '014', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(15, 600, '00001', 1, '015', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(16, 600, '00001', 1, '016', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(17, 600, '00001', 1, '017', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(18, 600, '00001', 1, '018', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(19, 600, '00001', 1, '019', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(20, 600, '00001', 1, '020', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES  (21, 600, '00002', 1, '001', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(22, 600, '00002', 1, '002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(23, 600, '00002', 1, '003', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(24, 600, '00002', 1, '004', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(25, 600, '00002', 1, '005', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(26, 600, '00002', 1, '006', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(27, 600, '00002', 1, '007', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(28, 600, '00002', 1, '008', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(29, 600, '00002', 1, '009', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(30, 600, '00002', 1, '010', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(31, 600, '00002', 1, '011', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(32, 600, '00002', 1, '012', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(33, 600, '00002', 1, '013', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(34, 600, '00002', 1, '014', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(35, 600, '00002', 1, '015', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(36, 600, '00002', 1, '016', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(37, 600, '00002', 1, '017', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(38, 600, '00002', 1, '018', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(39, 600, '00002', 1, '019', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sports_inventario
	VALUES 	(40, 600, '00002', 1, '020', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Agregar prestamos
-- (consec_prestamo, fecha_prestamo, cod_persona_fk_id, id_estado_fk_id, consec_inventario_fk_id, created, updated)
INSERT INTO sports_prestamo 
	VALUES 	('1', CURRENT_DATE, '0111', '1', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_prestamo 
	VALUES 	('2', CURRENT_DATE, '0091', '2', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_prestamo 
	VALUES  ('3', CURRENT_DATE, '0121', '3', 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_prestamo 
	VALUES  ('4', CURRENT_DATE, '0054', '4', 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_prestamo 
	VALUES  ('5', CURRENT_DATE, '0037', '5', 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_prestamo 
	VALUES  ('6', CURRENT_DATE, '0061', '6', 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_prestamo 
	VALUES  ('7', CURRENT_DATE, '0087', '1', 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_prestamo 
	VALUES  ('8', CURRENT_DATE, '0007', '2', 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_prestamo 
	VALUES  ('9', CURRENT_DATE, '0023', '3', 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sports_prestamo 
	VALUES  ('10', CURRENT_DATE, '0011', '4', 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
