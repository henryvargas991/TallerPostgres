--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-08-23 02:43:40 COT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1917 (class 1262 OID 16386)
-- Name: futbol; Type: DATABASE; Schema: -; 

CREATE DATABASE futbol WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_CO.UTF-8' LC_CTYPE = 'es_CO.UTF-8';



\connect futbol

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 175 (class 3079 OID 11645)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1920 (class 0 OID 0)
-- Dependencies: 175
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
-- TOC entry 1921 (class 0 OID 0)
-- Dependencies: 163
-- Name: TABLE equipos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE equipos IS 'Contiene informacion de los equipos de futbol';


--
-- TOC entry 1922 (class 0 OID 0)
-- Dependencies: 163
-- Name: COLUMN equipos.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN equipos.nombre IS 'NOmbre del equipo de futbol';


--
-- TOC entry 173 (class 1259 OID 16456)
-- Dependencies: 5
-- Name: estadios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estadios (
    id integer NOT NULL,
    descripcion character varying(40)
);


ALTER TABLE public.estadios OWNER TO postgres;

--
-- TOC entry 1923 (class 0 OID 0)
-- Dependencies: 173
-- Name: TABLE estadios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estadios IS 'ALmacena los estadios en los que se realizara un partido';


--
-- TOC entry 1924 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN estadios.descripcion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN estadios.descripcion IS 'Nombre del Estadio';


--
-- TOC entry 172 (class 1259 OID 16454)
-- Dependencies: 5 173
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
-- TOC entry 1925 (class 0 OID 0)
-- Dependencies: 172
-- Name: estadios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estadios_id_seq OWNED BY estadios.id;


--
-- TOC entry 171 (class 1259 OID 16437)
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
-- TOC entry 1926 (class 0 OID 0)
-- Dependencies: 171
-- Name: TABLE jugadores; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE jugadores IS 'Almacena informacion de los jugadores de un equipo';


--
-- TOC entry 1927 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN jugadores.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN jugadores.nombre IS 'NOmbre del jugador';


--
-- TOC entry 1928 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN jugadores.apellido; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN jugadores.apellido IS 'Apellidos del jugador';


--
-- TOC entry 1929 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN jugadores.numero; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN jugadores.numero IS 'Numero Dorsal del jugador';


--
-- TOC entry 1930 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN jugadores.fecha_nacimiento; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN jugadores.fecha_nacimiento IS 'fecha de naciemiento de jugador';


--
-- TOC entry 1931 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN jugadores.equipos_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN jugadores.equipos_id IS 'Equipo de Futbol al que pertenece el jugador';


--
-- TOC entry 1932 (class 0 OID 0)
-- Dependencies: 171
-- Name: COLUMN jugadores.posiciones_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN jugadores.posiciones_id IS 'Posicion en la que juega un Jugador';


--
-- TOC entry 170 (class 1259 OID 16431)
-- Dependencies: 5
-- Name: partidos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE partidos (
    equipos1_id integer NOT NULL,
    equipos2_id integer NOT NULL,
    goles_equipo1 smallint,
    goles_equipo2 integer NOT NULL,
    fecha date,
    estadios_id integer NOT NULL
);


ALTER TABLE public.partidos OWNER TO postgres;

--
-- TOC entry 1933 (class 0 OID 0)
-- Dependencies: 170
-- Name: TABLE partidos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE partidos IS 'ALmacena informacion de los partidos programados de futbol';


--
-- TOC entry 1934 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN partidos.equipos1_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partidos.equipos1_id IS 'Referencia del equipo local';


--
-- TOC entry 1935 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN partidos.equipos2_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partidos.equipos2_id IS 'Referencia del equipo visitante';


--
-- TOC entry 1936 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN partidos.goles_equipo1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partidos.goles_equipo1 IS 'Cantidad de goles marcados por el equipo1 (EquipoLocal)';


--
-- TOC entry 1937 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN partidos.goles_equipo2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partidos.goles_equipo2 IS 'Cantidad de goles marcados por el equipo2 (Equipo Visitante)';


--
-- TOC entry 1938 (class 0 OID 0)
-- Dependencies: 170
-- Name: COLUMN partidos.fecha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN partidos.fecha IS 'Fecha del partido';


--
-- TOC entry 167 (class 1259 OID 16425)
-- Dependencies: 170 5
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
-- TOC entry 1939 (class 0 OID 0)
-- Dependencies: 167
-- Name: partidos_equipos1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE partidos_equipos1_id_seq OWNED BY partidos.equipos1_id;


--
-- TOC entry 168 (class 1259 OID 16427)
-- Dependencies: 5 170
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
-- TOC entry 1940 (class 0 OID 0)
-- Dependencies: 168
-- Name: partidos_equipos2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE partidos_equipos2_id_seq OWNED BY partidos.equipos2_id;


--
-- TOC entry 174 (class 1259 OID 16462)
-- Dependencies: 5 170
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
-- TOC entry 1941 (class 0 OID 0)
-- Dependencies: 174
-- Name: partidos_estadios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE partidos_estadios_id_seq OWNED BY partidos.estadios_id;


--
-- TOC entry 169 (class 1259 OID 16429)
-- Dependencies: 170 5
-- Name: partidos_goles_equipo2_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE partidos_goles_equipo2_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partidos_goles_equipo2_seq OWNER TO postgres;

--
-- TOC entry 1942 (class 0 OID 0)
-- Dependencies: 169
-- Name: partidos_goles_equipo2_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE partidos_goles_equipo2_seq OWNED BY partidos.goles_equipo2;


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
-- TOC entry 1943 (class 0 OID 0)
-- Dependencies: 166
-- Name: TABLE posiciones; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE posiciones IS 'registra las posiciones de un jugador de futbol';


