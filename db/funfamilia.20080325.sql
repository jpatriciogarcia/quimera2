--
-- PostgreSQL database dump
--

-- Started on 2008-03-25 16:35:53

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1965 (class 1262 OID 26672)
-- Dependencies: 1964
-- Name: funfamilia; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON DATABASE funfamilia IS 'Base de datos proyecto Fundacion de la Familia';


--
-- TOC entry 1966 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- TOC entry 351 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- TOC entry 1358 (class 1259 OID 27801)
-- Dependencies: 5
-- Name: actividad; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE actividad (
    codigo integer NOT NULL,
    programa integer NOT NULL,
    tipo integer NOT NULL,
    estado integer NOT NULL,
    resultado integer NOT NULL,
    responsable character(20),
    nombre character varying(255) NOT NULL,
    descripcion text,
    avance numeric(3,2),
    costo numeric(10,2),
    fecha_inicio timestamp without time zone,
    fecha_termino timestamp without time zone,
    fecha_inicio_real timestamp without time zone,
    fecha_termino_real timestamp without time zone,
    cantidad_sesiones_programadas integer,
    cantidad_sesiones_realizadas integer,
    cantidad_personas integer,
    cantidad_personas_total integer
);


--
-- TOC entry 1968 (class 0 OID 0)
-- Dependencies: 1358
-- Name: TABLE actividad; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE actividad IS 'Las actividades que contienen los programas';


--
-- TOC entry 1969 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.codigo; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.codigo IS 'Código para individualizar el registro';


--
-- TOC entry 1970 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.programa; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.programa IS 'Programa al cual pertenece la actividad';


--
-- TOC entry 1971 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.tipo; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.tipo IS 'Tipo de la actividad, hace referencia a la tabla actividad_tipo';


--
-- TOC entry 1972 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.estado; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.estado IS 'Estado de la actividad, hace referencia a la tabla actividad_estado';


--
-- TOC entry 1973 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.resultado; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.resultado IS 'Resultado de la actividad, hace referencia a la tabla actividad_resultado';


--
-- TOC entry 1974 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.responsable; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.responsable IS 'Responsable de la actividad, hace referencia a la tabla usuario';


--
-- TOC entry 1975 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.nombre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.nombre IS 'El nombre dado para el registro';


--
-- TOC entry 1976 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.descripcion; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.descripcion IS 'Una descripción opcional para el registro';


--
-- TOC entry 1977 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.avance; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.avance IS 'Porcentaje de avance para la actividad';


--
-- TOC entry 1978 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.costo; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.costo IS 'El costo de la actividad expresado en pesos (CLP)';


--
-- TOC entry 1979 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.fecha_inicio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.fecha_inicio IS 'Fecha programada para el inicio de la actividad';


--
-- TOC entry 1980 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.fecha_termino; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.fecha_termino IS 'Fecha programada para el termino de la actividad';


--
-- TOC entry 1981 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.fecha_inicio_real; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.fecha_inicio_real IS 'Fecha real en la que se inicia la actividad';


--
-- TOC entry 1982 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.fecha_termino_real; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.fecha_termino_real IS 'Fecha real en la que se termina la actividad';


--
-- TOC entry 1983 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.cantidad_sesiones_programadas; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.cantidad_sesiones_programadas IS 'La cantidad de sesiones que se programan para la actividad';


--
-- TOC entry 1984 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.cantidad_sesiones_realizadas; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.cantidad_sesiones_realizadas IS 'La cantidad de sesiones que se realizaron en la actividad';


--
-- TOC entry 1985 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.cantidad_personas; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.cantidad_personas IS 'La cantidad de personas que se programan para que asistan a la actividad.  Este valor puede ser nulo dependiendo del tipo de actividad definido en la tabla actividad_tipo.  Sera nulo cuando la actividad sea de tipo "masiva"';


--
-- TOC entry 1986 (class 0 OID 0)
-- Dependencies: 1358
-- Name: COLUMN actividad.cantidad_personas_total; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad.cantidad_personas_total IS 'La cantidad de personas que asistieron a la actividad.  Este valor puede ser nulo dependiendo del tipo de actividad definido en la tabla actividad_tipo.  Sera nulo cuando la actividad sea de tipo "masiva"';


--
-- TOC entry 1357 (class 1259 OID 27799)
-- Dependencies: 5 1358
-- Name: actividad_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE actividad_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1987 (class 0 OID 0)
-- Dependencies: 1357
-- Name: actividad_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE actividad_codigo_seq OWNED BY actividad.codigo;


--
-- TOC entry 1988 (class 0 OID 0)
-- Dependencies: 1357
-- Name: actividad_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('actividad_codigo_seq', 1, false);


--
-- TOC entry 1360 (class 1259 OID 27812)
-- Dependencies: 5
-- Name: actividad_estado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE actividad_estado (
    codigo integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text
);


--
-- TOC entry 1989 (class 0 OID 0)
-- Dependencies: 1360
-- Name: TABLE actividad_estado; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE actividad_estado IS 'Los estados en que puede estar una actividad';


--
-- TOC entry 1990 (class 0 OID 0)
-- Dependencies: 1360
-- Name: COLUMN actividad_estado.codigo; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad_estado.codigo IS 'Código para individualizar el registro';


--
-- TOC entry 1991 (class 0 OID 0)
-- Dependencies: 1360
-- Name: COLUMN actividad_estado.nombre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad_estado.nombre IS 'El nombre dado para el registro';


--
-- TOC entry 1992 (class 0 OID 0)
-- Dependencies: 1360
-- Name: COLUMN actividad_estado.descripcion; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad_estado.descripcion IS 'Una descripción opcional para el registro';


--
-- TOC entry 1359 (class 1259 OID 27810)
-- Dependencies: 1360 5
-- Name: actividad_estado_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE actividad_estado_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1993 (class 0 OID 0)
-- Dependencies: 1359
-- Name: actividad_estado_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE actividad_estado_codigo_seq OWNED BY actividad_estado.codigo;


--
-- TOC entry 1994 (class 0 OID 0)
-- Dependencies: 1359
-- Name: actividad_estado_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('actividad_estado_codigo_seq', 1, false);


--
-- TOC entry 1361 (class 1259 OID 27829)
-- Dependencies: 5
-- Name: actividad_material; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE actividad_material (
    material integer NOT NULL,
    actividad integer NOT NULL,
    cantidad numeric
);


--
-- TOC entry 1362 (class 1259 OID 27837)
-- Dependencies: 5
-- Name: actividad_monitor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE actividad_monitor (
    rut numeric NOT NULL,
    codigo integer NOT NULL,
    codigo_centro_familiar integer NOT NULL,
    codigo_programa integer NOT NULL,
    tipo_actividad integer NOT NULL,
    fecha_inicio_asignacion timestamp without time zone,
    fecha_fin_asignacion timestamp without time zone,
    fecha_inicio_real_asignacion timestamp without time zone,
    fecha_fin_real_asignacion timestamp without time zone
);


--
-- TOC entry 1364 (class 1259 OID 27847)
-- Dependencies: 5
-- Name: actividad_resultado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE actividad_resultado (
    codigo integer NOT NULL,
    nombre character(255) NOT NULL,
    descripcion text
);


--
-- TOC entry 1995 (class 0 OID 0)
-- Dependencies: 1364
-- Name: TABLE actividad_resultado; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE actividad_resultado IS 'Almacena los resultados con los que puede ser calificada una actividad';


--
-- TOC entry 1996 (class 0 OID 0)
-- Dependencies: 1364
-- Name: COLUMN actividad_resultado.codigo; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad_resultado.codigo IS 'Código para individualizar el registro';


--
-- TOC entry 1997 (class 0 OID 0)
-- Dependencies: 1364
-- Name: COLUMN actividad_resultado.nombre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad_resultado.nombre IS 'El nombre dado para el registro';


--
-- TOC entry 1998 (class 0 OID 0)
-- Dependencies: 1364
-- Name: COLUMN actividad_resultado.descripcion; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN actividad_resultado.descripcion IS 'Una descripción opcional para el registro';


