--
-- PostgreSQL database dump
--

-- Started on 2008-04-04 14:22:26

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1968 (class 1262 OID 18290)
-- Dependencies: 1967
-- Name: funfamilia; Type: COMMENT; Schema: -; Owner: funfamilia
--

COMMENT ON DATABASE funfamilia IS 'Base de datos proyecto Fundacion de la Familia';


--
-- TOC entry 1969 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- TOC entry 352 (class 2612 OID 19064)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- TOC entry 1357 (class 1259 OID 19065)
-- Dependencies: 5
-- Name: actividad; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE actividad (
    codigo integer NOT NULL,
    programa integer NOT NULL,
    actividad_tipo integer NOT NULL,
    estado integer NOT NULL,
    actividad_resultado integer NOT NULL,
    usuario character(20),
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


ALTER TABLE public.actividad OWNER TO funfamilia;

--
-- TOC entry 1971 (class 0 OID 0)
-- Dependencies: 1357
-- Name: TABLE actividad; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON TABLE actividad IS 'Las actividades que contienen los programas';


--
-- TOC entry 1972 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.codigo; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.codigo IS 'Código para individualizar el registro';


--
-- TOC entry 1973 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.programa; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.programa IS 'Programa al cual pertenece la actividad';


--
-- TOC entry 1974 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.actividad_tipo; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.actividad_tipo IS 'Tipo de la actividad, hace referencia a la tabla actividad_tipo';


--
-- TOC entry 1975 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.estado; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.estado IS 'Estado de la actividad, hace referencia a la tabla actividad_estado';


--
-- TOC entry 1976 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.actividad_resultado; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.actividad_resultado IS 'Resultado de la actividad, hace referencia a la tabla actividad_resultado';


--
-- TOC entry 1977 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.usuario; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.usuario IS 'Responsable de la actividad, hace referencia a la tabla usuario';


--
-- TOC entry 1978 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.nombre; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.nombre IS 'El nombre dado para el registro';


--
-- TOC entry 1979 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.descripcion; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.descripcion IS 'Una descripción opcional para el registro';


--
-- TOC entry 1980 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.avance; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.avance IS 'Porcentaje de avance para la actividad';


--
-- TOC entry 1981 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.costo; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.costo IS 'El costo de la actividad expresado en pesos (CLP)';


--
-- TOC entry 1982 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.fecha_inicio; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.fecha_inicio IS 'Fecha programada para el inicio de la actividad';


--
-- TOC entry 1983 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.fecha_termino; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.fecha_termino IS 'Fecha programada para el termino de la actividad';


--
-- TOC entry 1984 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.fecha_inicio_real; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.fecha_inicio_real IS 'Fecha real en la que se inicia la actividad';


--
-- TOC entry 1985 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.fecha_termino_real; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.fecha_termino_real IS 'Fecha real en la que se termina la actividad';


--
-- TOC entry 1986 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.cantidad_sesiones_programadas; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.cantidad_sesiones_programadas IS 'La cantidad de sesiones que se programan para la actividad';


--
-- TOC entry 1987 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.cantidad_sesiones_realizadas; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.cantidad_sesiones_realizadas IS 'La cantidad de sesiones que se realizaron en la actividad';


--
-- TOC entry 1988 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.cantidad_personas; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.cantidad_personas IS 'La cantidad de personas que se programan para que asistan a la actividad.  Este valor puede ser nulo dependiendo del tipo de actividad definido en la tabla actividad_tipo.  Sera nulo cuando la actividad sea de tipo "masiva"';


--
-- TOC entry 1989 (class 0 OID 0)
-- Dependencies: 1357
-- Name: COLUMN actividad.cantidad_personas_total; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad.cantidad_personas_total IS 'La cantidad de personas que asistieron a la actividad.  Este valor puede ser nulo dependiendo del tipo de actividad definido en la tabla actividad_tipo.  Sera nulo cuando la actividad sea de tipo "masiva"';


--
-- TOC entry 1358 (class 1259 OID 19070)
-- Dependencies: 5 1357
-- Name: actividad_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE actividad_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.actividad_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 1990 (class 0 OID 0)
-- Dependencies: 1358
-- Name: actividad_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE actividad_codigo_seq OWNED BY actividad.codigo;


--
-- TOC entry 1991 (class 0 OID 0)
-- Dependencies: 1358
-- Name: actividad_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('actividad_codigo_seq', 1, false);


--
-- TOC entry 1359 (class 1259 OID 19072)
-- Dependencies: 5
-- Name: actividad_estado; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE actividad_estado (
    codigo integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text
);


ALTER TABLE public.actividad_estado OWNER TO funfamilia;

--
-- TOC entry 1992 (class 0 OID 0)
-- Dependencies: 1359
-- Name: TABLE actividad_estado; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON TABLE actividad_estado IS 'Los estados en que puede estar una actividad';


--
-- TOC entry 1993 (class 0 OID 0)
-- Dependencies: 1359
-- Name: COLUMN actividad_estado.codigo; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad_estado.codigo IS 'Código para individualizar el registro';


--
-- TOC entry 1994 (class 0 OID 0)
-- Dependencies: 1359
-- Name: COLUMN actividad_estado.nombre; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad_estado.nombre IS 'El nombre dado para el registro';


--
-- TOC entry 1995 (class 0 OID 0)
-- Dependencies: 1359
-- Name: COLUMN actividad_estado.descripcion; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad_estado.descripcion IS 'Una descripción opcional para el registro';


--
-- TOC entry 1360 (class 1259 OID 19077)
-- Dependencies: 1359 5
-- Name: actividad_estado_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE actividad_estado_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.actividad_estado_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 1996 (class 0 OID 0)
-- Dependencies: 1360
-- Name: actividad_estado_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE actividad_estado_codigo_seq OWNED BY actividad_estado.codigo;


--
-- TOC entry 1997 (class 0 OID 0)
-- Dependencies: 1360
-- Name: actividad_estado_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('actividad_estado_codigo_seq', 1, false);


--
-- TOC entry 1361 (class 1259 OID 19079)
-- Dependencies: 5
-- Name: actividad_material; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE actividad_material (
    material integer NOT NULL,
    actividad integer NOT NULL,
    cantidad numeric
);


ALTER TABLE public.actividad_material OWNER TO funfamilia;

--
-- TOC entry 1362 (class 1259 OID 19084)
-- Dependencies: 5
-- Name: actividad_monitor; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE actividad_monitor (
    codigo integer NOT NULL,
    codigo_centro_familiar integer NOT NULL,
    codigo_programa integer NOT NULL,
    tipo_actividad integer NOT NULL,
    fecha_inicio_asignacion timestamp without time zone,
    fecha_fin_asignacion timestamp without time zone,
    fecha_inicio_real_asignacion timestamp without time zone,
    fecha_fin_real_asignacion timestamp without time zone,
    usuario character(20)
);


ALTER TABLE public.actividad_monitor OWNER TO funfamilia;

--
-- TOC entry 1363 (class 1259 OID 19089)
-- Dependencies: 5
-- Name: actividad_resultado; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE actividad_resultado (
    codigo integer NOT NULL,
    nombre character(255) NOT NULL,
    descripcion text
);


ALTER TABLE public.actividad_resultado OWNER TO funfamilia;

--
-- TOC entry 1998 (class 0 OID 0)
-- Dependencies: 1363
-- Name: TABLE actividad_resultado; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON TABLE actividad_resultado IS 'Almacena los resultados con los que puede ser calificada una actividad';


--
-- TOC entry 1999 (class 0 OID 0)
-- Dependencies: 1363
-- Name: COLUMN actividad_resultado.codigo; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad_resultado.codigo IS 'Código para individualizar el registro';


--
-- TOC entry 2000 (class 0 OID 0)
-- Dependencies: 1363
-- Name: COLUMN actividad_resultado.nombre; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad_resultado.nombre IS 'El nombre dado para el registro';


--
-- TOC entry 2001 (class 0 OID 0)
-- Dependencies: 1363
-- Name: COLUMN actividad_resultado.descripcion; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON COLUMN actividad_resultado.descripcion IS 'Una descripción opcional para el registro';


--
-- TOC entry 1364 (class 1259 OID 19094)
-- Dependencies: 5 1363
-- Name: actividad_resultado_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE actividad_resultado_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.actividad_resultado_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2002 (class 0 OID 0)
-- Dependencies: 1364
-- Name: actividad_resultado_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE actividad_resultado_codigo_seq OWNED BY actividad_resultado.codigo;


--
-- TOC entry 2003 (class 0 OID 0)
-- Dependencies: 1364
-- Name: actividad_resultado_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('actividad_resultado_codigo_seq', 1, false);


--
-- TOC entry 1365 (class 1259 OID 19096)
-- Dependencies: 5
-- Name: actividad_tipo; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE actividad_tipo (
    codigo integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text
);


ALTER TABLE public.actividad_tipo OWNER TO funfamilia;

--
-- TOC entry 1366 (class 1259 OID 19101)
-- Dependencies: 1365 5
-- Name: actividad_tipo_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE actividad_tipo_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.actividad_tipo_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2004 (class 0 OID 0)
-- Dependencies: 1366
-- Name: actividad_tipo_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE actividad_tipo_codigo_seq OWNED BY actividad_tipo.codigo;


--
-- TOC entry 2005 (class 0 OID 0)
-- Dependencies: 1366
-- Name: actividad_tipo_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('actividad_tipo_codigo_seq', 1, false);


--
-- TOC entry 1367 (class 1259 OID 19103)
-- Dependencies: 5
-- Name: actividad_zona; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE actividad_zona (
    act_codigo integer,
    codigo integer,
    id integer NOT NULL
);


ALTER TABLE public.actividad_zona OWNER TO funfamilia;

--
-- TOC entry 1368 (class 1259 OID 19105)
-- Dependencies: 1367 5
-- Name: actividad_zona_id_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE actividad_zona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.actividad_zona_id_seq OWNER TO funfamilia;

--
-- TOC entry 2006 (class 0 OID 0)
-- Dependencies: 1368
-- Name: actividad_zona_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE actividad_zona_id_seq OWNED BY actividad_zona.id;


--
-- TOC entry 2007 (class 0 OID 0)
-- Dependencies: 1368
-- Name: actividad_zona_id_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('actividad_zona_id_seq', 1, false);


--
-- TOC entry 1369 (class 1259 OID 19107)
-- Dependencies: 5
-- Name: centro_familiar; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
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


ALTER TABLE public.centro_familiar OWNER TO funfamilia;

--
-- TOC entry 2008 (class 0 OID 0)
-- Dependencies: 1369
-- Name: TABLE centro_familiar; Type: COMMENT; Schema: public; Owner: funfamilia
--

COMMENT ON TABLE centro_familiar IS 'Almacena los centros familiares que posee la organizacion';


--
-- TOC entry 1370 (class 1259 OID 19112)
-- Dependencies: 1369 5
-- Name: centro_familiar_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE centro_familiar_codigo_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.centro_familiar_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2009 (class 0 OID 0)
-- Dependencies: 1370
-- Name: centro_familiar_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE centro_familiar_codigo_seq OWNED BY centro_familiar.codigo;


--
-- TOC entry 2010 (class 0 OID 0)
-- Dependencies: 1370
-- Name: centro_familiar_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('centro_familiar_codigo_seq', 7, true);


--
-- TOC entry 1371 (class 1259 OID 19114)
-- Dependencies: 5
-- Name: ciudad; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE ciudad (
    codigo integer NOT NULL,
    codigo_region integer,
    ciudad character(255),
    latitud character varying(60),
    longitud character varying(60),
    zoom character varying(60)
);


ALTER TABLE public.ciudad OWNER TO funfamilia;

--
-- TOC entry 1372 (class 1259 OID 19116)
-- Dependencies: 5 1371
-- Name: ciudad_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE ciudad_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.ciudad_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2011 (class 0 OID 0)
-- Dependencies: 1372
-- Name: ciudad_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE ciudad_codigo_seq OWNED BY ciudad.codigo;


--
-- TOC entry 2012 (class 0 OID 0)
-- Dependencies: 1372
-- Name: ciudad_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('ciudad_codigo_seq', 1, false);


--
-- TOC entry 1373 (class 1259 OID 19118)
-- Dependencies: 5
-- Name: cobertura_monitor; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE cobertura_monitor (
    codigo_area integer NOT NULL,
    usuario character(20) NOT NULL
);


ALTER TABLE public.cobertura_monitor OWNER TO funfamilia;

--
-- TOC entry 1374 (class 1259 OID 19123)
-- Dependencies: 5
-- Name: comuna; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE comuna (
    codigo integer NOT NULL,
    codigo_ciudad integer,
    comuna character(255),
    latitud character varying(60),
    longitud character varying(60),
    zoom character varying(60)
);


ALTER TABLE public.comuna OWNER TO funfamilia;

--
-- TOC entry 1375 (class 1259 OID 19125)
-- Dependencies: 5 1374
-- Name: comuna_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE comuna_codigo_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.comuna_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2013 (class 0 OID 0)
-- Dependencies: 1375
-- Name: comuna_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE comuna_codigo_seq OWNED BY comuna.codigo;


--
-- TOC entry 2014 (class 0 OID 0)
-- Dependencies: 1375
-- Name: comuna_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('comuna_codigo_seq', 1, true);


--
-- TOC entry 1376 (class 1259 OID 19127)
-- Dependencies: 5
-- Name: detalle_costos; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE detalle_costos (
    id integer NOT NULL,
    codigo_actividad integer,
    descripcion text,
    costo numeric(10,2)
);


ALTER TABLE public.detalle_costos OWNER TO funfamilia;

--
-- TOC entry 1377 (class 1259 OID 19132)
-- Dependencies: 5 1376
-- Name: detalle_costos_id_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE detalle_costos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.detalle_costos_id_seq OWNER TO funfamilia;

--
-- TOC entry 2015 (class 0 OID 0)
-- Dependencies: 1377
-- Name: detalle_costos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE detalle_costos_id_seq OWNED BY detalle_costos.id;


--
-- TOC entry 2016 (class 0 OID 0)
-- Dependencies: 1377
-- Name: detalle_costos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('detalle_costos_id_seq', 1, false);


--
-- TOC entry 1378 (class 1259 OID 19134)
-- Dependencies: 5
-- Name: estado_civil; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE estado_civil (
    codigo integer NOT NULL,
    nombre character(255),
    descripcion text
);


ALTER TABLE public.estado_civil OWNER TO funfamilia;

--
-- TOC entry 1379 (class 1259 OID 19139)
-- Dependencies: 5 1378
-- Name: estado_civil_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE estado_civil_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estado_civil_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2017 (class 0 OID 0)
-- Dependencies: 1379
-- Name: estado_civil_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE estado_civil_codigo_seq OWNED BY estado_civil.codigo;


--
-- TOC entry 2018 (class 0 OID 0)
-- Dependencies: 1379
-- Name: estado_civil_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('estado_civil_codigo_seq', 1, false);


--
-- TOC entry 1380 (class 1259 OID 19141)
-- Dependencies: 5
-- Name: familia; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE familia (
    codigo integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text
);


ALTER TABLE public.familia OWNER TO funfamilia;

--
-- TOC entry 1381 (class 1259 OID 19146)
-- Dependencies: 1380 5
-- Name: familia_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE familia_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.familia_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2019 (class 0 OID 0)
-- Dependencies: 1381
-- Name: familia_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE familia_codigo_seq OWNED BY familia.codigo;


--
-- TOC entry 2020 (class 0 OID 0)
-- Dependencies: 1381
-- Name: familia_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('familia_codigo_seq', 1, false);


--
-- TOC entry 1382 (class 1259 OID 19148)
-- Dependencies: 5
-- Name: grupo; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE grupo (
    codigo integer NOT NULL,
    grupo character varying(80),
    descripcion text
);


ALTER TABLE public.grupo OWNER TO funfamilia;

--
-- TOC entry 1383 (class 1259 OID 19153)
-- Dependencies: 5 1382
-- Name: grupo_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE grupo_codigo_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.grupo_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2021 (class 0 OID 0)
-- Dependencies: 1383
-- Name: grupo_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE grupo_codigo_seq OWNED BY grupo.codigo;


--
-- TOC entry 2022 (class 0 OID 0)
-- Dependencies: 1383
-- Name: grupo_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('grupo_codigo_seq', 27, true);


--
-- TOC entry 1384 (class 1259 OID 19155)
-- Dependencies: 5
-- Name: grupo_login; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE grupo_login (
    codigo_grupo integer NOT NULL,
    usuario character(20) NOT NULL
);


ALTER TABLE public.grupo_login OWNER TO funfamilia;

--
-- TOC entry 1385 (class 1259 OID 19157)
-- Dependencies: 5
-- Name: grupo_modulo; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE grupo_modulo (
    grupo integer NOT NULL,
    modulo integer NOT NULL,
    privilegio character varying(10)
);


ALTER TABLE public.grupo_modulo OWNER TO funfamilia;

--
-- TOC entry 1386 (class 1259 OID 19159)
-- Dependencies: 5
-- Name: input_gobierno; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE input_gobierno (
    codigo integer NOT NULL,
    proyecto integer,
    fecha_inicio timestamp without time zone,
    fecha_termino timestamp without time zone,
    costo numeric(10,2),
    observaciones text
);


ALTER TABLE public.input_gobierno OWNER TO funfamilia;

--
-- TOC entry 1387 (class 1259 OID 19164)
-- Dependencies: 1386 5
-- Name: input_gobierno_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE input_gobierno_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.input_gobierno_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2023 (class 0 OID 0)
-- Dependencies: 1387
-- Name: input_gobierno_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE input_gobierno_codigo_seq OWNED BY input_gobierno.codigo;


--
-- TOC entry 2024 (class 0 OID 0)
-- Dependencies: 1387
-- Name: input_gobierno_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('input_gobierno_codigo_seq', 1, false);


--
-- TOC entry 1388 (class 1259 OID 19166)
-- Dependencies: 5
-- Name: material; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE material (
    codigo integer NOT NULL,
    sub_familia character(10),
    nombre character varying(60),
    descripcion text,
    costo numeric(10,2),
    unidad_medida character varying(255)
);


ALTER TABLE public.material OWNER TO funfamilia;

--
-- TOC entry 1389 (class 1259 OID 19171)
-- Dependencies: 5 1388
-- Name: material_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE material_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.material_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2025 (class 0 OID 0)
-- Dependencies: 1389
-- Name: material_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE material_codigo_seq OWNED BY material.codigo;


--
-- TOC entry 2026 (class 0 OID 0)
-- Dependencies: 1389
-- Name: material_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('material_codigo_seq', 1, false);


--
-- TOC entry 1390 (class 1259 OID 19173)
-- Dependencies: 1765 5
-- Name: modulo; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE modulo (
    codigo integer NOT NULL,
    modulo integer,
    nombre character varying(255),
    descripcion text,
    url text,
    bloqueado character(10),
    imagen text,
    dock boolean DEFAULT false
);


ALTER TABLE public.modulo OWNER TO funfamilia;

--
-- TOC entry 1391 (class 1259 OID 19179)
-- Dependencies: 5 1390
-- Name: modulo_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE modulo_codigo_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.modulo_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2027 (class 0 OID 0)
-- Dependencies: 1391
-- Name: modulo_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE modulo_codigo_seq OWNED BY modulo.codigo;


--
-- TOC entry 2028 (class 0 OID 0)
-- Dependencies: 1391
-- Name: modulo_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('modulo_codigo_seq', 35, true);


--
-- TOC entry 1392 (class 1259 OID 19186)
-- Dependencies: 5
-- Name: nivel_educacional; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE nivel_educacional (
    codigo integer NOT NULL,
    nombre character(255),
    descripcion text
);


ALTER TABLE public.nivel_educacional OWNER TO funfamilia;

--
-- TOC entry 1393 (class 1259 OID 19191)
-- Dependencies: 5 1392
-- Name: nivel_educacional_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE nivel_educacional_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.nivel_educacional_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2029 (class 0 OID 0)
-- Dependencies: 1393
-- Name: nivel_educacional_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE nivel_educacional_codigo_seq OWNED BY nivel_educacional.codigo;


--
-- TOC entry 2030 (class 0 OID 0)
-- Dependencies: 1393
-- Name: nivel_educacional_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('nivel_educacional_codigo_seq', 1, false);


--
-- TOC entry 1394 (class 1259 OID 19193)
-- Dependencies: 5
-- Name: ocupacion; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE ocupacion (
    codigo integer NOT NULL,
    nombre character(255),
    descripcion text
);


ALTER TABLE public.ocupacion OWNER TO funfamilia;

--
-- TOC entry 1395 (class 1259 OID 19198)
-- Dependencies: 5 1394
-- Name: ocupacion_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE ocupacion_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.ocupacion_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2031 (class 0 OID 0)
-- Dependencies: 1395
-- Name: ocupacion_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE ocupacion_codigo_seq OWNED BY ocupacion.codigo;


--
-- TOC entry 2032 (class 0 OID 0)
-- Dependencies: 1395
-- Name: ocupacion_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('ocupacion_codigo_seq', 1, false);


SET default_with_oids = false;

--
-- TOC entry 1396 (class 1259 OID 19200)
-- Dependencies: 1769 5
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE persona (
    rut integer NOT NULL,
    nombres character(80) NOT NULL,
    apellido_paterno character(80) NOT NULL,
    apellido_materno character(80) NOT NULL,
    sexo character(1) NOT NULL,
    fecha_nacimiento date NOT NULL,
    fecha_inscripcion timestamp without time zone DEFAULT now(),
    tipo_calle integer,
    tipo_vivienda integer,
    calle character(255),
    numero character(60),
    block character(60),
    piso character(60),
    numero_departamento character(60),
    comuna character(10),
    fono character(20),
    celular character(20),
    mail character(80),
    estado_civil integer,
    numero_miembros_familia smallint,
    nivel_educacional integer,
    ocupacion integer
);


ALTER TABLE public.persona OWNER TO postgres;

SET default_with_oids = true;

--
-- TOC entry 1397 (class 1259 OID 19206)
-- Dependencies: 5
-- Name: programa; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
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
    programa_estado integer
);


