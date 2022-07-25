-- Database: olimpiadas_ud

-- DROP DATABASE olimpiadas_ud;
CREATE DATABASE olimpiadas_ud
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'es_CO.UTF-8'
    LC_CTYPE = 'es_CO.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

use olimpiadas_ud
go

-- Sede
CREATE TABLE campus_sede(
    id_complejo  CHAR(5)		NOT NULL,
    nom_complejo VARCHAR(30)	NOT NULL,
    presupuesto  DECIMAL(7,2)	NOT NULL,
    direccion    VARCHAR(30)	NOT NULL,
    created      DATE,
    updated      DATE,
    CONSTRAINT campus_sede_id_complejo PRIMARY KEY (id_complejo)
);

-- Deporte
CREATE TABLE sports_deporte(
    id_deporte        VARCHAR(4)    NOT NULL,
    nom_deporte       VARCHAR(30)   NOT NULL,
    n_max_integrantes DECIMAL(2,0)   NOT NULL,
    created           DATE,
    updated           DATE,
    CONSTRAINT sports_deporte_id_deporte PRIMARY KEY (id_deporte)
);

-- Sede único
CREATE TABLE campus_unico(
    id_unico			VARCHAR(4)    NOT NULL,
    area_unico			DECIMAL(4,2)  NOT NULL,
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
    id_poli				VARCHAR(4)  NOT NULL,
    id_area_fk_id		VARCHAR(3)  NOT NULL,
    id_deporte_fk_id	VARCHAR(4)  NOT NULL,
    created             DATE,
    updated             DATE,
    CONSTRAINT campus_polideportivo_id_poli PRIMARY KEY (id_poli),
    CONSTRAINT campus_polideportivo_id_area_fk_id FOREIGN KEY (id_area_fk_id) REFERENCES campus_area (id_area),
    CONSTRAINT campus_polideportivo_id_deporte_fk_id FOREIGN KEY (id_deporte_fk_id) REFERENCES sports_deporte(id_deporte)
);

-- Tipo Persona
CREATE TABLE users_tipopersona(
    id_tipo_persona     VARCHAR(3)   NOT NULL,
    desc_tipo_persona   VARCHAR(30)  NOT NULL,
    created             DATE,
    updated             DATE,
    CONSTRAINT users_tipopersona_id_tipo_persona PRIMARY KEY (id_tipo_persona)
);

-- auth_user Django
-- id,first_name,last_name,username,email,password, is_superuser, is_staff, is_active, last_login, date_joined
CREATE TABLE auth_user(
    id              SERIAL NOT NULL,
    password        VARCHAR(128) NOT NULL,
    last_login      DATE,
    is_superuser    BOOLEAN,
    username        VARCHAR(150) NOT NULL,
    first_name      VARCHAR(150) NOT NULL,
    last_name       VARCHAR(150) NOT NULL,
    email           VARCHAR(254) NOT NULL,
    is_staff        BOOLEAN,
    is_active       BOOLEAN,
    date_joined     DATE,
    CONSTRAINT auth_user_id PRIMARY KEY (id)
);

-- Persona
CREATE TABLE users_persona(
    cod_persona      VARCHAR(4)  NOT NULL,
    --first_name      VARCHAR(30) NOT NULL,
    --last_name      VARCHAR(30) NOT NULL,
    --username         VARCHAR(6)  NOT NULL,
    --email       VARCHAR(50) NOT NULL,
    --password    VARCHAR(5)  NOT NULL,
    id_tipo_persona_fk_id   VARCHAR(3)  NOT NULL,
    user_id integer NOT NULL,
    created DATE,
    updated DATE,
    CONSTRAINT users_persona_cod_persona PRIMARY KEY (cod_persona),
    CONSTRAINT users_persona_id_tipo_persona_fk_id FOREIGN KEY (id_tipo_persona_fk_id) REFERENCES users_tipopersona (id_tipo_persona),
    CONSTRAINT users_persona_user_id FOREIGN KEY (user_id) REFERENCES auth_user (id)
);

-- Evento
CREATE TABLE campus_evento(
    consec_evento		DECIMAL(5,0)	NOT NULL,
    fecha_hora			DATE			NOT NULL,
    duracion			TIME			NOT NULL,
    n_participante		DECIMAL(3,0)	NOT NULL,
    id_complejo_fk_id	CHAR(5)			NOT NULL,
    id_deporte_fk_id	VARCHAR(4)		NOT NULL,
    id_area_fk_id		VARCHAR(3),
    cod_persona_fk_id	VARCHAR(4)		NOT NULL,
    created             DATE,
    updated             DATE,
    CONSTRAINT campus_evento_consec_evento PRIMARY KEY (consec_evento),
    CONSTRAINT campus_evento_id_complejo_fk_id	FOREIGN KEY (id_complejo_fk_id) REFERENCES campus_sede (id_complejo),
    CONSTRAINT campus_evento_id_deporte_fk_id	FOREIGN KEY (id_deporte_fk_id)	REFERENCES sports_deporte (id_deporte),
    CONSTRAINT campus_evento_id_area_fk_id		FOREIGN KEY (id_area_fk_id)		REFERENCES campus_area (id_area),
    CONSTRAINT campus_evento_cod_persona_fk_id	FOREIGN KEY (cod_persona_fk_id) REFERENCES users_persona (cod_persona)
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
    n_partes     DECIMAL(4,0)  NOT NULL,
    created      DATE,
    updated      DATE,
    CONSTRAINT sports_equipo_id_equipo PRIMARY KEY (id_equipo)
);

