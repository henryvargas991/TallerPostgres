--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-08-26 19:49:10 COT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1948 (class 1262 OID 16386)
-- Name: futbol; Type: DATABASE; Schema: -; Owner: futbol_user
--

CREATE DATABASE futbol WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_CO.UTF-8' LC_CTYPE = 'es_CO.UTF-8';


ALTER DATABASE futbol OWNER TO futbol_user;

\connect futbol

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 178 (class 3079 OID 11645)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1951 (class 0 OID 0)
-- Dependencies: 178
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 163 (class 1259 OID 16396)
-- Dependencies: 5
-- Name: equipos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE equipos (
    id smallint NOT NULL,
    nombre character varying
);


ALTER TABLE public.equipos OWNER TO postgres;

--
-- TOC entry 1952 (class 0 OID 0)
-- Dependencies: 163
-- Name: TABLE equipos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE equipos IS 'Contiene informacion de los equipos de futbol';


--
-- TOC entry 1953 (class 0 OID 0)
-- Dependencies: 163
-- Name: COLUMN equipos.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN equipos.nombre IS 'NOmbre del equipo de futbol';


--
-- TOC entry 169 (class 1259 OID 16456)
-- Dependencies: 5
-- Name: estadios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estadios (
    id integer NOT NULL,
    descripcion character varying(40)
);


ALTER TABLE public.estadios OWNER TO postgres;

--
-- TOC entry 1954 (class 0 OID 0)
-- Dependencies: 169
-- Name: TABLE estadios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estadios IS 'ALmacena los estadios en los que se realizara un partido';


--
-- TOC entry 1955 (class 0 OID 0)
-- Dependencies: 169
-- Name: COLUMN estadios.descripcion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estadios.descripcion IS 'Nombre del Estadio';


--
-- TOC entry 168 (class 1259 OID 16454)
-- Dependencies: 5 169
-- Name: estadios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estadios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estadios_id_seq OWNER TO postgres;

--
-- TOC entry 1956 (class 0 OID 0)
-- Dependencies: 168
-- Name: estadios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estadios_id_seq OWNED BY estadios.id;


--
-- TOC entry 177 (class 1259 OID 16509)
-- Dependencies: 5
-- Name: goles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE goles (
    jugadores_id integer NOT NULL,
    partidos_id integer NOT NULL,
    minuto numeric(2,1)
);


ALTER TABLE public.goles OWNER TO postgres;

--
-- TOC entry 1957 (class 0 OID 0)
-- Dependencies: 177
-- Name: TABLE goles; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE goles IS 'Almacena informacion de los goles de los partidos';


--
-- TOC entry 1958 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN goles.jugadores_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN goles.jugadores_id IS 'Jugador que marco el gol';


--
-- TOC entry 1959 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN goles.partidos_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN goles.partidos_id IS 'Partido en que  marco el gol';


--
-- TOC entry 175 (class 1259 OID 16505)
-- Dependencies: 5 177
-- Name: goles_jugadores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE goles_jugadores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goles_jugadores_id_seq OWNER TO postgres;

--
-- TOC entry 1960 (class 0 OID 0)
-- Dependencies: 175
-- Name: goles_jugadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE goles_jugadores_id_seq OWNED BY goles.jugadores_id;


--
-- TOC entry 176 (class 1259 OID 16507)
-- Dependencies: 5 177
-- Name: goles_partidos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE goles_partidos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goles_partidos_id_seq OWNER TO postgres;

--
-- TOC entry 1961 (class 0 OID 0)
-- Dependencies: 176
-- Name: goles_partidos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE goles_partidos_id_seq OWNED BY goles.partidos_id;


--
-- TOC entry 167 (class 1259 OID 16437)
-- Dependencies: 5
-- Name: jugadores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jugadores (
    id smallint NOT NULL,
    nombre character varying(50),
    apellido character varying(50),
    numero smallint,
    fecha_nacimiento date,
    equipos_id smallint,
    posiciones_id smallint
);


ALTER TABLE public.jugadores OWNER TO postgres;

--
-- TOC entry 1962 (class 0 OID 0)
-- Dependencies: 167
-- Name: TABLE jugadores; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE jugadores IS 'Almacena informacion de los jugadores de un equipo';