ALTER TABLE public.programa OWNER TO funfamilia;

--
-- TOC entry 1398 (class 1259 OID 19211)
-- Dependencies: 1397 5
-- Name: programa_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE programa_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.programa_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2033 (class 0 OID 0)
-- Dependencies: 1398
-- Name: programa_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE programa_codigo_seq OWNED BY programa.codigo;


--
-- TOC entry 2034 (class 0 OID 0)
-- Dependencies: 1398
-- Name: programa_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('programa_codigo_seq', 1, false);


--
-- TOC entry 1399 (class 1259 OID 19213)
-- Dependencies: 5
-- Name: programa_estado; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE programa_estado (
    codigo integer NOT NULL,
    nombre character(255),
    descripcion text
);


ALTER TABLE public.programa_estado OWNER TO funfamilia;

--
-- TOC entry 1400 (class 1259 OID 19218)
-- Dependencies: 5 1399
-- Name: programa_estado_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE programa_estado_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.programa_estado_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2035 (class 0 OID 0)
-- Dependencies: 1400
-- Name: programa_estado_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE programa_estado_codigo_seq OWNED BY programa_estado.codigo;


--
-- TOC entry 2036 (class 0 OID 0)
-- Dependencies: 1400
-- Name: programa_estado_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('programa_estado_codigo_seq', 1, false);