-- Inventario
CREATE TABLE sports_inventario(
    consec_inventario	DECIMAL(4,0)	NOT NULL,
    n_piezas			DECIMAL(3,0)	NOT NULL,
    id_complejo_fk_id	CHAR(5)		NOT NULL,
    id_estado_fk_id		VARCHAR(2)	NOT NULL,
    id_equipo_fk_id		VARCHAR(3)	NOT NULL,
    created             DATE,
    updated             DATE,
    CONSTRAINT sports_inventario_consec_inventario PRIMARY KEY (consec_inventario),
    CONSTRAINT sports_inventario_id_complejo_fk_id FOREIGN KEY (id_complejo_fk_id) REFERENCES campus_sede (id_complejo),
    CONSTRAINT sports_inventario_id_estado_fk_id   FOREIGN KEY (id_estado_fk_id)   REFERENCES sports_estado (id_estado),
    CONSTRAINT sports_inventario_id_equipo_fk_id   FOREIGN KEY (id_equipo_fk_id)   REFERENCES sports_equipo (id_equipo)
);

-- Deporte 2
CREATE TABLE sports_deporte2(
    id_deporte        VARCHAR(3)	NOT NULL,
    nom_deporte       VARCHAR(30)   NOT NULL,
    n_max_integrantes DECIMAL(2,0)   NOT NULL,
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
    consec_inventario_fk_id		DECIMAL(4,0)	NOT NULL,
    created                     DATE,
    updated                     DATE,
    CONSTRAINT sports_prestamo_consec_prestamo PRIMARY KEY (consec_prestamo),
    CONSTRAINT sports_prestamo_cod_persona_fk_id FOREIGN KEY (cod_persona_fk_id) REFERENCES users_persona (cod_persona),
    CONSTRAINT sports_prestamo_id_estado_fk_id FOREIGN KEY (id_estado_fk_id) REFERENCES sports_estado (id_estado),
    CONSTRAINT sports_prestamo_consec_inventario_fk_id FOREIGN KEY (consec_inventario_fk_id) REFERENCES sports_inventario (consec_inventario)
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
    consec_comisario		DECIMAL(3,0)  NOT NULL,
    fecha_hora				DATE NOT NULL,
    consec_evento_fk_id		DECIMAL(5,0)  NOT NULL,
    cod_persona_fk_id		VARCHAR(4)  NOT NULL,
    id_tarea_fk_id			VARCHAR(3)  NOT NULL,
    created                 DATE,
    updated                 DATE,
    CONSTRAINT users_comisarioevento_consec_comisario PRIMARY KEY (consec_comisario),
    CONSTRAINT users_comisarioevento_consec_evento_fk_id  FOREIGN KEY (consec_evento_fk_id) REFERENCES campus_evento (consec_evento),
    CONSTRAINT users_comisarioevento_cod_persona_fk_id	  FOREIGN KEY (cod_persona_fk_id)   REFERENCES users_persona (cod_persona),
    CONSTRAINT users_comisarioevento_id_tarea_fk_id       FOREIGN KEY (id_tarea_fk_id)      REFERENCES users_tarea (id_tarea)
);

-- Tablas de rompimiento
-- 1. Deporte/Equipo
CREATE TABLE sports_deporte_id_equipo_fk(
    id          SERIAL NOT NULL,
    deporte_id  VARCHAR(3)  NOT NULL,
    equipo_id   VARCHAR(3)  NOT NULL,
    CONSTRAINT sports_deporte_pk PRIMARY KEY (deporte_id, equipo_id),
    CONSTRAINT sports_deporte_id_equipo_fk_id_deporte_fk_id FOREIGN KEY (deporte_id) REFERENCES sports_deporte (id_deporte),
    CONSTRAINT sports_deporte_id_equipo_fk_id_equipo_fk_id  FOREIGN KEY (equipo_id)  REFERENCES sports_equipo (id_equipo)
);

-- 2. Deporte/Persona
CREATE TABLE sports_deporte_cod_persona_fk(
    id          SERIAL NOT NULL,
    deporte_id  VARCHAR(3)  NOT NULL,
    persona_id  VARCHAR(4)  NOT NULL,
    CONSTRAINT deporte_persona_pk PRIMARY KEY (deporte_id, persona_id),
    CONSTRAINT sports_deporte_cod_persona_fk_id_deporte_fk_id  FOREIGN KEY (persona_id) REFERENCES users_persona (cod_persona),
    CONSTRAINT sports_deporte_cod_persona_fk_id_cod_persona_fk_id FOREIGN KEY (deporte_id)  REFERENCES sports_deporte (id_deporte)
);

-- 3. Persona/Deporte2
CREATE TABLE sports_deporte2_cod_persona_fk(
    id          SERIAL NOT NULL,
    persona_id  VARCHAR(4)  NOT NULL,
    deporte2_id VARCHAR(3)  NOT NULL,
    CONSTRAINT sports_deporte2_cod_persona_pk PRIMARY KEY (persona_id, deporte2_id),
    CONSTRAINT sports_deporte2_cod_persona_fk_id_cod_persona_fk_id FOREIGN KEY (persona_id) REFERENCES users_persona (cod_persona),
    CONSTRAINT sports_deporte2_cod_persona_fk_id_deporte2_fk_id FOREIGN KEY (deporte2_id) REFERENCES sports_deporte2 (id_deporte)
);

