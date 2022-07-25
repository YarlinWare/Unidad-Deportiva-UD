## Crear tablas
#### Sede

```
CREATE SEQUENCE auth_user_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 216
   NOCACHE 
   NOORDER 
   NOCYCLE;

```
#### Sede

```
CREATE TABLE campus_sede(
    id_complejo  CHAR(5)		NOT NULL,
    nom_complejo VARCHAR(30)	NOT NULL,
    presupuesto  NUMBER(7,2)	NOT NULL,
    direccion    VARCHAR(30)	NOT NULL,
    created      DATE,
    updated      DATE,
    CONSTRAINT campus_sede_id_complejo PRIMARY KEY (id_complejo)
);

```
#### Deporte

```
CREATE TABLE sports_deporte(
    id_deporte        VARCHAR(4)    NOT NULL,
    nom_deporte       VARCHAR(30)   NOT NULL,
    n_max_integrantes NUMBER(2,0)   NOT NULL,
    created           DATE,
    updated           DATE,
    CONSTRAINT sports_deporte_id_deporte PRIMARY KEY (id_deporte)
);

```
#### Sede único

```
CREATE TABLE campus_unico(
    id_unico			VARCHAR(4)    NOT NULL,
    area_unico			NUMBER(4,2)  NOT NULL,
    id_complejo_fk_id	CHAR(5),
    id_deporte_fk_id	VARCHAR(4),
    created             DATE,
    updated             DATE,
    CONSTRAINT campus_unico_id_unico PRIMARY KEY (id_unico),
    CONSTRAINT campus_unico_id_complejo_fk_id FOREIGN KEY (id_complejo_fk_id) REFERENCES campus_sede (id_complejo),
    CONSTRAINT campus_unico_id_deporte_fk_id  FOREIGN KEY (id_deporte_fk_id)  REFERENCES sports_deporte(id_deporte)
);

```
#### Sede área

```
CREATE TABLE campus_area(
    id_area				VARCHAR(3)   NOT NULL,
    nom_area			VARCHAR(10)  NOT NULL,
    ubicacion			VARCHAR(30)  NOT NULL,
    id_complejo_fk_id	CHAR(5),
    created             DATE,
    updated             DATE,
    CONSTRAINT campus_area_id_area PRIMARY KEY (id_area),
    CONSTRAINT campus_area_id_complejo_fk_id FOREIGN KEY (id_complejo_fk_id) REFERENCES campus_sede (id_complejo)
);

```
#### Área polideportivo

```
CREATE TABLE campus_polideportivo(
    id_poli				VARCHAR(4) NOT NULL,
    id_area_fk_id		VARCHAR(3) NOT NULL,
    id_deporte_fk_id	VARCHAR(4) NOT NULL,
    created             DATE,
    updated             DATE,
    CONSTRAINT cam_polidep_id_poli PRIMARY KEY (id_poli),
    CONSTRAINT cam_polidep_id_area_fk_id FOREIGN KEY (id_area_fk_id) REFERENCES campus_area (id_area),
    CONSTRAINT cam_polidep_id_deporte_fk_id FOREIGN KEY (id_deporte_fk_id) REFERENCES sports_deporte(id_deporte)
);

```
#### Tipo Persona

```
CREATE TABLE users_tipopersona(
    id_tipo_persona     VARCHAR(3)   NOT NULL,
    desc_tipo_persona   VARCHAR(30)  NOT NULL,
    created             DATE,
    updated             DATE,
    CONSTRAINT users_tipperson_id_tiperson PRIMARY KEY (id_tipo_persona)
);

```
#### auth_user Django

```
CREATE TABLE auth_user(
    id              NUMBER(5)
    CONSTRAINT auth_user_id_nn NOT NULL,
    password        VARCHAR(128) NOT NULL,
    last_login      DATE,
    --is_superuser    BOOLEAN,
    username        VARCHAR(150) NOT NULL,
    first_name      VARCHAR(150) NOT NULL,
    last_name       VARCHAR(150) NOT NULL,
    email           VARCHAR(254) NOT NULL,
    --is_staff        BOOLEAN,
    --is_active       BOOLEAN,
    date_joined     DATE,
    CONSTRAINT auth_user_id_pk PRIMARY KEY (id)
);

```
#### Persona

