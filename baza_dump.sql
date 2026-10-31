--
-- PostgreSQL database dump
--

\restrict 3j561Fz9LoBEcnNr8ROuGEHgjtrHcJJUlAt0o8PQVdVxrFKmiX0fFC9Rr24SPwD

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-31 18:51:40

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
-- TOC entry 223 (class 1259 OID 16435)
-- Name: disciplina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplina (
    iddisciplina integer NOT NULL,
    nazivdisciplina character varying(255) NOT NULL
);


ALTER TABLE public.disciplina OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16396)
-- Name: drzava; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drzava (
    iddrzava integer NOT NULL,
    nazivdrzava character varying(255) NOT NULL
);


ALTER TABLE public.drzava OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16423)
-- Name: lokacija; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lokacija (
    idlokacija integer NOT NULL,
    nazivlokacija character varying(255) NOT NULL,
    iddrzava integer
);


ALTER TABLE public.lokacija OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: proizvodac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proizvodac (
    idproizvodac integer NOT NULL,
    nazivproizvodac character varying(255) NOT NULL
);


ALTER TABLE public.proizvodac OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16403)
-- Name: skijas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skijas (
    idskijas integer NOT NULL,
    imeskijas character varying(255) NOT NULL,
    prezimeskijas character varying(255) NOT NULL,
    iddrzava integer,
    idproizvodac integer
);


ALTER TABLE public.skijas OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16460)
-- Name: skijas_utrka; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skijas_utrka (
    idskijas integer NOT NULL,
    idutrka integer NOT NULL,
    vrijeme interval
);


ALTER TABLE public.skijas_utrka OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16442)
-- Name: utrka; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utrka (
    idutrka integer NOT NULL,
    datum date NOT NULL,
    spol character varying(1),
    idlokacija integer,
    iddisciplina integer,
    CONSTRAINT utrka_spol_check CHECK (((spol)::text = ANY ((ARRAY['M'::character varying, 'Ž'::character varying])::text[])))
);


ALTER TABLE public.utrka OWNER TO postgres;

--
-- TOC entry 5052 (class 0 OID 16435)
-- Dependencies: 223
-- Data for Name: disciplina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disciplina (iddisciplina, nazivdisciplina) FROM stdin;
1	Slalom
2	Veleslalom
3	Super G
4	Spust
\.


--
-- TOC entry 5049 (class 0 OID 16396)
-- Dependencies: 220
-- Data for Name: drzava; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drzava (iddrzava, nazivdrzava) FROM stdin;
1	Brazil
2	Švicarska
3	Sjedinjene Američke Države
4	Austrija
5	Njemačka
6	Italija
7	Norveška
8	Francuska
9	Ujedinjeno Kraljevstvo
10	Finska
11	Slovenija
12	Hrvatska
13	Belgija
14	Albanija
15	Švedska
16	Novi Zeland
17	Poljska
18	Slovačka
19	Kanada
20	Andora
\.


--
-- TOC entry 5051 (class 0 OID 16423)
-- Dependencies: 222
-- Data for Name: lokacija; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lokacija (idlokacija, nazivlokacija, iddrzava) FROM stdin;
1	Sölden	4
2	Levi	10
3	Gurgl	4
4	Killington	3
5	Cooper Mountain	3
6	Beaver Creek	3
7	Trembalant	19
8	Val d' Isere	8
9	Val Gardena	6
10	St. Moritz	2
11	Alta Badia	6
12	Courchevel	8
13	Madonna di Campiglio	6
14	Bormio	6
15	Dachstein West	4
16	Kranjska Gora	11
17	Flachau	4
18	Val di Fassa	6
19	Adelboden	2
20	Wengen	2
21	Cortina d' Ampezzo	6
22	Kronplatz	6
23	Kitzbühel	4
24	Jasna	18
25	Schladming	4
26	Chamonix	8
27	Garmisch-Partenkirchen	5
28	Lenzerheide	2
29	Saalbach	4
30	Kvitfjell	7
31	Soldeu	20
32	Are	15
33	Sun Valley	3
\.


