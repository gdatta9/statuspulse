--
-- PostgreSQL database dump
--

\restrict LbfshuBdh2yLkhr1nRr58jMIptCiXDG0b3W43MuNMUb0cyNFcCMcAIVA79xf7jS

-- Dumped from database version 15.17
-- Dumped by pg_dump version 15.17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: incidents; Type: TABLE; Schema: public; Owner: statuspulse
--

CREATE TABLE public.incidents (
    id integer NOT NULL,
    service_name character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    description text,
    severity character varying(20) DEFAULT 'minor'::character varying,
    status character varying(20) DEFAULT 'investigating'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    resolved_at timestamp without time zone
);


ALTER TABLE public.incidents OWNER TO statuspulse;

--
-- Name: incidents_id_seq; Type: SEQUENCE; Schema: public; Owner: statuspulse
--

CREATE SEQUENCE public.incidents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incidents_id_seq OWNER TO statuspulse;

--
-- Name: incidents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: statuspulse
--

ALTER SEQUENCE public.incidents_id_seq OWNED BY public.incidents.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: statuspulse
--

CREATE TABLE public.services (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    url character varying(500) NOT NULL,
    status character varying(20) DEFAULT 'unknown'::character varying,
    last_checked timestamp without time zone,
    response_time_ms integer
);


ALTER TABLE public.services OWNER TO statuspulse;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: statuspulse
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO statuspulse;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: statuspulse
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: incidents id; Type: DEFAULT; Schema: public; Owner: statuspulse
--

ALTER TABLE ONLY public.incidents ALTER COLUMN id SET DEFAULT nextval('public.incidents_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: statuspulse
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Data for Name: incidents; Type: TABLE DATA; Schema: public; Owner: statuspulse
--

COPY public.incidents (id, service_name, title, description, severity, status, created_at, resolved_at) FROM stdin;
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: statuspulse
--

COPY public.services (id, name, url, status, last_checked, response_time_ms) FROM stdin;
\.


--
-- Name: incidents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: statuspulse
--

SELECT pg_catalog.setval('public.incidents_id_seq', 1, false);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: statuspulse
--

SELECT pg_catalog.setval('public.services_id_seq', 1, false);


--
-- Name: incidents incidents_pkey; Type: CONSTRAINT; Schema: public; Owner: statuspulse
--

ALTER TABLE ONLY public.incidents
    ADD CONSTRAINT incidents_pkey PRIMARY KEY (id);


--
-- Name: services services_name_key; Type: CONSTRAINT; Schema: public; Owner: statuspulse
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_name_key UNIQUE (name);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: statuspulse
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict LbfshuBdh2yLkhr1nRr58jMIptCiXDG0b3W43MuNMUb0cyNFcCMcAIVA79xf7jS

