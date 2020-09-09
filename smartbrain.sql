--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.4 (Ubuntu 12.4-0ubuntu0.20.04.1)

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
-- Name: login; Type: TABLE; Schema: public; Owner: spirids
--

CREATE TABLE public.login (
    id integer NOT NULL,
    hash character varying(100) NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.login OWNER TO spirids;

--
-- Name: login_id_seq; Type: SEQUENCE; Schema: public; Owner: spirids
--

CREATE SEQUENCE public.login_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_id_seq OWNER TO spirids;

--
-- Name: login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spirids
--

ALTER SEQUENCE public.login_id_seq OWNED BY public.login.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: spirids
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100),
    email text NOT NULL,
    entries bigint DEFAULT 0,
    joined timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO spirids;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: spirids
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO spirids;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spirids
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: login id; Type: DEFAULT; Schema: public; Owner: spirids
--

ALTER TABLE ONLY public.login ALTER COLUMN id SET DEFAULT nextval('public.login_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: spirids
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: login; Type: TABLE DATA; Schema: public; Owner: spirids
--

COPY public.login (id, hash, email) FROM stdin;
1	$2a$10$5g9CpfWOnLdaY8T00b/lrOM4/b/ibgPv4IlVK5Z.OOuHDH2YYzL8y	t@test.com
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: spirids
--

COPY public.users (id, name, email, entries, joined) FROM stdin;
1	test	t@test.com	10	2020-09-09 20:15:17.103
\.


--
-- Name: login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spirids
--

SELECT pg_catalog.setval('public.login_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spirids
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: login login_email_key; Type: CONSTRAINT; Schema: public; Owner: spirids
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_email_key UNIQUE (email);


--
-- Name: login login_pkey; Type: CONSTRAINT; Schema: public; Owner: spirids
--

ALTER TABLE ONLY public.login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: spirids
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: spirids
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