--
-- TOC entry 1363 (class 1259 OID 27845)
-- Dependencies: 1364 5
-- Name: actividad_resultado_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE actividad_resultado_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1999 (class 0 OID 0)
-- Dependencies: 1363
-- Name: actividad_resultado_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE actividad_resultado_codigo_seq OWNED BY actividad_resultado.codigo;


--
-- TOC entry 2000 (class 0 OID 0)
-- Dependencies: 1363
-- Name: actividad_resultado_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('actividad_resultado_codigo_seq', 1, false);


--
-- TOC entry 1366 (class 1259 OID 27858)
-- Dependencies: 5
-- Name: actividad_tipo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE actividad_tipo (
    codigo integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text
);


--
-- TOC entry 1365 (class 1259 OID 27856)
-- Dependencies: 5 1366
-- Name: actividad_tipo_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE actividad_tipo_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2001 (class 0 OID 0)
-- Dependencies: 1365
-- Name: actividad_tipo_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE actividad_tipo_codigo_seq OWNED BY actividad_tipo.codigo;


--
-- TOC entry 2002 (class 0 OID 0)
-- Dependencies: 1365
-- Name: actividad_tipo_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('actividad_tipo_codigo_seq', 1, false);


--
-- TOC entry 1368 (class 1259 OID 27869)
-- Dependencies: 5
-- Name: actividad_zona; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE actividad_zona (
    act_codigo integer,
    codigo integer,
    id integer NOT NULL
);


--
-- TOC entry 1367 (class 1259 OID 27867)
-- Dependencies: 5 1368
-- Name: actividad_zona_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE actividad_zona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2003 (class 0 OID 0)
-- Dependencies: 1367
-- Name: actividad_zona_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE actividad_zona_id_seq OWNED BY actividad_zona.id;


--
-- TOC entry 2004 (class 0 OID 0)
-- Dependencies: 1367
-- Name: actividad_zona_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('actividad_zona_id_seq', 1, false);


--
-- TOC entry 1370 (class 1259 OID 27877)
-- Dependencies: 5
-- Name: centro_familiar; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE centro_familiar (
    codigo integer NOT NULL,
    nombre character(255) NOT NULL,
    descripcion text,
    direccion character(255) NOT NULL,
    poblacion character(255),
    comuna integer NOT NULL,
    telefono character(20) NOT NULL,
    fax character(20) NOT NULL,
    casilla character(20),
    mail character(80) NOT NULL,
    director character(80) NOT NULL
);


--
-- TOC entry 2005 (class 0 OID 0)
-- Dependencies: 1370
-- Name: TABLE centro_familiar; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE centro_familiar IS 'Almacena los centros familiares que posee la organizacion';


--
-- TOC entry 1369 (class 1259 OID 27875)
-- Dependencies: 5 1370
-- Name: centro_familiar_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE centro_familiar_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2006 (class 0 OID 0)
-- Dependencies: 1369
-- Name: centro_familiar_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE centro_familiar_codigo_seq OWNED BY centro_familiar.codigo;


--
-- TOC entry 2007 (class 0 OID 0)
-- Dependencies: 1369
-- Name: centro_familiar_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('centro_familiar_codigo_seq', 1, false);


--
-- TOC entry 1372 (class 1259 OID 27888)
-- Dependencies: 5
-- Name: ciudad; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ciudad (
    codigo integer NOT NULL,
    codigo_region integer,
    ciudad character(255),
    latitud character varying(60),
    longitud character varying(60),
    zoom character varying(60)
);


--
-- TOC entry 1371 (class 1259 OID 27886)
-- Dependencies: 1372 5
-- Name: ciudad_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ciudad_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2008 (class 0 OID 0)
-- Dependencies: 1371
-- Name: ciudad_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ciudad_codigo_seq OWNED BY ciudad.codigo;


--
-- TOC entry 2009 (class 0 OID 0)
-- Dependencies: 1371
-- Name: ciudad_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ciudad_codigo_seq', 1, false);


--
-- TOC entry 1373 (class 1259 OID 27894)
-- Dependencies: 5
-- Name: cobertura_monitor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cobertura_monitor (
    rut_monitor numeric NOT NULL,
    codigo_area integer NOT NULL
);


--
-- TOC entry 1375 (class 1259 OID 27904)
-- Dependencies: 5
-- Name: comuna; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comuna (
    codigo integer NOT NULL,
    codigo_ciudad integer,
    comuna character(255),
    latitud character varying(60),
    longitud character varying(60),
    zoom character varying(60)
);


--
-- TOC entry 1374 (class 1259 OID 27902)
-- Dependencies: 5 1375
-- Name: comuna_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comuna_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2010 (class 0 OID 0)
-- Dependencies: 1374
-- Name: comuna_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comuna_codigo_seq OWNED BY comuna.codigo;


--
-- TOC entry 2011 (class 0 OID 0)
-- Dependencies: 1374
-- Name: comuna_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('comuna_codigo_seq', 1, false);


--
-- TOC entry 1377 (class 1259 OID 27912)
-- Dependencies: 5
-- Name: detalle_costos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE detalle_costos (
    id integer NOT NULL,
    codigo_actividad integer,
    descripcion text,
    costo numeric(10,2)
);


--
-- TOC entry 1376 (class 1259 OID 27910)
-- Dependencies: 1377 5
-- Name: detalle_costos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE detalle_costos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2012 (class 0 OID 0)
-- Dependencies: 1376
-- Name: detalle_costos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE detalle_costos_id_seq OWNED BY detalle_costos.id;


--
-- TOC entry 2013 (class 0 OID 0)
-- Dependencies: 1376
-- Name: detalle_costos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('detalle_costos_id_seq', 1, false);


--
-- TOC entry 1379 (class 1259 OID 27923)
-- Dependencies: 5
-- Name: estado_civil; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE estado_civil (
    codigo integer NOT NULL,
    nombre character(255),
    descripcion text
);


--
-- TOC entry 1378 (class 1259 OID 27921)
-- Dependencies: 1379 5
-- Name: estado_civil_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE estado_civil_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2014 (class 0 OID 0)
-- Dependencies: 1378
-- Name: estado_civil_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE estado_civil_codigo_seq OWNED BY estado_civil.codigo;


--
-- TOC entry 2015 (class 0 OID 0)
-- Dependencies: 1378
-- Name: estado_civil_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('estado_civil_codigo_seq', 1, false);


--
-- TOC entry 1381 (class 1259 OID 27934)
-- Dependencies: 5
-- Name: familia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE familia (
    codigo integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text
);


--
-- TOC entry 1380 (class 1259 OID 27932)
-- Dependencies: 5 1381
-- Name: familia_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE familia_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2016 (class 0 OID 0)
-- Dependencies: 1380
-- Name: familia_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE familia_codigo_seq OWNED BY familia.codigo;


--
-- TOC entry 2017 (class 0 OID 0)
-- Dependencies: 1380
-- Name: familia_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('familia_codigo_seq', 1, false);


--
-- TOC entry 1383 (class 1259 OID 27945)
-- Dependencies: 5
-- Name: grupo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE grupo (
    codigo integer NOT NULL,
    grupo character varying(80),
    descripcion text
);


--
-- TOC entry 1382 (class 1259 OID 27943)
-- Dependencies: 1383 5
-- Name: grupo_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE grupo_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2018 (class 0 OID 0)
-- Dependencies: 1382
-- Name: grupo_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE grupo_codigo_seq OWNED BY grupo.codigo;


--
-- TOC entry 2019 (class 0 OID 0)
-- Dependencies: 1382
-- Name: grupo_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('grupo_codigo_seq', 1, false);


--
-- TOC entry 1384 (class 1259 OID 27954)
-- Dependencies: 5
-- Name: grupo_login; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE grupo_login (
    codigo_grupo integer NOT NULL,
    usuario character(20) NOT NULL
);


--
-- TOC entry 1385 (class 1259 OID 27959)
-- Dependencies: 5
-- Name: grupo_modulo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE grupo_modulo (
    grupo integer NOT NULL,
    modulo integer NOT NULL,
    privilegio character varying(10)
);


--
-- TOC entry 1387 (class 1259 OID 27966)
-- Dependencies: 5
-- Name: input_gobierno; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE input_gobierno (
    codigo integer NOT NULL,
    proyecto integer,
    fecha_inicio timestamp without time zone,
    fecha_termino timestamp without time zone,
    costo numeric(10,2),
    observaciones text
);