--
-- TOC entry 5048 (class 0 OID 16389)
-- Dependencies: 219
-- Data for Name: proizvodac; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proizvodac (idproizvodac, nazivproizvodac) FROM stdin;
1	Atomic
2	Salomon
3	Rossignol
4	Dynastar
5	Head
6	Kästle
7	Fischer
8	Völkl
9	Stöckli
10	Nordica
11	Blizzard
12	Van Deer
13	Augment
\.


--
-- TOC entry 5050 (class 0 OID 16403)
-- Dependencies: 221
-- Data for Name: skijas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skijas (idskijas, imeskijas, prezimeskijas, iddrzava, idproizvodac) FROM stdin;
1	Lucas	Pinheiro Braathen	1	1
2	Loic	Meillard	2	3
3	Marco	Odermatt	2	9
4	River	Radamus	3	3
5	Raphael	Haaser	4	1
6	Fabian	Gratz	5	7
7	Alex	Vinatzer	6	1
8	Eirik Hystad	Solberg	7	12
9	Leo	Anguenot	8	3
10	Patrick	Feurstein	4	3
11	Stefan	Brennsteiner	4	7
12	Freddy	Carrick-Smith	9	4
13	Thibaut	Favrot	8	4
14	Rasmus	Bakkevig	7	1
15	Anton	Grammel	5	5
16	Eduard	Hallberg	10	7
17	Joshua	Sturm	4	1
18	Žan	Kranjec	11	10
19	Filip	Zubčić	12	10
20	Sam	Maes	13	8
21	Alexander	Schmid	5	5
22	Henrik	Kristoffersen	7	12
23	Thomas	Tumler	2	9
24	Alban	Elezi Cannaferina	8	3
25	Lenz	Haechler	2	9
26	Hans	Grahl-Madsen	7	12
27	Paula	Moltzan	3	12
28	Lara	Colturi	14	5
29	Emma	Aicher	5	5
30	Sara	Hector	15	5
31	Asja	Zenere	6	2
32	Camille	Rast	2	5
33	Mikaela	Shiffrin	3	1
34	Alice	Robinson	16	5
35	Franziska	Gritsch	4	1
36	Maryna	Gasienica-Daniel	17	1
37	Zrinka	Ljutić	12	1
38	Estelle	Alphand	15	5
39	AJ	Hurt	3	5
40	Elisabeth	Bocock	3	3
41	Hilma	Lovebloom	3	5
42	Nina	O'Brien	3	3
43	Mina Fuerst	Holtmann	7	1
44	Lara	Della Mea	6	7
45	Hanna	Aronsson Elfman	15	3
46	Wendy	Holdener	2	5
47	Thea Louise	Stjernesund	7	3
48	Lena	Duerr	5	5
49	Petra	Vlhova	18	3
50	Simone	Wild	2	7
51	Stefanie	Gross	2	3
52	Kira	Weidle-Winkelmann	5	3
53	Britt	Richardson	19	4
54	Vanesa	Kasper	2	5
55	Alice	Pazzaglia	6	3
56	Neja	Dvornik	11	3
57	Oscar Andreas	Sandvik	7	5
58	Giovanni	Franzoni	6	3
59	Giovanni	Borsoti	6	3
60	Atle Lie	Mcgrath	7	5
\.