--
-- TOC entry 1963 (class 0 OID 0)
-- Dependencies: 167
-- Name: COLUMN jugadores.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN jugadores.nombre IS 'NOmbre del jugador';


--
-- TOC entry 1964 (class 0 OID 0)
-- Dependencies: 167
-- Name: COLUMN jugadores.apellido; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN jugadores.apellido IS 'Apellidos del jugador';


--
-- TOC entry 1965 (class 0 OID 0)
-- Dependencies: 167
-- Name: COLUMN jugadores.numero; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN jugadores.numero IS 'Numero Dorsal del jugador';


--
-- TOC entry 1966 (class 0 OID 0)
-- Dependencies: 167
-- Name: COLUMN jugadores.fecha_nacimiento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN jugadores.fecha_nacimiento IS 'fecha de naciemiento de jugador';


--
-- TOC entry 1967 (class 0 OID 0)
-- Dependencies: 167
-- Name: COLUMN jugadores.equipos_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN jugadores.equipos_id IS 'Equipo de Futbol al que pertenece el jugador';


--
-- TOC entry 1968 (class 0 OID 0)
-- Dependencies: 167
-- Name: COLUMN jugadores.posiciones_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN jugadores.posiciones_id IS 'Posicion en la que juega un Jugador';


--
-- TOC entry 174 (class 1259 OID 16490)
-- Dependencies: 5
-- Name: partidos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE partidos (
    id integer NOT NULL,
    equipos1_id integer NOT NULL,
    equipos2_id integer NOT NULL,
    fecha date,
    estadios_id integer NOT NULL
);


ALTER TABLE public.partidos OWNER TO postgres;

--
-- TOC entry 1969 (class 0 OID 0)
-- Dependencies: 174
-- Name: TABLE partidos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE partidos IS 'ALmacena informacion de los partidos programados de futbol';


--
-- TOC entry 1970 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN partidos.equipos1_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partidos.equipos1_id IS 'Referencia del equipo local';


--
-- TOC entry 1971 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN partidos.equipos2_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partidos.equipos2_id IS 'Referencia del equipo visitante';


--
-- TOC entry 1972 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN partidos.fecha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partidos.fecha IS 'Fecha del partido';


--
-- TOC entry 171 (class 1259 OID 16482)
-- Dependencies: 5 174
-- Name: partidos_equipos1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE partidos_equipos1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partidos_equipos1_id_seq OWNER TO postgres;

--
-- TOC entry 1973 (class 0 OID 0)
-- Dependencies: 171
-- Name: partidos_equipos1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE partidos_equipos1_id_seq OWNED BY partidos.equipos1_id;


--
-- TOC entry 172 (class 1259 OID 16484)
-- Dependencies: 174 5
-- Name: partidos_equipos2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE partidos_equipos2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partidos_equipos2_id_seq OWNER TO postgres;

--
-- TOC entry 1974 (class 0 OID 0)
-- Dependencies: 172
-- Name: partidos_equipos2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE partidos_equipos2_id_seq OWNED BY partidos.equipos2_id;


--
-- TOC entry 173 (class 1259 OID 16488)
-- Dependencies: 5 174
-- Name: partidos_estadios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE partidos_estadios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partidos_estadios_id_seq OWNER TO postgres;

--
-- TOC entry 1975 (class 0 OID 0)
-- Dependencies: 173
-- Name: partidos_estadios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE partidos_estadios_id_seq OWNED BY partidos.estadios_id;


--
-- TOC entry 170 (class 1259 OID 16480)
-- Dependencies: 174 5
-- Name: partidos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE partidos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partidos_id_seq OWNER TO postgres;

--
-- TOC entry 1976 (class 0 OID 0)
-- Dependencies: 170
-- Name: partidos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE partidos_id_seq OWNED BY partidos.id;


--
-- TOC entry 166 (class 1259 OID 16419)
-- Dependencies: 5
-- Name: posiciones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE posiciones (
    id integer NOT NULL,
    descripcion character varying(15)
);


ALTER TABLE public.posiciones OWNER TO postgres;

--
-- TOC entry 1977 (class 0 OID 0)
-- Dependencies: 166
-- Name: TABLE posiciones; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE posiciones IS 'registra las posiciones de un jugador de futbol';