--
-- TOC entry 1386 (class 1259 OID 27964)
-- Dependencies: 5 1387
-- Name: input_gobierno_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE input_gobierno_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2020 (class 0 OID 0)
-- Dependencies: 1386
-- Name: input_gobierno_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE input_gobierno_codigo_seq OWNED BY input_gobierno.codigo;


--
-- TOC entry 2021 (class 0 OID 0)
-- Dependencies: 1386
-- Name: input_gobierno_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('input_gobierno_codigo_seq', 1, false);


--
-- TOC entry 1389 (class 1259 OID 27977)
-- Dependencies: 5
-- Name: material; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE material (
    codigo integer NOT NULL,
    sub_familia character(10),
    nombre character varying(60),
    descripcion text,
    costo numeric(10,2),
    unidad_medida character varying(255)
);


--
-- TOC entry 1388 (class 1259 OID 27975)
-- Dependencies: 5 1389
-- Name: material_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE material_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2022 (class 0 OID 0)
-- Dependencies: 1388
-- Name: material_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE material_codigo_seq OWNED BY material.codigo;


--
-- TOC entry 2023 (class 0 OID 0)
-- Dependencies: 1388
-- Name: material_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('material_codigo_seq', 1, false);


--
-- TOC entry 1391 (class 1259 OID 27988)
-- Dependencies: 5
-- Name: modulo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE modulo (
    codigo integer NOT NULL,
    modulo integer,
    nombre character varying(255),
    descripcion text,
    url text,
    bloqueado character(10),
    imagen text
);


--
-- TOC entry 1390 (class 1259 OID 27986)
-- Dependencies: 1391 5
-- Name: modulo_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE modulo_codigo_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2024 (class 0 OID 0)
-- Dependencies: 1390
-- Name: modulo_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE modulo_codigo_seq OWNED BY modulo.codigo;


--
-- TOC entry 2025 (class 0 OID 0)
-- Dependencies: 1390
-- Name: modulo_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('modulo_codigo_seq', 9, true);


--
-- TOC entry 1392 (class 1259 OID 27997)
-- Dependencies: 5
-- Name: monitor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE monitor (
    rut numeric NOT NULL,
    usuario character(20),
    nombres character(80),
    apellido_paterno character(80),
    apellido_materno character(80),
    direccion character(255),
    fono character(80),
    celular character(80),
    mail character(80)
);


--
-- TOC entry 1394 (class 1259 OID 28007)
-- Dependencies: 5
-- Name: nivel_educacional; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nivel_educacional (
    codigo integer NOT NULL,
    nombre character(255),
    descripcion text
);


--
-- TOC entry 1393 (class 1259 OID 28005)
-- Dependencies: 5 1394
-- Name: nivel_educacional_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nivel_educacional_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2026 (class 0 OID 0)
-- Dependencies: 1393
-- Name: nivel_educacional_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nivel_educacional_codigo_seq OWNED BY nivel_educacional.codigo;


--
-- TOC entry 2027 (class 0 OID 0)
-- Dependencies: 1393
-- Name: nivel_educacional_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('nivel_educacional_codigo_seq', 1, false);


--
-- TOC entry 1396 (class 1259 OID 28018)
-- Dependencies: 5
-- Name: ocupacion; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ocupacion (
    codigo integer NOT NULL,
    nombre character(255),
    descripcion text
);


--
-- TOC entry 1395 (class 1259 OID 28016)
-- Dependencies: 1396 5
-- Name: ocupacion_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ocupacion_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2028 (class 0 OID 0)
-- Dependencies: 1395
-- Name: ocupacion_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ocupacion_codigo_seq OWNED BY ocupacion.codigo;


--
-- TOC entry 2029 (class 0 OID 0)
-- Dependencies: 1395
-- Name: ocupacion_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ocupacion_codigo_seq', 1, false);


--
-- TOC entry 1398 (class 1259 OID 28032)
-- Dependencies: 5
-- Name: programa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programa (
    codigo integer NOT NULL,
    proyecto integer,
    nombre character(255) NOT NULL,
    descripcion text,
    fecha_inicio timestamp without time zone NOT NULL,
    fecha_termino timestamp without time zone NOT NULL,
    fecha_inicio_real timestamp without time zone,
    fecha_termino_real timestamp without time zone,
    avance numeric(3,2),
    costo numeric(10,2) NOT NULL,
    estado integer
);


--
-- TOC entry 1397 (class 1259 OID 28030)
-- Dependencies: 5 1398
-- Name: programa_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programa_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2030 (class 0 OID 0)
-- Dependencies: 1397
-- Name: programa_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE programa_codigo_seq OWNED BY programa.codigo;


--
-- TOC entry 2031 (class 0 OID 0)
-- Dependencies: 1397
-- Name: programa_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programa_codigo_seq', 1, false);


--
-- TOC entry 1400 (class 1259 OID 28043)
-- Dependencies: 5
-- Name: programa_estado; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programa_estado (
    codigo integer NOT NULL,
    nombre character(255),
    descripcion text
);


--
-- TOC entry 1399 (class 1259 OID 28041)
-- Dependencies: 5 1400
-- Name: programa_estado_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programa_estado_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2032 (class 0 OID 0)
-- Dependencies: 1399
-- Name: programa_estado_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE programa_estado_codigo_seq OWNED BY programa_estado.codigo;


--
-- TOC entry 2033 (class 0 OID 0)
-- Dependencies: 1399
-- Name: programa_estado_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programa_estado_codigo_seq', 1, false);


--
-- TOC entry 1402 (class 1259 OID 28062)
-- Dependencies: 5
-- Name: proyecto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE proyecto (
    codigo integer NOT NULL,
    centro_familiar integer,
    usuario character(20),
    nombre character(255),
    descripcion text,
    costo numeric(10,2)
);


--
-- TOC entry 1401 (class 1259 OID 28060)
-- Dependencies: 5 1402
-- Name: proyecto_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE proyecto_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2034 (class 0 OID 0)
-- Dependencies: 1401
-- Name: proyecto_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE proyecto_codigo_seq OWNED BY proyecto.codigo;


--
-- TOC entry 2035 (class 0 OID 0)
-- Dependencies: 1401
-- Name: proyecto_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('proyecto_codigo_seq', 1, false);


--
-- TOC entry 1404 (class 1259 OID 28073)
-- Dependencies: 5
-- Name: region; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE region (
    codigo integer NOT NULL,
    region character(255),
    latitud character varying(60),
    longitud character varying(60),
    zoom character varying(60)
);


--
-- TOC entry 1403 (class 1259 OID 28071)
-- Dependencies: 1404 5
-- Name: region_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE region_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2036 (class 0 OID 0)
-- Dependencies: 1403
-- Name: region_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE region_codigo_seq OWNED BY region.codigo;


--
-- TOC entry 2037 (class 0 OID 0)
-- Dependencies: 1403
-- Name: region_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('region_codigo_seq', 1, false);


--
-- TOC entry 1356 (class 1259 OID 27797)
-- Dependencies: 5
-- Name: sequence_1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sequence_1
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2038 (class 0 OID 0)
-- Dependencies: 1356
-- Name: sequence_1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sequence_1', 1, false);


--
-- TOC entry 1406 (class 1259 OID 28081)
-- Dependencies: 5
-- Name: sesion; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sesion (
    id integer NOT NULL,
    numero_sesion numeric(10,2),
    rut numeric,
    actividad integer,
    rut_persona integer,
    fecha_inicio timestamp without time zone,
    fecha_termino timestamp without time zone
);


--
-- TOC entry 1405 (class 1259 OID 28079)
-- Dependencies: 1406 5
-- Name: sesion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sesion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2039 (class 0 OID 0)
-- Dependencies: 1405
-- Name: sesion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sesion_id_seq OWNED BY sesion.id;


--
-- TOC entry 2040 (class 0 OID 0)
-- Dependencies: 1405
-- Name: sesion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('sesion_id_seq', 1, false);