--
-- TOC entry 5054 (class 0 OID 16460)
-- Dependencies: 225
-- Data for Name: skijas_utrka; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skijas_utrka (idskijas, idutrka, vrijeme) FROM stdin;
1	2	00:01:44.72
2	2	00:01:45.2
3	2	00:01:45.21
4	2	00:01:45.54
5	2	00:01:45.58
6	2	00:01:45.67
7	2	00:01:45.8
8	2	00:01:45.81
9	2	00:01:45.82
10	2	00:01:45.83
11	2	00:01:45.93
12	2	00:01:45.98
13	2	00:01:46.12
14	2	00:01:46.18
15	2	00:01:46.26
16	2	00:01:46.29
17	2	00:01:46.3
18	2	00:01:46.31
19	2	00:01:46.38
20	2	00:01:46.44
21	2	00:01:46.5
22	2	00:01:46.56
23	2	00:01:46.61
24	2	00:01:46.85
25	2	00:01:46.86
26	2	00:01:53.02
27	1	00:02:14.82
28	1	00:02:14.83
29	1	00:02:15.34
30	1	00:02:15.45
31	1	00:02:15.54
32	1	00:02:15.63
33	1	00:02:15.65
34	1	00:02:15.83
35	1	00:02:15.94
36	1	00:02:16.94
37	1	00:02:16.17
38	1	00:02:16.32
39	1	00:02:16.43
40	1	00:02:16.44
41	1	00:02:16.47
42	1	00:02:16.51
43	1	00:02:16.51
44	1	00:02:16.55
45	1	00:02:16.59
46	1	00:02:16.74
47	1	00:02:16.74
48	1	00:02:16.79
49	1	00:02:16.9
50	1	00:02:16.92
51	1	00:02:16.97
52	1	00:02:16.98
53	1	00:02:17.11
54	1	00:02:17.61
55	1	00:02:18.4
56	1	00:02:18.65
57	2	\N
58	2	\N
59	2	\N
60	2	\N
\.


--
-- TOC entry 5053 (class 0 OID 16442)
-- Dependencies: 224
-- Data for Name: utrka; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utrka (idutrka, datum, spol, idlokacija, iddisciplina) FROM stdin;
1	2026-10-24	Ž	1	2
2	2026-10-25	M	1	2
3	2026-11-14	Ž	2	1
4	2026-11-15	M	2	1
5	2026-11-21	Ž	3	1
6	2026-11-21	M	3	1
7	2026-11-28	Ž	4	2
8	2026-11-29	Ž	4	2
9	2026-11-28	M	5	3
10	2026-11-29	M	5	2
11	2026-12-03	M	6	4
12	2026-12-04	M	6	4
13	2026-12-05	M	6	3
14	2026-12-06	M	6	2
15	2026-12-05	Ž	7	2
16	2026-12-06	Ž	7	2
17	2026-12-11	Ž	6	4
18	2026-12-12	Ž	6	4
19	2026-12-13	Ž	6	3
20	2026-12-12	M	8	2
21	2026-12-13	M	8	1
22	2026-12-18	M	9	3
23	2026-12-19	M	9	4
24	2026-12-17	Ž	10	3
25	2026-12-18	Ž	10	3
26	2026-12-19	Ž	10	2
27	2026-12-20	M	11	2
28	2026-12-21	M	11	1
29	2026-12-22	Ž	12	1
30	2026-12-23	M	13	1
31	2026-12-28	M	14	4
32	2026-12-29	M	14	3
33	2026-12-28	Ž	15	2
34	2026-12-29	Ž	15	1
35	2026-01-02	M	16	2
36	2026-01-03	M	16	1
37	2026-01-04	Ž	17	2
38	2026-01-05	Ž	17	1
39	2026-01-09	Ž	18	4
40	2026-01-10	Ž	18	3
41	2026-01-09	M	19	2
42	2026-01-10	M	19	1
43	2026-01-15	M	20	3
44	2026-01-16	M	20	4
45	2026-01-17	M	20	1
46	2026-01-15	Ž	21	4
47	2026-01-16	Ž	21	4
48	2026-01-17	Ž	21	3
49	2026-01-19	M	22	2
50	2026-01-22	M	23	2
51	2026-01-23	M	23	2
52	2026-01-24	M	23	3
53	2026-01-23	Ž	24	4
54	2026-01-24	Ž	24	1
55	2026-01-26	M	25	2
56	2026-01-27	M	25	1
57	2026-01-29	Ž	16	2
58	2026-01-30	Ž	16	1
59	2026-01-30	M	26	1
60	2026-02-20	M	27	4
61	2026-02-21	M	27	3
62	2026-02-20	Ž	28	3
63	2026-02-21	Ž	28	3
64	2026-02-27	Ž	27	4
65	2026-02-28	Ž	27	4
66	2026-02-27	M	29	4
67	2026-02-28	M	29	3
68	2026-03-06	M	30	4
69	2026-03-07	M	30	3
70	2026-03-06	Ž	31	2
71	2026-03-07	Ž	31	1
72	2026-03-12	Ž	30	4
73	2026-03-13	Ž	30	3
74	2026-03-13	M	32	2
75	2026-03-14	M	32	1
76	2026-03-20	M	33	4
77	2026-03-20	Ž	33	4
78	2026-03-21	Ž	33	3
79	2026-03-21	M	33	3
80	2026-03-23	Ž	33	2
81	2026-03-24	M	33	2
82	2026-03-25	Ž	33	1
83	2026-03-25	M	33	1
\.


