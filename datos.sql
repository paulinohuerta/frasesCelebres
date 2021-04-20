--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15 (Ubuntu 10.15-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.15 (Ubuntu 10.15-0ubuntu0.18.04.1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: paulino
--

CREATE TABLE public.authors (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    fnac date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.authors OWNER TO paulino;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: paulino
--

CREATE SEQUENCE public.authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO paulino;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulino
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: paulino
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    descri character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categories OWNER TO paulino;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: paulino
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO paulino;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulino
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: paulino
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO paulino;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: paulino
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO paulino;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulino
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: paulino
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO paulino;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: paulino
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO paulino;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulino
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: paulino
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO paulino;

--
-- Name: phrases; Type: TABLE; Schema: public; Owner: paulino
--

CREATE TABLE public.phrases (
    id bigint NOT NULL,
    text text NOT NULL,
    category_id integer NOT NULL,
    author_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.phrases OWNER TO paulino;

--
-- Name: phrases_id_seq; Type: SEQUENCE; Schema: public; Owner: paulino
--

CREATE SEQUENCE public.phrases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phrases_id_seq OWNER TO paulino;

--
-- Name: phrases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulino
--

ALTER SEQUENCE public.phrases_id_seq OWNED BY public.phrases.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: paulino
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO paulino;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: paulino
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO paulino;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: paulino
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: phrases id; Type: DEFAULT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.phrases ALTER COLUMN id SET DEFAULT nextval('public.phrases_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: paulino
--

COPY public.authors (id, name, fnac, created_at, updated_at) FROM stdin;
1	Albert Einstein	1920-06-20	2021-02-01 19:13:57	2021-02-01 19:13:57
2	Oscar Whilde	1854-10-16	2021-02-01 19:15:41	2021-02-01 19:15:41
3	Steve Jobs	1964-02-19	2021-02-04 19:06:35	2021-02-04 19:06:35
4	Ludwig van Beethoven	1770-12-16	2021-02-04 19:06:45	2021-02-04 19:06:45
5	Napoleón Bonaparte	1830-11-05	2021-02-04 19:06:58	2021-02-04 19:06:58
6	Rubén Darío	1930-09-12	2021-02-04 19:07:18	2021-02-04 19:07:18
7	Jacinto Benavente	1866-08-12	2021-02-04 19:07:36	2021-02-04 19:07:36
8	palotes	1987-05-08	2021-02-06 10:37:16	2021-02-06 10:37:16
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: paulino
--

COPY public.categories (id, descri, created_at, updated_at) FROM stdin;
1	muerte	2021-02-01 19:29:41	2021-02-01 19:29:41
2	entusiasmo	2021-02-01 19:30:23	2021-02-01 19:30:23
3	imaginación	2021-02-01 19:31:34	2021-02-01 19:31:34
4	destino	2021-02-01 19:32:50	2021-02-01 19:32:50
5	risas	2021-02-01 19:49:21	2021-02-01 19:49:21
6	perseverancia	2021-02-04 19:21:07	2021-02-04 19:21:07
7	perdonar	2021-02-04 19:21:22	2021-02-04 19:21:22
8	sufrimiento	2021-02-04 19:22:36	2021-02-04 19:22:36
9	bondad	2021-02-04 19:22:48	2021-02-04 19:22:48
10	ilusiones	2021-02-04 19:57:20	2021-02-04 19:57:20
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: paulino
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: paulino
--

COPY public.migrations (id, migration, batch) FROM stdin;
13	2014_10_12_000000_create_users_table	1
14	2014_10_12_100000_create_password_resets_table	1
15	2019_08_19_000000_create_failed_jobs_table	1
16	2021_02_01_171324_create_authors_table	1
17	2021_02_01_171410_create_categories_table	1
18	2021_02_01_171440_create_phrases_table	1
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: paulino
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: phrases; Type: TABLE DATA; Schema: public; Owner: paulino
--

COPY public.phrases (id, text, category_id, author_id, created_at, updated_at) FROM stdin;
1	Tendremos el destino que nos hayamos merecido	4	1	2021-02-01 19:37:10	2021-02-01 19:37:10
2	Somos arquitectos de nuestro propio destino	4	1	2021-02-01 19:39:13	2021-02-01 19:39:13
3	La imaginación es más importante que el conocimiento	3	1	2021-02-01 19:42:14	2021-02-01 19:42:14
4	La muerte es de la vida la inseparable hermana. La muerte es la victoria de la progenie humana	1	2	2021-02-01 19:44:41	2021-02-01 19:44:41
6	Estoy convencido de que la mitad de lo que separa a los emprendedores exitosos de los que no triunfan es la perseverancia	6	3	2021-02-04 19:29:17	2021-02-04 19:29:17
7	La muerte es la mejor invención de la vida	1	3	2021-02-04 19:29:24	2021-02-04 19:29:24
8	El tormento de las preocupaciones a menudo excede los peligros que han de ser evitados. Por tanto, a veces es mejor abandonarse al destino	4	5	2021-02-04 19:32:34	2021-02-04 19:32:34
9	Me apoderaré del destino agarrándolo por el cuello. No me dominará	4	4	2021-02-04 19:34:12	2021-02-04 19:34:12
10	Nada prende tan pronto de unas almas en otras como esta simpatía de la risa	5	7	2021-02-04 19:35:36	2021-02-04 19:35:36
11	Perdonar supone siempre un poco de olvido, un poco de desprecio y un mucho de comodidad	7	7	2021-02-04 19:36:44	2021-02-04 19:36:44
13	Ser el hombre más rico en el cementerio no me importa… Ir a la cama por la noche diciendo que hemos hecho algo maravilloso… Eso es lo que me importa	10	3	2021-02-04 20:01:03	2021-02-04 20:01:03
14	La marca esencial que distingue a un hombre digno de llamarse así, es la perseverancia en las situaciones adversas y dificiles	6	4	2021-02-04 20:10:30	2021-02-04 20:10:30
16	El único símbolo de superioridad que conozco es la bondad	9	4	2021-02-04 20:16:09	2021-02-04 20:16:09
17	La risa no es un mal comienzo para la amistad. Y está lejos de ser un mal final	5	2	2021-02-04 20:17:53	2021-02-04 20:17:53
18	Perdona siempre a tu enemigo. No hay nada que le enfurezca más	7	2	2021-02-05 21:06:19	2021-02-05 21:06:19
19	A veces hay que retroceder dos pasos para avanzar uno	6	5	2021-02-05 21:10:45	2021-02-05 21:10:45
20	La única forma de sentirte satisfecho es hacer un gran trabajo y eso sólo es posible amando lo que hacen. Si aún no lo han encontrado, sigan buscando, no se detengan	2	3	2021-02-05 21:14:18	2021-02-05 21:14:18
21	El mundo sufre mucho. No por causa de la violencia de las malas personas, sino por el silencio de las buenas personas	8	5	2021-02-05 21:16:22	2021-02-05 21:16:22
22	El sufrimiento es el medio por el cual existimos, porque es el único gracias al cual tenemos conciencia de existir	8	2	2021-02-05 21:19:05	2021-02-05 21:19:05
24	Generalmente, los hombres risueños son sanos de corazón. La risa es la sal de la vida; la risa de un niño es como la loca música de la infancia	5	6	2021-02-05 21:27:10	2021-02-05 21:27:10
25	La imaginación gobierna el mundo	3	5	2021-02-06 07:31:14	2021-02-06 07:31:14
26	La imaginación imita. Es el espíritu crítico el que crea	3	2	2021-02-06 07:34:52	2021-02-06 07:34:52
27	No dejes apagar el entusiasmo, virtud tan valiosa como necesaria; trabaja, aspira, tiende siempre hacia la altura	2	6	2021-02-06 07:37:04	2021-02-06 07:37:04
28	El que no posee el don de maravillarse ni de entusiasmarse más le valdría estar muerto, porque sus ojos están cerrados	2	1	2021-02-06 07:38:54	2021-02-06 07:38:54
29	Si haces tus propios milagros, forjarás tu destino	4	4	2021-02-06 07:41:36	2021-02-06 07:41:36
30	Para aquellos que estamos atados a la vejez, la muerte llega como una liberación	1	1	2021-02-06 07:46:48	2021-02-06 07:46:48
31	A perdonar sólo se aprende en la vida cuando a nuestra vez hemos necesitado que nos perdonen mucho	7	7	2021-02-06 07:50:13	2021-02-06 07:50:13
32	Nada prende tan pronto de unas almas en otras como esta simpatía de la risa	5	7	2021-02-06 07:58:14	2021-02-06 07:58:14
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: paulino
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulino
--

SELECT pg_catalog.setval('public.authors_id_seq', 8, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulino
--

SELECT pg_catalog.setval('public.categories_id_seq', 10, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulino
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulino
--

SELECT pg_catalog.setval('public.migrations_id_seq', 18, true);


--
-- Name: phrases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulino
--

SELECT pg_catalog.setval('public.phrases_id_seq', 32, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: paulino
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: phrases phrases_pkey; Type: CONSTRAINT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.phrases
    ADD CONSTRAINT phrases_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: paulino
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: phrases phrases_author_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.phrases
    ADD CONSTRAINT phrases_author_id_foreign FOREIGN KEY (author_id) REFERENCES public.authors(id) ON DELETE CASCADE;


--
-- Name: phrases phrases_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: paulino
--

ALTER TABLE ONLY public.phrases
    ADD CONSTRAINT phrases_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

