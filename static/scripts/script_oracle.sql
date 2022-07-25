
CREATE SEQUENCE auth_user_id
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 216
   NOCACHE 
   NOORDER 
   NOCYCLE;

-- Sede
CREATE TABLE campus_sede(
    id_complejo  CHAR(5)		NOT NULL,
    nom_complejo VARCHAR(30)	NOT NULL,
    presupuesto  NUMBER(7,2)	NOT NULL,
    direccion    VARCHAR(30)	NOT NULL,
    created      DATE,
    updated      DATE,
    CONSTRAINT campus_sede_id_complejo PRIMARY KEY (id_complejo)
);

-- Deporte
CREATE TABLE sports_deporte(
    id_deporte        VARCHAR(4)    NOT NULL,
    nom_deporte       VARCHAR(30)   NOT NULL,
    n_max_integrantes NUMBER(2,0)   NOT NULL,
    created           DATE,
    updated           DATE,
    CONSTRAINT sports_deporte_id_deporte PRIMARY KEY (id_deporte)
);

-- Sede único
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

-- Sede área
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

-- Área polideportivo
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

-- Tipo Persona
CREATE TABLE users_tipopersona(
    id_tipo_persona     VARCHAR(3)   NOT NULL,
    desc_tipo_persona   VARCHAR(30)  NOT NULL,
    created             DATE,
    updated             DATE,
    CONSTRAINT users_tipperson_id_tiperson PRIMARY KEY (id_tipo_persona)
);

-- auth_user Django
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

-- Persona
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

-- Evento
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

-- Estado
CREATE TABLE sports_estado(
    id_estado    VARCHAR(2)  NOT NULL,
    desc_estado  VARCHAR(30) NOT NULL,
    created      DATE,
    updated      DATE,
    CONSTRAINT sports_estado_id_estado PRIMARY KEY (id_estado)
);

-- Equipo
CREATE TABLE sports_equipo(
    id_equipo    VARCHAR(3)   NOT NULL,
    nom_equipo   VARCHAR(30)  NOT NULL,
    n_partes     NUMBER(4,0)  NOT NULL,
    created      DATE,
    updated      DATE,
    CONSTRAINT sports_equipo_id_equipo PRIMARY KEY (id_equipo)
);

-- Inventario
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

-- Deporte 2
CREATE TABLE sports_deporte2(
    id_deporte        VARCHAR(3)	NOT NULL,
    nom_deporte       VARCHAR(30)   NOT NULL,
    n_max_integrantes NUMBER(2,0)   NOT NULL,
    created                         DATE,
    updated                         DATE,
    CONSTRAINT sports_deporte2_id_deporte PRIMARY KEY (id_deporte)
);

-- Prestamo
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

-- Tarea
CREATE TABLE users_tarea(
    id_tarea     VARCHAR(3)		NOT NULL,
    desc_tarea   VARCHAR(20)	NOT NULL,
    created      DATE,
    updated      DATE,
    CONSTRAINT users_tarea_id_tarea PRIMARY KEY (id_tarea)
);

-- Comisario Evento
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

-- Tablas de rompimiento
-- 1. Deporte/Equipo
CREATE TABLE sports_deporte_id_equipo_fk(
    id          NUMBER(5) NOT NULL,
    deporte_id  VARCHAR(3)  NOT NULL,
    equipo_id   VARCHAR(3)  NOT NULL,
    CONSTRAINT sp_depor_pk PRIMARY KEY (deporte_id, equipo_id),
    CONSTRAINT sp_depor_idequ_fkdepo_fk_id FOREIGN KEY (deporte_id) REFERENCES sports_deporte (id_deporte),
    CONSTRAINT sp_depor_idequ_fkequi_fk_id  FOREIGN KEY (equipo_id)  REFERENCES sports_equipo (id_equipo)
);

-- 2. Deporte/Persona
CREATE TABLE sports_deporte_cod_persona_fk(
    id          NUMBER(5)  NOT NULL,
    deporte_id  VARCHAR(3)  NOT NULL,
    persona_id  VARCHAR(4)  NOT NULL,
    CONSTRAINT deporte_persona_pk PRIMARY KEY (deporte_id, persona_id),
    CONSTRAINT sp_dep_codper_fkid_depo_fk_id  FOREIGN KEY (persona_id) REFERENCES users_persona (cod_persona),
    CONSTRAINT sp_dep_codp_fkid_codp_fk_id FOREIGN KEY (deporte_id)  REFERENCES sports_deporte (id_deporte)
);

-- 3. Persona/Deporte2
CREATE TABLE sports_deporte2_cod_persona_fk(
    id          NUMBER(5)  NOT NULL,
    persona_id  VARCHAR(4)  NOT NULL,
    deporte2_id VARCHAR(3)  NOT NULL,
    CONSTRAINT sp_dep2_codp_pk PRIMARY KEY (persona_id, deporte2_id),
    CONSTRAINT sp_dep2_codp_fkid_codp_fk_id FOREIGN KEY (persona_id) REFERENCES users_persona (cod_persona),
    CONSTRAINT sp_dep2_codp_fkid_dep2_fk_id FOREIGN KEY (deporte2_id) REFERENCES sports_deporte2 (id_deporte)
);

ALTER TABLE campus_sede RENAME COLUMN dirección TO direccion;
ALTER TABLE campus_polideportivo MODIFY id_area_fk_id VARCHAR(5);