```
CREATE TABLE users_persona(
    cod_persona      VARCHAR(4)  NOT NULL,
    id_tipo_persona_fk_id   VARCHAR(3)  NOT NULL,
    user_id integer NOT NULL,
    created DATE,
    updated DATE,
    CONSTRAINT us_person_cod_persona PRIMARY KEY (cod_persona),
    CONSTRAINT us_person_id_tipperson_fk_id FOREIGN KEY (id_tipo_persona_fk_id) REFERENCES users_tipopersona (id_tipo_persona),
    CONSTRAINT us_person_user_id FOREIGN KEY (user_id) REFERENCES auth_user (id)
);

```
#### Evento

```
CREATE TABLE campus_evento(
    consec_evento		NUMBER(5,0)	NOT NULL,
    fecha_hora			DATE			NOT NULL,
    duracion			TIMESTAMP		NOT NULL,
    n_participante		NUMBER(3,0)	NOT NULL,
    id_complejo_fk_id	CHAR(5)			NOT NULL,
    id_deporte_fk_id	VARCHAR(4)		NOT NULL,
    id_area_fk_id		VARCHAR(3),
    cod_persona_fk_id	VARCHAR(4)		NOT NULL,
    created             DATE,
    updated             DATE,
    CONSTRAINT campus_event_consec_evento PRIMARY KEY (consec_evento),
    CONSTRAINT campus_event_id_comple_fk_id	FOREIGN KEY (id_complejo_fk_id) REFERENCES campus_sede (id_complejo),
    CONSTRAINT campus_event_id_deporte_fk_id	FOREIGN KEY (id_deporte_fk_id)	REFERENCES sports_deporte (id_deporte),
    CONSTRAINT campus_event_id_area_fk_id		FOREIGN KEY (id_area_fk_id)		REFERENCES campus_area (id_area),
    CONSTRAINT campus_event_cod_persona_fk_id	FOREIGN KEY (cod_persona_fk_id) REFERENCES users_persona (cod_persona)
);

```
#### Estado

```
CREATE TABLE sports_estado(
    id_estado    VARCHAR(2)  NOT NULL,
    desc_estado  VARCHAR(30) NOT NULL,
    created      DATE,
    updated      DATE,
    CONSTRAINT sports_estado_id_estado PRIMARY KEY (id_estado)
);

```
#### Equipo

```
CREATE TABLE sports_equipo(
    id_equipo    VARCHAR(3)   NOT NULL,
    nom_equipo   VARCHAR(30)  NOT NULL,
    n_partes     NUMBER(4,0)  NOT NULL,
    created      DATE,
    updated      DATE,
    CONSTRAINT sports_equipo_id_equipo PRIMARY KEY (id_equipo)
);

```
#### Inventario

```
CREATE TABLE sports_inventario(
    consec_inventario	NUMBER(4,0)	NOT NULL,
    n_piezas			NUMBER(3,0)	NOT NULL,
    id_complejo_fk_id	CHAR(5)		NOT NULL,
    id_estado_fk_id		VARCHAR(2)	NOT NULL,
    id_equipo_fk_id		VARCHAR(3)	NOT NULL,
    created             DATE,
    updated             DATE,
    CONSTRAINT sports_inven_consec_inven PRIMARY KEY (consec_inventario),
    CONSTRAINT sports_inven_id_complejo_fk_id FOREIGN KEY (id_complejo_fk_id) REFERENCES campus_sede (id_complejo),
    CONSTRAINT sports_inven_id_estado_fk_id   FOREIGN KEY (id_estado_fk_id)   REFERENCES sports_estado (id_estado),
    CONSTRAINT sports_inven_id_equipo_fk_id   FOREIGN KEY (id_equipo_fk_id)   REFERENCES sports_equipo (id_equipo)
);

```
#### Deporte 2