--
-- TOC entry 4889 (class 2606 OID 16441)
-- Name: disciplina disciplina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplina
    ADD CONSTRAINT disciplina_pkey PRIMARY KEY (iddisciplina);


--
-- TOC entry 4883 (class 2606 OID 16402)
-- Name: drzava drzava_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drzava
    ADD CONSTRAINT drzava_pkey PRIMARY KEY (iddrzava);


--
-- TOC entry 4887 (class 2606 OID 16429)
-- Name: lokacija lokacija_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lokacija
    ADD CONSTRAINT lokacija_pkey PRIMARY KEY (idlokacija);


--
-- TOC entry 4881 (class 2606 OID 16395)
-- Name: proizvodac proizvodac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proizvodac
    ADD CONSTRAINT proizvodac_pkey PRIMARY KEY (idproizvodac);


--
-- TOC entry 4885 (class 2606 OID 16412)
-- Name: skijas skijas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skijas
    ADD CONSTRAINT skijas_pkey PRIMARY KEY (idskijas);


--
-- TOC entry 4893 (class 2606 OID 16466)
-- Name: skijas_utrka skijas_utrka_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skijas_utrka
    ADD CONSTRAINT skijas_utrka_pkey PRIMARY KEY (idskijas, idutrka);


--
-- TOC entry 4891 (class 2606 OID 16449)
-- Name: utrka utrka_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utrka
    ADD CONSTRAINT utrka_pkey PRIMARY KEY (idutrka);


--
-- TOC entry 4896 (class 2606 OID 16430)
-- Name: lokacija fk_lokacija_drzava; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lokacija
    ADD CONSTRAINT fk_lokacija_drzava FOREIGN KEY (iddrzava) REFERENCES public.drzava(iddrzava);


--
-- TOC entry 4894 (class 2606 OID 16413)
-- Name: skijas fk_skijas_drzava; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skijas
    ADD CONSTRAINT fk_skijas_drzava FOREIGN KEY (iddrzava) REFERENCES public.drzava(iddrzava);


--
-- TOC entry 4895 (class 2606 OID 16418)
-- Name: skijas fk_skijas_proizvodac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skijas
    ADD CONSTRAINT fk_skijas_proizvodac FOREIGN KEY (idproizvodac) REFERENCES public.proizvodac(idproizvodac);


--
-- TOC entry 4899 (class 2606 OID 16467)
-- Name: skijas_utrka fk_su_skijas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skijas_utrka
    ADD CONSTRAINT fk_su_skijas FOREIGN KEY (idskijas) REFERENCES public.skijas(idskijas);


--
-- TOC entry 4900 (class 2606 OID 16472)
-- Name: skijas_utrka fk_su_utrka; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skijas_utrka
    ADD CONSTRAINT fk_su_utrka FOREIGN KEY (idutrka) REFERENCES public.utrka(idutrka);


--
-- TOC entry 4897 (class 2606 OID 16455)
-- Name: utrka fk_utrka_disciplina; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utrka
    ADD CONSTRAINT fk_utrka_disciplina FOREIGN KEY (iddisciplina) REFERENCES public.disciplina(iddisciplina);


--
-- TOC entry 4898 (class 2606 OID 16450)
-- Name: utrka fk_utrka_lokacija; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utrka
    ADD CONSTRAINT fk_utrka_lokacija FOREIGN KEY (idlokacija) REFERENCES public.lokacija(idlokacija);


-- Completed on 2026-10-31 18:51:41

--
-- PostgreSQL database dump complete
--

\unrestrict 3j561Fz9LoBEcnNr8ROuGEHgjtrHcJJUlAt0o8PQVdVxrFKmiX0fFC9Rr24SPwD