--
-- TOC entry 1401 (class 1259 OID 19220)
-- Dependencies: 5
-- Name: proyecto; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE proyecto (
    codigo integer NOT NULL,
    centro_familiar integer,
    usuario character(20),
    nombre character(255),
    descripcion text,
    costo numeric(10,2)
);


ALTER TABLE public.proyecto OWNER TO funfamilia;

--
-- TOC entry 1402 (class 1259 OID 19225)
-- Dependencies: 1401 5
-- Name: proyecto_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE proyecto_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.proyecto_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2037 (class 0 OID 0)
-- Dependencies: 1402
-- Name: proyecto_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE proyecto_codigo_seq OWNED BY proyecto.codigo;


--
-- TOC entry 2038 (class 0 OID 0)
-- Dependencies: 1402
-- Name: proyecto_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('proyecto_codigo_seq', 1, false);


--
-- TOC entry 1403 (class 1259 OID 19227)
-- Dependencies: 5
-- Name: region; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE region (
    codigo integer NOT NULL,
    region character(255),
    latitud character varying(60),
    longitud character varying(60),
    zoom character varying(60)
);


ALTER TABLE public.region OWNER TO funfamilia;

--
-- TOC entry 1404 (class 1259 OID 19229)
-- Dependencies: 5 1403
-- Name: region_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE region_codigo_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.region_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2039 (class 0 OID 0)
-- Dependencies: 1404
-- Name: region_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE region_codigo_seq OWNED BY region.codigo;


--
-- TOC entry 2040 (class 0 OID 0)
-- Dependencies: 1404
-- Name: region_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('region_codigo_seq', 7, true);


--
-- TOC entry 1405 (class 1259 OID 19231)
-- Dependencies: 5
-- Name: sequence_1; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE sequence_1
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sequence_1 OWNER TO funfamilia;

--
-- TOC entry 2041 (class 0 OID 0)
-- Dependencies: 1405
-- Name: sequence_1; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('sequence_1', 1, false);


--
-- TOC entry 1406 (class 1259 OID 19233)
-- Dependencies: 5
-- Name: sesion; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE sesion (
    id integer NOT NULL,
    numero_sesion numeric(10,2),
    actividad integer,
    rut_persona integer,
    fecha_inicio timestamp without time zone,
    fecha_termino timestamp without time zone,
    usuario character(20)
);


ALTER TABLE public.sesion OWNER TO funfamilia;

--
-- TOC entry 1407 (class 1259 OID 19238)
-- Dependencies: 5 1406
-- Name: sesion_id_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE sesion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sesion_id_seq OWNER TO funfamilia;

--
-- TOC entry 2042 (class 0 OID 0)
-- Dependencies: 1407
-- Name: sesion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE sesion_id_seq OWNED BY sesion.id;


--
-- TOC entry 2043 (class 0 OID 0)
-- Dependencies: 1407
-- Name: sesion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('sesion_id_seq', 1, false);


--
-- TOC entry 1408 (class 1259 OID 19240)
-- Dependencies: 5
-- Name: sub_familia; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE sub_familia (
    codigo character(10) NOT NULL,
    familia integer,
    nombre character varying(255) NOT NULL,
    descripcion text
);


ALTER TABLE public.sub_familia OWNER TO funfamilia;

--
-- TOC entry 1409 (class 1259 OID 19245)
-- Dependencies: 5
-- Name: thesaurus; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE thesaurus (
    codigo integer NOT NULL,
    cantidad_ocurrencias numeric NOT NULL,
    palabra text
);


ALTER TABLE public.thesaurus OWNER TO funfamilia;

--
-- TOC entry 1410 (class 1259 OID 19250)
-- Dependencies: 5
-- Name: thesaurus_actividad; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE thesaurus_actividad (
    thesaurus integer NOT NULL,
    actividad integer NOT NULL
);


ALTER TABLE public.thesaurus_actividad OWNER TO funfamilia;

--
-- TOC entry 1411 (class 1259 OID 19252)
-- Dependencies: 1409 5
-- Name: thesaurus_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE thesaurus_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.thesaurus_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2044 (class 0 OID 0)
-- Dependencies: 1411
-- Name: thesaurus_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE thesaurus_codigo_seq OWNED BY thesaurus.codigo;


--
-- TOC entry 2045 (class 0 OID 0)
-- Dependencies: 1411
-- Name: thesaurus_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('thesaurus_codigo_seq', 1, false);


--
-- TOC entry 1412 (class 1259 OID 19254)
-- Dependencies: 5
-- Name: thesaurus_programa; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE thesaurus_programa (
    thesaurus integer NOT NULL,
    programa integer NOT NULL
);


ALTER TABLE public.thesaurus_programa OWNER TO funfamilia;

--
-- TOC entry 1413 (class 1259 OID 19256)
-- Dependencies: 5
-- Name: tipo_calle; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE tipo_calle (
    codigo integer NOT NULL,
    nombre character(255) NOT NULL,
    descripcion text
);


ALTER TABLE public.tipo_calle OWNER TO funfamilia;

--
-- TOC entry 1414 (class 1259 OID 19261)
-- Dependencies: 1413 5
-- Name: tipo_calle_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE tipo_calle_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_calle_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2046 (class 0 OID 0)
-- Dependencies: 1414
-- Name: tipo_calle_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE tipo_calle_codigo_seq OWNED BY tipo_calle.codigo;


--
-- TOC entry 2047 (class 0 OID 0)
-- Dependencies: 1414
-- Name: tipo_calle_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('tipo_calle_codigo_seq', 1, false);


--
-- TOC entry 1415 (class 1259 OID 19263)
-- Dependencies: 5
-- Name: tipo_vivienda; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE tipo_vivienda (
    codigo integer NOT NULL,
    nombre character(255) NOT NULL,
    descripcion text
);


ALTER TABLE public.tipo_vivienda OWNER TO funfamilia;

--
-- TOC entry 1416 (class 1259 OID 19268)
-- Dependencies: 1415 5
-- Name: tipo_vivienda_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE tipo_vivienda_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_vivienda_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2048 (class 0 OID 0)
-- Dependencies: 1416
-- Name: tipo_vivienda_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE tipo_vivienda_codigo_seq OWNED BY tipo_vivienda.codigo;


--
-- TOC entry 2049 (class 0 OID 0)
-- Dependencies: 1416
-- Name: tipo_vivienda_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('tipo_vivienda_codigo_seq', 1, false);


--
-- TOC entry 1417 (class 1259 OID 19270)
-- Dependencies: 5
-- Name: usuario; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE usuario (
    usuario character(20) NOT NULL,
    clave character(32),
    inicio_sesion timestamp without time zone,
    fin_sesion timestamp without time zone,
    ultimo_acceso timestamp without time zone,
    origen character varying(60),
    bloqueado character(1),
    nombres character(80),
    apellido_paterno character(80),
    apellido_materno character(80),
    direccion character(255),
    telefono character(20),
    celular character(20),
    mail character(80)
);


ALTER TABLE public.usuario OWNER TO funfamilia;

--
-- TOC entry 1418 (class 1259 OID 19272)
-- Dependencies: 5
-- Name: zona; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE zona (
    codigo integer NOT NULL,
    zona character varying(255) NOT NULL,
    latitud character varying(60) NOT NULL,
    longitud character varying(60) NOT NULL,
    zoom character varying(60) NOT NULL
);


ALTER TABLE public.zona OWNER TO funfamilia;

--
-- TOC entry 1419 (class 1259 OID 19274)
-- Dependencies: 5 1418
-- Name: zona_codigo_seq; Type: SEQUENCE; Schema: public; Owner: funfamilia
--

CREATE SEQUENCE zona_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.zona_codigo_seq OWNER TO funfamilia;

--
-- TOC entry 2050 (class 0 OID 0)
-- Dependencies: 1419
-- Name: zona_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: funfamilia
--

ALTER SEQUENCE zona_codigo_seq OWNED BY zona.codigo;


--
-- TOC entry 2051 (class 0 OID 0)
-- Dependencies: 1419
-- Name: zona_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: funfamilia
--

SELECT pg_catalog.setval('zona_codigo_seq', 1, false);


--
-- TOC entry 1420 (class 1259 OID 19276)
-- Dependencies: 5
-- Name: zona_comuna; Type: TABLE; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE TABLE zona_comuna (
    codigo_comuna integer NOT NULL,
    codigo_zona integer NOT NULL
);


ALTER TABLE public.zona_comuna OWNER TO funfamilia;

--
-- TOC entry 1751 (class 2604 OID 19278)
-- Dependencies: 1358 1357
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE actividad ALTER COLUMN codigo SET DEFAULT nextval('actividad_codigo_seq'::regclass);


--
-- TOC entry 1752 (class 2604 OID 19279)
-- Dependencies: 1360 1359
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE actividad_estado ALTER COLUMN codigo SET DEFAULT nextval('actividad_estado_codigo_seq'::regclass);


--
-- TOC entry 1753 (class 2604 OID 19280)
-- Dependencies: 1364 1363
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE actividad_resultado ALTER COLUMN codigo SET DEFAULT nextval('actividad_resultado_codigo_seq'::regclass);


--
-- TOC entry 1754 (class 2604 OID 19281)
-- Dependencies: 1366 1365
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE actividad_tipo ALTER COLUMN codigo SET DEFAULT nextval('actividad_tipo_codigo_seq'::regclass);


--
-- TOC entry 1755 (class 2604 OID 19282)
-- Dependencies: 1368 1367
-- Name: id; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE actividad_zona ALTER COLUMN id SET DEFAULT nextval('actividad_zona_id_seq'::regclass);


--
-- TOC entry 1756 (class 2604 OID 19283)
-- Dependencies: 1370 1369
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE centro_familiar ALTER COLUMN codigo SET DEFAULT nextval('centro_familiar_codigo_seq'::regclass);


--
-- TOC entry 1757 (class 2604 OID 19284)
-- Dependencies: 1372 1371
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE ciudad ALTER COLUMN codigo SET DEFAULT nextval('ciudad_codigo_seq'::regclass);


--
-- TOC entry 1758 (class 2604 OID 19285)
-- Dependencies: 1375 1374
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE comuna ALTER COLUMN codigo SET DEFAULT nextval('comuna_codigo_seq'::regclass);


--
-- TOC entry 1759 (class 2604 OID 19286)
-- Dependencies: 1377 1376
-- Name: id; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE detalle_costos ALTER COLUMN id SET DEFAULT nextval('detalle_costos_id_seq'::regclass);


--
-- TOC entry 1760 (class 2604 OID 19287)
-- Dependencies: 1379 1378
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE estado_civil ALTER COLUMN codigo SET DEFAULT nextval('estado_civil_codigo_seq'::regclass);


--
-- TOC entry 1761 (class 2604 OID 19288)
-- Dependencies: 1381 1380
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE familia ALTER COLUMN codigo SET DEFAULT nextval('familia_codigo_seq'::regclass);


--
-- TOC entry 1762 (class 2604 OID 19289)
-- Dependencies: 1383 1382
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE grupo ALTER COLUMN codigo SET DEFAULT nextval('grupo_codigo_seq'::regclass);


--
-- TOC entry 1763 (class 2604 OID 19290)
-- Dependencies: 1387 1386
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE input_gobierno ALTER COLUMN codigo SET DEFAULT nextval('input_gobierno_codigo_seq'::regclass);


--
-- TOC entry 1764 (class 2604 OID 19291)
-- Dependencies: 1389 1388
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE material ALTER COLUMN codigo SET DEFAULT nextval('material_codigo_seq'::regclass);


--
-- TOC entry 1766 (class 2604 OID 19292)
-- Dependencies: 1391 1390
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE modulo ALTER COLUMN codigo SET DEFAULT nextval('modulo_codigo_seq'::regclass);


