-- Database backup



--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ingredient_types; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE ingredient_types (
    ingredient_type_id integer NOT NULL,
    type_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE ingredient_types OWNER TO kathyma;

--
-- Name: ingredient_types_ingredient_type_id_seq; Type: SEQUENCE; Schema: public; Owner: kathyma
--

CREATE SEQUENCE ingredient_types_ingredient_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingredient_types_ingredient_type_id_seq OWNER TO kathyma;

--
-- Name: ingredient_types_ingredient_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kathyma
--

ALTER SEQUENCE ingredient_types_ingredient_type_id_seq OWNED BY ingredient_types.ingredient_type_id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE ingredients (
    ingredient_id integer NOT NULL,
    ingredient_name character varying(100) NOT NULL
);


ALTER TABLE ingredients OWNER TO kathyma;

--
-- Name: ingredients_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: kathyma
--

CREATE SEQUENCE ingredients_ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingredients_ingredient_id_seq OWNER TO kathyma;

--
-- Name: ingredients_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kathyma
--

ALTER SEQUENCE ingredients_ingredient_id_seq OWNED BY ingredients.ingredient_id;


--
-- Name: recipe_ingredients; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE recipe_ingredients (
    recipe_ingredient_id integer NOT NULL,
    recipe_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    measurement character varying(50)
);


ALTER TABLE recipe_ingredients OWNER TO kathyma;

--
-- Name: recipe_ingredients_recipe_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: kathyma
--

CREATE SEQUENCE recipe_ingredients_recipe_ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipe_ingredients_recipe_ingredient_id_seq OWNER TO kathyma;

--
-- Name: recipe_ingredients_recipe_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kathyma
--

ALTER SEQUENCE recipe_ingredients_recipe_ingredient_id_seq OWNED BY recipe_ingredients.recipe_ingredient_id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE recipes (
    recipe_id integer NOT NULL,
    title character varying(100) NOT NULL,
    prep_time character varying(100),
    ready_in character varying(100),
    yield_amt character varying(100),
    image character varying(500),
    instructions character varying(20000)
);


ALTER TABLE recipes OWNER TO kathyma;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: kathyma
--

CREATE SEQUENCE recipes_recipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipes_recipe_id_seq OWNER TO kathyma;

--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kathyma
--

ALTER SEQUENCE recipes_recipe_id_seq OWNED BY recipes.recipe_id;


--
-- Name: substitution_ingredients; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE substitution_ingredients (
    sub_ingredient_id integer NOT NULL,
    sub_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE substitution_ingredients OWNER TO kathyma;

--
-- Name: substitution_ingredients_sub_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: kathyma
--

CREATE SEQUENCE substitution_ingredients_sub_ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE substitution_ingredients_sub_ingredient_id_seq OWNER TO kathyma;

--
-- Name: substitution_ingredients_sub_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kathyma
--

ALTER SEQUENCE substitution_ingredients_sub_ingredient_id_seq OWNED BY substitution_ingredients.sub_ingredient_id;


--
-- Name: substitutions; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE substitutions (
    sub_id integer NOT NULL,
    sub_name character varying(100) NOT NULL
);


ALTER TABLE substitutions OWNER TO kathyma;

--
-- Name: substitutions_sub_id_seq; Type: SEQUENCE; Schema: public; Owner: kathyma
--

CREATE SEQUENCE substitutions_sub_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE substitutions_sub_id_seq OWNER TO kathyma;

--
-- Name: substitutions_sub_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kathyma
--

ALTER SEQUENCE substitutions_sub_id_seq OWNED BY substitutions.sub_id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE types (
    type_id integer NOT NULL,
    type_name character varying(100) NOT NULL
);


ALTER TABLE types OWNER TO kathyma;

--
-- Name: types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: kathyma
--

CREATE SEQUENCE types_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE types_type_id_seq OWNER TO kathyma;

--
-- Name: types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kathyma
--

ALTER SEQUENCE types_type_id_seq OWNED BY types.type_id;


--
-- Name: ingredient_type_id; Type: DEFAULT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY ingredient_types ALTER COLUMN ingredient_type_id SET DEFAULT nextval('ingredient_types_ingredient_type_id_seq'::regclass);


--
-- Name: ingredient_id; Type: DEFAULT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY ingredients ALTER COLUMN ingredient_id SET DEFAULT nextval('ingredients_ingredient_id_seq'::regclass);


--
-- Name: recipe_ingredient_id; Type: DEFAULT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY recipe_ingredients ALTER COLUMN recipe_ingredient_id SET DEFAULT nextval('recipe_ingredients_recipe_ingredient_id_seq'::regclass);


--
-- Name: recipe_id; Type: DEFAULT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY recipes ALTER COLUMN recipe_id SET DEFAULT nextval('recipes_recipe_id_seq'::regclass);


--
-- Name: sub_ingredient_id; Type: DEFAULT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY substitution_ingredients ALTER COLUMN sub_ingredient_id SET DEFAULT nextval('substitution_ingredients_sub_ingredient_id_seq'::regclass);


--
-- Name: sub_id; Type: DEFAULT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY substitutions ALTER COLUMN sub_id SET DEFAULT nextval('substitutions_sub_id_seq'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY types ALTER COLUMN type_id SET DEFAULT nextval('types_type_id_seq'::regclass);


--
-- Data for Name: ingredient_types; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY ingredient_types (ingredient_type_id, type_id, ingredient_id) FROM stdin;
\.


--
-- Name: ingredient_types_ingredient_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('ingredient_types_ingredient_type_id_seq', 1, false);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY ingredients (ingredient_id, ingredient_name) FROM stdin;
1	chicken
2	fish
3	bacon
4	egg
5	beef
6	apple
7	banana
8	orange
9	lemon
10	tomato
11	lettuce
12	spinach
13	onion
14	carrot
15	celery
16	mushroom
17	rice
18	cheese
19	string beans
20	tofu
\.


--
-- Name: ingredients_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('ingredients_ingredient_id_seq', 20, true);


--
-- Data for Name: recipe_ingredients; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY recipe_ingredients (recipe_ingredient_id, recipe_id, ingredient_id, measurement) FROM stdin;
1	1	1	\N
2	1	17	\N
3	1	13	\N
4	2	1	\N
5	2	11	\N
6	2	10	\N
7	3	2	\N
8	3	10	\N
9	3	11	\N
10	4	1	\N
11	4	8	\N
12	4	4	\N
13	5	3	\N
14	5	19	\N
15	5	13	\N
16	6	5	\N
17	6	14	\N
18	6	13	\N
19	6	10	\N
20	7	7	\N
21	8	1	\N
22	8	9	\N
23	9	2	\N
24	9	9	\N
25	10	10	\N
26	10	13	\N
27	10	14	\N
28	10	15	\N
29	10	16	\N
30	11	4	\N
31	11	13	\N
32	11	3	\N
33	12	20	\N
34	12	19	\N
35	12	13	\N
36	13	10	\N
37	13	5	\N
38	13	13	\N
39	14	1	\N
40	14	16	\N
41	14	13	\N
42	15	18	\N
43	16	2	\N
44	16	15	\N
45	16	13	\N
46	17	4	\N
47	17	3	\N
48	19	3	\N
49	19	4	\N
50	19	10	\N
51	19	12	\N
52	19	16	\N
53	20	7	\N
54	20	8	\N
\.


--
-- Name: recipe_ingredients_recipe_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('recipe_ingredients_recipe_ingredient_id_seq', 54, true);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY recipes (recipe_id, title, prep_time, ready_in, yield_amt, image, instructions) FROM stdin;
1	chicken and rice	\N	\N	\N	\N	\N
2	chicken salad	\N	\N	\N	\N	\N
3	fish taco	\N	\N	\N	\N	\N
4	orange chicken	\N	\N	\N	\N	\N
5	string beans with bacon	\N	\N	\N	\N	\N
6	beef stew	\N	\N	\N	\N	\N
7	strawberry banana smoothie	\N	\N	\N	\N	\N
8	lemon chicken	\N	\N	\N	\N	\N
9	lemon fish	\N	\N	\N	\N	\N
10	vegetable stew	\N	\N	\N	\N	\N
11	omelette	\N	\N	\N	\N	\N
12	tofu with string beans	\N	\N	\N	\N	\N
13	tomato beef	\N	\N	\N	\N	\N
14	mushroom chicken	\N	\N	\N	\N	\N
15	supberbowl nachos	\N	\N	\N	\N	\N
16	tuna sandwich	\N	\N	\N	\N	\N
17	carbonara	\N	\N	\N	\N	\N
18	cheesecake	\N	\N	\N	\N	\N
19	breakfast delight	\N	\N	\N	\N	\N
20	tropical smoothie	\N	\N	\N	\N	\N
\.


--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('recipes_recipe_id_seq', 20, true);


--
-- Data for Name: substitution_ingredients; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY substitution_ingredients (sub_ingredient_id, sub_id, ingredient_id) FROM stdin;
\.


--
-- Name: substitution_ingredients_sub_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('substitution_ingredients_sub_ingredient_id_seq', 1, false);


--
-- Data for Name: substitutions; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY substitutions (sub_id, sub_name) FROM stdin;
\.


--
-- Name: substitutions_sub_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('substitutions_sub_id_seq', 1, false);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY types (type_id, type_name) FROM stdin;
\.


--
-- Name: types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('types_type_id_seq', 1, false);


--
-- Name: ingredient_types_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY ingredient_types
    ADD CONSTRAINT ingredient_types_pkey PRIMARY KEY (ingredient_type_id);


--
-- Name: ingredients_ingredient_name_key; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT ingredients_ingredient_name_key UNIQUE (ingredient_name);


--
-- Name: ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (ingredient_id);


--
-- Name: recipe_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_pkey PRIMARY KEY (recipe_ingredient_id);


--
-- Name: recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (recipe_id);


--
-- Name: recipes_title_key; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY recipes
    ADD CONSTRAINT recipes_title_key UNIQUE (title);


--
-- Name: substitution_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY substitution_ingredients
    ADD CONSTRAINT substitution_ingredients_pkey PRIMARY KEY (sub_ingredient_id);


--
-- Name: substitutions_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY substitutions
    ADD CONSTRAINT substitutions_pkey PRIMARY KEY (sub_id);


--
-- Name: substitutions_sub_name_key; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY substitutions
    ADD CONSTRAINT substitutions_sub_name_key UNIQUE (sub_name);


--
-- Name: types_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_pkey PRIMARY KEY (type_id);


--
-- Name: types_type_name_key; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_type_name_key UNIQUE (type_name);


--
-- Name: ingredient_types_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY ingredient_types
    ADD CONSTRAINT ingredient_types_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id);


--
-- Name: ingredient_types_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY ingredient_types
    ADD CONSTRAINT ingredient_types_type_id_fkey FOREIGN KEY (type_id) REFERENCES types(type_id);


--
-- Name: recipe_ingredients_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id);


--
-- Name: recipe_ingredients_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id);


--
-- Name: substitution_ingredients_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY substitution_ingredients
    ADD CONSTRAINT substitution_ingredients_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id);


--
-- Name: substitution_ingredients_sub_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY substitution_ingredients
    ADD CONSTRAINT substitution_ingredients_sub_id_fkey FOREIGN KEY (sub_id) REFERENCES substitutions(sub_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

