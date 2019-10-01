--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Params; Type: TABLE; Schema: public; Owner: timhatch; Tablespace: 
--

CREATE TABLE "Params" (
    grp_id integer NOT NULL,
    discipline character varying(2),
    gender character varying(1),
    min_age integer,
    max_age integer,
    age_group text
);


ALTER TABLE "Params" OWNER TO timhatch;

--
-- Name: Session; Type: TABLE; Schema: public; Owner: timhatch; Tablespace: 
--

CREATE TABLE "Session" (
    wet_id integer,
    auth character varying(200) DEFAULT NULL::character varying
);


ALTER TABLE "Session" OWNER TO timhatch;

--
-- Name: climbers; Type: TABLE; Schema: public; Owner: timhatch; Tablespace: 
--

CREATE TABLE climbers (
    per_id integer NOT NULL,
    lastname text,
    firstname text,
    club text,
    nation text,
    birthyear integer,
    gender character varying(2)
);


ALTER TABLE climbers OWNER TO timhatch;

--
-- Name: competitions; Type: TABLE; Schema: public; Owner: timhatch; Tablespace: 
--

CREATE TABLE competitions (
    wet_id integer NOT NULL,
    city character varying(40),
    date character varying(12),
    title character varying(40),
    routes jsonb,
    cats integer[]
);


ALTER TABLE competitions OWNER TO timhatch;

--
-- Name: results; Type: TABLE; Schema: public; Owner: timhatch; Tablespace: 
--

CREATE TABLE results (
    wet_id integer NOT NULL,
    grp_id integer NOT NULL,
    per_id integer NOT NULL,
    route integer NOT NULL,
    start_order integer,
    bib_nr integer,
    rank_prev_heat integer,
    sort_values integer[],
    tie_breaks integer[],
    result_jsonb jsonb,
    locked boolean DEFAULT false,
    rank_this_heat integer
);


ALTER TABLE results OWNER TO timhatch;

--
-- Data for Name: Params; Type: TABLE DATA; Schema: public; Owner: timhatch
--

COPY "Params" (grp_id, discipline, gender, min_age, max_age, age_group) FROM stdin;
2	L	F	16	99	O15
5	B	F	16	99	O15
24	S	F	16	99	O15
42	C	F	16	99	O15
6	B	M	16	99	O15
1	L	M	16	99	O15
23	S	M	16	99	O15
45	C	M	16	99	O15
17	L	M	18	19	U20
58	S	M	18	19	U20
84	B	M	18	19	U20
16	L	M	14	15	U16
56	S	M	14	15	U16
83	B	M	14	15	U16
15	L	M	16	17	U18
57	S	M	16	17	U18
82	B	M	16	17	U18
18	L	F	18	19	U20
59	S	F	18	19	U20
20	L	F	14	15	U16
61	S	F	14	15	U16
80	B	F	14	15	U16
81	B	F	18	19	U16
19	L	F	16	17	U18
60	S	F	16	17	U18
79	B	F	16	17	U18
\.


--
-- Data for Name: Session; Type: TABLE DATA; Schema: public; Owner: timhatch
--

COPY "Session" (wet_id, auth) FROM stdin;
1	\N
\.


--
-- Data for Name: climbers; Type: TABLE DATA; Schema: public; Owner: timhatch
--

COPY climbers (per_id, lastname, firstname, club, nation, birthyear, gender) FROM stdin;
10949	Ometz	Samuel		SUI	1995	M
10958	Langenkamp	Noemi		SUI	1996	F
10306	Vogt	Dimitri		SUI	1997	M
7387	Krakenburger	Franz		SUI	1993	M
9945	Caulier	Chloé	Climbing and Mountaineering Belgium	BEL	1996	F
9472	Kadic	Katya	Alpine Association of Slovenia	SLO	1995	F
10936	Remškar	Ajda	Alpine Association of Slovenia	SLO	1995	F
1000269	Czechowicz	Krzysztof	\N	POL	1985	M
1000487	Gobry	Élise	Federation Française de la Montagne et de l'Escalade	FRA	\N	F
1000001	Skoczylas	Joachim	\N	POL	2004	M
61901	Danion	Juliette	TEST Federation	XYZ	\N	F
11814	Yokoyama	Sofya		SUI	1998	F
12586	Redmond	Jonathan		IRL	1990	M
5310	Gaidoz	Loic	Federation Française de la Montagne et de l'Escalade	FRA	1983	M
8879	Bärtschi	Natalie		SUI	1994	F
6486	Stranik	Martin		CZE	1990	M
1000195	Matinez	Unai	Federación Española de Deportes de Montaña y Escalada	ESP	1990	M
5641	Zijlstra	Vera	\N	NED	1988	F
6986	Lopez Mateos	Eric	Federación Española de Deportes de Montaña y Escalada	ESP	1991	M
1000347	Acereda Ortiz	Carla	Federación Española de Deportes de Montaña y Escalada	ESP	1990	F
5804	Topishko	Sergei	Ukrainian Mountaineering and Climbing Federation	UKR	1988	M
6064	Wurm	Juliane	DAV	GER	1990	F
6367	Klingler	Petra	\N	SUI	1992	F
10515	Späte	Jara	\N	SUI	1997	F
10328	Kümin	Andrea	\N	SUI	1997	F
10952	Ometz	Baptiste		SUI	1998	M
61909	Noguchi	Akiyo	TEST Federation	XYZ	\N	F
6326	Noguchi	Akiyo	JMA	JPN	1989	F
1000343	Barton	Alice	\N	TBD	1990	F
10338	Gejo	Stasa		SRB	1997	F
53520	Bur	Stephanie	\N	GER	\N	F
9989	Gibert	Fanny	Federation Française de la Montagne et de l'Escalade	FRA	1993	F
1000346	Siwiec	Anna	\N	TBD	1990	F
1000348	Bordman	Courtney 	\N	TBD	1990	F
1000349	Fraser	Julia	\N	TBD	1990	F
1000350	Ault	Pippa	\N	TBD	1990	F
1000351	Pryce	Sarah	\N	TBD	1990	F
1000353	Ward	Stephanie	\N	TBD	1990	F
9074	Le Neve	Melissa	Federation Française de la Montagne et de l'Escalade	FRA	1989	F
10915	Lehmann	Sascha		SUI	1998	M
6006	Blaser	Benjamin		SUI	1990	M
6370	Heiniger	Kevin		SUI	1993	M
61905	Nonaka	Miho	TEST Federation	XYZ	\N	F
1000352	Hallworth	Sophia	\N	TBD	1993	F
1000344	Hafer	Alice	\N	TBD	1990	F
8173	Cornu	Manu	TEST Federation	XYZ	1991	M
50700	Fischhuber	Kilian	TEST Federation	XYZ	1977	M
8156	Gelmanov	Rustam	TEST Federation	XYZ	1983	M
9022	Korenaga	Keiichiro	TEST Federation	XYZ	1974	M
8172	Lama	David	TEST Federation	XYZ	1990	M
8153	Pouvreau	Gerome	TEST Federation	XYZ	1980	M
11709	Klingler	Petra	TEST Federation	XYZ	1989	F
61104	Levet	Sandrine	TEST Federation	XYZ	1992	F
61108	Abramchuk	Yulia	TEST Federation	XYZ	1970	F
50698	Hojer	Jan	TEST Federation	XYZ	\N	M
50692	Meyer	Jerome	TEST Federation	XYZ	\N	M
50699	Wurm	Julianne	TEST Federation	XYZ	1990	F
9018	Rahkmetov	Salavat	TEST Federation	XYZ	1973	M
2000138	Low	Yang Kai	\N	SGP	1997	M
3885	Schwab	Tabea	\N	SUI	1983	F
54672	Peter	Mathias	\N	GER	\N	M
9020	Kokoro	Fujii	TEST Federation	XYZ	1974	M
1000413	Strang	Kadri	\N	FIN	\N	F
1000416	Ashok	Anjali	\N	IND	\N	F
1000462	Sillanpaa	Elle	\N	FIN	\N	F
1000469	Sługocka	Barbara	\N	POL	\N	F
1000473	Wasielka	Natalia	\N	POL	\N	F
9019	Bonder	Jeremy	TEST Federation	XYZ	1973	M
9021	Moroni	Gabriele	TEST Federation	XYZ	1976	M
8144	Chon	Jongwon	TEST Federation	XYZ	1970	M
1000479	Amatruda	Claudia Maria	\N	ITA	\N	F
8155	Sharafudtinov	Dmitri	TEST Federation	XYZ	1981	M
1000480	Drapella	Lena	\N	POL	\N	F
71349	De Souza	Anna	\N	IRL	\N	F
71352	Neal-Fagan	Paola	\N	IRL	\N	F
1000408	Myers	Katie	USA Climbing	USA	\N	F
3495	Renwick	Sadie	British Mountaineering Council	GBR	1985	F
1000445	Moran	Carmel	British Mountaineering Council	GBR	\N	F
2000204	Gelmanov	Rustam	Climbing Federation of Russia	RUS	1992	M
10818	Kruder	Julia	Alpine Association of Slovenia	SLO	1990	F
3137	Vidmar	Katja 	Alpine Association of Slovenia	SLO	1984	F
1000020	Carreto-Cruz	Eneko	Federación Española de Deportes de Montaña y Escalada	ESP	2000	M
1000507	Rubner	Judith	\N	ITA	\N	F
2000202	De Souza	Anna	\N	IRE	1992	F
2000210	Drapella	Lena	\N	POL	1992	F
2000213	Betrisey	Louis	\N	SUI	1992	M
2000214	Fumeaux	Vivian	\N	SUI	1992	M
2000215	Chuat	Dylan	\N	SUI	1992	M
1000549	Pruul	Laura	\N	EST	\N	F
1000568	Urawa	Koharu	\N	JPN	\N	F
1000354	Bashford	Tara	\N	TBD	1990	F
1000069	Banks	Isabel	\N	TBD	2000	F
1000070	Van Der Heijden	Isabelle	\N	TBD	2000	F
1000071	Taylor	Kirsten	\N	TBD	2000	F
1000072	Holley	Leonie	\N	TBD	2000	F
1000073	Hepburn	Tala	\N	TBD	2000	F
1000080	Owen	Amy	\N	TBD	2000	F
1000114	Bennett	Ashlea	\N	TBD	1990	F
1000115	Lounds	Becca	\N	TBD	1990	F
10062	Hans	Moritz	\N	GER	1990	M
1000116	Haaaaay	Chloe	\N	TBD	1990	F
1000117	Youdale	Claire	\N	TBD	1990	F
1000119	Harper	Holly	\N	TBD	1990	F
1000120	Ekwinska	Kasia	\N	TBD	1990	F
1000121	Tamber	Marie	\N	TBD	1990	F
1000122	Theisen	Michelle Kim	\N	TBD	1990	F
1000125	Briggs	Rachel	\N	TBD	1990	F
1000126	Bowman	Rebecca	\N	TBD	1990	F
1000127	Gunther	Sarah	\N	TBD	1990	F
1000128	Pashley	Sarah	\N	TBD	1990	F
1000112	Hall	Emily	\N	TBD	2000	F
9781	Vandet Salling	Katrine	\N	DEN	1990	F
11705	Rosén	Kajsa 	\N	SWE	1990	F
1000357	Ng	Carol	\N	TBD	1990	F
1000201	Maxwell	Katie	\N	TBD	1990	F
1000200	Dean	Kate	\N	TBD	1995	F
1000205	Englert	Lucy	\N	TBD	1995	F
1000144	Hesleden	Claudia	\N	TBD	1990	F
1000146	Williams	Lizzie	\N	TBD	1990	F
1000147	Cassidy	Llinos	\N	TBD	1990	F
1000148	Mitchell	Lucy	\N	TBD	1990	F
1000149	Kastet	Mie	\N	TBD	1990	F
1000196	Morrison	Arona	\N	TBD	1990	F
1000197	Arnold	Chelsea	\N	TBD	1990	F
1000199	Littlefair	Julia	\N	TBD	1990	F
1000202	Marsh	Lisa	\N	TBD	1990	F
1000203	Croft	Liz	\N	TBD	1990	F
1000204	Palmer	Louise	\N	TBD	1990	F
1000206	Sabisky	Marina	\N	TBD	1990	F
1000207	Blackney	Phoebe	\N	TBD	1990	F
1000208	Cooper	Rebecca	\N	TBD	1990	F
1000209	Nuñez	Sara	\N	TBD	1990	F
1000231	Cairns	Bronagh	\N	TBD	1990	F
1000233	Foster	Esther	\N	TBD	1990	F
1000234	Hinsley	Hollie	\N	TBD	1990	F
1000235	Bradbury	Lucy	\N	TBD	1990	F
1000230	May	Beth	\N	TBD	1990	F
1000210	Whyte	Sophie	\N	TBD	1980	F
50691	Stöhr	Anna	TEST Federation	XYZ	\N	F
9514	Michael	Piccolruaz		ITA	1995	M
1000130	Burton	Andrei	\N	TBD	1990	M
10957	Ring	Alina	\N	SUI	1998	F
6522	Midtboe	Hannah	\N	NOR	1990	F
1000037	Mardle	Alissa	\N	TBD	2000	F
1000038	Forino	Anya	\N	TBD	2000	F
1000039	Hulls	Crystal	\N	TBD	2000	F
1000040	Morgan	Gwen	\N	TBD	2000	F
1000042	Claesen	Katy	\N	TBD	2000	F
1000043	Nicholls	Lizzie	\N	TBD	2000	F
1000044	Ross	Lucy	\N	TBD	2000	F
1000047	Wilson	Sophie	\N	TBD	2000	F
1000425	Buchmann	Felix	\N	GER	\N	M
1000048	Vasic	Tilly	\N	TBD	2000	F
1000602	Jackson	Melanie	\N	NZL	\N	F
1000447	Mula	Andres	Federación Española de Deportes de Montaña y Escalada	ESP	\N	M
1000426	Mitterhuber	Marvin	\N	GER	\N	M
1000636	Torreggiani	Irene	\N	ITA	\N	F
9266	Sa	Sol	Korean Alpine Federation	KOR	1990	F
73552	Sjödin	Linda	\N	SWE	\N	F
1000616	Mooney	Aoife	\N	IRL	\N	F
9425	Firnenburg	David	\N	GER	1995	M
10333	Firnenburg	Ruben	\N	GER	1997	M
1000454	Pauw	Jesse	\N	NED	\N	M
1000464	Bautista	Ranaz	\N	MEX	\N	M
9984	Chanourdie	Julia	Federation Française de la Montagne et de l'Escalade	FRA	1996	F
5983	Kim	Jain	Korean Alpine Federation	KOR	1988	F
12523	Jarzebiak	Kimanda	Climbing Escalade Canada	CAN	1972	F
5830	Kim	Jaha	Korean Alpine Federation	KOR	1984	M
12427	Krizanic	Alan	Hrvatski Planinarski Savez	CRO	1979	M
8512	Miroslaw	Karina	Polski Zwiazek Alpinizmu	POL	1993	F
5651	Hroza	Libor	Cesky Horolezecky Svaz	CZE	1987	M
65513	Stöcker	Urs	Deutscher Alpenverein	GER	1976	M
11753	Schlageter	Martin	Deutscher Alpenverein	GER	1966	M
9794	Stirling	Lucinda Ann	Sport Climbing Australia	AUS	1993	F
11860	Fajri	Ashari	Federasi Panjat Tebing Indonesia	INA	1989	M
11195	Alipourshenazandifar	Reza	Iran Mountaineering and Sport Climbing Federation	IRI	1994	M
59510	Hashemisougheh	Mahmoud	Iran Mountaineering and Sport Climbing Federation	IRI	1985	M
8323	Ghisolfi	Stefano	Federazione Italiana Arrampicata Sportiva	ITA	1993	M
10396	Chudziak	Patrycja	Polski Zwiazek Alpinizmu	POL	1995	F
7827	Mawem	Bassa	Federation Française de la Montagne et de l'Escalade	FRA	1984	M
11791	Schockaert	Patti	Climbing and Mountaineering Belgium	BEL	1961	F
3554	Desgranges	Romain	Federation Française de la Montagne et de l'Escalade	FRA	1982	M
3065	Chapelle	Sylvain	Federation Française de la Montagne et de l'Escalade	FRA	1980	M
7641	Retschy	Monika	Deutscher Alpenverein München-Oberland	GER	1991	F
11149	Bestvater	Alma	Deutscher Alpenverein Weimar	GER	1996	F
12064	Fleuret	Elma	Federation Française de la Montagne et de l'Escalade	FRA	1999	F
10354	Jaubert	Anouck	Federation Française de la Montagne et de l'Escalade	FRA	1994	F
10404	Vettorata	Francesco	Federazione Italiana Arrampicata Sportiva	ITA	1992	M
1055	Avezou	Cecile	Federation Française de la Montagne et de l'Escalade	FRA	1971	F
9928	Ekwinska	Katarzyna	Polski Zwiazek Alpinizmu	POL	1995	F
9436	Gontero	Leonardo	Federazione Italiana Arrampicata Sportiva	ITA	1993	M
10596	Fossali	Ludovico	Federazione Italiana Arrampicata Sportiva	ITA	1997	M
56829	Pozza	Pietro	Federazione Italiana Arrampicata Sportiva	ITA	1977	M
8785	Zhang	Ning	Chinese Mountaineering Association	CHN	1987	M
7779	Dobrzanski	Maciej	Polski Zwiazek Alpinizmu	POL	1990	M
8525	Dzienski	Marcin	Polski Zwiazek Alpinizmu	POL	1993	M
9731	Onoe	Aya	Japan Mountaineering Association	JPN	1995	F
9494	Halasa	Rafal	Polski Zwiazek Alpinizmu	POL	1994	M
9493	Rudzinska	Aleksandra	Polski Zwiazek Alpinizmu	POL	1994	F
9238	Buczek	Klaudia	Polski Zwiazek Alpinizmu	POL	1991	F
10384	Brozek	Anna	Polski Zwiazek Alpinizmu	POL	1995	F
3521	Julian  Puigblanque	Ramón 	Federación Española de Deportes de Montaña y Escalada	ESP	1981	M
67019	Capdevila Segales	María Alba	Federación Española de Deportes de Montaña y Escalada	ESP	1985	F
12696	Martinez 	Eduardo	Federacion Ecuatoriana de Andinismo y Escalada	ECU	1976	M
13570	Moreano	Salvador	Federacion Ecuatoriana de Andinismo y Escalada	ECU	1984	M
9634	Rojas	Andrea	Federacion Ecuatoriana de Andinismo y Escalada	ECU	1995	F
10173	Korenaga	Keiichiro	Japan Mountaineering Association	JPN	1996	M
12326	Hada	Yuki	Japan Mountaineering Association	JPN	1997	M
12039	Nonaka	Miho	Japan Mountaineering Association	JPN	1997	F
11740	Yasui	Hiroshi	Japan Mountaineering Association	JPN	1974	M
11810	Hartmann	Benjamin	Japan Mountaineering Association	JPN	1983	M
11721	Hoshi	Takako	Japan Mountaineering Association	JPN	1971	F
1000590	Fabbri	Siara	USA Climbing	USA	\N	F
1000592	Fowler	Isabel	British Mountaineering Council	GBR	\N	F
1000594	Haddow	Darcey	British Mountaineering Council	GBR	\N	F
1000612	Mawhiney	Andrew	British Mountaineering Council	GBR	\N	M
59838	Ryuichiro	Tomizawa	Japan Mountaineering Association	JPN	1976	M
8419	He	CuiLian	Chinese Mountaineering Association	CHN	1989	F
9867	Verhoeven	Anak	Climbing and Mountaineering Belgium	BEL	1996	F
1000470	Sługocki	Tadeusz	\N	POL	\N	M
1000474	Wieczorkowski	Miłosz	\N	POL	\N	M
64822	Hardiquest	Lisa	Climbing and Mountaineering Belgium	BEL	2001	F
6488	Kruder	Jernej	Alpine Association of Slovenia	SLO	1990	M
2000004	Bertin	Celia	Federation Française de la Montagne et de l'Escalade	FRA	1996	F
9058	Megos	Alex	\N	GER	1993	M
8958	Skofic	Domen	Alpine Association of Slovenia	SLO	1994	M
11989	Garnbret	Janja	Alpine Association of Slovenia	SLO	1999	F
5169	Markovic	Mina	Alpine Association of Slovenia	SLO	1987	F
12255	Hren	Gorazd	Alpine Association of Slovenia	SLO	1978	M
60346	Vesna	Pavlovic	Sport Climbing Federation of Serbia	SRB	1972	F
52305	Fell	Frederike		GER	2001	F
55518	Vroom	Tiba		NED	1999	F
69988	Frank	Pleun		NED	2002	F
11150	Averdunk	Alexander		GER	1997	M
11387	Marx	Oliver	South African National Climbing Federations	RSA	1997	M
10279	Fakirianov	Dmitrii	Climbing Federation of Russia	RUS	1994	M
8560	Kokorin	Stanislav	Climbing Federation of Russia	RUS	1990	M
10856	Shikov	Aleksandr	Climbing Federation of Russia	RUS	1997	M
64422	Zvigule	Alise	TEST Federation	XYZ	1990	F
66387	Stainton	George	South African National Climbing Federations	RSA	1961	M
7964	Boldyrev	Danyil	Ukrainian Mountaineering and Climbing Federation	UKR	1992	M
12170	Zimova	Liubov	Ukrainian Mountaineering and Climbing Federation	UKR	1953	M
11759	Sergeev	Sergei	Climbing Federation of Russia	RUS	1956	M
12162	Skurlatov	Yury	Climbing Federation of Russia	RUS	1941	M
12163	Ter-Minasian	Armen	Climbing Federation of Russia	RUS	1962	M
12161	Sigov	Sergey	Climbing Federation of Russia	RUS	1957	M
10857	Kaplina	Iuliia	Climbing Federation of Russia	RUS	1993	F
9281	Krasavina	Mariia	Climbing Federation of Russia	RUS	1990	F
8428	Tsyganova	Anna	Climbing Federation of Russia	RUS	1993	F
11052	Kan	Daria	Climbing Federation of Russia	RUS	1998	F
13188	Chistiakova	Svetlana	Climbing Federation of Russia	RUS	1972	F
12377	Gejo	Slobodan	Sport Climbing Federation of Serbia	SRB	1951	M
13447	Meijer	Julia		NED	1999	F
5176	Moroni	Gabriele	\N	ITA	1990	M
11148	Wurm	Alexander	\N	GER	1996	M
1000444	Mieszkowski	Filip	\N	POL	1989	M
12590	O'Connor	Terry	\N	IRL	1990	M
1000529	Lautenberg	Benjamin	\N	GER	\N	M
9683	Hanke	Christoph		GER	1994	M
11795	Marschner	Kim		GER	1998	M
11801	Prinz	Max		GER	1999	M
52665	Kleesattel	Max		GER	1998	M
50798	Martin	Philipp		GER	1994	M
12604	Flohé	Yannick		GER	1999	M
10370	Acton	Eoin		IRL	1996	M
9940	Schröter	Thilo		NOR	1996	M
13535	Rakestraw	Ysa		NED	2000	F
1000123	Janicka-Skoczylas	Monika	\N	POL	1990	F
961	Jongeneelen	Wouter	\N	NED	1977	M
64762	Burns	Mia	\N	IRL	2000	F
11375	Buhrfeind	Claire	USA Climbing	USA	1998	F
1000644	Fulchher	Emma	British Mountaineering Council	GBR	\N	F
1000471	Steele	Jamie	British Mountaineering Council	GBR	\N	M
1000472	Verry	Elliot	British Mountaineering Council	GBR	\N	M
1000486	Brown	Chris	British Mountaineering Council	GBR	\N	M
1000493	Clemmens	David	British Mountaineering Council	GBR	\N	M
2000032	Khan	Ayesha	Climbing Escalade Canada	CAN	1992	F
2000008	Brask	Josefine	\N	DEN	1985	F
2000009	Brennan	Aisling	\N	IRE	2000	F
1000007	Trenchard	Grace	\N	TBD	2000	F
907	Le Néve	Melissa	Federation Française de la Montagne et de l'Escalade	FRA	1989	F
1000015	Hough	Izzie	\N	TBD	2000	F
1000017	Hoare	Sarah	\N	TBD	2000	F
2000025	Garcia Inclan	Sara	Federación Española de Deportes de Montaña y Escalada	ESP	1984	F
2000011	Buenaventura	Kimberly	\N	MAS	1994	F
1000008	Casey	Robin	\N	TBD	2003	F
2000014	Coimbra	Teresa Cyrne	\N	POR	2000	F
2000031	Karpeter	Martha	\N	GER	1995	F
2000036	McGarry	Jessica	\N	IRE	2002	F
1000025	Knightley	Isaac	\N	TBD	2001	M
1000036	Logan	Abi	\N	TBD	2000	F
1000305	Womersley	Abi	\N	TBD	1990	F
1000307	Aggarwal	Anita	\N	TBD	1990	F
1000308	Ollerenshaw	Anna	\N	TBD	1990	F
1000309	Walton	Bethany	\N	TBD	1990	F
1000310	Smallwood	Cheryl	\N	TBD	1990	F
1000311	Soar	Clare	\N	TBD	1990	F
1000312	Hills	Eleanor	\N	TBD	1990	F
1000314	Moore	Erica	\N	TBD	1990	F
1000315	Hill	Georgie	\N	TBD	1990	F
1000316	Stadden	Jo	\N	TBD	1990	F
1000317	Jackson	Kat	\N	TBD	1990	F
1000318	Andrew	Lizzy	\N	TBD	1990	F
1000319	Stehling	Nicola	\N	TBD	1990	F
1000320	Ellams	Nicole	\N	TBD	1990	F
1000321	Rithalia	Nina	\N	TBD	1990	F
1000322	Hoyland	Rachel	\N	TBD	1990	F
1000324	Statham	Sarah	\N	TBD	1990	F
1000325	Boardman	Shannon	\N	TBD	1990	F
1000326	Hartle	Stephanie	\N	TBD	1990	F
1000323	Bennett	Rowanne	\N	TBD	1987	F
1000306	Smith	Alison	\N	TBD	1987	F
1000313	Smith	Emma	\N	TBD	1990	F
1000285	Crabapplebum	Rhys	\N	TBD	1990	M
1000286	McDonough	Rhys	\N	TBD	1990	M
1000287	Morley	Richard	\N	TBD	1990	M
1000288	Simms	Rob	\N	TBD	1990	M
1000140	Bunsch	Piotr	\N	POL	1990	M
1000077	Golder	John	\N	TBD	2000	M
1000355	Barat Zadeh	Gholami	\N	TBD	1990	M
1000356	Guerin	Alexis	\N	TBD	1990	M
1000074	Wilkinson	Alasdair	\N	TBD	2000	M
1000075	Langley	Alfie	\N	TBD	2000	M
1000078	Ainscough	Oliver	\N	TBD	2000	M
1000081	Shelton	Adam	\N	TBD	1990	M
1000082	GARCIA	ADRIAN	\N	TBD	1990	M
1000083	Zanone	Andrea	\N	TBD	1990	M
1000085	Shanks	Andy	\N	TBD	1990	M
1000088	Bocchio Vega	Edoardo	\N	TBD	1990	M
1000090	Sharp	George	\N	TBD	1990	M
1000092	Noble	James	\N	TBD	1990	M
1000094	Auditore	Jez	\N	TBD	1990	M
1000095	Webb	Jimmy 	\N	TBD	1990	M
1000096	Bradley	Kody-James	\N	TBD	1990	M
1000097	Rios	Len	\N	TBD	1990	M
1000098	Rinaldi	Luca	\N	TBD	1990	M
1000099	Botor	Marcin	\N	TBD	1990	M
1000100	Osman	Nawras	\N	TBD	1990	M
1000101	Thorpe	Oliver	\N	TBD	1990	M
1000104	Abbey	Sam	\N	TBD	1990	M
1000106	Cox	Sam	\N	TBD	1990	M
1000107	Pastor	Sergio	\N	TBD	1990	M
1000109	Macdonald	Seth	\N	TBD	1990	M
1000110	Brice	Simon	\N	TBD	1990	M
1000111	Tarrant	Charles	\N	TBD	1990	M
1000509	Furey	Daniel	\N	IRL	1991	M
1000079	Miah	Alex	\N	TBD	2001	M
9785	Wientjes	Florian	\N	GER	1995	M
1000093	Rankin	Jamie	\N	TBD	1997	M
2000006	Blackney	Phoebe	British Mountaineering Council	GBR	1994	F
5089	McColl	Sean	Climbing Escalade Canada	CAN	1987	M
9492	Timmermans	Loïc	Climbing and Mountaineering Belgium	BEL	1995	M
1000381	Peharc	Ales	Alpine Association of Slovenia	SLO	1999	M
1000129	Vanden Berghe	Alexi	\N	TBD	1990	M
1000132	Giles	Dave	\N	TBD	1990	M
1000133	Fitzgerald	David	\N	TBD	1990	M
1000134	Cooper	Eddie	\N	TBD	1990	M
1000135	Stephens	Eliot	\N	TBD	1990	M
1000136	Niedermayr	Jakob	\N	TBD	1990	M
1000137	Sømme	Knut	\N	TBD	1990	M
1000138	Navarro	Miguel 	\N	TBD	1990	M
1000139	Murphy	Phillip	\N	TBD	1990	M
1000150	McCann	Alex	\N	TBD	1990	M
1000151	Prescott	Alex	\N	TBD	1990	M
1000152	Oates	Alexander	\N	TBD	1990	M
1000153	Shelton	Alli	\N	TBD	1990	M
1000154	Taylor	Angus	\N	TBD	1990	M
1000251	Rapinet	Elliott	\N	TBD	1990	M
1000252	Colley	George	\N	TBD	1990	M
1000253	Ghafoor	Haziq	\N	TBD	1990	M
1000256	Daniel	James	\N	TBD	1990	M
13007	Gros	Natalija	TEST Federation	XYZ	\N	F
61116	Bacher	Barbara	TEST Federation	XYZ	\N	F
1000257	Gaunt	James	\N	TBD	1990	M
1000345	Chai	Anna	\N	TBD	1990	F
1000260	Wilson	James	\N	TBD	1990	M
1000261	GREENWAY	JEM	\N	TBD	1990	M
1000262	Heeley	Joe	\N	TBD	1990	M
7068	Scarperi	Stefan		ITA	1991	M
11912	O'Connor	Daragh		IRL	1996	M
13825	Mawhinney	Andrew		IRL	1996	M
13522	Hoare	Sean		IRL	1998	M
12701	Marcus	Nimrod		ISR	1999	M
10833	Malatesta	Lorenzo		ITA	1997	M
3115	Verhoeven	Jorg	\N	NED	1985	M
8245	Rugens	Rolands		LAT	1992	M
13127	Van Laere	Don	\N	NED	1999	M
12509	Chuat	Dylan		SUI	2000	M
11183	Chon	Jongwon	Korean Alpine Federation	KOR	1996	M
6623	Hojer	Jan		GER	1992	M
1000342	Lloyd	Tom	\N	TBD	1990	M
1000339	Scott	Peter	\N	TBD	1990	M
9046	Rubtsov	Alexei	Climbing Federation of Russia	RUS	1988	M
12397	Scanlon	Ciarán		IRL	1995	M
1000340	Hessell	Ryan	\N	TBD	1989	M
9537	Khazanov	Alex		ISR	1995	M
1000103	Mockridge	Robb	\N	TBD	1986	M
6933	Gelmanov	Rustam	Climbing Federation of Russia	RUS	1987	M
1000341	Moulder	Thomas	\N	TBD	1990	M
5694	Caleyron	Thomas	Federation Française de la Montagne et de l'Escalade	FRA	1984	M
1000398	Chaikangdee	Max	\N	DEN	\N	M
1000402	Ebben	Wouter	\N	NED	\N	M
1000411	Patzner	Josh	\N	GER	\N	M
1000263	Hulbert	Joel	\N	TBD	1990	M
1000264	Merz	John	\N	TBD	1990	M
1000157	Cheung	Bryan	\N	TBD	1990	M
1000158	Brinkhof	Daan	\N	TBD	1990	M
1000159	Lowey	Dale	\N	TBD	1990	M
1000160	Heath	Dan	\N	TBD	1990	M
1000162	Boyd	Elliott	\N	TBD	1990	M
1000163	McMahon	Eugene	\N	TBD	1990	M
1000164	Morris	George	\N	TBD	1990	M
1000165	Morrish	Harry	\N	TBD	1990	M
1000170	Gresham	Jake	\N	TBD	1990	M
1000171	Blay	James	\N	TBD	1990	M
1000172	Oakes	James	\N	TBD	1990	M
1000174	Leong	Jeremy	\N	TBD	1990	M
1000175	Wales	Josh	\N	TBD	1990	M
1000176	Geoghegan	Kenny	\N	TBD	1990	M
1000177	Packer	Lee	\N	TBD	1990	M
1000178	Thistleton	Lee	\N	TBD	1990	M
1000182	Burson	Matt	\N	TBD	1990	M
1000184	Fitzgerald	Matthew	\N	TBD	1990	M
1000186	Caminati	Michele	\N	TBD	1990	M
1000187	Beddoes	Philip	\N	TBD	1990	M
1000188	Labisch	Roman	\N	TBD	1990	M
1000520	Hellewell	Jack	British Mountaineering Council	GBR	\N	M
1000211	Bautista	Daniel Ranaz	\N	TBD	1990	M
1000212	Prior	Ewan	\N	TBD	1990	M
1000213	Rampf	Felix	\N	TBD	1990	M
1000214	Wish	Fergus	\N	TBD	1990	M
1000215	Hannart	Gabriel	\N	TBD	1990	M
1000221	Beattie	Jess	\N	TBD	1990	M
1000222	Bell-Winfrow	John	\N	TBD	1990	M
1000223	Downham	Josh	\N	TBD	1990	M
1000224	Burson	Matthew	\N	TBD	1990	M
1000225	Rose	Philip	\N	TBD	1990	M
1000226	Bacon	Reuben	\N	TBD	1990	M
1000227	Holden	Sam	\N	TBD	1990	M
1000228	Roberts	Sam	\N	TBD	1990	M
1000229	Hawkins	Yan	\N	TBD	1990	M
1000239	Search	Benjamin	\N	TBD	1990	M
1000240	Rouse	Colin	\N	TBD	1990	M
1000241	Smith	Craig	\N	TBD	1990	M
1000242	Markey	Danaan	\N	TBD	1990	M
1000243	Waters	Daniel	\N	TBD	1990	M
1000244	Stevenson	Darren	\N	TBD	1990	M
1000247	Lyons Ewing	David	\N	TBD	1990	M
1000248	Wells	David	\N	TBD	1990	M
1000250	Watmore	Dominic	\N	TBD	1990	M
1000265	Butters	Jonathan	\N	TBD	1990	M
1000267	Thomas	Joseff	\N	TBD	1990	M
1000268	Brindley	Joseph	\N	TBD	1990	M
1000270	Quinn	Kyle	\N	TBD	1990	M
1000271	Wilkinson	Lex	\N	TBD	1990	M
1000272	Cofano	Marco	\N	TBD	1990	M
1000273	Parker	Marjorie	\N	TBD	1990	M
1000274	Fox	Martin	\N	TBD	1990	M
1000277	Neururer	Michalis	\N	TBD	1990	M
1000278	Davies	Neil	\N	TBD	1990	M
1000279	Jackson	Nick	\N	TBD	1990	M
1000280	Knowles	Oliver	\N	TBD	1990	M
1000282	Easton	Paul	\N	TBD	1990	M
1000283	Phillips	Paul	\N	TBD	1990	M
1000284	Bullock	Phil	\N	TBD	1990	M
1000595	Hansen	Luke	Sport Climbing Australia	AUS	\N	M
1000236	Burgess	Andy	\N	TBD	1965	M
1000246	Burn	David	\N	TBD	1989	M
1000192	Currie	Toby	\N	TBD	1997	M
1000281	Druce	Paul	\N	TBD	1993	M
1000275	Goodman	Matt	\N	TBD	1993	M
1000185	Chrimes	Michael	\N	TBD	1990	M
1000245	Johnston	Dave	\N	TBD	1977	M
1000642	Wilson	Jase	Climbing Escalade Canada	CAN	\N	M
1000220	May	James	\N	TBD	1993	M
1000266	Senior	Jonty	\N	TBD	1992	M
1000141	Tam	Sebastian	\N	TBD	1997	M
1000166	Waller	Harry	\N	TBD	1996	M
1000173	Woodhead	Jaric	\N	TBD	1992	M
8453	Unger	Simon	\N	SUI	1990	M
1000168	Beanland	Jack	\N	TBD	1990	M
1000131	Meakin	Ben	\N	TBD	1990	M
1000155	Fidrmuc	Ben	\N	TBD	1990	M
1000142	Holloway	Tom	\N	TBD	1990	M
1000143	Matthews	Tom	\N	TBD	1990	M
1000193	Egan	Tom	\N	TBD	1990	M
1000194	Green	Tom	\N	TBD	1994	M
1000276	Constantinou	Michael	\N	TBD	1990	M
1000191	Read	Tim	\N	TBD	1990	M
1000108	VERDASCO	SERGIO	Federación Española de Deportes de Montaña y Escalada	ESP	1990	M
1000580	Brozovic	Boris	\N	GER	\N	M
1000050	Jackson	Adam	\N	TBD	2000	M
1000051	Hodge	Ashley	\N	TBD	2000	M
1000608	Licko	Vojtech	\N	CZE	\N	M
1000052	Sykes	Brennan	\N	TBD	2000	M
1000054	Raymond Barker	Danny	\N	TBD	2000	M
1000055	McInerney	Flinn	\N	TBD	2000	M
1000056	Wallace	Joe	\N	TBD	2000	M
1000057	Theobald	Louis	\N	TBD	2000	M
1000058	Mr Braida	Neo	\N	TBD	2000	M
1000059	Taylor	Owen	\N	TBD	2000	M
1000060	Brand	Paul	\N	TBD	2000	M
1000061	Cahill	Rhys	\N	TBD	2000	M
1000062	Carling	Sam	\N	TBD	2000	M
1000063	Collins	Sam	\N	TBD	2000	M
1000064	Pollet	Solomon	\N	TBD	2000	M
1000065	Vermoolen	Trevor	\N	TBD	2000	M
1000627	Roberts	Edward	\N	NOR	\N	M
10984	Arnel Lisager	Bjørn	\N	DEN	1990	M
1000218	Jodowski	Jakub	\N	POL	1990	M
1000066	Visser	Ynze	\N	TBD	2000	M
11015	Serlachius	Fredrik	\N	SWE	\N	M
11289	Levin	Ram	\N	ISR	\N	M
1000053	Smith	Daniel	\N	TBD	2003	M
1000249	Quince	Declan	\N	TBD	1990	M
1000156	Thompson	Ben	\N	TBD	1990	M
1000237	Hardy	Ben	\N	TBD	1990	M
1000238	Sully	Ben	\N	TBD	1990	M
11808	Ansion	Arnaud	Climbing and Mountaineering Belgium	BEL	1998	M
10825	Peharc	Anze	Alpine Association of Slovenia	SLO	1999	M
2000094	Courias	Guillaume	Federation Française de la Montagne et de l'Escalade	FRA	1997	M
1000167	Lazcoz	ION GURUTZ	Federación Española de Deportes de Montaña y Escalada	ESP	1990	M
1000169	Lisle	Jack	\N	TBD	1990	M
1000076	Smallwood	George	\N	TBD	2001	M
12720	Mawem	Mickael	Federation Française de la Montagne et de l'Escalade	FRA	1990	M
3223	Samyn	Remi	Federation Française de la Montagne et de l'Escalade	FRA	1984	M
11091	Cornu	Manuel	Federation Française de la Montagne et de l'Escalade	FRA	1993	M
11363	Harrison	Campbell	Sport Climbing Australia	AUS	1997	M
10458	Cujic	Borna	Hrvatski Planinarski Savez	CRO	1997	M
2638	Mecherzynski-Wiktor	Andrzej	Polski Zwiazek Alpinizmu	POL	1984	M
12501	Ogata	Yoshiyuki	Japan Mountaineering Association	JPN	1998	M
10172	Fujii	Kokoro	Japan Mountaineering Association	JPN	1992	M
10618	Narasaki	Tomoa	Japan Mountaineering Association	JPN	1996	M
10597	Elfenbein	Theis Lindegren		DEN	1997	M
11739	Tomoaki	Takata		JPN	1995	M
64718	Byelov	Mikola		NED	2001	M
55503	Cavé	Leto		NED	2002	M
55506	De Louw	Jens		NED	2002	M
1000105	Barnes	Sam	\N	TBD	1995	M
9487	Nieuwenhuijsen	Michiel		NED	1986	M
13316	Ludford	Adam	South African National Climbing Federations	RSA	1983	M
1000161	Skoczylas	Dawid	\N	POL	1979	M
8870	Reuser	Tim		NED	1993	M
1000102	Blair	Pete	\N	TBD	1990	M
1000216	Gavrilov	Hristo	\N	BUL	1994	M
1000000	Price	Adam	TEST Federation	XYZ	2000	M
1000181	Hilton	Marc	\N	TBD	1988	M
1000005	Gooder	Matt	\N	TBD	2000	M
1000027	Collins	Jake	\N	TBD	2002	M
1000009	Orr	Conor	\N	TBD	2000	M
1000010	Raimondi	Giacomo	\N	TBD	2000	M
1000011	Proctor	James	\N	TBD	2000	M
1000012	Hackett	Luke	\N	TBD	2000	M
1000018	De Nobrega	Benedict	\N	TBD	2000	M
1000019	Taylor	David	\N	TBD	2000	M
1000021	Farmer	Euan	\N	TBD	2000	M
1000022	Wood	Finley	\N	TBD	2000	M
1000023	Stables	George	\N	TBD	2000	M
1000026	Richardson	Jacob	\N	TBD	2000	M
1000179	Fyfe	Liam	\N	TBD	1990	M
1000028	Bateman	James	\N	TBD	2000	M
1000029	Wood	Lyall	\N	TBD	2000	M
1000030	Holme	Max	\N	TBD	2000	M
1000031	Prescott	Max	\N	TBD	2000	M
1000032	Allen	Sam	\N	TBD	2000	M
1000034	Brewin	Tobias	\N	TBD	2000	M
1000013	O'Neill	Michael	\N	TBD	2000	M
1000180	Richardson	Luke	\N	TBD	1990	M
1000035	Frost	Tom	\N	TBD	2000	M
2000063	Aizawa	Kyoichi	\N	JPN	1992	M
2000075	Berghoff	Arno	\N	GER	1989	M
1000014	Oakes	Sammy	\N	TBD	2000	M
1000289	Grout	Robert	\N	TBD	1990	M
1000290	Jackson	Sam	\N	TBD	1990	M
1000291	Kershaw	Scott	\N	TBD	1990	M
1000292	Bull	Sean	\N	TBD	1990	M
1000293	Fink	Shaun	\N	TBD	1990	M
1000294	Oldfield	Simon	\N	TBD	1990	M
1000295	Woodcock	Steve	\N	TBD	1990	M
1000296	Jones	Steven	\N	TBD	1990	M
1000302	Loke	Wayren	\N	TBD	1990	M
1000303	Grout	William	\N	TBD	1990	M
1000327	Pilugins	Aleksandrs	\N	TBD	1990	M
1000328	Wolf	Alex	\N	TBD	1990	M
1000329	Minhas	Bilal	\N	TBD	1990	M
1000330	Brook	Chris	\N	TBD	1990	M
1000331	Teale	Edward	\N	TBD	1990	M
1000332	Jones	Haydn	\N	TBD	1990	M
1000334	Smith	Jason 	\N	TBD	1990	M
1000336	Brewer	Marcus	\N	TBD	1990	M
1000337	Longworth	Marjorie	\N	TBD	1990	M
2000091	Castro	João	\N	POR	1997	M
1000297	Cooper	Tim	\N	TBD	1990	M
1000333	Raven	Jack	\N	TBD	1990	M
10116	Burns	Dominic	\N	IRL	1990	M
1000579	Briggs	Tom	British Mountaineering Council	GBR	\N	M
2000125	Hendrikx	Nick	Climbing and Mountaineering Belgium	BEL	1984	M
2000101	Diez	Esteban	Federación Española de Deportes de Montaña y Escalada	ESP	1978	M
1000091	DOMINGUEZ	GUILLERMO	Federación Española de Deportes de Montaña y Escalada	ESP	1990	M
1000298	Brown	Tom	\N	TBD	1990	M
2000110	Fazal	Farooq	\N	PAK	1991	M
2000113	Fumeaux	Vivian	\N	SUI	2003	M
2000114	García	Felipe	\N	CRC	1996	M
2000117	Gregorczyk	Pawel	\N	POL	1984	M
1000299	Soar	Tom	\N	TBD	1990	M
2000137	Louis	Betrisey	\N	SUI	2000	M
1000338	Page	Michael	\N	TBD	1990	M
1000300	Stewart	Tom	\N	TBD	1990	M
1000301	Streamer	Tom	\N	TBD	1990	M
1000304	Nham	William	\N	TBD	1983	M
1000190	Goode	Steve	\N	TBD	1990	M
2000148	Neres	André	\N	POR	1985	M
2000152	Orrego Carmona	David	\N	COL	1988	M
2000159	Preto	Lourenço	\N	POR	2001	M
2000164	Reid	Richard	\N	IRE	1993	M
2000170	Scanlon	Mark	\N	IRE	1999	M
2000173	Sievertsen	Hans	\N	DEN	1984	M
2000177	Soto	Camilo	\N	ITA	1989	M
2000186	Van De Noort	Job	\N	NED	1993	M
1000258	Hayes	James	\N	TBD	1989	M
1000259	Walker	James	\N	TBD	1988	M
1000254	Pearson	Jack	\N	TBD	1990	M
1000255	Taylor	Jack	\N	TBD	1985	M
1000409	Neal-Fagan	Paola	\N	IRE	2003	F
2000046	Pinto De Abreu	Mariana	\N	POR	1996	F
2000102	Donnell	Dom	British Mountaineering Council	GBR	2004	M
2000104	Durand	Bastien	British Mountaineering Council	GBR	1996	M
2000061	Zhao	Jill	Chinese Mountaineering Association	CHN	1987	F
2000049	Shchedrina	Daria	Ukrainian Mountaineering and Climbing Federation	UKR	1992	F
2000054	Tamber	Marie	\N	NOR	1991	F
2000057	Watterson	Victoria	\N	IRE	1998	F
2000058	Wolf	Helene	\N	GER	1998	F
5244	Saurwein	Katharina	Kletterverband Österreich 	AUT	1987	F
1030	Bacher	Barbara	Kletterverband Österreich 	AUT	1982	F
8955	Röck	Magdalena	Kletterverband Österreich 	AUT	1994	F
9970	Pilz	Jessica	Kletterverband Österreich 	AUT	1996	F
12547	Schauer	Markus	Kletterverband Österreich 	AUT	1964	M
3149	Hammerer	Martin	Kletterverband Österreich 	AUT	1983	M
12582	Dornauer	Alfons 	Kletterverband Österreich 	AUT	1993	M
12670	Hammelmüller	Eva-Maria	Kletterverband Österreich 	AUT	2000	F
6550	Schubert	Jakob	Kletterverband Österreich 	AUT	1990	M
6487	Lama	David 	Kletterverband Österreich 	AUT	1990	M
12674	Haertl	Dominik	Kletterverband Österreich 	AUT	1999	M
10625	Parma	Georg	Kletterverband Österreich 	AUT	1997	M
12930	Pötzi	Mattea	Kletterverband Österreich 	AUT	2000	F
11960	Stöckler	Laura	Kletterverband Österreich 	AUT	1999	F
10385	Schubert	Hannah	Kletterverband Österreich 	AUT	1997	F
11380	Brosler	John	USA Climbing	USA	1997	M
1000545	Nunnally	Christian	USA Climbing	USA	\N	M
1000555	Snider	Colin	USA Climbing	USA	\N	M
11377	Hayes	Margo	USA Climbing	USA	1998	F
12027	Mascarenas	Megan	USA Climbing	USA	1997	F
7495	Buys	Naomi	British Mountaineering Council	GBR	1982	F
9882	Peet	Gill	British Mountaineering Council	GBR	1982	F
12418	Howard	Ellie	British Mountaineering Council	GBR	1984	F
6311	Arnold	Thom	British Mountaineering Council	GBR	1988	M
9428	Partgridge	Jonathan	British Mountaineering Council	GBR	1983	M
8100	Watson	Adam	British Mountaineering Council	GBR	1989	M
11728	Atkinson	William	British Mountaineering Council	GBR	1994	M
11732	Meredith	Tanya	British Mountaineering Council	GBR	1982	F
11734	Soithongsuk	Tiffany	British Mountaineering Council	GBR	1986	F
11730	Graham	Sidonie	British Mountaineering Council	GBR	1998	F
10490	Hayes	Tara	British Mountaineering Council	GBR	1997	F
6849	Crane	Leah	British Mountaineering Council	GBR	1989	F
12856	Lee	Eugenie	British Mountaineering Council	GBR	2000	F
10489	Thompson-Smith	Molly	British Mountaineering Council	GBR	1997	F
8247	Coxsey	Shauna	British Mountaineering Council	GBR	1993	F
10966	Dawson	Peter	British Mountaineering Council	GBR	1998	M
6721	Newman	Tom	British Mountaineering Council	GBR	1988	M
8759	Jeffery	Diane	British Mountaineering Council	GBR	1979	F
11498	Wood	Jennifer	British Mountaineering Council	GBR	1994	F
8101	Tracy	Michaela	British Mountaineering Council	GBR	1991	F
10960	Martin	Gracie	British Mountaineering Council	GBR	1997	F
7052	Berry	Natalie	British Mountaineering Council	GBR	1990	F
10114	Carr	Rachel	British Mountaineering Council	GBR	1996	F
10959	Tilley	Florence	British Mountaineering Council	GBR	1997	F
13386	Uttley	Gwyneth	British Mountaineering Council	GBR	2000	F
12655	Slaney	Hannah	British Mountaineering Council	GBR	1999	F
12409	Mabon	James	British Mountaineering Council	GBR	1998	M
12891	Whaley	Becky	British Mountaineering Council	GBR	1999	F
1000455	Peetermans	Zoë	British Mountaineering Council	GBR	\N	F
1000400	Bonn	Catherine	British Mountaineering Council	GBR	\N	F
1000410	Partington	Elle	British Mountaineering Council	GBR	\N	F
1000419	Bean	Lauren	British Mountaineering Council	GBR	\N	F
1000421	Bensley	Frances	British Mountaineering Council	GBR	\N	F
1000423	Borlase	Airlie	British Mountaineering Council	GBR	\N	F
1000424	Brennan	Aisling	British Mountaineering Council	GBR	\N	F
1000430	Corrigan	Olivia	British Mountaineering Council	GBR	\N	F
1000433	Garratt	Beth	British Mountaineering Council	GBR	\N	F
1000439	Johnson	Abi	British Mountaineering Council	GBR	\N	F
1000448	Murray	Holly	British Mountaineering Council	GBR	\N	F
1000450	Nelson	Phoebe	British Mountaineering Council	GBR	\N	F
1000451	Nolan	Jessica	British Mountaineering Council	GBR	\N	F
1000467	Stewart	Rosie	British Mountaineering Council	GBR	\N	F
1000476	Al-Assam	Sara	British Mountaineering Council	GBR	\N	F
1000478	Allen	Isabella	British Mountaineering Council	GBR	\N	F
1000483	Bartrick	Lucy	British Mountaineering Council	GBR	\N	F
1000490	Cassidy	Rachel	British Mountaineering Council	GBR	\N	F
1000484	Bates	Libby	British Mountaineering Council	GBR	1994	F
1000491	Clarke	Charlotte	British Mountaineering Council	GBR	1991	F
1000468	Stobbs	Rosie	British Mountaineering Council	GBR	2003	F
1000475	Wyatt	Megan	British Mountaineering Council	GBR	2003	F
1000418	Barnett	Emily	British Mountaineering Council	GBR	\N	F
1000446	Morris	Emily	British Mountaineering Council	GBR	\N	F
1000515	Greenall	Tom	British Mountaineering Council	GBR	\N	M
1000503	Downy	Cat	British Mountaineering Council	GBR	\N	F
1000508	Frost	Fay	British Mountaineering Council	GBR	\N	F
2000195	Briggs	Tom	British Mountaineering Council	GBR	1992	M
2000196	Richardson	Luke	British Mountaineering Council	GBR	1992	M
2000197	Procter	Lucy	British Mountaineering Council	GBR	1992	F
2000198	Murphy	Luke	British Mountaineering Council	GBR	1992	M
2000199	Campbell	Duncan	British Mountaineering Council	GBR	1992	M
2000200	Walton	Ian	British Mountaineering Council	GBR	1992	M
2000050	Shilladay	Katrina	British Mountaineering Council	GBR	1995	F
2000201	Heine	Jonathan	British Mountaineering Council	GBR	1992	M
2000203	Parry	Gaz	British Mountaineering Council	GBR	1992	M
2000205	Musgrove	David	British Mountaineering Council	GBR	1992	M
2000206	Thompson	Ben	British Mountaineering Council	GBR	1992	M
2000207	Snow	Aidan	British Mountaineering Council	GBR	1992	M
2000208	Cave	Andy	British Mountaineering Council	GBR	1992	M
2000209	Morrison	Arona	British Mountaineering Council	GBR	1992	F
2000211	Harrison	Adam	British Mountaineering Council	GBR	1992	M
2000212	Morrell	Katie	British Mountaineering Council	GBR	1992	F
2000216	Snow	Patrick	British Mountaineering Council	GBR	1992	M
2000217	Burson	Mathew	British Mountaineering Council	GBR	1992	M
2000218	Read	Tim	British Mountaineering Council	GBR	1992	M
2000220	George	James	British Mountaineering Council	GBR	1992	M
2000221	Easton	Paul	British Mountaineering Council	GBR	1992	M
2000222	Hamilton	Joe	British Mountaineering Council	GBR	1992	M
2000223	Capewell-Salisbury	Bex	British Mountaineering Council	GBR	1992	F
2000224	Cunningham	Rob	British Mountaineering Council	GBR	1992	M
2000225	Jordan	Craig	British Mountaineering Council	GBR	1992	M
2000226	Sneddon	Amy	British Mountaineering Council	GBR	1992	F
2000227	Beasley	Natasha	British Mountaineering Council	GBR	1992	F
2000228	Hudspith	Nathanael	British Mountaineering Council	GBR	1992	M
2000229	Dale	Cameron	British Mountaineering Council	GBR	1992	M
2000219	Gibbs	Rachel	British Mountaineering Council	GBR	1992	F
1000512	Goldsbrough	Joanna	British Mountaineering Council	GBR	\N	F
1000530	Lomas	Anna	British Mountaineering Council	GBR	\N	F
1000532	Lomax	Kirsty	British Mountaineering Council	GBR	\N	F
1000534	MacAskill	Isla	British Mountaineering Council	GBR	\N	F
1000535	MacDougall	Lynn	British Mountaineering Council	GBR	\N	F
1000538	Mclennan	Kirsty	British Mountaineering Council	GBR	\N	F
1000541	Morgan	Sarah	British Mountaineering Council	GBR	\N	F
1000548	Phillip	Eleanor	British Mountaineering Council	GBR	\N	F
1000552	Shutt	Rebecca	British Mountaineering Council	GBR	\N	F
1000522	Howe	Peter	British Mountaineering Council	GBR	1987	M
1000572	Wicklow	Tania	British Mountaineering Council	GBR	\N	F
1000567	Southam	Astrid	British Mountaineering Council	GBR	\N	F
1000502	Dobson	Miriam	British Mountaineering Council	GBR	1991	F
1000514	Greenall	Michelle	British Mountaineering Council	GBR	1985	F
1000533	Lund	Sian	British Mountaineering Council	GBR	1988	F
1000536	Maxwell-Stewart	Katie	British Mountaineering Council	GBR	1981	F
9784	Rees	Holly	British Mountaineering Council	GBR	1990	F
1000570	Wheeler	Lily-Mae	British Mountaineering Council	GBR	2001	F
1000501	Darby	Cosette	British Mountaineering Council	GBR	1994	F
1000519	Hayes	Hannah	British Mountaineering Council	GBR	\N	F
2000352	Lomax	Katie	British Mountaineering Council	GBR	0	F
1000650	James	Holly	British Mountaineering Council	GBR	\N	F
2000356	Baxter	Isaac	British Mountaineering Council	GBR	0	M
1000576	Allen	Joanne	British Mountaineering Council	GBR	\N	F
1000068	Carling	Heather	British Mountaineering Council	GBR	2000	F
1000584	Corrigan	Claudia	British Mountaineering Council	GBR	\N	F
1000420	Bell	Joseph	British Mountaineering Council	GBR	\N	M
1000585	Crofts	Lizzie	British Mountaineering Council	GBR	\N	F
1000623	Pheasant	Amber	British Mountaineering Council	GBR	\N	F
1000625	Pimblett	Joanne	British Mountaineering Council	GBR	\N	F
1000628	Scott	Juliey	British Mountaineering Council	GBR	\N	F
1000631	Slater	Tess	British Mountaineering Council	GBR	\N	F
13250	Morrison	Kitty	British Mountaineering Council	GBR	1999	F
9744	Garden	Charlotte	British Mountaineering Council	GBR	1994	F
1000591	Farley	Ella	British Mountaineering Council	GBR	2000	F
9740	Frugtniet	Rhoslyn	British Mountaineering Council	GBR	1994	F
57750	Neame	Jo	British Mountaineering Council	GBR	1999	F
57450	Toothill	Holly	British Mountaineering Council	GBR	2001	F
1000643	Wood	Ruby	British Mountaineering Council	GBR	2003	F
1000651	Buenaventura	Kimberley	British Mountaineering Council	GBR	\N	F
1000427	Churcher	John	British Mountaineering Council	GBR	\N	M
1000428	Clarke	Charlie	British Mountaineering Council	GBR	\N	M
1000429	Cook	Robert	British Mountaineering Council	GBR	\N	M
1000432	Etchells	Mike	British Mountaineering Council	GBR	\N	M
1000435	Halford	Julian	British Mountaineering Council	GBR	\N	M
1000436	Hampton	Rob	British Mountaineering Council	GBR	\N	M
1000437	Hewitt	Reece	British Mountaineering Council	GBR	\N	M
1000440	Knowles	Ollie	British Mountaineering Council	GBR	\N	M
1000441	Leeming	Nigel	British Mountaineering Council	GBR	\N	M
1000442	Mawson	Neil	British Mountaineering Council	GBR	\N	M
1000443	Mayes	Dave	British Mountaineering Council	GBR	\N	M
1000452	Nolan	Mike	British Mountaineering Council	GBR	\N	M
1000453	Oughton	Jake	British Mountaineering Council	GBR	\N	M
1000457	Pratt	Sam	British Mountaineering Council	GBR	\N	M
1000458	Rees	Elis	British Mountaineering Council	GBR	\N	M
1000460	Schofield	Sam	British Mountaineering Council	GBR	\N	M
1000463	Bignold	Elias	British Mountaineering Council	GBR	\N	M
1000465	Smaron	Piotr	British Mountaineering Council	GBR	\N	M
1000617	Murtagh-Cox	Alice	British Mountaineering Council	GBR	\N	F
1000652	Thompson	Alice	British Mountaineering Council	GBR	\N	F
1000494	Coleman	Lee	British Mountaineering Council	GBR	\N	M
1000496	Conlon	Greg	British Mountaineering Council	GBR	\N	M
1000497	Cooper	Patrick	British Mountaineering Council	GBR	\N	M
1000498	Crolla	Joseph	British Mountaineering Council	GBR	\N	M
10488	Wolsey-Heard	Ashleigh	British Mountaineering Council	GBR	1993	M
1000477	Allcock	Matthew	British Mountaineering Council	GBR	1994	M
1000084	Cave	Andy	British Mountaineering Council	GBR	1990	M
1000481	Atkins	Sam	British Mountaineering Council	GBR	1992	M
1000482	Barnes	Simon	British Mountaineering Council	GBR	1989	M
1000485	Bennett	George	British Mountaineering Council	GBR	2003	M
1000489	Burgess	Luke	British Mountaineering Council	GBR	2003	M
1000500	Cunnington	Tim	British Mountaineering Council	GBR	\N	M
1000434	Gilbert	Ryan	British Mountaineering Council	GBR	2002	M
1000438	Hill	Richard	British Mountaineering Council	GBR	1996	M
1000407	Jones	Alex	British Mountaineering Council	GBR	1991	M
1000422	Blackwell	Sam	British Mountaineering Council	GBR	1982	M
1000459	Sanderson	Jonathan	British Mountaineering Council	GBR	1994	M
1000461	Seeley	Danny	British Mountaineering Council	GBR	1996	M
1000415	Symonds	Gavin	British Mountaineering Council	GBR	1979	M
13972	Whaley	Nathan	British Mountaineering Council	GBR	2001	M
1000466	Stead	Ben	British Mountaineering Council	GBR	\N	M
1000495	Collingwood	Ben	British Mountaineering Council	GBR	2001	M
1000397	Ainscough	Jack	British Mountaineering Council	GBR	\N	M
1000492	Clarkson	Jack	British Mountaineering Council	GBR	\N	M
1000406	Hobbs	Thomas	British Mountaineering Council	GBR	\N	M
1000499	Crowe	Thomas	British Mountaineering Council	GBR	\N	M
1000505	Fisher	Francis	British Mountaineering Council	GBR	\N	M
1000511	Gibs	Liewis	British Mountaineering Council	GBR	\N	M
1000513	Goldsbrough	Ian	British Mountaineering Council	GBR	\N	M
1000516	Greenhalgh	Albert	British Mountaineering Council	GBR	\N	M
1000518	Hart	Andrew	British Mountaineering Council	GBR	\N	M
1000524	Johnson	Marjorie	British Mountaineering Council	GBR	\N	M
1000525	Jones	Martin	British Mountaineering Council	GBR	\N	M
1000526	De Iongh	Philip	British Mountaineering Council	GBR	\N	M
1000527	Keeling	Oliver	British Mountaineering Council	GBR	\N	M
1000528	Knightley	Steve	British Mountaineering Council	GBR	\N	M
1000542	Morley	Dick	British Mountaineering Council	GBR	\N	M
1000544	Musgrove	Dave	British Mountaineering Council	GBR	\N	M
1000547	Pearmain	Jonathan	British Mountaineering Council	GBR	\N	M
1000553	Smith	Andi	British Mountaineering Council	GBR	\N	M
1000554	Smith	Jacob	British Mountaineering Council	GBR	\N	M
1000557	Stuck	Jesse	British Mountaineering Council	GBR	\N	M
1000558	Tilley	Simon	British Mountaineering Council	GBR	\N	M
1000559	Timms	Oliver	British Mountaineering Council	GBR	\N	M
1000560	Timms	Ryan	British Mountaineering Council	GBR	\N	M
11799	Potokar	Hamish	British Mountaineering Council	GBR	1996	M
1000118	Ogston-West	Heather	British Mountaineering Council	GBR	1982	F
13179	Watkin	Pippa	British Mountaineering Council	GBR	2001	F
1000653	Adams	Isabelle	British Mountaineering Council	GBR	\N	F
1000041	MacDougall	Katherine	British Mountaineering Council	GBR	2000	F
2000001	Bagnall-Smith	Imi	British Mountaineering Council	GBR	2000	F
2000002	Barnett	Lauren	British Mountaineering Council	GBR	2003	F
2000003	Barson	Connie	British Mountaineering Council	GBR	1996	F
2000005	Biggs	Storme	British Mountaineering Council	GBR	1994	F
2000007	Booth	Marijke	British Mountaineering Council	GBR	2003	F
2000013	Cheng	Sophie	British Mountaineering Council	GBR	1985	F
2000010	Briggs	Rachel	British Mountaineering Council	GBR	1979	F
2000024	French	Hannah	British Mountaineering Council	GBR	1994	F
2000012	Caley	Faye	British Mountaineering Council	GBR	1985	F
2000015	Collins	Matilda	British Mountaineering Council	GBR	2004	F
2000016	Crossley	Stacey	British Mountaineering Council	GBR	1982	F
2000017	Darby	Cosette	British Mountaineering Council	GBR	1994	F
2000018	Downs	Ellen	British Mountaineering Council	GBR	1997	F
2000019	Fan	Antonia	British Mountaineering Council	GBR	1995	F
2000020	Fforde	Madeleine	British Mountaineering Council	GBR	1988	F
2000021	Fidler	Grace	British Mountaineering Council	GBR	2000	F
2000022	Fillingham	Saveena	British Mountaineering Council	GBR	2005	F
2000023	Flockhart	Louise	British Mountaineering Council	GBR	2004	F
2000026	Gilbert	Josephine	British Mountaineering Council	GBR	1972	F
2000027	Grommell	Nina	British Mountaineering Council	GBR	1988	F
2000028	Harrold	Lianne	British Mountaineering Council	GBR	1981	F
2000029	Hinsley	Hollie	British Mountaineering Council	GBR	1996	F
2000030	Jones	Lorna	British Mountaineering Council	GBR	1991	F
2000033	Lounds	Becca	British Mountaineering Council	GBR	1976	F
2000034	Love	Jade	British Mountaineering Council	GBR	1989	F
1000003	Czubkowski	Joe	British Mountaineering Council	GBR	2000	M
2000035	Lyons	Sarah	British Mountaineering Council	GBR	1994	F
2000037	Mclanaghan	Annetta	British Mountaineering Council	GBR	1993	F
2000038	Moore	Erica	British Mountaineering Council	GBR	1994	F
1000033	Prior	Samuel	British Mountaineering Council	GBR	2000	M
2000039	Moran	Carmel	British Mountaineering Council	GBR	1998	F
59030	Horrocks	Imogen	British Mountaineering Council	GBR	1999	F
1000045	Lubczynskyj	Martha	British Mountaineering Council	GBR	2001	F
70752	Peetermans	Zoé	British Mountaineering Council	GBR	2001	F
1000046	Stephens	Rebecca	British Mountaineering Council	GBR	2001	F
65104	Smith	Hannah	British Mountaineering Council	GBR	2000	F
57446	Phillips	Emily	British Mountaineering Council	GBR	2002	F
1000232	Bacmeister	Ellie	British Mountaineering Council	GBR	1990	F
1000561	Tomison	Patrick	British Mountaineering Council	GBR	\N	M
1000562	Townsend	Sam	British Mountaineering Council	GBR	\N	M
1000565	Turton	Dewi	British Mountaineering Council	GBR	\N	M
1000566	Tyler	Andrew	British Mountaineering Council	GBR	\N	M
1000569	Ward	Joe	British Mountaineering Council	GBR	\N	M
1000571	Whiteley	Lewis	British Mountaineering Council	GBR	\N	M
1000573	Wither	James	British Mountaineering Council	GBR	\N	M
1000510	Gibbs	Lewis	British Mountaineering Council	GBR	1991	M
1000657	Partridge	Jonathan	British Mountaineering Council	GBR	\N	M
1000504	Fisher	Andrew	British Mountaineering Council	GBR	1992	M
1000506	Freeman	Alexander	British Mountaineering Council	GBR	1996	M
1000517	Gregory	Kyle	British Mountaineering Council	GBR	1990	M
1000521	Hinkley	James	British Mountaineering Council	GBR	1995	M
1000523	Hughes	David	British Mountaineering Council	GBR	1989	M
1000531	Lomax	David	British Mountaineering Council	GBR	1989	M
1000539	Miah	Tony	British Mountaineering Council	GBR	1967	M
1000540	Montisci	Alex	British Mountaineering Council	GBR	1994	M
1000543	Morris	Arthur	British Mountaineering Council	GBR	1990	M
1000546	Peacey	Matt	British Mountaineering Council	GBR	1996	M
1000550	Rafferty	Matthew	British Mountaineering Council	GBR	1994	M
1000551	Seery	Sean	British Mountaineering Council	GBR	1992	M
1000556	Stevens	Ian	British Mountaineering Council	GBR	1990	M
1000574	Woodhead	Kieran	British Mountaineering Council	GBR	1989	M
6416	West	Ben	British Mountaineering Council	GBR	1990	M
7627	Whittaker	Pete	British Mountaineering Council	GBR	1990	M
1000564	Turner	Jack	British Mountaineering Council	GBR	\N	M
1000537	Maxwell-Stewart	Peter	British Mountaineering Council	GBR	1985	M
1000369	Cameron	Thea	British Mountaineering Council	GBR	2000	F
1000359	Watterson	Victora	British Mountaineering Council	GBR	1990	F
1000360	Allcock	Natasha	British Mountaineering Council	GBR	1999	F
1000362	Morris	Abigail	British Mountaineering Council	GBR	1999	F
1000364	Culshaw	Poppy	British Mountaineering Council	GBR	1999	F
1000365	Read	Molly	British Mountaineering Council	GBR	1999	F
1000366	Cairns	Bronagh	British Mountaineering Council	GBR	1999	F
1000367	Kiggins	Asha	British Mountaineering Council	GBR	1999	F
1000363	Cox	Ellie	British Mountaineering Council	GBR	2000	F
1000361	Roberts	Yasmin	British Mountaineering Council	GBR	2000	F
1000383	Sykes	Brennan	British Mountaineering Council	GBR	1999	M
1000384	Golder	John	British Mountaineering Council	GBR	1999	M
1000391	Miah	Alex	British Mountaineering Council	GBR	1999	M
1000358	Donnelley	Hannah	British Mountaineering Council	GBR	1990	F
312	Parry	Gareth	British Mountaineering Council	GBR	1973	M
11092	Bosi	Alexander	British Mountaineering Council	GBR	1996	M
12517	Cousins	Matthew	British Mountaineering Council	GBR	1989	M
13415	Roberts	Aidan	British Mountaineering Council	GBR	1998	M
1000656	Miedzybrodzki	David	British Mountaineering Council	GBR	\N	M
10709	Phillips	Nathan	British Mountaineering Council	GBR	1994	M
10493	Ridal	Billy	British Mountaineering Council	GBR	1997	M
10963	Pope	Jim	British Mountaineering Council	GBR	1998	M
12195	Murphy	Luke	British Mountaineering Council	GBR	1998	M
11724	Ayrton	Max	British Mountaineering Council	GBR	1995	M
1000089	Naish	Freddie	British Mountaineering Council	GBR	1990	M
12511	Harker	Cailean	British Mountaineering Council	GBR	1989	M
2000069	Ashman	Joseph	British Mountaineering Council	GBR	1994	M
67553	Walmsley	Joe	British Mountaineering Council	GBR	2000	M
7492	Barrans	David	British Mountaineering Council	GBR	1981	M
10962	Bosi	William	British Mountaineering Council	GBR	1998	M
11522	Coley	Orrin	British Mountaineering Council	GBR	1995	M
2000136	Leviten	Gil	British Mountaineering Council	GBR	1997	M
13131	Parkinson	Louis	British Mountaineering Council	GBR	1991	M
12697	Swales	Joe	British Mountaineering Council	GBR	1995	M
1000563	Turner	Christian	British Mountaineering Council	GBR	1996	M
1000399	Arthur	Sam	British Mountaineering Council	GBR	\N	M
1000403	Fidler	Adam	British Mountaineering Council	GBR	\N	M
1000404	Golder	Alan	British Mountaineering Council	GBR	\N	M
1000405	Harris-Jukes	Dominic	British Mountaineering Council	GBR	\N	M
1000412	Preece	Morgan	British Mountaineering Council	GBR	\N	M
1000414	Sykes	Julian	British Mountaineering Council	GBR	\N	M
1000417	Barker	Ollie	British Mountaineering Council	GBR	\N	M
1000370	Waterhouse	Alex	British Mountaineering Council	GBR	1999	M
1000371	Matthews	Tommy	British Mountaineering Council	GBR	1999	M
1000375	Hobbs	Daniel	British Mountaineering Council	GBR	1999	M
1000376	Oakes	Sammy	British Mountaineering Council	GBR	1999	M
1000377	Villar	Ismael	British Mountaineering Council	GBR	1999	M
1000378	Moore	Alex	British Mountaineering Council	GBR	1999	M
1000380	Hobbs	Luke	British Mountaineering Council	GBR	1999	M
1000385	Domela	Severin	British Mountaineering Council	GBR	1999	M
1000386	Cleverdon	Mikey	British Mountaineering Council	GBR	1999	M
1000659	Jeriomenko	Eduardas	British Mountaineering Council	GBR	\N	M
8190	Feehally	Edward	British Mountaineering Council	GBR	1990	M
12127	Greenall	Thomas	British Mountaineering Council	GBR	1990	M
1000575	Allen	Ciaran	British Mountaineering Council	GBR	\N	M
1000577	Allen	Niall	British Mountaineering Council	GBR	\N	M
1000578	Bennet	Matt	British Mountaineering Council	GBR	\N	M
1000583	Corker	Charles	British Mountaineering Council	GBR	\N	M
1000586	Currie	Neil	British Mountaineering Council	GBR	\N	M
1000589	Edwards	Rhys	British Mountaineering Council	GBR	\N	M
1000593	George	James	British Mountaineering Council	GBR	\N	M
1000596	Heald	Martin	British Mountaineering Council	GBR	\N	M
1000597	Hicks	Joshua	British Mountaineering Council	GBR	\N	M
1000598	Higginson	Connor	British Mountaineering Council	GBR	\N	M
1000599	Higginson	Daniel	British Mountaineering Council	GBR	\N	M
1000600	Higginson	Gary	British Mountaineering Council	GBR	\N	M
1000603	James	Sebastian	British Mountaineering Council	GBR	\N	M
1000609	Limbu	Sujan	British Mountaineering Council	GBR	\N	M
1000610	Longworth	Carl	British Mountaineering Council	GBR	\N	M
1000611	Maiklem	James	British Mountaineering Council	GBR	\N	M
1000613	Mclaren	Zachary	British Mountaineering Council	GBR	\N	M
1000614	Mews	Phil	British Mountaineering Council	GBR	\N	M
1000618	Nicholls	Coby	British Mountaineering Council	GBR	\N	M
1000619	Nicholls	Mark	British Mountaineering Council	GBR	\N	M
1000620	Nicholson	Bertie	British Mountaineering Council	GBR	\N	M
1000621	O'Leary	Robin	British Mountaineering Council	GBR	\N	M
1000624	Pheasant	Kai	British Mountaineering Council	GBR	\N	M
1000626	Richards	Christopher	British Mountaineering Council	GBR	\N	M
1000632	Snow	Paddy	British Mountaineering Council	GBR	\N	M
1000633	Stevens	Jason	British Mountaineering Council	GBR	\N	M
1000634	Stevens	Reef	British Mountaineering Council	GBR	\N	M
8249	Garden	James	British Mountaineering Council	GBR	1991	M
1000638	Varley-Stephens	Jake	British Mountaineering Council	GBR	\N	M
1000006	Chan	Toby	British Mountaineering Council	GBR	1999	M
1000581	Butterworth	Sam	British Mountaineering Council	GBR	2001	M
1000582	Cooper	Sam	British Mountaineering Council	GBR	1997	M
1000587	Dance	Piers Sebastian Wedgwood	British Mountaineering Council	GBR	1993	M
12652	Dunne	Aiden	British Mountaineering Council	GBR	2000	M
1000601	Hudspith	Nathanael	British Mountaineering Council	GBR	2000	M
1000604	Jones	Mark	British Mountaineering Council	GBR	1990	M
1000615	Milne	Maximillian	British Mountaineering Council	GBR	2000	M
1000637	Turner	Joshua	British Mountaineering Council	GBR	1997	M
1000640	Wheeler	David	British Mountaineering Council	GBR	1981	M
1000641	Wilkinson	Sam	British Mountaineering Council	GBR	1998	M
100327	Hardy	Ben	British Mountaineering Council	GBR	1981	M
8370	Meeks	Ben	British Mountaineering Council	GBR	1980	M
2000144	Milne	Ben	British Mountaineering Council	GBR	1992	M
1000605	Large	Tom	British Mountaineering Council	GBR	1991	M
1000622	Peck	Tim	British Mountaineering Council	GBR	\N	M
1000588	Dangerfield	Thomas	British Mountaineering Council	GBR	\N	M
1000606	Lee	Thomas	British Mountaineering Council	GBR	2000	M
1000646	Rozier	Tanner	British Mountaineering Council	GBR	\N	M
1000647	Oates	Will	British Mountaineering Council	GBR	\N	M
1000649	Rosen	Ake	British Mountaineering Council	GBR	\N	M
6724	Landman	Tyler	British Mountaineering Council	GBR	1999	M
1000645	Graham	Tom	British Mountaineering Council	GBR	\N	M
1000648	Richards	Tom	British Mountaineering Council	GBR	\N	M
2000067	Armes	Tom	British Mountaineering Council	GBR	1993	M
2000077	Biggs	Tom	British Mountaineering Council	GBR	2003	M
2000140	Matthews	Tom	British Mountaineering Council	GBR	1999	M
2000071	Barker	Thomas	British Mountaineering Council	GBR	2000	M
57746	Mcarthur	Hamish	British Mountaineering Council	GBR	2002	M
70740	Xiberras	Joseph	British Mountaineering Council	GBR	2004	M
1000654	Preston	Ben	British Mountaineering Council	GBR	\N	M
2000076	Biggs	Ben	British Mountaineering Council	GBR	2003	M
2000062	Agnew	Darren	British Mountaineering Council	GBR	1992	M
2000064	Akhtar	Dayan	British Mountaineering Council	GBR	2003	M
2000065	Ames	Rich	British Mountaineering Council	GBR	1980	M
2000066	Andrews	James	British Mountaineering Council	GBR	1993	M
2000079	Blair	Peter	British Mountaineering Council	GBR	1995	M
2000068	Armour	Callum	British Mountaineering Council	GBR	1997	M
2000070	Bailey	Craig	British Mountaineering Council	GBR	1987	M
2000072	Bennett	David	British Mountaineering Council	GBR	1965	M
2000073	Bennett	Ian	British Mountaineering Council	GBR	1961	M
2000074	Bennett-Waters	Daniel	British Mountaineering Council	GBR	1987	M
2000078	Bishop	Lloyd	British Mountaineering Council	GBR	1999	M
2000080	Bone	David	British Mountaineering Council	GBR	1987	M
2000081	Boocock	Matthew	British Mountaineering Council	GBR	2003	M
2000082	Botherway	Sam	British Mountaineering Council	GBR	2003	M
2000083	Bottrill	Duncan	British Mountaineering Council	GBR	1990	M
2000084	Bowen	Max	British Mountaineering Council	GBR	1997	M
2000085	Bradley	Dean	British Mountaineering Council	GBR	1971	M
2000086	Brooks	Robert	British Mountaineering Council	GBR	1995	M
2000087	Brown	Zach	British Mountaineering Council	GBR	1985	M
2000088	Brown	Zak	British Mountaineering Council	GBR	2004	M
2000089	Buck	William	British Mountaineering Council	GBR	1994	M
2000090	Bushell	Bradley	British Mountaineering Council	GBR	1993	M
2000092	Chidgey	Patrick	British Mountaineering Council	GBR	1984	M
2000093	Coulthurst	Connor	British Mountaineering Council	GBR	1994	M
1000183	Varela-Christie	Matt	British Mountaineering Council	GBR	1990	M
2000095	Cox	Simon	British Mountaineering Council	GBR	1962	M
2000096	Cullum	Luke	British Mountaineering Council	GBR	1992	M
2000097	Curtid	Christopher	British Mountaineering Council	GBR	1989	M
2000098	Dale	Cameron	British Mountaineering Council	GBR	2001	M
2000100	Davis	Jake	British Mountaineering Council	GBR	1992	M
2000105	Elder	David	British Mountaineering Council	GBR	1996	M
2000106	Etherington	Ryan	British Mountaineering Council	GBR	1994	M
2000107	Etherington	Sam	British Mountaineering Council	GBR	1999	M
2000108	Evans	Lee	British Mountaineering Council	GBR	1976	M
2000111	Ffitch	Brett	British Mountaineering Council	GBR	1983	M
2000112	Forde	Joshua	British Mountaineering Council	GBR	1993	M
2000115	Gibbs	Samuel	British Mountaineering Council	GBR	1998	M
2000118	Grout	Robert	British Mountaineering Council	GBR	1988	M
2000119	Haithwaite	Elliot	British Mountaineering Council	GBR	1994	M
2000120	Hall	Rhys	British Mountaineering Council	GBR	2001	M
2000121	Halliday	Oliver	British Mountaineering Council	GBR	1991	M
2000122	Hebdon	George	British Mountaineering Council	GBR	1992	M
2000123	Hebdon	Harry	British Mountaineering Council	GBR	1990	M
2000124	Hemming	Ollie	British Mountaineering Council	GBR	1992	M
2000126	Hithersay	Alex	British Mountaineering Council	GBR	1990	M
2000127	Holmes	Alastair	British Mountaineering Council	GBR	1988	M
2000128	Horley	Cian	British Mountaineering Council	GBR	1999	M
2000129	Hornsby	James	British Mountaineering Council	GBR	1995	M
2000130	Jebb	Will	British Mountaineering Council	GBR	1991	M
2000131	Jewitt	Jake	British Mountaineering Council	GBR	1994	M
2000132	Knowles	Rob	British Mountaineering Council	GBR	1998	M
2000133	Knowles	William	British Mountaineering Council	GBR	2004	M
2000134	Lee	Dan	British Mountaineering Council	GBR	1992	M
2000135	Leong	Jeremy	British Mountaineering Council	GBR	1989	M
2000139	MacKenzie	Dougal	British Mountaineering Council	GBR	1994	M
2000141	Mawer	Finn	British Mountaineering Council	GBR	2001	M
2000142	Meacher	Adrian	British Mountaineering Council	GBR	1998	M
2000143	Mercier	Elio	British Mountaineering Council	GBR	1993	M
2000145	Mitchell	Dan	British Mountaineering Council	GBR	1998	M
2000109	Farnsworth	Ben	British Mountaineering Council	GBR	1994	M
2000099	Dale	Henry	British Mountaineering Council	GBR	1993	M
2000103	Doyle	Thomas	British Mountaineering Council	GBR	2000	M
2000116	Gilligan	Thomas	British Mountaineering Council	GBR	1997	M
2000146	Murray-Chadfield	Daniel	British Mountaineering Council	GBR	1999	M
2000147	Neale	Simon	British Mountaineering Council	GBR	1981	M
2000150	O'Brien	Josiah	British Mountaineering Council	GBR	1995	M
2000151	Oliver-Towers	Harry	British Mountaineering Council	GBR	2003	M
2000153	Parker	Richard	British Mountaineering Council	GBR	1984	M
2000154	Parkinson	Daniel	British Mountaineering Council	GBR	2000	M
2000155	Perritt	Robert	British Mountaineering Council	GBR	1991	M
2000156	Philips	Rhys	British Mountaineering Council	GBR	2003	M
2000157	Pickard	Toby	British Mountaineering Council	GBR	1998	M
2000158	Pole	Christopher	British Mountaineering Council	GBR	1989	M
2000160	Price	Seth	British Mountaineering Council	GBR	1989	M
2000161	Purdie	Joshua	British Mountaineering Council	GBR	1999	M
2000162	Quinn	Joshua	British Mountaineering Council	GBR	2003	M
2000163	Radcliffe	Sam	British Mountaineering Council	GBR	1990	M
2000165	Richards	Graham	British Mountaineering Council	GBR	1988	M
2000166	Richardson	Jacob	British Mountaineering Council	GBR	1999	M
2000168	Rossiter	Katie	British Mountaineering Council	GBR	1994	M
2000169	Rumsey	Lewis	British Mountaineering Council	GBR	1990	M
2000171	Schoenberg	James	British Mountaineering Council	GBR	2004	M
2000174	Smith	Cameron	British Mountaineering Council	GBR	1995	M
2000175	Smith	Edward	British Mountaineering Council	GBR	1992	M
2000179	Storey	Ryan	British Mountaineering Council	GBR	1991	M
2000180	Strickland	Matthew	British Mountaineering Council	GBR	2001	M
2000181	Sturgeon	Callum	British Mountaineering Council	GBR	2000	M
2000182	Swann	Callum	British Mountaineering Council	GBR	1994	M
2000184	Thickett	Joe	British Mountaineering Council	GBR	1995	M
2000187	Watts	Joey	British Mountaineering Council	GBR	1991	M
2000188	Weight	Gordon	British Mountaineering Council	GBR	1995	M
100573	Wither	James	British Mountaineering Council	GBR	1995	M
2000190	Wong	Matthew	British Mountaineering Council	GBR	1984	M
2000193	Yeomanson	Dan	British Mountaineering Council	GBR	1976	M
2000194	Yeung	Edward	British Mountaineering Council	GBR	1992	M
2000149	Norman	Ben	British Mountaineering Council	GBR	1993	M
2000172	Shaw	Tom	British Mountaineering Council	GBR	1997	M
2000176	Soar	Tom	British Mountaineering Council	GBR	1990	M
2000178	Stopford	Tom	British Mountaineering Council	GBR	2001	M
2000185	Turner	Michael	British Mountaineering Council	GBR	2002	M
2000167	Rintoul	Henry	British Mountaineering Council	GBR	2001	M
2000192	Wright	Tim	British Mountaineering Council	GBR	1995	M
2000183	Teece	Thomas	British Mountaineering Council	GBR	1996	M
2000189	Wheeler	Thomas	British Mountaineering Council	GBR	1990	M
2000191	Wright	Thomas	British Mountaineering Council	GBR	1994	M
1000335	Watkin	Luke	British Mountaineering Council	GBR	1990	M
1000189	Prior	Sam	British Mountaineering Council	GBR	1990	M
1000387	Downie	Ross	British Mountaineering Council	GBR	1999	M
1000388	Forrest	Kieran	British Mountaineering Council	GBR	1999	M
1000390	Crossley	Myles	British Mountaineering Council	GBR	1999	M
1000392	Blackmore	Ryan	British Mountaineering Council	GBR	1999	M
1000394	Shiel	Elliot	British Mountaineering Council	GBR	1999	M
1000658	Langlands	Rhys	British Mountaineering Council	GBR	\N	M
1000655	McIlwraith	Fraser	British Mountaineering Council	GBR	\N	M
1000396	Ward	Theo	British Mountaineering Council	GBR	1989	M
1000389	Ramsden	Jack	British Mountaineering Council	GBR	1999	M
1000393	Meadowcroft	Tom	British Mountaineering Council	GBR	1999	M
1000373	Adams	Michael	British Mountaineering Council	GBR	1991	M
1000379	Wardroper	Henry	British Mountaineering Council	GBR	1999	M
1000395	Todman	Henry	British Mountaineering Council	GBR	1993	M
1000372	Blair	Peter	British Mountaineering Council	GBR	1999	M
2000040	Morgan	Gwen	British Mountaineering Council	GBR	2005	F
2000041	Neville	Michelle	British Mountaineering Council	GBR	1992	F
2000042	Ollerenshaw	Anna	British Mountaineering Council	GBR	1991	F
2000043	Pashley	Sarah	British Mountaineering Council	GBR	1995	F
2000044	Petty	Scarlett	British Mountaineering Council	GBR	1996	F
2000045	Pigott	Jasmine	British Mountaineering Council	GBR	1992	F
2000047	Porter	Corrie	British Mountaineering Council	GBR	1993	F
2000048	Robinson	Hester	British Mountaineering Council	GBR	1976	F
2000051	Soar	Clare	British Mountaineering Council	GBR	1986	F
2000052	Steele	Katie	British Mountaineering Council	GBR	1990	F
2000053	Stimson	Andrea	British Mountaineering Council	GBR	1963	F
2000055	Vasic	Tilly	British Mountaineering Council	GBR	2004	F
2000059	Woodley	Beth	British Mountaineering Council	GBR	1994	F
2000060	Wright	Amy	British Mountaineering Council	GBR	1975	F
1000639	Warren	Ettie	British Mountaineering Council	GBR	\N	F
\.


--
-- Data for Name: competitions; Type: TABLE DATA; Schema: public; Owner: timhatch
--

COPY competitions (wet_id, city, date, title, routes, cats) FROM stdin;
1611	Wroclaw		World Games 2017	{"5": {"0": {"quota": 6, "title": "qualification", "locked": true, "starters": true}, "2": {"quota": 0, "title": "final", "locked": false, "starters": true}}, "6": {"0": {"quota": 6, "title": "qualification", "locked": true, "starters": true}, "2": {"quota": 0, "title": "final", "locked": false, "starters": true}}}	{5,6}
1572	Turin	2016-11-01	EGW Test Competition	{}	\N
2	Sheffield	2017-03-18	CWIF 2017	{"1": {"route": 0, "locked": false, "starters": false}, "2": {"route": 1, "locked": false, "starters": false}}	\N
3	Sheffield	2017-07-08	BBC 2017	{"5": {"route": 0, "locked": false, "starters": false}, "6": {"route": 1, "locked": false, "starters": false}}	\N
4	Sheffield	2018-03-07	CWIF 2018	\N	\N
5	Sheffield	2018-07-07	BBC 2018	{}	{}
1	Längenfeld	2016-03-03	Test Competition	{}	\N
6	Manchester	2019-02-23	Team Selection	\N	\N
7	Sheffield	2019-03-04	CWIF 2019	\N	\N
\.


--
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: timhatch
--

COPY results (wet_id, grp_id, per_id, route, start_order, bib_nr, rank_prev_heat, sort_values, tie_breaks, result_jsonb, locked, rank_this_heat) FROM stdin;
4	6	1000173	0	\N	\N	\N	{0,0,0,0}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}}	t	\N
5	6	12517	2	20	\N	2	{1,2,3,7}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"a": 4, "b": 1, "t": 0}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"a": 5, "b": 5, "t": 0}}	t	\N
7	6	10962	3	4	\N	3	{0,0,2,3}	\N	{"p1": {"a": 6, "b": 0, "t": null}, "p2": {"a": 8, "b": 0, "t": null}, "p3": {"a": 3, "b": 1, "t": 0}, "p4": {"a": 3, "b": 2, "t": 0}}	t	\N
7	6	6623	3	5	\N	2	{0,0,1,2}	\N	{"p1": {"a": 5, "b": 0, "t": null}, "p2": {"a": 8, "b": 0, "t": null}, "p3": {"a": 5, "b": 2, "t": 0}, "p4": {"a": 5, "b": 0, "t": null}}	t	\N
7	6	2000067	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	10709	3	6	\N	1	{2,3,4,6}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 2, "b": 2, "t": 2}, "p3": {"a": 3, "b": 2, "t": 0}, "p4": {"a": 2, "b": 1, "t": 0}}	t	\N
7	6	2000069	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000481	0	\N	\N	\N	\N	\N	\N	t	\N
4	6	7492	0	\N	\N	\N	{0,0,0,0}	\N	{"p24": {"a": null, "b": null, "t": null}}	t	\N
2	5	1000230	0	340	\N	0	\N	\N	\N	t	114
2	6	1000300	0	465	\N	\N	\N	\N	\N	t	252
2	6	1000301	0	466	\N	\N	\N	\N	\N	t	252
2	6	1000303	0	468	\N	\N	\N	\N	\N	t	252
7	6	10709	2	20	\N	1	{4,10,4,8}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 3, "b": 3, "t": 3}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 4, "b": 2, "t": 4}}	t	\N
7	6	9046	2	5	\N	16	{3,10,4,15}	\N	{"p1": {"a": 3, "b": 3, "t": 3}, "p2": {"a": 6, "b": 2, "t": 6}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 13, "b": 9, "t": 0}}	t	\N
7	5	11960	2	4	\N	17	{1,3,3,5}	\N	{"p1": {"a": 4, "b": 1, "t": 0}, "p2": {"a": 7, "b": 3, "t": 0}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"a": 3, "b": 1, "t": 3}}	t	\N
7	6	2000092	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000027	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000245	0	\N	\N	\N	{0,0,0,0}	\N	{"p1": {"a": null, "b": null, "t": null}}	t	\N
7	6	12517	0	\N	\N	\N	\N	\N	\N	t	\N
2	6	1000163	0	213	\N	\N	\N	\N	\N	t	252
7	6	2000095	0	\N	\N	\N	\N	\N	\N	t	\N
2	5	1000206	0	274	\N	0	\N	\N	\N	t	114
7	6	2000147	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	11498	2	5	\N	16	{0,0,3,11}	\N	{"p1": {"a": 6, "b": 4, "t": 0}, "p2": {"a": 7, "b": 6, "t": 0}, "p3": {"a": 7, "b": 0, "t": null}, "p4": {"a": 5, "b": 1, "t": 0}}	t	\N
7	6	2000150	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000151	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000156	0	\N	\N	\N	\N	\N	\N	t	\N
5	5	59030	2	15	\N	6	{1,1,4,10}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 3, "t": 0}, "p3": {"a": 5, "b": 5, "t": 0}, "p4": {"a": 4, "b": 1, "t": 0}}	t	\N
7	6	2000157	0	\N	\N	\N	\N	\N	\N	t	\N
4	6	10963	0	\N	\N	\N	{26,29,28,28}	\N	\N	t	\N
4	6	11795	2	8	\N	13	{3,7,4,13}	\N	{"p1": {"": 1, "a": 2, "b": 1, "t": 2}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 4, "b": 4, "t": 4}, "p4": {"a": 7, "b": 7, "t": 0}}	t	\N
2	6	70740	0	113	\N	\N	\N	\N	\N	t	252
7	6	9487	2	6	\N	15	{1,1,1,1}	\N	{"p1": {"a": 5, "b": 0, "t": null}, "p2": {"a": 11, "b": 0, "t": null}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 21, "b": 0, "t": null}}	t	\N
4	6	12697	0	\N	\N	\N	{27,29,27,27}	\N	\N	t	\N
4	6	1000575	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000464	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
1	6	6550	2	2	\N	5	{0,0,0,0}	\N	{"p1": {"a": null, "b": null, "t": null}}	f	\N
1	6	6623	2	1	\N	6	{0,0,0,0}	\N	{"p1": {"a": null, "b": null, "t": null}, "p4": {"a": null, "b": null, "t": null}}	f	\N
1	6	7492	2	4	\N	2	\N	\N	\N	f	\N
1	6	5694	2	5	\N	2	\N	\N	\N	f	\N
7	5	57446	2	11	\N	9	{2,2,3,10}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 10, "b": 8, "t": 0}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
7	5	12930	2	9	\N	12	{2,5,3,3}	\N	{"p1": {"a": 4, "b": 1, "t": 4}, "p2": {"a": 6, "b": 1, "t": 0}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
5	6	1000033	2	9	\N	13	{0,0,2,7}	\N	{"p1": {"a": 7, "b": 4, "t": 0}, "p2": {"a": 5, "b": 3, "t": 0}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 7, "b": 0, "t": null}}	t	\N
4	6	1000648	0	\N	\N	\N	\N	\N	\N	t	\N
2	6	1000021	0	284	\N	\N	\N	\N	\N	t	252
1572	63	50698	0	2	\N	0	{0,0,0,0}	\N	{"p1": {"a": 2, "b": null, "t": null}}	t	4
5	5	1000650	2	2	\N	19	{1,2,2,4}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 6, "b": 0, "t": null}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 4, "b": 2, "t": 0}}	t	\N
7	6	10493	2	8	\N	11	{0,0,2,5}	\N	{"p1": {"a": 5, "b": 0, "t": null}, "p2": {"a": 12, "b": 0, "t": null}, "p3": {"a": 3, "b": 2, "t": 0}, "p4": {"a": 7, "b": 3, "t": 0}}	t	\N
7	5	12856	2	8	\N	13	{1,1,1,1}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 7, "b": 0, "t": null}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 8, "b": 0, "t": null}}	t	\N
7	6	1000266	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000173	0	\N	\N	\N	\N	\N	\N	t	\N
1611	5	6326	-8	2	\N	0	\N	\N	\N	t	4
5	5	65104	3	3	\N	4	{3,7,3,6}	\N	{"p1": {"": 1, "a": 1, "b": 1, "t": 1}, "p2": {"a": 8, "b": 0, "t": null}, "p3": {"a": 2, "b": 2, "t": 2}, "p4": {"a": 4, "b": 3, "t": 4}}	t	\N
7	6	57746	2	10	\N	11	{1,4,4,12}	\N	{"p1": {"a": 4, "b": 4, "t": 4}, "p2": {"a": 7, "b": 4, "t": 0}, "p3": {"a": 5, "b": 1, "t": 0}, "p4": {"a": 6, "b": 3, "t": 0}}	t	\N
7	6	6623	2	9	\N	11	{3,4,4,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 5, "b": 2, "t": 0}}	t	\N
7	6	10625	2	11	\N	8	{0,0,2,11}	\N	{"p1": {"a": 6, "b": 0, "t": null}, "p2": {"a": 7, "b": 0, "t": null}, "p3": {"a": 5, "b": 4, "t": 0}, "p4": {"a": 8, "b": 7, "t": 0}}	t	\N
2	6	6416	0	75	\N	\N	\N	\N	\N	t	252
2	5	1000120	0	85	\N	0	\N	\N	\N	t	114
2	6	1000179	0	232	\N	\N	\N	\N	\N	t	252
7	6	1000615	2	12	\N	8	{1,5,2,5}	\N	{"p1": {"a": 4, "b": 3, "t": 0}, "p2": {"a": 10, "b": 0, "t": null}, "p3": {"a": 7, "b": 0, "t": null}, "p4": {"a": 5, "b": 2, "t": 5}}	t	\N
7	6	8870	2	14	\N	7	{3,4,3,4}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 17, "b": 0, "t": null}}	t	\N
7	5	10489	2	10	\N	11	{2,7,4,9}	\N	{"p1": {"a": 5, "b": 1, "t": 0}, "p2": {"a": 4, "b": 4, "t": 4}, "p3": {"a": 4, "b": 1, "t": 0}, "p4": {"a": 3, "b": 3, "t": 3}}	t	\N
7	5	8101	2	13	\N	8	{2,4,4,4}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"a": 4, "b": 1, "t": 0}, "p4": {"a": 4, "b": 1, "t": 0}}	t	\N
7	5	1000514	0	\N	\N	\N	{12,16,16,20}	\N	{"p1": {"b": 1}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 3, "t": 3}, "p22": {"b": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
2	6	1000140	0	150	\N	\N	\N	\N	\N	t	252
2	5	1000038	0	302	\N	0	\N	\N	\N	t	114
2	6	1000218	0	142	\N	\N	\N	\N	\N	t	252
4	5	52305	2	15	\N	6	{1,1,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 6, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
7	6	13127	2	13	\N	8	{3,12,3,8}	\N	{"p1": {"a": 3, "b": 3, "t": 3}, "p2": {"a": 2, "b": 2, "t": 2}, "p3": {"a": 7, "b": 3, "t": 7}, "p4": {"a": 19, "b": 0, "t": null}}	t	\N
7	6	10963	2	16	\N	5	{2,5,4,7}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 3, "b": 3, "t": 3}, "p3": {"a": 3, "b": 1, "t": 0}, "p4": {"a": 6, "b": 1, "t": 0}}	t	\N
5	5	1000045	2	4	\N	17	{1,1,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 5, "b": 0, "t": null}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"a": 4, "b": 1, "t": 0}}	t	\N
7	5	12655	2	16	\N	5	{1,2,3,5}	\N	{"p1": {"a": 5, "b": 2, "t": 0}, "p2": {"a": 8, "b": 0, "t": null}, "p3": {"a": 2, "b": 2, "t": 0}, "p4": {"a": 2, "b": 1, "t": 2}}	t	\N
4	5	57446	2	18	\N	3	{1,1,3,3}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 7, "b": 0, "t": 0}, "p3": {"a": 3, "b": 1, "t": 0}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
2	5	6367	3	6	\N	1	{2,2,4,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 3, "b": 2, "t": 0}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 3, "b": 1, "t": 0}}	t	2
2	6	1000189	0	247	\N	\N	\N	\N	\N	t	252
7	5	57750	2	14	\N	7	{1,2,3,4}	\N	{"p1": {"a": 5, "b": 1, "t": 0}, "p2": {"a": 2, "b": 2, "t": 2}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 4, "b": 1, "t": 0}}	t	\N
7	5	9945	2	15	\N	6	{3,4,3,4}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 2, "b": 2, "t": 2}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
7	5	2000058	2	18	\N	3	{3,8,3,5}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"a": 5, "b": 3, "t": 5}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
7	5	1000570	0	\N	\N	\N	{5,6,5,6}	\N	{"p5": {"b": 1, "t": 1}, "p7": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}}	t	\N
2	6	1000195	0	253	\N	\N	\N	\N	\N	t	252
7	5	2000058	3	5	\N	2	{0,0,4,12}	\N	{"p1": {"a": 7, "b": 6, "t": 0}, "p2": {"a": 7, "b": 1, "t": 0}, "p3": {"a": 5, "b": 3, "t": 0}, "p4": {"a": 8, "b": 2, "t": 0}}	t	\N
7	5	10338	3	1	\N	6	{2,2,4,7}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 4, "b": 3, "t": 0}, "p4": {"a": 3, "b": 2, "t": 0}}	t	\N
7	5	8101	3	4	\N	3	{2,6,3,7}	\N	{"p1": {"a": 3, "b": 2, "t": 3}, "p2": {"a": 3, "b": 3, "t": 3}, "p3": {"a": 3, "b": 2, "t": 0}, "p4": {"a": 3, "b": 0}}	t	\N
7	6	5089	3	2	\N	5	{2,3,2,3}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 6, "b": 0, "t": null}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
1611	5	9989	2	4	\N	3	{2,2,2,2}	\N	{"p1": {"a": 8, "b": 0, "t": null}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 6, "b": 0, "t": null}}	t	3
4	6	9785	0	\N	\N	\N	{26,28,27,27}	\N	\N	t	\N
7	5	12670	2	20	\N	1	{2,3,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 11, "b": null, "t": null}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 2, "b": 1, "t": 2}}	t	\N
7	5	11960	0	\N	\N	\N	{21,25,24,28}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p23": {"b": 1, "t": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	2000060	0	\N	\N	\N	{9,10,15,16}	\N	{"p4": {"b": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1}, "p22": {"b": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1}}	t	\N
4	6	1000614	0	\N	\N	\N	{7,8,7,7}	\N	\N	t	\N
4	6	1000638	0	\N	\N	\N	{6,10,6,6}	\N	\N	t	\N
1	6	11183	2	3	\N	4	\N	\N	\N	f	\N
7	5	2000052	0	\N	\N	\N	{7,7,8,8}	\N	{"p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p22": {"b": 1}}	t	\N
7	6	10962	2	19	\N	1	{3,5,4,6}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 2, "b": 2, "t": 2}, "p3": {"a": 2, "b": 1, "t": 2}, "p4": {"a": 6, "b": 2, "t": 0}}	t	\N
7	6	13415	2	17	\N	4	{0,0,2,4}	\N	{"p1": {"a": 5, "b": 0, "t": null}, "p2": {"a": 9, "b": 0, "t": null}, "p3": {"a": 4, "b": 1, "t": 0}, "p4": {"a": 6, "b": 3, "t": 0}}	t	\N
7	5	57450	2	12	\N	9	{1,1,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 11, "b": 0, "t": null}, "p3": {"a": 8, "b": 0, "t": null}, "p4": {"a": 5, "b": 1, "t": 0}}	t	\N
7	6	12509	2	1	\N	20	{0,0,2,5}	\N	{"p1": {"a": 5, "b": 3, "t": 0}, "p2": {"a": 11, "b": null, "t": null}, "p3": {"a": 10, "b": 0, "t": null}, "p4": {"a": 5, "b": 2, "t": 0}}	t	\N
7	5	1000352	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000034	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	10338	2	17	\N	4	{2,2,3,3}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 6, "b": 0, "t": null}, "p3": {"a": 4, "b": 1, "t": 0}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
4	6	50798	0	\N	\N	\N	{28,34,29,29}	\N	\N	t	\N
7	5	13179	2	6	\N	15	{0,0,1,1}	\N	{"p1": {"a": 4, "b": 1, "t": 0}, "p2": {"a": 9, "b": 0, "t": null}, "p3": {"a": 11, "b": 0, "t": null}, "p4": {"a": 9, "b": 0, "t": null}}	t	\N
7	6	7492	2	15	\N	5	{2,2,3,7}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 10, "b": 0, "t": null}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 6, "b": 5, "t": 0}}	t	\N
4	6	12195	0	\N	\N	\N	{28,35,29,29}	\N	\N	t	\N
7	6	5089	2	18	\N	3	{3,7,4,10}	\N	{"p1": {"a": 3, "b": 3, "t": 3}, "p2": {"a": 2, "b": 2, "t": 2}, "p3": {"a": 2, "b": 1, "t": 2}, "p4": {"a": 6, "b": 4, "t": 0}}	t	\N
7	5	13386	2	7	\N	14	{1,3,1,1}	\N	{"p1": {"a": 3, "b": 1, "t": 3}, "p2": {"a": 8, "b": 0, "t": null}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"a": 5, "b": 0, "t": null}}	t	\N
7	6	11522	2	7	\N	14	{1,2,2,3}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 8, "b": 0, "t": null}, "p3": {"a": 3, "b": 1, "t": 0}, "p4": {"a": 7, "b": 0, "t": null}}	t	\N
7	5	907	2	19	\N	2	{2,4,4,6}	\N	{"p1": {"a": 6, "b": 1, "t": 0}, "p2": {"a": 4, "b": 1, "t": 0}, "p3": {"a": 3, "b": 3, "t": 3}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
7	5	9740	2	3	\N	18	{0,0,2,2}	\N	{"p1": {"a": 3, "b": 1, "t": 0}, "p2": {"a": 7, "b": 0, "t": null}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 4, "b": 1, "t": 0}}	t	\N
7	6	2000140	2	2	\N	19	{1,1,2,3}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 7, "b": 0, "t": null}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"a": 4, "b": 2, "t": 0}}	t	\N
7	5	2000031	2	2	\N	19	{1,2,1,1}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"a": 5, "b": 0, "t": null}, "p3": {"a": 4, "b": 0, "t": null}, "p4": {"a": 6, "b": 0, "t": null}}	t	\N
7	6	9537	2	3	\N	18	{3,6,4,12}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 4, "t": 4}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 11, "b": 6, "t": 0}}	t	\N
7	5	10490	2	1	\N	20	{1,2,2,2}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"a": 8, "b": 0, "t": null}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 5, "b": 1, "t": 0}}	t	\N
7	6	12511	2	4	\N	17	{0,0,1,8}	\N	{"p1": {"a": 5, "b": 0, "t": null}, "p2": {"a": 7, "b": 0, "t": null}, "p3": {"a": 7, "b": 0, "t": null}, "p4": {"a": 8, "b": 8, "t": 0}}	t	\N
7	5	10489	3	2	\N	5	{0,0,2,3}	\N	{"p1": {"a": 8, "b": 0}, "p2": {"a": 11, "b": 0}, "p3": {"a": 3, "b": 2, "t": 0}, "p4": {"a": 3, "b": 1, "t": 0}}	t	\N
7	5	2000057	0	\N	\N	\N	{16,17,18,19}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	10962	0	\N	\N	\N	{30,35,30,35}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1, "t": 1}, "p14": {"b": 3, "t": 3}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 2, "t": 2}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
4	6	13415	0	\N	\N	\N	{28,28,28,28}	\N	\N	t	\N
4	6	10962	0	\N	\N	\N	{28,32,28,28}	\N	\N	t	\N
4	6	9020	0	\N	\N	\N	{28,33,28,28}	\N	\N	t	\N
7	6	2000181	0	\N	\N	\N	{21,26,23,28}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 3, "t": 3}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	9487	0	\N	\N	\N	{27,30,29,32}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p14": {"b": 2, "t": 2}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 2, "t": 2}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	2000038	0	\N	\N	\N	{6,7,8,9}	\N	{"p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 2, "t": 2}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 1}}	t	\N
7	5	9945	3	6	\N	1	{2,3,3,7}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 4, "t": 0}, "p3": {"a": 2, "b": 2, "t": 2}, "p4": {"a": 2, "b": 0}}	t	\N
7	6	9537	3	3	\N	4	{0,0,2,5}	\N	{"p1": {"a": 12, "b": 0, "t": null}, "p2": {"a": 15, "b": 0, "t": null}, "p3": {"a": 5, "b": 2, "t": 0}, "p4": {"a": 4, "b": 3, "t": 0}}	t	\N
7	5	907	3	3	\N	4	{3,6,3,4}	\N	{"p1": {"a": 3, "b": 1, "t": 3}, "p2": {"a": 7, "b": 0}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 2, "b": 2, "t": 2}}	t	\N
7	6	9046	3	1	\N	6	{0,0,3,18}	\N	{"p1": {"a": 5, "b": 2, "t": 0}, "p2": {"a": 21, "b": 15, "t": 0}, "p3": {"a": null, "b": 1, "t": 0}, "p4": {"a": 3, "b": 0, "t": null}}	t	\N
4	6	1000518	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000340	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000601	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000603	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000527	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
7	5	12655	0	\N	\N	\N	{23,26,24,27}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 3, "t": 3}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p14": {"b": 0, "t": 0}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000204	0	\N	\N	\N	{28,37,30,39}	\N	{"p1": {"b": 2, "t": 2}, "p2": {"b": 1, "t": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p13": {"b": 3, "t": 3}, "p14": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 2, "t": 2}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 2, "t": 2}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000269	0	\N	\N	\N	{12,14,14,16}	\N	{"p1": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 2, "t": 2}}	t	\N
7	6	10963	0	\N	\N	\N	{28,29,30,31}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 2, "t": 2}, "p14": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000169	0	\N	\N	\N	{8,10,10,12}	\N	{"p1": {"b": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 2, "t": 2}}	t	\N
7	6	1000340	0	\N	\N	\N	{13,13,16,16}	\N	{"p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p24": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	2000184	0	\N	\N	\N	{9,13,10,14}	\N	{"p1": {"a": null, "b": null, "t": null}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 3, "t": 3}, "p22": {"b": 2, "t": 2}}	t	\N
4	6	1000542	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000544	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
2	5	1000307	0	472	\N	0	{2,2,2,2}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}}	t	102
7	6	2000199	0	\N	\N	\N	{12,14,12,14}	\N	{"p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p27": {"b": 2, "t": 2}, "p29": {"b": 1, "t": 1}}	t	\N
7	5	2000352	0	\N	\N	\N	{4,5,8,9}	\N	{"p4": {"b": 1}, "p5": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 2, "t": 2}, "p18": {"b": 1}, "p22": {"b": 1}, "p26": {"b": 1}}	t	\N
5	5	1000651	2	6	\N	15	{1,3,2,2}	\N	{"p1": {"": 3, "a": 3, "b": 1, "t": 3}, "p2": {"a": 4, "b": 0, "t": null}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"a": 3, "b": 1, "t": 0}}	t	\N
4	6	1000452	0	\N	\N	\N	{2,2,2,2}	\N	\N	t	\N
7	6	2000356	0	\N	\N	\N	{21,23,24,26}	\N	{"p1": {"b": 2, "t": 2}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
4	6	9940	0	\N	\N	\N	{28,36,28,28}	\N	\N	t	\N
4	6	6416	0	\N	\N	\N	{27,31,29,29}	\N	\N	t	\N
4	6	11522	0	\N	\N	\N	{27,29,28,28}	\N	\N	t	\N
4	6	11150	0	\N	\N	\N	{27,31,28,28}	\N	\N	t	\N
7	5	2000011	0	\N	\N	\N	{11,15,16,20}	\N	{"p1": {"b": 1, "t": 0}, "p2": {"b": 1}, "p4": {"b": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 4, "t": 4}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	5	8101	0	\N	\N	\N	{22,24,27,29}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 2, "t": 2}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	5	8101	2	19	\N	2	{2,3,2,2}	\N	{"p1": {"a": 15, "b": 0, "t": null}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 3, "b": 0, "t": null}}	t	3
4	6	52665	0	\N	\N	\N	{26,32,27,27}	\N	\N	t	\N
4	6	1000615	0	\N	\N	\N	{26,28,26,26}	\N	\N	t	\N
7	6	2000194	0	\N	\N	\N	{14,14,19,19}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"a": null, "b": null, "t": null}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1}, "p25": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000641	0	\N	\N	\N	{15,16,17,18}	\N	{"p1": {"b": 2, "t": 2}, "p2": {"b": 0, "t": 0}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p25": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000220	0	\N	\N	\N	{18,20,20,22}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	2000102	0	\N	\N	\N	{14,18,16,20}	\N	{"p1": {"b": 2, "t": 2}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 0, "t": 0}, "p21": {"b": 1, "t": 1}, "p22": {"b": 3, "t": 3}, "p25": {"b": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}}	t	\N
7	6	8370	0	\N	\N	\N	{20,21,21,22}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
4	6	9425	0	\N	\N	\N	{26,28,28,28}	\N	\N	t	\N
7	6	2000163	0	\N	\N	\N	{20,22,22,24}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	6	1000131	0	132	\N	\N	{16,19,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	73
2	5	1000072	0	375	\N	0	\N	\N	\N	t	114
1611	5	10338	-8	3	\N	0	\N	\N	\N	t	1
4	6	1000411	0	\N	\N	\N	{26,30,26,26}	\N	\N	t	\N
4	6	1000027	0	\N	\N	\N	{26,31,26,26}	\N	\N	t	\N
7	6	1000025	0	\N	\N	\N	{22,24,26,28}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 3, "t": 3}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 0}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	2000004	0	\N	\N	\N	{5,7,7,9}	\N	{"p5": {"b": 2, "t": 2}, "p7": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 2, "t": 2}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}}	t	\N
7	6	10709	0	\N	\N	\N	{30,35,30,35}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 2, "t": 2}, "p14": {"b": 3, "t": 3}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 2, "t": 2}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	1000118	0	\N	\N	\N	{12,16,15,19}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 3, "t": 3}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"a": null, "b": null, "t": null}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 1}, "p27": {"b": 3, "t": 3}, "p29": {"b": 1, "t": 1}}	t	\N
4	6	1000093	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
7	6	2000216	0	\N	\N	\N	{17,21,17,21}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 0, "t": 0}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 3, "t": 3}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
4	6	10333	0	\N	\N	\N	{26,29,28,28}	\N	\N	t	\N
4	6	10984	0	\N	\N	\N	{26,27,26,26}	\N	\N	t	\N
7	6	2000105	0	\N	\N	\N	{18,19,24,25}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p14": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000166	0	\N	\N	\N	{21,29,22,30}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 3, "t": 3}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 4, "t": 4}, "p24": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 3, "t": 3}}	t	\N
1572	63	8144	0	5	\N	0	\N	\N	\N	t	6
7	6	70740	0	\N	\N	\N	{21,25,25,29}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p24": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 3, "t": 3}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
1611	5	9731	-8	6	\N	0	\N	\N	\N	t	8
4	6	1000388	0	\N	\N	\N	{25,29,27,27}	\N	\N	t	\N
4	6	1000183	0	\N	\N	\N	{25,31,25,25}	\N	\N	t	\N
7	6	2000217	0	\N	\N	\N	{15,19,21,25}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 2, "t": 2}, "p8": {"b": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 3, "t": 3}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	6	2000192	0	\N	\N	\N	{12,16,13,17}	\N	{"p1": {"a": null, "b": null, "t": null}, "p4": {"b": 3, "t": 3}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 3, "t": 3}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}}	t	\N
7	6	7492	0	\N	\N	\N	{28,29,30,31}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1, "t": 1}, "p14": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 2, "t": 2}, "p20": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000225	0	\N	\N	\N	{7,7,10,10}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 1}, "p27": {"b": 1, "t": 1}}	t	\N
7	6	1000615	0	\N	\N	\N	{28,31,29,32}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p13": {"b": 2, "t": 2}, "p14": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000556	0	\N	\N	\N	{12,15,17,20}	\N	{"p1": {"b": 1}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 3, "t": 3}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	6	1000521	0	\N	\N	\N	{17,19,18,20}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 3, "t": 3}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}}	t	\N
4	6	12697	2	4	\N	17	{0,0,0,0}	\N	{"p1": {"a": 6, "b": 0, "t": null}, "p2": {"a": 4, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}}	t	\N
4	6	1000474	0	\N	\N	\N	{24,27,26,26}	\N	\N	t	\N
7	6	2000073	0	\N	\N	\N	{14,18,16,20}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 2, "t": 2}, "p30": {"b": 1}}	t	\N
7	6	2000080	0	\N	\N	\N	{20,21,22,23}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 0, "t": 0}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p24": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	70752	0	\N	\N	\N	{19,20,23,24}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p9": {"b": 1, "t": 0}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"a": null, "b": null, "t": null}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	1000210	0	\N	\N	\N	{12,18,14,20}	\N	{"p1": {"b": 1}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 3, "t": 3}, "p17": {"b": 1, "t": 1}, "p18": {"b": 3, "t": 3}, "p21": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 2, "t": 2}, "p30": {"b": 1}}	t	\N
7	6	2000154	0	\N	\N	\N	{10,11,11,12}	\N	{"p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	6	1000014	0	\N	\N	\N	{24,25,25,26}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
3	5	10936	0	24	\N	1	{5,9,5,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 3, "b": 1, "t": 3}, "p5": {"a": 3, "b": 1, "t": 3}}	t	9
7	5	13535	0	\N	\N	\N	{18,19,24,25}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	6	2000087	0	\N	\N	\N	{9,10,13,14}	\N	{"p1": {"b": 1}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 0, "t": 0}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	5	1000046	0	\N	\N	\N	{19,22,21,24}	\N	{"p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 3, "t": 3}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	9945	0	\N	\N	\N	{23,27,27,31}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 3, "t": 3}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p24": {"b": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
4	6	1000130	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
7	6	1000246	0	\N	\N	\N	{15,16,18,19}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p14": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
4	6	9492	0	\N	\N	\N	{26,29,26,26}	\N	\N	t	\N
7	6	2000089	0	\N	\N	\N	{22,24,25,27}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 0, "t": 0}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1}, "p24": {"b": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	5	10328	2	12	\N	9	{1,1,1,1}	\N	{"p1": {"a": 16, "b": 0, "t": null}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 11, "b": 0, "t": null}, "p4": {"a": 5, "b": 0, "t": null}}	t	10
3	6	11522	0	3	\N	1	{5,8,5,6}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 12, "b": 1, "t": 2}, "p3": {"a": 3, "b": 2, "t": 3}, "p4": {"a": 1, "b": 1, "t": 1}, "p5": {"a": 1, "b": 1, "t": 1}}	t	10
6	6	13415	0	6	\N	\N	{2,5,4,7}	\N	{"p1": {"b": 0}, "p2": {"b": 1}, "p3": {"b": 3, "t": 3}, "p4": {"b": 1}, "p5": {"b": 2, "t": 2}}	t	\N
6	6	6724	0	9	\N	\N	\N	\N	\N	t	\N
4	6	1000003	0	\N	\N	\N	{24,29,25,25}	\N	\N	t	\N
4	6	10488	0	\N	\N	\N	{24,28,24,24}	\N	\N	t	\N
7	6	2000196	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000197	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000091	0	\N	\N	\N	{16,17,19,20}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 0, "t": 0}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	2000193	0	\N	\N	\N	{8,9,14,15}	\N	{"p1": {"b": 1}, "p4": {"b": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 1}, "p22": {"b": 2, "t": 2}, "p28": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	6	1000517	0	\N	\N	\N	{11,13,15,17}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 3, "t": 3}}	t	\N
7	6	2000075	0	\N	\N	\N	{9,10,10,11}	\N	{"p1": {"a": null, "b": null, "t": null}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 2, "t": 2}, "p22": {"b": 1, "t": 1}}	t	\N
7	6	11808	0	\N	\N	\N	{25,25,27,27}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
5	5	11498	2	19	\N	1	{3,4,4,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"a": 4, "b": 2, "t": 0}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
2	6	1000135	0	140	\N	\N	\N	\N	\N	t	252
2	6	1000289	0	453	\N	\N	\N	\N	\N	t	252
7	5	1000008	0	\N	\N	\N	{18,27,19,28}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 0, "t": 0}, "p17": {"b": 1, "t": 1}, "p18": {"b": 3, "t": 3}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 3, "t": 3}, "p25": {"b": 3, "t": 3}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	5	2000009	0	\N	\N	\N	{14,17,16,19}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"a": null, "b": null, "t": null}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 2, "t": 2}, "p30": {"b": 2, "t": 2}}	t	\N
7	6	2000098	0	\N	\N	\N	{8,12,8,12}	\N	{"p5": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p21": {"b": 2, "t": 2}, "p22": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 2, "t": 2}, "p29": {"b": 2, "t": 2}}	t	\N
7	6	5089	0	\N	\N	\N	{29,31,30,32}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1, "t": 1}, "p14": {"b": 2, "t": 2}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	5	70752	0	316	\N	0	{9,12,10,10}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 3}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	42
7	6	2000064	0	\N	\N	\N	{21,25,24,28}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 3, "t": 3}, "p25": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
7	6	2000220	0	\N	\N	\N	{11,11,15,15}	\N	{"p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 1}, "p27": {"b": 1, "t": 1}}	t	\N
7	6	2000159	0	\N	\N	\N	{16,18,18,20}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
4	6	1000427	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000429	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
7	6	1000574	0	\N	\N	\N	{7,10,9,12}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 2, "t": 2}, "p15": {"b": 1, "t": 1}, "p16": {"b": 3, "t": 3}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}}	t	\N
7	5	1000205	0	\N	\N	\N	{8,8,8,8}	\N	{"p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p14": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}}	t	\N
7	5	2000045	0	\N	\N	\N	{4,5,7,8}	\N	{"p5": {"b": 2, "t": 2}, "p7": {"b": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 1}}	t	\N
7	5	59030	0	\N	\N	\N	{19,22,22,25}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	6	1000606	0	\N	\N	\N	{15,15,17,17}	\N	{"p1": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	12697	0	\N	\N	\N	{25,30,26,31}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 2, "t": 2}, "p29": {"b": 1, "t": 1}, "p30": {"b": 3, "t": 3}}	t	\N
2	5	1000310	0	475	\N	0	\N	\N	\N	t	114
7	6	12674	0	\N	\N	\N	{24,28,25,29}	\N	{"p1": {"b": 2, "t": 2}, "p2": {"b": 1, "t": 1}, "p3": {"a": null, "b": null, "t": null}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"a": null, "b": null, "t": null}, "p12": {"b": 1, "t": 1}, "p14": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p20": {"a": null, "b": null, "t": null}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 2, "t": 2}, "p25": {"b": 3, "t": 3}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
5	5	1000046	2	11	\N	10	{1,1,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 6, "b": 0, "t": null}, "p3": {"a": 7, "b": 0, "t": null}, "p4": {"a": 2, "b": 1, "t": 0}}	t	\N
4	6	1000526	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000282	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
7	5	2000007	0	\N	\N	\N	{18,26,18,26}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 3, "t": 3}, "p19": {"b": 2, "t": 2}, "p21": {"b": 2, "t": 2}, "p22": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 3, "t": 3}}	t	\N
7	6	12397	0	\N	\N	\N	{25,26,29,30}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 2, "t": 2}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	13972	0	\N	\N	\N	{26,30,28,32}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p13": {"b": 0, "t": 0}, "p14": {"a": null, "b": null, "t": null}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 3, "t": 3}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000079	0	\N	\N	\N	{20,22,22,24}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p25": {"b": 1, "t": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
4	5	53520	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
2	6	1000180	0	235	\N	\N	{8,9,8,8}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	156
4	6	11808	0	\N	\N	\N	{23,24,25,25}	\N	\N	t	\N
7	6	2000211	0	\N	\N	\N	{18,19,18,19}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000093	0	\N	\N	\N	{13,13,15,15}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p20": {"b": 1, "t": 0}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
1572	63	8173	0	6	\N	0	{0,0,1,1}	\N	{"p1": {"a": 1, "b": 1, "t": null}}	t	1
7	6	2000190	0	\N	\N	\N	{17,18,19,20}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 2, "t": 2}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000205	0	\N	\N	\N	{23,27,23,27}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p20": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000605	0	\N	\N	\N	{13,16,15,18}	\N	{"p1": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 2, "t": 2}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 2, "t": 2}, "p29": {"b": 2, "t": 2}}	t	\N
7	6	1000105	0	\N	\N	\N	{19,21,19,21}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 2, "t": 2}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	64822	0	\N	\N	\N	{16,19,19,22}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 3, "t": 3}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	1000077	0	\N	\N	\N	{23,31,25,33}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 3, "t": 3}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 3, "t": 3}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 3, "t": 3}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}}	t	\N
6	5	11498	0	2	\N	\N	{3,6,4,11}	\N	{"p1": {"a": 1, "b": null}, "p2": {"b": 1, "t": 2}, "p3": {"b": 6}, "p4": {"b": 2, "t": 2}, "p5": {"b": 2, "t": 2}}	t	\N
2	6	1000278	0	442	\N	\N	\N	\N	\N	t	252
7	6	1000415	0	\N	\N	\N	{21,23,27,29}	\N	{"p1": {"b": 2, "t": 2}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p24": {"b": 1}, "p25": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000171	0	\N	\N	\N	{5,6,7,8}	\N	{"p5": {"b": 1}, "p10": {"b": 2, "t": 2}, "p12": {"b": 1}, "p14": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}}	t	\N
5	5	1000369	2	14	\N	7	{1,2,2,2}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"a": 8, "b": 0, "t": null}, "p3": {"a": 9, "b": 0, "t": null}, "p4": {"a": 6, "b": 1, "t": 0}}	t	\N
7	5	10114	0	\N	\N	\N	{19,21,24,26}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p24": {"a": null, "b": null, "t": null}, "p25": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	2000040	0	\N	\N	\N	{19,27,26,34}	\N	{"p1": {"b": 3, "t": 3}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"a": null, "b": null, "t": null}, "p8": {"b": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1}, "p14": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p24": {"b": 1}, "p25": {"b": 3, "t": 3}, "p26": {"b": 3, "t": 3}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
7	6	13127	0	\N	\N	\N	{28,31,30,33}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1}, "p14": {"b": 3, "t": 3}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
6	5	9740	2	5	\N	\N	{0,0,1,4}	\N	{"p1": {"b": 0}, "p2": {"b": 4}, "p3": {"b": 0}, "p4": {"b": 0, "t": 0}}	t	\N
2	6	11183	2	20	\N	1	{2,2,4,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 3, "b": 1, "t": 0}, "p4": {"a": 4, "b": 2, "t": 0}}	t	1
6	5	7052	2	3	\N	\N	{1,7,3,11}	\N	{"p1": {"a": 3, "b": 0}, "p2": {"b": 7, "t": 7}, "p3": {"b": 3}, "p4": {"b": 1, "t": 0}}	t	\N
7	6	2000086	0	\N	\N	\N	{8,8,11,12}	\N	{"p1": {"b": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}}	t	\N
7	6	10625	0	\N	\N	\N	{28,31,29,32}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 2, "t": 2}, "p14": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 2, "t": 2}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000255	0	\N	\N	\N	{10,12,11,13}	\N	{"p1": {"b": 1, "t": 0}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 2, "t": 2}, "p22": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
4	6	11799	0	\N	\N	\N	{26,34,26,26}	\N	\N	t	\N
7	5	1000369	0	\N	\N	\N	{18,21,21,24}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 2, "t": 2}, "p30": {"b": 1}}	t	\N
7	6	2000177	0	\N	\N	\N	{16,17,21,22}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
6	5	65104	2	10	\N	\N	{0,0,2,11}	\N	{"p1": {"b": 0}, "p2": {"b": 0}, "p3": {"b": 3}, "p4": {"b": 8}}	t	\N
6	5	8247	2	7	\N	\N	{2,4,4,4}	\N	{"p1": {"b": 1}, "p2": {"b": 1, "t": 3}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}}	t	\N
2	6	1000227	0	333	\N	\N	\N	\N	\N	t	252
2	6	1000064	0	364	\N	\N	\N	\N	\N	t	252
7	6	2000104	0	\N	\N	\N	{21,24,22,25}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	10489	0	\N	\N	\N	{23,29,23,29}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 3, "t": 3}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p9": {"b": 3, "t": 3}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000094	0	\N	\N	\N	{16,16,18,18}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 0, "t": 0}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	10385	0	\N	\N	\N	{19,23,20,24}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p9": {}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 3, "t": 3}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	2000053	0	\N	\N	\N	{4,8,5,9}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 3, "t": 3}, "p10": {"b": 2, "t": 2}, "p15": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p26": {"b": 1}}	t	\N
6	6	11724	3	4	\N	\N	{0,0,0,0}	\N	{"p2": {"a": 2, "b": 0, "t": null}, "p3": {"a": 3}, "p4": {"a": 4, "b": null, "t": null}}	t	\N
7	6	2000149	0	\N	\N	\N	{23,24,26,27}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 2, "t": 2}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
34	6	9046	2	5	\N	2	{2,3,4,8}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 1, "t": 0}, "p3": {"a": 5, "b": 4, "t": 0}, "p4": {"a": 2, "b": 2, "t": 2}}	t	3
7	6	2000085	0	\N	\N	\N	{17,17,18,18}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000164	0	\N	\N	\N	{17,21,20,24}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 3, "t": 3}, "p20": {"b": 1}, "p21": {"b": 0, "t": 0}, "p22": {"b": 1, "t": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000084	0	\N	\N	\N	{6,9,7,10}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 0, "t": 0}, "p12": {"b": 2, "t": 2}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 3, "t": 3}, "p22": {"b": 1, "t": 1}}	t	\N
7	6	2000148	0	\N	\N	\N	{25,28,25,28}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 3, "t": 3}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 2, "t": 2}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	1000587	0	\N	\N	\N	{20,23,21,24}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 3, "t": 3}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	2000014	0	\N	\N	\N	{12,16,14,18}	\N	{"p1": {"b": 1}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 2, "t": 2}, "p22": {"b": 2, "t": 2}, "p27": {"b": 2, "t": 2}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
5	6	1000412	2	15	\N	7	{1,2,1,2}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 7, "b": 0, "t": null}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 8, "b": 0, "t": null}}	t	\N
2	5	1000318	0	483	\N	0	\N	\N	\N	t	114
7	6	8870	0	\N	\N	\N	{28,30,30,32}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 3, "t": 3}, "p14": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
34	5	9989	2	4	\N	3	{2,2,2,2}	\N	{"p1": {"a": 8, "b": 0, "t": null}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 6, "b": 0, "t": null}}	t	3
7	6	11522	0	\N	\N	\N	{27,28,27,28}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p14": {"b": 0, "t": 0}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 2, "t": 2}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	2000002	0	\N	\N	\N	{18,21,19,22}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 2, "t": 2}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	12511	0	\N	\N	\N	{27,31,28,32}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 3, "t": 3}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 3, "t": 3}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	6	1000001	0	111	\N	\N	{3,5,3,3}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}}	t	245
4	6	1000412	0	\N	\N	\N	{23,27,24,24}	\N	\N	t	\N
4	6	1000005	0	\N	\N	\N	{23,26,23,23}	\N	\N	t	\N
4	6	1000581	0	\N	\N	\N	{23,27,23,23}	\N	\N	t	\N
7	6	2000068	0	\N	\N	\N	{14,15,16,17}	\N	{"p1": {"b": 1, "t": 0}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
5	5	65104	2	13	\N	7	{2,3,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 6, "b": 0, "t": null}, "p3": {"a": 8, "b": 0, "t": null}, "p4": {"a": 2, "b": 1, "t": 2}}	t	\N
4	6	1000444	0	\N	\N	\N	{18,22,18,18}	\N	\N	t	\N
4	6	1000443	0	\N	\N	\N	{18,23,18,18}	\N	\N	t	\N
4	6	1000422	0	\N	\N	\N	{17,23,20,20}	\N	\N	t	\N
7	6	1000183	0	\N	\N	\N	{25,26,29,30}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p14": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000442	0	\N	\N	\N	{23,26,24,27}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 2, "t": 2}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000180	0	\N	\N	\N	{14,18,15,19}	\N	{"p1": {"b": 3, "t": 3}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
7	5	9740	0	\N	\N	\N	{21,25,23,27}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 3, "t": 3}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p9": {"a": null, "b": null, "t": null}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
5	5	9740	2	9	\N	12	{2,2,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 5, "b": 0, "t": null}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
34	5	12039	2	5	\N	2	{3,10,3,8}	\N	{"p1": {"a": 6, "b": 5, "t": 6}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 2, "b": 2, "t": 2}}	t	2
4	6	1000620	0	\N	\N	\N	{23,31,23,23}	\N	\N	t	\N
7	6	2000140	0	\N	\N	\N	{27,32,29,34}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1}, "p14": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 2, "t": 2}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
3	5	1000360	0	7	\N	1	{1,1,3,8}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 5, "b": 5, "t": 0}, "p3": {"a": 2, "b": 2, "t": 0}, "p4": {"a": 1, "b": 0, "t": null}, "p5": {"a": 5, "b": 0, "t": null}}	t	24
2	6	9058	2	17	\N	4	{1,2,2,7}	\N	{"p1": {"a": 7, "b": 0, "t": null}, "p2": {"a": 8, "b": 5, "t": 0}, "p3": {"a": 7, "b": 0, "t": null}, "p4": {"a": 2, "b": 2, "t": 2}}	t	5
7	6	2000166	0	\N	\N	\N	{22,25,24,27}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 3, "t": 3}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
6	6	10962	3	5	\N	\N	{1,6,1,6}	\N	{"p2": {"a": 2, "b": 0, "t": null}, "p3": {"a": 7}, "p4": {"a": 6, "b": 6, "t": 6}}	t	\N
7	5	1000363	0	\N	\N	\N	{9,11,13,15}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1}, "p21": {"b": 2, "t": 2}, "p22": {"b": 1}, "p26": {"b": 2, "t": 2}}	t	\N
7	6	67553	0	\N	\N	\N	{25,30,28,33}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 3, "t": 3}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 3, "t": 3}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 2, "t": 2}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000083	0	\N	\N	\N	{20,21,22,23}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
4	6	11724	0	\N	\N	\N	{0,0,0,0}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 0, "t": null}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 0, "t": null}, "p17": {"a": null, "b": 0, "t": null}, "p18": {"a": null, "b": 0, "t": null}, "p19": {"a": null, "b": 0, "t": null}, "p20": {"a": null, "b": 0, "t": null}, "p21": {"a": null, "b": 0, "t": null}, "p22": {"a": null, "b": 0, "t": null}}	t	\N
7	6	2000107	0	\N	\N	\N	{8,11,9,12}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 3, "t": 3}, "p15": {"b": 1, "t": 1}, "p17": {"b": 2, "t": 2}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}}	t	\N
5	5	1000653	2	16	\N	5	{1,1,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 6, "b": 0, "t": null}, "p3": {"a": 9, "b": 0, "t": null}, "p4": {"a": 3, "b": 1, "t": 0}}	t	\N
7	6	2000153	0	\N	\N	\N	{9,11,13,15}	\N	{"p1": {"b": 1}, "p4": {"b": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p22": {"b": 3, "t": 3}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}}	t	\N
4	6	13127	0	\N	\N	\N	{25,25,26,26}	\N	\N	t	\N
4	6	12511	0	\N	\N	\N	{24,28,27,27}	\N	\N	t	\N
4	6	13972	0	\N	\N	\N	{24,25,25,25}	\N	\N	t	\N
7	6	1000192	0	\N	\N	\N	{19,22,21,24}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 2, "t": 2}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000081	0	\N	\N	\N	{8,10,10,12}	\N	{"p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 2, "t": 2}, "p22": {"a": null, "b": 1, "t": null}}	t	\N
7	6	2000076	0	\N	\N	\N	{9,15,10,16}	\N	{"p1": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 3, "t": 3}, "p22": {"b": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 3, "t": 3}}	t	\N
6	6	7492	3	3	\N	\N	{1,1,3,6}	\N	{"p1": {"a": 3, "b": 3, "t": null}, "p2": {"a": 2, "b": 2, "t": 0}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
7	6	2000161	0	\N	\N	\N	{16,20,18,22}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 3, "t": 3}, "p24": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	2000070	0	\N	\N	\N	{17,19,19,21}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	2000078	0	\N	\N	\N	{9,10,12,13}	\N	{"p1": {"b": 1}, "p4": {"b": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p27": {"b": 2, "t": 2}}	t	\N
7	6	2000074	0	\N	\N	\N	{8,9,9,10}	\N	{"p1": {"a": null, "b": null, "t": null}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p19": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
4	6	1000499	0	\N	\N	\N	{0,0,0,0}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}}	t	\N
7	6	2000062	0	\N	\N	\N	{6,7,7,8}	\N	{"p5": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 1, "t": 1}}	t	\N
7	6	2000072	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000077	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000395	0	\N	\N	\N	{20,25,24,29}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p23": {"b": 2, "t": 2}, "p24": {"b": 1}, "p25": {"b": 3, "t": 3}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
1572	63	50700	0	7	\N	0	\N	\N	\N	t	6
4	6	1000403	0	\N	\N	\N	{23,23,25,25}	\N	\N	t	\N
7	6	2000110	0	\N	\N	\N	{25,31,28,34}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 3, "t": 3}, "p14": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 3, "t": 3}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000304	0	\N	\N	\N	{12,17,14,19}	\N	{"p1": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p22": {"b": 2, "t": 2}, "p27": {"b": 3, "t": 3}, "p29": {"b": 2, "t": 2}}	t	\N
7	6	1000461	0	\N	\N	\N	{15,18,19,22}	\N	{"p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 3, "t": 3}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 2, "t": 2}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	6	2000162	0	\N	\N	\N	{16,18,19,21}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 3, "t": 3}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	12509	0	\N	\N	\N	{26,28,29,31}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 3, "t": 3}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000482	0	\N	\N	\N	{11,12,12,13}	\N	{"p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}}	t	\N
2	5	6849	2	16	\N	5	{1,2,2,4}	\N	{"p1": {"a": 5, "b": 0, "t": null}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"a": 5, "b": 3, "t": 0}, "p4": {"a": 4, "b": 0, "t": null}}	t	11
1611	5	5244	-8	5	\N	0	\N	\N	\N	t	7
2	6	1000240	0	404	\N	\N	{5,5,5,5}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	202
7	6	2000106	0	\N	\N	\N	{10,11,11,12}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}}	t	\N
4	6	12652	0	\N	\N	\N	{23,25,24,24}	\N	\N	t	\N
7	6	1000582	0	\N	\N	\N	{22,27,24,29}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 3, "t": 3}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 2, "t": 2}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p24": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	1000475	0	\N	\N	\N	{17,21,19,23}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 3, "t": 3}, "p23": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
5	6	10709	2	21	\N	1	{2,3,3,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"": 3, "a": 3, "b": 0, "t": null}, "p4": {"a": 4, "b": 3, "t": 0}}	t	\N
7	6	2000103	0	\N	\N	\N	{11,12,15,16}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1}, "p30": {"b": 1}}	t	\N
7	6	100573	0	\N	\N	\N	{16,19,17,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 3, "t": 3}, "p20": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	5	11498	0	\N	\N	\N	{21,24,24,27}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000604	0	\N	\N	\N	{15,20,18,23}	\N	{"p1": {"b": 1}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
5	5	57450	2	17	\N	4	{1,1,3,4}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 3, "b": 2, "t": 0}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 4, "b": 1, "t": 0}}	t	\N
2	5	1000209	0	277	\N	0	\N	\N	\N	t	114
2	6	12517	2	13	\N	8	{1,2,3,7}	\N	{"p1": {"a": 7, "b": 0, "t": null}, "p2": {"a": 8, "b": 5, "t": 0}, "p3": {"a": 6, "b": 1, "t": 0}, "p4": {"a": 2, "b": 1, "t": 2}}	t	4
1572	63	9022	1	5	\N	0	{1,3,1,1}	\N	{"p1": {"a": 3, "b": 1, "t": 3}}	t	3
2	6	1000138	0	148	\N	\N	\N	\N	\N	t	252
4	6	55503	0	\N	\N	\N	{22,24,25,25}	\N	\N	t	\N
4	6	1000426	0	\N	\N	\N	{22,26,24,24}	\N	\N	t	\N
4	6	1000442	0	\N	\N	\N	{23,25,23,23}	\N	\N	t	\N
4	6	1000621	0	\N	\N	\N	{23,29,23,23}	\N	\N	t	\N
7	5	1000468	0	\N	\N	\N	{18,25,20,27}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 3, "t": 3}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 2, "t": 2}, "p20": {"b": 1}, "p21": {"b": 3, "t": 3}, "p22": {"b": 3, "t": 3}, "p25": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	5	13179	0	\N	\N	\N	{22,28,23,29}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 3, "t": 3}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
7	6	1000563	0	\N	\N	\N	{19,22,21,24}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 3, "t": 3}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 2, "t": 2}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	6	1000107	0	56	\N	\N	{18,22,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	59
2	6	1000213	0	322	\N	\N	{12,16,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	116
5	5	13179	2	12	\N	9	{1,1,3,7}	\N	{"p1": {"": 1, "a": 1, "b": 1, "t": 1}, "p2": {"a": 7, "b": 0, "t": null}, "p3": {"a": 8, "b": 5, "t": 0}, "p4": {"a": 6, "b": 1, "t": 0}}	t	\N
4	6	10709	0	\N	\N	\N	{29,32,29,29}	\N	\N	t	\N
4	6	9537	0	\N	\N	\N	{29,34,29,29}	\N	\N	t	\N
4	6	1000470	0	\N	\N	\N	{22,24,22,22}	\N	\N	t	\N
4	6	1000425	0	\N	\N	\N	{21,23,22,22}	\N	\N	t	\N
4	6	1000275	0	\N	\N	\N	{21,24,21,21}	\N	\N	t	\N
4	6	1000096	0	\N	\N	\N	{20,21,20,20}	\N	\N	t	\N
7	6	2000139	0	\N	\N	\N	{9,12,9,12}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 3, "t": 3}, "p17": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}}	t	\N
7	6	2000121	0	\N	\N	\N	{5,7,6,8}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p15": {"b": 2, "t": 2}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}}	t	\N
2	6	1000056	0	356	\N	\N	{6,8,8,8}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p3": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	191
7	6	2000088	0	\N	\N	\N	{18,23,24,29}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 3, "t": 3}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 2, "t": 2}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
7	5	2000036	0	\N	\N	\N	{13,16,19,22}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 2, "t": 2}}	t	\N
7	6	2000138	0	\N	\N	\N	{16,17,19,20}	\N	{"p1": {"b": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
7	6	2000203	0	\N	\N	\N	{22,25,24,27}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p20": {"b": 0, "t": 0}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
4	6	10172	3	5	\N	2	{4,6,4,4}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 2, "b": 1, "t": 2}}	t	\N
7	6	2000124	0	\N	\N	\N	{4,4,6,6}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}}	t	\N
7	6	2000096	0	\N	\N	\N	\N	\N	\N	t	\N
1572	63	63571	0	8	\N	0	\N	\N	\N	t	6
7	6	2000099	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000122	0	\N	\N	\N	{10,11,11,12}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 2, "t": 2}}	t	\N
7	6	2000142	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000031	0	\N	\N	\N	{22,30,25,33}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p11": {"b": 0, "t": 0}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 3, "t": 3}, "p24": {"b": 1}, "p25": {"b": 3, "t": 3}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
2	6	1000299	0	464	\N	\N	\N	\N	\N	t	252
4	6	1000459	0	\N	\N	\N	{19,25,19,19}	\N	\N	t	\N
6	6	13415	3	2	\N	\N	{0,0,1,1}	\N	{"p1": {"a": 1, "b": 1, "t": 0}, "p2": {"a": null, "b": null, "t": null}}	t	\N
4	6	1000079	0	\N	\N	\N	{22,26,27,27}	\N	\N	t	\N
7	5	8759	0	\N	\N	\N	{15,18,19,22}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	6	2000126	0	\N	\N	\N	{19,23,19,23}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p6": {"b": 3, "t": 3}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	2000027	0	\N	\N	\N	{7,9,8,10}	\N	{"p5": {"b": 1, "t": 1}, "p7": {"b": 3, "t": 3}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1}}	t	\N
2	6	1000090	0	24	\N	\N	\N	\N	\N	t	252
2	6	1000111	0	16	\N	\N	\N	\N	\N	t	252
2	6	1000194	0	252	\N	\N	\N	\N	\N	t	252
7	6	2000129	0	\N	\N	\N	{6,10,6,10}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 3, "t": 3}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 3, "t": 3}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}}	t	\N
7	6	1000345	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	1000491	0	\N	\N	\N	{2,3,2,3}	\N	{"p1": {"a": null, "b": null, "t": null}, "p10": {"b": 1, "t": 1}, "p17": {"b": 2, "t": 2}}	t	\N
7	6	1000393	0	\N	\N	\N	{12,13,18,19}	\N	{"p1": {"a": null, "b": null, "t": null}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p19": {"b": 2, "t": 2}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p24": {"b": 1}, "p26": {"b": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	6	1000434	0	\N	\N	\N	{18,22,20,24}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p25": {"b": 3, "t": 3}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	5	57750	0	\N	\N	\N	{23,27,25,29}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
5	6	10493	2	13	\N	9	{1,1,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 3, "b": 1, "t": 0}, "p3": {"": null, "a": 4, "b": 0, "t": null}, "p4": {"a": 8, "b": 0, "t": null}}	t	\N
4	6	1000609	0	\N	\N	\N	{17,23,17,17}	\N	\N	t	\N
5	6	1000371	2	11	\N	11	{1,1,2,6}	\N	{"p1": {"": 1, "a": 1, "b": 1, "t": 1}, "p2": {"a": 7, "b": 5, "t": 0}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"a": 17, "b": 0, "t": null}}	t	\N
5	6	13972	2	3	\N	19	{1,1,2,2}	\N	{"p1": {"": 1, "a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 1, "t": 0}, "p3": {"a": 7, "b": 0, "t": null}, "p4": {"a": 11, "b": 0, "t": null}}	t	\N
7	5	2000021	0	\N	\N	\N	{12,17,15,20}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 3, "t": 3}, "p22": {"b": 3, "t": 3}, "p26": {"b": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	5	1000361	0	\N	\N	\N	{18,21,20,23}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
7	6	2000174	0	\N	\N	\N	{17,19,18,20}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p3": {"b": 0, "t": 0}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p20": {"a": null, "b": null, "t": null}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	5	2000059	0	\N	\N	\N	{0,0,0,0}	\N	{"p1": {"b": 0}}	t	\N
7	5	2000017	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	1000200	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000018	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	1000591	0	\N	\N	\N	{12,13,15,16}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	5	2000210	0	\N	\N	\N	{14,18,18,22}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 2, "t": 2}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	6	2000172	0	\N	\N	\N	{16,17,18,19}	\N	{"p1": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	5	2000054	0	\N	\N	\N	{14,19,15,20}	\N	{"p1": {"b": 0}, "p2": {"a": null, "b": null, "t": null}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p26": {"b": 2, "t": 2}, "p27": {"b": 2, "t": 2}, "p29": {"b": 1, "t": 1}, "p30": {"b": 3, "t": 3}}	t	\N
7	5	2000001	0	\N	\N	\N	{12,15,18,21}	\N	{"p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 2, "t": 2}, "p29": {"b": 2, "t": 2}, "p30": {"b": 1}}	t	\N
4	6	1000399	0	\N	\N	\N	{16,17,17,17}	\N	\N	t	\N
4	6	1000160	0	\N	\N	\N	{16,22,17,17}	\N	\N	t	\N
7	6	1000053	0	\N	\N	\N	{24,31,25,32}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 3, "t": 3}, "p29": {"b": 1, "t": 1}, "p30": {"b": 3, "t": 3}}	t	\N
7	6	2000108	0	\N	\N	\N	{10,12,12,14}	\N	{"p1": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 2, "t": 2}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}}	t	\N
7	6	2000109	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000112	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000179	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000115	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000116	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000194	0	\N	\N	\N	\N	\N	\N	t	\N
5	5	1000602	2	3	\N	18	{1,3,1,1}	\N	{"p1": {"a": 3, "b": 1, "t": 3}, "p2": {"a": 5, "b": 0, "t": null}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"a": 7, "b": 0, "t": null}}	t	\N
5	5	12856	2	10	\N	11	{1,1,3,5}	\N	{"p1": {"": 1, "a": 1, "b": 1, "t": 1}, "p2": {"a": 5, "b": 0, "t": null}, "p3": {"a": 5, "b": 3, "t": 0}, "p4": {"a": 6, "b": 1, "t": 0}}	t	\N
5	5	1000652	2	8	\N	13	{1,1,2,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 11, "b": 0, "t": null}, "p3": {"a": 8, "b": 0, "t": null}, "p4": {"": null, "a": 5, "b": 4, "t": 0}}	t	\N
7	6	1000509	0	\N	\N	\N	{5,7,5,7}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p27": {"b": 3, "t": 3}}	t	\N
7	6	2000097	0	\N	\N	\N	{8,8,8,8}	\N	{"p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}}	t	\N
7	6	2000127	0	\N	\N	\N	\N	\N	\N	t	\N
4	5	1000535	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000534	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000367	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
7	6	1000601	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000523	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000130	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000131	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000407	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000132	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000134	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000135	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000136	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000137	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000422	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000539	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000144	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000145	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000103	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000540	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000543	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000146	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000015	0	\N	\N	\N	{17,23,19,25}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p14": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {}, "p20": {"b": 1, "t": 1}, "p21": {"b": 3, "t": 3}, "p25": {"b": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 2, "t": 2}, "p30": {"b": 1}}	t	\N
7	6	1000477	0	\N	\N	\N	{18,24,18,24}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p20": {"b": 0, "t": 0}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p25": {"b": 3, "t": 3}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
6	5	10490	3	6	\N	\N	{0,0,0,0}	\N	{"p1": {"a": null, "b": null, "t": null}}	t	\N
2	6	1000260	0	424	\N	\N	\N	\N	\N	t	252
7	6	13131	0	\N	\N	\N	{25,27,25,27}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 2, "t": 2}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000155	0	\N	\N	\N	{16,21,16,21}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p21": {"b": 3, "t": 3}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
7	5	2000055	0	\N	\N	\N	{17,23,20,26}	\N	{"p1": {"b": 2, "t": 2}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 3, "t": 3}, "p25": {"b": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	6	2000213	0	\N	\N	\N	{26,30,28,32}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 3, "t": 3}, "p12": {"b": 1, "t": 1}, "p14": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 2, "t": 2}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	6	1000237	0	401	\N	\N	{4,4,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}}	t	222
5	5	8759	2	7	\N	14	{1,1,3,5}	\N	{"p1": {"": 1, "a": 2, "b": 1, "t": 1}, "p2": {"a": 4, "b": 3, "t": 0}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 4, "b": 1, "t": 0}}	t	\N
5	5	1000639	2	5	\N	16	{2,5,2,4}	\N	{"p1": {"": 2, "a": 3, "b": 2, "t": 2}, "p2": {"a": 5, "b": 0, "t": null}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 3, "b": 2, "t": 3}}	t	\N
7	5	2000032	0	\N	\N	\N	{17,21,19,23}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1}, "p18": {"b": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
7	6	2000120	0	\N	\N	\N	{16,21,18,23}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
1611	5	11377	-8	11	\N	0	\N	\N	\N	t	6
7	6	2000128	0	\N	\N	\N	{13,15,16,18}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p23": {"b": 1}, "p26": {"b": 3, "t": 3}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	5	2000058	0	\N	\N	\N	{23,24,25,26}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	6	1000057	0	357	\N	\N	{5,8,5,5}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	219
7	5	2000023	0	\N	\N	\N	{20,24,24,28}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 3, "t": 3}, "p24": {"b": 1}, "p25": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
7	6	2000119	0	\N	\N	\N	{17,18,20,21}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
4	6	1000582	0	\N	\N	\N	{19,28,22,22}	\N	\N	t	\N
7	6	1000522	0	\N	\N	\N	{13,14,18,19}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p25": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1}, "p30": {"b": 1}}	t	\N
7	6	2000113	0	\N	\N	\N	{23,23,26,26}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000123	0	\N	\N	\N	{10,12,12,14}	\N	{"p1": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1}, "p27": {"b": 1, "t": 1}}	t	\N
4	6	10597	0	\N	\N	\N	{22,24,23,23}	\N	\N	t	\N
7	6	1000001	0	\N	\N	\N	{19,19,21,21}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000114	0	\N	\N	\N	{13,14,17,18}	\N	{"p1": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 1}, "p22": {"b": 1, "t": 1}, "p25": {"b": 0, "t": 0}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	6	2000065	0	\N	\N	\N	{12,13,12,13}	\N	{"p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	10959	0	\N	\N	\N	{19,21,20,22}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
2	5	1000043	0	309	\N	0	{6,7,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	69
1572	284	61104	0	3	\N	0	{0,0,0,0}	\N	{"p1": {"a": 3, "b": 0, "t": null}}	t	5
4	6	1000395	0	\N	\N	\N	{19,23,21,21}	\N	\N	t	\N
7	6	1000275	0	\N	\N	\N	{20,22,20,22}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 2, "t": 2}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000182	0	\N	\N	\N	{14,18,18,22}	\N	{"p1": {"b": 2, "t": 2}, "p2": {"b": 3, "t": 3}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000066	0	\N	\N	\N	{20,23,21,24}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
7	5	10936	0	\N	\N	\N	{15,17,19,21}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p25": {"b": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	6	2000188	0	\N	\N	\N	{17,22,23,28}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p25": {"b": 3, "t": 3}, "p26": {"b": 3, "t": 3}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
2	5	9740	0	98	\N	0	{13,19,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	25
7	5	2000024	0	\N	\N	\N	{4,4,4,4}	\N	{"p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}}	t	\N
7	6	1000438	0	\N	\N	\N	{18,20,19,21}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"a": null, "b": null, "t": null}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	2000186	0	\N	\N	\N	{15,17,18,20}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p30": {"b": 2, "t": 2}}	t	\N
7	6	2000111	0	\N	\N	\N	{16,17,17,18}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	1000459	0	\N	\N	\N	{19,22,21,24}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
5	6	1000370	2	14	\N	8	{1,1,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 3, "b": 1, "t": 0}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"": 10, "a": 10, "b": 0, "t": null}}	t	\N
2	5	1000119	0	81	\N	0	\N	\N	\N	t	114
7	6	2000125	0	\N	\N	\N	{20,25,24,29}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 3, "t": 3}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1}, "p24": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
7	6	2000100	0	\N	\N	\N	{19,20,23,24}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p24": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
4	6	1000166	0	\N	\N	\N	{19,24,19,19}	\N	\N	t	\N
7	6	1000161	0	\N	\N	\N	{24,27,24,27}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 2, "t": 2}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000079	0	\N	\N	\N	{21,25,24,28}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p9": {"b": 3, "t": 3}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000141	0	\N	\N	\N	{24,28,27,31}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p14": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 3, "t": 3}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	6	1000215	0	324	\N	\N	{19,25,20,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 3}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 3}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	55
7	6	2000208	0	\N	\N	\N	{18,18,21,21}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 0}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000435	0	\N	\N	\N	{15,16,16,17}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"a": null, "b": null, "t": null}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
5	6	1000654	2	1	\N	20	{0,0,1,2}	\N	{"p1": {"": null, "a": 6, "b": 2, "t": 0}, "p2": {"": null, "a": 7, "b": 0, "t": null}, "p3": {"": 5, "a": 5, "b": 0, "t": null}, "p4": {"": 5, "a": 5, "b": 0, "t": null}}	t	\N
5	6	11724	2	17	\N	5	{1,1,2,2}	\N	{"p1": {"": null, "a": 1, "b": 1, "t": 1}, "p2": {"a": 3, "b": 1, "t": 0}, "p3": {"a": 3, "b": 0, "t": null}, "p4": {"a": 4, "b": 0, "t": null}}	t	\N
7	6	1000510	0	\N	\N	\N	{13,15,15,17}	\N	{"p1": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 2, "t": 2}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	2000207	0	\N	\N	\N	{22,27,25,30}	\N	{"p1": {"b": 2, "t": 2}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 3, "t": 3}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
7	6	1000444	0	\N	\N	\N	{16,22,19,25}	\N	{"p1": {"a": null, "b": null, "t": null}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 3, "t": 3}, "p9": {"b": 3, "t": 3}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1}, "p25": {"b": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	1000504	0	\N	\N	\N	{10,12,10,12}	\N	{"p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	2000071	0	\N	\N	\N	{10,13,11,14}	\N	{"p1": {"b": 3, "t": 3}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}}	t	\N
7	6	1000485	0	\N	\N	\N	{9,9,14,14}	\N	{"p4": {"b": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p24": {"b": 1}, "p26": {"b": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	6	1000093	0	\N	\N	\N	{26,33,28,35}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 3, "t": 3}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 3, "t": 3}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 2, "t": 2}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000185	0	\N	\N	\N	{4,7,8,11}	\N	{"p1": {"b": 1}, "p5": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1}, "p15": {"b": 1}, "p17": {"b": 2, "t": 2}, "p21": {"b": 3, "t": 3}, "p26": {"b": 1}}	t	\N
7	6	1000076	0	\N	\N	\N	{18,21,18,21}	\N	{"p1": {"a": null, "b": null, "t": null}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
4	6	1000579	0	\N	\N	\N	{18,21,21,21}	\N	\N	t	\N
4	6	1000404	0	\N	\N	\N	{18,21,19,19}	\N	\N	t	\N
7	6	2000206	0	\N	\N	\N	{21,26,21,26}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p9": {"b": 3, "t": 3}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 3, "t": 3}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
4	6	1000156	0	\N	\N	\N	{18,20,18,18}	\N	\N	t	\N
7	5	1000230	0	\N	\N	\N	{13,20,15,22}	\N	{"p1": {"b": 1}, "p4": {"b": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 3, "t": 3}, "p19": {"b": 3, "t": 3}, "p21": {"b": 2, "t": 2}, "p22": {"b": 2, "t": 2}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}}	t	\N
7	6	2000158	0	\N	\N	\N	{5,7,5,7}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 3, "t": 3}, "p17": {"b": 1, "t": 1}}	t	\N
7	6	1000495	0	\N	\N	\N	{19,25,21,27}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 3, "t": 3}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 2, "t": 2}, "p30": {"b": 2, "t": 2}}	t	\N
7	6	2000160	0	\N	\N	\N	{13,16,13,16}	\N	{"p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 2, "t": 2}}	t	\N
5	6	1000655	2	5	\N	17	{1,5,2,2}	\N	{"p1": {"": 1, "a": 5, "b": 1, "t": 5}, "p2": {"a": 4, "b": 1, "t": 0}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 8, "b": 0, "t": null}}	t	\N
4	6	1000192	0	\N	\N	\N	{15,19,18,18}	\N	\N	t	\N
4	6	1000415	0	\N	\N	\N	{21,23,23,23}	\N	\N	t	\N
5	6	1000183	2	4	\N	18	{1,3,2,2}	\N	{"p1": {"": 3, "a": 3, "b": 1, "t": 3}, "p2": {"a": 5, "b": 0, "t": null}, "p3": {"a": 7, "b": 0, "t": null}, "p4": {"a": 4, "b": 1, "t": 0}}	t	\N
7	5	2000019	0	\N	\N	\N	{3,5,3,5}	\N	{"p1": {"a": null, "b": null, "t": null}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 3, "t": 3}}	t	\N
7	5	2000022	0	\N	\N	\N	\N	\N	\N	t	\N
2	5	12655	2	9	\N	12	{0,0,1,4}	\N	{"p1": {"a": 7, "b": 0, "t": null}, "p2": {"a": 4, "b": 4, "t": 0}, "p3": {"a": 8, "b": 0, "t": null}, "p4": {"a": 5, "b": 0, "t": null}}	t	17
2	6	1000224	0	330	\N	\N	\N	\N	\N	t	252
1611	6	6623	0	7	\N	0	{2,14,3,3}	\N	{"p1": {"a": 3, "b": 1, "t": 0}, "p2": {"a": 4, "b": 1, "t": 4}, "p3": {"a": 10, "b": 1, "t": 10}, "p4": {"a": 1, "b": 0, "t": null}}	t	2
4	6	1000646	0	\N	\N	\N	{15,18,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 0, "t": null}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 2}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
5	6	1000658	2	10	\N	12	{0,0,1,1}	\N	{"p1": {"": 1, "a": 3, "b": 1, "t": 0}, "p2": {"a": 6, "b": 0, "t": null}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"a": 8, "b": 0, "t": null}}	t	\N
2	5	9266	3	1	\N	6	{1,1,3,7}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 0, "t": null}, "p3": {"a": 3, "b": 3, "t": 0}, "p4": {"a": 3, "b": 3, "t": null}}	t	5
5	6	13415	2	18	\N	4	{1,2,4,9}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 3, "b": 1, "t": 0}, "p3": {"a": 5, "b": 5, "t": 0}, "p4": {"a": 3, "b": 1, "t": 0}}	t	\N
5	6	1000657	2	8	\N	14	{1,4,2,5}	\N	{"p1": {"": 4, "a": 4, "b": 3, "t": 4}, "p2": {"a": 2, "b": 2, "t": 0}, "p3": {"a": 3, "b": 0, "t": null}, "p4": {"a": 5, "b": 0, "t": null}}	t	\N
2	6	1000190	0	248	\N	\N	\N	\N	\N	t	252
5	6	11522	2	12	\N	10	{1,1,2,4}	\N	{"p1": {"": 1, "a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 3, "t": 0}, "p3": {"a": 4, "b": 0, "t": null}, "p4": {"a": 6, "b": 0, "t": null}}	t	\N
5	6	1000659	2	16	\N	6	{0,0,2,3}	\N	{"p1": {"a": 3, "b": 2, "t": 0}, "p2": {"a": 6, "b": 0, "t": null}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"": 1, "a": 2, "b": 1, "t": 0}}	t	\N
5	6	13825	2	6	\N	16	{0,0,1,2}	\N	{"p1": {"": null, "a": 6, "b": 2, "t": 0}, "p2": {"a": 6, "b": 0, "t": null}, "p3": {"a": 10, "b": 0, "t": null}, "p4": {"a": 11, "b": 0, "t": null}}	t	\N
5	6	1000656	2	7	\N	15	{1,5,1,5}	\N	{"p1": {"a": 5, "b": 5, "t": 5}, "p2": {"a": 7, "b": 0, "t": null}, "p3": {"a": 8, "b": 0, "t": null}, "p4": {"a": 10, "b": 0, "t": null}}	t	\N
2	6	1000330	0	513	\N	\N	\N	\N	\N	t	252
2	6	1000170	0	222	\N	\N	\N	\N	\N	t	252
7	6	1000550	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000167	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000165	0	\N	\N	\N	{0,0,0,0}	\N	{"p1": {"a": null, "b": null, "t": null}}	t	\N
7	6	2000168	0	\N	\N	\N	\N	\N	\N	t	\N
5	5	1000361	2	1	\N	20	{1,2,2,4}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"a": 8, "b": 0, "t": null}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"a": 5, "b": 3, "t": 0}}	t	\N
5	6	1000003	2	2	\N	20	{1,2,2,4}	\N	{"p1": {"": 1, "a": 2, "b": 1, "t": 2}, "p2": {"a": 5, "b": 3, "t": 0}, "p3": {"a": 3, "b": 0, "t": null}, "p4": {"": null, "a": 6, "b": 0, "t": null}}	t	\N
6	5	9740	3	5	\N	\N	{0,0,0,0}	\N	{"p1": {"a": null, "b": null, "t": null}}	t	\N
2	6	10709	2	7	\N	14	{0,0,3,9}	\N	{"p1": {"a": 4, "b": 3, "t": 0}, "p2": {"a": 5, "b": 5, "t": 0}, "p3": {"a": 4, "b": 1, "t": 0}, "p4": {"a": 3, "b": 0, "t": null}}	t	11
2	6	1000277	0	441	\N	\N	{5,7,6,6}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 3}}	t	214
4	6	1000097	0	\N	\N	\N	{21,29,21,21}	\N	\N	t	\N
4	6	55506	0	\N	\N	\N	{19,23,23,23}	\N	\N	t	\N
4	6	1000397	0	\N	\N	\N	{19,23,19,19}	\N	\N	t	\N
5	5	7052	2	18	\N	3	{1,1,4,4}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 3, "b": 1, "t": 0}, "p3": {"": null, "a": 3, "b": 1, "t": 0}, "p4": {"a": 4, "b": 1, "t": 0}}	t	\N
5	6	7492	2	19	\N	2	{2,2,4,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 6, "b": 1, "t": 0}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"": 2, "a": 3, "b": 2, "t": 0}}	t	\N
5	5	12655	2	20	\N	1	{3,4,4,4}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"": 3, "a": 3, "b": 1, "t": 0}, "p3": {"": null, "a": 2, "b": 1, "t": 2}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
5	6	12517	3	2	\N	5	{3,7,4,10}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"": 6, "a": 7, "b": 6, "t": 0}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"": 2, "a": 4, "b": 2, "t": 4}}	t	\N
5	6	13415	3	4	\N	3	{2,10,3,12}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 7, "b": 0, "t": null}, "p3": {"a": 9, "b": 9, "t": 9}, "p4": {"": 2, "a": 3, "b": 2, "t": 0}}	t	\N
5	5	7052	3	1	\N	6	{3,5,4,6}	\N	{"p1": {"a": 2, "b": 1, "t": 0}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"": 3, "a": 3, "b": 3, "t": 3}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
5	6	7492	3	6	\N	1	{3,8,4,10}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 5, "b": 5, "t": 5}, "p4": {"a": 6, "b": 3, "t": 0}}	t	\N
5	5	9740	3	4	\N	3	{1,2,3,4}	\N	{"p1": {"": null, "a": 4, "b": 1, "t": 0}, "p2": {"a": 2, "b": 2, "t": 2}, "p3": {"a": 8, "b": 0, "t": null}, "p4": {"a": 6, "b": 1, "t": 0}}	t	\N
5	6	1000370	3	1	\N	6	{2,13,2,11}	\N	{"p1": {"a": 7, "b": 5, "t": 7}, "p2": {"a": 8, "b": 0, "t": null}, "p3": {"a": 6, "b": 6, "t": 6}, "p4": {"a": 8, "b": 0, "t": null}}	t	\N
2	5	1000123	0	93	\N	0	\N	\N	\N	t	114
7	6	1000551	0	\N	\N	\N	{7,9,7,9}	\N	{"p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}}	t	\N
2	5	1000314	0	479	\N	0	\N	\N	\N	t	114
7	6	2000183	0	\N	\N	\N	{2,2,2,2}	\N	{"p1": {"a": null, "b": null, "t": null}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}}	t	\N
7	6	2000176	0	\N	\N	\N	{1,1,1,1}	\N	{"p10": {"b": 1, "t": 1}}	t	\N
2	5	1000348	0	535	\N	0	{1,1,1,1}	\N	{"p21": {"a": null, "b": 1, "t": 1}}	t	110
2	6	1000220	0	326	\N	\N	{10,13,10,10}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	139
2	6	1000018	0	281	\N	\N	\N	\N	\N	t	252
2	6	7492	2	8	\N	13	{1,4,3,6}	\N	{"p1": {"a": 4, "b": 2, "t": 4}, "p2": {"a": 6, "b": 3, "t": 0}, "p3": {"a": 5, "b": 1, "t": 0}, "p4": {"a": 6, "b": 0, "t": null}}	t	8
2	6	6623	3	4	\N	3	{0,0,1,1}	\N	{"p1": {"a": 4, "b": 1, "t": 0}, "p2": {"a": 8, "b": 0, "t": null}, "p3": {"a": 10, "b": 0, "t": null}, "p4": {"a": 4, "b": 0, "t": null}}	t	6
2	6	10952	0	12	\N	\N	\N	\N	\N	t	252
2	6	1000254	0	418	\N	\N	{4,4,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}}	t	222
2	6	1000075	0	501	\N	\N	{6,7,10,10}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	184
2	6	1000211	0	320	\N	\N	{8,12,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	168
2	5	1000346	0	533	\N	0	\N	\N	\N	t	114
4	6	1000595	0	\N	\N	\N	{19,26,19,19}	\N	\N	t	\N
7	6	1000637	0	\N	\N	\N	{5,5,5,5}	\N	{"p5": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}}	t	\N
2	6	1000284	0	448	\N	\N	{9,16,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 3}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 3}}	t	167
1572	284	61905	0	6	\N	0	{0,0,1,2}	\N	{"p1": {"a": 2, "b": 2, "t": 0}}	t	4
7	5	2000033	0	\N	\N	\N	{15,21,16,22}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 3, "t": 3}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 2, "t": 2}, "p22": {"b": 1, "t": 1}, "p26": {"b": 3, "t": 3}, "p27": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	6	1000266	0	430	\N	\N	{4,4,4,4}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}}	t	222
2	6	10062	0	242	\N	\N	{23,30,24,24}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 3}, "p30": {"a": null, "b": 1, "t": 2}}	t	33
7	6	1000181	0	\N	\N	\N	\N	\N	\N	t	\N
2	5	1000204	0	272	\N	0	{5,6,9,9}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p14": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	78
1611	5	9928	-8	9	\N	0	\N	\N	\N	t	10
2	6	12582	0	7	\N	\N	\N	\N	\N	t	252
2	6	1000154	0	204	\N	\N	\N	\N	\N	t	252
7	6	1000259	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000396	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000189	0	\N	\N	\N	{2,2,2,2}	\N	{"p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}}	t	\N
7	6	1000640	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000046	0	\N	\N	\N	{7,7,10,10}	\N	{"p1": {"b": 1}, "p3": {"b": 1, "t": 0}, "p4": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"a": null, "b": null, "t": null}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p27": {"b": 1, "t": 1}}	t	\N
2	6	1000258	0	422	\N	\N	{5,5,8,8}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	195
5	5	11498	3	5	\N	2	{4,5,4,4}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
7	5	1000533	0	\N	\N	\N	{2,2,3,3}	\N	{"p5": {"b": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}}	t	\N
7	5	2000029	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000030	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000042	0	\N	\N	\N	{5,6,7,8}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 2, "t": 2}, "p22": {"b": 1}, "p30": {"b": 1}}	t	\N
2	6	1000265	0	429	\N	\N	{12,17,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 2}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	118
7	5	1000045	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000035	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	10960	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	1000536	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000037	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	13447	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000039	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000026	0	\N	\N	\N	{1,1,3,3}	\N	{"p1": {"a": null, "b": null, "t": null}, "p10": {"b": 1, "t": 1}, "p17": {"b": 1}, "p26": {"b": 1}}	t	\N
7	5	2000016	0	\N	\N	\N	{3,3,4,4}	\N	{"p1": {"b": 1}, "p5": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}}	t	\N
7	5	2000041	0	\N	\N	\N	\N	\N	\N	t	\N
4	5	1000651	0	\N	\N	\N	{15,22,15,15}	\N	\N	t	\N
4	5	13179	0	\N	\N	\N	{18,21,20,20}	\N	\N	t	\N
4	5	8101	0	\N	\N	\N	{24,27,25,25}	\N	\N	t	\N
4	5	1000448	0	\N	\N	\N	{13,17,16,16}	\N	\N	t	\N
7	5	2000028	0	\N	\N	\N	{5,8,8,11}	\N	{"p5": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 2, "t": 2}, "p16": {"a": null, "b": null, "t": null}, "p18": {"b": 1}, "p22": {"b": 1}, "p26": {"b": 1}, "p27": {"b": 3, "t": 3}}	t	\N
7	5	2000044	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	1000502	0	\N	\N	\N	{9,14,9,14}	\N	{"p4": {"b": 3, "t": 3}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 2, "t": 2}, "p27": {"b": 3, "t": 3}}	t	\N
7	5	10396	0	\N	\N	\N	\N	\N	\N	t	\N
4	5	1000419	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
7	6	2000152	0	\N	\N	\N	{8,11,12,15}	\N	{"p1": {"a": null, "b": null, "t": null}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 2, "t": 2}, "p8": {"b": 1}, "p10": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}, "p22": {"b": 1}, "p27": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
1611	5	10338	2	1	\N	6	{4,10,4,8}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 2, "b": 2, "t": 3}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 4, "b": 3, "t": 4}}	t	1
7	6	1000537	0	\N	\N	\N	{12,16,12,16}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 3, "t": 3}, "p27": {"b": 2, "t": 2}}	t	\N
2	6	8190	0	63	\N	\N	{26,31,27,27}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 1, "t": 3}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p8": {"a": null, "b": 1, "t": 2}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": null}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	6
2	5	1000080	0	379	\N	0	\N	\N	\N	t	114
4	5	9945	2	17	\N	4	{3,7,4,6}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 3, "b": 3, "t": 3}, "p3": {"a": 3, "b": 1, "t": 3}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
2	6	1000134	0	139	\N	\N	\N	\N	\N	t	252
4	6	1000593	0	\N	\N	\N	{17,21,19,19}	\N	\N	t	\N
4	6	1000632	0	\N	\N	\N	{15,19,21,21}	\N	\N	t	\N
5	6	11724	3	3	\N	4	{2,4,4,10}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 3, "t": 0}, "p3": {"a": 3, "b": 3, "t": 3}, "p4": {"": 3, "a": 5, "b": 3, "t": 0}}	t	\N
5	6	10709	3	5	\N	2	{3,6,4,4}	\N	{"p1": {"a": 3, "b": 1, "t": 3}, "p2": {"": 1, "a": 2, "b": 1, "t": 2}, "p3": {"": 1, "a": 1, "b": 1, "t": 1}, "p4": {"a": 3, "b": 1, "t": 0}}	t	\N
5	5	1000639	3	2	\N	5	{0,0,3,6}	\N	{"p1": {"a": 3, "b": 1, "t": 0}, "p2": {"a": 5, "b": 4, "t": 0}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 4, "b": 1, "t": 0}}	t	\N
7	5	2000047	0	\N	\N	\N	{3,4,7,8}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1}, "p10": {"b": 2, "t": 2}, "p15": {"b": 1}, "p17": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 1}}	t	\N
7	5	2000050	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	1000306	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	1000643	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000061	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000373	0	\N	\N	\N	\N	\N	\N	t	\N
5	5	12655	3	6	\N	1	{4,4,4,4}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
2	6	1000185	0	240	\N	\N	\N	\N	\N	t	252
7	5	12930	0	\N	\N	\N	{22,25,25,28}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 3, "t": 3}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000090	0	\N	\N	\N	{16,16,19,19}	\N	{"p1": {"a": null, "b": null, "t": null}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	5	55518	0	377	\N	0	\N	\N	\N	t	114
7	6	2000201	0	\N	\N	\N	{12,13,14,15}	\N	{"p1": {"b": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
2	6	1000242	0	406	\N	\N	\N	\N	\N	t	252
2	6	1000229	0	336	\N	\N	\N	\N	\N	t	252
2	6	1000327	0	510	\N	\N	\N	\N	\N	t	252
7	5	907	0	\N	\N	\N	{23,24,27,28}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p3": {"a": null, "b": null, "t": null}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000133	0	\N	\N	\N	{11,11,13,13}	\N	{"p4": {"b": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
4	6	1000641	0	\N	\N	\N	{14,19,14,14}	\N	\N	t	\N
4	6	1000606	0	\N	\N	\N	{13,15,18,18}	\N	\N	t	\N
7	6	2000191	0	\N	\N	\N	{14,15,14,15}	\N	{"p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
2	5	1000359	2	2	\N	19	{0,0,2,9}	\N	{"p1": {"a": 16, "b": 5, "t": 0}, "p2": {"a": 4, "b": 4, "t": 0}, "p3": {"a": 12, "b": 0, "t": null}, "p4": {"a": 9, "b": 0, "t": null}}	t	14
2	6	1000058	0	358	\N	\N	{4,5,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}}	t	229
7	5	2000020	0	\N	\N	\N	{3,3,7,7}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1}, "p17": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 1}}	t	\N
7	6	1000531	0	\N	\N	\N	{13,16,16,19}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 2, "t": 2}, "p30": {"b": 1}}	t	\N
7	6	2000195	0	\N	\N	\N	{22,28,23,29}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 3, "t": 3}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 3, "t": 3}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 3, "t": 3}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 0, "t": 0}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	1000323	0	\N	\N	\N	{15,18,18,21}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p19": {"b": 3, "t": 3}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
2	5	1000208	0	276	\N	0	\N	\N	\N	t	114
2	6	1000212	0	321	\N	\N	\N	\N	\N	t	252
2	6	1000216	0	325	\N	\N	\N	\N	\N	t	252
3	6	1000389	0	39	\N	1	{0,0,2,4}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 1, "b": 1, "t": 0}, "p3": {"a": 3, "b": 3, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	30
7	5	2000223	0	\N	\N	\N	{8,10,12,14}	\N	{"p1": {"a": null, "b": null, "t": null}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 2, "t": 2}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p26": {"b": 1}, "p27": {"b": 1, "t": 1}}	t	\N
7	5	2000049	0	\N	\N	\N	{9,10,11,12}	\N	{"p1": {"b": 1}, "p4": {"b": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}}	t	\N
4	6	1000396	0	\N	\N	\N	{13,17,14,14}	\N	\N	t	\N
4	6	1000428	0	\N	\N	\N	{13,19,13,13}	\N	\N	t	\N
4	6	1000377	0	\N	\N	\N	{12,14,14,14}	\N	\N	t	\N
4	6	1000089	0	\N	\N	\N	{11,11,12,12}	\N	\N	t	\N
4	6	1000454	0	\N	\N	\N	{10,14,12,12}	\N	\N	t	\N
4	6	1000461	0	\N	\N	\N	{9,9,9,9}	\N	\N	t	\N
4	6	1000604	0	\N	\N	\N	{8,9,9,9}	\N	\N	t	\N
4	6	1000486	0	\N	\N	\N	{4,6,4,4}	\N	{"p12": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 2}}	t	\N
7	6	13415	0	\N	\N	\N	{29,32,30,33}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1, "t": 1}, "p14": {"b": 2, "t": 2}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 2, "t": 2}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
1611	6	10618	0	1	\N	0	{3,6,4,6}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 3, "b": 1, "t": 3}, "p3": {"a": 2, "b": 2, "t": 2}, "p4": {"a": 4, "b": 2, "t": 0}}	t	5
7	6	57746	0	\N	\N	\N	{27,28,29,30}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 0, "t": 0}, "p14": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
4	6	11795	0	\N	\N	\N	{27,28,28,28}	\N	\N	t	\N
4	6	10062	0	\N	\N	\N	{27,30,28,28}	\N	\N	t	\N
4	6	11801	0	\N	\N	\N	{27,33,28,28}	\N	\N	t	\N
7	5	2000048	0	\N	\N	\N	{7,8,11,12}	\N	{"p1": {"b": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 1}, "p27": {"b": 1, "t": 1}}	t	\N
1611	5	11377	2	3	\N	4	{0,0,2,11}	\N	{"p1": {"a": 9, "b": 7, "t": 0}, "p2": {"a": 5, "b": 0, "t": null}, "p3": {"": 4, "a": 4, "b": 4, "t": 0}, "p4": {"a": 6, "b": 0, "t": null}}	t	6
3	6	6724	0	44	\N	1	{5,13,5,13}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 4, "t": 4}, "p3": {"a": 6, "b": 6, "t": 6}, "p4": {"a": 1, "b": 1, "t": 1}, "p5": {"a": 1, "b": 1, "t": 1}}	t	1
2	6	6550	0	26	\N	\N	\N	\N	\N	t	252
7	6	2000178	0	\N	\N	\N	{11,12,11,12}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	2000063	0	\N	\N	\N	{12,14,12,14}	\N	{"p1": {"b": 3, "t": 3}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}}	t	\N
7	6	1000489	0	\N	\N	\N	{7,12,10,15}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 2, "t": 2}, "p7": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 2, "t": 2}, "p15": {"b": 1, "t": 1}, "p16": {"b": 3, "t": 3}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1}, "p22": {"b": 1}, "p26": {"b": 1}}	t	\N
4	6	1000509	0	\N	\N	\N	{6,7,6,6}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000505	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000520	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000437	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000030	0	\N	\N	\N	{18,25,22,22}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 2}, "p5": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": 3}, "p7": {"a": null, "b": 1, "t": 3}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 2}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	8453	0	\N	\N	\N	{28,29,28,28}	\N	\N	t	\N
2	6	1000279	0	443	\N	\N	\N	\N	\N	t	252
1611	5	12039	-8	1	\N	0	\N	\N	\N	t	2
2	5	1000207	0	275	\N	0	{9,11,10,10}	\N	{"p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	40
2	6	1000188	0	246	\N	\N	{7,8,7,7}	\N	{"p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	170
4	6	12604	0	\N	\N	\N	{28,33,28,28}	\N	\N	t	\N
4	6	13131	0	\N	\N	\N	{28,34,28,28}	\N	\N	t	\N
4	6	10493	0	\N	\N	\N	{27,30,29,29}	\N	\N	t	\N
4	6	1000611	0	\N	\N	\N	{7,9,8,8}	\N	{"p6": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 3}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000236	0	\N	\N	\N	{6,6,6,6}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000494	0	\N	\N	\N	{6,11,6,6}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 3}, "p17": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 2}}	t	\N
4	6	1000540	0	\N	\N	\N	{6,8,6,6}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 3}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000246	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000006	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000252	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000496	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000385	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000402	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000504	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000133	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	6933	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000511	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000194	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000436	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000482	0	\N	\N	\N	{0,0,0,0}	\N	{"p1": {"a": null, "b": 0, "t": null}}	t	\N
4	6	11739	0	\N	\N	\N	{27,32,29,29}	\N	\N	t	\N
4	6	12517	0	\N	\N	\N	{29,29,29,29}	\N	\N	t	\N
4	6	6623	0	\N	\N	\N	{29,31,29,29}	\N	\N	t	\N
2	6	1000023	0	286	\N	\N	{5,5,8,8}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}}	t	195
2	6	1000033	0	297	\N	\N	{4,7,5,5}	\N	{"p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 3}}	t	237
4	6	8870	0	\N	\N	\N	{29,33,29,29}	\N	\N	t	\N
4	6	9487	0	\N	\N	\N	{28,31,29,29}	\N	\N	t	\N
4	6	1000528	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000539	0	\N	\N	\N	{6,6,7,7}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	70740	0	\N	\N	\N	{16,24,19,19}	\N	\N	t	\N
4	6	11015	0	\N	\N	\N	{28,34,29,29}	\N	\N	t	\N
4	6	57746	0	\N	\N	\N	{27,30,27,27}	\N	\N	t	\N
3	5	9744	3	6	\N	1	{2,3,4,8}	\N	{"p1": {"a": 4, "b": 1, "t": 0}, "p2": {"a": 2, "b": 2, "t": 2}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"": 4, "a": 5, "b": 4, "t": 0}}	t	1
4	6	1000619	0	\N	\N	\N	{4,4,6,6}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000237	0	\N	\N	\N	{7,9,7,7}	\N	{"p12": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000269	0	\N	\N	\N	{11,13,11,11}	\N	{"p2": {"a": null, "b": 1, "t": 3}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000583	0	\N	\N	\N	{11,15,15,15}	\N	{"p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": 2}, "p10": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 3}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	\N
2	6	1000193	0	251	\N	\N	{6,6,9,9}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	178
3	6	11092	0	7	\N	1	{5,8,5,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 4, "b": 1, "t": 4}, "p4": {"a": 1, "b": 1, "t": 1}, "p5": {"a": 1, "b": 1, "t": 1}}	t	9
4	6	1000500	0	\N	\N	\N	{6,6,7,7}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 0, "t": null}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": null}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
2	6	8190	2	15	\N	6	{0,0,3,8}	\N	{"p1": {"a": 6, "b": 4, "t": 0}, "p2": {"a": 6, "b": 1, "t": 0}, "p3": {"a": 7, "b": 0, "t": null}, "p4": {"a": 3, "b": 3, "t": 0}}	t	10
4	5	1000433	0	\N	\N	\N	{9,10,11,11}	\N	\N	t	\N
6	6	10963	3	6	\N	\N	{1,1,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 0}, "p2": {"a": 1, "b": 0, "t": null}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
3	6	11724	0	31	\N	1	{4,8,4,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 1, "t": 4}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 2, "b": 2, "t": 2}, "p5": {"a": 1, "b": 1, "t": 1}}	t	7
4	6	1000406	0	\N	\N	\N	{7,7,7,7}	\N	\N	t	\N
4	6	1000525	0	\N	\N	\N	{6,6,6,6}	\N	\N	t	\N
2	5	1000358	0	102	\N	\N	{14,19,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 3}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	17
4	6	1000018	0	\N	\N	\N	{18,22,20,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": 2}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
2	5	1000042	0	308	\N	0	\N	\N	\N	t	114
2	6	1000341	0	524	\N	\N	{6,7,8,8}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	186
4	6	1000222	0	\N	\N	\N	{14,17,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000529	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000608	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000624	0	\N	\N	\N	{17,20,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 2}, "p23": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000273	0	\N	\N	\N	{9,10,13,13}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": null}}	t	\N
1611	5	9989	-8	4	\N	0	\N	\N	\N	t	3
4	6	1000647	0	\N	\N	\N	{18,20,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": 1}, "p9": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000524	0	\N	\N	\N	{8,9,8,8}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 0, "t": null}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000521	0	\N	\N	\N	{9,12,16,16}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": null}, "p8": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
3	5	13250	0	18	\N	1	{4,6,5,7}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 2, "b": 1, "t": 2}, "p4": {"a": 2, "b": 2, "t": 0}, "p5": {"a": 2, "b": 2, "t": 2}}	t	5
4	6	1000610	0	\N	\N	\N	{6,7,6,6}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 0, "t": null}, "p20": {"a": null, "b": 0, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
2	6	1000011	0	183	\N	\N	{9,11,10,10}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 0, "t": null}, "p18": {"a": null, "b": 0, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 0, "t": null}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	146
1611	5	7641	-8	8	\N	0	\N	\N	\N	t	5
4	6	1000634	0	\N	\N	\N	{5,5,5,5}	\N	\N	t	\N
7	5	1000409	0	\N	\N	\N	{18,26,21,29}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p23": {"b": 3, "t": 3}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
4	6	50798	2	2	\N	18	{0,0,3,12}	\N	{"p1": {"": 7, "a": 7, "b": 7, "t": 0}, "p2": {"a": 3, "b": 2, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 3, "b": 3, "t": 0}}	t	\N
4	6	10172	2	7	\N	14	{3,5,4,6}	\N	{"p1": {"": 2, "a": 2, "b": 2, "t": 2}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 2, "b": 2, "t": 2}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
4	6	1000458	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000085	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
1572	284	13007	0	10	\N	0	\N	\N	\N	t	10
7	6	1000546	0	\N	\N	\N	{14,19,14,19}	\N	{"p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"a": null, "b": null, "t": null}, "p17": {"b": 1, "t": 1}, "p19": {"b": 4, "t": 4}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
4	6	1000191	0	\N	\N	\N	{8,8,8,8}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 0, "t": null}, "p20": {"a": null, "b": 0, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
4	6	1000238	0	\N	\N	\N	{6,6,6,6}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 0, "t": null}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 0, "t": null}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
4	6	1000434	0	\N	\N	\N	{11,16,13,13}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 1, "t": 3}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": null}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 2}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
1572	63	8153	1	1	\N	0	{1,1,2,3}	\N	{"p1": {"a": 2, "b": 2, "t": 0}, "p3": {"a": 1, "b": 1, "t": 1}}	t	2
7	5	2000003	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	1000506	0	\N	\N	\N	{16,18,17,19}	\N	{"p1": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 3, "t": 3}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	5	9266	0	101	\N	0	{15,22,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	13
2	6	6933	2	16	\N	5	{1,5,2,5}	\N	{"p1": {"a": 6, "b": 0, "t": null}, "p2": {"a": 5, "b": 4, "t": 5}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 2, "b": 1, "t": 0}}	t	9
1611	5	7641	2	2	\N	5	{1,6,2,7}	\N	{"p1": {"a": 6, "b": 6, "t": 6}, "p2": {"": 3, "a": 3, "b": 1, "t": 0}, "p3": {"a": 4, "b": 0, "t": null}, "p4": {"": null, "a": 6, "b": 0, "t": null}}	t	5
4	6	1000227	0	\N	\N	\N	{15,16,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 2}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000573	0	\N	\N	\N	{11,14,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
3	5	12856	0	10	\N	1	{3,9,5,12}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 0}, "p3": {"a": 2, "b": 1, "t": 2}, "p4": {"a": 3, "b": 3, "t": 0}, "p5": {"a": 6, "b": 6, "t": 6}}	t	22
2	6	1000283	0	447	\N	\N	{11,15,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	126
2	6	1000338	0	521	\N	\N	{3,5,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 3}}	t	243
7	5	1000484	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000005	0	\N	\N	\N	\N	\N	\N	t	\N
4	6	6724	2	3	\N	18	{1,1,3,5}	\N	{"p1": {"": 3, "a": 9, "b": 3, "t": 0}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
6	6	10962	2	5	\N	\N	{1,2,2,4}	\N	{"p1": {"b": 0}, "p2": {"b": 0}, "p3": {"b": 2, "t": 2}, "p4": {"b": 2}}	t	\N
4	6	12604	2	6	\N	14	{3,10,3,10}	\N	{"p1": {"": 3, "a": 3, "b": 3, "t": 3}, "p2": {"a": 4, "b": 0, "t": null}, "p3": {"a": 6, "b": 6, "t": 6}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
1611	5	6326	2	6	\N	1	{2,3,2,3}	\N	{"p1": {"a": 12, "b": 0, "t": null}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"a": 2, "b": 2, "t": 2}}	t	4
1572	284	61108	0	1	\N	0	{0,0,0,0}	\N	{"p1": {"a": 1, "b": null, "t": null}, "p4": {"a": null, "b": null, "t": null}}	t	5
4	6	11724	2	10	\N	11	{1,1,3,7}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 0, "t": 0}, "p3": {"a": 5, "b": 5, "t": 0}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
7	6	2000141	0	\N	\N	\N	{16,21,19,24}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p14": {"b": 0, "t": 0}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 3, "t": 3}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p30": {"b": 1}}	t	\N
7	6	2000175	0	\N	\N	\N	{10,11,10,11}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
2	6	1000182	0	237	\N	\N	{11,15,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": 3}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	127
2	6	1000340	0	523	\N	\N	{6,7,10,10}	\N	{"p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p14": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	184
2	6	6623	2	18	\N	3	{1,1,2,3}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 3, "b": 2, "t": 0}, "p3": {"a": 3, "b": 0, "t": null}, "p4": {"a": 4, "b": 0, "t": null}}	t	3
3	6	1000393	0	45	\N	1	{0,0,0,0}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	44
4	6	13415	3	4	\N	3	{2,8,3,7}	\N	{"p1": {"a": 4, "b": 3, "t": 4}, "p2": {"a": 4, "b": 1, "t": 0}, "p3": {"a": 4, "b": 3, "t": 4}, "p4": {"a": 2, "b": 0, "t": null}}	t	\N
7	6	2000101	0	\N	\N	\N	{13,17,13,17}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 2, "t": 2}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 3, "t": 3}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	5	2000226	0	\N	\N	\N	{6,7,8,9}	\N	{"p5": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p26": {"b": 1}}	t	\N
7	5	2000025	0	\N	\N	\N	{5,9,8,12}	\N	{"p4": {"b": 3, "t": 3}, "p5": {"b": 2, "t": 2}, "p7": {"b": 2, "t": 2}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p22": {"b": 1}, "p29": {"b": 1}, "p30": {"b": 1}}	t	\N
6	6	11724	0	8	\N	\N	{2,4,5,17}	\N	{"p1": {"b": 7}, "p2": {"b": 3}, "p3": {"b": 3, "t": 3}, "p4": {"b": 3}, "p5": {"b": 1, "t": 1}}	t	\N
4	6	1000633	0	\N	\N	\N	{4,4,5,5}	\N	\N	t	\N
6	5	57750	0	8	\N	\N	{4,7,5,9}	\N	{"p1": {"b": 3}, "p2": {"b": 2, "t": 3}, "p3": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}}	t	\N
2	5	1000040	0	306	\N	0	\N	\N	\N	t	114
2	5	5244	2	6	\N	15	{2,6,3,9}	\N	{"p1": {"a": 7, "b": 3, "t": 0}, "p2": {"a": 3, "b": 3, "t": 3}, "p3": {"a": 3, "b": 3, "t": 3}, "p4": {"a": 3, "b": 0, "t": null}}	t	8
2	6	9514	2	9	\N	12	{1,1,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 3, "b": 1, "t": 0}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 5, "b": 0, "t": null}}	t	2
3	6	12195	0	10	\N	1	{3,5,4,7}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 2, "b": 2, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 2, "b": 2, "t": 2}, "p5": {"a": 1, "b": 1, "t": 1}}	t	18
4	5	1000232	2	9	\N	12	{1,3,2,4}	\N	{"p1": {"a": 3, "b": 2, "t": 3}, "p2": {"a": 5, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 2, "b": 2, "t": 0}}	t	\N
6	6	57746	0	3	\N	\N	{2,2,5,13}	\N	{"p1": {"b": 6}, "p2": {"b": 3}, "p3": {"b": 1, "t": 1}, "p4": {"b": 2}, "p5": {"b": 1, "t": 1}}	t	\N
6	5	65104	0	4	\N	\N	{1,2,1,1}	\N	{"p1": {"b": 0, "t": 0}, "p2": {"b": 0}, "p3": {"b": 1, "t": 2}, "p4": {"b": 0}, "p5": {"b": 0}}	t	\N
2	5	1000070	0	373	\N	0	{7,10,8,8}	\N	{"p1": {"a": null, "b": null, "t": null}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	66
7	6	2000117	0	\N	\N	\N	{11,12,12,13}	\N	{"p1": {"a": null, "b": null, "t": null}, "p2": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
7	6	10493	0	\N	\N	\N	{27,28,29,33}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 2}, "p14": {"b": 2, "t": 2}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 3}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	6	1000105	0	52	\N	\N	{7,7,7,7}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	166
6	6	7492	0	7	\N	\N	{2,2,4,4}	\N	{"p1": {"b": 0}, "p2": {"b": 1}, "p3": {"b": 1, "t": 1}, "p4": {"b": 1}, "p5": {"b": 1, "t": 1}}	t	\N
6	6	10962	0	1	\N	\N	{2,2,5,7}	\N	{"p1": {"b": 2}, "p2": {"b": 2}, "p3": {"b": 1, "t": 1}, "p4": {"b": 1}, "p5": {"b": 1, "t": 1}}	t	\N
6	6	10963	0	2	\N	\N	{3,8,5,10}	\N	{"p1": {"b": 5, "t": 5}, "p2": {"b": 1}, "p3": {"b": 2, "t": 2}, "p4": {"b": 1}, "p5": {"b": 1, "t": 1}}	t	\N
6	6	10709	0	4	\N	\N	{1,1,3,3}	\N	{"p1": {"b": 0}, "p2": {"b": 1}, "p3": {"b": 0}, "p4": {"b": 1}, "p5": {"b": 1, "t": 1}}	t	\N
6	6	10493	0	5	\N	\N	{2,4,4,9}	\N	{"p1": {"b": 3}, "p2": {"b": 0}, "p3": {"b": 1, "t": 3}, "p4": {"b": 4}, "p5": {"b": 1, "t": 1}}	t	\N
2	5	1000350	0	538	\N	0	{4,6,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	91
4	6	1000151	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000153	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
7	6	1000006	0	\N	\N	\N	{20,22,21,23}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
34	6	12720	2	2	\N	5	{2,4,4,7}	\N	{"p1": {"": 1, "a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 3, "t": 0}, "p3": {"a": 2, "b": 1, "t": 0}, "p4": {"a": 3, "b": 2, "t": 3}}	t	4
2	6	1000051	0	351	\N	\N	{3,3,3,3}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}}	t	239
2	5	1000071	0	374	\N	0	\N	\N	\N	t	114
7	5	2000209	0	\N	\N	\N	{10,11,10,11}	\N	{"p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	5	2000212	0	\N	\N	\N	{5,5,6,6}	\N	{"p1": {"b": 1}, "p5": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}}	t	\N
7	6	2000198	0	\N	\N	\N	\N	\N	\N	t	\N
2	6	1000221	0	327	\N	\N	{4,4,5,5}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	221
7	6	2000200	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000214	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000215	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000202	0	\N	\N	\N	{17,24,17,24}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p23": {"b": 3, "t": 3}, "p26": {"b": 1, "t": 1}, "p27": {"b": 2, "t": 2}, "p30": {"b": 2, "t": 2}}	t	\N
2	5	1000321	0	486	\N	0	{2,2,2,2}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}}	t	102
2	5	1000349	0	537	\N	0	{2,2,2,2}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}}	t	102
1611	5	11149	0	7	\N	0	{1,6,4,11}	\N	{"p1": {"a": 4, "b": 1, "t": 0}, "p2": {"a": 4, "b": 1, "t": 0}, "p3": {"a": 6, "b": 5, "t": 0}, "p4": {"a": 6, "b": 4, "t": 6}}	t	9
2	6	1000295	0	459	\N	\N	\N	\N	\N	t	252
7	6	2000228	0	\N	\N	\N	\N	\N	\N	t	\N
7	6	2000229	0	\N	\N	\N	\N	\N	\N	t	\N
2	5	65104	0	370	\N	0	{9,13,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	46
6	5	7052	0	7	\N	\N	{1,3,3,5}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p2": {"b": 1}, "p3": {"b": 0}, "p4": {"b": 0, "t": 0}, "p5": {"b": 3, "t": 3}}	t	\N
6	6	7492	2	3	\N	\N	{4,8,4,5}	\N	{"p1": {"b": 2, "t": 4}, "p2": {"b": 1, "t": 2}, "p3": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}}	t	\N
6	6	11724	2	4	\N	\N	{1,2,3,7}	\N	{"p1": {"b": 0}, "p2": {"b": 1}, "p3": {"b": 2, "t": 2}, "p4": {"b": 4}}	t	\N
4	5	73552	0	\N	\N	\N	{11,17,14,14}	\N	\N	t	\N
34	5	7641	2	2	\N	5	{1,6,2,7}	\N	{"p1": {"a": 6, "b": 6, "t": 6}, "p2": {"": 3, "a": 3, "b": 1, "t": 0}, "p3": {"a": 4, "b": 0, "t": null}, "p4": {"": null, "a": 6, "b": 0, "t": null}}	t	5
4	6	1000414	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000560	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
2	6	13415	0	3	\N	\N	{28,34,28,28}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 1, "t": 2}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 2}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 2}, "p29": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": 1}}	t	2
7	5	57446	0	\N	\N	\N	{22,24,26,28}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 3, "t": 3}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
3	6	1000052	0	28	\N	1	\N	\N	\N	t	51
7	5	2000219	0	\N	\N	\N	{6,7,12,13}	\N	{"p5": {"b": 1, "t": 1}, "p7": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1}, "p22": {"b": 1}, "p26": {"b": 1}, "p30": {"b": 1}}	t	\N
7	6	2000221	0	\N	\N	\N	{15,18,15,18}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 3, "t": 3}, "p26": {"b": 2, "t": 2}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	6	2000222	0	\N	\N	\N	{6,8,9,11}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p21": {"b": 1, "t": 1}, "p26": {"b": 2, "t": 2}, "p30": {"b": 1}}	t	\N
1611	5	12039	0	1	\N	0	{3,8,4,14}	\N	{"p1": {"": null, "a": 1, "b": 1, "t": 1}, "p2": {"": 3, "a": 3, "b": 2, "t": 3}, "p3": {"a": 4, "b": 1, "t": 4}, "p4": {"a": 12, "b": 10, "t": 0}}	t	2
2	6	6006	0	13	\N	\N	{14,16,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	88
2	5	10818	3	2	\N	5	{1,2,2,3}	\N	{"p1": {"a": 3, "b": 1, "t": 0}, "p2": {"a": 2, "b": 2, "t": 2}, "p3": {"a": 4, "b": 0, "t": 0}, "p4": {"a": 4, "b": null, "t": null}}	t	6
6	5	12655	0	6	\N	\N	{5,5,5,5}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}}	t	\N
6	5	8247	0	1	\N	\N	{5,6,5,6}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}}	t	\N
6	5	57446	0	3	\N	\N	{5,9,5,5}	\N	{"p1": {"b": 1, "t": 5}, "p2": {"b": 1, "t": 1}, "p3": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}}	t	\N
4	6	1000637	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000438	0	\N	\N	\N	{17,20,21,21}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 3}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
2	5	1000036	0	300	\N	0	{7,8,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	61
34	6	12501	2	4	\N	3	{4,9,4,6}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 2, "b": 1, "t": 2}, "p4": {"a": 4, "b": 2, "t": 4}}	t	1
3	6	1000189	0	51	\N	1	{2,4,2,3}	\N	{"p1": {"a": 3, "b": 2, "t": 3}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 1, "t": 1}}	t	14
3	5	57450	0	22	\N	1	{5,7,5,7}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 2, "b": 2, "t": 2}, "p5": {"a": 2, "b": 2, "t": 2}}	t	4
1611	5	6326	0	2	\N	0	{3,4,4,10}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 2, "b": 2, "t": 2}, "p4": {"a": 8, "b": 6, "t": 0}}	t	4
7	5	57450	0	\N	\N	\N	{22,24,26,28}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p11": {"b": 2, "t": 2}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}}	t	\N
7	5	2000227	0	\N	\N	\N	{7,12,9,14}	\N	{"p1": {"b": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 3, "t": 3}, "p8": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p14": {"a": null, "b": null, "t": null}, "p15": {"b": 2, "t": 2}, "p16": {"b": 3, "t": 3}, "p17": {"b": 1, "t": 1}}	t	\N
6	6	10709	2	8	\N	\N	{2,7,4,8}	\N	{"p1": {"b": 3}, "p2": {"b": 1}, "p3": {"b": 2, "t": 3}, "p4": {"b": 2, "t": 4}}	t	\N
6	5	10489	0	5	\N	\N	{3,7,4,9}	\N	{"p1": {"b": 2, "t": 3}, "p2": {"b": 1, "t": 1}, "p3": {"b": 3}, "p4": {"b": 0}, "p5": {"b": 3, "t": 3}}	t	\N
6	6	10493	2	1	\N	\N	{1,9,4,11}	\N	{"p1": {"b": 4, "t": 9}, "p2": {"b": 1}, "p3": {"b": 5}, "p4": {"b": 1}}	t	\N
6	6	13415	2	2	\N	\N	{1,5,4,5}	\N	{"p1": {"b": 1, "t": 5}, "p2": {"b": 2}, "p3": {"b": 1}, "p4": {"b": 1}}	t	\N
6	5	9740	0	9	\N	\N	{0,0,2,7}	\N	{"p1": {"b": 0}, "p2": {"b": 1}, "p3": {"b": 6}, "p4": {"b": 0, "t": 0}, "p5": {"b": 0}}	t	\N
6	5	10490	0	10	\N	\N	{0,0,2,11}	\N	{"p1": {"b": 0}, "p2": {"b": 4}, "p3": {"b": 7}, "p4": {"b": 0}, "p5": {"b": 0}}	t	\N
2	6	1000253	0	417	\N	\N	\N	\N	\N	t	252
2	6	1000252	0	416	\N	\N	\N	\N	\N	t	252
2	6	1000251	0	415	\N	\N	\N	\N	\N	t	252
4	6	1000566	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
6	6	10963	2	6	\N	\N	{1,1,4,6}	\N	{"p1": {"b": 2}, "p2": {"b": 1}, "p3": {"b": 1, "t": 1}, "p4": {"b": 2}}	t	\N
4	5	13250	0	\N	\N	\N	{17,20,22,22}	\N	\N	t	\N
6	5	12655	2	2	\N	\N	{3,7,4,6}	\N	{"p1": {"a": 3, "b": 3, "t": null}, "p2": {"b": 1, "t": 3}, "p3": {"b": 1, "t": 3}, "p4": {"b": 1, "t": 1}}	t	\N
6	5	57750	2	4	\N	\N	{1,1,3,6}	\N	{"p1": {"b": 0}, "p2": {"b": 4}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}}	t	\N
6	5	10489	2	1	\N	\N	{2,3,3,4}	\N	{"p1": {"a": 5, "b": 0}, "p2": {"b": 1, "t": 1}, "p3": {"b": 2}, "p4": {"b": 1, "t": 2}}	t	\N
6	6	57746	2	7	\N	\N	{0,0,2,18}	\N	{"p1": {"b": 11}, "p2": {"b": 7}, "p3": {"b": 0}, "p4": {"b": 0}}	t	\N
6	5	10490	2	6	\N	\N	{1,5,2,5}	\N	{"p1": {"b": 0}, "p2": {"b": 3, "t": 5}, "p3": {"b": 0}, "p4": {"b": 2}}	t	\N
6	5	11498	2	8	\N	\N	{2,6,3,6}	\N	{"p1": {"b": 0}, "p2": {"b": 1, "t": 2}, "p3": {"b": 1}, "p4": {"b": 4, "t": 4}}	t	\N
6	5	57446	2	9	\N	\N	{3,5,3,5}	\N	{"p1": {"b": 0}, "p2": {"b": 1, "t": 1}, "p3": {"b": 2, "t": 2}, "p4": {"b": 2, "t": 2}}	t	\N
4	6	1000556	0	\N	\N	\N	{8,12,10,10}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 3}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
4	5	71352	0	\N	\N	\N	{12,17,14,14}	\N	\N	t	\N
3	5	13386	0	12	\N	1	{5,9,5,7}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"a": 11, "b": 1, "t": 2}, "p4": {"a": 2, "b": 2, "t": 2}, "p5": {"a": 2, "b": 2, "t": 2}}	t	8
3	5	12655	0	4	\N	1	{5,5,5,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 1, "b": 1, "t": 1}, "p5": {"a": 1, "b": 1, "t": 1}}	t	5
2	6	1000063	0	363	\N	\N	\N	\N	\N	t	252
7	5	12856	0	\N	\N	\N	{21,22,25,26}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	5	1000308	0	473	\N	0	{3,3,7,7}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": null}, "p5": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": null}}	t	95
4	5	70752	0	\N	\N	\N	{19,23,20,20}	\N	\N	t	\N
7	6	2000118	0	\N	\N	\N	{13,14,14,15}	\N	{"p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 2, "t": 2}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
4	6	6488	2	13	\N	8	{2,2,4,6}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 3, "b": 3, "t": 0}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
2	5	1000122	0	92	\N	0	{10,11,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	28
2	5	9945	2	11	\N	10	{1,6,1,2}	\N	{"p1": {"a": 14, "b": 0, "t": null}, "p2": {"a": 1, "b": 0, "t": null}, "p3": {"a": 6, "b": 2, "t": 6}, "p4": {"a": 3, "b": 0, "t": null}}	t	13
2	6	1000261	0	425	\N	\N	{3,5,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 3}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}}	t	243
2	6	1000296	0	460	\N	\N	{8,11,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	161
2	5	1000326	0	491	\N	0	{3,5,3,3}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}}	t	100
2	6	1000236	0	400	\N	\N	\N	\N	\N	t	252
7	6	2000224	0	\N	\N	\N	{6,8,9,11}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 2, "t": 2}, "p22": {"b": 1}, "p26": {"b": 1}, "p30": {"b": 1}}	t	\N
7	5	9784	0	\N	\N	\N	{15,16,19,20}	\N	{"p1": {"b": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1}, "p26": {"b": 2, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1}}	t	\N
2	6	1000228	0	334	\N	\N	\N	\N	\N	t	252
2	5	11498	2	3	\N	18	{0,0,2,12}	\N	{"p1": {"a": 16, "b": 6, "t": 0}, "p2": {"a": 6, "b": 6, "t": 0}, "p3": {"a": 10, "b": 0, "t": null}, "p4": {"a": 5, "b": 0, "t": null}}	t	16
6	5	8247	3	7	\N	\N	\N	\N	\N	t	\N
6	5	11498	3	8	\N	\N	\N	\N	\N	t	\N
6	5	57446	3	9	\N	\N	\N	\N	\N	t	\N
6	5	65104	3	10	\N	\N	\N	\N	\N	t	\N
6	6	10493	3	1	\N	\N	{0,0,1,5}	\N	{"p1": {"a": 7, "b": 5, "t": 0}, "p2": {"a": 3, "b": 0, "t": null}}	t	\N
7	5	10338	0	\N	\N	\N	{24,30,26,32}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p9": {"b": 3, "t": 3}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 3, "t": 3}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 2, "t": 2}}	t	\N
7	5	10490	0	\N	\N	\N	{19,19,22,22}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
6	5	7052	3	3	\N	\N	{0,0,1,1}	\N	{"p1": {"a": 1, "b": 1, "t": null}, "p2": {"a": 4, "b": 0, "t": null}}	t	\N
4	6	1000259	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
2	6	11912	0	135	\N	\N	{25,33,25,25}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 2}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 3}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": 2}}	t	16
2	6	1000053	0	353	\N	\N	{8,11,10,10}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	165
2	6	1000054	0	354	\N	\N	\N	\N	\N	t	252
2	5	1000231	0	341	\N	0	\N	\N	\N	t	114
1611	6	10458	0	10	\N	0	{0,0,1,3}	\N	{"p1": {"a": 4, "b": 0, "t": null}, "p2": {"a": 7, "b": 0, "t": null}, "p3": {"a": 12, "b": 3, "t": 0}, "p4": {"a": 5, "b": 0, "t": null}}	t	9
7	6	1000173	0	\N	\N	\N	{15,15,17,17}	\N	{"p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1}, "p9": {"b": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	6	1000104	0	51	\N	\N	{12,14,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	110
2	6	1000334	0	517	\N	\N	{4,6,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 3}}	t	235
2	5	1000311	0	476	\N	0	{1,3,2,2}	\N	{"p3": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 3}}	t	112
2	5	1000039	0	303	\N	0	\N	\N	\N	t	114
6	6	57746	3	7	\N	\N	{0,0,0,0}	\N	{"p1": {"a": 1, "b": 0, "t": null}, "p2": {"a": null, "b": null, "t": null}, "p4": {"a": 4, "b": null, "t": null}}	t	\N
6	5	57750	3	4	\N	\N	{0,0,0,0}	\N	{"p1": {"a": 1, "b": 0, "t": null}}	t	\N
7	6	9537	0	\N	\N	\N	{26,27,26,27}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"a": null, "b": null, "t": null}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000281	0	\N	\N	\N	{9,13,10,14}	\N	{"p1": {"a": null, "b": null, "t": null}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 3, "t": 3}, "p22": {"b": 1}, "p26": {"b": 3, "t": 3}, "p27": {"b": 1, "t": 1}}	t	\N
4	5	13447	2	11	\N	10	{1,1,4,11}	\N	{"p1": {"": 1, "a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 4, "t": 0}, "p3": {"a": 2, "b": 2, "t": 0}, "p4": {"a": 4, "b": 4, "t": 0}}	t	\N
2	5	1000317	0	482	\N	0	{5,7,7,7}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	81
34	5	11377	2	3	\N	4	{0,0,2,11}	\N	{"p1": {"a": 9, "b": 7, "t": 0}, "p2": {"a": 5, "b": 0, "t": null}, "p3": {"": 4, "a": 4, "b": 4, "t": 0}, "p4": {"a": 6, "b": 0, "t": null}}	t	6
3	6	10825	3	1	\N	6	{4,14,4,9}	\N	{"p1": {"a": 5, "b": 1, "t": 5}, "p2": {"a": 4, "b": 4, "t": 4}, "p3": {"a": 2, "b": 2, "t": 2}, "p4": {"a": 3, "b": 2, "t": 3}}	t	2
7	6	2000082	0	\N	\N	\N	{18,22,21,25}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 3, "t": 3}}	t	\N
2	5	1000536	0	269	\N	0	{8,10,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	53
7	5	12670	0	\N	\N	\N	{25,31,26,32}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 3, "t": 3}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 3, "t": 3}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 2, "t": 2}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000170	0	\N	\N	\N	{21,26,25,30}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 3, "t": 3}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 3, "t": 3}, "p29": {"b": 1, "t": 1}}	t	\N
7	5	13386	0	\N	\N	\N	{22,27,25,30}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 2, "t": 2}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 2, "t": 2}, "p23": {"b": 2, "t": 2}, "p25": {"b": 3, "t": 3}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000216	0	\N	\N	\N	{13,15,16,18}	\N	{"p1": {"b": 2, "t": 2}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 2, "t": 2}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1}, "p30": {"b": 1}}	t	\N
2	5	1000233	0	343	\N	0	{8,10,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	53
1572	63	9018	1	6	\N	0	{0,0,0,0}	\N	{"p1": {"a": 1, "b": 0, "t": null}}	t	5
4	6	11522	2	5	\N	16	{0,0,2,4}	\N	{"p1": {"a": 3, "b": 1, "t": 0}, "p2": {"a": 3, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 3, "b": 3, "t": 0}}	t	\N
4	5	11149	2	13	\N	8	{2,5,4,7}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 2, "t": 0}, "p3": {"a": 1, "b": 1, "t": 0}, "p4": {"a": 4, "b": 3, "t": 4}}	t	\N
4	5	12856	2	8	\N	12	{0,0,1,1}	\N	{"p1": {"": null, "a": 3, "b": 1, "t": 0}, "p2": {"a": 8, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}}	t	\N
4	6	9487	2	11	\N	10	{0,0,1,2}	\N	{"p1": {"a": 8, "b": 0, "t": 0}, "p2": {"a": 5, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 2, "b": 2, "t": 0}}	t	\N
2	6	1000186	0	241	\N	\N	{21,31,23,23}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": null}, "p30": {"a": null, "b": 1, "t": 3}}	t	50
1611	6	5089	0	8	\N	0	{0,0,1,9}	\N	{"p1": {"a": 4, "b": 0, "t": null}, "p2": {"a": 3, "b": 0, "t": null}, "p3": {"a": 9, "b": 9, "t": 0}, "p4": {"a": 3, "b": 0, "t": null}}	t	11
7	6	2000218	0	\N	\N	\N	{11,11,12,12}	\N	{"p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p19": {"b": 1}, "p22": {"b": 1, "t": 1}, "p23": {"a": null, "b": null, "t": null}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
34	6	10618	2	6	\N	1	{1,4,2,5}	\N	{"p1": {"a": 4, "b": 1, "t": 0}, "p2": {"a": 4, "b": 0, "t": null}, "p3": {"a": 4, "b": 0, "t": null}, "p4": {"a": 4, "b": 4, "t": 4}}	t	5
2	6	1000050	0	350	\N	\N	\N	\N	\N	t	252
2	5	1000069	0	372	\N	0	{1,1,2,2}	\N	{"p3": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}}	t	108
2	5	1000116	0	76	\N	0	\N	\N	\N	t	114
6	6	10709	3	8	\N	\N	{1,4,2,4}	\N	{"p1": {"a": 4, "b": 2, "t": null}, "p2": {"a": null, "b": null, "t": null}, "p4": {"a": 4, "b": 2, "t": 4}}	t	\N
7	6	6623	0	\N	\N	\N	{27,28,29,30}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 1, "t": 1}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p14": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	5	2000051	0	\N	\N	\N	{2,4,6,8}	\N	{"p4": {"b": 1}, "p5": {"b": 1}, "p7": {"b": 1}, "p10": {"b": 3, "t": 3}, "p15": {"b": 1}, "p17": {"b": 1, "t": 1}}	t	\N
2	5	1000148	0	166	\N	0	\N	\N	\N	t	114
4	6	7627	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000214	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
2	6	12701	0	116	\N	\N	{18,25,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 3}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 0, "t": null}, "p29": {"a": null, "b": 0, "t": null}}	t	71
2	5	13250	0	124	\N	0	{8,10,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	50
2	5	1000210	0	278	\N	0	{8,8,13,13}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	44
2	6	1000263	0	427	\N	\N	{5,5,5,5}	\N	{"p1": {"a": null, "b": null, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	202
2	6	1000166	0	218	\N	\N	{8,8,10,10}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	151
7	6	10345	0	\N	\N	\N	\N	\N	\N	t	\N
2	5	1000309	0	474	\N	0	{3,3,5,5}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}}	t	96
6	5	12655	3	2	\N	\N	{0,0,2,4}	\N	{"p1": {"a": 2, "b": 3, "t": 0}, "p2": {"a": 1, "b": 1, "t": 0}}	t	\N
2	6	10833	0	144	\N	\N	{19,26,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 3}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	58
2	6	1000336	0	519	\N	\N	{7,9,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	173
2	6	1000239	0	403	\N	\N	{5,5,12,12}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	194
2	5	1000324	0	489	\N	0	{3,3,3,3}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}}	t	97
2	6	1000076	0	502	\N	\N	\N	\N	\N	t	252
2	6	9492	0	233	\N	\N	{20,22,23,23}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": null}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": null}, "p30": {"a": null, "b": 1, "t": 2}}	t	40
2	5	1000199	0	267	\N	0	\N	\N	\N	t	114
2	5	1000202	0	270	\N	0	\N	\N	\N	t	114
6	5	10489	3	1	\N	\N	{1,3,2,4}	\N	{"p1": {"a": 3, "b": 2, "t": 0}, "p2": {"a": 3, "b": 2, "t": 3}}	t	\N
4	5	11498	2	10	\N	11	{1,1,3,10}	\N	{"p1": {"": 1, "a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 0, "t": 0}, "p3": {"a": 3, "b": 3, "t": 0}, "p4": {"a": 6, "b": 6, "t": 0}}	t	\N
4	6	8870	2	16	\N	5	{3,7,3,4}	\N	{"p1": {"a": 3, "b": 1, "t": 3}, "p2": {"a": 3, "b": 0, "t": 0}, "p3": {"a": 2, "b": 2, "t": 2}, "p4": {"a": 2, "b": 1, "t": 2}}	t	\N
4	6	9537	2	14	\N	7	{4,8,4,7}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 3, "b": 3, "t": 3}, "p4": {"a": 3, "b": 2, "t": 3}}	t	\N
2	5	1000015	0	191	\N	0	{10,15,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	37
2	5	1000046	0	313	\N	0	{9,13,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 3}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	47
2	6	1000249	0	413	\N	\N	{4,4,4,4}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}}	t	222
7	6	9046	0	\N	\N	\N	{28,35,28,35}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 2, "t": 2}, "p3": {"b": 3, "t": 3}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 2, "t": 2}, "p19": {"b": 1, "t": 1}, "p20": {"b": 2, "t": 2}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 2, "t": 2}, "p24": {"b": 1, "t": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
2	6	1000276	0	440	\N	\N	{6,7,6,6}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 2}}	t	188
2	6	1000155	0	205	\N	\N	{8,8,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	150
4	6	8453	2	15	\N	6	{1,3,3,5}	\N	{"p1": {"a": 6, "b": 2, "t": 0}, "p2": {"": 3, "a": 3, "b": 0, "t": 0}, "p3": {"a": 3, "b": 2, "t": 3}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
4	5	10515	2	12	\N	9	{3,6,3,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"": 1, "a": 1, "b": 1, "t": 1}, "p3": {"a": 4, "b": 3, "t": 4}, "p4": {"a": 1, "b": 0, "t": 0}}	t	\N
4	6	13415	2	17	\N	4	{3,7,4,9}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 4, "b": 4, "t": 4}, "p4": {"a": 2, "b": 2, "t": 0}}	t	\N
7	6	1000581	0	\N	\N	\N	{23,24,27,28}	\N	{"p1": {"a": null, "b": null, "t": null}, "p2": {"b": 2, "t": 2}, "p3": {"b": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	1000236	0	\N	\N	\N	{8,11,9,12}	\N	{"p1": {"a": null, "b": null, "t": null}, "p5": {"b": 1, "t": 1}, "p7": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p26": {"b": 3, "t": 3}, "p30": {"b": 1}}	t	\N
2	5	13179	0	312	\N	0	{10,13,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	34
4	5	11149	3	1	\N	6	{2,3,4,7}	\N	{"p1": {"a": 3, "b": 2, "t": 0}, "p2": {"a": 4, "b": 2, "t": 0}, "p3": {"a": 2, "b": 2, "t": 2}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
2	6	1000302	0	467	\N	\N	{6,7,6,6}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	188
7	6	12652	0	\N	\N	\N	{25,29,27,31}	\N	{"p1": {"b": 1, "t": 1}, "p2": {"b": 3, "t": 3}, "p3": {"a": null, "b": null, "t": null}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 2, "t": 2}, "p7": {"b": 1, "t": 1}, "p8": {"b": 1, "t": 1}, "p9": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p11": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p13": {"b": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1}, "p25": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
7	6	2000187	0	\N	\N	\N	{17,17,19,19}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1, "t": 0}, "p19": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p25": {"b": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	t	\N
3	6	1000392	0	42	\N	1	{0,0,0,0}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	44
4	6	11795	3	3	\N	4	{1,1,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 3, "b": 1, "t": 0}, "p3": {"a": 4, "b": 0, "t": null}, "p4": {"a": 7, "b": 0, "t": null}}	t	\N
4	6	1000104	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
2	5	13386	0	121	\N	0	{12,20,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 3}, "p14": {"a": null, "b": 1, "t": 3}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	29
2	6	1000294	0	458	\N	\N	\N	\N	\N	t	252
2	5	1000319	0	484	\N	0	{4,6,5,5}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": null}}	t	89
1611	5	11149	-8	7	\N	0	\N	\N	\N	t	9
1611	5	9794	-8	10	\N	0	\N	\N	\N	t	11
3	5	59030	0	6	\N	1	{4,8,5,14}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 2, "b": 1, "t": 2}, "p4": {"a": 4, "b": 4, "t": 4}, "p5": {"a": 7, "b": 7, "t": 0}}	t	7
2	6	1000328	0	511	\N	\N	{5,6,6,6}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	211
7	5	2000006	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000008	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000010	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000012	0	\N	\N	\N	\N	\N	\N	t	\N
7	5	2000013	0	\N	\N	\N	\N	\N	\N	t	\N
3	6	1000183	0	43	\N	1	{3,11,4,11}	\N	{"p1": {"a": 4, "b": 3, "t": 4}, "p2": {"a": 1, "b": 1, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 4, "b": 4, "t": 4}, "p5": {"a": 3, "b": 3, "t": 3}}	t	15
2	6	8245	0	49	\N	\N	{24,29,28,28}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": null}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 1, "t": 2}, "p9": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": null}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": null}, "p29": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	17
2	6	1000297	0	461	\N	\N	{5,8,6,6}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 3}, "p27": {"a": null, "b": 1, "t": 2}}	t	218
2	6	1000158	0	208	\N	\N	{12,14,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	109
3	6	1000371	0	11	\N	1	{3,12,4,15}	\N	{"p1": {"a": 5, "b": 3, "t": 5}, "p2": {"a": 4, "b": 3, "t": 4}, "p3": {"a": 7, "b": 7, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 3, "b": 2, "t": 3}}	t	20
1572	63	8172	0	1	\N	0	{0,0,1,1}	\N	{"p1": {"a": 1, "b": 1, "t": 0}, "p4": {"a": null, "b": null, "t": null}}	t	1
4	5	9945	3	5	\N	2	{0,0,3,7}	\N	{"p1": {"": null, "a": 3, "b": 1, "t": 0}, "p2": {"a": 4, "b": 4, "t": 0}, "p3": {"a": 8, "b": 0, "t": null}, "p4": {"a": 4, "b": 2, "t": 0}}	t	\N
2	6	1000029	0	293	\N	\N	{4,5,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": null, "t": null}}	t	229
7	6	2000143	0	\N	\N	\N	\N	\N	\N	t	\N
4	6	10370	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000242	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	10515	3	4	\N	3	{0,0,3,7}	\N	{"p1": {"a": 3, "b": 1, "t": 0}, "p2": {"a": 6, "b": 0, "t": null}, "p3": {"a": 7, "b": 3, "t": 0}, "p4": {"a": 4, "b": 3, "t": 0}}	t	\N
2	6	1000275	0	439	\N	\N	{13,16,18,18}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	104
2	5	1000117	0	77	\N	0	{6,7,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	69
2	6	1000102	0	47	\N	\N	{10,12,10,10}	\N	{"p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 0, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	137
2	6	11795	0	229	\N	\N	{22,29,23,23}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": null}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 3}, "p30": {"a": null, "b": 1, "t": 1}}	t	38
2	6	6488	3	1	\N	6	{0,0,2,5}	\N	{"p1": {"a": 5, "b": 1, "t": 0}, "p2": {"a": 7, "b": 0, "t": null}, "p3": {"a": 7, "b": 4, "t": 0}, "p4": {"a": 3, "b": 0, "t": null}}	t	5
2	6	1000084	0	9	\N	\N	{10,13,10,10}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	139
2	5	1000146	0	164	\N	0	{8,14,8,8}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	65
4	5	10338	0	\N	\N	\N	{26,29,26,26}	\N	\N	t	\N
4	5	9945	0	\N	\N	\N	{23,27,25,25}	\N	\N	t	\N
2	6	1000246	0	410	\N	\N	{10,13,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	138
2	5	6367	2	20	\N	1	{2,2,3,7}	\N	{"p1": {"a": 9, "b": 5, "t": 0}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 4, "b": 0, "t": 0}}	t	2
4	5	52305	0	\N	\N	\N	{22,25,24,24}	\N	\N	t	\N
4	5	11149	0	\N	\N	\N	{21,25,23,23}	\N	\N	t	\N
4	5	57450	0	\N	\N	\N	{20,26,24,24}	\N	\N	t	\N
4	5	12856	0	\N	\N	\N	{20,25,22,22}	\N	\N	t	\N
4	6	1000537	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000286	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
2	6	1000005	0	114	\N	\N	{17,18,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	61
2	6	1000074	0	500	\N	\N	{4,4,7,7}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}}	t	220
1572	284	50699	0	5	\N	0	{0,0,1,1}	\N	{"p1": {"a": 1, "b": 1, "t": 0}}	t	3
4	6	12517	2	20	\N	1	{3,8,4,8}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"a": 5, "b": 5, "t": 5}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
3	6	10963	3	3	\N	4	{2,7,3,8}	\N	{"p1": {"a": 4, "b": 1, "t": 0}, "p2": {"a": 5, "b": 0, "t": null}, "p3": {"a": 5, "b": 5, "t": 5}, "p4": {"a": 2, "b": 2, "t": 2}}	t	6
3	6	1000003	0	13	\N	1	{3,8,4,8}	\N	{"p1": {"a": 21, "b": 1, "t": 2}, "p2": {"a": 2, "b": 2, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 4, "b": 3, "t": 4}, "p5": {"a": 2, "b": 2, "t": 2}}	t	17
2	6	1000183	0	238	\N	\N	{14,14,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	79
2	6	1000256	0	420	\N	\N	\N	\N	\N	t	252
2	5	1000313	0	536	\N	0	{5,6,8,8}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	79
2	6	1000006	0	117	\N	\N	{15,21,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	90
2	5	1000315	0	480	\N	0	{2,2,2,2}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}}	t	102
2	5	1000017	0	193	\N	0	{8,8,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	43
2	5	1000325	0	490	\N	0	{6,8,7,7}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	72
2	5	1000353	0	541	\N	0	{4,4,6,6}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}}	t	84
4	6	9058	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000103	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
2	6	1000089	0	22	\N	\N	{5,5,5,5}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	202
2	6	1000178	0	231	\N	\N	{5,5,6,6}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	200
2	6	1000244	0	408	\N	\N	{6,7,6,6}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	188
1611	6	10172	0	3	\N	0	{0,0,3,8}	\N	{"p1": {"a": 4, "b": 2, "t": 0}, "p2": {"a": 5, "b": 1, "t": 0}, "p3": {"a": 10, "b": 5, "t": 0}, "p4": {"a": 5, "b": 0, "t": null}}	t	7
2	5	12856	0	190	\N	0	{13,18,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	24
2	6	1000000	0	110	\N	\N	{11,15,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 3}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	129
2	6	11148	0	6	\N	\N	{19,25,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 3}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 3}}	t	56
2	6	1000222	0	328	\N	\N	{9,11,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	145
2	6	1000262	0	426	\N	\N	{14,15,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p8": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	84
2	6	12652	0	280	\N	\N	{14,19,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 3}, "p17": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	96
4	6	1000165	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000447	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
2	6	10493	2	1	\N	18	{0,0,1,4}	\N	{"p1": {"a": 6, "b": 0, "t": null}, "p2": {"a": 1, "b": 0, "t": null}, "p3": {"a": 4, "b": 0, "t": null}, "p4": {"a": 4, "b": 4, "t": 0}}	t	17
2	6	1000082	0	2	\N	\N	{18,28,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 3}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 3}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	74
2	6	1000101	0	45	\N	\N	{11,15,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	129
2	6	10962	0	62	\N	\N	{20,24,20,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	46
2	5	1000361	0	378	\N	0	{10,14,13,13}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	35
2	5	10957	2	13	\N	8	{1,4,1,4}	\N	{"p1": {"a": 17, "b": 0, "t": null}, "p2": {"a": 4, "b": 4, "t": 4}, "p3": {"a": 14, "b": 0, "t": null}, "p4": {"a": 4, "b": 0, "t": null}}	t	12
2	6	9785	0	214	\N	\N	{22,26,24,24}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": null}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 2}, "p29": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	34
2	6	1000152	0	202	\N	\N	{14,19,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	97
2	6	5176	2	14	\N	7	{0,0,2,5}	\N	{"p1": {"a": 6, "b": 0, "t": null}, "p2": {"a": 5, "b": 2, "t": 0}, "p3": {"a": 6, "b": 3, "t": 0}, "p4": {"a": 3, "b": 0, "t": null}}	t	13
4	6	1000304	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000013	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
2	6	1000142	0	153	\N	\N	{13,18,13,13}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	106
2	5	1000234	0	345	\N	0	{9,11,12,12}	\N	{"p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	38
2	5	8101	0	91	\N	0	{19,20,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	2
2	6	1000337	0	520	\N	\N	{3,4,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}}	t	241
2	6	6623	0	65	\N	\N	{26,28,26,26}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 1, "t": 2}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	3
4	6	12517	3	2	\N	5	{2,4,4,8}	\N	{"p1": {"a": 5, "b": 5, "t": 0}, "p2": {"a": 3, "b": 1, "t": 3}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 4, "b": 1, "t": 0}}	t	\N
2	5	10328	0	72	\N	0	{15,17,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	9
2	5	9784	0	265	\N	0	{8,12,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	60
2	6	13415	2	19	\N	2	{0,0,0,0}	\N	{"p1": {"a": 6, "b": 0, "t": null}, "p2": {"a": 7, "b": 0, "t": null}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 4, "b": 0, "t": null}}	t	19
2	6	10984	2	2	\N	18	{0,0,1,2}	\N	{"p1": {"a": 5, "b": 0, "t": null}, "p2": {"a": 6, "b": 0, "t": null}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 4, "b": 2, "t": 0}}	t	16
4	6	312	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000546	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
2	6	1000030	0	294	\N	\N	{8,9,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	154
1611	5	12039	2	5	\N	2	{3,10,3,8}	\N	{"p1": {"a": 6, "b": 5, "t": 6}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 2, "b": 2, "t": 2}}	t	2
1611	6	12720	2	2	\N	5	{2,4,4,7}	\N	{"p1": {"": 1, "a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 3, "t": 0}, "p3": {"a": 2, "b": 1, "t": 0}, "p4": {"a": 3, "b": 2, "t": 3}}	t	4
1611	6	12501	2	4	\N	3	{4,9,4,6}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 2, "b": 1, "t": 2}, "p4": {"a": 4, "b": 2, "t": 4}}	t	1
2	6	1000013	0	185	\N	\N	{17,20,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	68
2	6	1000151	0	201	\N	\N	{18,20,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	53
2	5	1000203	0	271	\N	0	{4,6,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}}	t	91
2	6	1000274	0	438	\N	\N	{5,5,5,5}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	202
2	6	5176	0	23	\N	\N	{26,31,26,26}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 3}, "p30": {"a": null, "b": 1, "t": 1}}	t	7
2	5	1000197	0	262	\N	0	{4,6,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}}	t	91
2	6	1000032	0	296	\N	\N	{9,13,13,13}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": 3}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	153
4	6	1000547	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	10825	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
2	5	11705	0	162	\N	0	{14,20,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 3}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 2}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	20
2	6	1000132	0	136	\N	\N	{10,10,10,10}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	125
2	6	1000355	0	64	\N	\N	{22,28,22,22}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": 1}}	t	35
2	6	1000268	0	432	\N	\N	{4,5,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}}	t	229
4	6	8870	3	1	\N	6	{3,4,4,4}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 3, "b": 1, "t": 0}}	t	\N
2	5	10936	0	70	\N	0	{8,10,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	51
2	6	1000081	0	1	\N	\N	{7,10,7,7}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	176
2	6	8245	2	4	\N	17	{0,0,2,6}	\N	{"p1": {"a": 4, "b": 0, "t": null}, "p2": {"a": 5, "b": 3, "t": 0}, "p3": {"a": 4, "b": 3, "t": 0}, "p4": {"a": 6, "b": 0, "t": null}}	t	14
3	5	12655	3	3	\N	4	{4,9,4,8}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 2, "b": 2, "t": 2}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 4, "b": 3, "t": 4}}	t	5
2	5	6367	0	95	\N	0	{22,28,25,25}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 3}, "p10": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": null}, "p29": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": 1}}	t	1
2	6	6724	2	10	\N	11	{0,0,1,5}	\N	{"p1": {"a": 6, "b": 0, "t": null}, "p2": {"a": 6, "b": 5, "t": 0}, "p3": {"a": 8, "b": 0, "t": null}, "p4": {"a": 4, "b": 0, "t": null}}	t	18
4	6	1000456	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
2	6	1000133	0	137	\N	\N	{20,22,20,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	41
2	5	1000320	0	485	\N	0	{1,1,2,2}	\N	{"p7": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}}	t	108
2	6	1000169	0	221	\N	\N	{11,18,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": 3}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	141
1611	6	9046	2	5	\N	2	{2,3,4,8}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 1, "t": 0}, "p3": {"a": 5, "b": 4, "t": 0}, "p4": {"a": 2, "b": 2, "t": 2}}	t	3
2	5	10818	0	84	\N	0	{17,21,22,22}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 3}, "p17": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": null}, "p29": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": null}}	t	4
1611	6	10618	2	6	\N	1	{1,4,2,5}	\N	{"p1": {"a": 4, "b": 1, "t": 0}, "p2": {"a": 4, "b": 0, "t": null}, "p3": {"a": 4, "b": 0, "t": null}, "p4": {"a": 4, "b": 4, "t": 4}}	t	5
3	6	1000109	0	33	\N	1	{0,0,1,6}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 6, "b": 6, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	39
2	6	1000106	0	53	\N	\N	{14,15,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	85
2	6	8453	0	335	\N	\N	{23,27,23,23}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 2}}	t	23
2	6	1000099	0	42	\N	\N	{7,8,7,7}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 0, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	170
2	6	9058	0	5	\N	\N	{26,29,26,26}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p8": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": 1}}	t	4
2	6	10963	0	31	\N	\N	{24,29,24,24}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": 3}}	t	18
1611	6	6623	2	3	\N	4	{3,6,3,4}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 5, "b": 0, "t": null}, "p3": {"a": 3, "b": 2, "t": 3}, "p4": {"a": 2, "b": 1, "t": 2}}	t	2
2	5	8879	0	94	\N	0	{13,16,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 3}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	22
2	6	1000026	0	289	\N	\N	{13,15,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	100
2	5	1000048	0	315	\N	0	{8,12,13,13}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	59
2	6	1000097	0	38	\N	\N	{11,16,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	135
2	5	1000125	0	96	\N	0	{9,12,12,12}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	41
1611	6	11091	2	1	\N	6	{1,5,3,8}	\N	{"p1": {"a": 5, "b": 1, "t": null}, "p2": {"a": 3, "b": 0, "t": null}, "p3": {"a": 3, "b": 2, "t": null}, "p4": {"a": 5, "b": 5, "t": 5}}	t	6
2	6	1000129	0	130	\N	\N	{12,18,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 3}, "p27": {"a": null, "b": 1, "t": 1}}	t	120
2	6	1000245	0	409	\N	\N	{5,6,6,6}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 2}}	t	211
2	5	1000008	0	125	\N	0	{8,10,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	52
2	6	1000078	0	504	\N	\N	{6,6,6,6}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	182
2	5	1000232	0	342	\N	0	{13,19,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	26
2	6	1000273	0	437	\N	\N	{5,5,5,5}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	202
2	6	1000280	0	444	\N	\N	{7,11,8,8}	\N	{"p2": {"a": null, "b": 1, "t": 3}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	183
2	6	1000077	0	503	\N	\N	{8,11,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	160
2	6	7068	0	60	\N	\N	{22,28,22,22}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 3}, "p30": {"a": null, "b": 1, "t": 1}}	t	35
2	6	1000339	0	522	\N	\N	{6,6,9,9}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	178
2	6	1000031	0	295	\N	\N	{15,22,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 3}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	94
2	6	1000225	0	331	\N	\N	{14,18,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	95
2	5	1000127	0	99	\N	0	{9,15,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 3}, "p30": {"a": null, "b": 1, "t": null}}	t	55
1611	6	13316	0	9	\N	0	{0,0,0,0}	\N	{"p1": {"a": 5, "b": 0, "t": null}, "p2": {"a": 12, "b": 0, "t": null}, "p3": {"a": 11, "b": 0, "t": null}, "p4": {"a": 6, "b": 0, "t": null}}	t	12
1611	6	2638	0	11	\N	0	{0,0,1,3}	\N	{"p1": {"a": 5, "b": 0, "t": null}, "p2": {"a": 5, "b": 0, "t": null}, "p3": {"a": 9, "b": 0, "t": null}, "p4": {"a": 5, "b": 3, "t": 0}}	t	9
1611	5	5244	0	5	\N	0	{2,6,4,16}	\N	{"p1": {"a": 4, "b": 1, "t": 4}, "p2": {"a": 2, "b": 2, "t": 2}, "p3": {"a": 6, "b": 4, "t": 0}, "p4": {"a": 10, "b": 9, "t": 0}}	t	7
1611	5	9989	0	4	\N	0	{3,11,4,13}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 3, "t": 4}, "p3": {"a": 5, "b": 3, "t": 0}, "p4": {"a": 6, "b": 6, "t": 6}}	t	3
1611	5	9794	0	10	\N	0	{0,0,2,18}	\N	{"p1": {"a": 8, "b": 0, "t": 0}, "p2": {"a": 6, "b": 3, "t": 0}, "p3": {"a": 11, "b": 0, "t": null}, "p4": {"a": 17, "b": 15, "t": 0}}	t	11
2	6	1000160	0	210	\N	\N	{14,20,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	102
2	6	10915	0	54	\N	\N	{20,23,20,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 3}, "p30": {"a": null, "b": 1, "t": 1}}	t	44
2	6	1000287	0	451	\N	\N	{15,19,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 3}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 0, "t": null}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	81
2	6	7492	0	17	\N	\N	{25,30,26,26}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 3}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 2}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": 1}}	t	13
2	6	1000061	0	361	\N	\N	{2,2,3,3}	\N	{"p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}}	t	247
2	5	9945	0	263	\N	0	{15,18,20,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	10
2	6	11091	0	41	\N	\N	{27,36,27,27}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 3}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 2}, "p29": {"a": null, "b": 1, "t": 3}, "p30": {"a": null, "b": 1, "t": 1}}	t	9
2	6	1000161	0	211	\N	\N	{17,20,21,21}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p10": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	66
2	6	6370	0	36	\N	\N	{20,22,20,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 3}}	t	41
2	6	1000181	0	236	\N	\N	{7,8,7,7}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	170
2	5	10957	0	71	\N	0	{15,17,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 0, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	8
2	6	9425	0	18	\N	\N	{23,28,23,23}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 3}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 2}, "p26": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	27
2	5	1000128	0	100	\N	0	{8,8,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	45
3	6	1000386	0	34	\N	1	{0,0,2,13}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 8, "b": 8, "t": 0}, "p3": {"a": 5, "b": 5, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	34
2	6	1000255	0	419	\N	\N	{4,5,4,4}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}}	t	229
2	6	57746	0	287	\N	\N	{17,20,21,21}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	66
3	6	12517	3	5	\N	2	{3,8,4,5}	\N	{"p1": {"a": 6, "b": 1, "t": 6}, "p2": {"a": 5, "b": 2, "t": 0}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 1, "b": 1, "t": 1}}	t	4
2	6	12697	0	33	\N	\N	{18,20,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	54
2	6	1000159	0	209	\N	\N	{5,5,7,7}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	198
2	6	1000009	0	180	\N	\N	{15,20,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 3}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 3}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	87
2	6	1000136	0	141	\N	\N	{5,5,5,5}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	202
2	5	1000235	0	346	\N	0	{7,11,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 3}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	67
2	6	1000241	0	405	\N	\N	{8,11,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	164
4	5	1000507	0	\N	\N	\N	{5,6,6,6}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": null}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 2}}	t	\N
2	6	1000176	0	228	\N	\N	{11,15,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": null}, "p17": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	127
2	6	10493	0	14	\N	\N	{24,29,24,24}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 3}, "p29": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	18
2	6	3115	0	35	\N	\N	{23,25,23,23}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": 1}}	t	21
2	5	9781	0	163	\N	0	{16,29,21,21}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p7": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	21
3	5	8759	0	9	\N	1	{4,5,5,6}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 2, "b": 2, "t": 0}, "p5": {"a": 1, "b": 1, "t": 1}}	t	18
2	6	1000171	0	223	\N	\N	\N	\N	\N	t	252
2	6	7627	0	244	\N	\N	{20,23,25,25}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p10": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	43
3	6	1000394	0	46	\N	1	{0,0,0,0}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	44
2	6	1000332	0	515	\N	\N	{17,21,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	72
2	6	1000027	0	290	\N	\N	{21,33,25,25}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 3}, "p8": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 1, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": null}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	52
2	6	1000139	0	149	\N	\N	{14,19,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	98
2	6	1000270	0	434	\N	\N	{4,5,5,5}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}}	t	227
2	5	3137	0	87	\N	0	{12,20,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 3}, "p16": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	30
2	6	1000091	0	25	\N	\N	{17,18,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	61
3	6	1000396	0	49	\N	1	{0,0,1,1}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 1, "b": 1, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	35
4	5	10338	3	3	\N	4	{1,1,3,3}	\N	{"p1": {"a": 3, "b": 0, "t": null}, "p2": {"a": 2, "b": 1, "t": 0}, "p3": {"a": 4, "b": 1, "t": 0}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
2	5	6064	0	83	\N	0	{17,19,21,21}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": null}}	t	3
2	6	1000243	0	407	\N	\N	{12,14,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	108
2	6	10709	0	243	\N	\N	{24,27,27,27}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": null}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p9": {"a": null, "b": 1, "t": null}, "p10": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 3}, "p29": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	14
2	5	1000343	0	530	\N	0	{5,7,5,5}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 0, "t": null}}	t	82
2	6	11183	3	6	\N	1	{2,5,3,6}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 3, "t": 4}, "p3": {"a": 4, "b": 2, "t": 0}, "p4": {"a": 4, "b": 0, "t": null}}	t	1
2	6	6724	0	61	\N	\N	{26,33,26,26}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 3}, "p29": {"a": null, "b": 1, "t": 3}, "p30": {"a": null, "b": 1, "t": 1}}	t	11
3	6	12697	0	32	\N	1	{3,6,4,7}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 0}, "p4": {"a": 3, "b": 3, "t": 3}, "p5": {"a": 2, "b": 2, "t": 2}}	t	19
2	6	6933	0	50	\N	\N	{26,30,28,28}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": null}, "p5": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 1, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 3}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	5
2	6	1000226	0	332	\N	\N	{9,12,9,9}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	148
2	5	1000007	0	120	\N	0	{7,8,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	62
2	6	1000093	0	28	\N	\N	{14,16,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 3}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	88
2	5	57446	0	305	\N	0	{13,14,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	14
4	5	1000616	0	\N	\N	\N	{7,10,7,7}	\N	{"p12": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	6	1000137	0	143	\N	\N	{14,19,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 3}, "p17": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	98
2	6	1000257	0	421	\N	\N	{5,5,5,5}	\N	{"p1": {"a": null, "b": null, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	202
2	6	1000065	0	365	\N	\N	{11,15,11,11}	\N	{"p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 3}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}}	t	129
2	6	5089	0	55	\N	\N	{24,27,24,24}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	15
4	5	8101	3	6	\N	1	{1,3,4,4}	\N	{"p1": {"a": 2, "b": 1, "t": 0}, "p2": {"a": 1, "b": 1, "t": 0}, "p3": {"a": 3, "b": 1, "t": 3}, "p4": {"a": 3, "b": 1, "t": null}}	t	\N
2	6	10116	0	20	\N	\N	{21,24,21,21}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	37
2	5	1000323	0	488	\N	0	{5,5,8,8}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	75
2	6	12127	0	463	\N	\N	{10,15,10,10}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	143
2	6	1000096	0	37	\N	\N	{13,18,13,13}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	106
2	5	1000322	0	487	\N	0	{5,5,9,9}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	74
2	6	1000060	0	360	\N	\N	{11,14,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	122
3	6	1000387	0	35	\N	1	{0,0,0,0}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	44
2	6	12195	0	40	\N	\N	{18,23,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p7": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 3}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	64
2	6	1000282	0	446	\N	\N	{8,11,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": null}, "p14": {"a": null, "b": 1, "t": 3}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	161
2	6	1000290	0	454	\N	\N	{5,7,6,6}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	214
2	5	10490	2	10	\N	11	{1,1,2,3}	\N	{"p1": {"a": 13, "b": 2, "t": 0}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 12, "b": 0, "t": null}, "p4": {"a": 5, "b": 0, "t": null}}	t	9
2	6	1000356	0	526	\N	\N	{15,20,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	86
2	5	9074	3	5	\N	2	{3,3,4,4}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 3, "b": 1, "t": 0}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 1, "b": 1, "t": 1}}	t	1
2	5	1000068	0	371	\N	0	{2,2,2,2}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}}	t	102
1572	63	8156	0	3	\N	0	{0,0,0,0}	\N	{"p1": {"a": 2, "b": 0, "t": null}}	t	4
1572	63	9021	0	4	\N	0	{0,0,1,2}	\N	{"p1": {"a": 2, "b": 2, "t": null}}	t	3
2	6	1000162	0	212	\N	\N	\N	\N	\N	t	252
2	6	1000304	0	469	\N	\N	\N	\N	\N	t	252
2	6	1000298	0	462	\N	\N	{12,15,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 2}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	111
2	6	1000052	0	352	\N	\N	{4,6,5,5}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 3}}	t	234
2	5	1000359	0	170	\N	0	{15,24,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	19
2	6	6487	0	19	\N	\N	{20,23,20,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 2}, "p29": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	44
2	6	1000025	0	288	\N	\N	{8,9,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	154
2	6	1000175	0	227	\N	\N	{4,5,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 2}}	t	229
2	5	1000126	0	97	\N	0	{9,13,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 3}, "p16": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	47
2	6	1000083	0	8	\N	\N	{17,20,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 3}}	t	68
2	6	11724	0	145	\N	\N	{23,27,23,23}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 3}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	23
2	6	1000141	0	152	\N	\N	{17,28,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 3}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	83
2	6	1000173	0	225	\N	\N	{8,11,12,12}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	161
2	6	1000331	0	514	\N	\N	{12,15,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": null}, "p6": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p17": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": null}}	t	111
2	5	11498	0	266	\N	0	{13,15,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	18
2	6	1000079	0	550	\N	\N	{16,22,20,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 3}}	t	77
2	6	1000062	0	362	\N	\N	{2,3,2,2}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 2}}	t	248
2	5	6064	2	18	\N	3	{2,3,3,6}	\N	{"p1": {"a": 9, "b": 4, "t": 0}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 4, "b": 0, "t": null}}	t	4
2	5	64762	0	192	\N	0	{5,6,6,6}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	80
2	6	1000019	0	282	\N	\N	{8,8,12,12}	\N	{"p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	149
2	6	1000184	0	239	\N	\N	{7,10,8,8}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 3}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	175
2	5	10490	0	279	\N	0	{15,19,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 3}}	t	11
2	6	67553	0	292	\N	\N	{15,19,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	80
2	5	10515	2	5	\N	16	{0,0,0,0}	\N	{"p1": {"a": 13, "b": 0, "t": null}, "p2": {"a": 1, "b": 0, "t": null}, "p3": {"a": 9, "b": 0, "t": null}, "p4": {"a": 6, "b": 0, "t": null}, "p5": {"a": null, "b": null, "t": null}}	t	19
2	6	1000012	0	184	\N	\N	{19,25,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	56
2	5	1000149	0	167	\N	0	{11,16,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": null}, "p17": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	31
2	6	1000291	0	455	\N	\N	{5,5,7,7}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	198
2	5	57446	2	7	\N	14	{0,0,1,7}	\N	{"p1": {"a": 11, "b": 0, "t": null}, "p2": {"a": 7, "b": 7, "t": 0}, "p3": {"a": 9, "b": 0, "t": null}, "p4": {"a": 6, "b": 0, "t": null}}	t	18
2	6	1000150	0	200	\N	\N	{10,11,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	132
2	6	12397	0	134	\N	\N	{22,22,22,22}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	22
2	6	1000157	0	207	\N	\N	{10,12,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	136
2	5	9074	0	90	\N	0	{16,21,20,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 3}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	7
2	6	1000110	0	59	\N	\N	{14,17,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	92
2	6	1000333	0	516	\N	\N	{4,5,5,5}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	227
2	5	1000112	0	304	\N	0	{7,9,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}}	t	63
2	5	1000144	0	160	\N	0	{5,9,6,6}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 3}, "p27": {"a": null, "b": 1, "t": null}}	t	87
2	6	1000247	0	411	\N	\N	{5,6,8,8}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	210
2	6	1000271	0	435	\N	\N	{5,5,8,8}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	195
3	6	1000385	0	30	\N	1	{0,0,4,18}	\N	{"p1": {"a": 6, "b": 6, "t": 0}, "p2": {"a": 1, "b": 1, "t": 0}, "p3": {"a": 6, "b": 6, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 5, "b": 5, "t": 0}}	t	28
2	6	1000098	0	39	\N	\N	{20,24,20,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	46
2	6	1000192	0	250	\N	\N	{9,10,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	142
3	6	13131	0	9	\N	1	{5,8,5,8}	\N	{"p1": {"a": 3, "b": 3, "t": 3}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 2, "b": 2, "t": 2}, "p4": {"a": 1, "b": 1, "t": 1}, "p5": {"a": 1, "b": 1, "t": 1}}	t	12
2	6	12511	0	15	\N	\N	{23,28,23,23}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 3}, "p30": {"a": null, "b": 1, "t": 1}}	t	27
2	6	1000034	0	298	\N	\N	{11,14,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	121
2	6	1000191	0	249	\N	\N	{8,8,9,9}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	152
2	6	1000177	0	230	\N	\N	{9,14,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 3}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	159
2	6	1000022	0	285	\N	\N	{13,18,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p17": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	105
2	6	12517	3	3	\N	4	{0,0,2,5}	\N	{"p1": {"a": 6, "b": 4, "t": 0}, "p2": {"a": 6, "b": 0, "t": null}, "p3": {"a": 7, "b": 1, "t": 0}, "p4": {"a": 8, "b": 0, "t": null}}	t	4
2	5	6522	0	79	\N	0	{15,16,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	6
2	5	1000306	0	471	\N	0	{3,4,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}}	t	98
2	6	1000267	0	431	\N	\N	{2,3,2,2}	\N	{"p3": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}}	t	248
2	6	1000094	0	30	\N	\N	{8,9,8,8}	\N	{"p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	156
2	5	1000118	0	80	\N	0	{6,9,9,9}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p3": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": null}}	t	73
2	6	1000269	0	433	\N	\N	{6,6,8,8}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	180
2	6	11183	0	34	\N	\N	{30,36,30,30}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 2}, "p5": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 1, "t": 1}, "p9": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 3}, "p30": {"a": null, "b": 1, "t": 1}}	t	1
2	6	10333	0	\N	\N	\N	{22,25,25,25}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p8": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": null}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	31
2	5	10818	2	17	\N	4	{2,4,2,4}	\N	{"p1": {"a": 9, "b": 0, "t": null}, "p2": {"a": 3, "b": 3, "t": 3}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 5, "b": 0, "t": null}}	t	6
3	6	1000214	0	16	\N	1	{0,0,1,9}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 9, "b": 9, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	40
2	5	1000114	0	73	\N	0	{12,21,13,13}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 3}, "p14": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	33
2	6	1000165	0	217	\N	\N	{6,8,6,6}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 3}}	t	192
2	5	57450	0	123	\N	0	{11,13,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	27
2	5	10515	0	82	\N	0	{14,19,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p7": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": null}}	t	16
2	5	5244	0	86	\N	0	{14,19,20,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	15
2	5	6064	3	4	\N	3	{2,5,4,7}	\N	{"p1": {"a": 4, "b": 1, "t": 4}, "p2": {"a": 4, "b": 4, "t": 0}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 3, "b": 1, "t": null}}	t	4
2	5	11814	0	168	\N	0	{12,13,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 0, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	23
2	5	1000205	0	273	\N	0	{4,4,5,5}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}}	t	85
2	6	1000264	0	428	\N	\N	{7,10,9,9}	\N	{"p2": {"a": null, "b": 1, "t": 3}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	174
3	6	10493	0	4	\N	1	{4,5,5,8}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 3, "b": 3, "t": 0}, "p4": {"a": 1, "b": 1, "t": 1}, "p5": {"a": 2, "b": 2, "t": 2}}	t	8
2	6	312	0	215	\N	\N	{16,21,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 3}, "p17": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	75
2	6	1000250	0	414	\N	\N	{5,5,6,6}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	200
4	5	1000501	0	\N	\N	\N	{5,6,5,5}	\N	{"p12": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
1572	63	9019	1	2	\N	0	{0,0,2,4}	\N	{"p1": {"a": 2, "b": 2, "t": 0}, "p3": {"a": 2, "b": 2, "t": 0}}	t	4
1572	284	61909	0	2	\N	0	{0,0,0,0}	\N	{"p1": {"a": 3, "b": 0, "t": null}}	t	5
2	5	12655	0	122	\N	0	{16,24,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 3}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 3}, "p17": {"a": null, "b": 0, "t": null}, "p18": {"a": null, "b": 0, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 0, "t": null}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 2}}	t	12
2	5	1000200	0	268	\N	0	{3,5,5,5}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": null}}	t	99
2	5	64422	0	260	\N	0	{0,0,0,0}	\N	{"p3": {"a": null, "b": 0, "t": null}, "p19": {"a": null, "b": 0, "t": null}, "p21": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}}	t	113
2	5	6849	0	88	\N	0	{16,19,21,21}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p7": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	5
2	5	1000073	0	376	\N	0	{4,4,5,5}	\N	{"p1": {"a": null, "b": null, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	85
2	5	1000354	0	542	\N	0	\N	\N	\N	t	114
2	6	1000292	0	456	\N	\N	{1,1,1,1}	\N	{"p21": {"a": null, "b": 1, "t": 1}}	t	251
3	6	13415	0	38	\N	1	{4,6,5,15}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 3, "b": 1, "t": 3}, "p3": {"a": 11, "b": 11, "t": 0}, "p4": {"a": 1, "b": 1, "t": 1}, "p5": {"a": 1, "b": 1, "t": 1}}	t	16
3	5	11498	0	8	\N	1	{5,9,5,9}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 2, "b": 1, "t": 1}, "p5": {"a": 5, "b": 5, "t": 5}}	t	10
2	6	10984	0	133	\N	\N	{24,29,24,24}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": 1}}	t	18
2	6	1000214	0	323	\N	\N	{11,14,14,14}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	123
2	6	13972	0	115	\N	\N	{20,24,20,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 3}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	46
2	5	8759	0	264	\N	0	{7,7,17,17}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	57
2	6	12517	0	43	\N	\N	{25,27,29,29}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": null}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p8": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": null}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	8
2	6	1000109	0	58	\N	\N	{5,7,7,7}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}}	t	213
2	5	9266	2	8	\N	13	{2,5,3,4}	\N	{"p1": {"a": 9, "b": 0, "t": null}, "p2": {"a": 3, "b": 1, "t": 3}, "p3": {"a": 2, "b": 2, "t": 2}, "p4": {"a": 3, "b": 1, "t": 0}}	t	5
2	5	1000044	0	310	\N	0	{8,11,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	56
3	5	1000365	0	17	\N	1	{1,3,1,3}	\N	{"p1": {"a": 3, "b": 3, "t": 3}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	29
3	6	1000085	0	15	\N	1	{0,0,1,9}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 9, "b": 9, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	40
2	6	1000103	0	48	\N	\N	{13,23,13,13}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 2}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p10": {"a": null, "b": 1, "t": 3}, "p13": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}}	t	124
3	6	1000096	0	18	\N	1	{0,0,1,5}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": null}, "p5": {"a": 5, "b": 5, "t": 0}}	t	37
2	5	1000305	0	470	\N	0	{5,8,7,7}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 3}, "p30": {"a": null, "b": 1, "t": null}}	t	83
3	6	8249	0	5	\N	1	{2,5,5,13}	\N	{"p1": {"a": 1, "b": 1, "t": 0}, "p2": {"a": 2, "b": 2, "t": 0}, "p3": {"a": 5, "b": 5, "t": 0}, "p4": {"a": 3, "b": 3, "t": 3}, "p5": {"a": 2, "b": 2, "t": 2}}	t	21
3	5	10489	0	5	\N	1	{5,7,5,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 3, "b": 1, "t": 3}, "p4": {"a": 1, "b": 1, "t": 1}, "p5": {"a": 1, "b": 1, "t": 1}}	t	2
2	6	6488	0	29	\N	\N	{26,32,26,26}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 3}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 3}, "p30": {"a": null, "b": 1, "t": 1}}	t	10
2	6	10488	0	11	\N	\N	{14,17,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	92
3	6	1000019	0	48	\N	1	{0,0,0,0}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	44
3	5	1000362	0	13	\N	1	{1,1,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	26
3	5	1000363	0	14	\N	1	{1,1,3,12}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 5, "b": 5, "t": 0}, "p3": {"a": 6, "b": 6, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	25
2	6	9537	0	4	\N	\N	{24,32,24,24}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": 3}}	t	26
3	6	1000381	0	26	\N	1	{0,0,2,6}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 3, "b": 3, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 3, "b": 3, "t": 0}}	t	31
3	5	1000361	0	11	\N	1	{4,5,5,8}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 3, "b": 3, "t": 0}, "p4": {"a": 1, "b": 1, "t": 1}, "p5": {"a": 2, "b": 2, "t": 2}}	t	11
4	6	10962	2	9	\N	11	{0,0,2,9}	\N	{"p1": {"": 7, "a": 9, "b": 8, "t": 0}, "p2": {"a": 3, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
2	6	9514	0	146	\N	\N	{25,29,25,25}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 3}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 2}, "p29": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	12
3	6	10709	0	2	\N	1	{4,4,5,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 0}, "p4": {"a": 1, "b": 1, "t": 1}, "p5": {"a": 1, "b": 1, "t": 1}}	t	5
3	5	6849	0	1	\N	1	{5,8,5,6}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 2, "b": 1, "t": 2}, "p5": {"a": 3, "b": 2, "t": 3}}	t	2
3	5	1000043	0	21	\N	1	{1,1,1,1}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	27
3	5	1000369	0	28	\N	1	{3,7,4,10}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 3, "b": 3, "t": 0}, "p4": {"a": 4, "b": 4, "t": 4}, "p5": {"a": 1, "b": 0, "t": 0}}	t	21
2	6	1000156	0	206	\N	\N	{15,17,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	76
1611	5	9928	0	9	\N	0	{0,0,2,4}	\N	{"p1": {"a": 5, "b": 0, "t": 0}, "p2": {"a": 5, "b": 1, "t": 0}, "p3": {"a": 7, "b": 3, "t": 0}, "p4": {"a": 12, "b": 0, "t": null}}	t	10
1611	6	11091	0	4	\N	0	{1,9,4,14}	\N	{"p1": {"a": 5, "b": 4, "t": 0}, "p2": {"a": 5, "b": 1, "t": 0}, "p3": {"a": 9, "b": 3, "t": 9}, "p4": {"a": 6, "b": 6, "t": 0}}	t	6
1611	6	9046	0	2	\N	0	{2,7,4,9}	\N	{"p1": {"a": 4, "b": 2, "t": 4}, "p2": {"a": 3, "b": 1, "t": 3}, "p3": {"a": 12, "b": 3, "t": 0}, "p4": {"a": 5, "b": 3, "t": 0}}	t	3
2	5	1000352	0	540	\N	0	{6,8,8,8}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 3}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	71
3	5	6849	3	4	\N	3	{4,4,4,4}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"": 1, "a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 1, "b": 1, "t": 1}}	t	2
3	5	1000367	0	25	\N	1	{1,1,3,6}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 10, "b": 1, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 4, "b": 4, "t": 0}}	t	23
3	6	1000379	0	24	\N	1	{0,0,3,17}	\N	{"p1": {"a": 4, "b": 4, "t": 0}, "p2": {"a": 3, "b": 3, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 10, "b": 10, "t": 0}}	t	29
3	6	1000380	0	25	\N	1	{0,0,1,5}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 5, "b": 5, "t": 0}}	t	37
4	5	13386	0	\N	\N	\N	{17,24,23,23}	\N	\N	t	\N
4	5	9740	0	\N	\N	\N	{17,19,20,20}	\N	\N	t	\N
4	5	1000423	0	\N	\N	\N	{16,23,22,22}	\N	\N	t	\N
4	5	6849	3	2	\N	5	{1,4,4,10}	\N	{"p1": {"a": 2, "b": 1, "t": 0}, "p2": {"a": 5, "b": 4, "t": 0}, "p3": {"a": 4, "b": 2, "t": 4}, "p4": {"a": 4, "b": 3, "t": 0}}	t	\N
4	6	9537	3	6	\N	1	{4,9,4,4}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"a": 4, "b": 1, "t": 4}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 2, "b": 1, "t": 2}}	t	\N
4	6	1000077	0	\N	\N	\N	{18,21,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 2}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 0, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
3	5	57450	3	1	\N	6	{3,8,4,11}	\N	{"p1": {"a": 4, "b": 4, "t": 4}, "p2": {"a": 4, "b": 3, "t": 0}, "p3": {"a": 2, "b": 2, "t": 2}, "p4": {"a": 2, "b": 2, "t": 2}}	t	4
3	6	1000388	0	36	\N	1	{3,17,4,13}	\N	{"p1": {"a": 6, "b": 5, "t": 6}, "p2": {"a": 1, "b": 1, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 6, "b": 6, "t": 6}, "p5": {"a": 5, "b": 1, "t": 5}}	t	11
3	5	57750	0	3	\N	1	{5,11,5,9}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 3, "b": 1, "t": 3}, "p4": {"a": 2, "b": 2, "t": 2}, "p5": {"a": 4, "b": 4, "t": 4}}	t	17
3	5	10960	0	2	\N	1	{5,6,5,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 1, "b": 1, "t": 1}, "p5": {"a": 1, "b": 1, "t": 1}}	t	14
1611	5	11377	0	11	\N	0	{2,3,4,22}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 7, "b": 6, "t": 0}, "p4": {"a": 15, "b": 13, "t": 0}}	t	6
1611	5	10338	0	3	\N	0	{2,5,4,19}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 4, "t": 4}, "p3": {"a": 9, "b": 7, "t": 0}, "p4": {"a": 18, "b": 7, "t": 0}}	t	1
3	6	1000370	0	8	\N	1	{4,5,4,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 2, "b": 2, "t": 2}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 1, "t": 1}, "p5": {"a": 1, "b": 1, "t": 1}}	t	13
4	6	1000645	0	\N	\N	\N	{19,22,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 2}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
4	5	10960	0	\N	\N	\N	{15,17,19,19}	\N	\N	t	\N
4	5	57750	0	\N	\N	\N	{15,17,18,18}	\N	\N	t	\N
4	5	64822	0	\N	\N	\N	{15,17,17,17}	\N	\N	t	\N
4	5	13535	0	\N	\N	\N	{14,18,18,18}	\N	\N	t	\N
4	5	1000046	0	\N	\N	\N	{14,17,17,17}	\N	\N	t	\N
4	5	1000045	0	\N	\N	\N	{13,15,17,17}	\N	\N	t	\N
4	5	1000112	0	\N	\N	\N	{13,17,13,13}	\N	\N	t	\N
4	5	1000369	0	\N	\N	\N	{14,19,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 1, "t": 2}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": null}}	t	\N
2	6	13127	0	181	\N	\N	{19,27,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	63
2	6	1000248	0	412	\N	\N	{6,6,10,10}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	177
4	6	6724	0	\N	\N	\N	{28,34,29,29}	\N	\N	t	\N
3	5	10489	3	5	\N	2	{3,3,4,6}	\N	{"p1": {"": 1, "a": 1, "b": 1, "t": 1}, "p2": {"": 3, "a": 7, "b": 3, "t": 0}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"": 1, "a": 1, "b": 1, "t": 1}}	t	2
2	6	1000088	0	21	\N	\N	{18,22,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	59
2	6	1000020	0	283	\N	\N	{15,19,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	81
3	6	1000372	0	14	\N	1	{1,6,3,9}	\N	{"p1": {"a": 6, "b": 6, "t": 6}, "p2": {"a": 1, "b": 1, "t": 0}, "p3": {"a": 2, "b": 2, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	27
1611	6	12720	0	5	\N	0	{1,3,4,11}	\N	{"p1": {"a": 3, "b": 2, "t": 3}, "p2": {"a": 4, "b": 1, "t": 0}, "p3": {"a": 7, "b": 5, "t": 0}, "p4": {"a": 3, "b": 3, "t": 0}}	t	4
4	5	57446	0	\N	\N	\N	{23,26,23,23}	\N	\N	t	\N
4	5	12655	0	\N	\N	\N	{22,25,23,23}	\N	\N	t	\N
4	5	6849	0	\N	\N	\N	{22,24,22,22}	\N	\N	t	\N
4	5	10515	0	\N	\N	\N	{21,26,23,23}	\N	\N	t	\N
4	5	10114	0	\N	\N	\N	{20,26,23,23}	\N	\N	t	\N
4	5	55518	0	\N	\N	\N	{20,29,23,23}	\N	\N	t	\N
4	5	1000232	0	\N	\N	\N	{20,25,22,22}	\N	\N	t	\N
4	5	9781	0	\N	\N	\N	{20,30,22,22}	\N	\N	t	\N
4	5	13447	0	\N	\N	\N	{20,22,20,20}	\N	\N	t	\N
4	5	1000041	0	\N	\N	\N	{18,22,20,20}	\N	\N	t	\N
2	5	1000047	0	314	\N	0	{5,5,8,8}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	75
1611	5	9731	0	6	\N	0	{2,6,2,6}	\N	{"p1": {"": null, "a": 1, "b": 1, "t": 1}, "p2": {"a": 5, "b": 5, "t": 5}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"": null, "a": 16, "b": 0, "t": null}}	t	8
4	5	71349	0	\N	\N	\N	{11,16,12,12}	\N	\N	t	\N
3	5	13250	3	2	\N	5	{1,1,3,5}	\N	{"p1": {"a": 4, "b": 0, "t": null}, "p2": {"a": 4, "b": 3, "t": 0}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 6, "b": 1, "t": 0}}	t	5
3	6	1000373	0	17	\N	1	{0,0,1,11}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 12, "b": 11, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	43
4	5	9784	0	\N	\N	\N	{12,13,16,16}	\N	\N	t	\N
4	5	1000643	0	\N	\N	\N	{12,16,15,15}	\N	\N	t	\N
4	5	1000468	0	\N	\N	\N	{12,14,13,13}	\N	\N	t	\N
4	5	1000008	0	\N	\N	\N	{11,13,15,15}	\N	\N	t	\N
4	5	1000363	0	\N	\N	\N	{11,17,15,15}	\N	\N	t	\N
4	5	1000118	0	\N	\N	\N	{11,16,13,13}	\N	\N	t	\N
4	5	1000036	0	\N	\N	\N	{10,11,11,11}	\N	\N	t	\N
4	5	1000007	0	\N	\N	\N	{9,10,13,13}	\N	\N	t	\N
4	5	1000473	0	\N	\N	\N	{9,14,10,10}	\N	\N	t	\N
4	5	1000205	0	\N	\N	\N	{9,12,9,9}	\N	\N	t	\N
4	5	1000424	0	\N	\N	\N	{8,8,11,11}	\N	\N	t	\N
4	5	1000591	0	\N	\N	\N	{8,9,11,11}	\N	\N	t	\N
4	5	1000313	0	\N	\N	\N	{4,5,6,6}	\N	{"p12": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p17": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 2}}	t	\N
4	5	1000439	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000570	0	\N	\N	\N	{5,5,5,5}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	5	10490	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000519	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000568	0	\N	\N	\N	{3,3,7,7}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p17": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}}	t	\N
4	5	1000503	0	\N	\N	\N	{7,7,7,7}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	5	1000487	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000508	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000349	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000590	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000306	0	\N	\N	\N	{4,9,6,6}	\N	{"p12": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p17": {"a": null, "b": 1, "t": 3}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 3}}	t	\N
4	5	1000502	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000490	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000484	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000483	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000478	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000347	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	64422	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000572	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
2	5	1000345	0	532	\N	0	{3,6,3,3}	\N	{"p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}}	t	101
2	6	6488	2	11	\N	10	{1,3,4,8}	\N	{"p1": {"a": 3, "b": 1, "t": 3}, "p2": {"a": 5, "b": 4, "t": 0}, "p3": {"a": 3, "b": 2, "t": 0}, "p4": {"a": 5, "b": 1, "t": 0}}	t	6
2	5	1000147	0	165	\N	0	\N	\N	\N	t	114
3	5	1000364	0	16	\N	1	{1,2,1,1}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	28
3	6	1000378	0	23	\N	1	{1,4,3,13}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 5, "b": 5, "t": 0}, "p3": {"a": 5, "b": 5, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 4, "b": 3, "t": 4}}	t	24
3	6	12652	0	20	\N	1	{1,4,2,7}	\N	{"p1": {"a": 3, "b": 3, "t": 0}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 4, "b": 4, "t": 4}, "p5": {"a": 1, "b": 0, "t": 0}}	t	26
4	5	1000512	0	\N	\N	\N	{4,5,4,4}	\N	{"p17": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	5	11498	0	\N	\N	\N	{20,23,21,21}	\N	\N	t	\N
4	5	69988	0	\N	\N	\N	{18,27,20,20}	\N	\N	t	\N
4	5	65104	0	\N	\N	\N	{14,19,19,19}	\N	\N	t	\N
4	5	1000408	0	\N	\N	\N	{16,18,17,17}	\N	\N	t	\N
4	5	10936	0	\N	\N	\N	{15,18,19,19}	\N	\N	t	\N
4	5	1000361	0	\N	\N	\N	{15,16,15,15}	\N	\N	t	\N
4	5	1000421	0	\N	\N	\N	{14,15,15,15}	\N	\N	t	\N
4	5	1000475	0	\N	\N	\N	{13,16,14,14}	\N	\N	t	\N
4	5	1000430	0	\N	\N	\N	{12,15,17,17}	\N	\N	t	\N
4	5	1000043	0	\N	\N	\N	{12,15,12,12}	\N	\N	t	\N
4	5	1000450	0	\N	\N	\N	{11,15,12,12}	\N	\N	t	\N
4	5	1000576	0	\N	\N	\N	{10,12,10,10}	\N	\N	t	\N
4	5	1000541	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000538	0	\N	\N	\N	{5,6,5,5}	\N	{"p12": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": null, "t": null}, "p17": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	5	1000115	0	74	\N	0	{6,10,13,13}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 3}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 3}, "p30": {"a": null, "b": 1, "t": null}}	t	77
3	6	1000375	0	19	\N	1	{0,0,1,10}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 10, "b": 10, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	42
3	5	1000047	0	26	\N	1	{3,4,3,4}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 2, "b": 2, "t": 2}, "p5": {"a": 1, "b": 0, "t": 0}}	t	20
3	5	1000045	0	15	\N	1	{4,7,4,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 3, "b": 1, "t": 3}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 2, "b": 2, "t": 2}}	t	19
4	6	1000298	0	\N	\N	\N	{18,21,19,19}	\N	\N	t	\N
4	6	1000021	0	\N	\N	\N	{18,21,18,18}	\N	\N	t	\N
4	6	1000398	0	\N	\N	\N	{18,22,18,18}	\N	\N	t	\N
3	5	1000366	0	19	\N	1	{4,6,4,4}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"a": 2, "b": 1, "t": 2}, "p4": {"a": 1, "b": 1, "t": 1}, "p5": {"a": 1, "b": 0, "t": 0}}	t	15
3	5	9744	0	20	\N	1	{3,6,4,7}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 0}, "p3": {"a": 1, "b": 1, "t": 0}, "p4": {"a": 1, "b": 2, "t": 2}, "p5": {"a": 1, "b": 3, "t": 3}}	t	1
3	6	1000376	0	21	\N	1	{1,2,4,16}	\N	{"p1": {"a": 5, "b": 5, "t": 0}, "p2": {"a": 3, "b": 3, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 6, "b": 6, "t": 0}, "p5": {"a": 2, "b": 2, "t": 2}}	t	23
3	6	1000377	0	22	\N	1	{0,0,0,0}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	44
3	6	1000395	0	47	\N	1	{0,0,2,8}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 2, "b": 2, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 6, "b": 6, "t": 0}}	t	32
4	6	7492	2	12	\N	9	{2,4,3,5}	\N	{"p1": {"a": 3, "b": 3, "t": 3}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
4	5	12655	2	14	\N	7	{2,4,3,7}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 6, "b": 0, "t": 0}, "p3": {"a": 3, "b": 2, "t": 3}, "p4": {"a": 25, "b": 4, "t": 0}}	t	\N
4	6	1000248	0	\N	\N	\N	{10,12,17,17}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": null}, "p5": {"a": null, "b": 1, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	5	59030	0	\N	\N	\N	{17,19,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 3}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 0, "t": null}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
3	6	1000006	0	27	\N	1	{0,0,0,0}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	44
4	6	6623	2	19	\N	2	{2,2,4,11}	\N	{"p1": {"a": 10, "b": 8, "t": 0}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
4	5	6849	2	16	\N	5	{2,3,4,5}	\N	{"p1": {"": 2, "a": 2, "b": 1, "t": 2}, "p2": {"a": 3, "b": 2, "t": 0}, "p3": {"a": 3, "b": 1, "t": 0}, "p4": {"a": 1, "b": 1, "t": 1}}	t	\N
4	5	1000602	0	\N	\N	\N	{8,10,10,10}	\N	\N	t	\N
1611	6	12501	0	6	\N	0	{2,11,4,9}	\N	{"p1": {"a": 5, "b": 4, "t": 0}, "p2": {"a": 4, "b": 2, "t": 4}, "p3": {"a": 7, "b": 2, "t": 7}, "p4": {"a": 4, "b": 1, "t": 0}}	t	1
4	5	1000514	0	\N	\N	\N	{9,11,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": null}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	\N
2	5	1000358	2	4	\N	17	{0,0,0,0}	\N	{"p1": {"a": 7, "b": 0, "t": null}, "p2": {"a": 1, "b": 0, "t": null}, "p3": {"a": 10, "b": 0, "t": null}, "p4": {"a": 6, "b": 0, "t": null}}	t	20
3	6	10709	3	4	\N	3	{3,5,4,5}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"a": 3, "b": 1, "t": 0}, "p3": {"": 2, "a": 2, "b": 2, "t": 2}, "p4": {"a": 1, "b": 1, "t": 1}}	t	5
3	6	10963	0	12	\N	1	{4,7,5,14}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 9, "b": 9, "t": 0}, "p4": {"a": 4, "b": 2, "t": 4}, "p5": {"a": 1, "b": 1, "t": 1}}	t	6
3	6	13972	0	37	\N	1	{0,0,2,10}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 1, "b": 1, "t": 0}, "p3": {"a": 9, "b": 9, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	33
3	6	7492	0	6	\N	1	{5,6,5,5}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 2, "b": 1, "t": 2}, "p4": {"a": 1, "b": 1, "t": 1}, "p5": {"a": 1, "b": 1, "t": 1}}	t	5
3	5	9740	0	30	\N	1	{5,10,5,7}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 2, "b": 1, "t": 2}, "p4": {"a": 5, "b": 3, "t": 5}, "p5": {"a": 1, "b": 1, "t": 1}}	t	12
3	5	1000046	0	23	\N	1	{3,5,4,3}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 0}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 6, "b": 6, "t": 0}, "p5": {"a": 3, "b": 3, "t": 3}}	t	16
3	6	1000077	0	29	\N	1	{0,0,1,1}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 1, "b": 1, "t": 0}, "p3": {"a": 1, "b": 0, "t": null}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	35
4	5	1000462	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000530	0	\N	\N	\N	{1,1,1,1}	\N	{"p21": {"a": null, "b": 1, "t": 1}}	t	\N
4	5	1000469	0	\N	\N	\N	{9,13,9,9}	\N	\N	t	\N
4	6	1000176	0	\N	\N	\N	{16,25,21,21}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 2}, "p5": {"a": null, "b": 1, "t": 3}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": null}, "p8": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 1, "t": 3}, "p27": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000516	0	\N	\N	\N	{10,12,10,10}	\N	{"p6": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000517	0	\N	\N	\N	{7,9,8,8}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
34	5	6326	2	6	\N	1	{2,3,2,3}	\N	{"p1": {"a": 12, "b": 0, "t": null}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"a": 2, "b": 2, "t": 2}}	t	4
4	6	67553	0	\N	\N	\N	{24,28,26,26}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 2}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": null}, "p30": {"a": null, "b": 1, "t": 2}}	t	\N
2	6	9514	3	5	\N	2	{0,0,2,4}	\N	{"p1": {"a": 6, "b": 2, "t": 0}, "p2": {"a": 6, "b": 0, "t": null}, "p3": {"a": 4, "b": 2, "t": 0}, "p4": {"a": 3, "b": 0, "t": null}}	t	3
4	5	1000479	0	\N	\N	\N	{5,5,5,5}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	6	1000223	0	329	\N	\N	{11,16,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p8": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p17": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	133
2	6	1000108	0	57	\N	\N	{22,24,23,23}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 0, "t": null}, "p29": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	30
2	6	1000153	0	203	\N	\N	{7,8,8,8}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	169
3	6	12517	0	1	\N	1	{5,7,5,7}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 2, "b": 2, "t": 2}, "p4": {"a": 2, "b": 2, "t": 2}, "p5": {"": 1, "a": 1, "b": 1, "t": 1}}	t	4
4	6	1000440	0	\N	\N	\N	{17,23,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 3}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 3}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": null}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
1611	5	7641	0	8	\N	0	{2,4,4,16}	\N	{"p1": {"a": 3, "b": 1, "t": 3}, "p2": {"a": 3, "b": 1, "t": 0}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 13, "b": 13, "t": 0}}	t	5
1572	284	61901	0	8	\N	0	{0,0,0,0}	\N	{"p1": {"a": null, "b": null, "t": null}}	t	5
2	6	13131	0	234	\N	\N	{19,20,25,25}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p8": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": null}, "p23": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": null}, "p29": {"a": null, "b": 1, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	49
2	6	1000329	0	512	\N	\N	\N	\N	\N	t	252
2	6	1000164	0	216	\N	\N	{12,15,13,13}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	113
2	6	13522	0	151	\N	\N	{17,20,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 3}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	68
2	6	1000174	0	226	\N	\N	{8,9,8,8}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	156
4	6	11015	2	1	\N	18	{0,0,2,4}	\N	{"p1": {"a": 7, "b": 0, "t": null}, "p2": {"a": 4, "b": 3, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
4	6	1000471	0	\N	\N	\N	{17,22,20,20}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 3}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
4	6	1000554	0	\N	\N	\N	{13,17,13,13}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p10": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	6	1000281	0	445	\N	\N	{6,6,8,8}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	180
2	6	1000187	0	245	\N	\N	{2,3,2,2}	\N	{"p3": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}}	t	248
2	6	1000003	0	112	\N	\N	{20,32,20,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 3}, "p6": {"a": null, "b": 1, "t": 3}, "p7": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 3}, "p16": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 3}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	65
1	5	12027	2	2	\N	5	{1,4,3,11}	{0,0,0,4,0,3,3,5}	{"p1": {"a": 2, "b": 3, "t": 0}, "p2": {"a": 5, "b": 5, "t": 0}, "p3": {"a": 5, "b": 3, "t": 4}, "p4": {"a": 1, "b": null, "t": null}}	f	\N
2	6	1000014	0	186	\N	\N	{13,20,13,13}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 3}}	t	114
2	6	1000288	0	452	\N	\N	{3,6,3,3}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 2}}	t	246
2	5	1000045	0	311	\N	0	{10,12,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 3}, "p16": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	32
4	6	1000497	0	\N	\N	\N	{2,3,2,2}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 0, "t": null}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 0, "t": null}, "p17": {"a": null, "b": 0, "t": null}, "p18": {"a": null, "b": 0, "t": null}, "p19": {"a": null, "b": 0, "t": null}, "p20": {"a": null, "b": 0, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 2}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
4	5	1000623	0	\N	\N	\N	{6,6,6,6}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	5	1000323	0	\N	\N	\N	{13,17,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	\N
2	6	1000066	0	366	\N	\N	{15,29,27,27}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": null}, "p8": {"a": null, "b": 1, "t": 1}, "p9": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": null}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 3}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": null}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": null}, "p23": {"a": null, "b": 1, "t": 3}, "p24": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 1, "t": 3}, "p27": {"a": null, "b": 1, "t": null}, "p29": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": 3}}	t	115
1572	63	8155	1	7	\N	0	\N	\N	\N	t	7
2	6	1000085	0	10	\N	\N	{15,18,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	78
4	5	1000210	0	\N	\N	\N	{10,11,10,10}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p9": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000258	0	\N	\N	\N	{9,11,10,10}	\N	{"p6": {"a": null, "b": 1, "t": null}, "p10": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000589	0	\N	\N	\N	{19,24,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 3}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
2	6	1000095	0	32	\N	\N	{23,28,23,23}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": 2}}	t	27
2	6	1000335	0	518	\N	\N	{3,4,5,5}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": null}}	t	240
2	5	11705	2	1	\N	20	{0,0,2,11}	\N	{"p1": {"a": 8, "b": 7, "t": 0}, "p2": {"a": 4, "b": 4, "t": 0}, "p3": {"a": 9, "b": 0, "t": null}, "p4": {"a": 3, "b": 0, "t": null}}	t	15
4	5	57450	2	7	\N	14	{1,2,1,1}	\N	{"p1": {"": 1, "a": 2, "b": 1, "t": 2}, "p2": {"a": 5, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 16, "b": 0, "t": 0}}	t	\N
4	5	70752	2	5	\N	16	{1,1,1,1}	\N	{"p1": {"": 1, "a": 1, "b": 1, "t": 1}, "p2": {"a": 5, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}}	t	\N
2	6	9058	3	2	\N	5	{1,2,2,2}	\N	{"p1": {"a": 5, "b": 1, "t": 0}, "p2": {"a": 8, "b": 0, "t": null}, "p3": {"a": 2, "b": 1, "t": 2}, "p4": {"a": 4, "b": 0, "t": null}}	t	2
2	5	1000344	0	531	\N	0	\N	\N	\N	t	114
2	6	1000143	0	154	\N	\N	{15,21,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 3}}	t	90
4	6	1000551	0	\N	\N	\N	{6,7,6,6}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	6	1000167	0	219	\N	\N	{13,22,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 3}, "p14": {"a": null, "b": 1, "t": 3}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p17": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	119
2	6	1000055	0	355	\N	\N	{12,16,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	117
4	6	1000580	0	\N	\N	\N	{15,20,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 3}, "p26": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
2	6	1000168	0	220	\N	\N	{19,23,21,21}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 3}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	51
2	5	6522	2	15	\N	6	{2,5,3,11}	\N	{"p1": {"a": 8, "b": 6, "t": 0}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 4, "b": 4, "t": 4}, "p4": {"a": 4, "b": 0, "t": null}}	t	7
4	6	1000435	0	\N	\N	\N	{11,16,14,14}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 1, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	5	10960	0	78	\N	0	{9,13,13,13}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 3}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 3}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	49
4	6	1000244	0	\N	\N	\N	{6,6,6,6}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000642	0	\N	\N	\N	{11,13,13,13}	\N	\N	t	\N
4	6	1000596	0	\N	\N	\N	{11,14,12,12}	\N	\N	t	\N
4	6	1000605	0	\N	\N	\N	{11,12,11,11}	\N	\N	t	\N
4	6	1000405	0	\N	\N	\N	{10,14,12,12}	\N	\N	t	\N
4	6	1000626	0	\N	\N	\N	{9,9,14,14}	\N	\N	t	\N
4	6	1000216	0	\N	\N	\N	{8,11,13,13}	\N	\N	t	\N
4	6	1000420	0	\N	\N	\N	{7,7,7,7}	\N	\N	t	\N
4	5	1000644	0	\N	\N	\N	{12,17,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 1, "t": 2}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 3}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": null}}	t	\N
3	6	1000079	0	41	\N	1	{1,4,3,15}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 10, "b": 10, "t": 0}, "p3": {"a": 4, "b": 4, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 4, "b": 1, "t": 4}}	t	25
4	6	1000109	0	\N	\N	\N	{17,22,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": null}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": 3}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 1, "t": 3}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000640	0	\N	\N	\N	{7,7,7,7}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	6	1000035	0	299	\N	\N	{11,16,13,13}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	134
2	6	1000286	0	450	\N	\N	{3,3,5,5}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}}	t	238
34	6	11091	2	1	\N	6	{1,5,3,8}	\N	{"p1": {"a": 5, "b": 1, "t": 0}, "p2": {"a": 3, "b": 0, "t": null}, "p3": {"a": 3, "b": 2, "t": null}, "p4": {"a": 5, "b": 5, "t": 5}}	t	6
34	6	6623	2	3	\N	4	{3,6,3,4}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 5, "b": 0, "t": null}, "p3": {"a": 3, "b": 2, "t": 3}, "p4": {"a": 2, "b": 1, "t": 2}}	t	2
4	6	1000092	0	\N	\N	\N	{27,30,27,27}	\N	\N	t	\N
1572	63	50692	1	3	\N	0	{0,0,0,0}	\N	{"p1": {"a": 10, "b": 0, "t": null}, "p3": {"a": 5, "b": 0, "t": null}}	t	5
2	6	1000172	0	224	\N	\N	{14,20,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": null}, "p6": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	101
2	5	1000347	0	534	\N	0	{2,2,2,2}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}}	t	102
4	6	1000453	0	\N	\N	\N	{18,22,21,21}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p8": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 2}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 2}}	t	\N
2	6	1000028	0	291	\N	\N	{16,29,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": 3}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 3}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 3}, "p17": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 3}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": null}, "p30": {"a": null, "b": 1, "t": null}}	t	103
4	6	6488	0	\N	\N	\N	{28,30,29,29}	\N	\N	t	\N
34	5	10338	2	1	\N	6	{4,10,4,8}	\N	{"p1": {"a": 2, "b": 2, "t": 2}, "p2": {"a": 2, "b": 2, "t": 3}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 4, "b": 3, "t": 4}}	t	1
1572	63	9020	1	4	\N	0	{1,1,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 0}, "p3": {"a": 1, "b": 1, "t": 1}}	t	1
4	6	1000014	0	\N	\N	\N	{0,0,0,0}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}}	t	\N
4	6	11289	0	\N	\N	\N	{27,33,27,27}	\N	\N	t	\N
2	5	59030	0	161	\N	0	{10,14,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	36
2	6	11091	2	12	\N	9	{0,0,1,2}	\N	{"p1": {"a": 6, "b": 0, "t": null}, "p2": {"a": 6, "b": 0, "t": null}, "p3": {"a": 4, "b": 2, "t": 0}, "p4": {"a": 4, "b": 0, "t": null}}	t	15
2	6	1000092	0	27	\N	\N	{20,21,20,20}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	39
4	6	1000587	0	\N	\N	\N	{14,21,16,16}	\N	\N	t	\N
4	6	1000407	0	\N	\N	\N	{14,18,15,15}	\N	\N	t	\N
4	6	1000220	0	\N	\N	\N	{13,13,19,19}	\N	\N	t	\N
4	6	1000588	0	\N	\N	\N	{13,15,18,18}	\N	\N	t	\N
4	6	1000597	0	\N	\N	\N	{13,17,18,18}	\N	\N	t	\N
4	6	1000441	0	\N	\N	\N	{13,15,13,13}	\N	\N	t	\N
4	6	1000481	0	\N	\N	\N	{9,14,9,9}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 3}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000574	0	\N	\N	\N	{5,7,5,5}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000100	0	\N	\N	\N	{10,15,10,10}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p4": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 3}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000545	0	\N	\N	\N	{0,0,0,0}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}}	t	\N
2	5	1000121	0	89	\N	0	{8,12,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p13": {"a": null, "b": 1, "t": 3}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	58
4	5	1000628	0	\N	\N	\N	{8,10,9,9}	\N	\N	t	\N
4	5	1000625	0	\N	\N	\N	{8,9,8,8}	\N	\N	t	\N
4	5	1000594	0	\N	\N	\N	{7,8,7,7}	\N	\N	t	\N
4	5	1000451	0	\N	\N	\N	{6,6,8,8}	\N	\N	t	\N
4	5	1000585	0	\N	\N	\N	{6,6,6,6}	\N	\N	t	\N
4	5	1000418	0	\N	\N	\N	{5,6,7,7}	\N	\N	t	\N
4	5	1000533	0	\N	\N	\N	{5,10,6,6}	\N	\N	t	\N
4	5	1000548	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000357	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000617	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000230	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000536	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000491	0	\N	\N	\N	{5,5,7,7}	\N	{"p12": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	6	9487	0	147	\N	\N	{23,27,23,23}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 2}, "p23": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": 1}}	t	23
2	5	1000316	0	481	\N	0	{7,9,10,10}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	64
4	5	1000636	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	10959	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000413	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000567	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000631	0	\N	\N	\N	{5,6,5,5}	\N	{"p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	6	1000259	0	423	\N	\N	{5,7,5,5}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	216
2	6	1000342	0	525	\N	\N	{4,4,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	222
4	5	1000400	0	\N	\N	\N	{8,11,11,11}	\N	\N	t	\N
4	5	1000592	0	\N	\N	\N	{8,10,10,10}	\N	\N	t	\N
4	5	1000410	0	\N	\N	\N	{7,10,11,11}	\N	\N	t	\N
4	5	1000446	0	\N	\N	\N	{7,8,7,7}	\N	\N	t	\N
4	5	1000584	0	\N	\N	\N	{6,7,6,6}	\N	\N	t	\N
4	5	1000467	0	\N	\N	\N	{5,6,8,8}	\N	\N	t	\N
4	5	1000416	0	\N	\N	\N	{2,2,4,4}	\N	\N	t	\N
4	5	1000549	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	5	1000308	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000555	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
2	5	1000037	0	301	\N	0	{4,6,6,6}	\N	{"p3": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}}	t	88
1572	284	50691	0	7	\N	0	{1,1,1,1}	\N	{"p1": {"a": 1, "b": 1, "t": 1}}	t	1
2	6	1000285	0	449	\N	\N	{6,9,6,6}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 2}}	t	193
1572	284	61116	0	4	\N	0	{1,1,1,1}	\N	{"p1": {"a": 1, "b": 1, "t": 1}}	t	1
1572	284	11709	0	9	\N	0	{0,0,0,0}	\N	{"p1": {"a": null, "b": null, "t": null}}	t	5
3	6	7492	3	6	\N	1	{3,11,3,10}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"a": 8, "b": 8, "t": 8}, "p3": {"a": 5, "b": 0, "t": null}, "p4": {"a": 1, "b": 1, "t": 1}}	t	5
4	6	1000561	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000563	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000260	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000328	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000557	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000577	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000171	0	\N	\N	\N	{0,0,0,0}	\N	\N	t	\N
4	6	1000187	0	\N	\N	\N	{0,0,0,0}	\N	{"p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 0, "t": null}}	t	\N
3	6	6724	3	2	\N	5	{4,8,4,7}	\N	{"p1": {"a": 2, "b": 1, "t": 2}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 4, "b": 4, "t": 4}, "p4": {"a": 1, "b": 1, "t": 1}}	t	1
4	6	1000531	0	\N	\N	\N	{7,10,7,7}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 3}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	6	1000100	0	44	\N	\N	{5,5,5,5}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	202
4	6	1000489	0	\N	\N	\N	{6,7,6,6}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000622	0	\N	\N	\N	{19,23,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": 2}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 1, "t": 2}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
4	5	1000316	0	\N	\N	\N	{9,10,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	\N
4	5	8101	2	19	\N	2	{4,9,4,8}	\N	{"p1": {"": 1, "a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 4, "t": 4}, "p3": {"a": 2, "b": 1, "t": 2}, "p4": {"a": 2, "b": 2, "t": 2}}	t	\N
4	6	10709	2	18	\N	3	{2,6,4,10}	\N	{"p1": {"a": 5, "b": 3, "t": 0}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 5, "b": 5, "t": 5}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
4	6	9683	0	\N	\N	\N	{24,26,24,24}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p9": {"a": null, "b": 1, "t": 2}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 2}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
2	5	1000196	0	261	\N	0	{7,11,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": null}, "p18": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": null}}	t	67
2	6	1000272	0	436	\N	\N	{3,4,4,4}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}}	t	241
2	6	12590	0	169	\N	\N	{9,11,9,9}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 3}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	147
2	5	1000041	0	307	\N	0	{9,11,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 2}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	39
4	6	64718	0	\N	\N	\N	{23,30,26,26}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 2}, "p23": {"a": null, "b": 1, "t": 3}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 2}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000457	0	\N	\N	\N	{20,24,21,21}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 1, "t": 2}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 2}, "p26": {"a": null, "b": 1, "t": 3}, "p27": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
3	5	13179	0	29	\N	1	{4,13,5,11}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 4, "b": 4, "t": 4}, "p3": {"a": 4, "b": 1, "t": 4}, "p4": {"a": 2, "b": 2, "t": 0}, "p5": {"a": 4, "b": 3, "t": 4}}	t	13
4	5	1000200	0	\N	\N	\N	{8,10,10,10}	\N	{"p6": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 3}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	\N
1611	6	11363	0	12	\N	0	{0,0,1,2}	\N	{"p1": {"a": 7, "b": 0, "t": null}, "p2": {"a": 4, "b": 2, "t": 0}, "p3": {"a": 11, "b": 0, "t": null}, "p4": {"a": 5, "b": 0, "t": null}}	t	8
4	5	1000532	0	\N	\N	\N	{4,6,6,6}	\N	{"p2": {"a": null, "b": 1, "t": null}, "p17": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": null}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	5	1000235	0	\N	\N	\N	{11,13,14,14}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p6": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 3}, "p26": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
3	6	10825	0	50	\N	1	{5,10,5,10}	\N	{"p1": {"": null, "a": 1, "b": 1, "t": 1}, "p2": {"a": 2, "b": 2, "t": 2}, "p3": {"a": 4, "b": 4, "t": 4}, "p4": {"a": 2, "b": 2, "t": 2}, "p5": {"a": 1, "b": 1, "t": 1}}	t	2
4	5	1000480	0	\N	\N	\N	{9,13,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p2": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	\N
4	5	1000552	0	\N	\N	\N	{4,5,8,8}	\N	{"p6": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": null}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": null}, "p20": {"a": null, "b": 1, "t": 2}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
3	5	1000651	0	27	\N	1	{1,8,2,8}	\N	{"p1": {"a": 8, "b": 7, "t": 8}, "p2": {"a": 1, "b": 0, "t": 0}, "p3": {"a": 1, "b": 1, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 0, "t": 0}}	t	30
4	6	1000598	0	\N	\N	\N	{5,5,7,7}	\N	{"p7": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	\N
4	6	1000627	0	\N	\N	\N	{6,6,6,6}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 0, "t": null}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 0, "t": null}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
2	6	1000010	0	182	\N	\N	{10,15,10,10}	\N	{"p1": {"a": null, "b": 1, "t": 3}, "p3": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 1}}	t	143
4	6	1000245	0	\N	\N	\N	{7,12,7,7}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 3}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 3}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000559	0	\N	\N	\N	{13,14,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000498	0	\N	\N	\N	{11,15,11,11}	\N	{"p2": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	\N
4	6	1000562	0	\N	\N	\N	{11,15,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": 3}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 3}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000586	0	\N	\N	\N	{6,6,7,7}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": null}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 0, "t": null}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
4	6	1000522	0	\N	\N	\N	{9,11,11,11}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	\N
4	6	1000569	0	\N	\N	\N	{15,16,21,21}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": null}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": null}, "p8": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 2}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000600	0	\N	\N	\N	{8,8,9,9}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000240	0	\N	\N	\N	{10,12,10,10}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 3}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000143	0	\N	\N	\N	{23,26,25,25}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": 2}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 1, "t": 2}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 1, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000510	0	\N	\N	\N	{9,12,9,9}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000564	0	\N	\N	\N	{9,12,9,9}	\N	{"p2": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000243	0	\N	\N	\N	{19,22,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 2}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p9": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	\N
4	6	1000465	0	\N	\N	\N	{19,29,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 3}, "p6": {"a": null, "b": 1, "t": 3}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 1, "t": 3}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": 3}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 2}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 2}}	t	\N
4	6	1000550	0	\N	\N	\N	{10,10,10,10}	\N	{"p2": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
1	5	61905	2	4	\N	3	{1,1,2,5}	{0,0,0,1,0,0,1,4}	{"p1": {"a": 1, "b": 0, "t": null}, "p2": {"a": 1, "b": 0, "t": null}, "p3": {"a": 4, "b": 4, "t": 0}, "p4": {"a": 1, "b": 1, "t": 1}}	f	\N
4	6	13825	0	\N	\N	\N	{22,25,25,25}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": null}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 2}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000543	0	\N	\N	\N	{15,19,18,18}	\N	{"p2": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 2}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": null}, "p8": {"a": null, "b": 1, "t": null}, "p10": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000599	0	\N	\N	\N	{6,6,6,6}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	5	1000351	0	539	\N	0	{1,1,1,1}	\N	{"p1": {"a": null, "b": null, "t": null}, "p21": {"a": null, "b": 1, "t": 1}}	t	110
2	6	1000059	0	359	\N	\N	{4,6,4,4}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 2}}	t	235
4	6	12127	0	\N	\N	\N	{16,21,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 3}, "p9": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	\N
4	6	1000472	0	\N	\N	\N	{23,27,26,26}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 2}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": 2}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 3}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000553	0	\N	\N	\N	{20,22,21,21}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 2}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000571	0	\N	\N	\N	{10,15,10,10}	\N	{"p2": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000492	0	\N	\N	\N	{5,5,5,5}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000558	0	\N	\N	\N	{12,17,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": null}, "p4": {"a": null, "b": 1, "t": null}, "p6": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 3}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	\N
4	6	1000075	0	\N	\N	\N	{8,8,10,10}	\N	{"p6": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	6	1000130	0	131	\N	\N	\N	\N	\N	t	252
1	5	6064	2	3	\N	4	{2,4,3,7}	{0,0,2,2,0,1,2,4}	{"p1": {"a": 5, "b": 5, "t": 0}, "p2": {"a": 2, "b": 1, "t": 2}, "p3": {"a": 13, "b": 0, "t": null}, "p4": {"a": 2, "b": 1, "t": 2}}	f	\N
4	6	1000578	0	\N	\N	\N	{23,39,24,24}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 3}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 1, "t": 3}, "p10": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": 3}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 3}, "p23": {"a": null, "b": 1, "t": 2}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 2}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 3}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000493	0	\N	\N	\N	{14,14,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000495	0	\N	\N	\N	{14,20,17,17}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 2}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 3}, "p8": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 0, "t": null}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 3}, "p23": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000053	0	\N	\N	\N	{18,22,23,23}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 3}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 3}, "p8": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 1, "t": 1}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000506	0	\N	\N	\N	{15,19,16,16}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 3}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 2}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000266	0	\N	\N	\N	{8,10,8,8}	\N	{"p2": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000477	0	\N	\N	\N	{12,14,12,12}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p4": {"a": null, "b": 1, "t": 2}, "p9": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000034	0	\N	\N	\N	{17,18,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 2}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 0, "t": null}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000565	0	\N	\N	\N	{14,16,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 3}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000485	0	\N	\N	\N	{6,9,6,6}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 3}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 2}, "p21": {"a": null, "b": 1, "t": 1}}	t	\N
2	5	9074	2	14	\N	7	{2,3,3,5}	\N	{"p1": {"a": 10, "b": 0, "t": null}, "p2": {"a": 2, "b": 2, "t": 2}, "p3": {"a": 1, "b": 1, "t": 1}, "p4": {"a": 3, "b": 2, "t": 0}, "p5": {"a": null, "b": null, "t": null}}	t	1
4	6	1000025	0	\N	\N	\N	{19,21,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 3}, "p25": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000076	0	\N	\N	\N	{13,14,13,13}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p4": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	6	1000293	0	457	\N	\N	{5,7,5,5}	\N	{"p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p27": {"a": null, "b": 1, "t": 3}}	t	216
1	5	1030	2	1	4	4	{2,4,3,7}	{0,0,1,3,0,1,2,4}	{"p1": {"a": 5, "b": 5, "t": 0}, "p2": {"a": 2, "b": 1, "t": 3}, "p3": {"a": 13, "b": 0, "t": null}, "p4": {"a": 2, "b": 1, "t": 1}}	f	\N
4	6	1000463	0	\N	\N	\N	{18,24,22,22}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 3}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": 3}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
2	6	10963	2	3	\N	18	{0,0,3,13}	\N	{"p1": {"a": 5, "b": 4, "t": 0}, "p2": {"a": 7, "b": 7, "t": 0}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 5, "b": 2, "t": 0}}	t	12
4	6	1000078	0	\N	\N	\N	{13,14,13,13}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 0, "t": null}, "p19": {"a": null, "b": 0, "t": null}, "p20": {"a": null, "b": 0, "t": null}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	5	1000476	0	\N	\N	\N	{8,11,8,8}	\N	{"p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 3}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 2}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	6	11912	2	5	\N	16	{0,0,0,0}	\N	{"p1": {"a": 6, "b": 0, "t": null}, "p2": {"a": 5, "b": 0, "t": null}, "p3": {"a": 6, "b": 0, "t": null}, "p4": {"a": 5, "b": 0, "t": null}}	t	20
1	5	61909	2	5	\N	2	{2,5,3,6}	{0,0,1,4,0,1,2,3}	{"p1": {"a": 4, "b": 3, "t": 4}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": 1, "b": 2, "t": 1}, "p4": {"a": 1, "b": 1}}	f	\N
4	6	1000649	0	\N	\N	\N	{16,24,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 2}, "p10": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": null}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 3}, "p26": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 2}}	t	\N
4	5	13179	2	3	\N	18	{1,1,1,1}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 9, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}}	t	\N
4	5	10114	2	6	\N	15	{1,1,1,1}	\N	{"p1": {"": 1, "a": 1, "b": 1, "t": 1}, "p2": {"a": 5, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}}	t	\N
2	5	1000312	0	477	\N	0	\N	\N	\N	t	114
4	6	1000417	0	\N	\N	\N	{14,18,19,19}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 1, "t": null}, "p5": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": 2}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 1, "t": 2}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000513	0	\N	\N	\N	{9,11,9,9}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 2}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 0, "t": null}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
4	5	10338	2	20	\N	1	{2,2,4,7}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"a": 1, "b": 1, "t": 1}, "p3": {"a": 5, "b": 4, "t": 0}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
4	5	55518	2	4	\N	17	{1,1,1,1}	\N	{"p1": {"": 1, "a": 1, "b": 1, "t": 1}, "p2": {"a": 5, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}}	t	\N
4	5	1000322	0	\N	\N	\N	{7,7,10,10}	\N	{"p6": {"a": null, "b": 1, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": null}}	t	\N
4	6	1000523	0	\N	\N	\N	{5,5,5,5}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 0, "t": null}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 0, "t": null}, "p19": {"a": null, "b": 0, "t": null}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
4	6	1000341	0	\N	\N	\N	{8,9,8,8}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 0, "t": null}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 0, "t": null}}	t	\N
4	5	1000041	2	1	\N	20	{0,0,1,1}	\N	{"p1": {"a": 3, "b": 1, "t": 0}, "p2": {"a": 7, "b": 0, "t": null}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": null}}	t	\N
4	5	9781	2	2	\N	19	{1,1,2,2}	\N	{"p1": {"a": 1, "b": 1, "t": 1}, "p2": {"": null, "a": 9, "b": 0, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 1, "t": 0}}	t	\N
4	6	1000432	0	\N	\N	\N	{12,16,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 2}, "p6": {"a": null, "b": 1, "t": 3}, "p7": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 2}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	5	1000357	0	543	\N	0	{4,6,5,5}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 3}}	t	89
3	6	1000390	0	40	\N	1	{1,1,2,5}	\N	{"p1": {"a": 1, "b": 0, "t": 0}, "p2": {"a": 4, "b": 4, "t": 0}, "p3": {"a": 1, "b": 0, "t": 0}, "p4": {"a": 1, "b": 0, "t": 0}, "p5": {"a": 1, "b": 1, "t": 1}}	t	22
4	6	1000639	0	\N	\N	\N	{13,16,14,14}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 2}, "p7": {"a": null, "b": 1, "t": null}, "p9": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": 1}, "p30": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000618	0	\N	\N	\N	{12,15,18,18}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 1, "t": 3}, "p5": {"a": null, "b": 1, "t": null}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": null}, "p11": {"a": null, "b": 1, "t": 2}, "p12": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": null}, "p25": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
2	6	5089	2	6	\N	15	{1,3,2,4}	\N	{"p1": {"a": 3, "b": 1, "t": 3}, "p2": {"a": 6, "b": 0, "t": null}, "p3": {"a": 4, "b": 0, "t": null}, "p4": {"a": 3, "b": 3, "t": 0}}	t	7
7	6	2000179	0	\N	\N	\N	{12,12,12,12}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p6": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}}	t	\N
7	6	1000258	0	\N	\N	\N	{10,11,10,11}	\N	{"p1": {"a": null, "b": null, "t": null}, "p4": {"b": 2, "t": 2}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p14": {"a": null, "b": null, "t": null}, "p15": {"b": 1, "t": 1}, "p16": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}}	t	\N
4	6	1000613	0	\N	\N	\N	{2,4,3,3}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 0, "t": null}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 0, "t": null}, "p7": {"a": null, "b": 0, "t": null}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"a": null, "b": 0, "t": null}, "p13": {"a": null, "b": 0, "t": null}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"a": null, "b": 0, "t": null}, "p16": {"a": null, "b": 0, "t": null}, "p17": {"a": null, "b": 0, "t": null}, "p18": {"a": null, "b": 0, "t": null}, "p19": {"a": null, "b": 0, "t": null}, "p20": {"a": null, "b": 0, "t": null}, "p21": {"a": null, "b": 0, "t": null}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 1, "t": null}, "p26": {"a": null, "b": 0, "t": null}, "p27": {"a": null, "b": 0, "t": null}, "p28": {"a": null, "b": 1, "t": 1}, "p29": {"a": null, "b": 0, "t": null}, "p30": {"a": null, "b": 1, "t": 3}}	t	\N
2	5	8101	3	3	\N	4	{2,5,4,4}	\N	{"p1": {"a": 3, "b": 1, "t": 3}, "p2": {"a": 4, "b": 1, "t": 0}, "p3": {"a": 2, "b": 1, "t": 2}, "p4": {"a": 3, "b": 1, "t": null}}	t	3
4	6	1000466	0	\N	\N	\N	{14,20,15,15}	\N	{"p1": {"a": null, "b": 1, "t": 2}, "p2": {"a": null, "b": 1, "t": 3}, "p3": {"a": null, "b": 0, "t": null}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 1, "t": null}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 1, "t": 2}, "p26": {"a": null, "b": 1, "t": 2}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
4	6	1000460	0	\N	\N	\N	{13,18,14,14}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 1, "t": 1}, "p6": {"a": null, "b": 1, "t": 3}, "p7": {"a": null, "b": 1, "t": 2}, "p10": {"a": null, "b": 1, "t": 3}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p22": {"a": null, "b": 0, "t": null}, "p23": {"a": null, "b": 0, "t": null}, "p24": {"a": null, "b": 0, "t": null}, "p25": {"a": null, "b": 0, "t": null}, "p26": {"a": null, "b": 1, "t": null}, "p28": {"a": null, "b": 1, "t": 1}}	t	\N
7	5	2000043	0	\N	\N	\N	{10,11,10,11}	\N	{"p1": {"b": 1, "t": 1}, "p4": {"b": 1, "t": 1}, "p5": {"b": 1, "t": 1}, "p7": {"b": 1, "t": 1}, "p10": {"b": 1, "t": 1}, "p12": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p21": {"b": 2, "t": 2}, "p26": {"a": null, "b": null, "t": null}, "p27": {"b": 1, "t": 1}}	t	\N
2	6	11522	0	46	\N	\N	{22,25,25,25}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 1, "t": 1}, "p3": {"a": null, "b": 1, "t": 1}, "p4": {"a": null, "b": 0, "t": null}, "p5": {"a": null, "b": 1, "t": null}, "p6": {"a": null, "b": 1, "t": 1}, "p7": {"a": null, "b": 1, "t": 1}, "p8": {"a": null, "b": 0, "t": null}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"a": null, "b": 0, "t": null}, "p11": {"a": null, "b": 1, "t": 3}, "p12": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"a": null, "b": 1, "t": 1}, "p19": {"a": null, "b": 1, "t": 1}, "p20": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p23": {"a": null, "b": 1, "t": 1}, "p24": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 1}, "p26": {"a": null, "b": 1, "t": null}, "p27": {"a": null, "b": 1, "t": 1}, "p28": {"a": null, "b": 1, "t": null}, "p29": {"a": null, "b": 1, "t": 2}, "p30": {"a": null, "b": 1, "t": 1}}	t	31
2	6	1000238	0	402	\N	\N	{6,7,8,8}	\N	{"p1": {"a": null, "b": 0, "t": null}, "p2": {"a": null, "b": 1, "t": null}, "p3": {"a": null, "b": 1, "t": 1}, "p13": {"a": null, "b": 1, "t": 1}, "p15": {"a": null, "b": 1, "t": null}, "p19": {"a": null, "b": 1, "t": 1}, "p21": {"a": null, "b": 1, "t": 1}, "p25": {"a": null, "b": 1, "t": 2}, "p27": {"a": null, "b": 1, "t": 1}}	t	186
7	6	100327	0	\N	\N	\N	{7,11,8,12}	\N	{"p1": {"a": null, "b": null, "t": null}, "p4": {"b": 3, "t": 3}, "p5": {"b": 1, "t": 1}, "p7": {"b": 2, "t": 2}, "p10": {"b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p17": {"b": 1, "t": 1}, "p18": {"b": 1}, "p27": {"b": 2, "t": 2}}	t	\N
1	5	5089	2	7	\N	7	\N	\N	\N	f	\N
1	5	9984	0	\N	\N	\N	{0,0,0,0}	\N	{"p1": {"a": null, "b": null, "t": null}, "p2": {"a": null, "b": null, "t": null}, "p3": {"a": null, "b": null, "t": null}, "p4": {"a": null, "b": null, "t": null}, "p5": {"a": null, "b": null, "t": null}, "p6": {"a": null, "b": null, "t": null}, "p7": {"a": null, "b": null, "t": null}, "p8": {"a": null, "b": null, "t": null}, "p9": {"a": null, "b": null, "t": null}, "p16": {}, "p20": {"a": null, "b": null, "t": null}, "p21": {"a": null, "b": null, "t": null}, "p22": {}, "p27": {"a": null, "b": null, "t": null}, "p28": {"a": null, "b": null, "t": null}, "p29": {"a": null, "b": null, "t": null}, "p30": {"a": null, "b": null, "t": null}}	f	\N
1	5	2000347	0	4	\N	3	{0,0,9,42}	\N	{"p1": {"a": null, "b": 1, "t": null}, "p2": {"b": 1, "t": null}, "p4": {"b": 0}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"b": 0}, "p7": {"b": 0}, "p8": {"b": 0}, "p9": {"a": null, "b": 0, "t": null}, "p10": {"b": 0}, "p11": {"a": null, "b": 0, "t": null}, "p12": {"b": 0}, "p13": {"b": 2}, "p14": {"a": null, "b": 0, "t": null}, "p15": {"b": 3}, "p18": {"b": 1}, "p21": {"a": null, "b": null, "t": null}, "p22": {"b": 2}, "p25": {"b": 1, "t": 0}, "p27": {"b": 30}, "p28": {"b": 1}, "p29": {}, "p30": {"a": null, "b": null, "t": null}}	f	\N
1	5	5244	0	\N	\N	\N	{0,0,0,0}	\N	{"p1": {"a": null, "b": null, "t": null}, "p2": {"a": null, "b": null, "t": null}, "p3": {"a": null, "b": null, "t": null}, "p4": {"a": null, "b": null, "t": null}, "p5": {"a": null, "b": null, "t": null}, "p6": {"a": null, "b": null, "t": null}, "p7": {"a": null, "b": null, "t": null}, "p8": {"a": null, "b": null, "t": null}, "p9": {"a": null, "b": null, "t": null}, "p10": {"a": null, "b": null, "t": null}, "p11": {"a": null, "b": null, "t": null}, "p12": {"a": null, "b": null, "t": null}, "p13": {"a": null, "b": null, "t": null}, "p14": {"a": null, "b": null, "t": null}, "p15": {"a": null, "b": null, "t": null}, "p16": {"a": null, "b": null, "t": null}, "p17": {"a": null, "b": null, "t": null}, "p18": {"a": null, "b": null, "t": null}, "p19": {"a": null, "b": null, "t": null}, "p20": {"a": null, "b": null, "t": null}, "p21": {"a": null, "b": null, "t": null}, "p22": {"a": null, "b": null, "t": null}, "p23": {"a": null, "b": null, "t": null}, "p24": {"a": null, "b": null, "t": null}, "p25": {"a": null, "b": null, "t": null}, "p26": {"a": null, "b": null, "t": null}, "p27": {"a": null, "b": null, "t": null}, "p28": {"a": null, "b": null, "t": null}, "p29": {"a": null, "b": null, "t": null}}	f	\N
1	5	1030	0	\N	\N	\N	{6,12,8,17}	\N	{"p1": {"a": null, "b": 1, "t": 1}, "p2": {"a": null, "b": 2, "t": 2}, "p3": {"b": 3}, "p4": {"a": null, "b": 1, "t": 1}, "p5": {"a": null, "b": 2, "t": null}, "p6": {"a": null, "b": 3, "t": 3}, "p7": {"b": 2, "t": 2}, "p8": {"b": 3, "t": 3}}	f	\N
1	5	6326	0	\N	\N	\N	{0,0,0,0}	\N	{"p1": {"a": null, "b": null, "t": null}, "p2": {"a": null, "b": null, "t": null}, "p3": {"a": null, "b": null, "t": null}, "p4": {"a": null, "b": null, "t": null}, "p5": {"a": null, "b": null, "t": null}, "p6": {"a": null, "b": null, "t": null}, "p7": {"a": null, "b": null, "t": null}, "p8": {"a": null, "b": null, "t": null}, "p9": {"a": null, "b": null, "t": null}, "p10": {"a": null, "b": null, "t": null}, "p11": {"a": null, "b": null, "t": null}, "p12": {"a": null, "b": null, "t": null}, "p13": {"a": null, "b": null, "t": null}, "p14": {"a": null, "b": null, "t": null}, "p15": {"a": null, "b": null, "t": null}, "p16": {"a": null, "b": null, "t": null}, "p17": {"a": null, "b": null, "t": null}, "p18": {"a": null, "b": null, "t": null}, "p20": {"a": null, "b": null, "t": null}, "p21": {"a": null, "b": null, "t": null}, "p23": {}, "p24": {"a": null, "b": null, "t": null}, "p25": {"a": null, "b": null, "t": null}, "p27": {"a": null, "b": null, "t": null}, "p28": {"a": null, "b": null, "t": null}, "p29": {"a": null, "b": null, "t": null}, "p30": {"a": null, "b": null, "t": null}}	f	\N
1	6	3223	0	\N	\N	\N	{0,0,0,0}	\N	{"p1": {"a": null, "b": null, "t": null}, "p2": {"a": null, "b": null, "t": null}, "p3": {"a": null, "b": null, "t": null}, "p4": {"a": null, "b": null, "t": null}, "p5": {"a": null, "b": null, "t": null}, "p6": {"a": null, "b": null, "t": null}, "p7": {"a": null, "b": null, "t": null}, "p8": {"a": null, "b": null, "t": null}, "p9": {"a": null, "b": null, "t": null}, "p10": {"a": null, "b": null, "t": null}, "p11": {"a": null, "b": null, "t": null}, "p17": {"a": null, "b": null, "t": null}}	f	\N
1	6	6550	0	\N	\N	\N	{27,37,30,45}	\N	{"p1": {"a": null, "b": 2, "t": 1}, "p2": {"a": null, "b": 2, "t": 2}, "p3": {"a": null, "b": 2, "t": null}, "p4": {"a": null, "b": 2, "t": 2}, "p5": {"a": null, "b": 3, "t": 3}, "p6": {"a": null, "b": 3, "t": 3}, "p7": {"a": null, "b": 2, "t": 2}, "p8": {"a": null, "b": 4, "t": null}, "p9": {"a": null, "b": 2, "t": 2}, "p10": {"a": null, "b": 1, "t": 1}, "p11": {"a": null, "b": 1, "t": 1}, "p12": {"a": null, "b": 2, "t": null}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": 1}, "p15": {"b": 1, "t": 1}, "p16": {"a": null, "b": 1, "t": 1}, "p17": {"a": null, "b": 1, "t": 1}, "p18": {"b": 1, "t": 1}, "p19": {"b": 1, "t": 1}, "p20": {"b": 1, "t": 1}, "p21": {"b": 1, "t": 1}, "p22": {"b": 1, "t": 1}, "p23": {"b": 1, "t": 1}, "p24": {"b": 1, "t": 1}, "p25": {"b": 2, "t": 2}, "p26": {"b": 1, "t": 1}, "p27": {"b": 1, "t": 1}, "p28": {"b": 1, "t": 1}, "p29": {"b": 1, "t": 1}, "p30": {"b": 1, "t": 1}}	f	\N
1	6	1000104	0	5	\N	2	{3,7,13,28}	\N	{"p1": {"a": null, "b": 2, "t": null}, "p2": {"a": null, "b": 2, "t": null}, "p3": {"a": null, "b": 1, "t": null}, "p4": {"a": null, "b": null, "t": null}, "p5": {"a": null, "b": 0, "t": null}, "p6": {"a": null, "b": 2, "t": null}, "p7": {"a": null, "b": 1, "t": null}, "p8": {"a": null, "b": 2, "t": null}, "p9": {"a": null, "b": 9, "t": null}, "p10": {"a": null, "b": 2, "t": null}, "p11": {"a": null, "b": 2, "t": null}, "p12": {"a": null, "b": 1, "t": 3}, "p13": {"a": null, "b": 1, "t": 2}, "p14": {"a": null, "b": 1, "t": 2}, "p20": {"a": null, "b": 2, "t": null}}	f	\N
1	6	8155	2	6	\N	1	\N	\N	\N	f	\N
1	5	50691	2	6	\N	4	{2,4,3,7}	{0,0,2,2,0,1,2,4}	{"p1": {"a": 5, "b": 4, "t": 4}, "p2": {"a": 2, "b": 0, "t": null}, "p3": {"a": 3, "b": 1, "t": 1}, "p4": {"a": 1, "b": 0, "t": null}}	f	\N
\.


--
-- Name: Climbers_pkey; Type: CONSTRAINT; Schema: public; Owner: timhatch; Tablespace: 
--

ALTER TABLE ONLY climbers
    ADD CONSTRAINT "Climbers_pkey" PRIMARY KEY (per_id);


--
-- Name: Competitions_pkey; Type: CONSTRAINT; Schema: public; Owner: timhatch; Tablespace: 
--

ALTER TABLE ONLY competitions
    ADD CONSTRAINT "Competitions_pkey" PRIMARY KEY (wet_id);


--
-- Name: Results_pkey; Type: CONSTRAINT; Schema: public; Owner: timhatch; Tablespace: 
--

ALTER TABLE ONLY results
    ADD CONSTRAINT "Results_pkey" PRIMARY KEY (wet_id, grp_id, per_id, route);


--
-- Name: params_pkey; Type: CONSTRAINT; Schema: public; Owner: timhatch; Tablespace: 
--

ALTER TABLE ONLY "Params"
    ADD CONSTRAINT params_pkey PRIMARY KEY (grp_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: timhatch
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM timhatch;
GRANT ALL ON SCHEMA public TO timhatch;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