```
CREATE TABLE sports_deporte2(
    id_deporte        VARCHAR(3)	NOT NULL,
    nom_deporte       VARCHAR(30)   NOT NULL,
    n_max_integrantes NUMBER(2,0)   NOT NULL,
    created                         DATE,
    updated                         DATE,
    CONSTRAINT sports_deporte2_id_deporte PRIMARY KEY (id_deporte)
);

```
#### Prestamo

```
CREATE TABLE sports_prestamo(
    consec_prestamo				VARCHAR(3)		NOT NULL,
    fecha_prestamo				DATE			NOT NULL,
    cod_persona_fk_id			VARCHAR(4)		NOT NULL,
    id_estado_fk_id				VARCHAR(2)		NOT NULL,
    consec_inventario_fk_id		NUMBER(4,0)	NOT NULL,
    created                     DATE,
    updated                     DATE,
    CONSTRAINT sp_prest_consec_prestamo PRIMARY KEY (consec_prestamo),
    CONSTRAINT sp_prest_cod_persona_fk_id FOREIGN KEY (cod_persona_fk_id) REFERENCES users_persona (cod_persona),
    CONSTRAINT sp_prest_id_estado_fk_id FOREIGN KEY (id_estado_fk_id) REFERENCES sports_estado (id_estado),
    CONSTRAINT sp_prest_consec_inven_fk_id FOREIGN KEY (consec_inventario_fk_id) REFERENCES sports_inventario (consec_inventario)
);

```
#### Tarea

```
CREATE TABLE users_tarea(
    id_tarea     VARCHAR(3)		NOT NULL,
    desc_tarea   VARCHAR(20)	NOT NULL,
    created      DATE,
    updated      DATE,
    CONSTRAINT users_tarea_id_tarea PRIMARY KEY (id_tarea)
);

```
#### Comisario Evento

```
CREATE TABLE users_comisarioevento(
    consec_comisario		NUMBER(3,0)  NOT NULL,
    fecha_hora				DATE NOT NULL,
    consec_evento_fk_id		NUMBER(5,0)  NOT NULL,
    cod_persona_fk_id		VARCHAR(4)  NOT NULL,
    id_tarea_fk_id			VARCHAR(3)  NOT NULL,
    created                 DATE,
    updated                 DATE,
    CONSTRAINT us_comisevent_consec_comi PRIMARY KEY (consec_comisario),
    CONSTRAINT us_comisevent_con_event_fk_id  FOREIGN KEY (consec_evento_fk_id) REFERENCES campus_evento (consec_evento),
    CONSTRAINT us_comisevent_cod_pers_fk_id	  FOREIGN KEY (cod_persona_fk_id)   REFERENCES users_persona (cod_persona),
    CONSTRAINT us_comisevent_id_tarea_fk_id       FOREIGN KEY (id_tarea_fk_id)      REFERENCES users_tarea (id_tarea)
);

```
## Tablas de rompimiento
#### 1. Deporte/Equipo

```
CREATE TABLE sports_deporte_id_equipo_fk(
    id          NUMBER(5) NOT NULL,
    deporte_id  VARCHAR(3)  NOT NULL,
    equipo_id   VARCHAR(3)  NOT NULL,
    CONSTRAINT sp_depor_pk PRIMARY KEY (deporte_id, equipo_id),
    CONSTRAINT sp_depor_idequ_fkdepo_fk_id FOREIGN KEY (deporte_id) REFERENCES sports_deporte (id_deporte),
    CONSTRAINT sp_depor_idequ_fkequi_fk_id  FOREIGN KEY (equipo_id)  REFERENCES sports_equipo (id_equipo)
);

```
#### 2. Deporte/Persona

```
CREATE TABLE sports_deporte_cod_persona_fk(
    id          NUMBER(5)  NOT NULL,
    deporte_id  VARCHAR(3)  NOT NULL,
    persona_id  VARCHAR(4)  NOT NULL,
    CONSTRAINT deporte_persona_pk PRIMARY KEY (deporte_id, persona_id),
    CONSTRAINT sp_dep_codper_fkid_depo_fk_id  FOREIGN KEY (persona_id) REFERENCES users_persona (cod_persona),
    CONSTRAINT sp_dep_codp_fkid_codp_fk_id FOREIGN KEY (deporte_id)  REFERENCES sports_deporte (id_deporte)
);

```
#### 3. Persona/Deporte2