--
-- TOC entry 1978 (class 0 OID 0)
-- Dependencies: 166
-- Name: COLUMN posiciones.descripcion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN posiciones.descripcion IS 'Nombre de la posicion';


--
-- TOC entry 165 (class 1259 OID 16417)
-- Dependencies: 166 5
-- Name: posiciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE posiciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posiciones_id_seq OWNER TO postgres;

--
-- TOC entry 1979 (class 0 OID 0)
-- Dependencies: 165
-- Name: posiciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE posiciones_id_seq OWNED BY posiciones.id;


--
-- TOC entry 164 (class 1259 OID 16404)
-- Dependencies: 5
-- Name: registro_equipos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE registro_equipos (
    torneos_id smallint,
    equipos_id smallint
);


ALTER TABLE public.registro_equipos OWNER TO postgres;

--
-- TOC entry 1980 (class 0 OID 0)
-- Dependencies: 164
-- Name: TABLE registro_equipos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE registro_equipos IS 'Almacena información de los equipos que estan inscritos a un torneo';


--
-- TOC entry 162 (class 1259 OID 16390)
-- Dependencies: 5
-- Name: torneo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE torneo (
    id integer NOT NULL,
    descripcion character varying(30),
    cantidad smallint
);


ALTER TABLE public.torneo OWNER TO postgres;

--
-- TOC entry 1981 (class 0 OID 0)
-- Dependencies: 162
-- Name: TABLE torneo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE torneo IS 'tabla que almacena los diferentes torneos de futbol';


--
-- TOC entry 1982 (class 0 OID 0)
-- Dependencies: 162
-- Name: COLUMN torneo.descripcion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN torneo.descripcion IS 'Nombre del torne';


--
-- TOC entry 1983 (class 0 OID 0)
-- Dependencies: 162
-- Name: COLUMN torneo.cantidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN torneo.cantidad IS 'Contiene la cantidad de equipos que pueden participar en un torneo';


--
-- TOC entry 161 (class 1259 OID 16388)
-- Dependencies: 5 162
-- Name: torneo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE torneo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.torneo_id_seq OWNER TO postgres;

--
-- TOC entry 1984 (class 0 OID 0)
-- Dependencies: 161
-- Name: torneo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE torneo_id_seq OWNED BY torneo.id;


--
-- TOC entry 1899 (class 2604 OID 16459)
-- Dependencies: 168 169 169
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estadios ALTER COLUMN id SET DEFAULT nextval('estadios_id_seq'::regclass);


--
-- TOC entry 1904 (class 2604 OID 16512)
-- Dependencies: 177 175 177
-- Name: jugadores_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY goles ALTER COLUMN jugadores_id SET DEFAULT nextval('goles_jugadores_id_seq'::regclass);


--
-- TOC entry 1905 (class 2604 OID 16513)
-- Dependencies: 176 177 177
-- Name: partidos_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY goles ALTER COLUMN partidos_id SET DEFAULT nextval('goles_partidos_id_seq'::regclass);


--
-- TOC entry 1900 (class 2604 OID 16493)
-- Dependencies: 170 174 174
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partidos ALTER COLUMN id SET DEFAULT nextval('partidos_id_seq'::regclass);


--
-- TOC entry 1901 (class 2604 OID 16494)
-- Dependencies: 171 174 174
-- Name: equipos1_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partidos ALTER COLUMN equipos1_id SET DEFAULT nextval('partidos_equipos1_id_seq'::regclass);


--
-- TOC entry 1902 (class 2604 OID 16495)
-- Dependencies: 174 172 174
-- Name: equipos2_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partidos ALTER COLUMN equipos2_id SET DEFAULT nextval('partidos_equipos2_id_seq'::regclass);


--
-- TOC entry 1903 (class 2604 OID 16497)
-- Dependencies: 174 173 174
-- Name: estadios_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partidos ALTER COLUMN estadios_id SET DEFAULT nextval('partidos_estadios_id_seq'::regclass);


--
-- TOC entry 1898 (class 2604 OID 16422)
-- Dependencies: 165 166 166
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY posiciones ALTER COLUMN id SET DEFAULT nextval('posiciones_id_seq'::regclass);


--
-- TOC entry 1897 (class 2604 OID 16393)
-- Dependencies: 161 162 162
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY torneo ALTER COLUMN id SET DEFAULT nextval('torneo_id_seq'::regclass);