--
-- TOC entry 1767 (class 2604 OID 19293)
-- Dependencies: 1393 1392
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE nivel_educacional ALTER COLUMN codigo SET DEFAULT nextval('nivel_educacional_codigo_seq'::regclass);


--
-- TOC entry 1768 (class 2604 OID 19294)
-- Dependencies: 1395 1394
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE ocupacion ALTER COLUMN codigo SET DEFAULT nextval('ocupacion_codigo_seq'::regclass);


--
-- TOC entry 1770 (class 2604 OID 19295)
-- Dependencies: 1398 1397
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE programa ALTER COLUMN codigo SET DEFAULT nextval('programa_codigo_seq'::regclass);


--
-- TOC entry 1771 (class 2604 OID 19296)
-- Dependencies: 1400 1399
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE programa_estado ALTER COLUMN codigo SET DEFAULT nextval('programa_estado_codigo_seq'::regclass);


--
-- TOC entry 1772 (class 2604 OID 19297)
-- Dependencies: 1402 1401
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE proyecto ALTER COLUMN codigo SET DEFAULT nextval('proyecto_codigo_seq'::regclass);


--
-- TOC entry 1773 (class 2604 OID 19298)
-- Dependencies: 1404 1403
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE region ALTER COLUMN codigo SET DEFAULT nextval('region_codigo_seq'::regclass);


--
-- TOC entry 1774 (class 2604 OID 19299)
-- Dependencies: 1407 1406
-- Name: id; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE sesion ALTER COLUMN id SET DEFAULT nextval('sesion_id_seq'::regclass);


--
-- TOC entry 1775 (class 2604 OID 19300)
-- Dependencies: 1411 1409
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE thesaurus ALTER COLUMN codigo SET DEFAULT nextval('thesaurus_codigo_seq'::regclass);


--
-- TOC entry 1776 (class 2604 OID 19301)
-- Dependencies: 1414 1413
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE tipo_calle ALTER COLUMN codigo SET DEFAULT nextval('tipo_calle_codigo_seq'::regclass);


--
-- TOC entry 1777 (class 2604 OID 19302)
-- Dependencies: 1416 1415
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE tipo_vivienda ALTER COLUMN codigo SET DEFAULT nextval('tipo_vivienda_codigo_seq'::regclass);


--
-- TOC entry 1778 (class 2604 OID 19303)
-- Dependencies: 1419 1418
-- Name: codigo; Type: DEFAULT; Schema: public; Owner: funfamilia
--

ALTER TABLE zona ALTER COLUMN codigo SET DEFAULT nextval('zona_codigo_seq'::regclass);


--
-- TOC entry 1928 (class 0 OID 19065)
-- Dependencies: 1357
-- Data for Name: actividad; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1929 (class 0 OID 19072)
-- Dependencies: 1359
-- Data for Name: actividad_estado; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1930 (class 0 OID 19079)
-- Dependencies: 1361
-- Data for Name: actividad_material; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1931 (class 0 OID 19084)
-- Dependencies: 1362
-- Data for Name: actividad_monitor; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1932 (class 0 OID 19089)
-- Dependencies: 1363
-- Data for Name: actividad_resultado; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1933 (class 0 OID 19096)
-- Dependencies: 1365
-- Data for Name: actividad_tipo; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1934 (class 0 OID 19103)
-- Dependencies: 1367
-- Data for Name: actividad_zona; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1935 (class 0 OID 19107)
-- Dependencies: 1369
-- Data for Name: centro_familiar; Type: TABLE DATA; Schema: public; Owner: funfamilia
--

INSERT INTO centro_familiar (codigo, nombre, descripcion, direccion, poblacion, comuna, telefono, fax, casilla, mail, director) VALUES (7, 'Centro Pte Alto                                                                                                                                                                                                                                                ', 'Sin descripcion', 'San Guillermo 0358                                                                                                                                                                                                                                             ', 'San Guillermo                                                                                                                                                                                                                                                  ', 327, '1234567             ', '1234567             ', 'sin casilla         ', 'jgarcia@jgarcia.cl                                                              ', 'JGG                                                                             ');


--
-- TOC entry 1936 (class 0 OID 19114)
-- Dependencies: 1371
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: funfamilia
--

INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (0, NULL, 'No Especifica                                                                                                                                                                                                                                                  ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (1, NULL, 'Iquique                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (2, NULL, 'Arica                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (3, NULL, 'Putre                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (4, NULL, 'Antofagasta                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (5, NULL, 'Calama                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (6, NULL, 'Tocopilla                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (7, NULL, 'Copiapo                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (8, NULL, 'Chanaral                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (9, NULL, 'Vallenar                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (10, NULL, 'Coquimbo                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (11, NULL, 'Illapel                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (12, NULL, 'Ovalle                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (13, NULL, 'Valparaiso                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (14, NULL, 'Isla Pascua                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (15, NULL, 'Los Andes                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (16, NULL, 'La Ligua                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (17, NULL, 'Quillota                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (18, NULL, 'Sn Antonio                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (19, NULL, 'San Felipe                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (20, NULL, 'Rancagua                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (21, NULL, 'Pichilemu                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (22, NULL, 'San Fernando                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (23, NULL, 'Talca                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (24, NULL, 'Cauquenes                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (25, NULL, 'Curico                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (26, NULL, 'Linares                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (27, NULL, 'Concepcion                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (28, NULL, 'Lebu                                                                                                                                                                                                                                                           ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (29, NULL, 'Los Angeles                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (30, NULL, 'Chillan                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (31, NULL, 'Temuco                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (32, NULL, 'Angol                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (33, NULL, 'Puerto Montt                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (34, NULL, 'Castro                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (35, NULL, 'Osorno                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (36, NULL, 'Chaiten                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (37, NULL, 'Valdivia                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (38, NULL, 'Coihaique                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (39, NULL, 'Puerto Aisen                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (40, NULL, 'Cochrane                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (41, NULL, 'Chile Chico                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (42, NULL, 'Punta Arenas                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (43, NULL, 'Navarino                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (44, NULL, 'Porvenir                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (45, NULL, 'Puerto Natales                                                                                                                                                                                                                                                 ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (46, NULL, 'Santiago                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (47, NULL, 'Puente Alto                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (48, NULL, 'Colina                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (49, NULL, 'San Bernardo                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (50, NULL, 'Melipilla                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO ciudad (codigo, codigo_region, ciudad, latitud, longitud, zoom) VALUES (51, NULL, 'Talagante                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);


--
-- TOC entry 1937 (class 0 OID 19118)
-- Dependencies: 1373
-- Data for Name: cobertura_monitor; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1938 (class 0 OID 19123)
-- Dependencies: 1374
-- Data for Name: comuna; Type: TABLE DATA; Schema: public; Owner: funfamilia
--

INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (0, 0, 'No Especifica                                                                                                                                                                                                                                                  ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (1, 1, 'Iquique                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (2, 1, 'Camina                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (3, 1, 'Colchane                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (4, 1, 'Huara                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (5, 1, 'Pica                                                                                                                                                                                                                                                           ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (6, 1, 'Pozo Almonte                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (7, 2, 'Arica                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (8, 2, 'Camarones                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (9, 3, 'Putre                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (10, 3, 'General Lagos                                                                                                                                                                                                                                                  ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (11, 4, 'Antofagasta                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (12, 4, 'Mejillones                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (13, 4, 'Sierra Gorda                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (14, 4, 'Taltal                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (15, 5, 'Calama                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (16, 5, 'Ollague                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (17, 5, 'San Pedro De Atacama                                                                                                                                                                                                                                           ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (18, 6, 'Tocopilla                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (19, 6, 'Maria Elena                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (20, 7, 'Copiapo                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (21, 7, 'Caldera                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (22, 7, 'Tierra Amarilla                                                                                                                                                                                                                                                ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (23, 8, 'Chanaral                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (24, 8, 'Diego De Almagro                                                                                                                                                                                                                                               ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (25, 8, 'El Salvador                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (26, 9, 'Vallenar                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (27, 9, 'Alto Del Carmen                                                                                                                                                                                                                                                ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (28, 9, 'Freirina                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (29, 9, 'Huasco                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (30, 10, 'La Serena                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (31, 10, 'Coquimbo                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (32, 10, 'Andacollo                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (33, 10, 'La Higuera                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (34, 10, 'Paihuano                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (35, 10, 'Vicuna                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (36, 11, 'Illapel                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (37, 11, 'Canela                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (38, 11, 'Los Vilos                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (39, 11, 'Salamanca                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (40, 12, 'Ovalle                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (41, 12, 'Combarbala                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (42, 12, 'Monte Patria                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (43, 12, 'Punitaqui                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (44, 12, 'Rio Hurtado                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (45, 13, 'Valparaiso                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (46, 13, 'Casablanca                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (47, 13, 'Concon                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (48, 13, 'Juan Fernandez                                                                                                                                                                                                                                                 ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (49, 13, 'Puchuncavi                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (50, 13, 'Quilpue                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (51, 13, 'Quintero                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (52, 13, 'Villa Alemana                                                                                                                                                                                                                                                  ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (53, 13, 'Vina Del Mar                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (54, 14, 'Isla De Pascua                                                                                                                                                                                                                                                 ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (55, 15, 'Los Andes                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (56, 15, 'Calle Larga                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (57, 15, 'Rinconada                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (58, 15, 'San Esteban                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (59, 16, 'La Ligua                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (60, 16, 'Cabildo                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (61, 16, 'Papudo                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (62, 16, 'Petorca                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (63, 16, 'Zapallar                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (64, 17, 'Quillota                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (65, 17, 'La Calera                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (66, 17, 'Hijuelas                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (67, 17, 'La Cruz                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (68, 17, 'Limache                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (69, 17, 'Nogales                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (70, 17, 'Olmue                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (71, 18, 'San Antonio                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (72, 18, 'Algarrobo                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (73, 18, 'Cartagena                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (74, 18, 'El Quisco                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (75, 18, 'El Tabo                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (76, 18, 'Santo Domingo                                                                                                                                                                                                                                                  ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (77, 19, 'San Felipe                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (78, 19, 'Catemu                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (79, 19, 'Llay-Llay                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (80, 19, 'Panquehue                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (81, 19, 'Putaendo                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (82, 19, 'Santa Maria                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (83, 20, 'Rancagua                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (84, 20, 'Codegua                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (85, 20, 'Coinco                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (86, 20, 'Coltauco                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (87, 20, 'Donihue                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (88, 20, 'Graneros                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (89, 20, 'Las Cabras                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (90, 20, 'Machali                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (91, 20, 'Malloa                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (92, 20, 'San Francisco De Mostazal                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (93, 20, 'Olivar                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (94, 20, 'Peumo                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (95, 20, 'Pichidegua                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (96, 20, 'Quinta De Tilcoco                                                                                                                                                                                                                                              ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (97, 20, 'Rengo                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (98, 20, 'Requinoa                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (99, 20, 'San Vicente                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (100, 21, 'Pichilemu                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (101, 21, 'La Estrella                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (102, 21, 'Litueche                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (103, 21, 'Marchigue                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (104, 21, 'Navidad                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (105, 21, 'Paredones                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (106, 22, 'San Fernando                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (107, 22, 'Chepica                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (108, 22, 'Chimbarongo                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (109, 22, 'Lolol                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (110, 22, 'Nancagua                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (111, 22, 'Palmilla                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (112, 22, 'Peralillo                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (113, 22, 'Placilla                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (114, 22, 'Pumanque                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (115, 22, 'Santa Cruz                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (116, 23, 'Talca                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (117, 23, 'Constitucion                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (118, 23, 'Curepto                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (119, 23, 'Empedrado                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (120, 23, 'Maule                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (121, 23, 'Pelarco                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (122, 23, 'Pencahue                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (123, 23, 'Rio Claro                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (124, 23, 'San Clemente                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (125, 23, 'San Rafael                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (126, 24, 'Cauquenes                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (127, 24, 'Chanco                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (128, 24, 'Pelluhue                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (129, 25, 'Curico                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (130, 25, 'Hualane                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (131, 25, 'Licanten                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (132, 25, 'Molina                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (133, 25, 'Rauco                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (134, 25, 'Romeral                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (135, 25, 'Sagrada Familia                                                                                                                                                                                                                                                ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (136, 25, 'Teno                                                                                                                                                                                                                                                           ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (137, 25, 'Vichuquen                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (138, 26, 'Linares                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (139, 26, 'Colbun                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (140, 26, 'Longavi                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (141, 26, 'Parral                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (142, 26, 'Retiro                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (143, 26, 'San Javier                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (144, 26, 'Villa Alegre                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (145, 26, 'Yerbas Buenas                                                                                                                                                                                                                                                  ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (146, 27, 'Concepcion                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (147, 27, 'Coronel                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (148, 27, 'Chiguayante                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (149, 27, 'Florida                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (150, 27, 'Hualqui                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (151, 27, 'Lota                                                                                                                                                                                                                                                           ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (152, 27, 'Penco                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (153, 27, 'San Pedro De La Paz                                                                                                                                                                                                                                            ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (154, 27, 'Santa Juana                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (155, 27, 'Talcahuano                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (156, 27, 'Tome                                                                                                                                                                                                                                                           ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (157, 28, 'Lebu                                                                                                                                                                                                                                                           ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (158, 28, 'Arauco                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (159, 28, 'Canete                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (160, 28, 'Contulmo                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (161, 28, 'Curanilahue                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (162, 28, 'Los Alamos                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (163, 28, 'Tirua                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (164, 29, 'Los Angeles                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (165, 29, 'Antuco                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (166, 29, 'Cabrero                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (167, 29, 'Laja                                                                                                                                                                                                                                                           ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (168, 29, 'Mulchen                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (169, 29, 'Nacimiento                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (170, 29, 'Negrete                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (171, 29, 'Quilaco                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (172, 29, 'Quilleco                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (173, 29, 'San Rosendo                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (174, 29, 'Santa Barbara                                                                                                                                                                                                                                                  ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (175, 29, 'Tucapel                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (176, 29, 'Yumbel                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (177, 30, 'Chillan                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (178, 30, 'Bulnes                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (179, 30, 'Cobquecura                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (180, 30, 'Coelemu                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (181, 30, 'Coihueco                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (182, 30, 'Chillan Viejo                                                                                                                                                                                                                                                  ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (183, 30, 'El Carmen                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (184, 30, 'Ninhue                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (185, 30, 'Niquen                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (186, 30, 'Pemuco                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (187, 30, 'Pinto                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (188, 30, 'Portezuelo                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (189, 30, 'Quillon                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (190, 30, 'Quirihue                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (191, 30, 'Ranquil                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (192, 30, 'San Carlos                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (193, 30, 'San Fabian                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (194, 30, 'San Ignacio                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (195, 30, 'San Nicolas                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (196, 30, 'Trehuaco                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (197, 30, 'Yungay                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (198, 31, 'Temuco                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (199, 31, 'Carahue                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (200, 31, 'Cunco                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (201, 31, 'Curarrehue                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (202, 31, 'Freire                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (203, 31, 'Galvarino                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (204, 31, 'Gorbea                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (205, 31, 'Lautaro                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (206, 31, 'Loncoche                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (207, 31, 'Melipeuco                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (208, 31, 'Nueva Imperial                                                                                                                                                                                                                                                 ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (209, 31, 'Padre Las Casas                                                                                                                                                                                                                                                ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (210, 31, 'Perquenco                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (211, 31, 'Pitrufquen                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (212, 31, 'Pucon                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (214, 31, 'Teodoro Schimdt                                                                                                                                                                                                                                                ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (215, 31, 'Tolten                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (216, 31, 'Vilcun                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (217, 31, 'Villarrica                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (218, 31, 'Quepe                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (219, 32, 'Angol                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (220, 32, 'Collipulli                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (221, 32, 'Curacautin                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (222, 32, 'Ercilla                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (223, 32, 'Lonquimay                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (224, 32, 'Los Sauces                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (225, 32, 'Lumaco                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (226, 32, 'Puren                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (227, 32, 'Renaico                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (228, 32, 'Traiguen                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (229, 32, 'Victoria                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (230, 33, 'Puerto Montt                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (231, 33, 'Calbuco                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (232, 33, 'Cochamo                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (233, 33, 'Fresia                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (234, 33, 'Frutillar                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (235, 33, 'Los Muermos                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (236, 33, 'Llanquihue                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (237, 33, 'Maullin                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (238, 33, 'Puerto Varas                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (239, 34, 'Castro                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (240, 34, 'Ancud                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (241, 34, 'Chonchi                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (242, 34, 'Curaco De Velez                                                                                                                                                                                                                                                ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (243, 34, 'Dalcahue                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (244, 34, 'Puqueldon                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (245, 34, 'Queilen                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (246, 34, 'Quellon                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (247, 34, 'Quemchi                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (248, 34, 'Quinchao                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (249, 34, 'Chiloe                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (250, 34, 'Nipa                                                                                                                                                                                                                                                           ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (251, 35, 'Osorno                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (252, 35, 'Puerto Octay                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (253, 35, 'Purranque                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (254, 35, 'Puyehue                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (255, 35, 'Rio Negro                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (256, 35, 'San Juan De La Costa                                                                                                                                                                                                                                           ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (257, 35, 'San Pablo                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (258, 36, 'Chaiten                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (259, 36, 'Futaleufu                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (260, 36, 'Hualaihue                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (261, 36, 'Palena                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (262, 37, 'Valdivia                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (263, 37, 'Corral                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (264, 37, 'Futrono                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (265, 37, 'La Union                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (266, 37, 'Lago Ranco                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (267, 37, 'Lanco                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (268, 37, 'Los Lagos                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (269, 37, 'Mafil                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (270, 37, 'Mariquina                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (271, 37, 'Paillaco                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (272, 37, 'Panguipulli                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (273, 37, 'Rio Bueno                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (274, 38, 'Coyhaique                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (275, 38, 'Lago Verde                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (276, 39, 'Aisen                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (277, 39, 'Cisnes                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (278, 39, 'Guaitecas                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (279, 40, 'Cochrane                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (280, 40, 'O Higgins                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (281, 40, 'Tortel                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (282, 41, 'Chile Chico                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (283, 41, 'Rio Ibanez                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (284, 42, 'Punta Arenas                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (285, 42, 'Laguna Blanca                                                                                                                                                                                                                                                  ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (286, 42, 'Rio Verde                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (288, 43, 'Navarino                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (289, 43, 'Antartica                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (290, 44, 'Porvenir                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (291, 44, 'Primavera                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (292, 44, 'Timaukel                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (294, 45, 'Torres Del Paine                                                                                                                                                                                                                                               ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (295, 46, 'Santiago                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (296, 46, 'Cerrillos                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (297, 46, 'Cerro Navia                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (298, 46, 'Conchali                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (299, 46, 'El Bosque                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (300, 46, 'Estacion Central                                                                                                                                                                                                                                               ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (301, 46, 'Huechuraba                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (302, 46, 'Independencia                                                                                                                                                                                                                                                  ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (303, 46, 'La Cisterna                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (304, 46, 'La Florida                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (305, 46, 'La Granja                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (306, 46, 'La Pintana                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (307, 46, 'La Reina                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (308, 46, 'Las Condes                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (309, 46, 'Lo Barnechea                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (310, 46, 'Lo Espejo                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (311, 46, 'Lo Prado                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (312, 46, 'Macul                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (313, 46, 'Maipu                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (314, 46, 'Nunoa                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (315, 46, 'Pedro Aguirre Cerda                                                                                                                                                                                                                                            ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (316, 46, 'Penalolen                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (317, 46, 'Providencia                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (318, 46, 'Pudahuel                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (319, 46, 'Quilicura                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (320, 46, 'Quinta Normal                                                                                                                                                                                                                                                  ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (321, 46, 'Recoleta                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (322, 46, 'Renca                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (323, 46, 'San Joaquin                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (324, 46, 'San Miguel                                                                                                                                                                                                                                                     ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (325, 46, 'San Ramon                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (326, 46, 'Vitacura                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (327, 47, 'Puente Alto                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (328, 47, 'Pirque                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (329, 47, 'San Jose De Maipo                                                                                                                                                                                                                                              ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (330, 48, 'Colina                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (331, 48, 'Lampa                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (332, 48, 'Til-Til                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (333, 49, 'San Bernardo                                                                                                                                                                                                                                                   ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (334, 49, 'Buin                                                                                                                                                                                                                                                           ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (335, 49, 'Calera De Tango                                                                                                                                                                                                                                                ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (336, 49, 'Paine                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (337, 50, 'Melipilla                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (338, 50, 'Alhue                                                                                                                                                                                                                                                          ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (339, 50, 'Curacavi                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (340, 50, 'Maria Pinto                                                                                                                                                                                                                                                    ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (341, 50, 'San Pedro                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (342, 51, 'Talagante                                                                                                                                                                                                                                                      ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (343, 51, 'El Monte                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (344, 51, 'Isla De Maipo                                                                                                                                                                                                                                                  ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (345, 51, 'Padre Hurtado                                                                                                                                                                                                                                                  ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (346, 51, 'Penaflor                                                                                                                                                                                                                                                       ', NULL, NULL, NULL);
INSERT INTO comuna (codigo, codigo_ciudad, comuna, latitud, longitud, zoom) VALUES (347, 27, 'Hualpen                                                                                                                                                                                                                                                        ', NULL, NULL, NULL);


--
-- TOC entry 1939 (class 0 OID 19127)
-- Dependencies: 1376
-- Data for Name: detalle_costos; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1940 (class 0 OID 19134)
-- Dependencies: 1378
-- Data for Name: estado_civil; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1941 (class 0 OID 19141)
-- Dependencies: 1380
-- Data for Name: familia; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1942 (class 0 OID 19148)
-- Dependencies: 1382
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: funfamilia
--

INSERT INTO grupo (codigo, grupo, descripcion) VALUES (1, 'Administradores', 'Administradores del sistema.');
INSERT INTO grupo (codigo, grupo, descripcion) VALUES (2, 'Monitores', '');
INSERT INTO grupo (codigo, grupo, descripcion) VALUES (3, 'Reportes', '');
INSERT INTO grupo (codigo, grupo, descripcion) VALUES (4, 'Capacitacion', '');
INSERT INTO grupo (codigo, grupo, descripcion) VALUES (5, 'Invitados', '');
INSERT INTO grupo (codigo, grupo, descripcion) VALUES (11, 'Profesores', '');
INSERT INTO grupo (codigo, grupo, descripcion) VALUES (25, 'Alumnos', '');


--
-- TOC entry 1943 (class 0 OID 19155)
-- Dependencies: 1384
-- Data for Name: grupo_login; Type: TABLE DATA; Schema: public; Owner: funfamilia
--

INSERT INTO grupo_login (codigo_grupo, usuario) VALUES (2, 'patricio            ');
INSERT INTO grupo_login (codigo_grupo, usuario) VALUES (2, 'jose                ');
INSERT INTO grupo_login (codigo_grupo, usuario) VALUES (1, 'gonzalez            ');
INSERT INTO grupo_login (codigo_grupo, usuario) VALUES (1, 'jose                ');
INSERT INTO grupo_login (codigo_grupo, usuario) VALUES (3, 'jose                ');
INSERT INTO grupo_login (codigo_grupo, usuario) VALUES (4, 'jose                ');


--
-- TOC entry 1944 (class 0 OID 19157)
-- Dependencies: 1385
-- Data for Name: grupo_modulo; Type: TABLE DATA; Schema: public; Owner: funfamilia
--

INSERT INTO grupo_modulo (grupo, modulo, privilegio) VALUES (2, 2, 'r');
INSERT INTO grupo_modulo (grupo, modulo, privilegio) VALUES (2, 8, 'r');
INSERT INTO grupo_modulo (grupo, modulo, privilegio) VALUES (2, 7, 'r');
INSERT INTO grupo_modulo (grupo, modulo, privilegio) VALUES (1, 6, 'rw');
INSERT INTO grupo_modulo (grupo, modulo, privilegio) VALUES (1, 7, 'rw');
INSERT INTO grupo_modulo (grupo, modulo, privilegio) VALUES (1, 8, 'rw');
INSERT INTO grupo_modulo (grupo, modulo, privilegio) VALUES (1, 9, 'rw');
INSERT INTO grupo_modulo (grupo, modulo, privilegio) VALUES (1, 1, 'rw');
INSERT INTO grupo_modulo (grupo, modulo, privilegio) VALUES (1, 27, 'rw');
INSERT INTO grupo_modulo (grupo, modulo, privilegio) VALUES (11, 4, 'r');
INSERT INTO grupo_modulo (grupo, modulo, privilegio) VALUES (25, 4, 'r');
INSERT INTO grupo_modulo (grupo, modulo, privilegio) VALUES (1, 2, 'rw');
INSERT INTO grupo_modulo (grupo, modulo, privilegio) VALUES (1, 3, 'rw');
INSERT INTO grupo_modulo (grupo, modulo, privilegio) VALUES (1, 4, 'rw');


--
-- TOC entry 1945 (class 0 OID 19159)
-- Dependencies: 1386
-- Data for Name: input_gobierno; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1946 (class 0 OID 19166)
-- Dependencies: 1388
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1947 (class 0 OID 19173)
-- Dependencies: 1390
-- Data for Name: modulo; Type: TABLE DATA; Schema: public; Owner: funfamilia
--

INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (4, 1, 'centro_familiar', 'Centros', '/CentroFamiliar', NULL, 'centro.png', false);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (5, 1, 'grupo', 'Grupos', '/Grupo', NULL, 'groups.png', false);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (6, 1, 'usuario', 'Usuarios', '/Usuario', NULL, 'usuario.png', false);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (7, 1, 'programa', 'Programas', '/Programa', NULL, 'projects.png', false);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (8, 1, 'actividad', 'Actividades', '/Actividad', NULL, 'actividad.png', false);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (9, 1, 'monitor', 'Monitores', '/Monitor', NULL, 'actividad.png', false);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (1, NULL, 'configuracion', 'Configuración', NULL, NULL, 'settings.png', false);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (10, 1, 'modulo', 'Modulos', '/Modulo/admin', NULL, 'modulo.png', false);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (2, NULL, 'planificacion', 'Planificación', NULL, NULL, 'projects.png', false);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (3, NULL, 'reporte', 'Reportes', NULL, NULL, 'reports.png', false);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (24, 3, 'reporte_2', 'Reporte N° 2', '/Modulo', NULL, 'monitor.png', false);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (23, 3, 'reporte_1', 'Reporte N° 1', '/Modulo', NULL, 'usuario.png', false);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (25, 2, 'planificacion_1', 'Planificación N° 1', '/Modulo', NULL, 'modulo.png', false);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (26, 2, 'planificacion_1', 'Planificación N° 2', '/Modulo', NULL, 'modulo.png', false);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (28, NULL, 'inicio', 'Inicio', 'Modulo', NULL, 'dock-menu/home.png', true);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (31, NULL, 'proyectos', 'Proyectos', '/', NULL, 'dock-menu/appointment.png', true);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (30, NULL, 'documentos', 'Documentos', '/', NULL, 'dock-menu/documents.png', true);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (32, NULL, 'cronograma', 'Cronograma', '/', NULL, 'dock-menu/kwrite.png', true);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (33, NULL, 'calendario', 'Calendario', '/', NULL, 'dock-menu/date.png', true);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (27, 1, 'grupo_modulo', 'Privilegios', '/GrupoModulo', NULL, 'modulo.png', false);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (34, NULL, 'configuracion', 'Configuración', 'Modulo/makeMenu/configuracion/', NULL, 'dock-menu/advancedsettings.png', true);
INSERT INTO modulo (codigo, modulo, nombre, descripcion, url, bloqueado, imagen, dock) VALUES (35, NULL, 'buscar', 'Buscar', 'http://maps.google.com/maps?f=q&hl=es&geocode=&q=santiago,+chile&ie=UTF8&ll=-33.516245,-70.598102&spn=0.004213,0.010815&t=h&z=17', NULL, 'dock-menu/viewmag.png', true);


--
-- TOC entry 1948 (class 0 OID 19186)
-- Dependencies: 1392
-- Data for Name: nivel_educacional; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1949 (class 0 OID 19193)
-- Dependencies: 1394
-- Data for Name: ocupacion; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1950 (class 0 OID 19200)
-- Dependencies: 1396
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1951 (class 0 OID 19206)
-- Dependencies: 1397
-- Data for Name: programa; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1952 (class 0 OID 19213)
-- Dependencies: 1399
-- Data for Name: programa_estado; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1953 (class 0 OID 19220)
-- Dependencies: 1401
-- Data for Name: proyecto; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1954 (class 0 OID 19227)
-- Dependencies: 1403
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: funfamilia
--

INSERT INTO region (codigo, region, latitud, longitud, zoom) VALUES (1, '1                                                                                                                                                                                                                                                              ', NULL, NULL, NULL);
INSERT INTO region (codigo, region, latitud, longitud, zoom) VALUES (2, '2                                                                                                                                                                                                                                                              ', NULL, NULL, NULL);
INSERT INTO region (codigo, region, latitud, longitud, zoom) VALUES (3, '3                                                                                                                                                                                                                                                              ', NULL, NULL, NULL);
INSERT INTO region (codigo, region, latitud, longitud, zoom) VALUES (4, '4                                                                                                                                                                                                                                                              ', NULL, NULL, NULL);
INSERT INTO region (codigo, region, latitud, longitud, zoom) VALUES (5, '5                                                                                                                                                                                                                                                              ', NULL, NULL, NULL);
INSERT INTO region (codigo, region, latitud, longitud, zoom) VALUES (6, '6                                                                                                                                                                                                                                                              ', NULL, NULL, NULL);
INSERT INTO region (codigo, region, latitud, longitud, zoom) VALUES (7, '7                                                                                                                                                                                                                                                              ', NULL, NULL, NULL);


--
-- TOC entry 1955 (class 0 OID 19233)
-- Dependencies: 1406
-- Data for Name: sesion; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1956 (class 0 OID 19240)
-- Dependencies: 1408
-- Data for Name: sub_familia; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1957 (class 0 OID 19245)
-- Dependencies: 1409
-- Data for Name: thesaurus; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1958 (class 0 OID 19250)
-- Dependencies: 1410
-- Data for Name: thesaurus_actividad; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1959 (class 0 OID 19254)
-- Dependencies: 1412
-- Data for Name: thesaurus_programa; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1960 (class 0 OID 19256)
-- Dependencies: 1413
-- Data for Name: tipo_calle; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1961 (class 0 OID 19263)
-- Dependencies: 1415
-- Data for Name: tipo_vivienda; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1962 (class 0 OID 19270)
-- Dependencies: 1417
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: funfamilia
--

INSERT INTO usuario (usuario, clave, inicio_sesion, fin_sesion, ultimo_acceso, origen, bloqueado, nombres, apellido_paterno, apellido_materno, direccion, telefono, celular, mail) VALUES ('jgarcia             ', 'e0a10300759c2638bc7178025184c4b1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO usuario (usuario, clave, inicio_sesion, fin_sesion, ultimo_acceso, origen, bloqueado, nombres, apellido_paterno, apellido_materno, direccion, telefono, celular, mail) VALUES ('gonzalez            ', '9cd6da1380c97e9696814cb35052dbe6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO usuario (usuario, clave, inicio_sesion, fin_sesion, ultimo_acceso, origen, bloqueado, nombres, apellido_paterno, apellido_materno, direccion, telefono, celular, mail) VALUES ('patricio            ', '0dd7f77275fba42f4148d7c5d9517e05', '2008-04-03 14:29:01.279', NULL, '2008-04-03 14:29:01.279', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO usuario (usuario, clave, inicio_sesion, fin_sesion, ultimo_acceso, origen, bloqueado, nombres, apellido_paterno, apellido_materno, direccion, telefono, celular, mail) VALUES ('garcia              ', '8c18b5824c16db7a91d1971c71fbd6d5', '2008-04-03 14:29:50.67', NULL, '2008-04-03 14:29:50.67', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO usuario (usuario, clave, inicio_sesion, fin_sesion, ultimo_acceso, origen, bloqueado, nombres, apellido_paterno, apellido_materno, direccion, telefono, celular, mail) VALUES ('jose                ', 'd0b2dae5ba0dff079c58247529fa8934', '2008-04-04 13:20:03.30', NULL, '2008-04-04 13:20:03.30', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 1963 (class 0 OID 19272)
-- Dependencies: 1418
-- Data for Name: zona; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1964 (class 0 OID 19276)
-- Dependencies: 1420
-- Data for Name: zona_comuna; Type: TABLE DATA; Schema: public; Owner: funfamilia
--



--
-- TOC entry 1786 (class 2606 OID 19305)
-- Dependencies: 1361 1361 1361
-- Name: actividad_material_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY actividad_material
    ADD CONSTRAINT actividad_material_pkey PRIMARY KEY (material, actividad);


--
-- TOC entry 1780 (class 2606 OID 19307)
-- Dependencies: 1357 1357
-- Name: actividad_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY actividad
    ADD CONSTRAINT actividad_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1792 (class 2606 OID 19309)
-- Dependencies: 1365 1365
-- Name: actividad_tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY actividad_tipo
    ADD CONSTRAINT actividad_tipo_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1798 (class 2606 OID 19311)
-- Dependencies: 1369 1369
-- Name: centro_familiar_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY centro_familiar
    ADD CONSTRAINT centro_familiar_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1801 (class 2606 OID 19313)
-- Dependencies: 1371 1371
-- Name: ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1806 (class 2606 OID 19317)
-- Dependencies: 1374 1374
-- Name: comuna_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY comuna
    ADD CONSTRAINT comuna_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1783 (class 2606 OID 19319)
-- Dependencies: 1359 1359
-- Name: estado_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY actividad_estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1815 (class 2606 OID 19321)
-- Dependencies: 1380 1380
-- Name: familia_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY familia
    ADD CONSTRAINT familia_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1879 (class 2606 OID 19323)
-- Dependencies: 1417 1417
-- Name: login_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT login_pkey PRIMARY KEY (usuario);


--
-- TOC entry 1831 (class 2606 OID 19325)
-- Dependencies: 1388 1388
-- Name: material_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY material
    ADD CONSTRAINT material_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1870 (class 2606 OID 19327)
-- Dependencies: 1412 1412 1412
-- Name: ocurrencia_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY thesaurus_programa
    ADD CONSTRAINT ocurrencia_pkey PRIMARY KEY (programa, thesaurus);


--
-- TOC entry 1843 (class 2606 OID 19329)
-- Dependencies: 1396 1396
-- Name: persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (rut);


--
-- TOC entry 1790 (class 2606 OID 19333)
-- Dependencies: 1363 1363
-- Name: pk_actividad_resultado; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY actividad_resultado
    ADD CONSTRAINT pk_actividad_resultado PRIMARY KEY (codigo);


--
-- TOC entry 1796 (class 2606 OID 19335)
-- Dependencies: 1367 1367
-- Name: pk_actividad_zona; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY actividad_zona
    ADD CONSTRAINT pk_actividad_zona PRIMARY KEY (id);


--
-- TOC entry 1804 (class 2606 OID 20053)
-- Dependencies: 1373 1373 1373
-- Name: pk_cobertura_monitor; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY cobertura_monitor
    ADD CONSTRAINT pk_cobertura_monitor PRIMARY KEY (usuario, codigo_area);


--
-- TOC entry 1810 (class 2606 OID 19337)
-- Dependencies: 1376 1376
-- Name: pk_detalle_costos; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY detalle_costos
    ADD CONSTRAINT pk_detalle_costos PRIMARY KEY (id);


--
-- TOC entry 1813 (class 2606 OID 19339)
-- Dependencies: 1378 1378
-- Name: pk_estado_civil; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY estado_civil
    ADD CONSTRAINT pk_estado_civil PRIMARY KEY (codigo);


--
-- TOC entry 1819 (class 2606 OID 19341)
-- Dependencies: 1382 1382
-- Name: pk_grupo; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY grupo
    ADD CONSTRAINT pk_grupo PRIMARY KEY (codigo);


--
-- TOC entry 1822 (class 2606 OID 19343)
-- Dependencies: 1384 1384 1384
-- Name: pk_grupo_login; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY grupo_login
    ADD CONSTRAINT pk_grupo_login PRIMARY KEY (codigo_grupo, usuario);


--
-- TOC entry 1825 (class 2606 OID 19345)
-- Dependencies: 1385 1385 1385
-- Name: pk_grupo_modulo; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY grupo_modulo
    ADD CONSTRAINT pk_grupo_modulo PRIMARY KEY (grupo, modulo);


--
-- TOC entry 1828 (class 2606 OID 19347)
-- Dependencies: 1386 1386
-- Name: pk_input_gobierno; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY input_gobierno
    ADD CONSTRAINT pk_input_gobierno PRIMARY KEY (codigo);


--
-- TOC entry 1834 (class 2606 OID 19349)
-- Dependencies: 1390 1390
-- Name: pk_modulo; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT pk_modulo PRIMARY KEY (codigo);


--
-- TOC entry 1837 (class 2606 OID 19353)
-- Dependencies: 1392 1392
-- Name: pk_nivel_educacional; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY nivel_educacional
    ADD CONSTRAINT pk_nivel_educacional PRIMARY KEY (codigo);


--
-- TOC entry 1840 (class 2606 OID 19355)
-- Dependencies: 1394 1394
-- Name: pk_ocupacion; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY ocupacion
    ADD CONSTRAINT pk_ocupacion PRIMARY KEY (codigo);


--
-- TOC entry 1849 (class 2606 OID 19357)
-- Dependencies: 1399 1399
-- Name: pk_programa_estado; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY programa_estado
    ADD CONSTRAINT pk_programa_estado PRIMARY KEY (codigo);


--
-- TOC entry 1852 (class 2606 OID 19359)
-- Dependencies: 1401 1401
-- Name: pk_proyecto; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT pk_proyecto PRIMARY KEY (codigo);


--
-- TOC entry 1858 (class 2606 OID 19361)
-- Dependencies: 1406 1406
-- Name: pk_sesion; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY sesion
    ADD CONSTRAINT pk_sesion PRIMARY KEY (id);


--
-- TOC entry 1867 (class 2606 OID 19363)
-- Dependencies: 1410 1410 1410
-- Name: pk_thesaurus_actividad; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY thesaurus_actividad
    ADD CONSTRAINT pk_thesaurus_actividad PRIMARY KEY (thesaurus, actividad);


--
-- TOC entry 1873 (class 2606 OID 19365)
-- Dependencies: 1413 1413
-- Name: pk_tipo_calle; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY tipo_calle
    ADD CONSTRAINT pk_tipo_calle PRIMARY KEY (codigo);


--
-- TOC entry 1876 (class 2606 OID 19367)
-- Dependencies: 1415 1415
-- Name: pk_tipo_vivienda; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY tipo_vivienda
    ADD CONSTRAINT pk_tipo_vivienda PRIMARY KEY (codigo);


--
-- TOC entry 1846 (class 2606 OID 19369)
-- Dependencies: 1397 1397
-- Name: programa_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY programa
    ADD CONSTRAINT programa_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1855 (class 2606 OID 19371)
-- Dependencies: 1403 1403
-- Name: region_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY region
    ADD CONSTRAINT region_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1861 (class 2606 OID 19373)
-- Dependencies: 1408 1408
-- Name: sub_familia_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY sub_familia
    ADD CONSTRAINT sub_familia_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1864 (class 2606 OID 19375)
-- Dependencies: 1409 1409
-- Name: thesaurus_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY thesaurus
    ADD CONSTRAINT thesaurus_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1885 (class 2606 OID 19377)
-- Dependencies: 1420 1420 1420
-- Name: zona_comuna_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY zona_comuna
    ADD CONSTRAINT zona_comuna_pkey PRIMARY KEY (codigo_comuna, codigo_zona);


--
-- TOC entry 1882 (class 2606 OID 19379)
-- Dependencies: 1418 1418
-- Name: zona_pkey; Type: CONSTRAINT; Schema: public; Owner: funfamilia; Tablespace: 
--

ALTER TABLE ONLY zona
    ADD CONSTRAINT zona_pkey PRIMARY KEY (codigo);


--
-- TOC entry 1781 (class 1259 OID 19380)
-- Dependencies: 1357
-- Name: index_1; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_1 ON actividad USING btree (codigo);


--
-- TOC entry 1816 (class 1259 OID 19381)
-- Dependencies: 1380
-- Name: index_10; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_10 ON familia USING btree (codigo);


--
-- TOC entry 1808 (class 1259 OID 19382)
-- Dependencies: 1376
-- Name: index_11; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_11 ON detalle_costos USING btree (id);


--
-- TOC entry 1877 (class 1259 OID 19383)
-- Dependencies: 1417
-- Name: index_12; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_12 ON usuario USING btree (usuario);


--
-- TOC entry 1829 (class 1259 OID 19384)
-- Dependencies: 1388
-- Name: index_13; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_13 ON material USING btree (codigo);


--
-- TOC entry 1868 (class 1259 OID 19385)
-- Dependencies: 1412 1412
-- Name: index_14; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_14 ON thesaurus_programa USING btree (programa, thesaurus);


--
-- TOC entry 1841 (class 1259 OID 19386)
-- Dependencies: 1396
-- Name: index_15; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_15 ON persona USING btree (rut);


--
-- TOC entry 1844 (class 1259 OID 19387)
-- Dependencies: 1397
-- Name: index_16; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_16 ON programa USING btree (codigo);


--
-- TOC entry 1811 (class 1259 OID 19388)
-- Dependencies: 1378
-- Name: index_18; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_18 ON estado_civil USING btree (codigo);


--
-- TOC entry 1853 (class 1259 OID 19389)
-- Dependencies: 1403
-- Name: index_19; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_19 ON region USING btree (codigo);


--
-- TOC entry 1787 (class 1259 OID 19390)
-- Dependencies: 1361 1361
-- Name: index_2; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_2 ON actividad_material USING btree (material, actividad);


--
-- TOC entry 1859 (class 1259 OID 19391)
-- Dependencies: 1408
-- Name: index_20; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_20 ON sub_familia USING btree (codigo);


--
-- TOC entry 1862 (class 1259 OID 19392)
-- Dependencies: 1409
-- Name: index_21; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_21 ON thesaurus USING btree (codigo);


--
-- TOC entry 1880 (class 1259 OID 19393)
-- Dependencies: 1418
-- Name: index_22; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_22 ON zona USING btree (codigo);


--
-- TOC entry 1883 (class 1259 OID 19394)
-- Dependencies: 1420 1420
-- Name: index_23; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_23 ON zona_comuna USING btree (codigo_comuna, codigo_zona);


--
-- TOC entry 1817 (class 1259 OID 19397)
-- Dependencies: 1382
-- Name: index_26; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_26 ON grupo USING btree (codigo);


--
-- TOC entry 1820 (class 1259 OID 19398)
-- Dependencies: 1384 1384
-- Name: index_27; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_27 ON grupo_login USING btree (codigo_grupo, usuario);


--
-- TOC entry 1823 (class 1259 OID 19399)
-- Dependencies: 1385 1385
-- Name: index_28; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_28 ON grupo_modulo USING btree (grupo, modulo);


--
-- TOC entry 1832 (class 1259 OID 19400)
-- Dependencies: 1390
-- Name: index_29; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_29 ON modulo USING btree (codigo);


--
-- TOC entry 1793 (class 1259 OID 19401)
-- Dependencies: 1365
-- Name: index_3; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_3 ON actividad_tipo USING btree (codigo);


--
-- TOC entry 1794 (class 1259 OID 19402)
-- Dependencies: 1367
-- Name: index_30; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_30 ON actividad_zona USING btree (id);


--
-- TOC entry 1799 (class 1259 OID 19403)
-- Dependencies: 1369
-- Name: index_31; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_31 ON centro_familiar USING btree (codigo);


--
-- TOC entry 1847 (class 1259 OID 19404)
-- Dependencies: 1399
-- Name: index_32; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_32 ON programa_estado USING btree (codigo);


--
-- TOC entry 1850 (class 1259 OID 19405)
-- Dependencies: 1401
-- Name: index_33; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_33 ON proyecto USING btree (codigo);


--
-- TOC entry 1856 (class 1259 OID 19406)
-- Dependencies: 1406
-- Name: index_34; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_34 ON sesion USING btree (id);


--
-- TOC entry 1865 (class 1259 OID 19407)
-- Dependencies: 1410 1410
-- Name: index_35; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_35 ON thesaurus_actividad USING btree (thesaurus, actividad);


--
-- TOC entry 1835 (class 1259 OID 19408)
-- Dependencies: 1392
-- Name: index_36; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_36 ON nivel_educacional USING btree (codigo);


--
-- TOC entry 1838 (class 1259 OID 19409)
-- Dependencies: 1394
-- Name: index_37; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_37 ON ocupacion USING btree (codigo);


--
-- TOC entry 1871 (class 1259 OID 19410)
-- Dependencies: 1413
-- Name: index_38; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_38 ON tipo_calle USING btree (codigo);


--
-- TOC entry 1874 (class 1259 OID 19411)
-- Dependencies: 1415
-- Name: index_39; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_39 ON tipo_vivienda USING btree (codigo);


--
-- TOC entry 1788 (class 1259 OID 19412)
-- Dependencies: 1363
-- Name: index_4; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_4 ON actividad_resultado USING btree (codigo);


--
-- TOC entry 1826 (class 1259 OID 19413)
-- Dependencies: 1386
-- Name: index_40; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_40 ON input_gobierno USING btree (codigo);


--
-- TOC entry 1802 (class 1259 OID 19414)
-- Dependencies: 1371
-- Name: index_5; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_5 ON ciudad USING btree (codigo);


--
-- TOC entry 1807 (class 1259 OID 19416)
-- Dependencies: 1374
-- Name: index_8; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_8 ON comuna USING btree (codigo);


--
-- TOC entry 1784 (class 1259 OID 19417)
-- Dependencies: 1359
-- Name: index_9; Type: INDEX; Schema: public; Owner: funfamilia; Tablespace: 
--

CREATE UNIQUE INDEX index_9 ON actividad_estado USING btree (codigo);


--
-- TOC entry 1894 (class 2606 OID 20047)
-- Dependencies: 1417 1878 1362
-- Name: fk_act_mon_reference_usuario; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY actividad_monitor
    ADD CONSTRAINT fk_act_mon_reference_usuario FOREIGN KEY (usuario) REFERENCES usuario(usuario);


--
-- TOC entry 1886 (class 2606 OID 19418)
-- Dependencies: 1359 1357 1782
-- Name: fk_act_ref_act_est; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY actividad
    ADD CONSTRAINT fk_act_ref_act_est FOREIGN KEY (estado) REFERENCES actividad_estado(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1887 (class 2606 OID 19423)
-- Dependencies: 1363 1357 1789
-- Name: fk_act_ref_act_res; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY actividad
    ADD CONSTRAINT fk_act_ref_act_res FOREIGN KEY (actividad_resultado) REFERENCES actividad_resultado(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1891 (class 2606 OID 19428)
-- Dependencies: 1361 1357 1779
-- Name: fk_activida_reference_activida; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY actividad_material
    ADD CONSTRAINT fk_activida_reference_activida FOREIGN KEY (actividad) REFERENCES actividad(codigo);


--
-- TOC entry 1893 (class 2606 OID 19433)
-- Dependencies: 1779 1362 1357
-- Name: fk_activida_reference_activida; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY actividad_monitor
    ADD CONSTRAINT fk_activida_reference_activida FOREIGN KEY (codigo) REFERENCES actividad(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1895 (class 2606 OID 19438)
-- Dependencies: 1367 1357 1779
-- Name: fk_activida_reference_activida; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY actividad_zona
    ADD CONSTRAINT fk_activida_reference_activida FOREIGN KEY (act_codigo) REFERENCES actividad(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1892 (class 2606 OID 19443)
-- Dependencies: 1830 1388 1361
-- Name: fk_activida_reference_material; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY actividad_material
    ADD CONSTRAINT fk_activida_reference_material FOREIGN KEY (material) REFERENCES material(codigo);


--
-- TOC entry 1888 (class 2606 OID 19453)
-- Dependencies: 1397 1845 1357
-- Name: fk_activida_reference_programa; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY actividad
    ADD CONSTRAINT fk_activida_reference_programa FOREIGN KEY (programa) REFERENCES programa(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1889 (class 2606 OID 19458)
-- Dependencies: 1417 1878 1357
-- Name: fk_activida_reference_usuario; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY actividad
    ADD CONSTRAINT fk_activida_reference_usuario FOREIGN KEY (usuario) REFERENCES usuario(usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1896 (class 2606 OID 19463)
-- Dependencies: 1367 1418 1881
-- Name: fk_activida_reference_zona; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY actividad_zona
    ADD CONSTRAINT fk_activida_reference_zona FOREIGN KEY (codigo) REFERENCES zona(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1890 (class 2606 OID 19468)
-- Dependencies: 1357 1365 1791
-- Name: fk_actividad_ref_actividad_tipo; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY actividad
    ADD CONSTRAINT fk_actividad_ref_actividad_tipo FOREIGN KEY (actividad_tipo) REFERENCES actividad_tipo(codigo);


--
-- TOC entry 1926 (class 2606 OID 19473)
-- Dependencies: 1420 1374 1805
-- Name: fk_area_com_reference_comuna; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY zona_comuna
    ADD CONSTRAINT fk_area_com_reference_comuna FOREIGN KEY (codigo_comuna) REFERENCES comuna(codigo);


--
-- TOC entry 1927 (class 2606 OID 19478)
-- Dependencies: 1418 1881 1420
-- Name: fk_area_com_reference_zona; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY zona_comuna
    ADD CONSTRAINT fk_area_com_reference_zona FOREIGN KEY (codigo_zona) REFERENCES zona(codigo);


--
-- TOC entry 1897 (class 2606 OID 19483)
-- Dependencies: 1374 1805 1369
-- Name: fk_centro_f_reference_comuna; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY centro_familiar
    ADD CONSTRAINT fk_centro_f_reference_comuna FOREIGN KEY (comuna) REFERENCES comuna(codigo);


--
-- TOC entry 1898 (class 2606 OID 19488)
-- Dependencies: 1371 1854 1403
-- Name: fk_ciudad_reference_region; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT fk_ciudad_reference_region FOREIGN KEY (codigo_region) REFERENCES region(codigo);


--
-- TOC entry 1900 (class 2606 OID 20054)
-- Dependencies: 1878 1373 1417
-- Name: fk_cob_mon_reference_usuario; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY cobertura_monitor
    ADD CONSTRAINT fk_cob_mon_reference_usuario FOREIGN KEY (usuario) REFERENCES usuario(usuario);


--
-- TOC entry 1899 (class 2606 OID 19493)
-- Dependencies: 1881 1418 1373
-- Name: fk_cobertur_referenc_areas; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY cobertura_monitor
    ADD CONSTRAINT fk_cobertur_referenc_areas FOREIGN KEY (codigo_area) REFERENCES zona(codigo);


--
-- TOC entry 1901 (class 2606 OID 19503)
-- Dependencies: 1371 1800 1374
-- Name: fk_comuna_reference_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY comuna
    ADD CONSTRAINT fk_comuna_reference_ciudad FOREIGN KEY (codigo_ciudad) REFERENCES ciudad(codigo);


--
-- TOC entry 1902 (class 2606 OID 19508)
-- Dependencies: 1357 1376 1779
-- Name: fk_detalle__reference_activida; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY detalle_costos
    ADD CONSTRAINT fk_detalle__reference_activida FOREIGN KEY (codigo_actividad) REFERENCES actividad(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1903 (class 2606 OID 19513)
-- Dependencies: 1382 1818 1384
-- Name: fk_grupo_lo_reference_grupo; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY grupo_login
    ADD CONSTRAINT fk_grupo_lo_reference_grupo FOREIGN KEY (codigo_grupo) REFERENCES grupo(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1904 (class 2606 OID 19518)
-- Dependencies: 1417 1878 1384
-- Name: fk_grupo_lo_reference_usuario; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY grupo_login
    ADD CONSTRAINT fk_grupo_lo_reference_usuario FOREIGN KEY (usuario) REFERENCES usuario(usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1905 (class 2606 OID 19523)
-- Dependencies: 1385 1818 1382
-- Name: fk_grupo_mo_reference_grupo; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY grupo_modulo
    ADD CONSTRAINT fk_grupo_mo_reference_grupo FOREIGN KEY (grupo) REFERENCES grupo(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1906 (class 2606 OID 19528)
-- Dependencies: 1390 1833 1385
-- Name: fk_grupo_mo_reference_modulo; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY grupo_modulo
    ADD CONSTRAINT fk_grupo_mo_reference_modulo FOREIGN KEY (modulo) REFERENCES modulo(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1907 (class 2606 OID 19533)
-- Dependencies: 1851 1401 1386
-- Name: fk_input_go_reference_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY input_gobierno
    ADD CONSTRAINT fk_input_go_reference_proyecto FOREIGN KEY (proyecto) REFERENCES proyecto(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1908 (class 2606 OID 19538)
-- Dependencies: 1860 1388 1408
-- Name: fk_material_reference_sub_fami; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY material
    ADD CONSTRAINT fk_material_reference_sub_fami FOREIGN KEY (sub_familia) REFERENCES sub_familia(codigo);


--
-- TOC entry 1909 (class 2606 OID 19543)
-- Dependencies: 1833 1390 1390
-- Name: fk_modulo_reference_modulo; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY modulo
    ADD CONSTRAINT fk_modulo_reference_modulo FOREIGN KEY (modulo) REFERENCES modulo(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1910 (class 2606 OID 19553)
-- Dependencies: 1812 1378 1396
-- Name: fk_persona_reference_estado_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT fk_persona_reference_estado_c FOREIGN KEY (estado_civil) REFERENCES estado_civil(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1911 (class 2606 OID 19558)
-- Dependencies: 1836 1396 1392
-- Name: fk_persona_reference_nivel_ed; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT fk_persona_reference_nivel_ed FOREIGN KEY (nivel_educacional) REFERENCES nivel_educacional(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1912 (class 2606 OID 19563)
-- Dependencies: 1839 1396 1394
-- Name: fk_persona_reference_ocupacio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT fk_persona_reference_ocupacio FOREIGN KEY (ocupacion) REFERENCES ocupacion(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1913 (class 2606 OID 19568)
-- Dependencies: 1872 1413 1396
-- Name: fk_persona_reference_tipo_cal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT fk_persona_reference_tipo_cal FOREIGN KEY (tipo_calle) REFERENCES tipo_calle(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1914 (class 2606 OID 19573)
-- Dependencies: 1396 1415 1875
-- Name: fk_persona_reference_tipo_viv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT fk_persona_reference_tipo_viv FOREIGN KEY (tipo_vivienda) REFERENCES tipo_vivienda(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1915 (class 2606 OID 19578)
-- Dependencies: 1399 1397 1848
-- Name: fk_programa_reference_programa; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY programa
    ADD CONSTRAINT fk_programa_reference_programa FOREIGN KEY (programa_estado) REFERENCES programa_estado(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1916 (class 2606 OID 19583)
-- Dependencies: 1851 1397 1401
-- Name: fk_programa_reference_proyecto; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY programa
    ADD CONSTRAINT fk_programa_reference_proyecto FOREIGN KEY (proyecto) REFERENCES proyecto(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1917 (class 2606 OID 19588)
-- Dependencies: 1369 1797 1401
-- Name: fk_proyecto_reference_centro_f; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT fk_proyecto_reference_centro_f FOREIGN KEY (centro_familiar) REFERENCES centro_familiar(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1918 (class 2606 OID 19593)
-- Dependencies: 1417 1401 1878
-- Name: fk_proyecto_reference_usuario; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT fk_proyecto_reference_usuario FOREIGN KEY (usuario) REFERENCES usuario(usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1919 (class 2606 OID 19598)
-- Dependencies: 1357 1779 1406
-- Name: fk_sesion_reference_activida; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY sesion
    ADD CONSTRAINT fk_sesion_reference_activida FOREIGN KEY (actividad) REFERENCES actividad(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1920 (class 2606 OID 20042)
-- Dependencies: 1878 1406 1417
-- Name: fk_sesion_reference_usuario; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY sesion
    ADD CONSTRAINT fk_sesion_reference_usuario FOREIGN KEY (usuario) REFERENCES usuario(usuario);


--
-- TOC entry 1921 (class 2606 OID 19608)
-- Dependencies: 1408 1814 1380
-- Name: fk_sub_fami_reference_familia; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY sub_familia
    ADD CONSTRAINT fk_sub_fami_reference_familia FOREIGN KEY (familia) REFERENCES familia(codigo);


--
-- TOC entry 1922 (class 2606 OID 19613)
-- Dependencies: 1357 1410 1779
-- Name: fk_thesauru_reference_activida; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY thesaurus_actividad
    ADD CONSTRAINT fk_thesauru_reference_activida FOREIGN KEY (actividad) REFERENCES actividad(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1923 (class 2606 OID 19618)
-- Dependencies: 1410 1409 1863
-- Name: fk_thesauru_reference_thesauru; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY thesaurus_actividad
    ADD CONSTRAINT fk_thesauru_reference_thesauru FOREIGN KEY (thesaurus) REFERENCES thesaurus(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1924 (class 2606 OID 19623)
-- Dependencies: 1409 1412 1863
-- Name: fk_thesauru_reference_thesauru; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY thesaurus_programa
    ADD CONSTRAINT fk_thesauru_reference_thesauru FOREIGN KEY (thesaurus) REFERENCES thesaurus(codigo) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1925 (class 2606 OID 19628)
-- Dependencies: 1397 1412 1845
-- Name: programa_ocurrencia_fk; Type: FK CONSTRAINT; Schema: public; Owner: funfamilia
--

ALTER TABLE ONLY thesaurus_programa
    ADD CONSTRAINT programa_ocurrencia_fk FOREIGN KEY (programa) REFERENCES programa(codigo);


--
-- TOC entry 1970 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO funfamilia;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2008-04-04 14:22:27

--
-- PostgreSQL database dump complete
--