```
CREATE TABLE sports_deporte2_cod_persona_fk(
    id          NUMBER(5)  NOT NULL,
    persona_id  VARCHAR(4)  NOT NULL,
    deporte2_id VARCHAR(3)  NOT NULL,
    CONSTRAINT sp_dep2_codp_pk PRIMARY KEY (persona_id, deporte2_id),
    CONSTRAINT sp_dep2_codp_fkid_codp_fk_id FOREIGN KEY (persona_id) REFERENCES users_persona (cod_persona),
    CONSTRAINT sp_dep2_codp_fkid_dep2_fk_id FOREIGN KEY (deporte2_id) REFERENCES sports_deporte2 (id_deporte)
);

```
#### Corrección de errores
```
ALTER TABLE campus_sede RENAME COLUMN dirección TO direccion;

```

## Carga de datos

#### 1 Inscripcion de deportes
```
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
```
#### 2. Carga datos tipo persona
```
INSERT INTO users_tipopersona
    VALUES ('1','Administrador', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO users_tipopersona
    VALUES ('2','Comisario',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
```
#### 3. Inscribir personas Auth-user
```
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
```
#### 4. Carga datos de sedes
```
--  (cod_persona, created, updated, user_id, id_tipo_persona_fk_id)

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
```
#### 5 Registrar 20 equipos deporte
```
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
```
#### Tabla de rompimiento deporte/equipo (id, deporte_id, equipo_id)
```
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
```

#### 7. Carga datos de estado
```
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
```
#### 8. Carga datos de Tareas
```
INSERT INTO users_tarea (id_tarea, desc_tarea, created, updated)
	VALUES 	('1','Juez', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO users_tarea (id_tarea, desc_tarea, created, updated)
	VALUES 	('2','Observador', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
```
#### Otros
```
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
```
#### Eventos
```
-- (consec_evento, fecha_hora, duracion, n_participante, id_complejo_fk_id, id_deporte_fk_id, id_area_fk_id, cod_persona_fk_id, created, updated)
-- HH24:MI:SS.FF

INSERT INTO campus_evento
	VALUES (1, CURRENT_DATE, TO_DATE('21:02:44', 'hh24:mi:ss'), 8, '00001', 'FBL', '003', '0111', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO campus_evento
	VALUES (2, CURRENT_DATE, TO_DATE('21:02:44', 'hh24:mi:ss'), 8, '00002', 'FBL', '002', '0054', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
```
#### Agregar inventario
```
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
```
#### Agregar prestamos
```
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
```

#### 3.1. Seleccionar una sede a partir de una lista que contiene los nombres y ubicaciones de las sedes.
```
SELECT cs.nom_complejo, cs.direccion, CA.ubicacion
FROM campus_sede CS
INNER JOIN campus_area CA ON (CA.id_complejo_fk_id = CS.id_complejo);
```

#### 3.2. Seleccionar el área donde se realizará el evento, a partir de una lista de nombres y ubicaciones de áreas 
```
--     y que pertenecen a la sede previamente seleccionada.

SELECT CA.nom_area, CA.ubicacion, CE.consec_evento, CE.fecha_hora
FROM campus_area CA
INNER JOIN campus_evento CE ON (CE.id_area_fk_id = CA.id_area) AND (CE.id_complejo_fk_id = CA.id_complejo_fk_id)
WHERE CA.id_complejo_fk_id = '00001'; -- Complejo seleccionado id 'Soccer City'
```
#### 3.3. Seleccionar el deporte de una lista de deportes que se permiten en el área seleccionada.
```
SELECT SD.nom_deporte
FROM sports_deporte SD
INNER JOIN campus_evento CE ON (CE.id_deporte_fk_id = SD.id_deporte)
INNER JOIN campus_area CA ON (CA.id_area = CE.id_area_fk_id) AND (CA.id_complejo_fk_id = CE.id_complejo_fk_id) 
								AND (CA.id_area =  '00001');
```
#### 3.5. Responsable del Evento quien está “logueado” y la fecha de préstamo corresponde a la fecha del sistema.
```
SELECT CE.consec_evento, CE.fecha_hora, AU.first_name, AU.last_name, AU.username, fecha_prestamo AS fecha_sistema
FROM sports_deporte SD
INNER JOIN campus_evento CE ON (CE.id_deporte_fk_id = SD.id_deporte)
INNER JOIN campus_area CA ON (CA.id_area = CE.id_area_fk_id) AND (CA.id_complejo_fk_id = CE.id_complejo_fk_id) 
INNER JOIN users_persona UP ON (UP.cod_persona = CE.cod_persona_fk_id)
INNER JOIN sports_prestamo SP ON (SP.cod_persona_fk_id = UP.cod_persona)
INNER JOIN auth_user AU ON (UP.user_id = AU.id);
```

