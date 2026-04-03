--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Postgres.app)
-- Dumped by pg_dump version 17.0

-- Started on 2025-05-26 19:45:01 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS "Spedizioniere";
--
-- TOC entry 3754 (class 1262 OID 16687)
-- Name: Spedizioniere; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Spedizioniere" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = icu LOCALE = 'en_US.UTF-8' ICU_LOCALE = 'en-US';


ALTER DATABASE "Spedizioniere" OWNER TO postgres;

\connect "Spedizioniere"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16688)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    codice_cliente integer NOT NULL,
    nome character varying(50) NOT NULL,
    cognome character varying(50) NOT NULL,
    telefono character varying(10) NOT NULL,
    email character varying(50),
    riga_indirizzo1 character varying(50) NOT NULL,
    riga_indirizzo2 character varying(50),
    cap character varying(5) NOT NULL,
    citta character varying(50) NOT NULL,
    paese character varying(50) NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16691)
-- Name: consegna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consegna (
    esito character varying(50) NOT NULL,
    codice_tracciamento integer NOT NULL,
    data timestamp without time zone NOT NULL
);


ALTER TABLE public.consegna OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16694)
-- Name: corriere; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.corriere (
    patente character varying(3) NOT NULL,
    codice_corriere character varying(4) NOT NULL,
    codice_fiscale character varying(16) NOT NULL
);


ALTER TABLE public.corriere OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16697)
-- Name: dipendente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dipendente (
    codice_fiscale character varying(16) NOT NULL,
    nome character varying(50) NOT NULL,
    cognome character varying(50) NOT NULL,
    telefono character varying(10) NOT NULL,
    email character varying(50) NOT NULL,
    ruolo character varying(50) NOT NULL,
    ufficio character varying(50),
    abilitazione character varying(50),
    codice_magazzino integer,
    responsabile character varying(50),
    codice_corriere character varying(4)
);


ALTER TABLE public.dipendente OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16700)
-- Name: guida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guida (
    data_utilizzo date NOT NULL,
    codice_corriere character varying(4) NOT NULL,
    targa character varying(7) NOT NULL
);


ALTER TABLE public.guida OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16703)
-- Name: magazzino; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.magazzino (
    codice_magazzino integer NOT NULL,
    citta character varying(50) NOT NULL,
    nome character varying(50) NOT NULL,
    capacita_max integer NOT NULL,
    num_pacchi integer NOT NULL
);


ALTER TABLE public.magazzino OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16706)
-- Name: opera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opera (
    codice_corriere character varying(4) NOT NULL,
    data timestamp without time zone NOT NULL,
    codice_tracciamento integer NOT NULL
);


ALTER TABLE public.opera OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16709)
-- Name: ordine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordine (
    numero_ordine integer NOT NULL,
    data_creazione timestamp without time zone NOT NULL,
    mittente integer NOT NULL,
    destinatario integer NOT NULL
);


ALTER TABLE public.ordine OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16712)
-- Name: pacco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pacco (
    codice_tracciamento integer NOT NULL,
    data_ora timestamp without time zone NOT NULL,
    tipo_contenuto character varying(50),
    peso integer NOT NULL,
    dimensioni character varying(50) NOT NULL,
    stato character varying(50) NOT NULL,
    numero_ordine integer NOT NULL,
    codice_magazzino integer NOT NULL
);


ALTER TABLE public.pacco OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16715)
-- Name: veicolo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veicolo (
    targa character varying(7) NOT NULL,
    capacita integer NOT NULL,
    patente_richiesta character varying(10) NOT NULL,
    ultima_manutenzione date,
    tipo character varying(50) NOT NULL
);


ALTER TABLE public.veicolo OWNER TO postgres;

--
-- TOC entry 3739 (class 0 OID 16688)
-- Dependencies: 217
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente VALUES (2, 'Luigi', 'Bianchi', '3523456789', 'luigi.bianchi@email.com', 'Piazza Duomo 1', 'Scala A', '20100', 'Milano', 'Italia');
INSERT INTO public.cliente VALUES (3, 'Anna', 'Verdi', '3534567890', 'anna.verdi@email.com', 'Corso Italia 45', NULL, '10100', 'Torino', 'Italia');
INSERT INTO public.cliente VALUES (4, 'Giovanna', 'Russo', '3545678901', NULL, 'Via Garibaldi 78', NULL, '16100', 'Genova', 'Italia');
INSERT INTO public.cliente VALUES (5, 'Paolo', 'Ferrari', '3556789012', 'paolo.ferrari@email.com', 'Viale dei Fiori 3', 'Int. 5', '50100', 'Firenze', 'Italia');
INSERT INTO public.cliente VALUES (6, 'Francesca', 'Esposito', '3567890123', 'francesca.esposito@email.com', 'Largo Colombo 9', NULL, '80100', 'Napoli', 'Italia');
INSERT INTO public.cliente VALUES (7, 'Antonio', 'Romano', '3578901234', NULL, 'Via Dante 7', NULL, '30100', 'Venezia', 'Italia');
INSERT INTO public.cliente VALUES (8, 'Elena', 'Gallo', '3589012345', 'elena.gallo@email.com', 'Piazza Maggiore 2', NULL, '40100', 'Bologna', 'Italia');
INSERT INTO public.cliente VALUES (9, 'Stefano', 'Costa', '3590123456', 'stefano.costa@email.com', 'Corso Vittorio Emanuele 34', NULL, '10100', 'Torino', 'Italia');
INSERT INTO public.cliente VALUES (10, 'Laura', 'Fontana', '3501234567', 'laura.fontana@email.com', 'Via Milano 56', 'Palazzo B', '20100', 'Milano', 'Italia');
INSERT INTO public.cliente VALUES (11, 'Marco', 'Ricci', '3512345679', NULL, 'Via Verdi 23', NULL, '00100', 'Roma', 'Italia');
INSERT INTO public.cliente VALUES (12, 'Silvia', 'Marino', '3523456790', 'silvia.marino@email.com', 'Piazza San Marco 4', NULL, '30100', 'Venezia', 'Italia');
INSERT INTO public.cliente VALUES (13, 'Roberto', 'Greco', '3534567901', 'roberto.greco@email.com', 'Via Napoli 67', NULL, '80100', 'Napoli', 'Italia');
INSERT INTO public.cliente VALUES (14, 'Valentina', 'Barbieri', '3545679012', NULL, 'Corso Cavour 89', 'Appartamento 3', '40100', 'Bologna', 'Italia');
INSERT INTO public.cliente VALUES (15, 'Davide', 'Lombardi', '3556790123', 'davide.lombardi@email.com', 'Viale Libertà 12', NULL, '50100', 'Firenze', 'Italia');
INSERT INTO public.cliente VALUES (16, 'Alessia', 'Moretti', '3567901234', 'alessia.moretti@email.com', 'Via Toscana 45', NULL, '16100', 'Genova', 'Italia');
INSERT INTO public.cliente VALUES (18, 'Barbara', 'Mancini', '3580123456', 'barbara.mancini@email.com', 'Via Emilia 78', NULL, '40100', 'Bologna', 'Italia');
INSERT INTO public.cliente VALUES (29, 'Riccardo', 'Carbone', '3591234567', NULL, 'Piazza Mercato 7', NULL, '80100', 'Napoli', 'Italia');
INSERT INTO public.cliente VALUES (32, 'Eleonora', 'Conte', '3524567890', NULL, 'Corso Sicilia 67', 'Appartamento 5', '20100', 'Milano', 'Italia');
INSERT INTO public.cliente VALUES (35, 'Vincenzo', 'Silvestri', '3557890123', NULL, 'Via Dalmazia 56', NULL, '70100', 'Bari', 'Italia');
INSERT INTO public.cliente VALUES (40, 'Michela', 'Fiore', '3502345678', 'michela.fiore@email.com', 'Viale della Repubblica 89', NULL, '00100', 'Roma', 'Italia');
INSERT INTO public.cliente VALUES (41, 'Giovanni', 'Gentile', '3513456789', NULL, 'Via Tevere 45', 'Scala C', '00100', 'Roma', 'Italia');
INSERT INTO public.cliente VALUES (43, 'Fabio', 'Marte', '3535678901', 'fabio.marte@email.com', 'Via Appia 23', NULL, '80100', 'Napoli', 'Italia');
INSERT INTO public.cliente VALUES (44, 'Eva', 'Santilli', '3546789012', NULL, 'Piazza Navona 4', NULL, '00100', 'Roma', 'Italia');
INSERT INTO public.cliente VALUES (46, 'Claudia', 'Parisi', '3568901234', 'claudia.parisi@email.com', 'Largo Argentina 78', 'Int. 2', '90100', 'Palermo', 'Italia');
INSERT INTO public.cliente VALUES (47, 'Matteo', 'Neri', '3579012345', NULL, 'Corso Adriatico 12', NULL, '60100', 'Ancona', 'Italia');
INSERT INTO public.cliente VALUES (51, 'Alberto', 'Ferri', '3513456790', 'alberto.ferri@email.com', 'Via Monte Bianco 10', NULL, '10100', 'Torino', 'Italia');
INSERT INTO public.cliente VALUES (52, 'Beatrice', 'Rinaldi', '3524567901', NULL, 'Piazza San Carlo 15', NULL, '10100', 'Torino', 'Italia');
INSERT INTO public.cliente VALUES (54, 'Diana', 'D''Amico', '3546789123', 'diana.damico@email.com', 'Corso Buenos Aires 25', NULL, '20100', 'Milano', 'Italia');
INSERT INTO public.cliente VALUES (61, 'Leonardo', 'Rossetti', '3513457890', NULL, 'Viale delle Milizie 60', NULL, '00100', 'Roma', 'Italia');
INSERT INTO public.cliente VALUES (62, 'Marta', 'Angeli', '3524568901', 'marta.angeli@email.com', 'Via dei Mille 65', NULL, '16100', 'Genova', 'Italia');
INSERT INTO public.cliente VALUES (63, 'Nicola', 'Montanari', '3535679012', 'nicola.montanari@email.com', 'Piazza della Signoria 70', NULL, '50100', 'Firenze', 'Italia');
INSERT INTO public.cliente VALUES (64, 'Olga', 'Fabbri', '3546780123', NULL, 'Corso Italia 75', NULL, '29100', 'Piacenza', 'Italia');
INSERT INTO public.cliente VALUES (65, 'Paola', 'Poli', '3557891234', 'paola.poli@email.com', 'Via San Vitale 80', NULL, '40100', 'Bologna', 'Italia');
INSERT INTO public.cliente VALUES (55, 'Edoardo', 'Pace', '3557191234', NULL, 'Via Flaminia 30', NULL, '00100', 'Roma', 'Italia');
INSERT INTO public.cliente VALUES (25, 'Enrico', 'Santoro', '3557890121', 'enrico.santoro@email.com', 'Via Adriatica 56', NULL, '40100', 'Bologna', 'Italia');
INSERT INTO public.cliente VALUES (45, 'Luca', 'Orlando', '3557810123', 'luca.orlando@email.com', 'Viale dei Platani 56', NULL, '90100', 'Palermo', 'Italia');
INSERT INTO public.cliente VALUES (28, 'Sabrina', 'Serra', '3580123416', 'sabrina.serra@email.com', 'Corso Garibaldi 34', 'Scala B', '07100', 'Sassari', 'Italia');
INSERT INTO public.cliente VALUES (38, 'Sara', 'Palumbo', '3581123456', NULL, 'Via Lombardia 34', NULL, '40100', 'Bologna', 'Italia');
INSERT INTO public.cliente VALUES (48, 'Greta', 'Colombo', '3510123456', 'greta.colombo@email.com', 'Via Padova 34', NULL, '35100', 'Padova', 'Italia');
INSERT INTO public.cliente VALUES (22, 'Elisabetta', 'Bruno', '3524567891', 'elisabetta.bruno@email.com', 'Via Liguria 67', NULL, '16100', 'Genova', 'Italia');
INSERT INTO public.cliente VALUES (42, 'Roberta', 'Leone', '3524567190', 'roberta.leone@email.com', 'Corso Trieste 67', NULL, '34100', 'Trieste', 'Italia');
INSERT INTO public.cliente VALUES (23, 'Federico', 'Pellegrini', '3535678911', NULL, 'Piazza Santa Croce 8', NULL, '50100', 'Firenze', 'Italia');
INSERT INTO public.cliente VALUES (33, 'Massimo', 'Sanna', '3535618901', 'massimo.sanna@email.com', 'Via Piemonte 23', NULL, '10100', 'Torino', 'Italia');
INSERT INTO public.cliente VALUES (20, 'Chiara', 'Rizzo', '3502345671', NULL, 'Via Sicilia 34', NULL, '20100', 'Milano', 'Italia');
INSERT INTO public.cliente VALUES (30, 'Veronica', 'Martini', '3512345678', 'veronica.martini@email.com', 'Via Firenze 89', NULL, '50100', 'Firenze', 'Italia');
INSERT INTO public.cliente VALUES (50, 'Federica', 'Testa', '3502345178', NULL, 'Viale Venezia 89', NULL, '30100', 'Venezia', 'Italia');
INSERT INTO public.cliente VALUES (57, 'Gianluca', 'Sartori', '3579013451', 'gianluca.sartori@email.com', 'Via Zamboni 40', NULL, '40100', 'Bologna', 'Italia');
INSERT INTO public.cliente VALUES (17, 'Giuseppe', 'Conti', '3579012341', NULL, 'Piazza del Popolo 6', NULL, '00100', 'Roma', 'Italia');
INSERT INTO public.cliente VALUES (27, 'Lorenzo', 'Piras', '3579112345', 'lorenzo.piras@email.com', 'Via Sardegna 12', NULL, '09100', 'Cagliari', 'Italia');
INSERT INTO public.cliente VALUES (37, 'Daniele', 'Amato', '3571012345', 'daniele.amato@email.com', 'Corso Venezia 12', 'Piano 1', '30100', 'Venezia', 'Italia');
INSERT INTO public.cliente VALUES (1, 'Mario', 'Rossi', '3512345671', 'mario.rossi@email.com', 'Via Roma 12', NULL, '00100', 'Roma', 'Italia');
INSERT INTO public.cliente VALUES (56, 'Flavia', 'Valentini', '3568902341', 'flavia.valentini@email.com', 'Viale Trastevere 35', NULL, '00100', 'Roma', 'Italia');
INSERT INTO public.cliente VALUES (59, 'Jacopo', 'Marcelo', '3591235671', 'jacopo.marcelo@email.com', 'Corso Palladio 50', NULL, '36100', 'Vicenza', 'Italia');
INSERT INTO public.cliente VALUES (26, 'Giorgia', 'D''Angelo', '3568901231', NULL, 'Viale Roma 78', NULL, '00100', 'Roma', 'Italia');
INSERT INTO public.cliente VALUES (36, 'Camilla', 'Riva', '3568911234', 'camilla.riva@email.com', 'Largo Torino 78', NULL, '25100', 'Brescia', 'Italia');
INSERT INTO public.cliente VALUES (53, 'Carlo', 'Sorrentino', '3535679112', 'carlo.sorrentino@email.com', 'Via Partenope 20', 'Piano 3', '80100', 'Napoli', 'Italia');
INSERT INTO public.cliente VALUES (58, 'Ilaria', 'Trentini', '3580123567', NULL, 'Piazza Bra 45', NULL, '37100', 'Verona', 'Italia');
INSERT INTO public.cliente VALUES (21, 'Andrea', 'De Luca', '3513156789', 'andrea.deluca@email.com', 'Largo Augusto 5', NULL, '80100', 'Napoli', 'Italia');
INSERT INTO public.cliente VALUES (31, 'Alessandro', 'Longo', '3513456719', 'alessandro.longo@email.com', 'Viale dei Pini 45', NULL, '16100', 'Genova', 'Italia');
INSERT INTO public.cliente VALUES (60, 'Katia', 'Benedetti', '3502346781', 'katia.benedetti@email.com', 'Via XX Settembre 55', 'App. 6', '16100', 'Genova', 'Italia');
INSERT INTO public.cliente VALUES (24, 'Monica', 'Vitali', '3546789112', 'monica.vitali@email.com', 'Corso Umberto 23', 'Interno 4', '30100', 'Venezia', 'Italia');
INSERT INTO public.cliente VALUES (34, 'Daniela', 'Farina', '3546189012', 'daniela.farina@email.com', 'Piazza Unità 4', NULL, '34100', 'Trieste', 'Italia');
INSERT INTO public.cliente VALUES (66, 'Quinto', 'Ruggeri', '3568902345', 'quinto.ruggeri@email.com', 'Viale Certosa 85', 'Int. 7', '20100', 'Milano', 'Italia');
INSERT INTO public.cliente VALUES (67, 'Rachele', 'Donati', '3579013456', NULL, 'Via Po 90', NULL, '10100', 'Torino', 'Italia');
INSERT INTO public.cliente VALUES (68, 'Salvatore', 'Battaglia', '3580124567', 'salvatore.battaglia@email.com', 'Corso Monforte 95', NULL, '20100', 'Milano', 'Italia');
INSERT INTO public.cliente VALUES (69, 'Teresa', 'Pagano', '3591235678', 'teresa.pagano@email.com', 'Via Toledo 100', NULL, '80100', 'Napoli', 'Italia');
INSERT INTO public.cliente VALUES (70, 'Umberto', 'Ferraro', '3502346789', NULL, 'Piazza del Plebiscito 105', NULL, '80100', 'Napoli', 'Italia');
INSERT INTO public.cliente VALUES (19, 'Simone', 'Giordano', '3591234560', 'simone.giordano@email.com', 'Corso Francia 90', 'Piano 2', '10100', 'Torino', 'Italia');
INSERT INTO public.cliente VALUES (39, 'Gabriele', 'Bernardi', '3591234517', 'gabriele.bernardi@email.com', 'Piazza Dante 7', NULL, '50100', 'Firenze', 'Italia');
INSERT INTO public.cliente VALUES (49, 'Pietro', 'Mazza', '3591214567', 'pietro.mazza@email.com', 'Piazza delle Erbe 7', NULL, '37100', 'Verona', 'Italia');