--
-- TOC entry 1407 (class 1259 OID 28090)
-- Dependencies: 5
-- Name: sub_familia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sub_familia (
    codigo character(10) NOT NULL,
    familia integer,
    nombre character varying(255) NOT NULL,
    descripcion text
);


--
-- TOC entry 1409 (class 1259 OID 28100)
-- Dependencies: 5
-- Name: thesaurus; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE thesaurus (
    codigo integer NOT NULL,
    cantidad_ocurrencias numeric NOT NULL,
    palabra text
);


--
-- TOC entry 1410 (class 1259 OID 28109)
-- Dependencies: 5
-- Name: thesaurus_actividad; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE thesaurus_actividad (
    thesaurus integer NOT NULL,
    actividad integer NOT NULL
);


--
-- TOC entry 1408 (class 1259 OID 28098)
-- Dependencies: 1409 5
-- Name: thesaurus_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE thesaurus_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2041 (class 0 OID 0)
-- Dependencies: 1408
-- Name: thesaurus_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE thesaurus_codigo_seq OWNED BY thesaurus.codigo;


--
-- TOC entry 2042 (class 0 OID 0)
-- Dependencies: 1408
-- Name: thesaurus_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('thesaurus_codigo_seq', 1, false);


--
-- TOC entry 1411 (class 1259 OID 28114)
-- Dependencies: 5
-- Name: thesaurus_programa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE thesaurus_programa (
    thesaurus integer NOT NULL,
    programa integer NOT NULL
);


--
-- TOC entry 1413 (class 1259 OID 28121)
-- Dependencies: 5
-- Name: tipo_calle; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_calle (
    codigo integer NOT NULL,
    nombre character(255) NOT NULL,
    descripcion text
);


--
-- TOC entry 1412 (class 1259 OID 28119)
-- Dependencies: 1413 5
-- Name: tipo_calle_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_calle_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2043 (class 0 OID 0)
-- Dependencies: 1412
-- Name: tipo_calle_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_calle_codigo_seq OWNED BY tipo_calle.codigo;


--
-- TOC entry 2044 (class 0 OID 0)
-- Dependencies: 1412
-- Name: tipo_calle_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipo_calle_codigo_seq', 1, false);


--
-- TOC entry 1415 (class 1259 OID 28132)
-- Dependencies: 5
-- Name: tipo_vivienda; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_vivienda (
    codigo integer NOT NULL,
    nombre character(255) NOT NULL,
    descripcion text
);


--
-- TOC entry 1414 (class 1259 OID 28130)
-- Dependencies: 1415 5
-- Name: tipo_vivienda_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_vivienda_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2045 (class 0 OID 0)
-- Dependencies: 1414
-- Name: tipo_vivienda_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_vivienda_codigo_seq OWNED BY tipo_vivienda.codigo;


--
-- TOC entry 2046 (class 0 OID 0)
-- Dependencies: 1414
-- Name: tipo_vivienda_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipo_vivienda_codigo_seq', 1, false);


--
-- TOC entry 1416 (class 1259 OID 28141)
-- Dependencies: 5
-- Name: usuario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usuario (
    usuario character(20) NOT NULL,
    clave character(32),
    inicio_sesion timestamp without time zone,
    fin_sesion timestamp without time zone,
    ultimo_acceso timestamp without time zone,
    origen character varying(60),
    bloqueado character(1)
);


--
-- TOC entry 1418 (class 1259 OID 28148)
-- Dependencies: 5
-- Name: zona; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zona (
    codigo integer NOT NULL,
    zona character varying(255) NOT NULL,
    latitud character varying(60) NOT NULL,
    longitud character varying(60) NOT NULL,
    zoom character varying(60) NOT NULL
);


--
-- TOC entry 1417 (class 1259 OID 28146)
-- Dependencies: 5 1418
-- Name: zona_codigo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE zona_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 2047 (class 0 OID 0)
-- Dependencies: 1417
-- Name: zona_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE zona_codigo_seq OWNED BY zona.codigo;


--
-- TOC entry 2048 (class 0 OID 0)
-- Dependencies: 1417
-- Name: zona_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('zona_codigo_seq', 1, false);


--
-- TOC entry 1419 (class 1259 OID 28154)
-- Dependencies: 5
-- Name: zona_comuna; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zona_comuna (
    codigo_comuna integer NOT NULL,
    codigo_zona integer NOT NULL
);


--
-- TOC entry 1750 (class 2604 OID 27803)
-- Dependencies: 1358 1357 1358
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE actividad ALTER COLUMN codigo SET DEFAULT nextval('actividad_codigo_seq'::regclass);


--
-- TOC entry 1751 (class 2604 OID 27814)
-- Dependencies: 1359 1360 1360
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE actividad_estado ALTER COLUMN codigo SET DEFAULT nextval('actividad_estado_codigo_seq'::regclass);


--
-- TOC entry 1752 (class 2604 OID 27849)
-- Dependencies: 1364 1363 1364
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE actividad_resultado ALTER COLUMN codigo SET DEFAULT nextval('actividad_resultado_codigo_seq'::regclass);


--
-- TOC entry 1753 (class 2604 OID 27860)
-- Dependencies: 1365 1366 1366
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE actividad_tipo ALTER COLUMN codigo SET DEFAULT nextval('actividad_tipo_codigo_seq'::regclass);


--
-- TOC entry 1754 (class 2604 OID 27871)
-- Dependencies: 1367 1368 1368
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE actividad_zona ALTER COLUMN id SET DEFAULT nextval('actividad_zona_id_seq'::regclass);


--
-- TOC entry 1755 (class 2604 OID 27879)
-- Dependencies: 1369 1370 1370
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE centro_familiar ALTER COLUMN codigo SET DEFAULT nextval('centro_familiar_codigo_seq'::regclass);


--
-- TOC entry 1756 (class 2604 OID 27890)
-- Dependencies: 1371 1372 1372
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ciudad ALTER COLUMN codigo SET DEFAULT nextval('ciudad_codigo_seq'::regclass);


--
-- TOC entry 1757 (class 2604 OID 27906)
-- Dependencies: 1374 1375 1375
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE comuna ALTER COLUMN codigo SET DEFAULT nextval('comuna_codigo_seq'::regclass);


--
-- TOC entry 1758 (class 2604 OID 27914)
-- Dependencies: 1376 1377 1377
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE detalle_costos ALTER COLUMN id SET DEFAULT nextval('detalle_costos_id_seq'::regclass);


--
-- TOC entry 1759 (class 2604 OID 27925)
-- Dependencies: 1378 1379 1379
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE estado_civil ALTER COLUMN codigo SET DEFAULT nextval('estado_civil_codigo_seq'::regclass);


--
-- TOC entry 1760 (class 2604 OID 27936)
-- Dependencies: 1380 1381 1381
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE familia ALTER COLUMN codigo SET DEFAULT nextval('familia_codigo_seq'::regclass);


--
-- TOC entry 1761 (class 2604 OID 27947)
-- Dependencies: 1383 1382 1383
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE grupo ALTER COLUMN codigo SET DEFAULT nextval('grupo_codigo_seq'::regclass);


--
-- TOC entry 1762 (class 2604 OID 27968)
-- Dependencies: 1386 1387 1387
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE input_gobierno ALTER COLUMN codigo SET DEFAULT nextval('input_gobierno_codigo_seq'::regclass);


--
-- TOC entry 1763 (class 2604 OID 27979)
-- Dependencies: 1388 1389 1389
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE material ALTER COLUMN codigo SET DEFAULT nextval('material_codigo_seq'::regclass);


--
-- TOC entry 1764 (class 2604 OID 27990)
-- Dependencies: 1391 1390 1391
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE modulo ALTER COLUMN codigo SET DEFAULT nextval('modulo_codigo_seq'::regclass);


--
-- TOC entry 1765 (class 2604 OID 28009)
-- Dependencies: 1394 1393 1394
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE nivel_educacional ALTER COLUMN codigo SET DEFAULT nextval('nivel_educacional_codigo_seq'::regclass);


--
-- TOC entry 1766 (class 2604 OID 28020)
-- Dependencies: 1395 1396 1396
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ocupacion ALTER COLUMN codigo SET DEFAULT nextval('ocupacion_codigo_seq'::regclass);