--
-- TOC entry 1944 (class 0 OID 0)
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
-- TOC entry 1945 (class 0 OID 0)
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
-- TOC entry 1946 (class 0 OID 0)
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
-- TOC entry 1947 (class 0 OID 0)
-- Dependencies: 162
-- Name: TABLE torneo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE torneo IS 'tabla que almacena los diferentes torneos de futbol';


--
-- TOC entry 1948 (class 0 OID 0)
-- Dependencies: 162
-- Name: COLUMN torneo.descripcion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN torneo.descripcion IS 'Nombre del torne';


--
-- TOC entry 1949 (class 0 OID 0)
-- Dependencies: 162
-- Name: COLUMN torneo.cantidad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN torneo.cantidad IS 'Contiene la cantidad de equipos que pueden participar en un torneo';


--
-- TOC entry 161 (class 1259 OID 16388)
-- Dependencies: 162 5
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
-- TOC entry 1950 (class 0 OID 0)
-- Dependencies: 161
-- Name: torneo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE torneo_id_seq OWNED BY torneo.id;


--
-- TOC entry 1895 (class 2604 OID 16459)
-- Dependencies: 173 172 173
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estadios ALTER COLUMN id SET DEFAULT nextval('estadios_id_seq'::regclass);


--
-- TOC entry 1891 (class 2604 OID 16434)
-- Dependencies: 167 170 170
-- Name: equipos1_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partidos ALTER COLUMN equipos1_id SET DEFAULT nextval('partidos_equipos1_id_seq'::regclass);


--
-- TOC entry 1892 (class 2604 OID 16435)
-- Dependencies: 170 168 170
-- Name: equipos2_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partidos ALTER COLUMN equipos2_id SET DEFAULT nextval('partidos_equipos2_id_seq'::regclass);


--
-- TOC entry 1893 (class 2604 OID 16436)
-- Dependencies: 170 169 170
-- Name: goles_equipo2; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partidos ALTER COLUMN goles_equipo2 SET DEFAULT nextval('partidos_goles_equipo2_seq'::regclass);


--
-- TOC entry 1894 (class 2604 OID 16464)
-- Dependencies: 174 170
-- Name: estadios_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partidos ALTER COLUMN estadios_id SET DEFAULT nextval('partidos_estadios_id_seq'::regclass);


--
-- TOC entry 1890 (class 2604 OID 16422)
-- Dependencies: 166 165 166
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY posiciones ALTER COLUMN id SET DEFAULT nextval('posiciones_id_seq'::regclass);


--
-- TOC entry 1889 (class 2604 OID 16393)
-- Dependencies: 162 161 162
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY torneo ALTER COLUMN id SET DEFAULT nextval('torneo_id_seq'::regclass);


--
-- TOC entry 1899 (class 2606 OID 16403)
-- Dependencies: 163 163 1914
-- Name: pk_equipos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipos
    ADD CONSTRAINT pk_equipos PRIMARY KEY (id);


--
-- TOC entry 1907 (class 2606 OID 16461)
-- Dependencies: 173 173 1914
-- Name: pk_estadios; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estadios
    ADD CONSTRAINT pk_estadios PRIMARY KEY (id);


--
-- TOC entry 1903 (class 2606 OID 16441)
-- Dependencies: 171 171 1914
-- Name: pk_jugadores; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jugadores
    ADD CONSTRAINT pk_jugadores PRIMARY KEY (id);


--
-- TOC entry 1901 (class 2606 OID 16424)
-- Dependencies: 166 166 1914
-- Name: pk_posiciones; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY posiciones
    ADD CONSTRAINT pk_posiciones PRIMARY KEY (id);


--
-- TOC entry 1897 (class 2606 OID 16395)
-- Dependencies: 162 162 1914
-- Name: pk_torneo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY torneo
    ADD CONSTRAINT pk_torneo PRIMARY KEY (id);


--
-- TOC entry 1905 (class 2606 OID 16443)
-- Dependencies: 171 171 1914
-- Name: un_dorsal; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jugadores
    ADD CONSTRAINT un_dorsal UNIQUE (numero);


--
-- TOC entry 1911 (class 2606 OID 16444)
-- Dependencies: 1898 171 163 1914
-- Name: fk_equipos_jugadores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jugadores
    ADD CONSTRAINT fk_equipos_jugadores FOREIGN KEY (equipos_id) REFERENCES equipos(id);


--
-- TOC entry 1908 (class 2606 OID 16407)
-- Dependencies: 163 164 1898 1914
-- Name: fk_equipos_registro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registro_equipos
    ADD CONSTRAINT fk_equipos_registro FOREIGN KEY (equipos_id) REFERENCES equipos(id);


--
-- TOC entry 1910 (class 2606 OID 16468)
-- Dependencies: 1906 170 173 1914
-- Name: fk_estadios_partidos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY partidos
    ADD CONSTRAINT fk_estadios_partidos FOREIGN KEY (estadios_id) REFERENCES estadios(id);


--
-- TOC entry 1912 (class 2606 OID 16449)
-- Dependencies: 171 1900 166 1914
-- Name: fk_posiciones; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jugadores
    ADD CONSTRAINT fk_posiciones FOREIGN KEY (posiciones_id) REFERENCES posiciones(id);


--
-- TOC entry 1909 (class 2606 OID 16412)
-- Dependencies: 1896 164 162 1914
-- Name: fk_torneos_registro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registro_equipos
    ADD CONSTRAINT fk_torneos_registro FOREIGN KEY (torneos_id) REFERENCES torneo(id);


--
-- TOC entry 1919 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-08-23 02:43:40 COT

--
-- PostgreSQL database dump complete
--