--
-- TOC entry 3740 (class 0 OID 16691)
-- Dependencies: 218
-- Data for Name: consegna; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.consegna VALUES ('Consegnato', 10170, '2024-07-09 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10177, '2024-07-06 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10183, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10192, '2024-07-06 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10198, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10117, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10123, '2024-07-10 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10041, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10049, '2024-07-12 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10058, '2024-07-05 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10065, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10073, '2024-07-05 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10134, '2024-07-06 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10014, '2024-07-10 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10022, '2024-07-14 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10077, '2024-07-07 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10080, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10042, '2024-07-12 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10097, '2024-07-07 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10103, '2024-07-04 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10053, '2024-07-14 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10122, '2024-07-06 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10130, '2024-07-11 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10137, '2024-07-06 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10143, '2024-07-07 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10150, '2024-07-09 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10152, '2024-07-06 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10163, '2024-07-07 00:00:00');
INSERT INTO public.consegna VALUES ('Consegnato', 10033, '2024-07-04 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10170, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10177, '2024-07-05 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10183, '2024-07-07 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10192, '2024-07-05 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10123, '2024-07-09 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10058, '2024-07-04 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10065, '2024-07-07 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10134, '2024-07-05 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10022, '2024-07-13 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10080, '2024-07-07 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10097, '2024-07-06 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10122, '2024-07-05 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10143, '2024-07-06 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10152, '2024-07-05 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10033, '2024-07-03 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10170, '2024-07-07 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10183, '2024-07-06 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10192, '2024-07-04 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10123, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10122, '2024-07-04 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10143, '2024-07-05 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10152, '2024-07-04 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10033, '2024-07-02 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10036, '2024-07-04 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10153, '2024-07-12 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10100, '2024-07-06 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10062, '2024-07-05 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10083, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10109, '2024-07-04 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10032, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10072, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10112, '2024-07-10 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10047, '2024-07-09 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10074, '2024-07-06 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10099, '2024-07-06 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10197, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10113, '2024-07-05 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10057, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10106, '2024-07-04 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10187, '2024-07-11 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10092, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10180, '2024-07-05 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10116, '2024-07-06 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10011, '2024-07-07 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10039, '2024-07-05 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10119, '2024-07-07 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10120, '2024-07-07 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10156, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10176, '2024-07-03 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10122, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10043, '2024-07-07 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10086, '2024-07-09 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10026, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10169, '2024-07-07 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10126, '2024-07-08 00:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10001, '2024-07-02 10:00:00');
INSERT INTO public.consegna VALUES ('Tentata consegna', 10003, '2024-07-03 11:00:00');


--
-- TOC entry 3741 (class 0 OID 16694)
-- Dependencies: 219
-- Data for Name: corriere; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.corriere VALUES ('AM', 'M012', 'SNGMML85R12Z404P');
INSERT INTO public.corriere VALUES ('AM', 'A567', 'SNGABD90M20Z405Q');
INSERT INTO public.corriere VALUES ('B', 'C432', 'SNGCHE88L11Z406R');
INSERT INTO public.corriere VALUES ('AM', 'I334', 'SNGIBR91D22Z407S');
INSERT INTO public.corriere VALUES ('AM', 'O210', 'SNGOUS92T31Z408T');
INSERT INTO public.corriere VALUES ('B', 'N123', 'ROUNIC85A15Y101U');
INSERT INTO public.corriere VALUES ('AM', 'A789', 'ROUALX89C09Y102V');
INSERT INTO public.corriere VALUES ('AM', 'M456', 'ROUMIH87B03Y103W');
INSERT INTO public.corriere VALUES ('B', 'V776', 'ROUVAS93H25Y104X');
INSERT INTO public.corriere VALUES ('AM', 'F876', 'ROUFLR90E17Y105Y');


--
-- TOC entry 3742 (class 0 OID 16697)
-- Dependencies: 220
-- Data for Name: dipendente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dipendente VALUES ('BNCLRA90P20C351H', 'Laura', 'Bianchi', '3209988776', 'laura.bianchi@email.com', 'Segretario', '0', NULL, 1, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('VRDGPP91E01H501B', 'Giuseppe', 'Verdi', '3476655443', 'giuseppe.verdi@email.com', 'Segretario', '0', NULL, 2, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('NCLMNL88S15F205L', 'Manuela', 'Neri', '3392233445', 'manuela.neri@email.com', 'Segretario', '0', NULL, 3, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('FRNSVN95T22H501T', 'Silvana', 'Ferrari', '3284455667', 'silvana.ferrari@email.com', 'Segretario', '0', NULL, 4, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('MRLCLD92C09F205S', 'Claudio', 'Morelli', '3456677889', 'claudio.morelli@email.com', 'Segretario', '0', NULL, 5, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('PSLNDR93L10F205T', 'Andrea', 'Pessina', '3278899001', 'andrea.pessina@email.com', 'Segretario', '0', NULL, 6, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('BLNCST87M20H223R', 'Cristina', 'Bellanova', '3497766554', 'cristina.bellanova@email.com', 'Segretario', '0', NULL, 7, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('RBRFNC89D60F205Y', 'Franco', 'Ribera', '3369988776', 'franco.ribera@email.com', 'Segretario', '0', NULL, 8, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('PLRMRC87L12H501F', 'Marco', 'Palermo', '3451239876', 'marco.palermo@email.com', 'Segretario', '0', NULL, 10, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('PLAKDI92A01Z100P', 'Arben', 'Plaku', '3201122334', 'arben.plaku@example.com', 'Magazziniere', NULL, 'Ricezionista', 1, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('TOSLDA88B15Z100M', 'Luan', 'Toska', '3202233445', 'luan.toska@example.com', 'Magazziniere', NULL, 'Picker', 2, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('KRABED95C30Z100Q', 'Besnik', 'Krabeja', '3203344556', 'besnik.krabeja@example.com', 'Magazziniere', NULL, 'Carrellista', 3, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('MIRORI90D12Z100L', 'Erion', 'Miro', '3204455667', 'erion.miro@example.com', 'Magazziniere', NULL, 'Ricezionista', 4, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('DEDAAN85E25Z100G', 'Blerim', 'Deda', '3205566778', 'blerim.deda@example.com', 'Magazziniere', NULL, 'Picker', 5, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('XHAFIL91F06Z100X', 'Fatjon', 'Xhafa', '3206677889', 'fatjon.xhafa@example.com', 'Magazziniere', NULL, 'Ricezionista', 6, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('RAMBAK87G14Z100D', 'Genti', 'Rama', '3207788990', 'genti.rama@example.com', 'Magazziniere', NULL, 'Picker', 7, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('CEKOLU86H20Z100N', 'Ilir', 'Ceko', '3208899001', 'ilir.ceko@example.com', 'Magazziniere', NULL, 'Ricezionista', 8, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('ZENQAL93I03Z100S', 'Kreshnik', 'Zeneli', '3209900112', 'kreshnik.zeneli@example.com', 'Magazziniere', NULL, 'Carrellista', 9, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('HOXGIN89L11Z100C', 'Valon', 'Hoxha', '3201011122', 'valon.hoxha@example.com', 'Magazziniere', NULL, 'Picker', 10, 'RSSMRA85T10A562S', NULL);
INSERT INTO public.dipendente VALUES ('SNGMML85R12Z404P', 'Mamadou', 'Sow', '3456789012', 'mamadou.sow@example.com', 'Corriere', NULL, NULL, 1, 'RSSMRA85T10A562S', 'M012');
INSERT INTO public.dipendente VALUES ('SNGABD90M20Z405Q', 'Abdoulaye', 'Diop', '3481234567', 'abdoulaye.diop@example.com', 'Corriere', NULL, NULL, 2, 'RSSMRA85T10A562S', 'A567');
INSERT INTO public.dipendente VALUES ('SNGCHE88L11Z406R', 'Cheikh', 'Fall', '3498765432', 'cheikh.fall@example.com', 'Corriere', NULL, NULL, 3, 'RSSMRA85T10A562S', 'C432');
INSERT INTO public.dipendente VALUES ('SNGIBR91D22Z407S', 'Ibrahima', 'Ba', '3401122334', 'ibrahima.ba@example.com', 'Corriere', NULL, NULL, 4, 'RSSMRA85T10A562S', 'I334');
INSERT INTO public.dipendente VALUES ('SNGOUS92T31Z408T', 'Ousmane', 'Ndiaye', '3476543210', 'ousmane.ndiaye@example.com', 'Corriere', NULL, NULL, 5, 'RSSMRA85T10A562S', 'O210');
INSERT INTO public.dipendente VALUES ('ROUNIC85A15Y101U', 'Nicolae', 'Popescu', '3467890123', 'nicolae.popescu@example.com', 'Corriere', NULL, NULL, 6, 'RSSMRA85T10A562S', 'N123');
INSERT INTO public.dipendente VALUES ('ROUALX89C09Y102V', 'Alexandru', 'Ionescu', '3423456789', 'alexandru.ionescu@example.com', 'Corriere', NULL, NULL, 7, 'RSSMRA85T10A562S', 'A789');
INSERT INTO public.dipendente VALUES ('ROUMIH87B03Y103W', 'Mihai', 'Georgescu', '3490123456', 'mihai.georgescu@example.com', 'Corriere', NULL, NULL, 8, 'RSSMRA85T10A562S', 'M456');
INSERT INTO public.dipendente VALUES ('ROUVAS93H25Y104X', 'Vasile', 'Dumitru', '3489988776', 'vasile.dumitru@example.com', 'Corriere', NULL, NULL, 9, 'RSSMRA85T10A562S', 'V776');
INSERT INTO public.dipendente VALUES ('ROUFLR90E17Y105Y', 'Florin', 'Marin', '3432109876', 'florin.marin@example.com', 'Corriere', NULL, NULL, 10, 'RSSMRA85T10A562S', 'F876');
INSERT INTO public.dipendente VALUES ('RSSMRA85T10A562S', 'Marco', 'Rossi', '3331122333', 'marco.rossi@email.com', 'Segretario', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.dipendente VALUES ('TSTLNZ94M12C351Z', 'Lorenzo', 'Testa', '3481234167', 'lorenzo.testa@email.com', 'Segretario', '0', NULL, 9, 'RSSMRA85T10A562S', NULL);


--
-- TOC entry 3743 (class 0 OID 16700)
-- Dependencies: 221
-- Data for Name: guida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.guida VALUES ('2024-01-10', 'V776', 'FG9976');
INSERT INTO public.guida VALUES ('2024-01-10', 'M012', 'BC12345');
INSERT INTO public.guida VALUES ('2024-03-20', 'I334', 'BC34567');
INSERT INTO public.guida VALUES ('2024-04-05', 'O210', 'MT12345');
INSERT INTO public.guida VALUES ('2024-05-12', 'A789', 'MT23456');
INSERT INTO public.guida VALUES ('2024-06-18', 'M456', 'MT34567');
INSERT INTO public.guida VALUES ('2024-07-22', 'F876', 'MT45678');
INSERT INTO public.guida VALUES ('2024-08-08', 'C432', 'FG12345');
INSERT INTO public.guida VALUES ('2024-09-14', 'N123', 'FG23456');
INSERT INTO public.guida VALUES ('2024-07-11', 'V776', 'FG9976');
INSERT INTO public.guida VALUES ('2024-07-09', 'V776', 'FG9976');
INSERT INTO public.guida VALUES ('2024-07-12', 'V776', 'FG9976');
INSERT INTO public.guida VALUES ('2024-07-10', 'V776', 'FG9976');
INSERT INTO public.guida VALUES ('2024-07-08', 'V776', 'FG9976');
INSERT INTO public.guida VALUES ('2024-07-05', 'V776', 'FG9976');
INSERT INTO public.guida VALUES ('2024-07-04', 'V776', 'FG9976');
INSERT INTO public.guida VALUES ('2024-07-06', 'V776', 'FG9976');
INSERT INTO public.guida VALUES ('2024-07-07', 'V776', 'FG9976');
INSERT INTO public.guida VALUES ('2024-07-14', 'N123', 'FG23456');
INSERT INTO public.guida VALUES ('2024-07-06', 'N123', 'FG23456');
INSERT INTO public.guida VALUES ('2024-07-05', 'N123', 'FG23456');
INSERT INTO public.guida VALUES ('2024-07-12', 'N123', 'FG23456');
INSERT INTO public.guida VALUES ('2024-07-07', 'N123', 'FG23456');
INSERT INTO public.guida VALUES ('2024-07-04', 'N123', 'FG23456');
INSERT INTO public.guida VALUES ('2024-07-08', 'N123', 'FG23456');
INSERT INTO public.guida VALUES ('2024-07-03', 'N123', 'FG23456');
INSERT INTO public.guida VALUES ('2024-07-05', 'M456', 'MT34567');
INSERT INTO public.guida VALUES ('2024-07-08', 'M456', 'MT34567');
INSERT INTO public.guida VALUES ('2024-07-07', 'M456', 'MT34567');
INSERT INTO public.guida VALUES ('2024-07-06', 'M012', 'BC12345');
INSERT INTO public.guida VALUES ('2024-07-08', 'M012', 'BC12345');
INSERT INTO public.guida VALUES ('2024-07-05', 'M012', 'BC12345');
INSERT INTO public.guida VALUES ('2024-07-04', 'M012', 'BC12345');
INSERT INTO public.guida VALUES ('2024-07-12', 'M012', 'BC12345');
INSERT INTO public.guida VALUES ('2024-07-03', 'M012', 'BC12345');
INSERT INTO public.guida VALUES ('2024-07-05', 'I334', 'BC34567');
INSERT INTO public.guida VALUES ('2024-07-13', 'I334', 'BC34567');
INSERT INTO public.guida VALUES ('2024-07-08', 'I334', 'BC34567');
INSERT INTO public.guida VALUES ('2024-07-09', 'I334', 'BC34567');
INSERT INTO public.guida VALUES ('2024-07-06', 'I334', 'BC34567');
INSERT INTO public.guida VALUES ('2024-07-10', 'I334', 'BC34567');
INSERT INTO public.guida VALUES ('2024-07-07', 'I334', 'BC34567');
INSERT INTO public.guida VALUES ('2024-07-14', 'I334', 'BC34567');
INSERT INTO public.guida VALUES ('2024-07-06', 'F876', 'MT45678');
INSERT INTO public.guida VALUES ('2024-07-05', 'F876', 'MT45678');
INSERT INTO public.guida VALUES ('2024-07-09', 'F876', 'MT45678');
INSERT INTO public.guida VALUES ('2024-07-11', 'F876', 'MT45678');
INSERT INTO public.guida VALUES ('2024-07-08', 'F876', 'MT45678');
INSERT INTO public.guida VALUES ('2024-07-08', 'A789', 'MT23456');
INSERT INTO public.guida VALUES ('2024-07-05', 'A789', 'MT23456');
INSERT INTO public.guida VALUES ('2024-07-06', 'A789', 'MT23456');
INSERT INTO public.guida VALUES ('2024-02-15', 'A567', 'BC23456');


--
-- TOC entry 3744 (class 0 OID 16703)
-- Dependencies: 222
-- Data for Name: magazzino; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.magazzino VALUES (1, 'Milano', 'Magazzino Nord', 1000, 30);
INSERT INTO public.magazzino VALUES (2, 'Roma', 'Magazzino Centro', 1500, 25);
INSERT INTO public.magazzino VALUES (3, 'Torino', 'Magazzino Ovest', 800, 15);
INSERT INTO public.magazzino VALUES (4, 'Napoli', 'Magazzino Sud', 1200, 20);
INSERT INTO public.magazzino VALUES (5, 'Firenze', 'Magazzino Est', 700, 10);
INSERT INTO public.magazzino VALUES (6, 'Bologna', 'Magazzino Centrale', 1300, 30);
INSERT INTO public.magazzino VALUES (7, 'Genova', 'Magazzino Porto', 900, 20);
INSERT INTO public.magazzino VALUES (8, 'Verona', 'Magazzino Fiera', 1100, 20);
INSERT INTO public.magazzino VALUES (9, 'Palermo', 'Magazzino Sicilia', 600, 15);
INSERT INTO public.magazzino VALUES (10, 'Bari', 'Magazzino Puglia', 1000, 15);


--
-- TOC entry 3745 (class 0 OID 16706)
-- Dependencies: 223
-- Data for Name: opera; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.opera VALUES ('I334', '2024-07-08 00:00:00', 10123);
INSERT INTO public.opera VALUES ('I334', '2024-07-09 00:00:00', 10123);
INSERT INTO public.opera VALUES ('I334', '2024-07-10 00:00:00', 10123);
INSERT INTO public.opera VALUES ('A567', '2024-07-02 00:00:00', 10033);
INSERT INTO public.opera VALUES ('A567', '2024-07-03 00:00:00', 10033);
INSERT INTO public.opera VALUES ('A567', '2024-07-04 00:00:00', 10033);
INSERT INTO public.opera VALUES ('I334', '2024-07-05 00:00:00', 10073);
INSERT INTO public.opera VALUES ('I334', '2024-07-07 00:00:00', 10077);
INSERT INTO public.opera VALUES ('V776', '2024-07-06 00:00:00', 10097);
INSERT INTO public.opera VALUES ('V776', '2024-07-07 00:00:00', 10097);
INSERT INTO public.opera VALUES ('N123', '2024-07-07 00:00:00', 10120);
INSERT INTO public.opera VALUES ('A567', '2024-07-04 00:00:00', 10103);
INSERT INTO public.opera VALUES ('N123', '2024-07-05 00:00:00', 10062);
INSERT INTO public.opera VALUES ('M012', '2024-07-12 00:00:00', 10049);
INSERT INTO public.opera VALUES ('M456', '2024-07-05 00:00:00', 10039);
INSERT INTO public.opera VALUES ('A789', '2024-07-05 00:00:00', 10134);
INSERT INTO public.opera VALUES ('A789', '2024-07-06 00:00:00', 10134);
INSERT INTO public.opera VALUES ('A789', '2024-07-06 00:00:00', 10137);
INSERT INTO public.opera VALUES ('A567', '2024-07-09 00:00:00', 10047);
INSERT INTO public.opera VALUES ('V776', '2024-07-08 00:00:00', 10198);
INSERT INTO public.opera VALUES ('M456', '2024-07-07 00:00:00', 10169);
INSERT INTO public.opera VALUES ('F876', '2024-07-08 00:00:00', 10197);
INSERT INTO public.opera VALUES ('V776', '2024-07-05 00:00:00', 10180);
INSERT INTO public.opera VALUES ('M012', '2024-07-08 00:00:00', 10026);
INSERT INTO public.opera VALUES ('V776', '2024-07-10 00:00:00', 10014);
INSERT INTO public.opera VALUES ('M012', '2024-07-04 00:00:00', 10106);
INSERT INTO public.opera VALUES ('I334', '2024-07-07 00:00:00', 10170);
INSERT INTO public.opera VALUES ('I334', '2024-07-08 00:00:00', 10170);
INSERT INTO public.opera VALUES ('I334', '2024-07-09 00:00:00', 10170);
INSERT INTO public.opera VALUES ('N123', '2024-07-04 00:00:00', 10036);
INSERT INTO public.opera VALUES ('N123', '2024-07-12 00:00:00', 10153);
INSERT INTO public.opera VALUES ('A567', '2024-07-04 00:00:00', 10109);
INSERT INTO public.opera VALUES ('A567', '2024-07-08 00:00:00', 10083);
INSERT INTO public.opera VALUES ('N123', '2024-07-08 00:00:00', 10032);
INSERT INTO public.opera VALUES ('N123', '2024-07-08 00:00:00', 10072);
INSERT INTO public.opera VALUES ('N123', '2024-07-07 00:00:00', 10163);
INSERT INTO public.opera VALUES ('N123', '2024-07-06 00:00:00', 10183);
INSERT INTO public.opera VALUES ('N123', '2024-07-07 00:00:00', 10183);
INSERT INTO public.opera VALUES ('N123', '2024-07-08 00:00:00', 10183);
INSERT INTO public.opera VALUES ('A567', '2024-07-02 00:00:00', 10001);
INSERT INTO public.opera VALUES ('A567', '2024-07-10 00:00:00', 10112);
INSERT INTO public.opera VALUES ('F876', '2024-07-05 00:00:00', 10113);
INSERT INTO public.opera VALUES ('F876', '2024-07-06 00:00:00', 10099);
INSERT INTO public.opera VALUES ('V776', '2024-07-08 00:00:00', 10057);
INSERT INTO public.opera VALUES ('V776', '2024-07-08 00:00:00', 10092);
INSERT INTO public.opera VALUES ('V776', '2024-07-11 00:00:00', 10187);
INSERT INTO public.opera VALUES ('A789', '2024-07-08 00:00:00', 10041);
INSERT INTO public.opera VALUES ('I334', '2024-07-06 00:00:00', 10116);
INSERT INTO public.opera VALUES ('I334', '2024-07-13 00:00:00', 10022);
INSERT INTO public.opera VALUES ('I334', '2024-07-14 00:00:00', 10022);
INSERT INTO public.opera VALUES ('A567', '2024-07-08 00:00:00', 10117);
INSERT INTO public.opera VALUES ('A567', '2024-07-07 00:00:00', 10011);
INSERT INTO public.opera VALUES ('M012', '2024-07-06 00:00:00', 10074);
INSERT INTO public.opera VALUES ('M456', '2024-07-07 00:00:00', 10119);
INSERT INTO public.opera VALUES ('N123', '2024-07-03 00:00:00', 10003);
INSERT INTO public.opera VALUES ('M012', '2024-07-03 00:00:00', 10176);
INSERT INTO public.opera VALUES ('M012', '2024-07-08 00:00:00', 10156);
INSERT INTO public.opera VALUES ('M012', '2024-07-04 00:00:00', 10192);
INSERT INTO public.opera VALUES ('M012', '2024-07-05 00:00:00', 10192);
INSERT INTO public.opera VALUES ('M012', '2024-07-06 00:00:00', 10192);
INSERT INTO public.opera VALUES ('M012', '2024-07-04 00:00:00', 10058);
INSERT INTO public.opera VALUES ('M012', '2024-07-05 00:00:00', 10058);
INSERT INTO public.opera VALUES ('V776', '2024-07-08 00:00:00', 10122);
INSERT INTO public.opera VALUES ('V776', '2024-07-04 00:00:00', 10122);
INSERT INTO public.opera VALUES ('V776', '2024-07-05 00:00:00', 10122);
INSERT INTO public.opera VALUES ('V776', '2024-07-06 00:00:00', 10122);
INSERT INTO public.opera VALUES ('V776', '2024-07-09 00:00:00', 10086);
INSERT INTO public.opera VALUES ('V776', '2024-07-07 00:00:00', 10043);
INSERT INTO public.opera VALUES ('M456', '2024-07-08 00:00:00', 10126);
INSERT INTO public.opera VALUES ('V776', '2024-07-04 00:00:00', 10152);
INSERT INTO public.opera VALUES ('V776', '2024-07-05 00:00:00', 10152);
INSERT INTO public.opera VALUES ('V776', '2024-07-06 00:00:00', 10152);
INSERT INTO public.opera VALUES ('V776', '2024-07-12 00:00:00', 10042);
INSERT INTO public.opera VALUES ('N123', '2024-07-14 00:00:00', 10053);
INSERT INTO public.opera VALUES ('F876', '2024-07-11 00:00:00', 10130);
INSERT INTO public.opera VALUES ('F876', '2024-07-06 00:00:00', 10100);
INSERT INTO public.opera VALUES ('M012', '2024-07-05 00:00:00', 10177);
INSERT INTO public.opera VALUES ('M012', '2024-07-06 00:00:00', 10177);
INSERT INTO public.opera VALUES ('A567', '2024-07-05 00:00:00', 10143);
INSERT INTO public.opera VALUES ('A567', '2024-07-06 00:00:00', 10143);
INSERT INTO public.opera VALUES ('A567', '2024-07-07 00:00:00', 10143);
INSERT INTO public.opera VALUES ('A567', '2024-07-07 00:00:00', 10065);
INSERT INTO public.opera VALUES ('A567', '2024-07-08 00:00:00', 10065);
INSERT INTO public.opera VALUES ('V776', '2024-07-07 00:00:00', 10080);
INSERT INTO public.opera VALUES ('V776', '2024-07-08 00:00:00', 10080);
INSERT INTO public.opera VALUES ('F876', '2024-07-09 00:00:00', 10150);


--
-- TOC entry 3746 (class 0 OID 16709)
-- Dependencies: 224
-- Data for Name: ordine; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ordine VALUES (1, '2024-01-02 08:15:22', 1, 35);
INSERT INTO public.ordine VALUES (2, '2024-01-05 11:30:45', 2, 36);
INSERT INTO public.ordine VALUES (3, '2024-01-09 14:22:18', 3, 37);
INSERT INTO public.ordine VALUES (4, '2024-01-12 16:45:33', 4, 38);
INSERT INTO public.ordine VALUES (5, '2024-01-16 09:18:27', 5, 39);
INSERT INTO public.ordine VALUES (6, '2024-01-19 13:27:54', 19, 40);
INSERT INTO public.ordine VALUES (7, '2024-01-23 10:35:41', 7, 41);
INSERT INTO public.ordine VALUES (8, '2024-01-26 15:12:39', 8, 42);
INSERT INTO public.ordine VALUES (9, '2024-01-30 17:45:22', 9, 43);
INSERT INTO public.ordine VALUES (10, '2024-02-03 08:22:17', 10, 44);
INSERT INTO public.ordine VALUES (11, '2024-02-06 12:18:45', 11, 45);
INSERT INTO public.ordine VALUES (12, '2024-02-10 14:37:29', 12, 46);
INSERT INTO public.ordine VALUES (13, '2024-02-13 09:45:12', 13, 47);
INSERT INTO public.ordine VALUES (14, '2024-02-17 11:22:38', 14, 48);
INSERT INTO public.ordine VALUES (15, '2024-02-20 16:15:47', 15, 49);
INSERT INTO public.ordine VALUES (16, '2024-02-24 10:33:56', 16, 50);
INSERT INTO public.ordine VALUES (17, '2024-02-27 13:45:21', 17, 51);
INSERT INTO public.ordine VALUES (18, '2024-03-01 08:18:34', 18, 45);
INSERT INTO public.ordine VALUES (19, '2024-03-05 14:27:45', 19, 53);
INSERT INTO public.ordine VALUES (20, '2024-03-08 17:12:39', 20, 54);
INSERT INTO public.ordine VALUES (21, '2024-03-12 09:45:27', 21, 55);
INSERT INTO public.ordine VALUES (22, '2024-03-15 11:33:18', 22, 56);
INSERT INTO public.ordine VALUES (23, '2024-03-19 15:22:47', 23, 57);
INSERT INTO public.ordine VALUES (24, '2024-03-22 08:45:33', 24, 58);
INSERT INTO public.ordine VALUES (25, '2024-03-26 12:18:29', 25, 59);
INSERT INTO public.ordine VALUES (26, '2024-03-29 14:37:45', 26, 60);
INSERT INTO public.ordine VALUES (27, '2024-04-02 10:22:16', 27, 61);
INSERT INTO public.ordine VALUES (28, '2024-04-05 16:45:39', 28, 62);
INSERT INTO public.ordine VALUES (29, '2024-04-09 09:12:27', 29, 63);
INSERT INTO public.ordine VALUES (30, '2024-04-12 13:27:48', 30, 64);
INSERT INTO public.ordine VALUES (31, '2024-04-16 08:45:22', 31, 22);
INSERT INTO public.ordine VALUES (32, '2024-04-19 11:33:17', 32, 66);
INSERT INTO public.ordine VALUES (33, '2024-04-23 14:18:45', 33, 67);
INSERT INTO public.ordine VALUES (34, '2024-04-26 17:45:33', 34, 68);
INSERT INTO public.ordine VALUES (35, '2024-04-30 10:22:19', 35, 69);
INSERT INTO public.ordine VALUES (36, '2024-05-03 12:37:46', 36, 70);
INSERT INTO public.ordine VALUES (37, '2024-05-07 15:12:28', 37, 1);
INSERT INTO public.ordine VALUES (38, '2024-05-10 08:45:17', 38, 2);
INSERT INTO public.ordine VALUES (39, '2024-05-14 11:22:39', 39, 3);
INSERT INTO public.ordine VALUES (40, '2024-05-17 14:37:52', 40, 4);
INSERT INTO public.ordine VALUES (41, '2024-05-21 17:12:45', 28, 5);
INSERT INTO public.ordine VALUES (42, '2024-05-24 09:45:33', 42, 6);
INSERT INTO public.ordine VALUES (43, '2024-05-28 13:22:18', 43, 7);
INSERT INTO public.ordine VALUES (44, '2024-05-31 16:37:29', 44, 8);
INSERT INTO public.ordine VALUES (45, '2024-06-04 10:18:47', 45, 9);
INSERT INTO public.ordine VALUES (46, '2024-06-07 12:45:22', 46, 10);
INSERT INTO public.ordine VALUES (47, '2024-06-11 15:22:39', 47, 11);
INSERT INTO public.ordine VALUES (48, '2024-06-14 08:37:18', 48, 12);
INSERT INTO public.ordine VALUES (49, '2024-06-18 11:45:27', 49, 13);
INSERT INTO public.ordine VALUES (50, '2024-06-21 14:12:45', 50, 14);


--
-- TOC entry 3747 (class 0 OID 16712)
-- Dependencies: 225
-- Data for Name: pacco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pacco VALUES (10123, '2024-07-07 10:30:00', 'Gioielli', 490, '9x9x6', 'Consegnato', 23, 4);
INSERT INTO public.pacco VALUES (10031, '2024-07-01 08:45:00', 'Elettronica', 1500, '30x20x10', 'In magazzino', 3, 2);
INSERT INTO public.pacco VALUES (10033, '2024-07-01 10:30:00', NULL, 1200, '40x30x20', 'Consegnato', 17, 2);
INSERT INTO public.pacco VALUES (10054, '2024-07-12 14:40:00', NULL, 1300, '25x20x10', 'In magazzino', 9, 2);
INSERT INTO public.pacco VALUES (10073, '2024-07-02 10:00:00', NULL, 2200, '40x30x20', 'Consegnato', 23, 4);
INSERT INTO public.pacco VALUES (10077, '2024-07-04 08:45:00', 'Elettronica', 1400, '28x18x12', 'Consegnato', 7, 4);
INSERT INTO public.pacco VALUES (10082, '2024-07-06 14:15:00', 'Accessori', 700, '17x14x10', 'In magazzino', 31, 4);
INSERT INTO public.pacco VALUES (10085, '2024-07-08 10:20:00', 'Abbigliamento', 850, '28x18x12', 'In magazzino', 16, 4);
INSERT INTO public.pacco VALUES (10101, '2024-07-01 08:00:00', 'Elettronica', 1200, '28x20x15', 'In magazzino', 1, 6);
INSERT INTO public.pacco VALUES (10108, '2024-07-03 09:50:00', 'Abbigliamento', 800, '27x19x12', 'In magazzino', 8, 6);
INSERT INTO public.pacco VALUES (10110, '2024-07-03 12:20:00', 'Libri', 1000, '20x15x10', 'Consegnato', 10, 6);
INSERT INTO public.pacco VALUES (10111, '2024-07-04 08:00:00', 'Elettronica', 1300, '29x21x16', 'In magazzino', 11, 6);
INSERT INTO public.pacco VALUES (10125, '2024-07-07 13:00:00', 'Giocattoli', 3300, '51x37x29', 'In magazzino', 25, 6);
INSERT INTO public.pacco VALUES (10037, '2024-07-03 15:40:00', 'Accessori', 500, '10x10x5', 'In consegna', 44, 2);
INSERT INTO public.pacco VALUES (10071, '2024-07-01 08:30:00', 'Elettronica', 1500, '30x20x15', 'In magazzino', 5, 9);
INSERT INTO public.pacco VALUES (10097, '2024-07-04 08:35:00', 'Elettronica', 1400, '30x22x15', 'Consegnato', 5, 9);
INSERT INTO public.pacco VALUES (10059, '2024-07-02 11:45:00', NULL, 2500, '45x35x30', 'In attesa', 6, 1);
INSERT INTO public.pacco VALUES (10120, '2024-07-06 12:20:00', 'Libri', 1020, '21x16x10', 'In consegna', 20, 6);
INSERT INTO public.pacco VALUES (10081, '2024-07-06 13:00:00', 'Giocattoli', 2800, '48x38x28', 'In attesa', 2, 9);
INSERT INTO public.pacco VALUES (10056, '2024-07-01 08:00:00', 'Elettronica', 1400, '28x18x12', 'In magazzino', 2, 9);
INSERT INTO public.pacco VALUES (10103, '2024-07-01 10:30:00', NULL, 2500, '40x30x25', 'Consegnato', 3, 2);
INSERT INTO public.pacco VALUES (10091, '2024-07-01 08:00:00', 'Elettronica', 1200, '28x20x15', 'In magazzino', 3, 2);
INSERT INTO public.pacco VALUES (10104, '2024-07-02 11:45:00', 'Libri', 900, '22x15x10', 'In attesa', 4, 1);
INSERT INTO public.pacco VALUES (10088, '2024-07-09 14:45:00', 'Accessori', 650, '14x12x9', 'In attesa', 4, 1);
INSERT INTO public.pacco VALUES (10105, '2024-07-02 13:00:00', 'Giocattoli', 3200, '50x35x30', 'In magazzino', 5, 9);
INSERT INTO public.pacco VALUES (10045, '2024-07-07 11:55:00', 'Libri', 1100, '20x15x10', 'In consegna', 5, 9);
INSERT INTO public.pacco VALUES (10038, '2024-07-04 08:25:00', 'Abbigliamento', 900, '30x20x15', 'In magazzino', 7, 4);
INSERT INTO public.pacco VALUES (10069, '2024-07-07 11:00:00', NULL, 1300, '22x18x10', 'In consegna', 7, 4);
INSERT INTO public.pacco VALUES (10002, '2024-07-01 10:00:00', NULL, 200, '40x30x20', 'In magazzino', 7, 4);
INSERT INTO public.pacco VALUES (10107, '2024-07-03 08:35:00', 'Elettronica', 1400, '30x22x15', 'In consegna', 7, 4);
INSERT INTO public.pacco VALUES (10094, '2024-07-02 11:45:00', 'Libri', 900, '22x15x10', 'In attesa', 8, 6);
INSERT INTO public.pacco VALUES (10062, '2024-07-04 08:20:00', 'Elettronica', 1600, '30x25x15', 'In consegna', 8, 6);
INSERT INTO public.pacco VALUES (10044, '2024-07-07 10:40:00', NULL, 2800, '50x40x30', 'In attesa', 11, 6);
INSERT INTO public.pacco VALUES (10063, '2024-07-04 09:40:00', 'Libri', 1200, '25x18x10', 'In magazzino', 12, 2);
INSERT INTO public.pacco VALUES (10049, '2024-07-09 13:50:00', NULL, 2600, '40x30x20', 'Consegnato', 24, 1);
INSERT INTO public.pacco VALUES (10128, '2024-07-08 09:50:00', 'Abbigliamento', 790, '27x19x14', 'In magazzino', 28, 6);
INSERT INTO public.pacco VALUES (10039, '2024-07-04 10:05:00', 'Libri', 1200, '22x15x7', 'In consegna', 19, 8);
INSERT INTO public.pacco VALUES (10135, '2024-07-02 13:00:00', 'Giocattoli', 3000, '50x35x30', 'In magazzino', 35, 5);
INSERT INTO public.pacco VALUES (10134, '2024-07-02 11:45:00', 'Libri', 900, '22x15x10', 'In attesa', 34, 7);
INSERT INTO public.pacco VALUES (10137, '2024-07-03 08:35:00', 'Elettronica', 1400, '32x22x18', 'Consegnato', 37, 7);
INSERT INTO public.pacco VALUES (10154, '2024-07-02 10:30:00', 'Libri', 900, '22x15x10', 'In attesa', 33, 8);
INSERT INTO public.pacco VALUES (10168, '2024-07-06 10:05:00', 'Abbigliamento', 730, '27x20x12', 'In magazzino', 19, 8);
INSERT INTO public.pacco VALUES (10175, '2024-07-02 11:00:00', 'Giocattoli', 3100, '50x35x30', 'In magazzino', 5, 9);
INSERT INTO public.pacco VALUES (10178, '2024-07-03 11:15:00', 'Abbigliamento', 700, '26x19x11', 'In magazzino', 2, 9);
INSERT INTO public.pacco VALUES (10184, '2024-07-05 10:15:00', 'Libri', 880, '23x16x12', 'In attesa', 22, 9);
INSERT INTO public.pacco VALUES (10020, '2024-07-10 09:45:00', 'Libri', 2, '20x15x10', 'In consegna', 4, 1);
INSERT INTO public.pacco VALUES (10047, '2024-07-08 10:35:00', 'Accessori', 650, '15x10x5', 'In consegna', 12, 2);
INSERT INTO public.pacco VALUES (10102, '2024-07-01 09:15:00', 'Abbigliamento', 700, '25x18x12', 'In consegna', 2, 9);
INSERT INTO public.pacco VALUES (10158, '2024-07-03 10:10:00', 'Abbigliamento', 690, '26x19x12', 'In magazzino', 2, 9);
INSERT INTO public.pacco VALUES (10186, '2024-07-01 08:20:00', 'Elettronica', 1200, '28x20x15', 'In magazzino', 3, 2);
INSERT INTO public.pacco VALUES (10185, '2024-07-05 12:40:00', 'Giocattoli', 3050, '52x35x31', 'In magazzino', 4, 1);
INSERT INTO public.pacco VALUES (10165, '2024-07-05 14:00:00', 'Giocattoli', 3050, '51x34x31', 'In magazzino', 4, 1);
INSERT INTO public.pacco VALUES (10051, '2024-07-10 09:40:00', 'Libri', 900, '20x15x10', 'In consegna', 4, 1);
INSERT INTO public.pacco VALUES (10198, '2024-07-05 09:00:00', 'Gioielli', 500, '12x9x8', 'Consegnato', 5, 9);
INSERT INTO public.pacco VALUES (10000, '2024-07-01 08:15:00', 'Elettronica', 3, '30x20x10', 'In consegna', 5, 9);
INSERT INTO public.pacco VALUES (10169, '2024-07-06 11:30:00', NULL, 1820, '37x27x21', 'In consegna', 26, 8);
INSERT INTO public.pacco VALUES (10172, '2024-07-01 10:45:00', 'Abbigliamento', 680, '25x18x10', 'In consegna', 29, 9);
INSERT INTO public.pacco VALUES (10197, '2024-07-04 11:05:00', 'Abbigliamento', 670, '25x18x10', 'In consegna', 13, 10);
INSERT INTO public.pacco VALUES (10008, '2024-07-04 09:50:00', 'Libri', 3000, '22x15x7', 'In attesa', 18, 1);
INSERT INTO public.pacco VALUES (10012, '2024-07-06 15:45:00', 'Giocattoli', 350, '45x35x25', 'In magazzino', 21, 1);
INSERT INTO public.pacco VALUES (10147, '2024-07-06 08:35:00', 'Elettronica', 1350, '31x23x16', 'In consegna', 47, 7);
INSERT INTO public.pacco VALUES (10167, '2024-07-06 08:40:00', 'Elettronica', 1380, '30x23x17', 'In consegna', 48, 8);
INSERT INTO public.pacco VALUES (10180, '2024-07-04 08:10:00', 'Libri', 960, '21x15x11', 'In consegna', 14, 9);
INSERT INTO public.pacco VALUES (10195, '2024-07-04 08:15:00', 'Libri', 900, '22x16x11', 'In consegna', 30, 10);
INSERT INTO public.pacco VALUES (10018, '2024-07-09 13:20:00', NULL, 4000, '40x30x20', 'In consegna', 6, 1);
INSERT INTO public.pacco VALUES (10026, '2024-07-13 11:15:00', 'Giocattoli', 5500, '50x40x30', 'In consegna', 24, 1);
INSERT INTO public.pacco VALUES (10014, '2024-07-07 11:25:00', 'Libri', 400, '20x15x10', 'Consegnato', 2, 9);
INSERT INTO public.pacco VALUES (10155, '2024-07-02 12:00:00', 'Giocattoli', 2950, '50x35x29', 'In magazzino', 6, 1);
INSERT INTO public.pacco VALUES (10189, '2024-07-02 09:30:00', 'Libri', 850, '23x17x12', 'In attesa', 6, 1);
INSERT INTO public.pacco VALUES (10106, '2024-07-02 14:20:00', 'Accessori', 650, '15x12x10', 'In consegna', 6, 1);
INSERT INTO public.pacco VALUES (10170, '2024-07-06 12:55:00', 'Libri', 960, '20x16x12', 'Consegnato', 7, 4);
INSERT INTO public.pacco VALUES (10200, '2024-07-05 13:00:00', 'Giocattoli', 3100, '51x35x32', 'In magazzino', 7, 4);
INSERT INTO public.pacco VALUES (10173, '2024-07-01 12:20:00', NULL, 1950, '35x25x20', 'In consegna', 7, 4);
INSERT INTO public.pacco VALUES (10036, '2024-07-03 14:10:00', 'Elettronica', 1800, '25x20x10', 'In consegna', 8, 6);
INSERT INTO public.pacco VALUES (10010, '2024-07-05 13:00:00', 'Elettronica', 300, '30x15x10', 'In consegna', 8, 6);
INSERT INTO public.pacco VALUES (10153, '2024-07-01 11:05:00', NULL, 1850, '33x24x18', 'In consegna', 8, 6);
INSERT INTO public.pacco VALUES (10023, '2024-07-12 14:25:00', NULL, 200, '25x20x10', 'In magazzino', 9, 2);
INSERT INTO public.pacco VALUES (10193, '2024-07-03 11:00:00', 'Abbigliamento', 720, '27x19x11', 'In magazzino', 9, 2);
INSERT INTO public.pacco VALUES (10109, '2024-07-03 11:05:00', NULL, 1800, '35x25x20', 'In consegna', 9, 2);
INSERT INTO public.pacco VALUES (10083, '2024-07-07 08:10:00', 'Elettronica', 1600, '32x22x15', 'In consegna', 9, 2);
INSERT INTO public.pacco VALUES (10032, '2024-07-01 09:10:00', 'Abbigliamento', 800, '25x15x5', 'In consegna', 10, 6);
INSERT INTO public.pacco VALUES (10072, '2024-07-01 09:45:00', 'Abbigliamento', 800, '25x18x10', 'In consegna', 11, 6);
INSERT INTO public.pacco VALUES (10015, '2024-07-08 09:40:00', 'Elettronica', 3000, '35x25x15', 'In magazzino', 11, 6);
INSERT INTO public.pacco VALUES (10163, '2024-07-04 11:10:00', 'Gioielli', 470, '10x9x6', 'Consegnato', 11, 6);
INSERT INTO public.pacco VALUES (10183, '2024-07-05 08:45:00', 'Gioielli', 480, '11x9x7', 'Consegnato', 11, 6);
INSERT INTO public.pacco VALUES (10001, '2024-07-01 09:30:00', 'Abbigliamento', 100, '25x15x5', 'In consegna', 12, 2);
INSERT INTO public.pacco VALUES (10112, '2024-07-04 09:15:00', 'Abbigliamento', 750, '26x17x13', 'In consegna', 12, 2);
INSERT INTO public.pacco VALUES (10079, '2024-07-05 10:30:00', NULL, 1800, '35x25x15', 'In consegna', 12, 2);
INSERT INTO public.pacco VALUES (10171, '2024-07-01 09:10:00', 'Elettronica', 1300, '30x22x15', 'In magazzino', 12, 2);
INSERT INTO public.pacco VALUES (10025, '2024-07-13 10:05:00', 'Libri', 3000, '20x15x5', 'In attesa', 13, 10);
INSERT INTO public.pacco VALUES (10113, '2024-07-04 10:30:00', 'Gioielli', 500, '10x10x5', 'In consegna', 13, 10);
INSERT INTO public.pacco VALUES (10099, '2024-07-05 11:05:00', NULL, 1800, '35x25x20', 'In consegna', 13, 10);
INSERT INTO public.pacco VALUES (10160, '2024-07-03 13:00:00', 'Libri', 950, '21x15x11', 'In consegna', 14, 9);
INSERT INTO public.pacco VALUES (10114, '2024-07-05 11:45:00', 'Libri', 950, '23x16x11', 'In attesa', 14, 9);
INSERT INTO public.pacco VALUES (10028, '2024-07-14 10:45:00', 'Elettronica', 2, '25x15x10', 'In consegna', 14, 9);
INSERT INTO public.pacco VALUES (10057, '2024-07-01 09:30:00', 'Libri', 1100, '22x16x8', 'In consegna', 14, 9);
INSERT INTO public.pacco VALUES (10092, '2024-07-01 09:15:00', 'Abbigliamento', 700, '25x18x12', 'In consegna', 14, 9);
INSERT INTO public.pacco VALUES (10187, '2024-07-01 10:50:00', 'Abbigliamento', 700, '26x18x10', 'In consegna', 14, 9);
INSERT INTO public.pacco VALUES (10115, '2024-07-05 13:00:00', 'Giocattoli', 3100, '52x36x31', 'In magazzino', 15, 7);
INSERT INTO public.pacco VALUES (10041, '2024-07-05 13:45:00', 'Elettronica', 1600, '30x15x10', 'Consegnato', 15, 7);
INSERT INTO public.pacco VALUES (10151, '2024-07-01 08:15:00', 'Elettronica', 1200, '28x19x14', 'In magazzino', 15, 7);
INSERT INTO public.pacco VALUES (10005, '2024-07-03 14:20:00', 'Elettronica', 300, '25x20x10', 'Consegnato', 15, 7);
INSERT INTO public.pacco VALUES (10116, '2024-07-05 14:20:00', 'Accessori', 670, '16x13x9', 'In consegna', 16, 4);
INSERT INTO public.pacco VALUES (10022, '2024-07-11 12:15:00', 'Accessori', 1000, '15x10x5', 'Consegnato', 16, 4);
INSERT INTO public.pacco VALUES (10117, '2024-07-06 08:35:00', 'Elettronica', 1350, '31x23x17', 'Consegnato', 17, 2);
INSERT INTO public.pacco VALUES (10196, '2024-07-04 09:40:00', 'Elettronica', 1250, '29x21x15', 'In magazzino', 17, 2);
INSERT INTO public.pacco VALUES (10011, '2024-07-06 14:30:00', 'Abbigliamento', 1, '25x15x5', 'In consegna', 17, 2);
INSERT INTO public.pacco VALUES (10074, '2024-07-02 11:30:00', 'Libri', 1100, '22x15x10', 'In attesa', 18, 1);
INSERT INTO public.pacco VALUES (10118, '2024-07-06 09:50:00', 'Abbigliamento', 820, '28x20x13', 'In magazzino', 18, 1);
INSERT INTO public.pacco VALUES (10119, '2024-07-06 11:05:00', NULL, 1750, '34x24x21', 'In consegna', 19, 8);
INSERT INTO public.pacco VALUES (10066, '2024-07-06 14:45:00', 'Giocattoli', 2800, '48x38x28', 'In attesa', 19, 8);
INSERT INTO public.pacco VALUES (10089, '2024-07-10 08:05:00', 'Elettronica', 1550, '30x20x15', 'In magazzino', 20, 6);
INSERT INTO public.pacco VALUES (10003, '2024-07-02 11:45:00', 'Libri', 4, '20x15x5', 'In consegna', 20, 6);
INSERT INTO public.pacco VALUES (10176, '2024-07-02 13:25:00', 'Accessori', 720, '18x14x9', 'In consegna', 21, 1);
INSERT INTO public.pacco VALUES (10156, '2024-07-02 14:25:00', 'Accessori', 720, '16x13x10', 'In consegna', 21, 1);
INSERT INTO public.pacco VALUES (10050, '2024-07-10 08:20:00', 'Giocattoli', 3100, '45x35x25', 'In magazzino', 21, 1);
INSERT INTO public.pacco VALUES (10192, '2024-07-03 08:45:00', 'Elettronica', 1350, '30x22x16', 'Consegnato', 21, 1);
INSERT INTO public.pacco VALUES (10121, '2024-07-07 08:00:00', 'Elettronica', 1250, '28x20x14', 'In magazzino', 21, 1);
INSERT INTO public.pacco VALUES (10058, '2024-07-02 10:15:00', 'Abbigliamento', 900, '30x20x10', 'Consegnato', 21, 1);
INSERT INTO public.pacco VALUES (10122, '2024-07-07 09:15:00', 'Abbigliamento', 680, '26x18x12', 'In consegna', 22, 9);
INSERT INTO public.pacco VALUES (10086, '2024-07-08 11:55:00', 'Libri', 1200, '22x16x10', 'In consegna', 22, 9);
INSERT INTO public.pacco VALUES (10019, '2024-07-10 08:35:00', 'Giocattoli', 300, '45x35x25', 'In magazzino', 22, 9);
INSERT INTO public.pacco VALUES (10043, '2024-07-06 15:30:00', 'Giocattoli', 3200, '45x35x25', 'In consegna', 22, 9);
INSERT INTO public.pacco VALUES (10098, '2024-07-04 09:50:00', 'Abbigliamento', 800, '27x19x12', 'In magazzino', 22, 9);
INSERT INTO public.pacco VALUES (10164, '2024-07-05 12:30:00', 'Libri', 870, '23x15x11', 'In attesa', 22, 9);
INSERT INTO public.pacco VALUES (10004, '2024-07-02 12:00:00', 'Giocattoli', 500, '50x40x30', 'In attesa', 23, 4);
INSERT INTO public.pacco VALUES (10124, '2024-07-07 11:45:00', 'Libri', 920, '22x15x12', 'In attesa', 24, 1);
INSERT INTO public.pacco VALUES (10199, '2024-07-05 10:30:00', 'Libri', 860, '24x17x12', 'In attesa', 24, 1);
INSERT INTO public.pacco VALUES (10067, '2024-07-06 16:10:00', 'Accessori', 500, '12x10x7', 'In magazzino', 25, 6);
INSERT INTO public.pacco VALUES (10034, '2024-07-02 11:20:00', 'Libri', 1000, '20x15x5', 'In attesa', 25, 6);
INSERT INTO public.pacco VALUES (10126, '2024-07-07 14:20:00', 'Accessori', 690, '17x14x10', 'In consegna', 26, 8);
INSERT INTO public.pacco VALUES (10152, '2024-07-01 09:40:00', 'Abbigliamento', 700, '24x17x11', 'In consegna', 27, 9);
INSERT INTO public.pacco VALUES (10188, '2024-07-01 13:15:00', NULL, 2000, '38x26x22', 'In consegna', 27, 9);
INSERT INTO public.pacco VALUES (10042, '2024-07-06 14:00:00', 'Abbigliamento', 750, '25x15x5', 'In magazzino', 27, 9);
INSERT INTO public.pacco VALUES (10127, '2024-07-08 08:35:00', 'Elettronica', 1380, '30x22x16', 'In consegna', 27, 9);
INSERT INTO public.pacco VALUES (10093, '2024-07-02 10:30:00', NULL, 2500, '40x30x25', 'In consegna', 27, 9);
INSERT INTO public.pacco VALUES (10016, '2024-07-08 10:55:00', 'Accessori', 2, '15x10x5', 'In consegna', 27, 9);
INSERT INTO public.pacco VALUES (10078, '2024-07-04 09:50:00', 'Abbigliamento', 900, '26x20x12', 'In magazzino', 27, 9);
INSERT INTO public.pacco VALUES (10006, '2024-07-03 15:30:00', 'Accessori', 100, '10x10x5', 'In magazzino', 28, 6);
INSERT INTO public.pacco VALUES (10053, '2024-07-11 12:30:00', 'Accessori', 550, '15x10x5', 'Consegnato', 28, 6);
INSERT INTO public.pacco VALUES (10129, '2024-07-08 11:05:00', NULL, 1850, '36x26x22', 'In consegna', 29, 9);
INSERT INTO public.pacco VALUES (10046, '2024-07-08 09:15:00', 'Elettronica', 1700, '35x25x15', 'In magazzino', 29, 9);
INSERT INTO public.pacco VALUES (10024, '2024-07-12 15:40:00', 'Abbigliamento', 4, '35x25x15', 'In consegna', 29, 9);
INSERT INTO public.pacco VALUES (10064, '2024-07-05 11:00:00', NULL, 1800, '35x25x15', 'In consegna', 29, 9);
INSERT INTO public.pacco VALUES (10166, '2024-07-05 15:25:00', 'Accessori', 680, '17x14x9', 'In consegna', 30, 10);
INSERT INTO public.pacco VALUES (10130, '2024-07-08 12:20:00', 'Libri', 1010, '20x15x11', 'Consegnato', 30, 10);
INSERT INTO public.pacco VALUES (10100, '2024-07-05 12:20:00', 'Libri', 1000, '20x15x10', 'In consegna', 30, 10);
INSERT INTO public.pacco VALUES (10013, '2024-07-07 10:15:00', NULL, 500, '50x40x30', 'In attesa', 30, 10);
INSERT INTO public.pacco VALUES (10131, '2024-07-01 08:00:00', 'Elettronica', 1250, '30x20x15', 'In magazzino', 31, 4);
INSERT INTO public.pacco VALUES (10052, '2024-07-11 11:10:00', 'Elettronica', 1500, '30x20x10', 'In attesa', 32, 5);
INSERT INTO public.pacco VALUES (10029, '2024-07-15 12:00:00', 'Accessori', 1000, '10x10x5', 'In attesa', 32, 5);
INSERT INTO public.pacco VALUES (10132, '2024-07-01 09:15:00', 'Abbigliamento', 650, '25x18x12', 'In consegna', 32, 5);
INSERT INTO public.pacco VALUES (10133, '2024-07-01 10:30:00', NULL, 2100, '40x30x22', 'In consegna', 33, 8);
INSERT INTO public.pacco VALUES (10007, '2024-07-04 08:10:00', 'Abbigliamento', 2, '30x20x15', 'In consegna', 33, 8);
INSERT INTO public.pacco VALUES (10068, '2024-07-07 09:25:00', 'Elettronica', 1500, '30x20x15', 'In consegna', 33, 8);
INSERT INTO public.pacco VALUES (10035, '2024-07-02 12:50:00', 'Giocattoli', 3000, '50x40x30', 'In magazzino', 33, 8);
INSERT INTO public.pacco VALUES (10174, '2024-07-02 08:30:00', 'Libri', 920, '22x16x12', 'In attesa', 33, 8);
INSERT INTO public.pacco VALUES (10075, '2024-07-03 12:15:00', 'Giocattoli', 3000, '50x35x25', 'In magazzino', 35, 5);
INSERT INTO public.pacco VALUES (10190, '2024-07-02 11:40:00', 'Giocattoli', 3200, '50x36x30', 'In magazzino', 35, 5);
INSERT INTO public.pacco VALUES (10021, '2024-07-11 11:00:00', 'Elettronica', 300, '30x20x10', 'In attesa', 35, 5);
INSERT INTO public.pacco VALUES (10027, '2024-07-14 09:30:00', NULL, 300, '30x20x15', 'In magazzino', 36, 6);
INSERT INTO public.pacco VALUES (10136, '2024-07-02 14:20:00', 'Accessori', 700, '16x13x10', 'In consegna', 36, 6);
INSERT INTO public.pacco VALUES (10182, '2024-07-04 11:00:00', 'Abbigliamento', 690, '24x18x11', 'In consegna', 37, 7);
INSERT INTO public.pacco VALUES (10162, '2024-07-04 09:45:00', 'Abbigliamento', 710, '25x18x12', 'In consegna', 37, 7);
INSERT INTO public.pacco VALUES (10055, '2024-07-12 15:55:00', 'Abbigliamento', 1000, '35x25x15', 'In consegna', 37, 7);
INSERT INTO public.pacco VALUES (10060, '2024-07-03 14:00:00', 'Giocattoli', 3000, '50x40x25', 'In magazzino', 37, 7);
INSERT INTO public.pacco VALUES (10048, '2024-07-09 12:05:00', 'Abbigliamento', 850, '30x20x10', 'In attesa', 38, 8);
INSERT INTO public.pacco VALUES (10087, '2024-07-09 13:30:00', 'Giocattoli', 2900, '49x37x30', 'Consegnato', 38, 8);
INSERT INTO public.pacco VALUES (10138, '2024-07-03 09:50:00', 'Abbigliamento', 750, '27x20x13', 'In magazzino', 38, 8);
INSERT INTO public.pacco VALUES (10179, '2024-07-03 12:40:00', NULL, 1800, '36x26x21', 'In consegna', 39, 9);
INSERT INTO public.pacco VALUES (10017, '2024-07-09 12:10:00', 'Abbigliamento', 100, '30x20x10', 'In attesa', 39, 9);
INSERT INTO public.pacco VALUES (10159, '2024-07-03 11:35:00', NULL, 1720, '35x26x20', 'In consegna', 39, 9);
INSERT INTO public.pacco VALUES (10095, '2024-07-03 13:00:00', 'Giocattoli', 3200, '50x35x30', 'In magazzino', 39, 9);
INSERT INTO public.pacco VALUES (10139, '2024-07-03 11:05:00', NULL, 1700, '35x25x20', 'In consegna', 39, 9);
INSERT INTO public.pacco VALUES (10076, '2024-07-03 14:00:00', 'Accessori', 600, '15x12x8', 'In consegna', 40, 10);
INSERT INTO public.pacco VALUES (10009, '2024-07-05 11:00:00', NULL, 4000, '40x25x20', 'In magazzino', 40, 10);
INSERT INTO public.pacco VALUES (10140, '2024-07-03 12:20:00', 'Libri', 950, '21x16x11', 'In consegna', 40, 10);
INSERT INTO public.pacco VALUES (10191, '2024-07-02 14:05:00', 'Accessori', 680, '18x13x9', 'In consegna', 41, 1);
INSERT INTO public.pacco VALUES (10177, '2024-07-03 09:50:00', 'Elettronica', 1450, '32x24x17', 'Consegnato', 41, 1);
INSERT INTO public.pacco VALUES (10141, '2024-07-04 08:00:00', 'Elettronica', 1300, '29x21x17', 'In magazzino', 41, 1);
INSERT INTO public.pacco VALUES (10096, '2024-07-03 14:20:00', 'Accessori', 650, '15x12x10', 'In consegna', 41, 1);
INSERT INTO public.pacco VALUES (10040, '2024-07-05 11:30:00', NULL, 2500, '40x25x20', 'In attesa', 41, 1);
INSERT INTO public.pacco VALUES (10157, '2024-07-03 08:45:00', 'Elettronica', 1400, '32x22x17', 'Consegnato', 41, 1);
INSERT INTO public.pacco VALUES (10142, '2024-07-04 09:15:00', 'Abbigliamento', 670, '26x18x12', 'In consegna', 42, 2);
INSERT INTO public.pacco VALUES (10143, '2024-07-04 10:30:00', 'Gioielli', 450, '10x10x6', 'Consegnato', 43, 2);
INSERT INTO public.pacco VALUES (10065, '2024-07-05 12:30:00', 'Abbigliamento', 800, '28x20x12', 'Consegnato', 44, 2);
INSERT INTO public.pacco VALUES (10084, '2024-07-07 09:40:00', NULL, 1300, '25x18x10', 'In consegna', 44, 2);
INSERT INTO public.pacco VALUES (10144, '2024-07-05 11:45:00', 'Libri', 880, '23x15x12', 'In attesa', 44, 2);
INSERT INTO public.pacco VALUES (10161, '2024-07-04 08:20:00', 'Elettronica', 1250, '29x21x16', 'In magazzino', 45, 5);
INSERT INTO public.pacco VALUES (10145, '2024-07-05 13:00:00', 'Giocattoli', 3100, '52x36x32', 'In magazzino', 45, 5);
INSERT INTO public.pacco VALUES (10181, '2024-07-04 09:35:00', 'Elettronica', 1250, '28x22x16', 'In magazzino', 45, 5);
INSERT INTO public.pacco VALUES (10146, '2024-07-05 14:20:00', 'Accessori', 680, '17x14x10', 'In consegna', 46, 6);
INSERT INTO public.pacco VALUES (10194, '2024-07-03 12:30:00', NULL, 1900, '37x25x21', 'In consegna', 46, 6);
INSERT INTO public.pacco VALUES (10148, '2024-07-06 09:50:00', 'Abbigliamento', 790, '28x20x13', 'In magazzino', 48, 8);
INSERT INTO public.pacco VALUES (10061, '2024-07-03 15:30:00', 'Accessori', 600, '15x10x8', 'In consegna', 48, 8);
INSERT INTO public.pacco VALUES (10149, '2024-07-06 11:05:00', NULL, 1800, '36x26x21', 'In consegna', 49, 9);
INSERT INTO public.pacco VALUES (10080, '2024-07-05 11:45:00', 'Libri', 1000, '20x15x10', 'Consegnato', 49, 9);
INSERT INTO public.pacco VALUES (10070, '2024-07-08 13:15:00', 'Libri', 1100, '20x15x8', 'In magazzino', 50, 10);
INSERT INTO public.pacco VALUES (10090, '2024-07-10 09:25:00', NULL, 1350, '24x18x11', 'In consegna', 50, 10);
INSERT INTO public.pacco VALUES (10150, '2024-07-06 12:20:00', 'Libri', 980, '20x15x12', 'Consegnato', 50, 10);


--
-- TOC entry 3748 (class 0 OID 16715)
-- Dependencies: 226
-- Data for Name: veicolo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.veicolo VALUES ('BC12345', 20, 'AM', '2023-06-15', 'Bici con rimorchio');
INSERT INTO public.veicolo VALUES ('BC23456', 10, 'AM', '2023-07-20', 'Bici con rimorchio');
INSERT INTO public.veicolo VALUES ('BC34567', 15, 'AM', '2023-08-10', 'Bici con rimorchio');
INSERT INTO public.veicolo VALUES ('FG12345', 100, 'B', '2023-05-01', 'Furgone');
INSERT INTO public.veicolo VALUES ('FG23456', 90, 'B', '2023-04-15', 'Furgone');
INSERT INTO public.veicolo VALUES ('FG34567', 80, 'B', '2023-03-20', 'Furgone');
INSERT INTO public.veicolo VALUES ('MT12345', 10, 'AM', '2023-09-05', 'Moto');
INSERT INTO public.veicolo VALUES ('MT23456', 20, 'AM', '2023-08-25', 'Moto');
INSERT INTO public.veicolo VALUES ('MT34567', 30, 'AM', '2023-07-30', 'Moto');
INSERT INTO public.veicolo VALUES ('MT45678', 5, 'AM', '2023-06-10', 'Moto');
INSERT INTO public.veicolo VALUES ('FG9976', 100, 'B', '2024-10-10', 'Furgone');
INSERT INTO public.veicolo VALUES ('FG3317', 90, 'B', '2023-06-05', 'Furgone');


--
-- TOC entry 3554 (class 2606 OID 16719)
-- Name: cliente Cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT "Cliente_pkey" PRIMARY KEY (codice_cliente);


--
-- TOC entry 3560 (class 2606 OID 16818)
-- Name: consegna Consegna_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consegna
    ADD CONSTRAINT "Consegna_pkey" PRIMARY KEY (codice_tracciamento, data);


--
-- TOC entry 3562 (class 2606 OID 16723)
-- Name: corriere Corriere_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.corriere
    ADD CONSTRAINT "Corriere_pkey" PRIMARY KEY (codice_corriere);


--
-- TOC entry 3564 (class 2606 OID 16725)
-- Name: dipendente Dipendente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dipendente
    ADD CONSTRAINT "Dipendente_pkey" PRIMARY KEY (codice_fiscale);


--
-- TOC entry 3570 (class 2606 OID 16867)
-- Name: guida Guida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guida
    ADD CONSTRAINT "Guida_pkey" PRIMARY KEY (data_utilizzo, codice_corriere, targa);


--
-- TOC entry 3573 (class 2606 OID 16729)
-- Name: magazzino Magazzino_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magazzino
    ADD CONSTRAINT "Magazzino_pkey" PRIMARY KEY (codice_magazzino);


--
-- TOC entry 3575 (class 2606 OID 16848)
-- Name: opera Opera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opera
    ADD CONSTRAINT "Opera_pkey" PRIMARY KEY (codice_corriere, data, codice_tracciamento);


--
-- TOC entry 3577 (class 2606 OID 16733)
-- Name: ordine Ordine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordine
    ADD CONSTRAINT "Ordine_pkey" PRIMARY KEY (numero_ordine);


--
-- TOC entry 3579 (class 2606 OID 16735)
-- Name: pacco Pacco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacco
    ADD CONSTRAINT "Pacco_pkey" PRIMARY KEY (codice_tracciamento);


--
-- TOC entry 3581 (class 2606 OID 16737)
-- Name: veicolo Veicolo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veicolo
    ADD CONSTRAINT "Veicolo_pkey" PRIMARY KEY (targa);


--
-- TOC entry 3556 (class 2606 OID 16801)
-- Name: cliente email_unica; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT email_unica UNIQUE (email) INCLUDE (email);


--
-- TOC entry 3566 (class 2606 OID 16865)
-- Name: dipendente email_unico; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dipendente
    ADD CONSTRAINT email_unico UNIQUE (email) INCLUDE (email);


--
-- TOC entry 3558 (class 2606 OID 16805)
-- Name: cliente numeri_unici; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT numeri_unici UNIQUE (telefono) INCLUDE (telefono);


--
-- TOC entry 3568 (class 2606 OID 16863)
-- Name: dipendente telefono_unico; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dipendente
    ADD CONSTRAINT telefono_unico UNIQUE (telefono) INCLUDE (telefono);


--
-- TOC entry 3571 (class 1259 OID 16877)
-- Name: indice_ordinamento_data_corriere; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX indice_ordinamento_data_corriere ON public.guida USING btree (data_utilizzo, codice_corriere);


--
-- TOC entry 3583 (class 2606 OID 16738)
-- Name: dipendente CF_responsabile; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dipendente
    ADD CONSTRAINT "CF_responsabile" FOREIGN KEY (responsabile) REFERENCES public.dipendente(codice_fiscale) NOT VALID;


--
-- TOC entry 3582 (class 2606 OID 16743)
-- Name: consegna CodiceTracciamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consegna
    ADD CONSTRAINT "CodiceTracciamento" FOREIGN KEY (codice_tracciamento) REFERENCES public.pacco(codice_tracciamento) NOT VALID;


--
-- TOC entry 3592 (class 2606 OID 16748)
-- Name: pacco Codice_magazzino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacco
    ADD CONSTRAINT "Codice_magazzino" FOREIGN KEY (codice_magazzino) REFERENCES public.magazzino(codice_magazzino) NOT VALID;


--
-- TOC entry 3584 (class 2606 OID 16753)
-- Name: dipendente Codice_magazzino; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dipendente
    ADD CONSTRAINT "Codice_magazzino" FOREIGN KEY (codice_magazzino) REFERENCES public.magazzino(codice_magazzino) NOT VALID;


--
-- TOC entry 3593 (class 2606 OID 16758)
-- Name: pacco Codice_ordine; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacco
    ADD CONSTRAINT "Codice_ordine" FOREIGN KEY (numero_ordine) REFERENCES public.ordine(numero_ordine) NOT VALID;


--
-- TOC entry 3590 (class 2606 OID 16763)
-- Name: ordine Destinatario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordine
    ADD CONSTRAINT "Destinatario" FOREIGN KEY (destinatario) REFERENCES public.cliente(codice_cliente);


--
-- TOC entry 3585 (class 2606 OID 16768)
-- Name: dipendente ID_corriere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dipendente
    ADD CONSTRAINT "ID_corriere" FOREIGN KEY (codice_corriere) REFERENCES public.corriere(codice_corriere) NOT VALID;


--
-- TOC entry 3586 (class 2606 OID 16773)
-- Name: guida ID_corriere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guida
    ADD CONSTRAINT "ID_corriere" FOREIGN KEY (codice_corriere) REFERENCES public.corriere(codice_corriere) NOT VALID;


--
-- TOC entry 3588 (class 2606 OID 16778)
-- Name: opera ID_corriere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opera
    ADD CONSTRAINT "ID_corriere" FOREIGN KEY (codice_corriere) REFERENCES public.corriere(codice_corriere) NOT VALID;


--
-- TOC entry 3589 (class 2606 OID 16849)
-- Name: opera Info_consegna; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opera
    ADD CONSTRAINT "Info_consegna" FOREIGN KEY (data, codice_tracciamento) REFERENCES public.consegna(data, codice_tracciamento) NOT VALID;


--
-- TOC entry 3591 (class 2606 OID 16788)
-- Name: ordine Mittente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordine
    ADD CONSTRAINT "Mittente" FOREIGN KEY (mittente) REFERENCES public.cliente(codice_cliente);


--
-- TOC entry 3587 (class 2606 OID 16793)
-- Name: guida TargaVeicolo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guida
    ADD CONSTRAINT "TargaVeicolo" FOREIGN KEY (targa) REFERENCES public.veicolo(targa) NOT VALID;


-- Completed on 2025-05-26 19:45:01 CEST

--
-- PostgreSQL database dump complete
--