--
-- TOC entry 1767 (class 2604 OID 28034)
-- Dependencies: 1397 1398 1398
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE programa ALTER COLUMN codigo SET DEFAULT nextval('programa_codigo_seq'::regclass);


--
-- TOC entry 1768 (class 2604 OID 28045)
-- Dependencies: 1400 1399 1400
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE programa_estado ALTER COLUMN codigo SET DEFAULT nextval('programa_estado_codigo_seq'::regclass);


--
-- TOC entry 1769 (class 2604 OID 28064)
-- Dependencies: 1401 1402 1402
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE proyecto ALTER COLUMN codigo SET DEFAULT nextval('proyecto_codigo_seq'::regclass);


--
-- TOC entry 1770 (class 2604 OID 28075)
-- Dependencies: 1404 1403 1404
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE region ALTER COLUMN codigo SET DEFAULT nextval('region_codigo_seq'::regclass);


--
-- TOC entry 1771 (class 2604 OID 28083)
-- Dependencies: 1405 1406 1406
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE sesion ALTER COLUMN id SET DEFAULT nextval('sesion_id_seq'::regclass);


--
-- TOC entry 1772 (class 2604 OID 28102)
-- Dependencies: 1408 1409 1409
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE thesaurus ALTER COLUMN codigo SET DEFAULT nextval('thesaurus_codigo_seq'::regclass);


--
-- TOC entry 1773 (class 2604 OID 28123)
-- Dependencies: 1413 1412 1413
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tipo_calle ALTER COLUMN codigo SET DEFAULT nextval('tipo_calle_codigo_seq'::regclass);


--
-- TOC entry 1774 (class 2604 OID 28134)
-- Dependencies: 1414 1415 1415
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tipo_vivienda ALTER COLUMN codigo SET DEFAULT nextval('tipo_vivienda_codigo_seq'::regclass);


--
-- TOC entry 1775 (class 2604 OID 28150)
-- Dependencies: 1417 1418 1418
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE zona ALTER COLUMN codigo SET DEFAULT nextval('zona_codigo_seq'::regclass);


--
-- TOC entry 1925 (class 0 OID 27801)
-- Dependencies: 1358
-- Data for Name: actividad; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1926 (class 0 OID 27812)
-- Dependencies: 1360
-- Data for Name: actividad_estado; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1927 (class 0 OID 27829)
-- Dependencies: 1361
-- Data for Name: actividad_material; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1928 (class 0 OID 27837)
-- Dependencies: 1362
-- Data for Name: actividad_monitor; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1929 (class 0 OID 27847)
-- Dependencies: 1364
-- Data for Name: actividad_resultado; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1930 (class 0 OID 27858)
-- Dependencies: 1366
-- Data for Name: actividad_tipo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1931 (class 0 OID 27869)
-- Dependencies: 1368
-- Data for Name: actividad_zona; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1932 (class 0 OID 27877)
-- Dependencies: 1370
-- Data for Name: centro_familiar; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1933 (class 0 OID 27888)
-- Dependencies: 1372
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1934 (class 0 OID 27894)
-- Dependencies: 1373
-- Data for Name: cobertura_monitor; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1935 (class 0 OID 27904)
-- Dependencies: 1375
-- Data for Name: comuna; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1936 (class 0 OID 27912)
-- Dependencies: 1377
-- Data for Name: detalle_costos; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1937 (class 0 OID 27923)
-- Dependencies: 1379
-- Data for Name: estado_civil; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1938 (class 0 OID 27934)
-- Dependencies: 1381
-- Data for Name: familia; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1939 (class 0 OID 27945)
-- Dependencies: 1383
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1940 (class 0 OID 27954)
-- Dependencies: 1384
-- Data for Name: grupo_login; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1941 (class 0 OID 27959)
-- Dependencies: 1385
-- Data for Name: grupo_modulo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1942 (class 0 OID 27966)
-- Dependencies: 1387
-- Data for Name: input_gobierno; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1943 (class 0 OID 27977)
-- Dependencies: 1389
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1944 (class 0 OID 27988)
-- Dependencies: 1391
-- Data for Name: modulo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen) VALUES (2, NULL, 'planificacion', 'Planificación', '/Planificacion', NULL, 'projects.png');
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen) VALUES (3, NULL, 'reporte', 'Reportes', '/Reporte', NULL, 'reports.png');
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen) VALUES (4, 1, 'centro_familiar', 'Centros', '/CentroFamiliar', NULL, 'centro.png');
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen) VALUES (5, 1, 'grupo', 'Grupos', '/Grupo', NULL, 'groups.png');
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen) VALUES (6, 1, 'usuario', 'Usuarios', '/Usuario', NULL, 'usuario.png');
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen) VALUES (7, 1, 'programa', 'Programas', '/Programa', NULL, 'projects.png');
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen) VALUES (8, 1, 'actividad', 'Actividades', '/Actividad', NULL, 'actividad.png');
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen) VALUES (9, 1, 'monitor', 'Monitores', '/Monitor', NULL, 'actividad.png');
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen) VALUES (1, NULL, 'configuracion', 'Configuración', NULL, NULL, 'settings.png');