#### 3.7. Selecciona los equipos que sirven para ese deporte, que están en el inventario de esa sede y que está libre  crear el registro de préstamo del equipo incluyendo la fecha de préstamo.
```
SELECT SE.nom_equipo, SI.id_complejo_fk_id
FROM sports_equipo SE
INNER JOIN sports_inventario SI ON (SI.id_equipo_fk_id = SE.id_equipo)
								AND (SI.id_estado_fk_id = '1') -- 1: libre
								AND (SI.id_complejo_fk_id = '00001')
INNER JOIN sports_deporte_id_equipo_fk SDE ON (SDE.equipo_id = SE.id_equipo)
								AND (SDE.deporte_id = 'FBL'); -- Deporte seleccionado 'futbol'

--Se debe insertar un registro de prestamo.
```

#### 3.8. De una lista de comisarios seleccione el comisario (de una lista de tareas debe seleccionar la tarea del comisario)
```
SELECT AU.first_name, AU.last_name
FROM auth_user AU
INNER JOIN users_persona UP ON (UP.id_tipo_persona_fk_id = '2') -- 2: comisario
							and (AU.id = UP.user_id);
```
```
SELECT UT.desc_tarea FROM users_tarea UT;
```

#### 4.1. Seleccionar una sede a partir de una lista que contiene los nombres y ubicaciones de las sedes.
```
SELECT cs.nom_complejo, cs.direccion, CA.ubicacion
FROM campus_sede CS
INNER JOIN campus_area CA ON (CA.id_complejo_fk_id = CS.id_complejo);
```

#### 4.2. Seleccionar de una lista el equipo (dicha lista contiene los quipos disponibles en inventario para la sede seleccionada y que tienen estado Libre). Equipo se refiere a equipamiento.
```
SELECT SE.nom_equipo, SI.id_complejo_fk_id
FROM sports_equipo SE
INNER JOIN sports_inventario SI ON (SI.id_equipo_fk_id = SE.id_equipo) AND (SI.id_estado_fk_id = '1');
```

#### 4.3. Incluir el estado de una lista de estados (5 o 6 dependiendo para que se presta)
```
SELECT SE.nom_equipo, SI.id_complejo_fk_id, SI.id_estado_fk_id AS est_inv, EI.desc_estado AS desc_est_inv,
	    SP.id_estado_fk_id AS est_ptmo, EP.desc_estado AS desc_est_ptmo
FROM sports_equipo SE
INNER JOIN sports_inventario SI ON (SI.id_equipo_fk_id = SE.id_equipo)
INNER JOIN sports_prestamo SP ON (SP.consec_inventario_fk_id = SI.consec_inventario)
LEFT  JOIN sports_estado EI ON (EI.id_estado = SI.id_estado_fk_id)
LEFT  JOIN sports_estado EP ON (EP.id_estado = SP.id_estado_fk_id);
```

#### 4.4. Responsable del Préstamo quien está “logueado” y la fecha de préstamo corresponde a la fecha del sistema.
```
SELECT AU.first_name, AU.last_name, AU.username, fecha_prestamo AS fecha_sistema
FROM users_persona UP
INNER JOIN sports_prestamo SP ON (SP.cod_persona_fk_id = UP.cod_persona)
INNER JOIN auth_user AU ON (UP.user_id = AU.id)
WHERE AU.username = 'Jeff' --Usuario logueado
```