--
-- TOC entry 1929 (class 0 OID 16396)
-- Dependencies: 163 1944
-- Data for Name: equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO equipos VALUES (1, 'NACIONAL');
INSERT INTO equipos VALUES (2, 'MILLONARIOS');
INSERT INTO equipos VALUES (3, 'CALI');
INSERT INTO equipos VALUES (4, 'ONCE CALDAS');
INSERT INTO equipos VALUES (5, 'SANTAFE');
INSERT INTO equipos VALUES (6, 'MEDELLÍN');
INSERT INTO equipos VALUES (7, 'JUNIOR');
INSERT INTO equipos VALUES (8, 'TOLIMA');
INSERT INTO equipos VALUES (9, 'CHICÓ');
INSERT INTO equipos VALUES (10, 'PASTO');


--
-- TOC entry 1935 (class 0 OID 16456)
-- Dependencies: 169 1944
-- Data for Name: estadios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO estadios VALUES (1, 'SANTIAGO BERBABEU');
INSERT INTO estadios VALUES (2, 'DEFENSORES DEL CHACO');
INSERT INTO estadios VALUES (3, 'LA BOMBONERA');
INSERT INTO estadios VALUES (4, 'CAMP NOU');
INSERT INTO estadios VALUES (5, 'ATANASIO GIRARDOT');
INSERT INTO estadios VALUES (6, 'NIDO DE PAJARO');
INSERT INTO estadios VALUES (7, 'MONUMENTAL');
INSERT INTO estadios VALUES (8, 'MARACANÁ');


--
-- TOC entry 1985 (class 0 OID 0)
-- Dependencies: 168
-- Name: estadios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estadios_id_seq', 1, false);


--
-- TOC entry 1943 (class 0 OID 16509)
-- Dependencies: 177 1944
-- Data for Name: goles; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1986 (class 0 OID 0)
-- Dependencies: 175
-- Name: goles_jugadores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('goles_jugadores_id_seq', 1, false);


--
-- TOC entry 1987 (class 0 OID 0)
-- Dependencies: 176
-- Name: goles_partidos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('goles_partidos_id_seq', 1, false);


--
-- TOC entry 1933 (class 0 OID 16437)
-- Dependencies: 167 1944
-- Data for Name: jugadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO jugadores VALUES (1, 'JHON DARWIN', 'MUÑOZ LOPEZ', 10, '1987-03-20', 1, 6);
INSERT INTO jugadores VALUES (2, 'MICHAEL ', 'MUÑOZ LOPEZ', 11, '1990-01-11', 1, 6);


--
-- TOC entry 1940 (class 0 OID 16490)
-- Dependencies: 174 1944
-- Data for Name: partidos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1988 (class 0 OID 0)
-- Dependencies: 171
-- Name: partidos_equipos1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('partidos_equipos1_id_seq', 1, false);


--
-- TOC entry 1989 (class 0 OID 0)
-- Dependencies: 172
-- Name: partidos_equipos2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('partidos_equipos2_id_seq', 1, false);


--
-- TOC entry 1990 (class 0 OID 0)
-- Dependencies: 173
-- Name: partidos_estadios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('partidos_estadios_id_seq', 1, false);


--
-- TOC entry 1991 (class 0 OID 0)
-- Dependencies: 170
-- Name: partidos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('partidos_id_seq', 1, false);


--
-- TOC entry 1932 (class 0 OID 16419)
-- Dependencies: 166 1944
-- Data for Name: posiciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO posiciones VALUES (1, 'ARQUERO');
INSERT INTO posiciones VALUES (2, 'LLATERAL');
INSERT INTO posiciones VALUES (3, 'DEFENSA CENTRO');
INSERT INTO posiciones VALUES (4, 'VOLANTE CREADOR');
INSERT INTO posiciones VALUES (5, 'VOLANTE');
INSERT INTO posiciones VALUES (6, 'DELANTERO');
INSERT INTO posiciones VALUES (7, 'COACH');


--
-- TOC entry 1992 (class 0 OID 0)
-- Dependencies: 165
-- Name: posiciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('posiciones_id_seq', 1, false);