--
-- TOC entry 1945 (class 0 OID 27997)
-- Dependencies: 1392
-- Data for Name: monitor; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1946 (class 0 OID 28007)
-- Dependencies: 1394
-- Data for Name: nivel_educacional; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1947 (class 0 OID 28018)
-- Dependencies: 1396
-- Data for Name: ocupacion; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1948 (class 0 OID 28032)
-- Dependencies: 1398
-- Data for Name: programa; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1949 (class 0 OID 28043)
-- Dependencies: 1400
-- Data for Name: programa_estado; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1950 (class 0 OID 28062)
-- Dependencies: 1402
-- Data for Name: proyecto; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1951 (class 0 OID 28073)
-- Dependencies: 1404
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1952 (class 0 OID 28081)
-- Dependencies: 1406
-- Data for Name: sesion; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1953 (class 0 OID 28090)
-- Dependencies: 1407
-- Data for Name: sub_familia; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1954 (class 0 OID 28100)
-- Dependencies: 1409
-- Data for Name: thesaurus; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1955 (class 0 OID 28109)
-- Dependencies: 1410
-- Data for Name: thesaurus_actividad; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1956 (class 0 OID 28114)
-- Dependencies: 1411
-- Data for Name: thesaurus_programa; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1957 (class 0 OID 28121)
-- Dependencies: 1413
-- Data for Name: tipo_calle; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1958 (class 0 OID 28132)
-- Dependencies: 1415
-- Data for Name: tipo_vivienda; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1959 (class 0 OID 28141)
-- Dependencies: 1416
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO usuario (usuario, clave, inicio_sesion, fin_sesion, ultimo_acceso, origen, bloqueado) VALUES ('werfghjqwefrgqwfgwdf', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO usuario (usuario, clave, inicio_sesion, fin_sesion, ultimo_acceso, origen, bloqueado) VALUES ('undefined           ', '5e543256c480ac577d30f76f9120eb74', '2008-03-25 16:19:05.593', NULL, '2008-03-25 16:19:05.593', '127.0.0.1', NULL);


--
-- TOC entry 1960 (class 0 OID 28148)
-- Dependencies: 1418
-- Data for Name: zona; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1961 (class 0 OID 28154)
-- Dependencies: 1419
-- Data for Name: zona_comuna; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1783 (class 2606 OID 27835)
-- Dependencies: 1361 1361 1361
-- Name: actividad_material_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY actividad_material
    ADD CONSTRAINT actividad_material_pkey PRIMARY KEY (material, actividad);


--
-- TOC entry 1777 (class 2606 OID 27808)
-- Dependencies: 1358 1358
-- Name: actividad_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY actividad
    ADD CONSTRAINT actividad_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1792 (class 2606 OID 27865)
-- Dependencies: 1366 1366
-- Name: actividad_tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY actividad_tipo
    ADD CONSTRAINT actividad_tipo_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1798 (class 2606 OID 27884)
-- Dependencies: 1370 1370
-- Name: centro_familiar_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY centro_familiar
    ADD CONSTRAINT centro_familiar_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1801 (class 2606 OID 27892)
-- Dependencies: 1372 1372
-- Name: ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1804 (class 2606 OID 27900)
-- Dependencies: 1373 1373 1373
-- Name: cobertura_monitor_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cobertura_monitor
    ADD CONSTRAINT cobertura_monitor_pkey PRIMARY KEY (rut_monitor, codigo_area);


--
-- TOC entry 1807 (class 2606 OID 27908)
-- Dependencies: 1375 1375
-- Name: comuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comuna
    ADD CONSTRAINT comuna_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1780 (class 2606 OID 27819)
-- Dependencies: 1360 1360
-- Name: estado_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY actividad_estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1816 (class 2606 OID 27941)
-- Dependencies: 1381 1381
-- Name: familia_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY familia
    ADD CONSTRAINT familia_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1880 (class 2606 OID 28144)
-- Dependencies: 1416 1416
-- Name: login_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT login_pkey PRIMARY KEY (usuario);


--
-- TOC entry 1832 (class 2606 OID 27984)
-- Dependencies: 1389 1389
-- Name: material_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY material
    ADD CONSTRAINT material_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1871 (class 2606 OID 28117)
-- Dependencies: 1411 1411 1411
-- Name: ocurrencia_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY thesaurus_programa
    ADD CONSTRAINT ocurrencia_pkey PRIMARY KEY (programa, thesaurus);


--
-- TOC entry 1787 (class 2606 OID 27843)
-- Dependencies: 1362 1362 1362 1362 1362 1362
-- Name: pk_actividad_monitor; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY actividad_monitor
    ADD CONSTRAINT pk_actividad_monitor PRIMARY KEY (codigo, codigo_centro_familiar, rut, codigo_programa, tipo_actividad);


--
-- TOC entry 1790 (class 2606 OID 27854)
-- Dependencies: 1364 1364
-- Name: pk_actividad_resultado; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY actividad_resultado
    ADD CONSTRAINT pk_actividad_resultado PRIMARY KEY (codigo);


--
-- TOC entry 1796 (class 2606 OID 27873)
-- Dependencies: 1368 1368
-- Name: pk_actividad_zona; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY actividad_zona
    ADD CONSTRAINT pk_actividad_zona PRIMARY KEY (id);


--
-- TOC entry 1811 (class 2606 OID 27919)
-- Dependencies: 1377 1377
-- Name: pk_detalle_costos; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY detalle_costos
    ADD CONSTRAINT pk_detalle_costos PRIMARY KEY (id);


--
-- TOC entry 1814 (class 2606 OID 27930)
-- Dependencies: 1379 1379
-- Name: pk_estado_civil; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY estado_civil
    ADD CONSTRAINT pk_estado_civil PRIMARY KEY (codigo);


--
-- TOC entry 1820 (class 2606 OID 27952)
-- Dependencies: 1383 1383
-- Name: pk_grupo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY grupo
    ADD CONSTRAINT pk_grupo PRIMARY KEY (codigo);


--
-- TOC entry 1823 (class 2606 OID 27957)
-- Dependencies: 1384 1384 1384
-- Name: pk_grupo_login; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY grupo_login
    ADD CONSTRAINT pk_grupo_login PRIMARY KEY (codigo_grupo, usuario);


--
-- TOC entry 1826 (class 2606 OID 27962)
-- Dependencies: 1385 1385 1385
-- Name: pk_grupo_modulo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY grupo_modulo
    ADD CONSTRAINT pk_grupo_modulo PRIMARY KEY (grupo, modulo);


--
-- TOC entry 1829 (class 2606 OID 27973)
-- Dependencies: 1387 1387
-- Name: pk_input_gobierno; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY input_gobierno
    ADD CONSTRAINT pk_input_gobierno PRIMARY KEY (codigo);


--
-- TOC entry 1835 (class 2606 OID 27995)
-- Dependencies: 1391 1391
-- Name: pk_modulo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT pk_modulo PRIMARY KEY (codigo);


--
-- TOC entry 1838 (class 2606 OID 28003)
-- Dependencies: 1392 1392
-- Name: pk_monitor; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY monitor
    ADD CONSTRAINT pk_monitor PRIMARY KEY (rut);


--
-- TOC entry 1841 (class 2606 OID 28014)
-- Dependencies: 1394 1394
-- Name: pk_nivel_educacional; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nivel_educacional
    ADD CONSTRAINT pk_nivel_educacional PRIMARY KEY (codigo);


--
-- TOC entry 1844 (class 2606 OID 28025)
-- Dependencies: 1396 1396
-- Name: pk_ocupacion; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ocupacion
    ADD CONSTRAINT pk_ocupacion PRIMARY KEY (codigo);


--
-- TOC entry 1850 (class 2606 OID 28050)
-- Dependencies: 1400 1400
-- Name: pk_programa_estado; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programa_estado
    ADD CONSTRAINT pk_programa_estado PRIMARY KEY (codigo);


--
-- TOC entry 1853 (class 2606 OID 28069)
-- Dependencies: 1402 1402
-- Name: pk_proyecto; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT pk_proyecto PRIMARY KEY (codigo);


--
-- TOC entry 1859 (class 2606 OID 28088)
-- Dependencies: 1406 1406
-- Name: pk_sesion; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sesion
    ADD CONSTRAINT pk_sesion PRIMARY KEY (id);


--
-- TOC entry 1868 (class 2606 OID 28112)
-- Dependencies: 1410 1410 1410
-- Name: pk_thesaurus_actividad; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY thesaurus_actividad
    ADD CONSTRAINT pk_thesaurus_actividad PRIMARY KEY (thesaurus, actividad);


--
-- TOC entry 1874 (class 2606 OID 28128)
-- Dependencies: 1413 1413
-- Name: pk_tipo_calle; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_calle
    ADD CONSTRAINT pk_tipo_calle PRIMARY KEY (codigo);


--
-- TOC entry 1877 (class 2606 OID 28139)
-- Dependencies: 1415 1415
-- Name: pk_tipo_vivienda; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_vivienda
    ADD CONSTRAINT pk_tipo_vivienda PRIMARY KEY (codigo);


--
-- TOC entry 1847 (class 2606 OID 28039)
-- Dependencies: 1398 1398
-- Name: programa_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programa
    ADD CONSTRAINT programa_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1856 (class 2606 OID 28077)
-- Dependencies: 1404 1404
-- Name: region_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY region
    ADD CONSTRAINT region_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1862 (class 2606 OID 28096)
-- Dependencies: 1407 1407
-- Name: sub_familia_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sub_familia
    ADD CONSTRAINT sub_familia_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1865 (class 2606 OID 28107)
-- Dependencies: 1409 1409
-- Name: thesaurus_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY thesaurus
    ADD CONSTRAINT thesaurus_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1886 (class 2606 OID 28157)
-- Dependencies: 1419 1419 1419
-- Name: zona_comuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY zona_comuna
    ADD CONSTRAINT zona_comuna_pkey PRIMARY KEY (codigo_comuna, codigo_zona);


--
-- TOC entry 1883 (class 2606 OID 28152)
-- Dependencies: 1418 1418
-- Name: zona_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY zona
    ADD CONSTRAINT zona_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1778 (class 1259 OID 27809)
-- Dependencies: 1358
-- Name: index_1; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_1 ON actividad USING btree (codigo);


--
-- TOC entry 1817 (class 1259 OID 27942)
-- Dependencies: 1381
-- Name: index_10; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_10 ON familia USING btree (codigo);


--
-- TOC entry 1809 (class 1259 OID 27920)
-- Dependencies: 1377
-- Name: index_11; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_11 ON detalle_costos USING btree (id);


--
-- TOC entry 1878 (class 1259 OID 28145)
-- Dependencies: 1416
-- Name: index_12; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_12 ON usuario USING btree (usuario);


--
-- TOC entry 1830 (class 1259 OID 27985)
-- Dependencies: 1389
-- Name: index_13; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_13 ON material USING btree (codigo);


--
-- TOC entry 1869 (class 1259 OID 28118)
-- Dependencies: 1411 1411
-- Name: index_14; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_14 ON thesaurus_programa USING btree (programa, thesaurus);


--
-- TOC entry 1845 (class 1259 OID 28040)
-- Dependencies: 1398
-- Name: index_16; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_16 ON programa USING btree (codigo);


--
-- TOC entry 1812 (class 1259 OID 27931)
-- Dependencies: 1379
-- Name: index_18; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_18 ON estado_civil USING btree (codigo);


--
-- TOC entry 1854 (class 1259 OID 28078)
-- Dependencies: 1404
-- Name: index_19; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_19 ON region USING btree (codigo);


--
-- TOC entry 1784 (class 1259 OID 27836)
-- Dependencies: 1361 1361
-- Name: index_2; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_2 ON actividad_material USING btree (material, actividad);


--
-- TOC entry 1860 (class 1259 OID 28097)
-- Dependencies: 1407
-- Name: index_20; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_20 ON sub_familia USING btree (codigo);


--
-- TOC entry 1863 (class 1259 OID 28108)
-- Dependencies: 1409
-- Name: index_21; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_21 ON thesaurus USING btree (codigo);


--
-- TOC entry 1881 (class 1259 OID 28153)
-- Dependencies: 1418
-- Name: index_22; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_22 ON zona USING btree (codigo);


--
-- TOC entry 1884 (class 1259 OID 28158)
-- Dependencies: 1419 1419
-- Name: index_23; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_23 ON zona_comuna USING btree (codigo_comuna, codigo_zona);


--
-- TOC entry 1836 (class 1259 OID 28004)
-- Dependencies: 1392
-- Name: index_24; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_24 ON monitor USING btree (rut);


--
-- TOC entry 1785 (class 1259 OID 27844)
-- Dependencies: 1362 1362 1362 1362 1362
-- Name: index_25; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_25 ON actividad_monitor USING btree (codigo, codigo_centro_familiar, rut, codigo_programa, tipo_actividad);


--
-- TOC entry 1818 (class 1259 OID 27953)
-- Dependencies: 1383
-- Name: index_26; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_26 ON grupo USING btree (codigo);


--
-- TOC entry 1821 (class 1259 OID 27958)
-- Dependencies: 1384 1384
-- Name: index_27; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_27 ON grupo_login USING btree (codigo_grupo, usuario);


--
-- TOC entry 1824 (class 1259 OID 27963)
-- Dependencies: 1385 1385
-- Name: index_28; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_28 ON grupo_modulo USING btree (grupo, modulo);


--
-- TOC entry 1833 (class 1259 OID 27996)
-- Dependencies: 1391
-- Name: index_29; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_29 ON modulo USING btree (codigo);


--
-- TOC entry 1793 (class 1259 OID 27866)
-- Dependencies: 1366
-- Name: index_3; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_3 ON actividad_tipo USING btree (codigo);


--
-- TOC entry 1794 (class 1259 OID 27874)
-- Dependencies: 1368
-- Name: index_30; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_30 ON actividad_zona USING btree (id);


--
-- TOC entry 1799 (class 1259 OID 27885)
-- Dependencies: 1370
-- Name: index_31; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_31 ON centro_familiar USING btree (codigo);


--
-- TOC entry 1848 (class 1259 OID 28051)
-- Dependencies: 1400
-- Name: index_32; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_32 ON programa_estado USING btree (codigo);


--
-- TOC entry 1851 (class 1259 OID 28070)
-- Dependencies: 1402
-- Name: index_33; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_33 ON proyecto USING btree (codigo);


--
-- TOC entry 1857 (class 1259 OID 28089)
-- Dependencies: 1406
-- Name: index_34; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_34 ON sesion USING btree (id);


--
-- TOC entry 1866 (class 1259 OID 28113)
-- Dependencies: 1410 1410
-- Name: index_35; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_35 ON thesaurus_actividad USING btree (thesaurus, actividad);


--
-- TOC entry 1839 (class 1259 OID 28015)
-- Dependencies: 1394
-- Name: index_36; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_36 ON nivel_educacional USING btree (codigo);


--
-- TOC entry 1842 (class 1259 OID 28026)
-- Dependencies: 1396
-- Name: index_37; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_37 ON ocupacion USING btree (codigo);


--
-- TOC entry 1872 (class 1259 OID 28129)
-- Dependencies: 1413
-- Name: index_38; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_38 ON tipo_calle USING btree (codigo);


--
-- TOC entry 1875 (class 1259 OID 28140)
-- Dependencies: 1415
-- Name: index_39; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_39 ON tipo_vivienda USING btree (codigo);


--
-- TOC entry 1788 (class 1259 OID 27855)
-- Dependencies: 1364
-- Name: index_4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_4 ON actividad_resultado USING btree (codigo);


--
-- TOC entry 1827 (class 1259 OID 27974)
-- Dependencies: 1387
-- Name: index_40; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_40 ON input_gobierno USING btree (codigo);


--
-- TOC entry 1802 (class 1259 OID 27893)
-- Dependencies: 1372
-- Name: index_5; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_5 ON ciudad USING btree (codigo);


--
-- TOC entry 1805 (class 1259 OID 27901)
-- Dependencies: 1373 1373
-- Name: index_6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_6 ON cobertura_monitor USING btree (rut_monitor, codigo_area);


--
-- TOC entry 1808 (class 1259 OID 27909)
-- Dependencies: 1375
-- Name: index_8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_8 ON comuna USING btree (codigo);


--
-- TOC entry 1781 (class 1259 OID 27820)
-- Dependencies: 1360
-- Name: index_9; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_9 ON actividad_estado USING btree (codigo);


--
-- TOC entry 1890 (class 2606 OID 28164)
-- Dependencies: 1779 1358 1360
-- Name: fk_act_ref_act_est; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad
    ADD CONSTRAINT fk_act_ref_act_est FOREIGN KEY (estado) REFERENCES actividad_estado(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1889 (class 2606 OID 28169)
-- Dependencies: 1364 1358 1789
-- Name: fk_act_ref_act_res; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad
    ADD CONSTRAINT fk_act_ref_act_res FOREIGN KEY (resultado) REFERENCES actividad_resultado(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1893 (class 2606 OID 28184)
-- Dependencies: 1358 1776 1361
-- Name: fk_activida_reference_activida; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_material
    ADD CONSTRAINT fk_activida_reference_activida FOREIGN KEY (actividad) REFERENCES actividad(codigo);


--
-- TOC entry 1894 (class 2606 OID 28199)
-- Dependencies: 1362 1776 1358
-- Name: fk_activida_reference_activida; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_monitor
    ADD CONSTRAINT fk_activida_reference_activida FOREIGN KEY (codigo) REFERENCES actividad(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1897 (class 2606 OID 28204)
-- Dependencies: 1776 1368 1358
-- Name: fk_activida_reference_activida; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_zona
    ADD CONSTRAINT fk_activida_reference_activida FOREIGN KEY (act_codigo) REFERENCES actividad(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1892 (class 2606 OID 28189)
-- Dependencies: 1831 1361 1389
-- Name: fk_activida_reference_material; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_material
    ADD CONSTRAINT fk_activida_reference_material FOREIGN KEY (material) REFERENCES material(codigo);


--
-- TOC entry 1895 (class 2606 OID 28194)
-- Dependencies: 1362 1392 1837
-- Name: fk_activida_reference_monitor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_monitor
    ADD CONSTRAINT fk_activida_reference_monitor FOREIGN KEY (rut) REFERENCES monitor(rut) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1888 (class 2606 OID 28174)
-- Dependencies: 1398 1358 1846
-- Name: fk_activida_reference_programa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad
    ADD CONSTRAINT fk_activida_reference_programa FOREIGN KEY (programa) REFERENCES programa(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1887 (class 2606 OID 28179)
-- Dependencies: 1416 1879 1358
-- Name: fk_activida_reference_usuario; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad
    ADD CONSTRAINT fk_activida_reference_usuario FOREIGN KEY (responsable) REFERENCES usuario(usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1896 (class 2606 OID 28209)
-- Dependencies: 1368 1418 1882
-- Name: fk_activida_reference_zona; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_zona
    ADD CONSTRAINT fk_activida_reference_zona FOREIGN KEY (codigo) REFERENCES zona(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1891 (class 2606 OID 28159)
-- Dependencies: 1358 1366 1791
-- Name: fk_actividad_ref_actividad_tipo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad
    ADD CONSTRAINT fk_actividad_ref_actividad_tipo FOREIGN KEY (tipo) REFERENCES actividad_tipo(codigo);


--
-- TOC entry 1924 (class 2606 OID 28339)
-- Dependencies: 1806 1419 1375
-- Name: fk_area_com_reference_comuna; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zona_comuna
    ADD CONSTRAINT fk_area_com_reference_comuna FOREIGN KEY (codigo_comuna) REFERENCES comuna(codigo);


--
-- TOC entry 1923 (class 2606 OID 28344)
-- Dependencies: 1419 1418 1882
-- Name: fk_area_com_reference_zona; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zona_comuna
    ADD CONSTRAINT fk_area_com_reference_zona FOREIGN KEY (codigo_zona) REFERENCES zona(codigo);


--
-- TOC entry 1898 (class 2606 OID 28214)
-- Dependencies: 1806 1370 1375
-- Name: fk_centro_f_reference_comuna; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY centro_familiar
    ADD CONSTRAINT fk_centro_f_reference_comuna FOREIGN KEY (comuna) REFERENCES comuna(codigo);


--
-- TOC entry 1899 (class 2606 OID 28219)
-- Dependencies: 1372 1404 1855
-- Name: fk_ciudad_reference_region; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT fk_ciudad_reference_region FOREIGN KEY (codigo_region) REFERENCES region(codigo);


--
-- TOC entry 1901 (class 2606 OID 28224)
-- Dependencies: 1882 1373 1418
-- Name: fk_cobertur_referenc_areas; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cobertura_monitor
    ADD CONSTRAINT fk_cobertur_referenc_areas FOREIGN KEY (codigo_area) REFERENCES zona(codigo);


--
-- TOC entry 1900 (class 2606 OID 28229)
-- Dependencies: 1373 1837 1392
-- Name: fk_cobertur_reference_monitor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cobertura_monitor
    ADD CONSTRAINT fk_cobertur_reference_monitor FOREIGN KEY (rut_monitor) REFERENCES monitor(rut) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1902 (class 2606 OID 28234)
-- Dependencies: 1800 1375 1372
-- Name: fk_comuna_reference_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comuna
    ADD CONSTRAINT fk_comuna_reference_ciudad FOREIGN KEY (codigo_ciudad) REFERENCES ciudad(codigo);


--
-- TOC entry 1903 (class 2606 OID 28239)
-- Dependencies: 1358 1377 1776
-- Name: fk_detalle__reference_activida; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY detalle_costos
    ADD CONSTRAINT fk_detalle__reference_activida FOREIGN KEY (codigo_actividad) REFERENCES actividad(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1905 (class 2606 OID 28244)
-- Dependencies: 1384 1819 1383
-- Name: fk_grupo_lo_reference_grupo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupo_login
    ADD CONSTRAINT fk_grupo_lo_reference_grupo FOREIGN KEY (codigo_grupo) REFERENCES grupo(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1904 (class 2606 OID 28249)
-- Dependencies: 1416 1384 1879
-- Name: fk_grupo_lo_reference_usuario; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupo_login
    ADD CONSTRAINT fk_grupo_lo_reference_usuario FOREIGN KEY (usuario) REFERENCES usuario(usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1907 (class 2606 OID 28254)
-- Dependencies: 1383 1819 1385
-- Name: fk_grupo_mo_reference_grupo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupo_modulo
    ADD CONSTRAINT fk_grupo_mo_reference_grupo FOREIGN KEY (grupo) REFERENCES grupo(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1906 (class 2606 OID 28259)
-- Dependencies: 1385 1834 1391
-- Name: fk_grupo_mo_reference_modulo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupo_modulo
    ADD CONSTRAINT fk_grupo_mo_reference_modulo FOREIGN KEY (modulo) REFERENCES modulo(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1908 (class 2606 OID 28264)
-- Dependencies: 1852 1402 1387
-- Name: fk_input_go_reference_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY input_gobierno
    ADD CONSTRAINT fk_input_go_reference_proyecto FOREIGN KEY (proyecto) REFERENCES proyecto(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1909 (class 2606 OID 28269)
-- Dependencies: 1389 1861 1407
-- Name: fk_material_reference_sub_fami; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY material
    ADD CONSTRAINT fk_material_reference_sub_fami FOREIGN KEY (sub_familia) REFERENCES sub_familia(codigo);


--
-- TOC entry 1910 (class 2606 OID 28274)
-- Dependencies: 1391 1834 1391
-- Name: fk_modulo_reference_modulo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT fk_modulo_reference_modulo FOREIGN KEY (modulo) REFERENCES modulo(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1911 (class 2606 OID 28279)
-- Dependencies: 1416 1879 1392
-- Name: fk_monitor_reference_usuario; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY monitor
    ADD CONSTRAINT fk_monitor_reference_usuario FOREIGN KEY (usuario) REFERENCES usuario(usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1912 (class 2606 OID 28289)
-- Dependencies: 1398 1849 1400
-- Name: fk_programa_reference_programa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programa
    ADD CONSTRAINT fk_programa_reference_programa FOREIGN KEY (estado) REFERENCES programa_estado(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1913 (class 2606 OID 28284)
-- Dependencies: 1398 1402 1852
-- Name: fk_programa_reference_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programa
    ADD CONSTRAINT fk_programa_reference_proyecto FOREIGN KEY (proyecto) REFERENCES proyecto(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1915 (class 2606 OID 28294)
-- Dependencies: 1370 1402 1797
-- Name: fk_proyecto_reference_centro_f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT fk_proyecto_reference_centro_f FOREIGN KEY (centro_familiar) REFERENCES centro_familiar(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1914 (class 2606 OID 28299)
-- Dependencies: 1416 1879 1402
-- Name: fk_proyecto_reference_usuario; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT fk_proyecto_reference_usuario FOREIGN KEY (usuario) REFERENCES usuario(usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1917 (class 2606 OID 28304)
-- Dependencies: 1776 1358 1406
-- Name: fk_sesion_reference_activida; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sesion
    ADD CONSTRAINT fk_sesion_reference_activida FOREIGN KEY (actividad) REFERENCES actividad(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1916 (class 2606 OID 28309)
-- Dependencies: 1406 1837 1392
-- Name: fk_sesion_reference_monitor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sesion
    ADD CONSTRAINT fk_sesion_reference_monitor FOREIGN KEY (rut) REFERENCES monitor(rut) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1918 (class 2606 OID 28314)
-- Dependencies: 1407 1381 1815
-- Name: fk_sub_fami_reference_familia; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sub_familia
    ADD CONSTRAINT fk_sub_fami_reference_familia FOREIGN KEY (familia) REFERENCES familia(codigo);


--
-- TOC entry 1919 (class 2606 OID 28324)
-- Dependencies: 1410 1358 1776
-- Name: fk_thesauru_reference_activida; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY thesaurus_actividad
    ADD CONSTRAINT fk_thesauru_reference_activida FOREIGN KEY (actividad) REFERENCES actividad(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1920 (class 2606 OID 28319)
-- Dependencies: 1864 1410 1409
-- Name: fk_thesauru_reference_thesauru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY thesaurus_actividad
    ADD CONSTRAINT fk_thesauru_reference_thesauru FOREIGN KEY (thesaurus) REFERENCES thesaurus(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1921 (class 2606 OID 28334)
-- Dependencies: 1864 1409 1411
-- Name: fk_thesauru_reference_thesauru; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY thesaurus_programa
    ADD CONSTRAINT fk_thesauru_reference_thesauru FOREIGN KEY (thesaurus) REFERENCES thesaurus(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1922 (class 2606 OID 28329)
-- Dependencies: 1411 1398 1846
-- Name: programa_ocurrencia_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY thesaurus_programa
    ADD CONSTRAINT programa_ocurrencia_fk FOREIGN KEY (programa) REFERENCES programa(codigo);


--
-- TOC entry 1967 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM funfamilia;
GRANT ALL ON SCHEMA public TO funfamilia;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2008-03-25 16:35:56

--
-- PostgreSQL database dump complete
--

