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

--
-- Name: strip_tags(text); Type: FUNCTION; Schema: public; Owner: kathyma
--

CREATE FUNCTION strip_tags(text) RETURNS text
    LANGUAGE sql
    AS $_$
SELECT regexp_replace(regexp_replace($1, E'(?x)<[^>]*?(\s alt \s* = \s* ([\'"]) ([^>]*?) \2) [^>]*? >', E'\3'), E'(?x)(< [^>]*? >)', '', 'g')

$_$;


ALTER FUNCTION public.strip_tags(text) OWNER TO kathyma;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: diets; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE diets (
    diet_code character varying(100) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE diets OWNER TO kathyma;

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
    name character varying(100) NOT NULL
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
-- Name: recipe_diets; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE recipe_diets (
    recipe_diet_id integer NOT NULL,
    recipe_id integer NOT NULL,
    diet_code character varying(100) NOT NULL
);


ALTER TABLE recipe_diets OWNER TO kathyma;

--
-- Name: recipe_diets_recipe_diet_id_seq; Type: SEQUENCE; Schema: public; Owner: kathyma
--

CREATE SEQUENCE recipe_diets_recipe_diet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipe_diets_recipe_diet_id_seq OWNER TO kathyma;

--
-- Name: recipe_diets_recipe_diet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kathyma
--

ALTER SEQUENCE recipe_diets_recipe_diet_id_seq OWNED BY recipe_diets.recipe_diet_id;


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
    title character varying(1000) NOT NULL,
    prep_time character varying(100),
    ready_in character varying(100),
    yield_amt character varying(100),
    image character varying(1000),
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
    name character varying(100) NOT NULL
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
-- Name: recipe_diet_id; Type: DEFAULT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY recipe_diets ALTER COLUMN recipe_diet_id SET DEFAULT nextval('recipe_diets_recipe_diet_id_seq'::regclass);


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
-- Data for Name: diets; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY diets (diet_code, name) FROM stdin;
vg	vegan
v	vegetarian
pes	pescetarian
a	any
pal	paleo
pr	primal
\.


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

COPY ingredients (ingredient_id, name) FROM stdin;
1	lager
2	chicken
3	Spice Rub
4	eggs
5	salt and pepper
6	water
7	black pepper
8	self-rising flour
9	crisco
10	flour
11	whole chicken
12	lard
13	salt
14	parmesan cheese
15	seasoned bread crumbs
16	vegetable oil
17	milk
18	half n half
19	slaw dressing
20	feta cheese
21	garlic cloves
22	chickens
23	fresh rosemary
24	curry powder
25	cumin
26	guacamole
27	bread
28	apple
29	beets
30	bean sprouts
31	carrots
32	lemon thyme
33	pepitas
34	baby spinach
35	kale
36	butter
37	butternut squash
38	onion
39	bacon
40	red wine vinegar
41	white mushrooms
42	sweet potatoes
43	garlic
44	apples
45	rosemary
46	Salt & Pepper
47	olive oil
48	bananas
49	fava beans
50	green tea
51	peaches
52	fennel
53	blueberries
54	cherry
55	celery
56	pancetta
57	grapefruit
58	orange
59	fresh parsley
60	plums
61	pumpkin
62	chives
63	anchovy
64	goat cheese
65	watermelon
66	figs
67	limes
68	asparagus
69	prosciutto
70	pork
71	dry white wine
72	fish
73	golden raisin
74	almonds
75	lentils
76	tarragon
77	yogurt
78	cauliflower
79	corn
80	raspberries
81	grapes
82	pasta
83	dates
84	red peppers
85	oatmeal
86	beans
87	buckwheat
88	miso
89	cheese
90	radish
91	tofu
92	mushrooms
93	hungarian sweet paprika
94	duck
95	leeks
96	beef
97	spinach
98	anise
99	artichokes
100	pears
101	ground cumin
102	blue cheese
103	cranberry bread
104	basil
105	seafood stock
106	tomato
107	tangerine
108	squash
109	chocolate
110	fresh cilantro
111	couscous
112	chile
113	olive
114	rice
115	strawberry
116	sweet potato
117	corned beef
118	dill
119	coconut
120	turnips
121	ginger
122	honey
123	brussel sprouts
124	mint
125	cream
126	lamb
127	lemon
128	nuts
129	apricots
130	papaya
131	mustard
132	tomato paste
133	peas
134	quinoa
135	cucumber
136	melon
137	capers
138	scallions
139	broccoli
140	potato
141	bbq sauce
142	pineapple
143	wine
144	oil
145	white vinegar
146	orange juice
147	peppercorns
148	soy sauce
149	fennel bulb
150	vanilla powder
151	roasted cashew nuts
152	sugar
153	5 spice powder
154	maple syrup
155	dried basil
156	juice of lemon
157	mayo
158	cranberries
159	apple cider vinegar
160	fat of choice
161	ground nutmeg
162	pepper
163	bay leaves
164	chicken broth
165	orange peel
166	carrot
167	thyme sprigs
168	onions
169	non fat yogurt
170	white balsamic vinegar
171	dijon mustard
172	spice mix
173	fat free cool whip
174	red grapes
175	cayenne pepper
176	garlic salt
177	cinnamon
178	old bay seasoning
179	ground coriander
180	green onion
181	walnuts
182	celery stalk
183	cream cheese
184	fresh tarragon
185	lemon juice
186	gala apple
187	focaccia
188	mayonnaise
189	kosher salt
190	cider vinegar
191	nutmeg
192	chicken stock
193	red onion
194	worcestershire sauce
195	rolls
196	sharp cheddar
197	thick-cut bacon
198	coarse black pepper
199	ketchup
200	lemon cake mix
201	mexican cheese
202	puff pastry
203	lime wedge
204	raspberry jam
205	heavy cream
206	coconut rum
207	italian bread
208	whole milk
209	coconut milk
210	vanilla extract
211	vanilla bean
212	cornstarch
213	white wine vinegar
214	to 5 jalepeno
215	egg yolks
216	ice cubes
217	cucumbers
218	light cream cheese
219	coarse salt
220	egg
221	quick cooking oats
222	corn oil
223	serrano chiles
224	kimchi
225	sesame oil
226	sesame seeds
227	cilantro leaves
228	seasoned rice vinegar
229	flour tortillas
230	jack cheese
231	avocados
232	gochujang
233	rice crackers
234	sirloin steak
235	brown sugar
236	shiitake mushrooms
237	mozzarella cheese
238	pizza dough
239	green onions
240	thousand island dressing
241	sauerkraut
242	swiss cheese
243	roast turkey breast
244	rye ipa
245	crab legs
246	cooked rice
247	cooking oil
248	tuna
249	english muffins
250	sesame
251	enoki mushrooms
252	sesame seed oil
253	liquid smoke
254	coarse sea salt
255	parsley
256	dried mushrooms
257	button mushrooms
258	pecan pieces
259	seasoning salt
260	zucchini
261	fresh mushrooms
262	green beans
263	shallots
264	garlic powder
265	brussels sprouts
266	sea salt
267	red bell pepper
268	angel hair
269	tomatoes
270	pineapple chunks
271	spinach leaves
272	mint leaves
273	bulgur wheat
274	sultanas
275	crushed red pepper
276	creamy peanut butter
277	garlic clove
278	pine nuts
279	apple [diced]
280	green grapes
281	pea shoots
282	fresh dill
283	fresh ginger
284	fresh nutmeg
285	dried cranberries
286	granulated garlic
287	extra virgin olive oil
288	smoked paprika
289	tahini
290	raisins
291	red pepper flakes
292	baby spinach leaves
293	ice
294	cannellini beans
295	lower sodium shoyu
296	linguine
297	fresh mint
298	vegetable stock
299	lime
300	red apples
301	apple juice
302	white-wine vinegar
303	orange zest
304	low sodium chicken broth
305	whole-grain mustard
306	cilantro
307	green apple
308	bell pepper
309	banana
310	coconut water
311	plain flour
312	balsamic vinegar
313	tart apple
314	ginger root
315	filtered water
316	pearl barley
317	vegetable
318	tangerines
319	liquid stevia
320	nutritional yeast
321	mandarin orange segments
322	pomegranate juice
323	hemp seeds
324	mixed berries
325	walnut pieces
326	red potatoes
327	portobello mushrooms
328	red delicious apple
329	avocado
330	orange bell pepper
331	ginger juice
332	pesto sauce
333	canned chickpeas
334	whole wheat flour
335	fresh sage
336	yellow onion
337	sweetened dried cranberries
338	bartlett pear
339	sunflower seeds
340	strawberries
341	canned white beans
342	cayenne
343	ancho chile powder
344	paprika
345	dry mustard
346	cashews
347	vegetable broth
348	celery root
349	shallot
350	dried fava beans
351	pinenuts
352	basil leaves
353	pumpkin seeds
354	goji berries
355	navel oranges
356	raw pumpkin seeds
357	lime juice
358	white rum
\.


--
-- Name: ingredients_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('ingredients_ingredient_id_seq', 358, true);


--
-- Data for Name: recipe_diets; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY recipe_diets (recipe_diet_id, recipe_id, diet_code) FROM stdin;
1	217239	a
2	291025	a
3	78752	a
4	136337	a
5	136441	a
6	611630	a
7	136586	a
8	136584	a
9	521767	a
10	539746	a
11	621269	a
12	3586	a
13	52616	a
14	622201	a
15	443055	a
16	30519	a
17	294326	a
18	316111	a
19	577825	a
20	106375	v
21	106375	a
22	21515	v
23	21515	a
24	82698	a
25	564269	a
26	78638	a
27	248370	a
28	567389	a
29	558930	a
30	65651	a
31	567452	a
32	38649	vg
33	38649	v
34	38649	a
35	38747	vg
36	38747	v
37	38747	a
38	202674	vg
39	202674	v
40	202674	a
41	481335	vg
42	481335	v
43	481335	a
44	105376	vg
45	105376	v
46	105376	a
47	286116	vg
48	286116	v
49	286116	a
50	582452	vg
51	582452	v
52	582452	a
53	500625	vg
54	500625	v
55	500625	a
56	238687	vg
57	238687	v
58	238687	a
59	517329	vg
60	517329	v
61	517329	a
62	611483	vg
63	611483	v
64	611483	a
65	390611	vg
66	390611	v
67	390611	a
68	661362	vg
69	661362	v
70	661362	a
71	391182	vg
72	391182	v
73	391182	a
74	235751	vg
75	235751	v
76	235751	a
77	473382	vg
78	473382	v
79	473382	a
80	507163	vg
81	507163	v
82	507163	a
83	581090	vg
84	581090	v
85	581090	a
86	343839	vg
87	343839	v
88	343839	a
89	294865	vg
90	294865	v
91	294865	a
92	472914	vg
93	472914	v
94	472914	a
95	472966	vg
96	472966	v
97	472966	a
98	596192	vg
99	596192	v
100	596192	a
101	543108	vg
102	543108	v
103	543108	a
104	522722	vg
105	522722	v
106	522722	a
107	14878	vg
108	14878	v
109	14878	a
110	14896	vg
111	14896	v
112	14896	a
113	567865	vg
114	567865	v
115	567865	a
116	14909	vg
117	14909	v
118	14909	a
119	14910	vg
120	14910	v
121	14910	a
122	552202	vg
123	552202	v
124	552202	a
125	15628	vg
126	15628	v
127	15628	a
128	507177	vg
129	507177	v
130	507177	a
131	560600	vg
132	560600	v
133	560600	a
134	286168	vg
135	286168	v
136	286168	a
137	527883	vg
138	527883	v
139	527883	a
140	618083	vg
141	618083	v
142	618083	a
143	609907	vg
144	609907	v
145	609907	a
146	573057	vg
147	573057	v
148	573057	a
149	544388	vg
150	544388	v
151	544388	a
152	609926	vg
153	609926	v
154	609926	a
155	524038	vg
156	524038	v
157	524038	a
158	544620	vg
159	544620	v
160	544620	a
161	626641	vg
162	626641	v
163	626641	a
164	524262	vg
165	524262	v
166	524262	a
167	524326	vg
168	524326	v
169	524326	a
170	626747	vg
171	626747	v
172	626747	a
173	573683	vg
174	573683	v
175	573683	a
176	573713	vg
177	573713	v
178	573713	a
179	557362	vg
180	557362	v
181	557362	a
182	758114	vg
183	758114	v
184	758114	a
185	500244	vg
186	500244	v
187	500244	a
188	721437	vg
189	721437	v
190	721437	a
191	762412	vg
192	762412	v
193	762412	a
194	373375	vg
195	373375	v
196	373375	a
197	660108	vg
198	660108	v
199	660108	a
200	205460	vg
201	205460	v
202	205460	a
203	512669	vg
204	512669	v
205	512669	a
206	537238	vg
207	537238	v
208	537238	a
209	516844	vg
210	516844	v
211	516844	a
212	533222	vg
213	533222	v
214	533222	a
215	758513	vg
216	758513	v
217	758513	a
218	627519	vg
219	627519	v
220	627519	a
221	602969	vg
222	602969	v
223	602969	a
224	13196	vg
225	13196	v
226	13196	a
227	95138	vg
228	95138	v
229	95138	a
230	304127	vg
231	304127	v
232	304127	a
233	619542	vg
234	619542	v
235	619542	a
236	628033	vg
237	628033	v
238	628033	a
239	619940	vg
240	619940	v
241	619940	a
242	611773	vg
243	611773	v
244	611773	a
245	398788	vg
246	398788	v
247	398788	a
248	615902	vg
249	615902	v
250	615902	a
251	521800	vg
252	521800	v
253	521800	a
254	149107	vg
255	149107	v
256	149107	a
\.


--
-- Name: recipe_diets_recipe_diet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('recipe_diets_recipe_diet_id_seq', 259, true);


--
-- Data for Name: recipe_ingredients; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY recipe_ingredients (recipe_ingredient_id, recipe_id, ingredient_id, measurement) FROM stdin;
1	217239	1	1.0 can
2	217239	2	3.5 pound
3	217239	3	2.0 tablespoons
4	291025	4	3.0 
5	291025	5	4.0 servings
6	291025	6	0.333333333333 cup
7	291025	7	1.0 teaspoon
8	291025	8	2.0 cups
9	291025	2	2.5 pound
10	291025	9	4.0 servings
11	78752	10	1.0 cup
12	78752	11	1.0 
13	78752	5	1.0 serving
14	78752	6	8.0 cup
15	78752	12	1.5 cup
16	78752	13	0.5 cup
17	136337	6	1.0 serving
18	136337	14	1.0 serving
19	136337	2	1.0 piece
20	136337	15	1.0 serving
21	136441	16	2.0 cups
22	136441	10	1.0 cup
23	136441	6	1.0 cup
24	136441	7	0.5 teaspoon
25	136441	2	3.0 pound
26	136441	13	2.0 teaspoons
27	136441	17	0.5 cup
28	136441	18	1.5 cups
29	611630	2	1.0 cup
30	611630	19	4.0 Tablespoons
31	611630	20	3.0 Tablespoons
32	136586	21	4.0 
33	136586	22	4.0 lb
34	136586	23	8.0 sprigs
35	136584	24	2.0 teaspoons
36	136584	2	3.0 lbs
37	136584	13	2.0 teaspoons
38	136584	25	2.0 teaspoons
39	521767	2	2.0 c
40	521767	26	2.0 c
41	521767	27	4.0 servings
42	539746	28	1.0 
43	539746	29	2.0 
44	539746	30	6.0 servings
45	539746	4	6.0 servings
46	539746	31	4.0 
47	539746	32	6.0 servings
48	539746	33	6.0 servings
49	539746	34	1.0 pound
50	539746	2	6.0 servings
51	539746	35	1.0 head
52	621269	36	3.0 T
53	621269	37	3.0 cups
54	621269	38	1.0 
55	621269	39	3.0 slices
56	621269	40	2.0 T
57	621269	11	1.0 
58	621269	6	0.5 cup
59	621269	41	0.5 lb
60	621269	42	3.0 cups
61	621269	43	2.0 cloves
62	621269	44	2.0 cups
63	621269	45	2.0 
64	621269	46	8.0 servings
65	3586	47	1.0 serving
66	3586	48	1.0 serving
67	3586	49	1.0 serving
68	3586	50	1.0 serving
69	3586	51	1.0 serving
70	3586	52	1.0 serving
71	3586	2	1.0 serving
72	3586	53	1.0 serving
73	3586	54	1.0 serving
74	3586	55	1.0 serving
75	3586	56	1.0 serving
76	3586	57	1.0 serving
77	3586	58	1.0 serving
78	3586	59	0.5 cup
79	3586	60	1.0 serving
80	3586	61	1.0 serving
81	3586	62	1.0 serving
82	3586	63	1.0 serving
83	3586	64	1.0 serving
84	3586	65	1.0 serving
85	3586	66	1.0 serving
86	3586	38	1.0 serving
87	3586	67	2.0 
88	3586	68	1.0 serving
89	3586	69	1.0 serving
90	3586	14	1.0 serving
91	3586	70	1.0 serving
92	3586	71	0.25 cup
93	3586	72	2.0 fillet
94	3586	73	1.0 serving
95	3586	74	1.0 serving
96	3586	75	1.0 serving
97	3586	76	1.0 serving
98	3586	77	1.0 serving
99	3586	78	1.0 serving
100	3586	79	1.0 serving
101	3586	80	1.0 serving
102	3586	81	1.0 serving
103	3586	82	1.0 serving
104	3586	83	1.0 serving
105	3586	84	1.0 serving
106	3586	85	1.0 serving
107	3586	86	1.0 serving
108	3586	87	1.0 serving
109	3586	43	1.0 serving
110	3586	88	1.0 serving
111	3586	89	1.0 serving
112	3586	28	1.0 serving
113	3586	90	1.0 serving
114	3586	91	1.0 serving
115	3586	92	1.0 serving
116	3586	93	2.0 Tbsps
117	3586	94	1.0 serving
118	3586	95	1.0 serving
119	3586	96	1.0 serving
120	3586	97	1.0 serving
121	3586	98	1.0 serving
122	3586	99	1.0 serving
123	3586	100	1.0 serving
124	3586	101	1.5 tsps
125	3586	102	1.0 serving
126	3586	103	1.0 serving
127	3586	104	1.0 serving
128	3586	105	1.0 serving
129	3586	106	1.0 serving
130	3586	107	1.0 serving
131	3586	108	1.0 serving
132	3586	109	1.0 serving
133	3586	110	0.5 cup
134	3586	111	1.0 serving
135	3586	112	1.0 serving
136	3586	113	1.0 serving
137	3586	114	1.0 serving
138	3586	115	1.0 serving
139	3586	116	1.0 serving
140	3586	117	1.0 serving
141	3586	118	1.0 serving
142	3586	119	1.0 serving
143	3586	31	1.0 serving
144	3586	120	1.0 serving
145	3586	121	1.0 serving
146	3586	122	1.0 serving
147	3586	123	1.0 serving
148	3586	124	1.0 serving
149	3586	125	1.0 serving
150	3586	126	1.0 serving
151	3586	21	5.0 
152	3586	127	1.0 
153	3586	128	1.0 serving
154	3586	129	1.0 serving
155	3586	130	1.0 serving
156	3586	131	1.0 serving
157	3586	4	1.0 serving
158	3586	132	1.0 Tbsps
159	3586	133	1.0 serving
160	3586	134	1.0 serving
161	3586	135	1.0 serving
162	3586	136	1.0 serving
163	3586	137	1.0 serving
164	3586	138	1.0 serving
165	3586	139	1.0 serving
166	3586	36	1.0 serving
167	3586	29	1.0 serving
168	3586	140	1.0 serving
169	3586	141	1.0 Tbsps
170	3586	142	1.0 serving
171	3586	143	1.0 serving
172	52616	47	4.0 Tbsps
173	52616	144	2.0 Tbsp
174	52616	145	0.25 cup
175	52616	28	1.0 
176	52616	146	0.25 cup
177	52616	13	1.0 tsp
178	52616	11	1.0 
179	52616	147	2.0 Tbsp
180	52616	148	1.0 Tbsp
181	52616	122	1.0 Tbsp
182	52616	149	0.5 
183	52616	7	1.0 tsp
184	52616	43	2.0 cloves
185	52616	150	1.0 tsp
186	52616	151	0.5 cup
187	52616	152	2.0 Tbsps
188	52616	153	1.0 pinch
189	622201	154	1.5 TBSP
190	622201	13	1.0 pinch
191	622201	28	1.0 
192	622201	155	1.0 Tbsp
193	622201	156	112.0 
194	622201	157	1.0 
195	622201	25	2.0 tsp
196	622201	38	1.0 
197	622201	55	2.0 stalks
198	622201	43	2.0 cloves
199	622201	158	2.0 cups
200	622201	159	1.0 Tbsp
201	622201	2	4.0 
202	622201	160	2.0 servings
203	443055	36	3.0 tablespoons
204	443055	161	0.125 teaspoon
205	443055	162	0.5 teaspoon
206	443055	28	1.0 
207	443055	146	0.333333333333 cup
208	443055	10	2.0 tablespoons
209	443055	163	2.0 
210	443055	164	4.0 servings
211	443055	13	0.5 teaspoon
212	443055	165	2.0 teaspoons
213	443055	55	1.0 rib
214	443055	166	1.0 
215	443055	45	1.0 
216	443055	167	4.0 
217	443055	2	3.0 pounds
218	443055	59	4.0 sprigs
219	443055	168	2.0 
220	443055	23	1.0 tablespoon
221	30519	169	1.0 cup
222	30519	170	2.0 T
223	30519	171	1.0 T
224	30519	172	4.0 cups
225	30519	173	0.75 cup
226	30519	174	2.0 cups
227	30519	13	3.0 servings
228	30519	175	0.5 t
229	30519	55	2.0 cups
230	30519	176	1.0 t
231	30519	177	0.5 t
232	30519	24	1.0 t
233	30519	2	2.0 cups
234	30519	178	2.0 t
235	30519	179	1.0 t
236	30519	180	1.0 bunch
237	30519	181	0.25 cup
238	30519	44	2.0 cups
239	294326	47	3.0 tablespoons
240	294326	182	1.0 
241	294326	127	0.5 
242	294326	38	0.5 
243	294326	183	0.5 cup
244	294326	31	2.0 
245	294326	184	1.0 tablespoon
246	294326	11	2.5 pound
247	294326	181	0.25 cup
248	294326	185	2.0 tablespoons
249	294326	186	1.0 
250	294326	43	4.0 cloves
251	294326	187	16.0 ounce
252	294326	81	0.75 cup
253	294326	167	2.0 
254	294326	188	1.0 cup
255	294326	59	1.0 tablespoon
256	294326	189	4.0 servings
257	316111	36	2.0 tablespoons
258	316111	154	0.25 cup
259	316111	171	0.25 cup
260	316111	190	2.0 tablespoons
261	316111	191	6.0 servings
262	316111	192	1.0 cup
263	316111	193	1.0 
264	316111	194	3.0 tablespoons
265	316111	38	1.0 
266	316111	195	6.0 servings
267	316111	196	6.0 servings
268	316111	43	2.0 cloves
269	316111	44	2.0 
270	316111	197	4.0 ounces
271	316111	198	6.0 servings
272	316111	2	3.0 cups
273	316111	199	1.0 cup
274	316111	27	6.0 servings
275	577825	200	18.25 ounce
276	577825	201	0.25 cup
277	577825	202	1.0 sheet
278	577825	2	0.25 cup
279	577825	203	1.0 
280	577825	204	12.0 ounce
281	577825	152	2.0 teaspoons
282	577825	205	2.0 cups
283	577825	4	6.0 
284	577825	206	1.0 tablespoon
285	577825	207	2.0 slices
286	577825	208	2.0 cups
287	577825	209	4.0 tablespoons
288	577825	193	1.0 
289	577825	210	1.0 teaspoon
290	577825	211	1.0 
291	577825	79	0.25 cup
292	577825	6	3.0 cups
293	577825	212	2.0 teaspoons
294	577825	213	0.25 cup
295	577825	214	4.0 slices
296	577825	20	6.0 servings
297	577825	215	2.0 
298	577825	27	12.0 slices
299	577825	36	2.0 tablespoons
300	577825	13	0.25 teaspoon
301	577825	216	6.0 servings
302	577825	25	1.0 tablespoon
303	577825	217	2.0 
304	577825	218	8.0 oz
305	577825	44	2.0 
306	577825	142	2.0 cups
307	577825	219	6.0 servings
308	577825	220	1.0 
309	577825	221	2.5 cups
310	106375	10	0.75 cup
311	106375	222	0.5 cup
312	106375	138	1.0 cup
313	106375	42	1.0 pound
314	106375	43	1.5 teaspoons
315	106375	223	1.0 tablespoons
316	106375	224	7.0 ounces
317	106375	220	1.0 
318	106375	189	1.0 teaspoon
319	21515	225	1.0 tablespoon
320	21515	226	1.0 teaspoon
321	21515	227	1.0 leaves
322	21515	228	2.0 tablespoons
323	21515	229	8.0 
324	21515	230	2.0 cups
325	21515	231	2.0 
326	21515	224	14.0 oz
327	82698	36	1.0 tbs
328	82698	89	2.0 slices
329	82698	224	0.5 cup
330	82698	39	2.0 slices
331	82698	27	2.0 slices
332	82698	199	3.0 tbs
333	82698	232	1.0 tbs
334	564269	233	24.0 
335	564269	121	0.5 teaspoon
336	564269	148	1.0 tablespoon
337	564269	225	0.5 teaspoon
338	564269	234	0.5 pound
339	564269	43	1.0 clove
340	564269	235	1.0 teaspoon
341	564269	224	0.5 cup
342	564269	180	1.0 
343	78638	39	4.0 strips
344	78638	236	4.0 ounces
345	78638	226	1.0 
346	78638	237	1.0 cup
347	78638	238	1.0 
348	78638	224	1.0 cup
349	78638	239	2.0 
350	248370	36	1.0 tablespoon
351	248370	240	1.0 tablespoon
352	248370	241	2.0 tablespoons
353	248370	242	0.5 cup
354	248370	224	2.0 tablespoons
355	248370	243	1.0 slices
356	248370	244	2.0 slices
357	567389	162	2.0 servings
358	567389	245	2.0 
359	567389	246	2.0 servings
360	567389	38	0.5 
361	567389	247	2.0 servings
362	567389	152	1.0 tsp
363	567389	148	1.0 tsp
364	567389	225	0.5 tsp
365	567389	248	0.5 
366	567389	224	40.0 g
367	567389	232	1.0 tsp
368	558930	233	24.0 
369	558930	121	0.5 teaspoon
370	558930	148	1.0 tablespoon
371	558930	225	0.5 teaspoon
372	558930	234	0.5 pound
373	558930	43	1.0 clove
374	558930	235	1.0 teaspoon
375	558930	224	0.5 cup
376	558930	180	1.0 
377	65651	249	4.0 
378	65651	225	2.0 teaspoons
379	65651	39	8.0 slices
380	65651	250	1.0 cup
381	65651	230	1.0 cup
382	65651	188	3.0 tablespoons
383	65651	224	1.0 cup
384	65651	232	1.0 tablespoon
385	567452	246	3.5 cups
386	567452	247	1.0 Tbsp
387	567452	251	1.0 
388	567452	39	150.0 g
389	567452	252	1.0 Tbsp
390	567452	43	0.5 tsp
391	567452	224	1.0 cup
392	567452	4	3.0 
393	567452	253	4.0 Tbsp
394	38649	47	2.0 tablespoons
395	38649	254	6.0 servings
396	38649	255	1.0 tablespoon
397	38649	92	1.0 pound
398	38649	43	2.0 teaspoons
399	38649	13	0.25 teaspoon
400	38747	47	3.0 Tbsps
401	38747	21	4.0 
402	38747	13	0.25 tsp
403	38747	255	6.0 sprigs
404	38747	256	1.5 lbs
405	202674	47	1.0 teaspoon
406	202674	162	1.0 pinches
407	202674	257	2.0 cups
408	202674	43	6.0 cloves
409	202674	13	0.25 teaspoon
410	202674	258	1.0 pound
411	481335	92	1.0 lb
412	481335	47	4.0 servings
413	481335	43	1.0 cloves
414	481335	255	3.0 sprigs
415	481335	5	4.0 servings
416	105376	92	4.0 
417	105376	259	2.0 servings
418	105376	162	2.0 servings
419	105376	38	0.5 
420	105376	260	1.0 
421	286116	47	2.0 tablespoons
422	286116	261	0.75 pound
423	286116	5	6.0 servings
424	286116	6	1.0 tablespoon
425	286116	262	1.0 pound
426	286116	263	0.333333333333 cup
427	582452	264	1.0 teaspoon
428	582452	265	1.0 lb
429	582452	47	3.0 tablespoons
430	582452	92	8.0 ounces
431	582452	7	0.25 teaspoon
432	582452	13	0.5 teaspoon
433	500625	47	4.0 tbsp
434	500625	21	6.0 
435	500625	261	16.0 oz
436	500625	262	2.5 lbs
437	500625	7	0.25 tsp
438	500625	266	0.5 tsp
439	238687	92	2.0 cups
440	238687	267	1.0 
441	238687	260	2.0 
442	517329	47	2.0 Tablespoons
443	517329	261	0.75 lb
444	517329	6	1.0 Tablespoon
445	517329	262	1.0 pound
446	517329	263	0.333333333333 cup
447	517329	46	4.0 servings
448	611483	268	1.0 lb
449	611483	269	2.5 pounds
450	611483	5	2.0 servings
451	611483	97	2.0 handfuls
452	390611	270	165.0 g
453	390611	6	240.0 ml
454	390611	271	60.0 g
455	390611	272	2.0 
456	661362	47	2.0 tablespoons
457	661362	97	300.0 grams
458	661362	10	500.0 grams
459	661362	5	22.0 servings
460	661362	6	15.0 ounces
461	661362	273	100.0 grams
462	661362	13	0.25 teaspoon
463	661362	274	150.0 grams
464	391182	47	2.0 tablespoons
465	391182	21	3.0 
466	391182	164	2.0 tablespoons
467	391182	13	0.75 teaspoon
468	391182	97	18.0 ounces
469	235751	47	1.0 teaspoon
470	235751	97	10.0 ounce
471	235751	275	0.25 teaspoon
472	235751	276	3.0 tablespoons
473	235751	235	1.0 teaspoon
474	235751	13	0.5 teaspoon
475	473382	47	2.0 teaspoons
476	473382	277	1.0 
477	473382	271	2.0 pounds
478	473382	13	0.25 teaspoon
479	473382	278	2.0 tablespoons
480	507163	6	1.0 c
481	507163	279	0.5 
482	507163	280	1.0 c
483	507163	281	0.5 c
484	507163	97	1.0 c
485	581090	6	1.0 cup
486	581090	271	2.0 cups
487	581090	282	3.0 sprigs
488	581090	48	2.0 
489	343839	283	1.0 tablespoons
490	343839	225	2.0 tablespoons
491	343839	226	1.0 tablespoons
492	343839	5	6.0 servings
493	343839	97	20.0 oz
494	294865	47	1.0 tablespoon
495	294865	219	4.0 servings
496	294865	43	3.0 cloves
497	294865	284	2.0 pinches
498	294865	97	32.0 ounce
499	472914	47	3.0 tablespoons
500	472914	278	0.25 cup
501	472914	35	2.0 bunches
502	472914	285	0.25 cup
503	472966	286	0.25 tsp
504	472966	287	2.0 tbsp
505	472966	266	1.0 tsp
506	472966	35	3.0 handfuls
507	472966	288	0.25 tsp
508	596192	57	1.0 
509	596192	48	2.0 
510	596192	35	4.0 
511	543108	47	2.0 tablespoons
512	543108	226	2.0 servings
513	543108	185	1.0 tablespoon
514	543108	266	0.25 teaspoon
515	543108	35	1.0 head
516	522722	21	6.0 
517	522722	287	1.0 cup
518	522722	13	0.5 tsp
519	522722	35	4.0 cups
520	522722	181	2.0 oz
521	14878	47	1.0 Tbsp
522	14878	289	4.0 Tbsps
523	14878	185	2.0 Tbsps
524	14878	13	2.0 servings
525	14878	35	1.0 bunch
526	14896	47	1.0 serving
527	14896	290	0.5 cup
528	14896	13	1.0 serving
529	14896	35	1.0 bunch
530	14896	278	0.25 cup
531	567865	47	2.0 teaspoons
532	567865	35	1.0 bunch
533	567865	5	4.0 servings
534	567865	225	1.0 teaspoon
535	567865	43	2.0 cloves
536	567865	289	2.0 tablespoons
537	14909	47	3.0 tbsp
538	14909	278	0.25 cup
539	14909	35	2.0 bunches
540	14909	285	0.25 cup
541	14910	162	4.0 servings
542	14910	35	2.0 lbs
543	14910	287	4.0 servings
544	14910	40	4.0 servings
545	14910	13	4.0 servings
546	14910	291	4.0 servings
547	552202	146	0.75 cup
548	552202	292	1.25 cups
549	552202	35	1.25 cup
550	552202	293	1.0 cup
551	552202	142	1.0 cup
552	15628	294	15.0 ounce
553	15628	35	3.0 cups
554	15628	38	1.0 cup
555	15628	295	3.0 slices
556	15628	164	14.5 ounce
557	15628	6	2.25 cups
558	15628	7	0.25 teaspoon
559	507177	294	15.0 ounce
560	507177	47	3.0 tablespoons
561	507177	35	8.0 ounce
562	507177	6	0.5 cup
563	507177	7	0.75 teaspoon
564	507177	43	0.25 cup
565	507177	13	0.5 teaspoon
566	507177	296	8.0 ounces
567	560600	55	2.0 stalks
568	560600	100	6.0 
569	560600	35	3.0 cups
570	560600	297	2.0 tbsp
571	286168	47	3.0 tablespoons
572	286168	40	2.0 tablespoons
573	286168	35	1.5 pounds
574	286168	5	4.0 servings
575	286168	298	0.5 cup
576	286168	43	2.0 cloves
577	527883	31	455.0 g
578	527883	35	1.0 bunch
579	527883	121	0.5 inch
580	527883	299	0.5 
581	618083	35	1.0 handful
582	618083	216	1.0 scoop
583	618083	6	100.0 ml
584	618083	135	10.0 
585	618083	300	3.0 
586	618083	301	300.0 ml
587	609907	47	3.0 tbsp
588	609907	35	6.0 c
589	609907	302	1.0 tbsp
590	609907	7	0.25 tsp
591	609907	74	0.25 c
592	609907	303	1.0 
593	609907	189	0.25 tsp
594	573057	47	2.0 Tablespoons
595	573057	37	1.0 
596	573057	304	1.0 cup
597	573057	305	1.0 tablespoon
598	573057	189	4.0 servings
599	573057	35	10.0 cups
600	544388	47	1.0 tablespoon
601	544388	35	2.0 cups
602	544388	278	0.25 cup
603	544388	231	2.0 
604	544388	156	1.0 
605	544388	189	0.25 teaspoon
606	609926	306	0.5 bunch
607	609926	135	0.5 
608	609926	307	1.0 
609	609926	35	4.0 
610	524038	47	3.0 tablespoons
611	524038	308	1.0 
612	524038	35	16.0 cups
613	524038	74	0.25 cup
614	524038	43	1.0 clove
615	524038	13	0.5 teaspoon
616	544620	142	1.5 cups
617	544620	35	1.0 cup
618	544620	309	1.0 
619	544620	310	1.0 cup
620	626641	47	1.0 tbsp
621	626641	311	300.0 g
622	626641	35	1.0 handful
623	626641	38	1.0 
624	626641	6	150.0 ml
625	626641	7	4.0 servings
626	626641	43	3.0 cloves
627	626641	59	4.0 tbsp
628	626641	13	4.0 servings
629	524262	47	1.0 tablespoon
630	524262	35	8.0 cups
631	524262	38	1.0 
632	524262	6	2.0 tablespoons
633	524262	312	4.0 teaspoons
634	524262	13	0.25 teaspoon
635	524262	285	0.25 cup
636	524326	313	1.0 
637	524326	314	1.0 
638	524326	31	1.0 pound
639	524326	35	1.0 bunch
640	524326	29	1.0 pound
641	626747	280	0.5 cup
642	626747	127	0.25 
643	626747	35	1.0 cup
644	626747	315	4.0 ounces
645	626747	309	1.0 
646	626747	299	0.25 
647	573683	37	2.0 cups
648	573683	144	1.0 Tbsp
649	573683	35	3.0 
650	573683	38	1.0 
651	573683	5	4.0 servings
652	573683	316	0.5 cup
653	573683	317	6.0 cups
654	573713	83	4.0 
655	573713	35	2.0 cups
656	573713	100	2.0 
657	573713	6	1.0 cup
658	573713	158	1.0 cup
659	573713	318	2.0 
660	573713	293	1.0 cup
661	557362	209	13.5 
662	557362	53	1.0 cup
663	557362	35	1.0 cup
664	557362	319	3.0 
665	557362	6	1.0 cup
666	557362	135	0.25 cup
667	758114	320	2.0 Tb
668	758114	289	0.25 cup
669	758114	321	1.0 pkg
670	758114	43	2.0 tsp
671	758114	35	12.0 oz
672	500244	35	2.0 cups
673	500244	322	0.666666666667 cup
674	500244	323	1.0 Tbsp
675	500244	324	0.5 cup
676	500244	315	0.75 cups
677	500244	309	1.0 
678	721437	58	1.0 
679	721437	57	1.0 serving
680	721437	35	2.0 cups
681	721437	181	0.5 cup
682	721437	325	0.5 cup
683	762412	47	1.0 Tb
684	762412	35	1.0 lb
685	762412	326	1.0 cup
686	762412	5	1.0 serving
687	762412	6	0.25 cup
688	762412	43	2.0 cloves
689	762412	263	2.0 
690	762412	327	1.0 cup
691	373375	276	2.0 teaspoons
692	373375	328	1.0 
693	373375	290	2.0 tablespoons
694	373375	35	2.0 
695	373375	174	5.0 
696	660108	47	3.0 tbsp
697	660108	35	1.0 bunch
698	660108	13	6.0 servings
699	660108	193	1.0 
700	660108	329	1.0 
701	660108	156	1.0 
702	660108	330	1.0 
703	205460	331	4.0 ounces
704	205460	299	1.0 slicesslices
705	205460	35	4.0 ounces
706	205460	310	0.5 cup
707	205460	301	4.0 ounces
708	512669	47	2.0 teaspoons
709	512669	35	6.0 cups
710	512669	329	1.0 
711	512669	5	2.0 servings
712	512669	332	2.0 tablespoons
713	512669	116	2.0 cups
714	512669	180	1.0 stalk
715	537238	156	1.0 
716	537238	35	1.0 bunch
717	537238	10	1.0 Cup
718	537238	333	15.0 ounce
719	537238	6	1.0 Cup
720	537238	334	2.25 Cups
721	537238	43	2.0 cloves
722	537238	5	1.0 pinch
723	537238	13	1.0 Teaspoon
724	537238	260	1.0 
725	516844	47	1.0 tablespoon
726	516844	35	6.0 oz
727	516844	335	2.0 tablespoons
728	516844	326	5.0 
729	516844	6	8.0 cups
730	516844	7	0.25 teaspoon
731	516844	336	3.0 cups
732	516844	13	0.75 teaspoon
733	516844	239	0.25 cup
734	533222	47	3.0 tbsp
735	533222	35	10.0 oz
736	533222	185	3.0 tbsp
737	533222	337	0.333333333333 cup
738	533222	338	1.0 
739	533222	339	0.333333333333 cup
740	533222	13	0.25 tsp
741	758513	47	3.0 Tb
742	758513	35	9.0 cups
743	758513	38	1.33333333333 cups
744	758513	31	1.5 cups
745	758513	43	3.0 cloves
746	758513	291	0.5 tsp
747	627519	35	2.0 Handfuls
748	627519	6	1.0 serving
749	627519	185	2.0 Tablespoons
750	627519	135	0.5 
751	627519	142	0.5 Cup
752	627519	124	0.25 Cup
753	602969	185	1.0 Tablespoon
754	602969	340	0.5 cup
755	602969	309	0.5 
756	602969	323	1.0 Tablespoon
757	602969	35	2.0 cups
758	13196	47	2.0 Tbsps
759	13196	127	0.5 
760	13196	35	2.0 bunches
761	13196	341	1.0 can
762	13196	342	1.0 dash
763	13196	43	6.0 cloves
764	13196	13	0.5 tsp
765	95138	55	2.0 rib
766	95138	255	0.333333333333 cup
767	95138	31	3.0 
768	95138	28	1.0 
769	95138	35	2.0 
770	304127	264	1.0 tablespoon
771	304127	343	2.0 tablespoons
772	304127	35	1.0 bunch
773	304127	344	0.25 cup
774	304127	235	2.0 tablespoons
775	304127	13	1.0 tablespoon
776	304127	345	0.5 teaspoon
777	619542	267	1.0 
778	619542	35	1.0 bunch
779	619542	346	1.0 cup
780	619542	320	0.5 cup
781	619542	266	1.0 teaspoon
782	619542	156	2.0 
783	628033	31	1.0 lb
784	628033	35	1.0 bunches
785	628033	193	1.0 
786	628033	5	8.0 servings
787	628033	347	0.5 cup
788	628033	348	1.0 lb
789	619940	47	2.0 Tablespoons
790	619940	35	2.0 cups
791	619940	349	1.0 
792	619940	133	0.5 cup
793	619940	350	2.0 cups
794	619940	213	0.5 Tablespoon
795	611773	47	0.25 cup
796	611773	162	0.25 tsp
797	611773	35	2.0 cups
798	611773	29	2.0 
799	611773	351	0.25 cup
800	611773	352	3.0 cup
801	611773	43	1.0 clove
802	611773	266	0.5 tsp
803	398788	280	1.0 cup
804	398788	35	70.0 g
805	398788	216	480.0 ml
806	398788	6	120.0 ml
807	398788	338	0.5 
808	398788	58	1.0 
809	398788	309	1.0 
810	615902	47	1.0 tablespoon
811	615902	353	0.25 cup
812	615902	35	1.0 bunch
813	615902	190	2.0 tablespoons
814	615902	55	1.0 stalk
815	615902	7	0.25 teaspoon
816	615902	354	0.25 cup
817	615902	13	1.0 teaspoon
818	521800	35	2.0 
819	521800	355	2.0 
820	521800	287	1.0 tbsp
821	521800	110	0.25 cup
822	521800	356	2.0 tbsp
823	521800	185	2.0 tbsp
824	521800	189	0.5 tsp
825	149107	357	0.75 ounce
826	149107	35	0.5 ounce
827	149107	358	1.5 ounces
828	149107	6	1.0 cup
829	149107	121	0.75 ounce
830	149107	152	1.0 cup
831	149107	283	0.5 cup
\.


--
-- Name: recipe_ingredients_recipe_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('recipe_ingredients_recipe_ingredient_id_seq', 836, true);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY recipes (recipe_id, title, prep_time, ready_in, yield_amt, image, instructions) FROM stdin;
217239	Beer-Can Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Beer-Can-Chicken-217239.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Pour out (or drink) half of beer.</li>\n<li>Prepare grill for high, indirect heat and fit with grill pan (for a charcoal grill, bank coals on 1 side of grill and put drip pan on empty side; for a gas grill, leave 1 burner turned off and place drip pan over unlit burner). </li>\n<li>Add water to pan to a depth of 1/2".</li>\n<li>Season chicken with 4-3-2-1 Spice Rub. </li>\n<li>Place cavity of chicken, legs pointing down, onto open can so that it supports chicken upright. </li>\n<li>Place can, with chicken, on grill over indirect heat (and above drip pan). Grill chicken, covered, until cooked through and an instant-read thermometer inserted into the thickest part of thigh registers 165°F, 45-60 minutes. (If using charcoal, you may need to add more to maintain heat.) </li>\n<li>Let chicken rest 10 minutes before carving. </li>\n<li>Serve with pan drippings.</li>\n</ol>\n</div>
291025	Grandmother Paul's Fried Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Grandmother-Pauls-Fried-Chicken-291025.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat shortening in a cast iron skillet to 350 degrees F.Beat eggs with water in a small bowl. In a shallow bowl, season flour with pepper. Dip chicken pieces in egg mixture and then coat well in flour mixture. Carefully add to hot shortening, in batches if necessary, place lid on top of skillet, and fry until brown and crisp. Remember that dark meat requires a longer cooking time (about 13 to 14 minutes, compared to 8 to 10 minutes for white meat.)</li>\n</ol>\n</div>
78752	Great-grandma Gibson's Fried Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/great-grandma_gibsons_fried_chicken-78752.jpg	http://homesicktexan.blogspot.com/2007/07/anniversary-served-with-fried-chicken.html
136337	Parmesan Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/parmesan-chicken-2-136337.jpg	http://www.food.com/recipe/parmesan-chicken-81359
136441	Maryland Fried Chicken with Cream Gravy	\N	\N	\N	https://spoonacular.com/recipeImages/maryland-fried-chicken-with-cream-gravy-2-136441.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Put 1 cup flour with salt and pepper in a large (1-gallon) sealable plastic bag, then seal bag and shake to combine.</li>\n<li>Turn chicken pieces in milk in a bowl, then add chicken to flour mixture and seal bag (discard milk). Shake to coat and let stand in bag while oil heats.</li>\n\n<li>Heat oil in skillet over moderately high heat until it registers 360°F on thermometer (see cooks' note, below). </li>\n<li>Add chicken, skin sides down, and cook, covered, until golden, about 5 minutes. Turn chicken over with tongs and cook, covered, 5 minutes more.</li>\n\n<li>Transfer chicken with tongs to a plate. </li>\n<li>Pour fat from skillet into a heatproof bowl (to cool before discarding) and add 1/2 cup water to skillet. Return chicken to skillet, skin sides up, and cook, covered, over moderate heat, turning over twice, until chicken is cooked through, about 15 minutes. </li>\n<li>Transfer chicken to a platter and cover loosely with foil to keep warm.</li>\n\n<li>Pour off and discard all but 1 tablespoon fat from skillet, then stir 1 tablespoon flour into remaining fat and cook over moderate heat, whisking, 2 minutes. </li>\n<li>Add 1/2 cup water and cook, scraping up brown bits, 2 minutes. </li>\n<li>Add half-and-half, whisking, and bring to a boil. Reduce heat and simmer, whisking occasionally, until sauce is thick and creamy, about 4 minutes. Season with salt and pepper and spoon over chicken.</li>\n</ol>\n</div>
611630	Balsamic Chicken and Pear Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Balsamic-Chicken-and-Pear-Salad-611630.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place half of the lettuce on the bottom of a plate. Layer on half of chicken, cucumber, feta and walnuts. </li>\n<li>Drizzle with 2 Tablespoons of dressing.Repeat with remaining ingredients on a second plate. Toss salads together before serving right away.</li>\n</ol>\n</div>
136586	Crock Pot Roasted Chicken With Rosemary and Garlic	\N	\N	\N	https://spoonacular.com/recipeImages/crock-pot-roasted-chicken-with-rosemary-and-garlic-2-136586.jpg	http://www.food.com/recipe/crock-pot-roasted-chicken-with-rosemary-and-garlic-19411
136584	Butterflied Grilled Chicken with Curry and Cumin	\N	\N	\N	https://spoonacular.com/recipeImages/butterflied-grilled-chicken-with-curry-and-cumin-2-136584.jpg	http://www.food.com/recipe/butterflied-grilled-chicken-with-curry-and-cumin-70469
521767	Chicken guacamole sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-guacamole-sandwich-521767.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>This is such a short recipe, really. You just mix together the guacamole and the chicken then you use it as a sandwich filling. Done.</li>\n</ol>\n</div>
539746	My Favorite At Home Salad Bar (and postpartum weight loss…)	\N	\N	\N	https://spoonacular.com/recipeImages/My-Favorite-At-Home-Salad-Bar-(and-postpartum-weight-loss)-539746.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wash the kale and remove the tough ribs. Discard them. Chop the kale into bite size pieces. Spin dry in a salad spinner.Wash the baby spinach if it isn't prewashed. Spin dry.Peel the carrots. Grate them using the grating wheel of a food processor.Peel the beets. (I wear disposable plastic gloves to prevent my hands from being stained red.) Grate them using the grating wheel of a food processor.Take each prepared item and store it in a separate container.When you're ready for lunch or dinner, pile all the ingredients on your salad. I usually chop the apple and any herbs when I make the salad as they don't stay fresh long if prepared ahead of time.</li>\n</ol>\n</div>
621269	One Pot Savory Chicken and Fall Produce	\N	\N	\N	https://spoonacular.com/recipeImages/One-Pot-Savory-Chicken-and-Fall-Produce-621269.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Chop sage, thyme and rosemary. </li>\n<li>Add to 3 T. butter with freshly cracked salt and pepper. Rub all over chicken on both sides and set aside.Preheat the dutch oven on the stove top over medium heat.</li>\n<li>Add the bacon, onions, mushrooms, and garlic to the pot and cook until onions are translucent and bacon is crisp.</li>\n<li>Remove the bacon and vegetable mixture from the pan and set aside.Raise the heat and add the chicken in the pot, ensuring both sides are brown. </li>\n<li>Saute in two batches to avoid overcrowding.</li>\n<li>Remove the chicken from the pan and set aside</li>\n\n<li>Pour off excess fat and deglaze the pane with red wine vinegar and water.Reduce heat to medium low.Return the bacon, mushroom and onion mixture to the pot and mix in the potatoes, squash and apples.</li>\n<li>Place the chicken on top of the vegetables and cover.</li>\n<li>Place in oven preheated to 350 degrees for 45-60 minutes or until the chicken and vegetables are cooked through.</li>\n<li>Garnish with additional rosemary.</li>\n</ol>\n</div>
3586	Pan Seared Fish With Chermoula Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/pan_seared_fish_with_chermoula_sauce-3586.jpg	http://bijouxs.com/2012/09/09/pan-seared-fish-with-chermoula-sauce/
52616	Szechuan (sichuan) Roasted Chicken Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/szechuan_roasted_chicken_recipe-52616.jpg	http://rasamalaysia.com/szechuan-sichuan-roasted-chicken-recipe/2/
14910	Garlicky Kale	\N	\N	\N	https://spoonacular.com/recipeImages/garlicky-kale-2-14910.jpg	http://www.cookstr.com/recipes/garlicky-kale
622201	Roasted Cranberry Chicken Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Cranberry-Chicken-Salad-622201.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350 {F}</li>\n<li>Place all of your ingredients into a small mixing bowl</li>\n\n<li>Mix it all up well and place it onto a small aluminum foil or parchment paper lined baking sheet</li>\n<li>Roast for 10-15 minutes, or until your cranberries have started to burst and cook through.</li>\n<li>Let them cool and either store to use at a later point in the fridge or add straight away to your chicken salad!these will cluster together which is TOTALLY fine! They'll break apart in the chicken salad when you mix it together!Get your cranberries roasting {see above for details}! </li>\n<li>Let them roast in the oven while you do everything else and just pull them out when they're done and set them off to the side!Get a large skillet heating with your favorite fat and add in your garlic and onion, allow it to start to cook while you dice up your chicken.</li>\n<li>Add your chicken into the skillet, sprinkle in some salt + pepper and let it cook.If you have pre-cooked chicken, you can skip this step and just quickly cook up your onion + garlic and then add to your mixing bowl!While it's cooking make your mayo and dice your apple and celery.When your chicken is done allow it to cool off for a few and then add it to a large bowl with 1 batch of mayo, your seasonings, diced vegetables, and roasted cranberries.</li>\n<li>Mix it all well, taste test and adjust / add more mayo as needed.Store in the fridge covered and serve when ready!</li>\n</ol>\n</div>
443055	Rosemary-Orange Roasted Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Rosemary-Orange-Roasted-Chicken-443055.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350°. In a small bowl, combine butter, minced rosemary, orange peel and 1/8 teaspoon pepper. With fingers, carefully loosen skin from the chicken; rub butter mixture under the skin. </li>\n<li>Brush chicken with orange juice. Sprinkle salt and remaining pepper over chicken and inside cavity.</li>\n\n<li>Place one onion and half of the apple inside the cavity. Tuck wings under chicken; tie drumsticks together. </li>\n<li>Place breast side up on a rack in a roasting pan. Arrange carrot, celery, thyme, parsley, bay leaves, rosemary sprig and remaining onion and apple around chicken. </li>\n<li>Pour wine into pan.</li>\n\n<li>Bake, uncovered, 1-1/4 to 1-1/2 hours or until a thermometer inserted in thigh reads 180°, basting occasionally with drippings. Cover loosely with foil if chicken browns too quickly. Cover and let stand 15 minutes before slicing.</li>\n<li>For gravy, pour drippings and loosened browned bits into a measuring cup. Skim fat. </li>\n<li>Add enough broth to the drippings to measure 1 cup. In a small saucepan, melt butter. Stir in flour until smooth; gradually add broth mixture and nutmeg if desired. Bring to a boil; cook and stir 2 minutes or until thickened. </li>\n<li>Serve with chicken.</li>\n</ol>\n</div>
30519	Curried Skinny Chick And Cauliflower Salad	\N	\N	\N	https://spoonacular.com/recipeImages/curried_skinny_chick_and_cauliflower_salad-30519.jpg	http://www.theskinny.us.com/2011/07/23/cold-curried-skinny-chick-and-cauliflower-salad/
294326	Waldorf Chicken Salad Panini	\N	\N	\N	https://spoonacular.com/recipeImages/Waldorf-Chicken-Salad-Panini-294326.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 375 degrees F.Pat the chicken dry with paper towels. Rub the exterior and cavity liberally with the olive oil. Sprinkle with salt and pepper. Stuff the cavity with the garlic, carrots, celery stalk, lemon, onion and thyme. Tie the legs tightly with kitchen twine and fold the wing tips under the breasts. </li>\n<li>Place on a roasting rack in a deep pan and into oven. Roast until a digital read thermometer registers 165 degrees F and the juices run clear, about 1 1/2 hours. </li>\n<li>Remove and cool.Once cooled enough to handle, remove the meat from the bones. Shred against the grain with two forks. Cool completely.</li>\n<li>Whisk the mayonnaise, cream cheese and lemon juice in a large mixing bowl for about 30 seconds. </li>\n<li>Add the chicken, diced celery, grapes and apples. Toss to evenly coat. Fold in the walnuts, parsley and tarragon until thoroughly incorporated. Season with salt and pepper.To assemble, use a preheated panini press on the highest setting. If unavailable, bring the oven to 400 degrees F and use two cast-iron skillets to form a press.</li>\n<li>Cut the focaccia quarters in half with a sharp serrated knife and arrange on a prep surface. Spoon about 1 1/4 cups of the chicken salad onto each bottom half. Replace the top half. </li>\n<li>Place onto the press and crisp until the bread is golden on both sides, 3 to 5 minutes. If using skillets, place the sandwich into the bottom pan, place the second skillet bottom on top of the sandwich and crisp, flipping halfway through the cooking process.To serve: </li>\n<li>Remove the sandwiches from the press or oven to a prep surface. </li>\n<li>Cut in half diagonally with a sharp serrated knife and arrange on serving plates. Enjoy immediately.</li>\n</ol>\n</div>
316111	Adirondack Bacon BBQ Chicken, Apples and Onions	\N	\N	\N	https://spoonacular.com/recipeImages/Adirondack-Bacon-BBQ-Chicken--Apples-and-Onions-316111.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat a drizzle of EVOO in a saucepot over medium-high heat. </li>\n<li>Add the bacon and brown to crisp. Then add the garlic and onions and stir to soften, about 3 minutes. </li>\n<li>Add the ketchup, stock, syrup, mustard, Worcestershire, vinegar and pepper. Stir and simmer to thicken, 20 minutes.</li>\n<li>Heat a drizzle of EVOO in a large skillet over medium-high heat, add the butter and melt. </li>\n<li>Add the apples and red onions. Season with some salt, pepper and nutmeg. Cook to tender-crisp, 5 to 6 minutes. </li>\n<li>Add the chicken and sauce and combine. Cool and store for a make-ahead meal. Reheat over medium heat and serve the BBQ chicken, apples and onions on the rolls topped with cheese and pickles.</li>\n</ol>\n</div>
577825	Pina Colada Bread Pudding {with Vanilla Rum Sauce}	\N	\N	\N	https://spoonacular.com/recipeImages/Pina-Colada-Bread-Pudding-{with-Vanilla-Rum-Sauce}-577825.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat broiler.  </li>\n<li>Cut bread into 1-inch cubes, spread on a cookie sheet and broil until golden brown (watch them closely--they'll burn quickly!).  </li>\n<li>Remove from broiler and reduce heat to </li>\n<li>Combine toasted bread cubes and pineapple in a large bowl.</li>\n<li>Spread bread mixture into a 13x9 baking pan.  </li>\n<li>Drizzle with melted butter.Warm milk in a medium saucepan over medium heat--do not boil.  </li>\n<li>Whisk in eggs, heavy cream, sugar, coconut milk, and rum.  </li>\n<li>Remove from heat.</li>\n<li>Pour custard over bread mixture.  Press bread down into the liquid with a fork until everything is well soaked.</li>\n<li>Bake 35 to 40 minutes or until pudding springs back in the center when pressed.</li>\n<li>Combine egg yolks, cornstarch, 2 tablespoons milk and 1 tablespoon sugar in a small mixing bowl, stirring until smooth.</li>\n<li>Combine 1 cup milk, remaining sugar and vanilla in a small pan over medium heat.  Bring to a boil.</li>\n<li>Whisk egg yolk mixture into boilding milk.Immediately pour into a bowl in an ice bath so your sauce does not curdle.  </li>\n<li>Add rum and whisk.While warm, cut pudding into 12 squares.  </li>\n<li>Drizzle with rum sauce before serving.In a large bowl, whisk together the vinegar, sweetener and salt/pepper.  Toss in the cucumbers, red onion and fresh dill.  Cover and chill--at least 1 hour, to let the flavors intensify.Before serving, toss with crumbled feta cheese. If you want to be naughty--add in some crumbled bacon!</li>\n<li>Heat the milk and the and sugar in a saucepan.  Scrape the seeds from the vanilla bean into the milk; add the bean pod to the milk.  Cover, remove from heat, and let infuse for one hour.To make the ice cream, place a 2-quart bowl in a larger bowl partially filled with ice and water.  </li>\n<li>Pour the cream into the bowl.In another bowl, stir together the egg yolks.  Rewarm the milk and gradually pour some of the milk into the yolks to temper, whisking constantly.  </li>\n<li>Add the warmed milk and eggs back into the saucepan.Cook over low heat, stirring constantly, until the custart thickens enough to coat the back of a spatula.</li>\n<li>Pour the custard into the heavy cream.  Stir over the ice until cool, and add the vanilla extract.  Refrigerate; overnight is best.</li>\n<li>Remove the vanilla bean and freeze the custard in your ice cream maker according to the manufacturer's instructions.Preheat oven to </li>\n<li>Combine cake mix and oats.  Stir in melted butter until mixture is crumbly.  Press approximately 3 cups of the mixture into a greased 13x9 pan.</li>\n<li>Spread jam over the crumb mixture.  Sprinkle with remaining mixture.  Pat gently to level.</li>\n<li>Bake for 25 minutes, or until lightly browned.  Cool completely on a wire rack.on a baking sheet lined with parchment paper is bestroll the puff pastry out and cut in 3 vertical strips then cut strips in half giving you 6 squaresin a mixing bowl combing egg, sugar and cream cheeseblend until creamyspread cheese mixture on each square and layer the sliced applesturn up the corners of only 2 of the 4 sidesdip pastry brush in water and glaze over dough and sprinkle the sugar onbake at 400 for 20 min</li>\n\n<li>Put the pineapple, cold water, vanilla, and sugar in a blender and process until smooth.Strain into a pitcher, pressing on the solids to extract all the liquid.  Discard the solids.  </li>\n<li>Serve over ice.Smear some of the cumin butter on a slice of bread and place, butter side down, on your warm griddle.Working quickly, pile on some shredded cheese, corn, chicken, jalepenos, and more cheese.Top with another slice of buttered bread.Grill, 3-5 minutes per side, or until lightly golden.Before serving, squeeze a lime wedge on top.</li>\n</ol>\n</div>
106375	Sweet Potato and Kim Chi Pancakes	\N	\N	\N	https://spoonacular.com/recipeImages/sweet-potato-and-kim-chi-pancakes-2-106375.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Peel sweet potatoes and julienne using slicer (about 6 cups).</li>\n<li>Stir potato together with remaining ingredients except oil. </li>\n<li>Let mixture stand at room temperature until wilted and moist, about 5 minutes, then stir again.</li>\n\n<li>Heat 2 tablespoon oil in a 12-inch heavy skillet over medium-high heat until it shimmers. Filling a 1/3-cup measure halfway full with potato mixture for each pancake and working in batches of 5 or 6, tap out into oil, gently flattening pancakes with a spatula to about 1/4 inch thick. Cook until golden brown, 1 1/2 to 2 minutes. Flip, adding a little more oil if necessary, and cook until golden brown, 1 to 2 minutes more. </li>\n<li>Transfer to paper towels to drain. </li>\n<li>Add oil to skillet between batches as needed. </li>\n<li>Serve warm, with dipping sauce.</li>\n</ol>\n<div class="subRecipeInstructionTitle">Cooks’ note:</div>\n<ol>\n<li>Pancakes can be fried 2 weeks ahead, then cooled and frozen. Reheat unthawed pancakes in a 375°F oven.</li>\n</ol>\n</div>
21515	Kimchi and Avocado Quesadillas	\N	\N	\N	https://spoonacular.com/recipeImages/kimchi_and_avocado_quesadillas-21515.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Top 4 tortillas evenly with kimchi, then with cheese, avocados, and remaining tortillas. </li>\n<li>Mix oil, vinegar, and sesame seeds in a small bowl; set aside. </li>\n<li>Heat a 12-in. frying pan over medium-high heat. Toast each quesadilla until lightly browned and cheese has melted, 1 to 2 minutes per side. Slice each quesadilla into wedges, sprinkle with cilantro, and serve with sesame dipping sauce.Note: Nutritional analysis is per serving.</li>\n</ol>\n</div>
82698	Kimchi Grilled Cheese Sandwich With Gochujang Ketchup For Dipping	\N	\N	\N	https://spoonacular.com/recipeImages/kimchi_grilled_cheese_sandwich_with_gochujang_ketchup_for_dipping-82698.jpg	http://closetcooking.blogspot.com/2010/03/kimchi-grilled-cheese-sandwich-with.html
564269	Korean Beef Bites for #SundaySupper	\N	\N	\N	https://spoonacular.com/recipeImages/Korean-Beef-Bites-for--SundaySupper-564269.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Slice the steak as thin as you can into at least 24 pieces. If you are using flank steak, make sure to slice across the grain. In a large bowl, whisk together the soy sauce, brown sugar, sesame oil, garlic, and ginger. </li>\n<li>Add the steak and mix to coat. Marinate for at least 10 minutes at room temperature or up to 24 hours in the refrigerator.</li>\n<li>Heat a grill pan over high heat. You'll cook the steak in batches to avoid overcrowding the pan. When the pan is hot, add the steak, and grill 1 to 2 minutes per side, depending on the thickness of your slices.To serve, on each rice cracker layer a slice of steak, the kimchi, and garnish with green onion.</li>\n</ol>\n</div>
78638	Kimchi, Bacon and Shiitake Mushroom Pizza	\N	\N	\N	https://spoonacular.com/recipeImages/kimchi_bacon_and_shiitake_mushroom_omelette-78638.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
248370	The Kimchi Rachel Sandwich (aka Roast Turkey Reuben Sandwich with Kimchi)	\N	\N	\N	https://spoonacular.com/recipeImages/The-Kimchi-Rachel-Sandwich-(aka-Roast-Turkey-Reuben-Sandwich-with-Kimchi)-248370.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Melt the butter in a pan over medium heat until it bubbles, add the kimchi and sauerkraut and saute until most of the moisture has evaporated, about 2-3 minutes.</li>\n<li>Heat a non-stick pan over medium heat.Butter the outside of each slice of bread, sprinkle half of the cheese on the inside of one slice of bread, top with the turkey, kimchi sauerkraut, dressing, the remaining cheese and finally the other slice of bread.</li>\n<li>Add the sandwich and grill until golden brown and the cheese has melted, about 2-4 minutes per side.</li>\n</ol>\n</div>
567389	Korean Kimchi fried rice with squid and tuna	\N	\N	\N	https://spoonacular.com/recipeImages/Korean-Kimchi-fried-rice-with-squid-and-tuna-567389.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut some squid legs into medium size pieces.</li>\n<li>Add the seasoning sauce to the squid and mix it well.</li>\n<li>Cut onion and zucchini into small cubes.Slice Kimchi into small pieces.Put some cooking oil (tuna oil from a tin) into a wok.Pan fry onion first, then add the other ingredients about every 2 minutes in the following order: zucchini, Kimchi, squid, tuna.</li>\n<li>Put the rice into the wok. Stir it evenly with vegetables and meat. Then add the sesame oil and gochujang and mix it. These are s optional but it tastes better if you do so.</li>\n<li>Serve it on the plate.</li>\n</ol>\n</div>
558930	Korean Beef Bites	\N	\N	\N	https://spoonacular.com/recipeImages/Korean-Beef-Bites-558930.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Slice the steak as thin as you can into at least 24 pieces. If you are using flank steak, make sure to slice across the grain. In a large bowl, whisk together the soy sauce, brown sugar, sesame oil, garlic, and ginger. </li>\n<li>Add the steak and mix to coat. Marinate for at least 10 minutes at room temperature or up to 24 hours in the refrigerator.</li>\n<li>Heat a grill pan over high heat. You’ll cook the steak in batches to avoid overcrowding the pan. When the pan is hot, add the steak, and grill 1 to 2 minutes per side, depending on the thickness of your slices.To serve, on each rice cracker layer a slice of steak, the kimchi, and garnish with green onion.</li>\n</ol>\n</div>
65651	Peameal Bacon and Kimchi Breakfast Muffin	\N	\N	\N	https://spoonacular.com/recipeImages/peameal_bacon_and_kimchi_breakfast_muffin-65651.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
567452	Stir fried Kimchi and Rice (Kimchi Bokkeumbap)	\N	\N	\N	https://spoonacular.com/recipeImages/Stir-fried-Kimchi-and-Rice-(Kimchi-Bokkeumbap)-567452.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Prepare the ingredients as below.-</li>\n<li>Cut the Kimchi and bacon into small pieces.-Trim the enoki mushrooms by cutting off the root and discard it. Rinse the remaining in cold runny water.-Pan fry the eggs individually.Pre heat the wok for 10 seconds and add the cooking oil then spread it well.</li>\n<li>Add the garlic, stir it fast for 10 seconds.</li>\n<li>Add the bacon and stir it until half of it cooks.</li>\n<li>Add the Kimchi and stir it until 80% of it cooks.</li>\n<li>Add the mushrooms, stir it for a second then add the rice.</li>\n<li>Add the Kimchi liquid and mix all together thoroughly.</li>\n<li>Add the sesame oil and mix it thoroughly with other ingredients.</li>\n<li>Serve the rice on a plate and add the egg on top. (You can sprinkle some sesame seeds on top of the rice).</li>\n</ol>\n</div>
38649	Garlicky Sautéed Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/garlicky_sauted_mushrooms-38649.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Trim stems off cleaned mushrooms and cut caps into bite-size pieces. Very small mushrooms can be left whole. Set a 10- to 12-in. frying pan over high heat. When hot, add olive oil, swirl to coat bottom, and add mushrooms. Sprinkle with salt and cook over high heat, stirring, until mushrooms stop giving off liquid and start to brown. </li>\n<li>Add garlic and cook, stirring, 2 to 3 minutes. </li>\n<li>Remove from heat; stir in parsley. </li>\n<li>Serve on a platter and season with sea salt.Note: Nutritional analysis is per serving.</li>\n</ol>\n</div>
38747	Mushrooms And Garlic	\N	\N	\N	https://spoonacular.com/recipeImages/mushrooms-and-garlic-2-38747.jpg	http://www.cookstr.com/recipes/mushrooms-and-garlic
202674	Cook the Book: Garlicky Mushrooms and Kale	\N	\N	\N	https://spoonacular.com/recipeImages/Cook-the-Book--Garlicky-Mushrooms-and-Kale-202674.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Preheat a large skillet over medium heat. Sauté the garlic in the oil for about 2 minutes, being careful not to burn it. Spray it with a little nonstick cooking spray if needed. </li>\n<li>Add the mushrooms and sprinkle on the salt. </li>\n<li>Let them cook for 5 to 7 minutes, stirring often, until the moisture has released and the mushrooms are lightly browned. </li>\n<li>Add the kale and pepper, and use tongs to sauté for about 10 more minutes. </li>\n<li>Add splashes of water if the pan seems dry. The kale should be tender and cooked down pretty well. </li>\n<li>Serve immediately. </li>\n</ol>\n</div>
481335	Funghi trifolati (Sautéed Mushrooms)	\N	\N	\N	https://spoonacular.com/recipeImages/Funghi-trifolati-(Sauted-Mushrooms)-481335.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Using the traditional recipe (pictured above), you thinly slice your mushrooms, then sauté them over a lively flame in the oil with the garlic cloves tossed in. (If you want a little heat, you can add a peperoncino or some red pepper flakes.) Sprinkle the mushroom slices with a pinch of salt right away—this will cause the mushroom to exude its juices. In just a few minutes, the juices will evaporate and you will begin to hear the mushrooms start to sizzle and lightly brown. Once that happens, add some finely chopped parsley and, if you like, freshly ground pepper, and serve.</li>\n</ol>\n</div>
105376	Smoked Veggies	\N	\N	\N	https://spoonacular.com/recipeImages/smoked-veggies-2-105376.jpg	http://www.food.com/recipe/smoked-veggies-439133
286116	Green Beans with Mushroom and Shallots	\N	\N	\N	https://spoonacular.com/recipeImages/Green-Beans-with-Mushroom-and-Shallots-286116.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Put green beans in a microwave-safe bowl with the water. Cover tightly and microwave on high for 4 minutes. Carefully remove the cover, drain in a colander, shaking off any excess water, and set aside.While the beans are cooking, heat the oil over medium-high heat in a large nonstick skillet. </li>\n<li>Add the shallots and cook, stirring, until softened slightly, about 2 minutes. </li>\n<li>Add the mushrooms and cook, stirring occasionally, until the water they release has evaporated and they begin to brown, about 10 minutes. </li>\n<li>Add the green beans and stir to combine and rewarm. Season with salt and pepper and serve.Per Serving: Calories 80; Total Fat 5g (Sat Fat 5g, Mono Fat 5g, Poly Fat 1g); Protein 4g; Carb 5g; Fiber 3g; Cholesterol 0mg; Sodium 7mg</li>\n</ol>\n</div>
582452	Roasted Brussels Sprouts with Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Brussels-Sprouts-with-Mushrooms-582452.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 400 degrees F.  Wash the Brussels sprouts then trim the stems and cut the Brussels sprouts in half.  </li>\n<li>Add the sprouts and mushrooms to a large bowl.  </li>\n<li>Drizzle with the olive oil and season with the garlic powder, salt, and pepper.  Toss to coat.  </li>\n<li>Place the Brussels sprouts and mushrooms on a rimmed baking sheet and bake for 20 to 25 minutes or until the Brussels sprouts are tender when pierced with a knife.</li>\n</ol>\n</div>
500625	Garlicky Green Beans and Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/Garlicky-Green-Beans-and-Mushrooms-500625.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place beans in a large saucepan and cover with water.Bring to a boil.Reduce heat and cook 8-10 minutes, covered, or until tender-crisp.Meanwhile, in a large cast-iron skillet, heat olive oil to low-medium heat.Sauté mushrooms for about 5-6 minutes turning over with spatula a few times.</li>\n<li>Add diced red onion and cook an additional 2 minutes.</li>\n<li>Add garlic, salt and pepper and cook until tender—an additional 5-10 minutes or so.</li>\n<li>Drain beans and reduce heat to low.</li>\n<li>Add mushroom mixture to drained beans and heat through.</li>\n</ol>\n</div>
238687	Veggie Tostadas	\N	\N	\N	https://spoonacular.com/recipeImages/Veggie-Tostadas-238687.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place a medium nonstick skillet coated with cooking spray over medium-high heat until hot. </li>\n<li>Add mushrooms, zucchini, and bell pepper to pan. Sauté 3 to 5 minutes or until vegetables are tender. Spoon about 3/4 cup vegetable mixture over black bean mixture on each tostada. Top with lettuce, salsa, and cheese.</li>\n</ol>\n</div>
517329	Green Beans w/ Mushrooms & Shallots	\N	\N	\N	https://spoonacular.com/recipeImages/Green-Beans-w--Mushrooms---Shallots-517329.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place green beans in a steamer insert placed in a pan above a small amount of boiling water. Cover and steam until tender but not squishy (or however you desire them to be). While beans are steaming, heat oil over medium-high heat in a large nonstick skillet. </li>\n<li>Add shallots and cook, stirring, until softened slightly, about 2 minutes. </li>\n<li>Add the mushrooms and cook, stirring occasionally, until the water they release has evaporated and they begin to brown, about 10 minutes. </li>\n<li>Add the green beans and stir to combine and rewarm. Season with salt and pepper and serve.</li>\n</ol>\n</div>
611483	Effortless Summer Pasta	\N	\N	\N	https://spoonacular.com/recipeImages/Effortless-Summer-Pasta-611483.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut half of the tomatoes into roughly -inch chunks. Coarsely chop the remaining tomatoes. </li>\n<li>Add those to the bowl, be sure to include the juice. Season the tomatoes generously with salt, pepper and olive oil.Sprinkle on basil.Layer with spinach.Now make your pasta until it's al dente. </li>\n<li>Drain it and dump it on top of the layer of spinach, spreading it out so it covers the vegetables evenly. </li>\n<li>Let it sit undisturbed.After two minutes is up, mix it together well. Give it a taste, adjust with salt, pepper and serve immediately.</li>\n</ol>\n</div>
390611	Spinach Cocktail	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach-Cocktail-390611.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients into the Vitamix container in the order listed and secure lid.Select Variable Turn machine on and slowly increase speed to Variable 10, then to High.Blend for 1 minute or until desired consistency is reached.</li>\n</ol>\n</div>
661362	Spinach, Sultana and Bulgur Wheat Borek's	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach--Sultana-and-Bulgur-Wheat-Boreks-661362.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wash the spinach thoroughly and place in a large saucepan.Allow the spinach to gently sweat over a low heat for aprox 10 minutes.</li>\n<li>Pour the spinach into a sieve to drain the excess fluid.</li>\n<li>Place the spinach into a bowl, and stir in the sultanas, bulgur wheat and seasoning.To make the pastry, place the flour into a large bowl and add the olive oil.Gradually add the water and mix in to form a dough like consistency.</li>\n<li>Place on a floured surface and knead for five minutes.Then cut into four pieces.Using a rolling pin, roll each piece out as thinly as possible to aprox 1/8 cm.thick.Taking a tablespoon at a time, place the spinach mixture onto the dough to form evenly spaced out rows. (as you would with ravioli).</li>\n<li>Brush the pastry around the mixture, with cold water.</li>\n<li>Place a second sheet of pastry on top and press down around the mixture.Using a pastry cutter, cut around the mixture to form squares.Repeat until all the dough and mixture has been used up.</li>\n<li>Heat some oil in a large pan, enough to cover the pastries.Fry three or four at a time for  4 - 5 minutes until golden and crispy. </li>\n<li>Drain on kitchen paper.</li>\n</ol>\n</div>
391182	Sauteed Spinach	\N	\N	\N	https://spoonacular.com/recipeImages/Sauteed-Spinach-391182.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large skillet, saute the garlic in oil for 1 minute. </li>\n<li>Add wine. Bring to a boil; cook until liquid is reduced by half.</li>\n\n<li>Add spinach and salt; cook and stir for 2 minutes or just until spinach is wilted. </li>\n<li>Serve with a slotted spoon.</li>\n</ol>\n</div>
235751	Greens With Spicy Peanut Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Greens-With-Spicy-Peanut-Sauce-235751.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine first 6 ingredients (through pepper) in a Dutch oven; cook over medium-high heat, stirring constantly until smooth. Stir in spinach; cook 45 seconds or until spinach lightly wilts, stirring constantly. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
473382	Sautéed Spinach	\N	\N	\N	https://spoonacular.com/recipeImages/Sauted-Spinach-473382.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat a large skillet over medium heat, warm the olive oil. </li>\n<li>Add the garlic and sauté for 30 seconds.Carefully place the spinach into the skillet, with just the rinsing water clinging to the leaves. Sprinkle with salt. Cook 2-3 minutes, turning occasionally until spinach wilts but is still bright green. Sprinkle with the pine nuts and serve immediately.</li>\n</ol>\n</div>
507163	Smoothie Saturday	\N	\N	\N	https://spoonacular.com/recipeImages/Smoothie-Saturday-507163.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add all ingredients to blender and blend until smooth!</li>\n</ol>\n</div>
581090	Matt’s Green Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Matts-Green-Smoothie-581090.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients into the blender in the order listed and secure lid.Blendtec: Press the SMOOTHIE button.Vitamix: VARIABLE, speed # Turn machine on and slowly increase speed to VARIABLE, speed #10, then to HIGH. Blend for 30 seconds or until desired consistency is reached.</li>\n</ol>\n</div>
343839	Sautéed Sesame-Ginger Spinach	\N	\N	\N	https://spoonacular.com/recipeImages/Sauted-Sesame-Ginger-Spinach-343839.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Sauté ginger in hot oil in a Dutch oven over medium heat 30 seconds.  </li>\n<li>Add 1 package of spinach and toss to coat.  </li>\n<li>Add remaining package of spinach and toss to coat; cook until spinach is wilted.Season with salt and pepper and transfer to a serving dish.Cook sesame seeds in a nonstick skillet over medium-high heat until golden brown and toasted.  Sprinkle over spinach.</li>\n</ol>\n</div>
294865	Wilted Spinach and Garlic	\N	\N	\N	https://spoonacular.com/recipeImages/Wilted-Spinach-and-Garlic-294865.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Pick spinach free of large stems and coarsely chop. </li>\n<li>Heat a large skillet over moderate heat. </li>\n<li>Add extra-virgin olive oil, 1 turn of the pan, and garlic. </li>\n<li>Add spinach in bunches, wilting and turning leaves in the pan, until all of the spinach is incorporated. Season spinach with nutmeg, salt, and pepper, to taste.</li>\n</ol>\n</div>
472914	Kale with Cranberries	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-with-Cranberries-472914.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Steam the kale until it is bright green</li>\n<li>Meanwhile, in a cast iron skillet, toast the pine nuts</li>\n<li>Allow kale and pine nuts five minutes to cool, then toss together in a large bowl</li>\n\n<li>Add dried cranberries and olive oil</li>\n<li>Toss and serve</li>\n</ol>\n</div>
472966	BBQ Baked Kale Chips	\N	\N	\N	https://spoonacular.com/recipeImages/BBQ-Baked-Kale-Chips-472966.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat your oven to 350 Degrees F</li>\n<li>Remove all of your kale leaves from the stalk and wash well</li>\n<li>Once they are all washed, dry them over and over again. They need to be bone dry to get the best results, if you have a salad spinner now is the time to use it if not you are going to be using lots and lots of paper towels</li>\n\n<li>Place all of your dry kale in a mixing bowl and coat with all of your extra virgin olive oil</li>\n<li>Once coated, use 1/2 tsp of sea salt and sprinkle all over</li>\n<li>Line a baking sheet with aluminum foil and place all of your kale on the sheet</li>\n\n<li>Place in the oven and bake for 12-15 Minutes, or until the chips are crispy, if you let them cook too long they will not taste good, don't burn them so check them often after the 10 minute mark</li>\n\n<li>Combine the paprika, garlic, and remaining sea salt in a small bowl and at the 10 minute mark, remove your Kale from the oven and sprinkle with this mixture</li>\n\n<li>Place back in the oven and continue cooking until done</li>\n<li>Enjoy</li>\n</ol>\n</div>
596192	Kale Green Smoothie with Grapefruit and Bananas	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-Green-Smoothie-with-Grapefruit-and-Bananas-596192.jpg	http://www.wishfulchef.com/kale-green-smoothie-with-grapefruit/
543108	Totally Addictive Kale Chips	\N	\N	\N	https://spoonacular.com/recipeImages/Totally-Addictive-Kale-Chips-543108.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 250 degrees.Rinse and dry your kale leaves.Using your hands or a knife, remove the thick, coarse stems. I just tear the leaves off in chunks away from the thick rib. No exact size necessary, make them as perfect or not perfect as you like.In a bowl large enough to accommodate all the leaves, make your dressing by whisking all the ingredients together.</li>\n<li>Place the leaves in the bowl and using your hands, toss and rub the dressing throughout all the leaves making sure they are all coated.</li>\n<li>Place in a SINGLE layer on a cookie sheet lined with parchment paper or a Silpat.</li>\n<li>Bake for about 30 minutes. Check your leaves, they should be crisp and crunchy, if not, put back in the oven for a few minutes until they are. Just be careful, when they burn, they taste bitter! I put 2 cookie sheets in at a time to speed the process up with success. This recipe usually fills about 2-3 cookie sheets. Taste the first batch, and if you'd like to add a wee bit more salt before cooking the next batch, now is the time!Store in an airtight container. I recommend eating them within a day.</li>\n</ol>\n</div>
522722	Kale Pesto, Pasta and a Blendtec Blender	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-Pesto--Pasta-and-a-Blendtec-Blender-522722.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix all ingredients in a blender or food processor until smooth.Keep refrigerated.</li>\n<li>Serve as an appetizer with chips or cracker, as a sandwich spread, in a salad dressing or over warm pasta. I've done them all!</li>\n</ol>\n</div>
14878	Cavolo Nero Kale	\N	\N	\N	https://spoonacular.com/recipeImages/cavolo_nero_kale-14878.jpg	http://www.thekitchn.com/recipe-alchemical-kale-65339
14896	The Cartoon Kitchen: Kale With Raisins And Pine Nuts	\N	\N	\N	https://spoonacular.com/recipeImages/the-cartoon-kitchen-kale-with-raisins-and-pine-nuts-2-14896.jpg	http://www.seriouseats.com/recipes/2008/02/the-cartoon-kitchen-kale-with-raisins-and-pin.html
567865	Kale with Tahini	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-with-Tahini-567865.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat sesame oil and olive oil in a skillet over medium heat. </li>\n<li>Add kale and garlic and stir well. Cover and cook for 5 minutes. Stir occasionally to avoid burning the garlic.    Uncover kale and stir in tahini. Toss kale to coat in the tahini. Season to taste with salt and pepper. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
14909	Kale With Cranberries	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-With-Cranberries-14909.jpg	http://www.elanaspantry.com/kale-with-cranberries/
552202	for Citrusy Green Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/for-Citrusy-Green-Smoothie-552202.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Put the orange juice, kale, spinach, pineapple, agave nectar, and oil in a blender. Puree for 2 to 3 minutes, until the greens are completely liquified. </li>\n<li>Add more juice or a little water if needed. </li>\n<li>Add the ice and process until finely chopped. </li>\n<li>Serve immediately.Variations: Substitute parsley for the spinach, or use a combination of all three greens, to total about 2 1/2 cups. If you like a creamy smoothie, and 1/4 cup coconut milk or a scoop of dairy-free coconut ice cream to the blender along with the greens.</li>\n</ol>\n</div>
15628	Greens, Beans, and Bacon Soup	\N	\N	\N	https://spoonacular.com/recipeImages/greens_beans_and_bacon_soup-15628.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook bacon in a large saucepan over medium-high heat 8 minutes or until crisp. Reserve 2 teaspoons drippings in pan; discard excess drippings. </li>\n<li>Add kale and next 5 ingredients to bacon and drippings in pan. Stir in hot sauce, if desired. Cover and bring to a boil over high heat. Reduce heat, and simmer 25 minutes. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
507177	Linguine with Garlicky Kale and White Beans	\N	\N	\N	https://spoonacular.com/recipeImages/Linguine-with-Garlicky-Kale-and-White-Beans-507177.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook pasta according to package directions, omitting salt and fat. </li>\n<li>Drain in a colander over a bowl, reserving 1/4 cup cooking liquid.</li>\n<li>Heat oil and garlic in a large skillet over medium heat. When garlic begins to sizzle, add 1/2 cup water and kale; cover and cook 5 minutes or until kale is tender, stirring occa­sionally. </li>\n<li>Add beans, 1/2 teaspoon pepper, and salt; cook 1 minute or until thoroughly heated, stirring occasionally. </li>\n<li>Add pasta and reserved 1/4 cup cooking liquid to pan; toss to coat. Sprinkle remaining 1/4 teaspoon pepper over pasta. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
560600	Celery Pear Healthy Green Juice	\N	\N	\N	https://spoonacular.com/recipeImages/Celery-Pear-Healthy-Green-Juice-560600.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Juice all of the ingredients together.Chill and serve.</li>\n</ol>\n</div>
286168	Sauteed Kale	\N	\N	\N	https://spoonacular.com/recipeImages/Sauteed-Kale-286168.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat olive oil in a large saucepan over medium-high heat. </li>\n<li>Add the garlic and cook until soft, but not colored. Raise heat to high, add the stock and kale and toss to combine. Cover and cook for 5 minutes. </li>\n<li>Remove cover and continue to cook, stirring until all the liquid has evaporated. Season with salt and pepper to taste and add vinegar.Per serving: Calories: 178; Total Fat: 11 grams; Saturated Fat: 5 grams; Protein:  6 grams; Total carbohydrates: 18 grams; Sugar: 0 grams Fiber: 5 grams; Cholesterol: 0 milligrams; Sodium: 336 milligrams</li>\n</ol>\n</div>
527883	Healthy Carrot Kale Juice	\N	\N	\N	https://spoonacular.com/recipeImages/Healthy-Carrot-Kale-Juice-527883.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>If you know the ratio you like best: process the carrots and kale through the juicer according to manufacturer instructions into the same container. If using, process the optional ginger and citrus in the juicer, as well.If you don't know your desired ratio, process each of the ingredients individually in the juicer according  to manufacturer instructions into separate containers. </li>\n<li>Mix them according to your preferred taste.Drink the juice immediately, or store in an airtight container with the juice reaching completely to the top so there is no air space (a couple of small canning jars or similar work great). Keep refrigerated until ready to consume. Best if drank within 2-3 days.</li>\n</ol>\n</div>
618083	Apple and Kale Green Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Apple-and-Kale-Green-Smoothie-618083.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add all the ingredients to a blender and whizz until smooth. If you don't have a power blender add the ice cubes to the final juice as you pour it or you may burn out your motor. Slurp and enjoy!</li>\n</ol>\n</div>
609907	Citrusy Kale Salad with Blake’s All Natural Meals	\N	\N	\N	https://spoonacular.com/recipeImages/Citrusy-Kale-Salad-with-Blakes-All-Natural-Meals-609907.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Grate zest from orange then squeeze about 2 tablespoons of juice into a large bowl. </li>\n<li>Whisk vinegar, salt, pepper and oil into the orange juice mixture, until combined well. </li>\n<li>Add kale and almonds to vinaigrette and toss to combine. Cover and chill for 15 minutes before serving to allow flavors to develop.</li>\n</ol>\n</div>
573057	Mustardy Kale and Butternut Squash	\N	\N	\N	https://spoonacular.com/recipeImages/Mustardy-Kale-and-Butternut-Squash-573057.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oil in Dutch oven over medium heat. </li>\n<li>Add the squash and cook, tossing occasionally, until beginning to soften, 10 to 12 minutes.</li>\n<li>Add the kale, broth, mustard, ¾ teaspoon salt, and ¼ teaspoon pepper to the pan and cook, tossing occasionally, until the vegetables are tender, 8 to 10 minutes.</li>\n</ol>\n</div>
544388	Kale Avocado Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-Avocado-Salad-544388.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the first 4 ingredients in a bowl and toss to combine. </li>\n<li>Add the remaining ingredients and using your hands (or a spoon), stir to combine (it’s fun getting your hands in there to mash the avocado into chunks). </li>\n<li>Serve.</li>\n</ol>\n</div>
609926	Pineapple Kale Cucumber Juice	\N	\N	\N	https://spoonacular.com/recipeImages/Pineapple-Kale-Cucumber-Juice-609926.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wash the fruit. Turn on the juicer. </li>\n<li>Cut the fruit and vegetables into pieced that will easily fit in your juicer. Juice the ingredients and then give them a shake or stir to combine. Enjoy over ice.</li>\n</ol>\n</div>
524038	garlic almond kale chips	\N	\N	\N	https://spoonacular.com/recipeImages/garlic-almond-kale-chips-524038.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Arrange two oven racks evenly spaced in upper and lower third of oven. Preheat oven to 325 degrees F. Fit steel blade attachment in food processor and turn on. Drop garlic clove through feed tub and allow to process until finely chopped. Open and add pepper, almonds, oil and salt and process until a thick paste forms. Scrape pepper mixture into a very large bowl. </li>\n<li>Spread around surface of bowl. </li>\n<li>Add kale and toss to combine. Work pepper mixture by hand into the leaves of all the kale to make sure it is evenly coated. </li>\n<li>Spread over two large baking sheets. </li>\n<li>Transfer kale to oven, and bake 10 minutes. Rotate baking sheets top to bottom and front to back. Continue baking, rotating again until crisp, but not brown 5 to 10 minutes more. </li>\n<li>Let cool before eating.</li>\n</ol>\n</div>
627519	Pineapple Detox Blast	\N	\N	\N	https://spoonacular.com/recipeImages/Pineapple-Detox-Blast-627519.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add all solid ingredients into tall cup</li>\n<li>Fill to MAX line with liquids</li>\n<li>Blend until smooth, approximately 30 seconds</li>\n</ol>\n</div>
544620	Green Ice Pops	\N	\N	\N	https://spoonacular.com/recipeImages/Green-Ice-Pops-544620.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine all the ingredients in a blender or food processor and puree. The kale will remain in tiny pieces -- that is okay.  </li>\n<li>Pour the mixture into ice pop molds and freeze for at least 6 hours and up to 4 months.  Unmold and serve. Note: This also makes a great smoothie if you have any puree leftover. Just pour in a glass and drink up!* Collard green, spinach or other leafy greens work as well</li>\n</ol>\n</div>
626641	Croatian soparnik (kale pie)	\N	\N	\N	https://spoonacular.com/recipeImages/Croatian-soparnik-(kale-pie)-626641.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add the plain flour, olive oil and salt and pepper to a large mixing bowl. Gradually adding the water, knead the mixture with clean hands until it comes together into a dough. The dough should be moist but not overly sticky, so you may not need all of the water (or you may need a dash more!).Continue to knead for a few more minutes, until the dough is fairly elastic. </li>\n<li>Place the ball of dough into a lightly oiled bowl, and cover with a tea towel. Leave to rest for 1 hour.While the dough is resting, prepare the filling. </li>\n<li>Remove any tough stems from the kale, and chop the leaves. </li>\n<li>Add the finely diced onion, garlic and parsley, along with a tbsp of olive oil and a touch more salt and pepper. </li>\n<li>Mix well, and set aside.When the dough has rested, transfer it to a lightly floured surface. Divide the mixture in two, and roll the first section out to your desired size (the thinner the better). My baking tray measured around 12 x 9 inches, so I kept this in mind when rolling.</li>\n<li>Transfer the rolled-out dough to a sheet of baking paper, and add the kale filling, making sure it's spread out evenly to the edges of the dough.</li>\n<li>Roll out the second piece of dough in the same way, and place it over the kale filling.Using a rolling pin, press the two layers of dough together over the filling, pressing out as much air as possible and tightly sealing the edges. Make a few small holes in the top of the pie with a fork.</li>\n<li>Bake at 190C (Gas Mark 5 / 375F) for around 20 minutes, until lightly browned. </li>\n<li>Cut into diamonds with a pizza cutter, and serve warm, drizzled with extra virgin olive oil if desired.</li>\n</ol>\n</div>
524262	balsamic kale with cranberries	\N	\N	\N	https://spoonacular.com/recipeImages/balsamic-kale-with-cranberries-524262.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oil over medium heat. </li>\n<li>Add onion and sauté until starting to soften and are browned, 3 to 5 minutes. </li>\n<li>Add kale, cranberries, water and salt, cover and cook, removing lid to stir often until the kale is wilted and tender, 3 to 6 minutes longer. </li>\n<li>Drizzle with balsamic vinegar.</li>\n</ol>\n</div>
524326	beet ginger juice	\N	\N	\N	https://spoonacular.com/recipeImages/beet-ginger-juice-524326.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut apple, beets, carrots and ginger into long narrow strips (if necessary) to fit through feed-tube of juicer. Set up catch cup (it will need to hold a quart.) Turn on juicer and feed pieces of the prepared produce through the feed-tube. Alternate kale with large chunks to clear the blade and prevent clogging.</li>\n</ol>\n</div>
626747	Lemon Lime Green Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Lemon-Lime-Green-Smoothie-626747.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients in your blender, and puree until smooth.</li>\n<li>Pour into glass and garnish with a kale leaf or lime wedge if you're feeling fancy.</li>\n</ol>\n</div>
573683	Hearty Kale, Butternut, Barley Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Hearty-Kale--Butternut--Barley-Soup-573683.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oil in a 3 quart pot. </li>\n<li>Add onion and cook over medium-high heat, stirring frequently, until onions softens and starts to turn golden. </li>\n<li>Add the barley, stir constantly and cook until golden brown. </li>\n<li>Add the stock, cover, and lower heat to a low simmer. Cook for about 20-25 minutes. </li>\n<li>Remove lid and add the butternut squash. Continue simmering for another 10-15 minutes, or until the squash is just barely tender. </li>\n<li>Add the kale and cook for a few minutes more. Ladle into bowls and serve piping hot.</li>\n</ol>\n</div>
573713	Kale Cranberry Pear Green Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-Cranberry-Pear-Green-Smoothie-573713.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place ingredients into a high speed blender in the order listed. (This helps things blend properly.) Puree and serve.</li>\n</ol>\n</div>
557362	Blueberry Coconut Hidden Green Smoothie [Dairy, Sugar & Gluten Free]	\N	\N	\N	https://spoonacular.com/recipeImages/Blueberry-Coconut-Hidden-Green-Smoothie-[Dairy--Sugar---Gluten-Free]-557362.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add all ingredients to your high powdered blender and blend until smooth.Makes 24 ounces.</li>\n</ol>\n</div>
758114	Garlicky Cheezy Kale & Crispy Chick’n Salad	\N	\N	\N	https://spoonacular.com/recipeImages/garlicky-cheezy-kale-crispy-chickn-salad-758114.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Whisk tahini with 5 Tbs. water in small bowl until smooth. Stir in nutritional yeast and garlic. </li>\n<li>Place kale in large bowl, and rub in tahini dressing until each leaf is coated. Season with salt and pepper, if desired. Chill 1 hour, or overnight. Prepare Crispy Chick’n according to package directions. </li>\n<li>Serve over kale.</li>\n</ol>\n</div>
500244	Hide Your Kale Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Hide-Your-Kale-Smoothie-500244.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add all ingredients to a blender and blend until smooth, adding more water as needed. Taste and adjust flavors as needed. </li>\n<li>Add more banana or agave for some added sweetness.</li>\n<li>Serve immediately - enough for </li>\n</ol>\n</div>
721437	Clean Eating Spring Kale & Orange Salad	\N	\N	\N	https://spoonacular.com/recipeImages/clean-eating-spring-kale-orange-salad-721437.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Using approximately 1/2 a bunch of washed kale, cut the leaves away from the stems and discard the stems.Stack and roll the leaves, then slice them into approximately 1/4 inch slices.Toss together with all other ingredients and some Grapefruit Vinaigrette dressing.</li>\n</ol>\n</div>
762412	Braised Kale, Potatoes and Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/braised-kale-potatoes-and-mushrooms-762412.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place potatoes in medium saucepan of salted water. Bring to a boil, reduce heat, and simmer until tender, 7 to 10 minutes. </li>\n<li>Drain well and set aside.Meanwhile, in large, wide skillet, heat oil over medium heat. </li>\n<li>Add mushrooms, shallots and garlic and cook, stirring often, until shallots are soft and mushrooms are tender, about 5 minutes. Season with salt and pepper to taste. </li>\n<li>Add kale to mushroom mixture and cook, stirring often, 1 minute. </li>\n<li>Add water and cooked potatoes. Cover and cook until kale is bright green, about 5 minutes. </li>\n<li>Serve warm.</li>\n</ol>\n</div>
373375	Apple-Raisin Ladybug	\N	\N	\N	https://spoonacular.com/recipeImages/Apple-Raisin-Ladybug-373375.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place lettuce leaves on two salad plates. Arrange two apple quarters, peel side up, on the lettuce. Use dab of peanut butter to place raisins in the space between apple quarters. </li>\n<li>Place one grape at the stem end of apple for head. For legs, cut the remaining grapes lengthwise into four pieces; place three on each side of ladybugs. </li>\n<li>Place small dabs of peanut butter on remaining raisins; gently press onto apples for spots.</li>\n</ol>\n</div>
660108	Simple Kale Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Simple-Kale-Salad-660108.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wash the kale, pat dry and remove the leaves from the stems (you can save the stems to add to a smoothie or a sauted veggies  they have a lot of nutrition so dont discard!). Chop the leaves and place in a large salad bowl.  In a bowl (or blender), combine the oil and lemon juice and mix until very well combined.  </li>\n<li>Pour the lemon & olive oil over the kale leaves and toss.  The acid from the lemons will help soften the kale leaves a little.  Chop the remaining vegetables, add to the salad and toss everything together. Sprinkle a little salt over the salad if desired. </li>\n<li>Serve in heaping portions and enjoy your mass of amazingness!</li>\n</ol>\n</div>
205460	Spicy-Tart Kale Limeade	\N	\N	\N	https://spoonacular.com/recipeImages/Spicy-Tart-Kale-Limeade-205460.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Mix kale juice, ginger juice, and apple juice with coconut water. </li>\n<li>Serve in tall glasses. </li>\n<li>Garnish with lime slice if desired.</li>\n</ol>\n</div>
512669	Roasted Sweet Potato Pesto Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Sweet-Potato-Pesto-Salad-512669.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 375 degrees.Chop the sweet potato into ½” pieces. Coat the sweet potato in a couple teaspoons of oil, shake some salt and pepper over them and bake in the oven for 30 minutes, stirring a couple of times part-way through.Once the sweet potato is soft, remove from the oven and allow to cool slightly.In a large salad bowl, toss the baby kale (or spinach or spring green mix) in a couple of tablespoons of store-bough or homemade pesto sauce.</li>\n<li>Add the diced avocado, green onion and roasted sweet potato and toss together.  I like serving this salad slightly warm by adding the roasted sweet potato when it’s still warm. You’d prefer, allow sweet potato to cool all the way before adding it to the salad.</li>\n</ol>\n</div>
537238	Chickpea and Kale Stir-Fry	\N	\N	\N	https://spoonacular.com/recipeImages/Chickpea-and-Kale-Stir-Fry-537238.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Chapati:</li>\n<li>Mix flour, chives, and salt together, then add water and bring into a ball.  Turn out onto a floured surface and knead for five minutes.  It should be a really sturdy dough.Cover dough and let rest for 30 minutes, then cut into 10 even pieces.</li>\n<li>Roll out each piece of dough and cook it in a cast iron skillet or any heavy pan with a drizzle of oil over high heat for 15 seconds.  Then flip it and cook for another 30 seconds until the bread is slightly charred and puffed.  Repeat with all of the pieces.For Stir fry:Prep all your ingredients.  In a large skillet, add a drizzle of oil and add chickpeas.  Cook for a few minutes until chickpeas get crispy, then add cumin and cook for another minute.  </li>\n<li>Remove chickpeas.</li>\n<li>Add zucchini to pan and cook for a minute until it starts to soften.  Then add kale and garlic and cook until kale starts to wilt, about 30 seconds.  </li>\n<li>Add chickpeas back in pan and lemon juice.  Season with salt and serve immediately with flatbread.</li>\n</ol>\n</div>
516844	Mashed Potato Cakes with Onions and Kale	\N	\N	\N	https://spoonacular.com/recipeImages/Mashed-Potato-Cakes-with-Onions-and-Kale-516844.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring water to a boil in a Dutch oven; add kale. Cover and cook over medium heat 5 minutes or until tender. While the kale is cooking, chop the rest of your veggies. </li>\n<li>Remove kale with a slotted spoon, reserving cooking liquid. Chop kale and set aside.</li>\n<li>Add potato to reserved cooking liquid in pan; bring to a boil. Reduce heat, and simmer 10 minutes or until tender. </li>\n<li>Drain; partially mash potatoes. Stir in kale and 1/4 teaspoon salt.Preheat oven to 400°. </li>\n<li>Heat oil in a large nonstick skillet over medium-high heat. </li>\n<li>Add 1/2 teaspoon salt, diced onion, and chopped sage. Cook 13 minutes or until browned.</li>\n<li>Combine potato mixture, onion mixture, green onions, and pepper in the pan. </li>\n<li>Remove from heat; cool slightly.Divide potato mixture into 8 equal portions, shaping each into a 1/2-inch-thick patty. </li>\n<li>Place patties on a baking sheet coated with cooking spray.</li>\n<li>Bake at 400° for 20 minutes. Then broil patties for 5 minutes or until browned. When they’re done, they look like this:You can serve the patties as is, or top them with 1 Tbsp fresh grated parmesan, or serve them with ketchup, or just garnish them with sage sprigs: you can really do anything you like with them!</li>\n</ol>\n</div>
533222	Kale, Pear and Cranberry Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Kale--Pear-and-Cranberry-Salad-533222.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Toast the pine nuts or seeds in a small skillet over medium heat, stirring frequently, till golden brown. Watch them carefully, they can easily go from brown to burned if you're not careful. As soon as they're toasted, remove them from the hot skillet to keep them from browning further.If your dried cranberries are super dry and not very soft, you can soak them in hot water for 5 minutes to plump and revive them. </li>\n<li>Drain the cranberries and pat dry before assembling the salad.</li>\n<li>Cut the thick stalk ends off of the kale, then chop the kale leaves into bite-sized pieces. You should end up with around 8-10 cups of kale leaves.</li>\n<li>Place the kale leaves into a salad bowl and pour the olive oil over them. Massage the olive oil into the kale with clean fingers for 2-3 minutes till the kale is softened and slightly wilted. This will help remove bitterness from the kale.</li>\n<li>Add the lemon juice, diced pear, cranberries, and toasted pine nuts to the bowl and sprinkle the salt evenly across the top. Toss the salad till well mixed.</li>\n<li>Let the salad sit for at least 5 minutes at room temperature. Toss again, then serve. Refrigerate leftovers in a sealed Tupperware dish for up to 2 days.</li>\n</ol>\n</div>
758513	Braised Cavolo Nero Kale	\N	\N	\N	https://spoonacular.com/recipeImages/braised-cavolo-nero-kale-758513.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oil in Dutch oven over medium-high heat. Sauté onion 7 to 9 minutes, or until golden. </li>\n<li>Add carrots, and cook 2 to 3 minutes more. </li>\n<li>Add kale and 1/2 cup water, cover, and cook 2 to 3 minutes, or until kale has wilted. Stir in red pepper flakes and garlic, and cook 1 to 2 minutes more. </li>\n<li>Add 1 1/4 cups water, and bring to a simmer.   Cover, reduce heat to medium-low, and simmer 40 minutes, or until kale is tender, adding more water if necessary.    Uncover pot, increase heat to medium-high, and cook 3 minutes, or until most of liquid has evaporated. Season with salt and pepper, if desired.</li>\n</ol>\n</div>
602969	Low Calorie Strawberry Banana Kale Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Low-Calorie-Strawberry-Banana-Kale-Smoothie-602969.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add all of the ingredients to a high speed blender and blend until smooth! It's that easy. ;)</li>\n</ol>\n</div>
13196	Stewed Greens With White Beans	\N	\N	\N	https://spoonacular.com/recipeImages/stewed_greens_with_white_beans-13196.jpg	http://www.biggirlssmallkitchen.com/2009/05/recipe-flash-stewed-greens-with-white.html
95138	Kale Carrot and Apple Calcium Booster Juice for Juicer	\N	\N	\N	https://spoonacular.com/recipeImages/kale-carrot-and-apple-calcium-booster-juice-for-juicer-2-95138.jpg	http://www.food.com/recipe/kale-carrot-and-apple-calcium-booster-juice-for-juicer-459269
304127	BBQ Kale Chips	\N	\N	\N	https://spoonacular.com/recipeImages/BBQ-Kale-Chips-304127.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven 275 degrees F. Line a baking sheet with parchment paper.</li>\n<li>Remove the thick stem from the kale and discard. Tear the kale leaves into bite-size pieces. Lay the kale onto the prepared baking sheet and spray evenly with cooking spray. </li>\n<li>Bake until crispy and browned on the edges, tossing the kale halfway through, 18 to 20 minutes. Sprinkle the kale with BBQ Seasoning and serve.</li>\n</ol>\n<div class="subRecipeInstructionTitle">BBQ Seasoning:</div>\n<ol>\n\n<li>Mix the paprika, ancho chile, sugar, garlic powder, salt and dry mustard in a small bowl.</li>\n</ol>\n</div>
619542	Cheesy Kale Chips	\N	\N	\N	https://spoonacular.com/recipeImages/Cheesy-Kale-Chips-619542.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Alternatively (if you dont have a dehydrator), spread kale pieces on parchment paper on baking trays, and bake at 200 degrees until crispy, about 45 minutes (but again, all that matters is that they MUST be crunchy).Once youve tried the basic recipe, feel free to spice things up  literally! Sprinkle some cayenne into the coating mixture for a nice kick, or add some garlic or onion powder, cumin, or dill!About these ads</li>\n</ol>\n</div>
628033	Andouille Sausage, Kale, and Root Vegetable Bake	\N	\N	\N	https://spoonacular.com/recipeImages/Andouille-Sausage--Kale--and-Root-Vegetable-Bake-628033.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 400 degrees.</li>\n<li>Add the vegetables to a baking dish and nestle the sausages on top. </li>\n<li>Add the broth to the baking dish.</li>\n<li>Bake for 30-35 minutes until vegetables are tender.</li>\n</ol>\n</div>
619940	Sautéed Fava Bean Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Sauted-Fava-Bean-Salad-619940.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>If using dried fava beans, soak them in a bowl with water overnight  at least 12 hours. Shell the beans and set them aside.Prepare other ingredients. Thaw the peas, chop the kale into bite-sized pieces, and thinly slice the shallot.</li>\n<li>Heat 2 tablespoons of olive oil in a skillet on medium heat.</li>\n<li>Add shallots and saut for 3-5 minutes until they become translucent and start to soften.</li>\n<li>Add kale and white wine vinegar and saut for 5 minutes. Kale will soften and become wilted.</li>\n<li>Add peas and toss with the sauted mixture until warmed.</li>\n<li>Serve and enjoy.</li>\n</ol>\n</div>
611773	Roasted Beet Noodles with Pesto and Baby Kale	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Beet-Noodles-with-Pesto-and-Baby-Kale-611773.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Set the oven to 425 degrees. On a baking sheet, spread out the beet noodles and coat with cooking spray and season with salt and pepper. </li>\n<li>Bake for 5-10 minutes or until beets are cooked to al dente or your preference in doneness.While the noodles cook, combine all of the ingredients for the pesto into a food processor and pulse until creamy. Taste and adjust, if needed.Once beets are cooked, toss with pesto and the kale. </li>\n<li>Serve.</li>\n</ol>\n</div>
398788	Kale and Pear Green Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-and-Pear-Green-Smoothie-398788.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients into the Vitamix container in the order listed and secure lid.Select Variable Turn machine on and slowly increase speed to Variable 10, then to High.Blend for 45 seconds or until desired consistency is reached.</li>\n</ol>\n</div>
615902	Kale Salad with Goji Berries	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-Salad-with-Goji-Berries-615902.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Tear away and discard kale stems. Rinse the leaves well and shake dry.</li>\n<li>Place leaves in a large bowl with salt and oil. Rub the salt into the leaves. Don't be shy. Just basically crush them until the leaves change to a darker green and wilt.</li>\n<li>Add remaining ingredients and stir with hands again.Refrigerate up to several days.</li>\n</ol>\n</div>
521800	Kale And Citrus Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-And-Citrus-Salad-521800.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Before you begin make sure that your kale is completely dry.  </li>\n<li>Place the kale into a large bowl and drizzle with olive oil and sprinkle with salt.  Gently massage the oil and salt into the kale.  Massage for about three minutes or until all the leaves are coated and seem to be softening up a bit.</li>\n<li>Add in cilantro and lemon juice and toss until well combined.  Gently stir in the oranges and top with pumpkin seeds right before serving.  Enjoy!Makes 4 servings (about 5 cups each)</li>\n</ol>\n</div>
149107	Kale Ginger Daiquiri	\N	\N	\N	https://spoonacular.com/recipeImages/kale-ginger-daiquiri-149107.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>For the Ginger Syrup: </li>\n<li>Combine the sugar, water, and chopped ginger in a small saucepan over high heat, stirring frequently. Bring to a boil then reduce heat to a simmer for 5 minutes. After 5 minutes, remove from heat and let cool to room temperature. Strain to remove the ginger and refrigerate until cool.</li>\n<li>2</li>\n<li>For the Kale Ginger Daiquiri: Fill a cocktail shaker with ice and add rum, lime juice, ginger simple syrup, and kale juice. Shake until well chilled, about 20 seconds. Strain into chilled coupe glass and serve immediately.</li>\n</ol>\n</div>
149117	Kale Pineapple Basil Smash	\N	\N	\N	https://spoonacular.com/recipeImages/kale-pineapple-basil-smash-149117.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Muddle pineapple and 5 basil leaves in cocktail shaker until you've made a pulpy puree. Fill the cocktail shaker with ice, add rye and kale juice. Shake until well chilled, about 20 seconds.</li>\n<li>2</li>\n\n<li>Place remaining 3 basil leaves in an old fashioned glass. Fill glass with ice, strain cocktail into glass, and garnish with basil sprig and pineapple slice. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
\.


--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('recipes_recipe_id_seq', 1, false);


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

COPY types (type_id, name) FROM stdin;
\.


--
-- Name: types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('types_type_id_seq', 1, false);


--
-- Name: diets_name_key; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY diets
    ADD CONSTRAINT diets_name_key UNIQUE (name);


--
-- Name: diets_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY diets
    ADD CONSTRAINT diets_pkey PRIMARY KEY (diet_code);


--
-- Name: ingredient_types_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY ingredient_types
    ADD CONSTRAINT ingredient_types_pkey PRIMARY KEY (ingredient_type_id);


--
-- Name: ingredients_name_key; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT ingredients_name_key UNIQUE (name);


--
-- Name: ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (ingredient_id);


--
-- Name: recipe_diets_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY recipe_diets
    ADD CONSTRAINT recipe_diets_pkey PRIMARY KEY (recipe_diet_id);


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
-- Name: types_name_key; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_name_key UNIQUE (name);


--
-- Name: types_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_pkey PRIMARY KEY (type_id);


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
-- Name: recipe_diets_diet_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY recipe_diets
    ADD CONSTRAINT recipe_diets_diet_code_fkey FOREIGN KEY (diet_code) REFERENCES diets(diet_code);


--
-- Name: recipe_diets_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY recipe_diets
    ADD CONSTRAINT recipe_diets_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id);


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