--
-- TOC entry 1930 (class 0 OID 16404)
-- Dependencies: 164 1944
-- Data for Name: registro_equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1928 (class 0 OID 16390)
-- Dependencies: 162 1944
-- Data for Name: torneo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO torneo VALUES (1, 'COPA ITFIP', 10);
INSERT INTO torneo VALUES (2, 'LIGA A', 20);
INSERT INTO torneo VALUES (3, 'LIGA B', 30);


--
-- TOC entry 1993 (class 0 OID 0)
-- Dependencies: 161
-- Name: torneo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('torneo_id_seq', 1, false);


--
-- TOC entry 1919 (class 2606 OID 16499)
-- Dependencies: 174 174 1945
-- Name: partidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY partidos
    ADD CONSTRAINT partidos_pkey PRIMARY KEY (id);


--
-- TOC entry 1909 (class 2606 OID 16403)
-- Dependencies: 163 163 1945
-- Name: pk_equipos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipos
    ADD CONSTRAINT pk_equipos PRIMARY KEY (id);


--
-- TOC entry 1917 (class 2606 OID 16461)
-- Dependencies: 169 169 1945
-- Name: pk_estadios; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estadios
    ADD CONSTRAINT pk_estadios PRIMARY KEY (id);


--
-- TOC entry 1913 (class 2606 OID 16441)
-- Dependencies: 167 167 1945
-- Name: pk_jugadores; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jugadores
    ADD CONSTRAINT pk_jugadores PRIMARY KEY (id);


--
-- TOC entry 1911 (class 2606 OID 16424)
-- Dependencies: 166 166 1945
-- Name: pk_posiciones; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY posiciones
    ADD CONSTRAINT pk_posiciones PRIMARY KEY (id);


--
-- TOC entry 1907 (class 2606 OID 16395)
-- Dependencies: 162 162 1945
-- Name: pk_torneo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY torneo
    ADD CONSTRAINT pk_torneo PRIMARY KEY (id);


--
-- TOC entry 1915 (class 2606 OID 16443)
-- Dependencies: 167 167 1945
-- Name: un_dorsal; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jugadores
    ADD CONSTRAINT un_dorsal UNIQUE (numero);


--
-- TOC entry 1925 (class 2606 OID 16514)
-- Dependencies: 1912 177 167 1945
-- Name: FK_jugadores_goles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY goles
    ADD CONSTRAINT "FK_jugadores_goles" FOREIGN KEY (jugadores_id) REFERENCES jugadores(id);


--
-- TOC entry 1926 (class 2606 OID 16519)
-- Dependencies: 177 174 1918 1945
-- Name: FK_partidos_goles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY goles
    ADD CONSTRAINT "FK_partidos_goles" FOREIGN KEY (partidos_id) REFERENCES partidos(id);


--
-- TOC entry 1922 (class 2606 OID 16444)
-- Dependencies: 1908 163 167 1945
-- Name: fk_equipos_jugadores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jugadores
    ADD CONSTRAINT fk_equipos_jugadores FOREIGN KEY (equipos_id) REFERENCES equipos(id);


--
-- TOC entry 1920 (class 2606 OID 16407)
-- Dependencies: 1908 164 163 1945
-- Name: fk_equipos_registro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registro_equipos
    ADD CONSTRAINT fk_equipos_registro FOREIGN KEY (equipos_id) REFERENCES equipos(id);


--
-- TOC entry 1924 (class 2606 OID 16524)
-- Dependencies: 174 1916 169 1945
-- Name: fk_estadios_partidos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partidos
    ADD CONSTRAINT fk_estadios_partidos FOREIGN KEY (estadios_id) REFERENCES estadios(id);


--
-- TOC entry 1923 (class 2606 OID 16449)
-- Dependencies: 167 1910 166 1945
-- Name: fk_posiciones; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jugadores
    ADD CONSTRAINT fk_posiciones FOREIGN KEY (posiciones_id) REFERENCES posiciones(id);


--
-- TOC entry 1921 (class 2606 OID 16412)
-- Dependencies: 162 164 1906 1945
-- Name: fk_torneos_registro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registro_equipos
    ADD CONSTRAINT fk_torneos_registro FOREIGN KEY (torneos_id) REFERENCES torneo(id);


--
-- TOC entry 1950 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-08-26 19:49:11 COT

--
-- PostgreSQL database dump complete
--

