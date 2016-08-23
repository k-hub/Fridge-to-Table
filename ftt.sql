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
-- Name: diets; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE diets (
    diet_code character varying(100) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE diets OWNER TO kathyma;

--
-- Name: favorites; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE favorites (
    favorite_id integer NOT NULL,
    id integer NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE favorites OWNER TO kathyma;

--
-- Name: favorites_favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: kathyma
--

CREATE SEQUENCE favorites_favorite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE favorites_favorite_id_seq OWNER TO kathyma;

--
-- Name: favorites_favorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kathyma
--

ALTER SEQUENCE favorites_favorite_id_seq OWNED BY favorites.favorite_id;


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
    measurement_amount double precision,
    measurement_unit character varying(50)
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
-- Name: roles; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE roles (
    role_id integer NOT NULL,
    name character varying(100),
    description character varying(255)
);


ALTER TABLE roles OWNER TO kathyma;

--
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: kathyma
--

CREATE SEQUENCE roles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_role_id_seq OWNER TO kathyma;

--
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kathyma
--

ALTER SEQUENCE roles_role_id_seq OWNED BY roles.role_id;


--
-- Name: roles_users; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE roles_users (
    user_role_id integer NOT NULL,
    id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE roles_users OWNER TO kathyma;

--
-- Name: roles_users_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: kathyma
--

CREATE SEQUENCE roles_users_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_users_user_role_id_seq OWNER TO kathyma;

--
-- Name: roles_users_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kathyma
--

ALTER SEQUENCE roles_users_user_role_id_seq OWNED BY roles_users.user_role_id;


--
-- Name: shoppinglist_ingredients; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE shoppinglist_ingredients (
    shoppinglist_ingredient_id integer NOT NULL,
    shoppinglist_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE shoppinglist_ingredients OWNER TO kathyma;

--
-- Name: shoppinglist_ingredients_shoppinglist_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: kathyma
--

CREATE SEQUENCE shoppinglist_ingredients_shoppinglist_ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shoppinglist_ingredients_shoppinglist_ingredient_id_seq OWNER TO kathyma;

--
-- Name: shoppinglist_ingredients_shoppinglist_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kathyma
--

ALTER SEQUENCE shoppinglist_ingredients_shoppinglist_ingredient_id_seq OWNED BY shoppinglist_ingredients.shoppinglist_ingredient_id;


--
-- Name: shoppinglists; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE shoppinglists (
    shoppinglist_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE shoppinglists OWNER TO kathyma;

--
-- Name: shoppinglists_shoppinglist_id_seq; Type: SEQUENCE; Schema: public; Owner: kathyma
--

CREATE SEQUENCE shoppinglists_shoppinglist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shoppinglists_shoppinglist_id_seq OWNER TO kathyma;

--
-- Name: shoppinglists_shoppinglist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kathyma
--

ALTER SEQUENCE shoppinglists_shoppinglist_id_seq OWNED BY shoppinglists.shoppinglist_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: kathyma
--

CREATE TABLE users (
    id integer NOT NULL,
    fname character varying(100) NOT NULL,
    lname character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    active boolean,
    confirmed_at timestamp without time zone
);


ALTER TABLE users OWNER TO kathyma;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: kathyma
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO kathyma;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kathyma
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: favorite_id; Type: DEFAULT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY favorites ALTER COLUMN favorite_id SET DEFAULT nextval('favorites_favorite_id_seq'::regclass);


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
-- Name: role_id; Type: DEFAULT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY roles ALTER COLUMN role_id SET DEFAULT nextval('roles_role_id_seq'::regclass);


--
-- Name: user_role_id; Type: DEFAULT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY roles_users ALTER COLUMN user_role_id SET DEFAULT nextval('roles_users_user_role_id_seq'::regclass);


--
-- Name: shoppinglist_ingredient_id; Type: DEFAULT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY shoppinglist_ingredients ALTER COLUMN shoppinglist_ingredient_id SET DEFAULT nextval('shoppinglist_ingredients_shoppinglist_ingredient_id_seq'::regclass);


--
-- Name: shoppinglist_id; Type: DEFAULT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY shoppinglists ALTER COLUMN shoppinglist_id SET DEFAULT nextval('shoppinglists_shoppinglist_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: diets; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY diets (diet_code, name) FROM stdin;
vg	vegan
v	vegetarian
pes	pescetarian
a	any
pal	paleo
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY favorites (favorite_id, id, recipe_id) FROM stdin;
\.


--
-- Name: favorites_favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('favorites_favorite_id_seq', 1, false);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY ingredients (ingredient_id, name) FROM stdin;
1	garlic cloves
2	dry white wine
3	extra virgin olive oil
4	salt and pepper
5	black pepper
6	green olives
7	chicken
8	salt
9	tomatoes
10	carrots
11	whole chicken
12	fingerling potatoes
13	arugula
14	fresh chives
15	ground pepper
16	sea salt
17	olive oil
18	mangoes
19	pepper
20	asparagus
21	flour
22	soy sauce
23	peach nectar
24	salsa
25	white onions
26	plum tomatoes
27	rosemary
28	creamy cheese grits
29	butternut squash
30	chicken stock
31	fresh thyme
32	sunflower oil
33	unsalted butter
34	Salt & Pepper
35	vegetable oil
36	lemon
37	red potatoes
38	green beans
39	baby cut carrots
40	dijon mustard
41	fresh tarragon
42	honey
43	chickens
44	canola oil
45	water
46	long grain rice
47	poultry seasoning
48	fresh parsley
49	milk
50	nut mix
51	condensed cream of chicken soup
52	peas and carrots
53	garlic
54	fresh rosemary
55	balsamic vinegar
56	bacon
57	shallots
58	ginger
59	oranges
60	lemons
61	kosher salt
62	peanut
63	sugar
64	rye ipa
65	garlic powder
66	chicken broth
67	peas
68	mushrooms
69	red sweet peppers
70	onion
71	creamy peanut butter
72	peanut oil
73	red pepper flakes
74	beefsteak tomatoes
75	bay leaves
76	yukon gold potatoes
77	oil
78	green onions
79	chili powder
80	corn chips
81	beer
82	brown sugar
83	ground cumin
84	light soy sauce
85	scallion
86	shaoxing wine
87	ginger powder
88	dry onion soup mix
89	condensed cream of mushroom soup
90	plantains
91	potatoes
92	canned tomatoes
93	butter
94	thyme
95	roasted garlic
96	juice of lemon
97	cooking oil
98	chilli oil
99	sesame oil
100	spring onions
101	tahini
102	spaghetti
103	sweet soy sauce
104	anchovy paste
105	plum tomato
106	garlic clove
107	flat-leaf parsley
108	soya sauce
109	cornflour
110	ginger paste
111	red pepper powder
112	chicken gravy
113	parmesan cheese
114	shredded mozzarella cheese
115	cooked spaghetti
116	fresh sage
117	thyme sprigs
118	onion powder
119	paprika
120	pancake mix
121	celery salt
122	curry paste
123	deli ham
124	eggs
125	swiss cheese
126	unseasoned breadcrumbs
127	rosemary leaves
128	lemon zest
129	herb tea
130	patis
131	tamarind
132	italian salad dressing
133	italian seasoning
134	seasoned salt
135	cilantro
136	tortillas
137	bbq sauce
138	pepper jack cheese
139	smoked paprika
140	pecorino
141	ricotta
142	chard
143	fat-free milk
144	red skinned potatoes
145	corn flakes
146	egg
147	sesame seeds
148	orange zest
149	orange juice
150	hoisin sauce
151	lemon juice
152	ground ginger
153	celery
154	ranch dressing
155	barbecue sauce
156	buttermilk
157	muffin mix
158	ranch dressing mix
159	roasted red bell pepper
160	scallions
161	granny smith apple
162	fresh sage leaves
163	baby beet
164	baby spinach
165	pita
166	red bell pepper
167	vinaigrette
168	spinach wrap
169	queso fresco
170	orange bell pepper
171	pine nuts
172	pizza crust
173	basil pesto
174	part-skim mozzarella cheese
175	ground cinnamon
176	turmeric
177	onions
178	scotch bonnet chili peppers
179	allspice
180	seasoning salt
181	baby potatoes
182	coarse salt
183	fresh oregano leaves
184	orange peppers
185	orange juice concentrate
186	pineapple
187	dried oregano
188	feta cheese
189	creamer potatoes
190	skim milk
191	cream of mushroom soup
192	cheddar cheese
193	cooked macaroni
194	white wine
195	lard
196	basil
197	lime juice
198	dried thyme leaves
199	nutmeg
200	fresh mushrooms
201	breadcrumbs
202	red onion
203	watercress
204	dried rosemary
205	mixed veggies
206	cream of chicken soup
207	biscuits
208	flour tortillas
209	veggie blend
210	shredded cheddar cheese
211	coriander
212	black peppercorns
213	juice of lime
214	cooked ham
215	puff pastry
216	green salsa
217	corn tortillas
218	annatto seeds
219	limes
220	asian fish sauce
221	fig jam
222	stout
223	skinless boneless chicken breasts
224	ham
225	rice wine vinegar
226	fat free chicken broth
227	bow tie pasta
228	fava beans
229	coarse sea salt
230	parsley leaves
231	new potatoes
232	red peppers
233	red onions
234	fresh basil
235	goat cheese
236	acorn squash
237	tarragon
238	shiitake mushroom caps
239	orange
240	real bacon pieces
241	pepper rings
242	miracle whip
243	pasta sauce
244	slivered almonds
245	pasta salad mix
246	red grapes
247	poppy seed
248	salted peanuts
249	chili sauce
250	peanut butter
251	canned tomato sauce
252	bell pepper
253	canned cannellini beans
254	fresh basil leaves
255	celery flakes
256	dried parsley flakes
257	dried onion
258	chicken bouillon granules
259	white rice
260	cream of potato soup
261	spaghetti sauce
262	lasagna noodles
263	cider vinegar
264	fennel bulbs
265	apples
266	herbes de provence
267	tabasco
268	green pepper
269	steak seasoning
270	ginger ale
271	lettuce leaf
272	myzithra cheese
273	yellow onions
274	tomato paste
275	pork
276	vegetable oil cooking spray
277	spinach
278	cracked pepper
279	bird's eye chile
280	sesame seed oil
281	baby corns
282	bacon strips
283	fresh corn
284	fresh cilantro
285	sweet potatoes
286	beef
287	worcestershire sauce
288	leeks
289	bread
290	chilli
291	korean marinade
292	fish sauce
293	dark soy sauce
294	wine
295	whole garlic
296	dried shrimp
297	daikon radish
298	scallops
299	pinto beans
300	bay leaf
301	thick-cut bacon
302	ham hock
303	jalapeno chile
304	white onion
305	dried tarragon
306	meat
307	parsley
308	baking powder
309	dried coriander leaves
310	snow peas
311	whole wheat noodles
312	yellow capsicum
313	lettuce leaves
314	caster sugar
315	cooked rice
316	cashew nuts
317	fresh cilantro leaves
318	iceberg lettuce leaves
319	mango
320	dry roasted peanuts
321	serrano chili
322	plain flour
323	jelly
324	brandy
325	prunes
326	creme fraiche
327	eggplants
328	star anise
329	bbq spice
330	oyster sauce
331	chayote
332	spinach leaves
333	squash
334	chili pepper
335	cilantro leaves
336	sour cream
337	fresh breadcrumbs
338	pork butt
339	whole wheat tortillas
340	fresh ginger
341	chili-garlic sauce
342	crunchy peanut butter
343	turkey breast
344	pickle
345	rolls
346	mustard
347	orange rind
348	peppercorns
349	rice wine
350	pineapple chunks
351	chili flakes
352	tapioca starch
353	enoki mushrooms
354	cornstarch
355	truffles
356	whole-grain mustard
357	flat leaf parsley
358	chicken breast
359	granny smith apples
360	white wine vinegar
361	coarse grain mustard
362	basmati rice
363	creole seasoning
364	sweet chilli sauce
365	lime zest
366	canned black beans
367	ground allspice
368	bananas
369	chili
370	ground oregano
371	chili peppers
372	chile
373	sweet potato
374	coconut milk
375	sigarillas
376	two
377	coconut cream
378	patani
379	red pepper
380	red wine vinegar
381	sausage
382	shrimps
383	kangkong
384	taro
385	finger chilis
386	rice vinegar
387	baby bok choy
388	broth
389	prosciutto
390	veal
391	pork shoulder
392	chives
393	mace
394	heavy cream
395	corn starch
396	pineapple juice
397	canned pineapple
398	iceberg lettuce
399	mexican crema
400	russet potatoes
401	pear
402	fuji apple
403	gochujang
404	sea-salt
405	thyme leaves
406	cabbage
407	lemon wedges
408	jalapeno
409	coconut oil
410	cumin
411	yellow onion
412	chicken drumsticks
413	carrot
414	lager
415	cumin seed
416	ice
417	juice of orange
418	multi-grain bread
419	low fat cream cheese
420	cream cheese
421	jalapenos
422	marjoram
423	caraway seed
424	sweet paprika
425	lemon rind
426	cheese
427	beef broth
428	all purpose flour
429	ground achiote
430	tomatillo salsa
431	sourdough bread
432	frozen spinach
433	beancurd
434	low sodium broth
435	light brown sugar
436	cayenne pepper
437	cola
438	bamboo shoots
439	tree nuts
440	bean curd
441	bok choy
442	leek
443	garam masala
444	sugar-free apricot preserves
445	splenda brown sugar blend
446	green bell pepper
447	ketchup
448	fresh oregano
449	purple plum
450	monterey jack
451	bean sprouts
452	peppers
453	tomato
454	white vinegar
455	low sodium soy sauce
456	peppercorn
457	boneless chicken thighs
458	spring onion
459	green chili
460	fistfuls kimchi
461	shiitake mushrooms
462	korean chili powder
463	jack cheese
464	horseradish cream
465	baby corn
466	sweet chili sauce
467	hokkien noodles
468	broccoli
469	ketjap manis
470	stuffing
471	pork roll
472	cheddar
473	green chilies
474	quick-cooking brown rice
475	jalapeno pepper
476	skinless boneless chicken breast halves
477	cumin seeds
478	garlic salt
479	chuck steak
480	maple syrup
481	cream of tartar
482	apple
483	unrefined sea salt
484	baking soda
485	whole eggs
486	applesauce
487	coconut flour
488	apple juice
489	baguettes
490	nuoc mam
491	rice protein powder
492	pork fat
493	red chili
494	lemongrass
495	lime
496	bacon drippings
497	tabasco sauce
498	dried thyme
499	cooked noodles
500	stewed tomatoes
501	sauerkraut
502	english muffins
503	egg yolks
504	sriracha
505	sake
506	tomato sauce
507	panko
508	greek yogurt
509	fresh coriander
510	fennel seed
511	coriander seed
512	scotch bonnet chili pepper
513	crusty bread
514	chicken base
515	frozen corn
516	nut meal
517	fresh dill
518	heavy whipping cream
519	mozzarella cheese
520	bbq seasoning
521	on the stove
522	beans
523	dark corn syrup
524	french bread
525	serrano pepper
526	mayonnaise
527	canned water chestnuts
528	dried mushrooms
529	tofu
530	fresh herbs
531	cous cous
532	feta
533	romano cheese
534	stew vegetables
535	corn flour
536	potato
537	cinnamon stick
538	thai fish sauce
539	red chilli
540	ginger root
541	dark muscovado sugar
542	cauliflower
543	avocado
544	ground beef
545	dried shiitake mushrooms
546	bagels
547	chile powder
548	red sweet pepper
549	gingerroot
550	dry sherry
551	jicama
552	cashews
553	dried basil
554	whole garlic cloves
555	cherry tomatoes
556	capers
557	pesto
558	baby peas
559	arborio rice
560	vanilla bean paste
561	egg noodles
562	tomato puree
563	poblano chile
564	zucchini
565	vinegar
566	white pepper
567	fungus
568	cooked udon noodles
569	sambal oelek
570	edamame
571	roast beef deli slices
572	sun-dried tomato wrap
573	arugula leaves
574	kaiser bun
575	horseradish
576	provolone cheese
577	stir fry vegetables
578	american cheese
579	french baguette
580	ground cloves
581	ground nutmeg
582	ground coriander
583	pork ribs
584	lima beans
585	juice
586	chilies
587	rye bread
588	lettuce
589	sandwich buns
590	dill
591	whatever you have in your cupboard
592	monterey jack cheese
593	dog
594	enchilada sauce
595	better than bullion
596	barley
597	beef bouillon
598	pumpernickel bread
599	nut blend
600	grapeseed oil
601	process american cheese
602	onion soup mix
603	lean ground beef
604	hash browns
605	mild cheddar cheese
606	romaine lettuce leaves
607	pita breads
608	yellow sweet peppers
609	filet mignon steaks
610	french fried onions
611	bottled garlic
612	low sodium beef broth
613	bottled water
614	sharp cheddar cheese
615	lean lamb loin chops
616	dry red wine
617	horseradish sauce
618	croissants
619	chili garlic sauce
620	steak sauce
621	whole berry cranberry sauce
622	colby monterey jack cheese
623	beef brisket
624	white potatoes
625	ears corn
626	yuca
627	refried beans
628	seasoning mix
629	boston lettuce
630	beefsteak tomato
631	ciabatta bread
632	romaine
633	morels
634	madeira
635	stock
636	sherry wine
637	white sugar
638	broccoli florets
639	dried basil leaves
640	mushroom
641	beef consomme
642	crusty rolls
643	kiwifruit
644	shallot
645	sandwich rolls
646	seasoning blend
647	sherry
648	canned beef broth
649	rice noodles
650	cucumber
651	fresh coriander leaves
652	cow pea
653	mandarin orange segments
654	asian toasted sesame dressing
655	salad dressing
656	garlic-herb spreadable cheese
657	loaf bread
658	sweet onion
659	au jus sauce
660	coarsely ground pepper
661	blue cheese
662	low fat sour cream
663	canned white beans
664	kale
665	pot roast
666	tri tip roast
667	colby jack cheese
668	roasted red peppers
669	skewers
670	canned pinto beans
671	beef bouillon cube
672	siracha
673	Stone-Ground Mustard
674	beef stock
675	sweet tea
676	pistachios
677	emmentaler cheese
678	upo
679	kalabasa
680	long pasta
681	italian sausage
682	white distilled vinegar
683	stir fry mix
684	green onion
685	bell peppers
686	condensed french onion soup
687	canned mushrooms
688	mayo
689	whole wheat bread
690	tomato & basil sauce
691	mozzarella
692	buns
693	coarse ground mustard
694	low fat swiss cheese
695	romaine lettuce
696	neufchatel cheese
697	mint chutney
698	curry powder
699	top round steak
700	ham bone
701	cherry preserves
702	mung bean sprouts
703	dried apricots
704	soya oil
705	black vinegar
706	champagne vinegar
707	slider buns
708	gluten free noodles
709	bread dough
710	you also need
711	garnishing suggestions
712	gari beni shoga
713	capacity casserole
714	rice
715	short grain rice
716	yam
717	scotch bonnet pepper
718	pumpkin
719	hominy
720	chiles
721	radishes
722	panko breadcrumbs
723	ground peppercorns
724	beef stock cube
725	olives
726	ciabatta rolls
727	salad mix
728	egg vermicelli
729	orange marmalade
730	sweet butter
731	brown mushrooms
732	squash blossoms
733	zucchinis
734	white bread
735	sub rolls
736	butter lettuce leaves
737	brie
738	dried cranberries
739	cooked manicotti
740	cracker
741	pancetta
742	parmesan
743	crushed red pepper
744	broccoli rabe
745	whole milk
746	white whole wheat flour
747	bread crumbs
748	reduced fat mayo
749	kaiser rolls
750	canned green chiles
751	dried beef
752	potato sticks
753	beet
754	pomegranate seeds
755	serrano peppers
756	fat free low sodium beef broth
757	salmon fillet
758	salmon fillets
759	5 spice powder
760	cajun seasoning
761	salmon
762	low fat mayonnaise
763	light-brown sugar
764	dry mustard
765	old bay seasoning
766	salmon filets
767	grapefruit
768	nori
769	pepper sauce
770	mustard seed
771	wasabi
772	tuna steak
773	dried dill weed
774	cucumbers
775	sundried tomatoes
776	black olives
777	basil leaves
778	grape seed oil
779	kalamata olives
780	salted anchovies
781	figs
782	walnuts
783	raspberry preserves
784	almonds
785	anchovy
786	vodka
787	clementines
788	stir fry blend
789	grain blend
790	pecans
791	caviar
792	baking potato
793	unseasoned rice vinegar
794	andouille sausage
795	serrano chile
796	avocados
797	light butter
798	grilled salmon
799	portobello mushrooms
800	crisco
801	penne
802	cream
803	mango nectar
804	cornmeal
805	blueberries
806	apple cider vinegar
807	canned great northern beans
808	fresh thyme leaves
809	yellow sweet pepper
810	sugar snap peas
811	whole grain dijon mustard
812	dark brown sugar
813	liquid smoke
814	peach
815	mint
816	cherries
817	cooked basmati rice
818	lime wedges
819	crackers
820	hot pepper sauce
821	pepper jelly
822	champagne
823	chervil
824	raw honey
825	sage
826	spices
827	salsa verde
828	phyllo dough
829	sriracha sauce
830	waxy potatoes
831	sorrel
832	garlic scapes
833	yellow summer squash
834	teriyaki sauce
835	white miso
836	coarse kosher salt
837	corn
838	heirloom tomatoes
839	blackened seasoning
840	ruby port
841	flat leaf parsley leaves
842	baby beets
843	balsamic glaze
844	spaghetti squash
845	apple jelly
846	extravirgin olive oil
847	thai red curry paste
848	honey dijon mustard
849	red grapefruit
850	pickled ginger
851	cedar plank
852	rosemary leaf
853	yellow cherry tomatoes
854	asparagus spears
855	vanilla
856	old fashion doughnuts
857	chocolate milk
858	banana
859	smooth peanut butter
860	dark chocolate chips
861	vanilla pudding mix
862	nilla wafers
863	whipped topping
864	chocolate hazelnut spread
865	roasted nuts
866	strawberries
867	strawberry yogurt
868	soymilk
869	turbinado sugar
870	tea bag
871	vanilla ice cream
872	curly parsley
873	nuts
874	double cream
875	yogurt
876	ice cubes
877	cardamom powder
878	as needed
879	cookies
880	milk chocolate
881	coconut
882	almond
883	club soda
884	cake mix
885	desired toppings
886	egg roll wrappers
887	nutella
888	roasted cashews
889	bisquick
890	white chocolate chips
891	sprinkles
892	margarine
893	rum
894	granulated sugar
895	coffee cake mix
896	soy milk
897	ice cream
898	hazelnuts
899	grapes
900	cinnamon sugar
901	unsweetened shredded coconut
902	semi sweet chocolate
903	cocoa krispies cereal
904	almond butter
905	cranberry bread
906	ripe bananas
907	snickers chocolate bar
908	medjool dates
909	almond milk
910	cocoa
911	oatmeal
912	pretzel sticks
913	confectioners' sugar
914	almond flour
915	chocolate
916	chocolate chips
917	sweetened condensed milk
918	granola cereal
919	frangelico
920	malt drink mix
921	plain nonfat yogurt
922	whole wheat flour
923	mixed berries
924	nonfat cool whip
925	pb2
926	cinnamon
927	ice cube
928	cocoa powder
929	pork shoulder roast
930	crepes
931	papaya
932	active yeast
933	whole wheat pastry flour
934	unbleached flour
935	soy flour
936	special: skewers
937	oats
938	chocolate syrup
939	fish sticks
940	raspberries
941	wheat germ
942	tamale wrappers
943	dark chocolate morsels
944	oil to grease pan
945	palm sugar
946	jackfruit
947	acai juice
948	non-fat milk
949	hot chocolate powder
950	jaggery
951	vanilla powder
952	vanilla extract
953	tortilla
954	firm tofu
955	cayenne
956	roasted peanuts
957	chili oil
958	sesame seed paste
959	noodles
960	asian pear
961	bragg's liquid aminos
962	cup cake
963	english cucumber
964	soy cheese
965	pickles
966	oil cured black olives
967	pink himalayan salt
968	turmeric powder
969	eggplant
970	yellow wax beans
971	cooked brown rice
972	peanuts
973	turkey
974	fennel bulb
975	top blade steak
976	radicchio
977	ground fennel
978	baguette
979	crimini mushrooms
980	mirin
981	anchovies
982	sweetened coconut
983	sherry vinegar
984	fresh mint
985	red-skinned sweet potato
986	Miso Soybean Paste
987	fresh gingerroot
988	Ener-G egg replacer
989	raw sugar
990	yard long beans
991	vegetable broth
992	brown rice
993	slaw dressing
994	seaweed
995	agave nectar
996	tamari
997	oysters
998	bitter gourd
999	peanut sauce
1000	red chili flakes
1001	shredded pork
1002	serrano ham
1003	celery stalks
1004	shirataki
1005	genmaicha
1006	polenta
1007	fleur de sel
1008	napa cabbage
1009	vanilla bean
1010	light coconut milk
1011	graham crackers
1012	butter nut pumpkin
1013	cane sugar
1014	bean curd skin
1015	bean thread noodles
1016	lotus root
1017	water chestnuts
1018	red cabbage
1019	potato starch
1020	fresh basil leaf
1021	reduced sodium soy sauce
1022	ginger-garlic paste
1023	udon noodles
1024	brocollini
1025	kecap manis
1026	greens
1027	black sesame seeds
1028	cashew butter
1029	chili paste
1030	hamburger buns
1031	portobello mushroom cap
1032	pasta
1033	dairy milk
1034	nutritional yeast
1035	green peas
1036	swiss chard
1037	low sodium chicken stock
1038	pork loin
1039	green cabbage
1040	broccoli slaw
1041	reduced fat mozzarella cheese
1042	braggs liquid aminos
1043	dry roasted almonds
1044	red miso
1045	radish sprouts
1046	chile garlic sauce
1047	ground pork
1048	long-grain rice
1049	vegetables oil
1050	vegetable stock
1051	soba noodles
1052	low fat ricotta cheese
1053	low fat shredded mozzarella cheese
1054	chorizo
1055	lasagna pasta
1056	oregano
1057	cremini mushrooms
1058	chickpeas
1059	chilli powder
1060	vegan margarine
1061	almond extract
1062	flaxseed meal
1063	miso
1064	ground cayenne pepper
1065	grape tomatoes
1066	ground turmeric
1067	chicken strips
1068	daikon
1069	dashi
1070	skin on chicken drumsticks
1071	russet potato
1072	vegetable
1073	rice crackers
1074	dark sesame oil
1075	japanese 7 spice
1076	chicken bouillon
1077	light soya sauce
1078	ground meat
1079	tamari soy sauce
1080	snap peas
1081	seasoned bread crumbs
1082	spearmint
1083	maple flavor
1084	stevia extract
1085	canned pumpkin puree
1086	pumpkin pie spice
1087	pea shoots
1088	silver tequila
1089	chicken broth powder
1090	rice paper
\.


--
-- Name: ingredients_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('ingredients_ingredient_id_seq', 1090, true);


--
-- Data for Name: recipe_diets; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY recipe_diets (recipe_diet_id, recipe_id, diet_code) FROM stdin;
1	74225	a
2	74249	a
4	74407	a
5	25369	a
6	172864	a
7	189301	a
8	418827	a
9	164950	a
10	615508	a
11	115813	a
12	42099	a
14	484691	a
15	443795	a
18	649072	a
19	706454	a
20	526278	a
21	526548	a
22	477720	a
23	125529	a
24	649827	a
25	494248	a
26	84694	a
27	43883	a
28	510892	a
29	707663	a
30	167036	a
31	601217	a
32	535745	a
33	290013	a
34	511195	a
35	478432	a
36	445704	a
37	519514	a
38	20418	a
39	159714	a
40	200784	a
41	274643	a
42	749952	a
44	471483	a
45	160342	a
46	496462	a
47	611209	a
48	521148	a
50	521279	a
51	537708	a
52	365791	a
53	136486	a
54	292273	a
55	382457	a
56	136838	a
58	489236	a
59	530277	a
60	38830	a
61	38840	a
62	137151	a
63	38847	a
64	481242	a
65	276448	a
66	481250	a
67	481267	a
68	137287	a
69	96394	a
70	359131	a
71	580342	a
72	170862	a
73	220041	a
74	187337	a
75	39977	a
76	212044	a
77	130140	a
78	171114	a
79	113897	a
81	32316	a
82	303132	a
83	139296	a
84	286759	a
85	172081	a
86	499805	a
87	164057	a
88	172277	a
89	164108	a
91	115016	a
92	434643	a
93	442901	a
94	74262	a
95	16996	a
96	410262	a
97	74391	a
98	598746	a
99	522193	a
100	417788	a
101	116737	a
102	565284	a
103	602196	a
104	290906	a
105	608393	a
106	37069	a
108	16665	a
109	211275	a
110	82263	a
111	82262	a
112	522587	a
113	598373	a
114	215410	a
117	520701	a
118	520803	a
119	246381	a
120	367226	a
121	17057	a
122	213670	a
123	522969	a
124	146293	a
125	484216	a
127	447384	a
128	478159	a
129	521187	a
130	478227	a
131	640050	a
132	595029	a
133	136287	a
134	523370	a
135	107643	a
136	738558	a
137	249076	a
138	11563	a
139	509280	a
140	583101	a
141	212453	a
142	556537	a
144	226838	a
146	521938	a
147	564971	a
148	347907	a
151	124781	a
152	298934	a
154	143426	a
155	567366	a
157	36997	a
159	145647	a
162	706967	a
163	647656	a
164	551453	a
166	492226	a
167	246503	a
168	146280	a
169	437120	a
171	588717	a
175	146476	a
176	214135	a
177	144528	a
178	226536	a
179	582904	a
180	568618	a
181	433475	a
182	243067	a
185	564983	a
186	212766	a
189	745330	a
190	92100	a
191	143357	a
192	661533	a
194	526400	a
195	102482	a
196	118976	a
197	567525	a
198	482250	a
199	482262	a
200	521179	a
201	146420	a
202	478210	a
203	99336	a
204	119918	a
205	502923	a
206	595148	a
207	625898	a
209	267514	a
210	288023	a
211	417110	a
212	159122	a
213	265621	a
214	42444	a
215	13964	a
216	370332	a
217	81583	a
218	534220	a
219	16164	a
220	42806	a
221	522111	a
222	597924	a
223	22448	a
224	128992	a
225	526315	a
226	620572	a
227	227381	a
228	112695	a
230	395397	a
231	321688	a
232	782571	a
233	110879	a
234	172345	a
237	336280	a
238	223667	a
239	172477	a
240	385491	a
241	385499	a
242	436742	a
243	416319	a
244	567923	a
245	549495	a
246	572040	a
247	39607	a
248	756524	a
249	365597	a
250	52299	a
251	521431	a
252	351485	a
253	511310	a
255	167251	a
256	511316	a
257	28004	a
258	472443	a
259	470452	a
260	372154	a
261	603602	a
262	200242	a
263	468546	a
264	34447	a
265	542352	a
266	521924	a
267	648993	a
268	425833	a
269	329630	a
270	389026	a
271	169974	a
272	565258	a
273	600076	a
274	362508	a
275	632891	a
277	438431	a
278	37032	a
280	401627	a
281	569577	a
283	137565	a
284	174454	a
285	403903	a
286	145925	a
287	215564	a
288	168489	a
289	197217	a
291	617102	a
292	266917	a
293	402106	a
294	629502	a
295	568153	a
296	88073	a
298	88243	a
300	88278	a
302	88362	a
303	522581	a
304	629215	a
305	629492	a
307	367482	a
308	162735	a
309	654435	a
310	7665	a
312	499271	a
313	589379	a
314	212768	a
315	589863	a
316	196	a
317	598233	a
318	401676	a
319	213402	a
321	557565	a
323	524925	a
324	214240	a
325	591129	a
326	304491	a
327	550306	a
329	157206	a
330	1593	a
331	247371	a
332	624219	a
333	575123	a
334	83652	a
335	599862	a
336	559309	a
337	739543	a
338	149766	a
339	379151	a
340	493889	a
341	494005	a
343	551687	a
344	19307	a
345	273352	a
347	658483	a
348	35967	a
349	576717	a
350	593095	a
353	290093	a
354	265542	a
355	85405	a
356	85442	a
357	683484	a
359	85491	a
360	85505	a
361	85512	a
362	85541	a
363	667231	a
364	487020	a
366	593806	a
367	602041	a
368	610468	a
369	610524	a
370	176439	a
373	4519	a
374	504233	a
375	4534	a
376	4584	a
377	324170	a
378	4705	a
379	4713	a
380	4729	a
381	4747	a
383	86715	a
384	594615	a
385	4800	a
386	4820	a
387	86744	a
388	86760	a
389	4850	a
390	4857	a
391	86809	a
392	86868	a
393	86907	a
394	529156	vg
395	529156	v
396	529156	a
397	578594	v
398	578594	a
399	529558	vg
400	529558	v
401	529558	a
402	267575	v
403	267575	a
404	578977	vg
405	578977	v
406	578977	a
407	267748	a
408	759354	vg
409	759354	v
410	759354	a
411	546633	v
412	546633	a
413	579424	v
414	579424	a
415	579441	v
416	579441	a
417	169959	vg
418	169959	v
419	169959	a
420	186429	vg
421	186429	v
422	186429	a
423	268380	vg
424	268380	v
425	268380	a
426	219247	a
427	596192	vg
428	596192	v
429	596192	a
430	596249	vg
431	596249	v
432	596249	a
433	203161	v
434	203161	a
435	580034	v
436	580034	a
437	285205	a
438	72327	a
439	482276	vg
440	482276	v
441	482276	a
442	646426	vg
443	646426	v
444	646426	a
445	269782	vg
446	269782	v
447	269782	a
448	171590	v
449	171590	a
450	515692	v
451	515692	a
452	483059	vg
453	483059	v
454	483059	a
455	483082	a
456	155425	vg
457	155425	v
458	155425	a
459	597847	v
460	597847	a
461	515973	a
462	630732	v
463	630732	a
464	483336	a
467	549115	v
468	549115	a
469	762137	vg
470	762137	v
471	762137	a
473	123348	vg
474	123348	v
475	123348	a
476	565730	v
477	565730	a
478	549368	a
479	483917	v
480	483917	a
481	270968	a
482	189174	vg
483	189174	v
484	189174	a
485	697097	v
486	697097	a
487	582527	v
488	582527	a
489	598996	v
490	598996	a
491	484460	a
492	484554	a
493	697665	vg
494	697665	v
495	697665	a
496	566721	vg
497	566721	v
498	566721	a
499	370181	vg
500	370181	v
501	370181	a
502	550536	vg
503	550536	v
504	550536	a
505	665469	a
506	125011	a
507	485471	a
510	125033	v
511	125033	a
514	125064	a
515	125090	v
516	125090	a
522	125175	v
523	125175	a
526	125234	v
527	125234	a
528	485711	a
534	125325	v
535	125325	a
536	387514	a
537	125384	a
544	125436	vg
545	125436	v
546	125436	a
547	535045	v
548	535045	a
549	535070	a
550	125483	a
554	174694	v
555	174694	a
556	125571	a
557	125597	v
558	125597	a
559	125678	vg
560	125678	v
561	125678	a
562	60185	v
563	60185	a
564	568169	vg
565	568169	v
566	568169	a
570	666724	v
571	666724	a
572	633969	vg
573	633969	v
574	633969	a
575	568439	vg
576	568439	v
577	568439	a
578	601309	v
579	601309	a
580	650485	vg
581	650485	v
582	650485	a
583	503047	v
584	503047	a
585	732447	vg
586	732447	v
587	732447	a
588	601422	a
589	486735	vg
590	486735	v
591	486735	a
592	552324	v
593	552324	a
594	585326	vg
595	585326	v
596	585326	a
599	601839	vg
600	601839	v
601	601839	a
602	274260	v
603	274260	a
604	487319	vg
605	487319	v
606	487319	a
607	421980	v
608	421980	a
612	464827	v
613	464827	a
614	14280	v
615	14280	a
619	200703	a
620	98333	v
621	98333	a
622	761951	a
623	143481	a
624	762000	vg
625	762000	v
626	762000	a
627	762027	a
628	479421	v
629	479421	a
630	762068	vg
631	762068	v
632	762068	a
636	522588	v
637	522588	a
638	758140	vg
639	758140	v
640	758140	a
642	272831	a
643	18964	a
644	143917	vg
645	143917	v
646	143917	a
647	516679	a
650	119382	vg
651	119382	v
652	119382	a
653	660067	a
654	307838	vg
655	307838	v
656	307838	a
657	27284	vg
658	27284	v
659	27284	a
663	424601	vg
664	424601	v
665	424601	a
666	262853	vg
667	262853	v
668	262853	a
670	109385	vg
671	109385	v
672	109385	a
674	35720	v
675	35720	a
676	775115	vg
677	775115	v
678	775115	a
679	635867	a
680	439251	v
681	439251	a
682	15357	vg
683	15357	v
684	15357	a
685	488479	v
686	488479	a
687	521296	a
688	23652	a
689	107681	a
693	662709	vg
694	662709	v
695	662709	a
697	11532	vg
698	11532	v
699	11532	a
701	619918	vg
702	619918	v
703	619918	a
704	761276	a
705	13784	v
706	13784	a
709	624139	vg
710	624139	v
711	624139	a
712	104004	a
713	9912	vg
714	9912	v
715	9912	a
716	200490	v
717	200490	a
719	186233	vg
720	186233	v
721	186233	a
722	202644	vg
723	202644	v
724	202644	a
725	581520	a
726	143258	vg
727	143258	v
728	143258	a
729	759701	a
730	470980	a
731	18383	vg
732	18383	v
733	18383	a
734	100488	vg
735	100488	v
736	100488	a
739	116905	a
743	553182	v
744	553182	a
751	143648	a
757	35239	a
758	586184	vg
759	586184	v
760	586184	a
761	553501	a
762	207384	vg
763	207384	v
764	207384	a
765	227975	a
766	758431	vg
767	758431	v
768	758431	a
769	15054	vg
770	15054	v
771	15054	a
772	545511	vg
773	545511	v
774	545511	a
775	201600	a
776	95142	vg
777	95142	v
778	95142	a
782	617466	v
783	617466	a
784	568328	vg
785	568328	v
786	568328	a
787	281631	a
788	23654	a
789	760928	vg
790	760928	v
791	760928	a
792	654460	a
796	648462	vg
797	648462	v
798	648462	a
799	771447	a
800	666997	a
801	478609	vg
802	478609	v
803	478609	a
804	624016	a
805	497065	vg
806	497065	v
807	497065	a
808	761281	a
809	761284	a
810	529889	vg
811	529889	v
812	529889	a
\.


--
-- Name: recipe_diets_recipe_diet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('recipe_diets_recipe_diet_id_seq', 812, true);


--
-- Data for Name: recipe_ingredients; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY recipe_ingredients (recipe_ingredient_id, recipe_id, ingredient_id, measurement_amount, measurement_unit) FROM stdin;
1	74225	1	2	
2	74225	2	1	cup
3	74225	3	2	Tbsps
4	74225	4	6	servings
5	74225	5	0.25	tsp
6	74225	6	5	ozs
7	74225	7	4	lb
8	74225	8	0.25	tsp
9	74225	9	0.75	cup
10	74249	3	3	Tbsps
11	74249	10	2	lbs
12	74249	11	3	lb
13	74249	12	1	lb
14	74249	13	2	cups
15	74249	14	0.333333333333333315	cup
16	74249	15	1	Tbsp
17	74249	16	1	Tbsp
18	74249	8	0.25	tsp
29	74407	17	0.25	cup
30	74407	25	2	
31	74407	2	0.5	cup
32	74407	4	4	servings
33	74407	26	8	
34	74407	7	2	pound
35	74407	27	4	
36	74407	28	4	servings
37	25369	29	400	g
38	25369	30	300	ml
39	25369	31	1	sprig
40	25369	32	1	tbs
41	25369	7	1	
42	25369	33	1	tbs
43	25369	34	3	servings
44	172864	35	0.25	cup
45	172864	36	1	
46	172864	37	6	
47	172864	11	4	lb
48	172864	38	8	oz
49	172864	39	1	cup
50	172864	15	0.25	teaspoon
51	172864	8	0.5	teaspoon
52	189301	17	1	tablespoon
53	189301	40	0.25	cup
54	189301	2	0.25	cup
55	189301	41	0.333333333333333315	cup
56	189301	42	1	tablespoon
57	189301	43	2	
58	418827	19	0.5	teaspoon
59	418827	21	0.25	cup
60	418827	44	2	tablespoons
61	418827	45	2	cups
62	418827	46	1	cups
63	418827	47	1	teaspoon
64	418827	7	3	pounds
65	418827	48	6	servings
66	418827	8	1	teaspoon
67	418827	49	1	cup
68	164950	50	1	cup
69	164950	51	10.75	ounces
70	164950	7	1	cup
71	164950	49	0.333333333333333315	cup
72	164950	52	1	cup
73	615508	36	1	
74	615508	7	4	pound
75	615508	53	4	cloves
76	615508	54	3	sprigs
77	615508	33	4	Tablespoons
78	115813	55	0.25	cup
79	115813	53	1	head
80	115813	7	3.5	lb
81	115813	56	4	oz
82	115813	57	1	lb
83	42099	17	5	tablespoons
84	42099	58	3	tablespoons
85	42099	42	3	tablespoons
86	42099	59	2	
87	42099	60	3	
88	42099	7	4.5	pound
89	42099	61	4	servings
99	484691	65	6	servings
100	484691	19	6	servings
101	484691	66	0.5	Cup
102	484691	67	16	Ounce
103	484691	68	12	Ounce
104	484691	7	1	
105	443795	45	1	cup
106	443795	69	3	
107	443795	70	1	
108	443795	22	2	tablespoons
109	443795	71	1	cup
110	443795	72	4	tablespoons
111	443795	7	3	pounds
112	443795	9	4	
125	649072	65	0.25	teaspoon
126	649072	19	0.25	teaspoon
127	649072	77	3	tablespoons
128	649072	58	2	teaspoons
129	649072	22	2	tbsp
130	649072	42	3	tablespoons
131	649072	7	1	
132	649072	78	6	servings
133	706454	17	1	tablespoon
134	706454	79	2	teaspoons
135	706454	11	4	pound
136	706454	80	2	cups
137	706454	81	12	ounce
138	706454	5	0.5	teaspoon
139	706454	82	2	teaspoons
140	706454	61	0.75	teaspoon
141	706454	83	1	teaspoon
142	526278	35	2	Tbsp
143	526278	19	3	servings
144	526278	84	3	servings
145	526278	58	3	slices
146	526278	85	2	stalks
147	526278	86	0.5	Tbsp
148	526278	87	2	tsp
149	526278	7	0.5	
150	526278	8	3	servings
151	526548	88	1	package
152	526548	45	3	
153	526548	46	1	cup
154	526548	89	10.5	ounces
155	526548	51	1	can
156	526548	7	4	pieces
157	477720	17	6	servings
158	477720	36	1	
159	477720	11	5	pound
160	477720	4	6	servings
161	477720	53	4	cloves
162	477720	27	3	sprigs
163	477720	54	3	sprigs
164	125529	19	0.25	teaspoon
165	125529	77	4	tablespoons
166	125529	70	1	
167	125529	90	2	lbs
168	125529	43	3	lbs
169	125529	8	0.5	teaspoon
170	125529	45	6	servings
171	125529	91	2	
172	125529	92	2	
173	649827	93	4	servings
174	649827	17	4	servings
175	649827	94	1	bunch
176	649827	95	6	
177	649827	11	1	kilogram
178	649827	4	4	servings
179	649827	96	1	
180	494248	45	250	ml
181	494248	84	4	servings
182	494248	97	4	servings
183	494248	98	2	tbsps
184	494248	22	4	servings
185	494248	99	2	drops
186	494248	100	2	
187	494248	53	2	cloves
188	494248	101	2	tbsps
189	494248	7	500	g
190	494248	102	400	g
191	494248	15	1	tbsp
192	494248	103	1	tbsp
193	84694	104	1	tablespoon
194	84694	17	2	tablespoons
195	84694	105	1	
196	84694	106	1	
197	84694	107	0.25	cup
198	84694	7	1	pound
199	43883	19	1	serving
200	43883	108	1	tbsp
201	43883	109	1	tbsp
202	43883	110	1	tbsp
203	43883	11	1	serving
204	43883	111	1	tsp
205	43883	8	1	serving
206	43883	112	1	serving
207	510892	113	4	servings
208	510892	7	1	lbs
209	510892	66	0.25	cup
210	510892	114	0.333333333333333315	cup
211	510892	115	8	oz
212	707663	17	1	tablespoon
213	707663	116	1	ounce
214	707663	43	7	pound
215	707663	45	0.75	cup
216	707663	5	2	teaspoons
217	707663	53	6	cloves
218	707663	60	2	
219	707663	117	8	
220	707663	61	1	teaspoon
221	167036	65	0.5	teaspoon
222	167036	19	0.5	teaspoon
223	167036	118	0.5	teaspoon
224	167036	11	4	lb
225	167036	119	1	tablespoon
226	167036	81	12	oz
227	167036	8	2	teaspoons
228	601217	21	2	cups
229	601217	120	2	tablespoons
230	601217	4	6	servings
231	601217	119	0.25	teaspoon
232	601217	81	2	cups
233	601217	7	1	
234	601217	121	0.25	teaspoon
235	601217	122	0.25	teaspoon
236	535745	17	2	tbsp
237	535745	123	4	slices
238	535745	21	4	servings
239	535745	124	1	
240	535745	4	4	servings
241	535745	125	4	slices
242	535745	126	4	servings
243	535745	7	1	lb
244	290013	17	4	servings
245	290013	40	1	cup
246	290013	127	2	tablespoons
247	290013	128	4	
248	290013	43	6	pound
249	290013	61	4	servings
250	290013	73	1	teaspoon
251	511195	17	2	tbsp
252	511195	40	1	tsp
253	511195	37	1	lbs
254	511195	55	3	tbsp
255	511195	7	1	lbs
256	511195	129	2	tsp
257	478432	35	2	tbsps
258	478432	130	4	servings
259	478432	70	1	
260	478432	53	4	cloves
261	478432	7	750	g
262	478432	131	1	c
263	478432	9	2	
264	445704	132	0.5	cup
265	445704	133	1	tablespoon
266	445704	7	3	pounds
267	445704	37	1	pound
268	445704	113	0.5	cup
269	519514	134	1	tsp
270	519514	135	2	tsp
271	519514	136	10	
272	519514	137	0.75	c
273	519514	138	1	c
274	519514	16	2	tsp
275	519514	7	1	
276	20418	139	9	servings
277	20418	140	50	g
278	20418	4	9	servings
279	20418	141	200	g
280	20418	7	4	
281	20418	142	150	g
282	159714	143	0.333333333333333315	cup
283	159714	51	10.75	oz
284	159714	7	1	cup
285	159714	52	1	cup
286	159714	50	1	cup
287	200784	17	4	servings
288	200784	94	1	bunch
289	200784	144	4	
290	200784	81	16	ounce
291	200784	53	7	cloves
292	200784	7	5	pound
293	200784	61	4	servings
294	274643	93	2	Tbsp
295	274643	113	0.25	cup
296	274643	19	1	Dash
297	274643	21	0.333333333333333315	cup
298	274643	8	1	tsp
299	274643	45	2	Tbsp
300	274643	7	3	lb
301	274643	145	0.5	cup
302	274643	146	1	
303	749952	147	0.25	cup
304	749952	7	6	servings
305	749952	148	1	
306	749952	149	0.25	cup
307	749952	150	1	cup
315	471483	10	0.25	cup
316	471483	4	4	servings
317	471483	153	0.25	cup
318	471483	154	0.25	cup
319	471483	155	3	tablespoons
320	471483	7	2	cups
321	160342	134	0.5	teaspoon
322	160342	19	1	teaspoon
323	160342	119	1	teaspoon
324	160342	156	2	cups
325	160342	157	6.5	oz
326	160342	158	2	oz
327	160342	7	3	lb
328	160342	15	0.125	teaspoon
329	496462	132	2	tbsp
330	496462	159	2	
331	496462	4	4	servings
332	496462	160	3	
333	496462	161	1	
334	496462	7	8	oz
335	611209	17	2	tablespoons
336	611209	19	0.5	teaspoon
337	611209	36	1	
338	611209	91	1	lb
339	611209	11	4	lb
340	611209	162	2	tablespoons
341	611209	53	2	cloves
342	611209	61	1	Dash
343	521148	19	4	servings
344	521148	70	0.5	
345	521148	53	2	cloves
346	521148	163	250	g
347	521148	7	4	servings
348	521148	146	1	
354	521279	35	2	tbsps
355	521279	130	4	servings
356	521279	70	1	
357	521279	53	4	cloves
358	521279	7	750	g
359	521279	131	1	c
360	521279	9	2	
361	537708	168	1	
362	537708	169	2	
363	537708	7	1	serving
364	537708	135	1	serving
365	537708	170	1	serving
366	365791	7	1	cup
367	365791	171	2	tablespoons
368	365791	172	1	
369	365791	173	1	cup
370	365791	174	1	cup
371	136486	42	0.25	cup
372	136486	7	1	
373	136486	33	0.25	cup
374	136486	175	1	teaspoon
375	136486	176	0.25	teaspoon
376	292273	55	0.25	cup
377	292273	53	1	head
378	292273	7	3.5	pound
379	292273	56	4	ounces
380	292273	177	1	pound
381	382457	178	1	
382	382457	179	7	
383	382457	31	1	sprig
384	382457	11	1	
385	382457	180	3	tablespoons
386	382457	177	1	
387	136838	181	2	lbs
388	136838	1	4	
389	136838	43	5	lbs
390	136838	17	0.25	cup
391	136838	151	5	tablespoons
392	136838	54	2	sprigs
393	136838	34	4	servings
402	489236	137	1	cup
403	489236	7	1	pounds
404	489236	184	1	
405	489236	185	6	tablespoons
406	489236	186	1	
407	530277	93	1	tbsp
408	530277	17	1	tbsp
409	530277	187	1.5	tsp
410	530277	151	1	tbsp
411	530277	188	1.5	ounces
412	530277	7	3	pounds
413	530277	8	0.25	tsp
414	38830	1	10	
415	38830	19	1	tsp
416	38830	94	6	sprigs
417	38830	7	4	lbs
418	38830	177	2	
419	38830	182	2	tsps
420	38830	33	1	Tbsp
421	38840	17	0.25	cup
422	38840	43	2	
423	38840	187	1	tsp
424	38840	119	2	Tbsps
425	38840	53	8	heads
426	38840	182	4	servings
427	38840	189	6	
428	137151	190	2	cups
429	137151	191	2	cups
430	137151	7	2	cups
431	137151	192	8	ounces
432	137151	193	2	cups
433	38847	182	4	servings
434	38847	53	1	head
435	38847	11	4	lbs
436	38847	94	4	servings
437	38847	33	2	Tbsps
438	481242	4	4	servings
439	481242	194	4	servings
440	481242	195	4	servings
441	481242	196	1	pieces
442	481242	7	1	
443	481242	9	0.5	lb
444	276448	197	2	Tbsp
445	276448	118	1	tsp
446	276448	175	0.5	tsp
447	276448	15	0.5	tsp
448	276448	198	0.5	tsp
449	276448	7	3	lb
450	276448	82	0.5	cup
451	481250	17	4	servings
452	481250	21	4	servings
453	481250	124	3	
454	481250	11	1	
455	481250	4	4	servings
456	481250	53	1	cloves
457	481250	199	4	servings
458	481250	96	1	
459	481267	17	4	servings
460	481267	200	8	oz
461	481267	2	1	cup
462	481267	4	4	servings
463	481267	53	1	cloves
464	481267	7	1	
465	481267	54	1	sprig
466	137287	93	0.5	cup
467	137287	113	0.5	cup
468	137287	201	1	cup
469	137287	11	1	
470	137287	106	1	
471	137287	34	4	servings
472	96394	17	2	tablespoons
473	96394	149	1	tablespoon
474	96394	202	1	
475	96394	11	3.5	pounds
476	96394	182	4	servings
477	96394	203	0.75	pound
478	96394	76	1.5	pounds
479	359131	17	1	tablespoon
480	359131	70	1	
481	359131	204	1	tablespoon
482	359131	128	12	inch
483	359131	45	0.5	cup
484	359131	151	1	tablespoon
485	359131	15	4	servings
486	359131	8	4	servings
487	359131	7	3	pounds
488	580342	70	1	
489	580342	205	10	oz
490	580342	4	16	servings
491	580342	206	1	can
492	580342	7	2	cups
493	580342	207	2	packages
494	170862	208	8	8-inch
495	170862	7	1	cup
496	170862	209	4	oz
497	170862	210	6	oz
498	170862	24	0.333333333333333315	cup
499	220041	211	1	bunch
500	220041	212	2	tbsp
501	220041	7	1	
502	220041	213	2	
503	220041	1	3	
504	187337	41	1	tablespoon
505	187337	7	0.5	
506	187337	214	2	slices
507	187337	146	1	
508	187337	215	18	ounce
509	39977	17	2	tablespoons
510	39977	19	0.5	teaspoon
511	39977	25	40	oz
512	39977	216	16	servings
513	39977	7	4	lb
514	39977	8	1	teaspoon
515	39977	217	12	
516	39977	183	2	tablespoons
517	212044	35	2	tablespoons
518	212044	218	2	teaspoons
519	212044	219	2	
520	212044	220	1	tablespoon
521	212044	11	3.5	pounds
522	212044	22	1	tablespoon
523	212044	5	1	teaspoon
524	212044	53	1	clove
525	212044	182	1	teaspoon
526	212044	63	0.5	teaspoon
527	130140	221	2	tablespoons
528	130140	21	1	tablespoon
529	130140	31	1	bunch
530	130140	11	4.5	pounds
531	130140	45	0.25	cup
532	130140	222	1	can
533	130140	182	6	servings
534	130140	33	2	tablespoons
535	171114	93	1	tablespoon
536	171114	35	1	tablespoon
537	171114	223	1	lb
538	171114	224	1	cup
539	171114	45	1.33333333333333326	cups
540	171114	7	1	box
541	171114	49	1	tablespoon
542	113897	43	4.5	lb
543	113897	41	0.75	ounce
544	113897	63	0.5	teaspoon
545	113897	225	2	tablespoons
546	113897	57	8	
547	113897	186	2.5	cups
548	113897	182	1.5	teaspoons
549	113897	15	0.25	teaspoon
555	32316	17	1	Tbsp
556	32316	228	4	cups
557	32316	31	2	tsps
558	32316	11	4	lbs
559	32316	194	0.25	cup
560	32316	53	6	cloves
561	32316	182	4	servings
562	303132	17	4	servings
563	303132	1	16	
564	303132	229	4	servings
565	303132	230	0.5	cup
566	303132	231	2.25	pounds
567	303132	232	3	
568	303132	7	3.5	pound
569	303132	233	3	
570	139296	17	2	tablespoons
571	139296	70	1	
572	139296	102	12	ounces
573	139296	234	2	tablespoons
574	139296	235	4	oz
575	139296	26	6	
576	139296	5	4	servings
577	139296	7	3	cups
578	139296	8	0.5	teaspoon
579	286759	17	4	tablespoons
580	286759	236	2	
581	286759	237	1.5	tablespoons
582	286759	19	6	servings
583	286759	11	3.5	pound
584	286759	238	6	ounces
585	286759	53	1	head
586	286759	239	0.5	
587	286759	61	6	servings
588	172081	240	1	pieces
589	172081	114	8	oz
590	172081	208	6	8-inch
591	172081	26	6	servings
592	172081	7	1.5	cups
593	172081	78	6	servings
594	499805	241	8	servings
595	499805	166	0.5	
596	499805	242	0.5	cup
597	499805	202	0.25	cup
598	499805	11	1	
599	499805	63	1	tablespoon
600	499805	153	2	ribs
601	499805	34	8	servings
602	164057	93	2	tablespoons
603	164057	35	1	tablespoon
604	164057	223	1	lb
605	164057	243	1	cup
606	164057	114	1	oz
607	164057	45	1.33333333333333326	cups
608	164057	7	1	box
609	164057	49	1	tablespoon
610	172277	244	0.25	cup
611	172277	245	1	box
612	172277	246	0.75	cup
613	172277	153	0.5	cup
614	172277	247	0.5	cup
615	172277	7	1.5	cups
616	164108	35	2	tablespoons
617	164108	19	0.5	teaspoon
618	164108	166	0.25	cup
619	164108	70	0.5	cup
620	164108	248	0.25	cup
621	164108	45	1	cup
622	164108	249	0.25	cup
623	164108	7	10.5	pound
624	164108	8	0.75	teaspoon
625	164108	15	0.5	teaspoon
626	164108	250	0.333333333333333315	cup
634	115016	93	3	tablespoons
635	115016	36	1	
636	115016	20	1	lb
637	115016	31	6	sprigs
638	115016	43	3	lb
639	115016	231	1.5	lbs
640	115016	182	4	servings
641	434643	19	0.125	teaspoon
642	434643	255	1	teaspoon
643	434643	256	1	teaspoon
644	434643	45	0.75	cup
645	434643	257	0.25	teaspoon
646	434643	258	1	teaspoons
647	434643	7	5	ounces
648	434643	259	2	tablespoons
649	442901	35	1	teaspoon
650	442901	114	1.5	cups
651	442901	260	14.5	ounce
652	442901	261	16	ounce
653	442901	7	1	pound
654	442901	262	9	
655	442901	49	1	cup
656	74262	17	3	Tbsps
657	74262	263	2	Tbsps
658	74262	11	3.5	lbs
659	74262	162	0.5	cup
660	74262	264	2	
661	74262	265	2	
662	74262	57	4	
663	74262	182	4	servings
664	16996	266	1	teaspoon
665	16996	17	2	tablespoons
666	16996	40	2	tablespoons
667	16996	1	4	
668	16996	2	2	tablespoons
669	16996	22	1	tablespoon
670	16996	7	4	pound
671	16996	8	0.5	teaspoon
672	16996	267	1	teaspoon
673	410262	17	1	tablespoon
674	410262	37	1	pounds
675	410262	187	0.5	teaspoon
676	410262	45	0.5	cup
677	410262	268	1	cup
678	410262	7	1	teaspoon
679	410262	177	1	cups
680	410262	9	1	cup
681	74391	269	0.5	cup
682	74391	35	0.25	cup
683	74391	19	1	teaspoon
684	74391	270	24	oz
685	74391	43	6	lb
686	74391	53	2	teaspoons
687	74391	271	1	sprigs
688	74391	8	1	tablespoon
689	74391	54	1	tablespoon
690	598746	17	2	tablespoons
691	598746	2	0.5	cup
692	598746	272	0.5	cup
693	598746	273	4	cups
694	598746	45	2	cups
695	598746	5	1	teaspoon
696	598746	53	5	cloves
697	598746	175	1	teaspoon
698	598746	274	6	ounce
699	598746	7	2.5	pound
700	598746	61	2	teaspoons
701	522193	275	150	g
702	522193	276	2	tbsps
703	522193	70	1	
704	522193	277	1	bunch
705	522193	278	1	pinch
706	522193	58	1	tbsp
707	522193	22	3	servings
708	522193	130	1	tsp
709	522193	279	2	
710	522193	280	3	servings
711	522193	281	12	
712	417788	282	3	
713	417788	283	1	cup
714	417788	202	1	
715	417788	275	2	cups
716	417788	235	0.25	cup
717	417788	284	0.25	cup
718	417788	285	4	
719	116737	1	2	
720	116737	19	0.5	teaspoon
721	116737	8	1	teaspoon
722	116737	286	500	g
723	116737	201	150	g
724	116737	287	0.5	teaspoon
725	116737	275	200	g
726	116737	146	1	
727	116737	288	200	g
728	116737	289	150	g
729	565284	290	2	
730	565284	275	200	g
731	565284	84	1	tsp
732	565284	97	1	tbsp
733	565284	291	3	servings
734	565284	292	0.5	tsp
735	565284	58	4	slices
736	565284	99	1	tsp
737	565284	100	2	stalks
738	565284	53	3	cloves
739	565284	45	40	ml
740	565284	293	0.5	tsp
741	565284	294	1	tbsp
742	602196	275	1	pound
743	602196	295	2	cloves
744	602196	10	3	
745	602196	58	1	piece
746	602196	296	6	
747	602196	297	1	
748	602196	298	2	
749	602196	8	8	servings
750	602196	9	2	
751	290906	299	2	cups
752	290906	275	4	ounces
753	290906	300	1	
754	290906	4	6	servings
755	290906	45	5	cups
756	290906	53	3	cloves
757	290906	301	2	slices
758	290906	302	1	
759	290906	303	1	
760	290906	304	0.66666666666666663	cup
761	608393	93	2	tbsps
762	608393	305	0.5	tbsp
763	608393	275	0.5	
764	608393	306	2	c
765	608393	70	0.5	c
766	608393	21	1	c
767	608393	204	1	tbsp
768	608393	307	0.25	c
769	608393	4	3	servings
770	608393	308	0.5	tsp
771	37069	309	0.25	cup
772	37069	275	2	fillet
773	37069	310	150	g
774	37069	147	4	servings
775	37069	22	2	Tbsps
776	37069	99	2	tsps
777	37069	151	2	Tbsps
778	37069	311	250	g
779	37069	72	2	tsps
780	37069	312	1	
781	37069	313	4	servings
782	37069	314	1	Tbsp
794	16665	1	3	
795	16665	275	3	cups
796	16665	220	3	Tbs
797	16665	44	2	Tbs
798	16665	317	1	cup
799	16665	22	0.25	cup
800	16665	318	8	
801	16665	319	1	
802	16665	320	0.5	cup
803	16665	63	2	Tbs
804	16665	321	1	
805	211275	93	25	g
806	211275	275	500	g
807	211275	322	2	tbsp
808	211275	40	1	tbsp
809	211275	323	1	tbsp
810	211275	194	300	ml
811	211275	324	2	tbsp
812	211275	325	20	
813	211275	326	200	ml
814	82263	93	40	g
815	82263	327	3	
816	82263	275	1	fillet
817	82263	128	2	Tbsps
818	82263	278	1	tsp
819	82263	17	60	ml
820	82263	151	2	tsps
821	82263	38	200	g
822	82263	83	1	tsp
823	82262	290	1	
824	82262	275	1.69999999999999996	g
825	82262	328	4	
826	82262	58	50	g
827	82262	86	250	ml
828	82262	53	4	cloves
829	82262	82	90	g
830	82262	329	1	tsp
831	82262	330	0.5	cup
832	522587	93	2	tbsps
833	522587	275	1.5	c
834	522587	331	1	
835	522587	306	6	c
836	522587	70	1	
837	522587	191	1	
838	522587	332	1	handful
839	522587	4	4	servings
840	522587	333	2	c
841	598373	17	1	teaspoon
842	598373	334	1	
843	598373	275	1	cup
844	598373	16	4	servings
845	598373	217	4	
846	598373	335	0.25	cup
847	598373	213	1	
848	598373	336	4	servings
849	598373	53	1	clove
850	598373	85	1	
851	215410	17	1	tbsp
852	215410	275	420	g
853	215410	322	2	tbsp
854	215410	102	300	g
855	215410	337	100	g
856	215410	196	1	bunch
857	215410	55	2	tsp
858	215410	106	1	
859	215410	146	1	
860	215410	9	2	
878	520701	275	1	
879	520701	347	4	servings
880	520701	276	1	tbsp
881	520701	70	1	
882	520701	348	1	tbsp
883	520701	349	0.25	c
884	520701	53	6	cloves
885	520701	328	2	
886	520701	293	0.25	c
887	520803	275	200	grams
888	520803	70	1	
889	520803	97	2	tbsps
890	520803	350	234	g
891	520803	351	0.5	tsp
892	520803	130	1	tbsp
893	520803	53	2	cloves
894	520803	352	2	tsps
895	520803	186	234	g
896	246381	45	0.75	cup
897	246381	275	250	g
898	246381	84	1	tbs
899	246381	8	0.25	tsp
900	246381	353	150	g
901	246381	63	2	servings
902	246381	99	2	servings
903	246381	354	1	tbs
904	246381	53	3	cloves
905	246381	111	0.25	tsp
906	246381	146	1	tube
907	246381	330	2	servings
908	367226	355	6	ounces
909	367226	275	8	ounces
910	367226	124	2	
911	367226	56	8	ounces
912	367226	4	10	servings
913	367226	356	10	tablespoons
914	367226	53	1	clove
915	367226	57	3	
916	367226	357	2	tablespoons
917	367226	358	1	pound
918	17057	93	1	tablespoon
919	17057	35	1	tablespoon
920	17057	275	24	ounce
921	17057	21	2	tablespoons
922	17057	66	0.5	cup
923	17057	359	2	
924	17057	61	1	tablespoon
925	17057	360	2	tablespoons
926	17057	5	1	teaspoon
927	17057	48	0.25	cup
928	17057	361	2	tablespoons
929	17057	83	1	teaspoon
930	213670	362	200	g
931	213670	35	1	tbsp
932	213670	275	400	g
933	213670	363	2	tbsp
934	213670	364	1	tbsp
935	213670	365	3	
936	213670	366	400	g
937	213670	367	1	tsp
938	213670	186	0.5	
939	522969	79	1	tsp
940	522969	275	150	g
941	522969	368	2	
942	522969	70	1	
943	522969	119	1	tsp
944	522969	53	1	tsp
945	522969	186	1	c
946	522969	369	2	servings
947	522969	8	1	tsp
948	522969	276	2	tbsps
949	146293	1	4	
950	146293	275	3	lbs
951	146293	370	1	tablespoon
952	146293	97	2	tablespoons
953	146293	177	2	
954	146293	75	3	
955	146293	45	1	cup
956	146293	371	3	
957	146293	92	16	ounce
958	146293	83	1	tablespoon
959	484216	197	1	Tablespoon
960	484216	275	1	lbs
961	484216	92	1	Can
962	484216	66	0.5	Cup
963	484216	372	1	Can
964	484216	373	1	
965	484216	177	1	
966	484216	83	0.5	Teaspoon
967	484216	34	6	servings
982	447384	275	0.75	pound
983	447384	315	4	servings
984	447384	350	8	ounces
985	447384	379	4	servings
986	447384	44	1	tablespoon
987	447384	10	2	
988	447384	380	0.25	cup
989	447384	22	1	tablespoon
990	447384	268	4	servings
991	447384	106	1	
992	447384	63	1	teaspoon
993	478159	275	0.5	c
994	478159	315	4	c
995	478159	280	4	servings
996	478159	381	1	
997	478159	124	3	
998	478159	67	0.5	c
999	478159	4	4	servings
1000	478159	160	1	bunch
1001	478159	72	2	tbsps
1002	478159	382	0.5	c
1003	478159	330	2	tbsps
1004	521187	327	2	
1005	521187	383	1	bunch
1006	521187	384	1	
1007	521187	70	1	
1008	521187	97	2	tbsps
1009	521187	385	3	
1010	521187	275	700	g
1011	521187	130	4	servings
1012	521187	53	4	cloves
1013	521187	131	100	g
1014	521187	9	2	
1015	478227	327	2	
1016	478227	383	1	bunch
1017	478227	384	1	
1018	478227	70	1	
1019	478227	97	2	tbsps
1020	478227	385	3	
1021	478227	275	700	g
1022	478227	130	4	servings
1023	478227	53	4	cloves
1024	478227	131	100	g
1025	478227	9	2	
1026	640050	211	1	bunch
1027	640050	19	1	pinch
1028	640050	386	0.5	teaspoon
1029	640050	70	1	
1030	640050	10	0.25	cup
1031	640050	387	4	
1032	640050	275	300	grams
1033	640050	22	2	teaspoons
1034	640050	86	1	teaspoon
1035	640050	53	2	cloves
1036	640050	63	1	pinch
1037	595029	275	3	tablespoons
1038	595029	70	1.5	cups
1039	595029	388	3	cups
1040	595029	10	1.5	cups
1041	595029	46	2	cups
1042	595029	389	0.25	pound
1043	595029	5	0.5	teaspoon
1044	595029	53	1	tablespoon
1045	595029	274	2	tablespoons
1046	595029	8	8	servings
1047	595029	3	3	tablespoons
1048	136287	19	0.5	teaspoon
1049	136287	390	2	lbs
1050	136287	70	1	
1051	136287	391	1.5	lbs
1052	136287	392	3	tablespoons
1053	136287	393	0.25	teaspoon
1054	136287	199	0.25	teaspoon
1055	136287	394	1	pint
1056	136287	275	1	lb
1057	136287	8	1.5	teaspoons
1058	523370	275	1	
1059	523370	395	2	tbsps
1060	523370	84	0.5	c
1061	523370	70	1	
1062	523370	97	2	tbsps
1063	523370	75	2	
1064	523370	348	12	
1065	523370	63	4	tbsps
1066	523370	45	6	servings
1067	523370	280	0.5	tsp
1068	523370	328	2	
1069	523370	295	1	
1070	523370	150	1	tsp
1071	107643	275	1	lb
1072	107643	77	4	servings
1073	107643	8	1	teaspoon
1074	107643	396	0.5	cup
1075	107643	263	0.5	cup
1076	107643	397	14	ounce
1077	107643	380	0.5	cup
1078	107643	63	1	cup
1079	107643	354	2	tablespoons
1080	107643	69	2	
1081	107643	146	1	
1082	738558	35	2	tablespoons
1083	738558	275	6	ounces
1084	738558	398	1	head
1085	738558	399	14	servings
1086	738558	217	10	
1087	738558	400	1.5	cups
1088	738558	24	14	servings
1089	738558	169	14	servings
1090	738558	177	0.25	cup
1091	249076	19	0.25	teaspoon
1092	249076	70	1	
1093	249076	401	1	
1094	249076	275	1	pound
1095	249076	58	1	inch
1096	249076	22	0.5	cup
1097	249076	99	1	tablespoon
1098	249076	53	5	cloves
1099	249076	63	1	tablespoon
1100	249076	78	2	
1101	249076	402	1	
1102	249076	403	0.5	cup
1103	11563	93	30	g
1104	11563	17	1	Tbsp
1105	11563	275	3	fillet
1106	11563	224	100	g
1107	11563	91	1	kg
1108	11563	404	2	servings
1109	11563	405	1	Tbsp
1110	11563	406	200	g
1111	11563	407	2	servings
1112	11563	49	125	ml
1113	509280	275	0.5	cup
1114	509280	408	0.5	
1115	509280	90	1	
1116	509280	409	2	tablespoons
1117	509280	410	0.5	teaspoon
1118	509280	4	1	serving
1119	509280	213	0.5	
1120	509280	411	0.25	
1121	509280	106	1	
1122	509280	146	1	
1123	583101	275	2	lb
1124	583101	346	8	servings
1125	583101	8	2	tsp
1126	583101	75	2	
1127	583101	412	5	
1128	583101	153	1	stick
1129	583101	413	1	
1130	583101	348	5	
1131	583101	177	2	
1132	212453	414	3	
1133	212453	1	6	
1134	212453	275	500	g
1135	212453	415	1	tsp
1136	212453	94	1	pinch
1137	212453	270	1	l
1138	212453	416	6	servings
1139	212453	213	5	
1140	212453	17	4	tbsp
1141	212453	417	2	
1142	212453	314	85	g
1143	556537	93	1	T
1144	556537	418	2	slices
1145	556537	192	2	oz
1146	556537	70	2	
1147	556537	419	0.5	c
1148	556537	420	1	serving
1149	556537	275	3	oz
1150	556537	4	1	serving
1151	556537	421	0.25	c
1162	226838	426	1	cup
1163	226838	275	8	slices
1164	226838	286	8	slices
1165	226838	124	2	
1166	226838	49	1	tablespoon
1167	226838	4	4	servings
1168	226838	427	1	cup
1169	226838	428	2	tablespoons
1170	226838	22	1	cup
1171	226838	83	1	teaspoon
1172	226838	429	1	teaspoon
1182	521938	275	0.5	c
1183	521938	315	4	c
1184	521938	280	4	servings
1185	521938	381	1	
1186	521938	124	3	
1187	521938	67	0.5	c
1188	521938	4	4	servings
1189	521938	160	1	bunch
1190	521938	72	2	tbsps
1191	521938	382	0.5	c
1192	521938	330	2	tbsps
1193	564971	275	100	g
1194	564971	97	1	tbsp
1195	564971	292	0.5	tbsp
1196	564971	330	1	tsp
1197	564971	413	0.5	
1198	564971	53	4	cloves
1199	564971	433	100	g
1200	564971	288	200	g
1201	564971	294	1	tbsp
1202	347907	434	2	cups
1203	347907	275	10	servings
1204	347907	435	0.5	cup
1205	347907	8	1	tablespoon
1206	347907	391	5	pound
1207	347907	436	1.5	teaspoons
1208	347907	53	4	cloves
1209	347907	177	2	
1210	347907	83	1	tablespoon
1211	347907	437	1	cup
1235	124781	1	3	
1236	124781	275	4	
1237	124781	444	3	tablespoons
1238	124781	445	1	tablespoon
1239	124781	22	1.5	teaspoons
1240	124781	45	0.5	cup
1241	124781	186	0.25	cup
1242	124781	446	1	
1243	124781	155	0.5	cup
1244	124781	447	0.5	cup
1245	298934	299	30.3999999999999986	ounce
1246	298934	17	2	tablespoons
1247	298934	275	6	ounces
1248	298934	448	1	tablespoon
1249	298934	4	8	servings
1250	298934	208	8	
1251	298934	449	1	head
1252	298934	304	0.5	
1253	298934	450	0.5	cup
1267	143426	453	1	
1268	143426	1	2	
1269	143426	275	1	lb
1270	143426	77	2	tablespoons
1271	143426	454	2	tablespoons
1272	143426	70	1	
1273	143426	75	2	
1274	143426	455	0.5	cup
1275	143426	456	1	teaspoon
1276	143426	457	1	lb
1277	143426	15	1	teaspoon
1278	567366	275	200	g
1279	567366	70	0.25	
1280	567366	458	0.5	stalk
1281	567366	22	2	tsp
1282	567366	45	150	ml
1283	567366	349	1	tbsp
1284	567366	53	0.25	tsp
1285	567366	459	1	
1286	567366	460	2	
1287	567366	15	2	
1288	567366	403	1	tsp
1289	567366	461	2	
1290	567366	462	2	tsp
1299	36997	17	1	tsp
1300	36997	392	2	Tbsps
1301	36997	310	200	g
1302	36997	464	2	Tbsps
1303	36997	275	400	g
1304	36997	404	4	servings
1305	36997	63	1	tsp
1306	36997	45	2	Tbsps
1307	36997	151	2	tsps
1308	36997	38	200	g
1309	36997	53	1	clove
1310	36997	406	2	cups
1311	36997	407	4	servings
1324	145647	93	30	g
1325	145647	275	750	g
1326	145647	77	2	tablespoons
1327	145647	347	1	teaspoon
1328	145647	149	0.75	cup
1329	145647	70	1	
1330	145647	109	1	teaspoon
1331	145647	68	250	g
1332	145647	336	0.5	cup
1333	145647	54	1	teaspoon
1355	706967	453	1	cup
1356	706967	197	2	tablespoons
1357	706967	275	2	ounces
1358	706967	44	1.5	teaspoons
1359	706967	202	2	tablespoons
1360	706967	475	1	teaspoon
1361	706967	476	24	ounce
1362	706967	284	0.25	cup
1363	706967	5	0.25	teaspoon
1364	706967	477	0.25	teaspoon
1365	706967	169	0.5	cup
1366	706967	61	0.25	teaspoon
1367	647656	93	1	ounce
1368	647656	19	0.25	teaspoon
1369	647656	8	1	teaspoon
1370	647656	177	2	
1371	647656	275	5	ounces
1372	647656	119	1.5	teaspoons
1373	647656	478	1	pinch
1374	647656	413	1	piece
1375	647656	336	0.5	pint
1376	647656	92	16	ozs
1377	647656	479	4	ounces
1378	647656	268	1	piece
1379	551453	480	1	serving
1380	551453	481	0.25	tsp
1381	551453	482	0.5	
1382	551453	483	1	pinch
1383	551453	484	0.25	tsp
1384	551453	485	2	
1385	551453	275	100	g
1386	551453	486	0.25	cup
1387	551453	487	3	tbsp
1388	551453	409	1	tsp
1389	551453	488	0.5	cup
1402	492226	93	1	tablespoons
1403	492226	470	12	ounces
1404	492226	94	1	teaspoon
1405	492226	70	1	cup
1406	492226	471	8	ounces
1407	492226	66	2	cups
1408	492226	472	0.333333333333333315	cup
1409	492226	4	8	servings
1410	492226	153	1	cup
1411	492226	285	1	
1412	246503	275	300	g
1413	246503	70	1	
1414	246503	493	1	
1415	246503	292	1	tbs
1416	246503	213	1	
1417	246503	42	3	tbs
1418	246503	53	1	
1419	246503	494	1	stalk
1420	246503	8	0.25	tsp
1421	246503	495	0.5	
1422	146280	17	3	tablespoons
1423	146280	1	3	
1424	146280	275	2	cups
1425	146280	70	1	
1426	146280	91	1.75	lbs
1427	146280	287	2	teaspoons
1428	146280	8	0.75	teaspoon
1429	146280	160	3	
1430	146280	45	1.5	cups
1431	146280	496	3	tablespoons
1432	146280	497	0.25	teaspoon
1433	146280	146	1	
1434	437120	1	2	
1435	437120	29	4	cups
1436	437120	70	2	cups
1437	437120	44	2	tablespoons
1438	437120	10	2	cups
1439	437120	200	3	cups
1440	437120	19	0.5	teaspoon
1441	437120	498	2	teaspoons
1442	437120	499	8	servings
1443	437120	275	2	pounds
1444	437120	500	28	ounces
1445	437120	8	1	teaspoon
1457	588717	93	4	tbsp
1458	588717	502	2	
1459	588717	275	8	ounces
1460	588717	454	2	tsp
1461	588717	409	1	tsp
1462	588717	387	2	
1463	588717	45	1	tbsp
1464	588717	151	1	tbsp
1465	588717	5	2	servings
1466	588717	16	2	servings
1467	588717	503	4	
1468	588717	124	4	
1469	588717	504	1	tsp
1506	146476	35	3	tablespoons
1507	146476	1	4	
1508	146476	19	2	teaspoons
1509	146476	512	1	
1510	146476	179	2	teaspoons
1511	146476	31	2	tablespoons
1512	146476	275	24	ounces
1513	146476	119	1	tablespoon
1514	146476	199	0.25	teaspoon
1515	146476	175	0.25	teaspoon
1516	146476	8	0.5	teaspoon
1517	146476	83	1	teaspoon
1518	214135	17	3	tbsp
1519	214135	1	2	
1520	214135	275	900	g
1521	214135	2	200	ml
1522	214135	30	200	ml
1523	214135	10	2	
1524	214135	22	2	tsp
1525	214135	513	6	servings
1526	214135	417	1	
1527	214135	27	1	sprig
1528	214135	288	3	
1529	144528	17	1	tablespoon
1530	144528	197	2	tablespoons
1531	144528	275	2	cups
1532	144528	514	1	tablespoon
1533	144528	253	15	ounce
1534	144528	515	1.5	cups
1535	144528	366	15	ounce
1536	144528	4	6	servings
1537	144528	284	0.25	cup
1538	144528	411	1	
1539	144528	92	15	ounce
1540	226536	17	0.25	cup
1541	226536	19	1	tablespoon
1542	226536	116	2	tablespoons
1543	226536	275	7	pound
1544	226536	516	12	servings
1545	226536	186	1	
1546	226536	16	1	tablespoon
1547	226536	54	2	tablespoons
1548	582904	17	3	tbsp
1549	582904	275	1	lb
1550	582904	300	1	
1551	582904	70	1	
1552	582904	517	0.25	cup
1553	582904	22	1	tbsp
1554	582904	518	1	cup
1555	582904	53	3	cloves
1556	582904	519	1	cup
1557	582904	400	3	lb
1558	582904	8	0.5	tbsp
1559	582904	520	1	tbsp
1560	568618	521	2	cups
1561	568618	275	1.5	pound
1562	568618	300	1	
1563	568618	70	0.5	
1564	568618	31	0.5	teaspoon
1565	568618	292	1	tablespoon
1566	568618	4	4	servings
1567	568618	522	0.5	pound
1568	568618	274	1	tablespoon
1569	568618	53	3	cloves
1570	568618	92	14.5	oz
1571	433475	35	1	tablespoon
1572	433475	275	0.5	pound
1573	433475	454	3	tablespoons
1574	433475	523	0.25	cup
1575	433475	315	2	servings
1576	433475	350	8	ounces
1577	433475	22	1	tablespoon
1578	433475	45	2	tablespoons
1579	433475	354	4	teaspoons
1580	433475	106	1	
1581	433475	446	1	
1582	433475	447	1	tablespoon
1583	243067	275	1	cup
1584	243067	10	0.25	cup
1585	243067	317	1	leaves
1586	243067	292	1	teaspoon
1587	243067	524	18	inch
1588	243067	249	1	teaspoon
1589	243067	525	1	slices
1590	243067	526	3	tablespoons
1591	243067	177	0.333333333333333315	cup
1614	564983	211	2	servings
1615	564983	534	0.5	cup
1616	564983	19	1	dashes
1617	564983	8	1	tsp
1618	564983	84	0.5	tsp
1619	564983	70	0.5	
1620	564983	97	1	tbsp
1621	564983	535	0.5	tbsp
1622	564983	536	1	
1623	564983	291	2	servings
1624	564983	275	80	grams
1625	564983	22	2	servings
1626	564983	99	1	tsp
1627	564983	53	4	cloves
1628	564983	45	1	cup
1629	564983	293	0.5	tbsp
1630	564983	294	1	tsp
1631	212766	211	1	bunch
1632	212766	275	750	g
1633	212766	537	1	
1634	212766	328	5	
1635	212766	538	2	tbsp
1636	212766	213	1	
1637	212766	32	3	tbsp
1638	212766	539	1	
1639	212766	540	4	servings
1640	212766	177	2	
1641	212766	541	2	tbsp
1665	745330	93	1	tablespoon
1666	745330	453	1	
1667	745330	471	8	slices
1668	745330	420	0.75	cup
1669	745330	546	4	
1670	745330	517	1	tablespoon
1671	745330	4	4	servings
1672	745330	35	4	servings
1673	745330	547	1	pinch
1674	745330	48	1	tablespoon
1675	745330	124	8	
1676	92100	275	1	lb
1677	92100	548	1	cup
1678	92100	97	2	tablespoons
1679	92100	549	1	teaspoon
1680	92100	550	0.25	cup
1681	92100	22	0.25	cup
1682	92100	45	0.5	cup
1683	92100	354	4	teaspoons
1684	92100	106	1	
1685	92100	406	2	cups
1686	92100	551	1	cup
1687	92100	78	2	tablespoons
1688	143357	35	2	tablespoons
1689	143357	275	1	lb
1690	143357	315	3	cups
1691	143357	149	0.5	cup
1692	143357	10	2	
1693	143357	22	2	tablespoons
1694	143357	153	2	rib
1695	143357	354	2	teaspoons
1696	143357	552	0.25	cup
1697	143357	148	1	tablespoon
1698	143357	63	2	teaspoons
1699	143357	152	0.125	teaspoon
1700	661533	17	2	tbs
1701	661533	275	4	
1702	661533	553	2	tbs
1703	661533	234	0.25	cup
1704	661533	109	4	tbs
1705	661533	278	4	servings
1706	661533	554	6	
1707	661533	5	0.25	tsp
1708	661533	555	12	
1709	661533	188	180	g
1710	661533	556	2	tbs
1711	661533	16	0.25	tsp
1712	661533	557	2	tbs
1725	526400	45	100	ml
1726	526400	19	2	servings
1727	526400	395	1	tsp
1728	526400	84	0.5	tsp
1729	526400	458	2	servings
1730	526400	560	2	Tbsp
1731	526400	98	0.5	tsp
1732	526400	275	100	gm
1733	526400	63	1	Tbsp
1734	526400	99	2	servings
1735	526400	86	0.5	tsp
1736	526400	561	2	
1737	526400	274	0.5	Tbsp
1738	526400	53	1	clove
1739	526400	8	2	servings
1740	526400	447	2	Tbsp
1741	526400	386	0.5	Tbsp
1742	102482	35	1	tablespoon
1743	102482	113	0.25	cup
1744	102482	135	4	servings
1745	102482	70	0.5	cup
1746	102482	283	1	cup
1747	102482	30	1	quart
1748	102482	543	1	
1749	102482	275	0.25	lb
1750	102482	562	3	tablespoons
1751	102482	563	1	
1752	102482	8	4	servings
1753	102482	564	1	cup
1754	118976	565	3	tablespoons
1755	118976	275	0.5	cup
1756	118976	77	1	tablespoon
1757	118976	84	2	tablespoons
1758	118976	566	0.5	teaspoon
1759	118976	124	2	
1760	118976	529	1	container
1761	118976	280	1	tablespoon
1762	118976	160	2	
1763	118976	68	4	
1764	118976	354	2	tablespoons
1765	118976	567	0.25	cup
1766	118976	438	0.5	cup
1767	118976	45	6	servings
1768	118976	8	0.5	teaspoon
1769	118976	30	6	cups
1770	567525	68	1	cup
1771	567525	275	0.75	pound
1772	567525	70	0.5	
1773	567525	568	10	ounce
1774	567525	386	1	teaspoon
1775	567525	22	2	tablespoons
1776	567525	340	1	teaspoon
1777	567525	53	2	cloves
1778	567525	72	1	tablespoon
1779	567525	99	1	teaspoon
1780	567525	569	2	teaspoons
1781	567525	78	3	
1782	567525	570	1	cup
1783	482250	571	3	ounces
1784	482250	572	1	
1785	482250	573	1	leaves
1786	482250	574	1	
1787	482250	575	2	tsp
1788	482250	576	1	slice
1789	482262	99	0.25	teaspoon
1790	482262	395	1	teaspoon
1791	482262	84	1	teaspoon
1792	482262	286	8	oz
1793	482262	97	2	tablespoons
1794	482262	577	1	bag
1795	482262	70	1	
1796	482262	22	2	tablespoons
1797	482262	340	0.5	tbsp
1798	482262	53	3	cloves
1799	482262	45	1	tablespoon
1800	482262	63	1	tablespoon
1801	482262	8	4	servings
1802	521179	93	2	tbsps
1803	521179	286	500	g
1804	521179	578	6	slices
1805	521179	579	3	servings
1806	521179	4	3	servings
1807	521179	526	2	tbsps
1808	521179	177	2	
1809	146420	580	0.25	teaspoon
1810	146420	581	0.25	teaspoon
1811	146420	454	0.66666666666666663	cup
1812	146420	286	1.5	lbs
1813	146420	8	1	teaspoon
1814	146420	15	0.5	teaspoon
1815	146420	582	3	teaspoons
1816	146420	583	1.5	lbs
1817	478210	84	3	tbsps
1818	478210	286	1	chunks
1819	478210	97	2	tbsps
1820	478210	584	1	c
1821	478210	585	2	tbsps
1822	478210	53	1	tbsp
1823	478210	586	0.5	tsp
1824	478210	468	3	c
1825	99336	19	0.125	teaspoon
1826	99336	571	0.5	lb
1827	99336	88	1	tablespoon
1828	99336	587	8	slices
1829	99336	588	4	servings
1830	99336	575	1	tablespoon
1831	99336	336	0.5	cup
1832	119918	589	4	
1833	119918	571	1	lb
1834	119918	464	4	teaspoons
1835	119918	125	4	slices
1836	119918	155	4	teaspoons
1837	119918	526	0.25	cup
1838	502923	35	1	tbsp
1839	502923	590	0.5	
1840	502923	286	12	
1841	502923	70	1	
1842	502923	536	4	servings
1843	502923	591	2	tsp
1844	502923	89	294	g
1845	502923	106	1	
1846	595148	35	4	servings
1847	595148	286	1.33333333333333326	cups
1848	595148	592	1	cup
1849	595148	593	4	servings
1850	595148	208	4	10-inch
1851	595148	138	1	cup
1852	595148	594	2	cups
1853	625898	595	1	tablespoon
1854	625898	286	1.5	pounds
1855	625898	70	1	
1856	625898	75	4	
1857	625898	68	1.5	pounds
1858	625898	413	1	
1859	625898	596	1.5	cups
1860	625898	8	15	servings
1869	267514	453	1	
1870	267514	19	0.125	tsp
1871	267514	571	16	slices
1872	267514	598	8	slices
1873	267514	242	0.25	cup
1874	267514	56	8	slices
1875	267514	599	2	cups
1876	288023	93	2	tablespoons
1877	288023	426	1	cup
1878	288023	600	1	teaspoon
1879	288023	286	0.5	pound
1880	288023	124	6	
1881	288023	4	6	servings
1882	288023	160	2	tablespoons
1883	288023	49	0.75	cup
1884	417110	601	2	slices
1885	417110	571	6	ounces
1886	417110	575	0.5	teaspoon
1887	417110	336	3	tablespoons
1888	417110	602	1	tablespoon
1889	417110	345	2	
1890	159122	45	2	cups
1891	159122	286	1	box
1892	159122	49	1	cup
1893	159122	68	4.5	oz
1894	159122	522	1.5	cups
1895	159122	257	1	tablespoon
1896	159122	603	1	lb
1897	265621	571	7	oz
1898	265621	70	0.5	
1899	265621	604	1	cup
1900	265621	605	6	
1901	265621	172	10	oz
1902	265621	446	0.5	
1903	42444	192	4	ozs
1904	42444	420	4	ozs
1905	42444	606	1	leaves
1906	42444	208	4	
1907	42444	575	2	Tbsps
1908	42444	571	8	ozs
1909	13964	17	19	servings
1910	13964	286	14	ozs
1911	13964	607	8	6-inch
1912	13964	235	8	ozs
1913	13964	608	3	
1914	13964	203	4	cups
1915	370332	286	1	
1916	370332	63	0.25	cup
1917	370332	235	1	package
1918	370332	609	4	
1919	370332	55	0.5	cup
1920	370332	212	3	tablespoons
1921	370332	610	1	cup
1922	81583	611	2	teaspoons
1923	81583	17	2	teaspoons
1924	81583	252	1.5	cups
1925	81583	571	1	pound
1926	81583	187	1	teaspoon
1927	81583	612	14.25	ounce
1928	81583	613	0.5	cup
1929	81583	345	12	ounce
1930	534220	17	1	tbsp
1931	534220	286	1	package
1932	534220	614	0.333333333333333315	cup
1933	534220	202	1	
1934	534220	55	1	tbsp
1935	534220	155	4	servings
1936	534220	8	4	servings
1937	534220	345	4	
1938	16164	17	2	tablespoons
1939	16164	286	1	cup
1940	16164	615	12	
1941	16164	4	6	servings
1942	16164	616	0.5	cup
1943	16164	57	4	
1944	16164	274	1	tablespoon
1945	16164	33	2	tablespoons
1946	42806	617	0.25	cup
1947	42806	571	1	oz
1948	42806	578	1	oz
1949	42806	202	0.25	inch
1950	42806	313	4	
1951	42806	618	4	
1952	522111	130	1	tsp
1953	522111	84	1	tsp
1954	522111	286	1	c
1955	522111	97	1	tbsp
1956	522111	529	1	
1957	522111	70	1	
1958	522111	63	1	tbsp
1959	522111	619	1	tbsp
1960	522111	406	1	bunch
1961	522111	96	2	
1962	597924	192	4	ounces
1963	597924	420	4	ounces
1964	597924	606	1	leaves
1965	597924	208	4	
1966	597924	575	2	tablespoons
1967	597924	571	8	ounces
1968	22448	17	1	tablespoon
1969	22448	286	20	ounce
1970	22448	68	4.5	ounce
1971	22448	561	12	ounce
1972	22448	411	1	
1973	22448	336	8	ounce
1974	22448	620	2.5	tablespoons
1975	22448	61	0.5	teaspoon
1976	128992	286	1	cup
1977	128992	621	0.5	cup
1978	128992	319	0.5	
1979	128992	172	9	inch
1980	128992	622	1.5	cups
1981	128992	155	0.66666666666666663	cup
1982	526315	395	2	tsp
1983	526315	84	2	tsp
1984	526315	286	500	gm
1985	526315	58	4	pieces
1986	526315	63	20	gm
1987	526315	45	4	cups
1988	526315	413	1	
1989	526315	623	900	gm
1990	526315	8	4	servings
1991	526315	330	2	tsp
1992	620572	45	12	cups
1993	620572	624	6	
1994	620572	286	2	pounds
1995	620572	90	2	
1996	620572	625	4	
1997	620572	4	8	servings
1998	620572	22	1	cup
1999	620572	284	0.5	cup
2000	620572	626	1	pound
2001	620572	583	1	pound
2002	227381	35	1	tablespoon
2003	227381	1	4	
2004	227381	70	0.5	cup
2005	227381	286	2	pounds
2006	227381	4	4	servings
2007	227381	160	2	
2008	227381	284	0.25	cup
2009	227381	81	0.5	cup
2010	227381	83	1	teaspoon
2011	112695	286	1	lb
2012	112695	592	16	ounces
2013	112695	627	16	ounce
2014	112695	208	16	8-inch
2015	112695	24	16	ounce
2016	112695	371	4	ounce
2017	112695	628	1.5	ounce
2028	395397	17	4	teaspoons
2029	395397	571	1	pound
2030	395397	360	1	tablespoon
2031	395397	13	2	cups
2032	395397	151	1	tablespoon
2033	395397	575	1	teaspoons
2034	395397	631	8	slices
2035	395397	632	2	cups
2036	321688	35	2	tablespoons
2037	321688	633	16	
2038	321688	286	2	pound
2039	321688	56	8	slices
2040	321688	19	4	servings
2041	321688	160	4	
2042	321688	634	0.5	cup
2043	321688	33	2	tablespoons
2044	321688	8	4	servings
2045	321688	635	0.75	cup
2046	782571	93	1	tablespoon
2047	782571	17	0.5	teaspoon
2048	782571	571	4	slices
2049	782571	70	1	
2050	782571	21	1	tablespoon
2051	782571	587	4	slices
2052	782571	4	2	servings
2053	782571	68	4	ounces
2054	782571	49	0.75	cup
2055	782571	210	0.333333333333333315	cup
2056	110879	35	3	tablespoons
2057	110879	1	2	
2058	110879	286	0.75	lb
2059	110879	636	2	tablespoons
2060	110879	146	1	
2061	110879	22	2	tablespoons
2062	110879	354	1	tablespoon
2063	110879	5	0.5	teaspoon
2064	110879	637	2.5	tablespoons
2065	110879	638	3	cups
2066	110879	330	0.25	cup
2067	172345	639	0.5	teaspoon
2068	172345	19	0.125	teaspoon
2069	172345	640	4	oz
2070	172345	286	1	box
2071	172345	70	0.5	cup
2072	172345	45	6	cups
2073	172345	53	2	cloves
2074	172345	48	2	tablespoons
2075	172345	8	0.5	teaspoon
2076	172345	603	1	lb
2094	336280	93	2	tablespoons
2095	336280	571	1.5	pounds
2096	336280	644	1	
2097	336280	21	1	tablespoon
2098	336280	645	4	
2099	336280	646	4	servings
2100	336280	647	1	
2101	336280	648	2	cans
2102	223667	17	2	tbsp
2103	223667	166	1	
2104	223667	286	200	g
2105	223667	58	4	servings
2106	223667	213	1	
2107	223667	649	250	g
2108	223667	650	0.5	
2109	223667	22	4	tbsp
2110	223667	651	1	handful
2111	172477	286	1	pound
2112	172477	602	3	ounces
2113	172477	652	1	cup
2114	172477	39	0.5	cup
2115	172477	271	10	ounces
2116	172477	653	11	ounces
2117	172477	654	0.5	cup
2118	385491	453	2	slices
2119	385491	571	3	slices
2120	385491	587	2	slices
2121	385491	655	2	teaspoons
2122	385491	656	1	tablespoon
2123	385491	632	1	
2124	385491	548	0.25	cup
2125	385499	17	1	tablespoon
2126	385499	1	2	
2127	385499	19	0.125	teaspoon
2128	385499	300	1	
2129	385499	70	1	
2130	385499	571	12	ounces
2131	385499	63	1	tablespoon
2132	385499	645	6	
2133	385499	446	1	
2134	385499	548	1	
2135	385499	8	0.5	teaspoon
2136	436742	617	3	tablespoons
2137	436742	17	1	tablespoon
2138	436742	571	1	pound
2139	436742	657	1	pound
2140	436742	45	1	cups
2141	436742	658	1	
2142	436742	659	0.5	cup
2143	436742	519	7	slices
2144	436742	446	1	
2145	416319	392	2	tablespoons
2146	416319	571	1	pounds
2147	416319	524	10	ounces
2148	416319	660	0.5	teaspoon
2149	416319	661	0.333333333333333315	cup
2150	416319	662	0.5	cup
2151	416319	575	1	tablespoon
2152	416319	8	0.25	teaspoon
2153	567923	17	2	tablespoons
2154	567923	663	15	ounce
2155	567923	664	8	ounce
2156	567923	286	1	pound
2157	567923	66	4	cups
2158	567923	70	0.5	
2159	567923	4	4	servings
2160	567923	53	2	cloves
2161	567923	452	0.5	teaspoon
2162	549495	93	4	servings
2163	549495	665	1	Packet
2164	549495	286	0.75	Cup
2165	549495	70	1	
2166	549495	4	4	servings
2167	549495	45	1	Cup
2168	549495	354	2	Tablespoons
2169	549495	666	1.5	lbs
2170	549495	345	4	servings
2171	572040	17	2	tablespoons
2172	572040	19	0.5	teaspoon
2173	572040	667	5	slices
2174	572040	668	12	ounce
2175	572040	8	1	teaspoon
2176	572040	6	18	
2177	572040	669	18	inch
2178	572040	646	0.5	tablespoon
2179	572040	576	5	slices
2180	572040	571	1	pounds
2181	572040	207	18	servings
2182	39607	670	1	Cup
2183	39607	286	0.5	lb
2184	39607	317	4	Tbsps
2185	39607	475	1	
2186	39607	671	1	
2187	39607	45	6	Cups
2188	39607	672	0.125	tsp
2189	39607	19	0.25	tsp
2190	39607	8	0.125	tsp
2191	39607	442	1	
2192	756524	93	4	tablespoons
2193	756524	286	8	
2194	756524	673	8	servings
2195	756524	202	2	
2196	756524	81	12	ounce
2197	756524	411	1	
2198	756524	345	8	
2199	365597	286	500	g
2200	365597	674	200	ml
2201	365597	70	1	
2202	365597	67	1	Handful
2203	365597	539	1	
2204	365597	9	400	g
2205	365597	122	4	TBSP
2206	52299	93	1	Tbsp
2207	52299	286	12	slices
2208	52299	517	1	Tbsp
2209	52299	675	0.5	
2210	52299	42	2	tsps
2211	52299	676	0.25	cup
2212	52299	677	1	inch
2213	521431	678	2	c
2214	521431	332	1	handful
2215	521431	286	4	servings
2216	521431	70	1	
2217	521431	97	2	tbsps
2218	521431	388	6	c
2219	521431	679	2	c
2220	521431	4	4	servings
2221	521431	53	3	cloves
2222	521431	461	6	
2223	521431	9	2	
2224	351485	17	1	tablespoon
2225	351485	286	3	cups
2226	351485	277	10	ounces
2227	351485	66	0.5	cup
2228	351485	4	4	servings
2229	351485	680	4	
2230	351485	506	1	cup
2231	351485	53	1	clove
2232	351485	138	2	cups
2233	511310	17	8	servings
2234	511310	664	0.25	bunches
2235	511310	286	2	tablespoons
2236	511310	91	3	
2237	511310	45	3	quarts
2238	511310	681	1	pound
2239	511310	518	1	cup
2240	511310	53	1	
2241	511310	411	1	
2251	167251	685	2	
2252	167251	50	1.75	cups
2253	167251	21	0.333333333333333315	cup
2254	167251	45	1.33333333333333326	cups
2255	167251	53	0.5	teaspoon
2256	167251	576	2	oz
2257	167251	571	10	oz
2258	167251	686	10	oz
2259	167251	49	0.5	cup
2260	511316	17	1	tablespoon
2261	511316	113	0.5	cups
2262	511316	687	4	ounces
2263	511316	286	0.333333333333333315	pounds
2264	511316	277	1	cup
2265	511316	688	2	servings
2266	511316	463	0.5	cups
2267	511316	689	4	slices
2268	511316	34	2	servings
2269	28004	17	2	tsp
2270	28004	690	2	cup
2271	28004	70	0.5	cup
2272	28004	286	1	lb
2273	28004	53	2	tbsp
2274	28004	446	1	
2275	28004	691	2	cup
2276	28004	564	2	
2277	472443	571	1	pound
2278	472443	202	0.5	
2279	472443	4	4	servings
2280	472443	692	2	
2281	472443	576	4	slices
2282	472443	526	2	tablespoons
2283	472443	693	2	teaspoons
2284	472443	9	2	
2285	470452	694	2	slices
2286	470452	418	2	
2287	470452	571	6	slices
2288	470452	277	1	cup
2289	470452	555	6	
2290	470452	15	2	servings
2291	470452	695	2	leaves
2292	470452	696	2	tablespoons
2293	372154	453	6	slices
2294	372154	571	1	pounds
2295	372154	697	0.25	cup
2296	372154	313	6	
2297	372154	698	0.25	teaspoon
2298	372154	526	0.333333333333333315	cup
2299	372154	689	12	slices
2300	603602	35	2	tablespoons
2301	603602	395	1	tablespoon
2302	603602	386	1	teaspoon
2303	603602	286	1.5	pounds
2304	603602	484	0.5	teaspoon
2305	603602	213	0.5	
2306	603602	45	0.5	cup
2307	603602	53	1	tablespoons
2308	603602	82	0.5	cup
2309	603602	22	0.5	cup
2310	603602	152	1	teaspoons
2311	200242	340	1	tablespoon
2312	200242	699	1	pound
2313	200242	286	1	package
2314	200242	700	1	cup
2315	200242	284	1	tablespoon
2316	200242	71	0.5	cup
2317	200242	82	1	tablespoon
2318	200242	698	0.25	teaspoon
2319	200242	15	0.25	teaspoon
2320	468546	453	1	
2321	468546	571	0.75	pound
2322	468546	313	4	
2323	468546	575	4	teaspoons
2324	468546	701	2	tablespoons
2325	468546	526	0.5	cup
2326	468546	689	8	slices
2327	34447	702	1	cup
2328	34447	1	2	
2329	34447	286	1	pound
2330	34447	45	0.5	cup
2331	34447	35	2	tablespoons
2332	34447	427	1.5	cups
2333	34447	340	1	tablespoon
2334	34447	354	2	tablespoons
2335	34447	22	2	tablespoons
2336	34447	468	1	lb
2337	542352	17	1	tbsp
2338	542352	286	2	slices
2339	542352	263	1	tbsp
2340	542352	703	0.333333333333333315	cup
2341	542352	4	1	serving
2342	542352	552	0.25	cup
2343	542352	57	1	tsp
2344	542352	164	2	cups
2345	542352	40	1	tsp
2346	521924	68	200	g
2347	521924	19	2	servings
2348	521924	395	2	tbsps
2349	521924	84	1	tbsp
2350	521924	286	250	g
2351	521924	70	1	
2352	521924	63	1	tsp
2353	521924	153	2	rib
2354	521924	704	2	tbsps
2355	521924	705	1	tbsp
2356	521924	294	2	tbsps
2357	648993	17	0.25	cup
2358	648993	77	5	cups
2359	648993	237	1.5	cups
2360	648993	286	1	package
2361	648993	706	0.66666666666666663	cup
2362	648993	8	50	servings
2363	648993	707	50	
2364	648993	53	3	cloves
2365	648993	177	10	
2366	648993	503	2	
2367	425833	17	1	tablespoon
2368	425833	200	0.333333333333333315	cup
2369	425833	336	2	tablespoons
2370	425833	571	6	ounces
2371	425833	70	0.333333333333333315	cup
2372	425833	708	2	cups
2373	425833	612	1	cups
2374	425833	19	0.125	teaspoon
2375	425833	48	2	teaspoons
2376	329630	93	4	tablespoons
2377	329630	35	8	servings
2378	329630	286	8	
2379	329630	673	8	servings
2380	329630	81	12	ounce
2381	329630	411	1	
2382	329630	345	8	
2383	329630	233	2	
2384	389026	571	8	ounces
2385	389026	133	1	teaspoon
2386	389026	202	0.5	cup
2387	389026	45	1	tablespoon
2388	389026	478	1	teaspoon
2389	389026	709	2	pound
2390	389026	548	0.75	cup
2391	389026	146	1	
2392	389026	210	8	ounces
2393	169974	453	1	
2394	169974	571	0.25	lb
2395	169974	277	1	cup
2396	169974	655	0.25	cup
2397	169974	208	2	
2398	169974	53	2	cloves
2399	169974	576	4.5	oz
2400	565258	710	4	servings
2401	565258	711	4	servings
2402	565258	286	500	grams
2403	565258	70	1	
2404	565258	536	1	
2405	565258	712	4	servings
2406	565258	97	4	servings
2407	565258	22	100	grams
2408	565258	45	2	liters
2409	565258	713	3	liter
2410	565258	100	4	servings
2411	565258	413	1	
2412	565258	714	4	servings
2413	565258	715	1.5	cup
2414	600076	716	0.5	pound
2415	600076	19	0.5	teaspoon
2416	600076	717	1	
2417	600076	286	3	pounds
2418	600076	21	1.25	cups
2419	600076	31	1	sprig
2420	600076	160	3	
2421	600076	45	10	cups
2422	600076	413	1	
2423	600076	53	2	cloves
2424	600076	182	1.5	teaspoons
2425	600076	8	1	teaspoon
2426	600076	718	2	pounds
2427	362508	1	3	
2428	362508	600	2	tablespoons
2429	362508	286	3	pounds
2430	362508	79	1	tablespoon
2431	362508	219	3	
2432	362508	719	2	cups
2433	362508	720	4	
2434	362508	721	6	
2435	362508	304	1	
2436	632891	65	1	tsp
2437	632891	45	0.25	cup
2438	632891	386	2	Tbsp
2439	632891	286	1	lb
2440	632891	160	1	handful
2441	632891	99	0.5	teaspoon
2442	632891	722	0.75	cup
2443	632891	22	3	Tbsp
2444	632891	146	1	
2445	632891	152	0.25	tsp
2446	632891	150	0.333333333333333315	cup
2459	438431	132	0.5	cup
2460	438431	113	0.5	cup
2461	438431	725	0.25	cup
2462	438431	571	0.5	pound
2463	438431	726	4	
2464	438431	727	4	cups
2465	438431	650	8	slices
2466	438431	453	1	
2467	438431	19	0.5	teaspoon
2468	37032	35	1	tablespoon
2469	37032	310	1.5	cups
2470	37032	286	1	pound
2471	37032	177	6	servings
2472	37032	10	2	
2473	37032	728	16	oz
2474	37032	22	0.25	cup
2475	37032	379	0.25	teaspoon
2476	37032	729	0.25	cup
2477	37032	648	14	oz
2488	401627	93	2	tablespoons
2489	401627	17	1	tablespoon
2490	401627	19	0.125	teaspoon
2491	401627	571	8	slices
2492	401627	661	0.25	cup
2493	401627	575	2	teaspoons
2494	401627	658	1	
2495	401627	576	8	slices
2496	401627	526	0.333333333333333315	cup
2497	401627	734	8	slices
2498	569577	93	2	tablespoons
2499	569577	1	2	
2500	569577	571	1	pound
2501	569577	70	1	
2502	569577	187	0.25	teaspoon
2503	569577	4	4	servings
2504	569577	735	24	inch
2505	569577	576	8	slices
2506	569577	620	2	tablespoons
2515	137565	113	0.5	cup
2516	137565	19	0.25	teaspoon
2517	137565	286	1.5	lbs
2518	137565	70	0.25	cup
2519	137565	1	2	
2520	137565	114	4	oz
2521	137565	739	8	oz
2522	137565	261	30	ounce
2523	137565	8	0.5	teaspoon
2524	137565	289	2	slices
2525	174454	19	0.25	teaspoon
2526	174454	571	1	pound
2527	174454	56	6	slices
2528	174454	740	2	
2529	174454	661	4	ounces
2530	174454	420	8	ounces
2531	174454	313	2	cups
2532	174454	49	0.25	cup
2533	174454	9	2	
2534	403903	132	0.25	cup
2535	403903	571	0.75	pound
2536	403903	174	0.75	cup
2537	403903	70	1	
2538	403903	645	5	
2539	403903	446	1	
2540	403903	526	0.5	cup
2541	403903	548	1	
2542	145925	93	0.25	cup
2543	145925	565	1	tablespoon
2544	145925	19	1	pinch
2545	145925	286	0.5	lb
2546	145925	21	0.25	cup
2547	145925	75	3	
2548	145925	109	2	tablespoons
2549	145925	287	1	dash
2550	145925	177	2	
2551	145925	635	2	cups
2552	215564	286	500	g
2553	215564	70	1	
2554	215564	201	50	g
2555	215564	562	1	tsp
2556	215564	741	100	g
2557	215564	742	4	tbsp
2558	215564	106	1	
2559	215564	146	1	
2560	168489	65	0.25	teaspoon
2561	168489	571	8	slices
2562	168489	420	6	oz
2563	168489	546	4	
2564	168489	202	0.5	
2565	168489	81	2	tablespoons
2566	168489	336	2	tablespoons
2567	168489	8	0.25	teaspoon
2568	168489	684	1	
2569	168489	34	4	servings
2570	197217	104	1	teaspoon
2571	197217	17	0.25	cup
2572	197217	571	1.5	pounds
2573	197217	743	0.5	teaspoon
2574	197217	53	2	cloves
2575	197217	576	24	slices
2576	197217	452	0.25	cup
2577	197217	744	1	pound
2578	197217	345	6	
2589	617102	93	1	tbsp
2590	617102	571	500	g
2591	617102	70	1	
2592	617102	287	1	tbsp
2593	617102	249	0.333333333333333315	cup
2594	617102	151	1	tbsp
2595	617102	82	3	tbsp
2596	617102	155	1	cup
2597	617102	345	6	servings
2598	266917	601	4	
2599	266917	748	2	Tbsp
2600	266917	571	16	slices
2601	266917	588	1	piece
2602	266917	515	0.5	cup
2603	266917	232	0.25	cup
2604	266917	749	4	
2605	266917	750	2	Tbsp
2606	402106	45	2	tablespoons
2607	402106	19	0.25	teaspoon
2608	402106	70	1	
2609	402106	133	1	teaspoon
2610	402106	8	0.5	teaspoon
2611	402106	114	1	cups
2612	402106	153	1	rib
2613	402106	751	2	ounces
2614	402106	146	1	
2615	402106	603	2	pounds
2616	402106	289	1	slice
2617	629502	252	1	
2618	629502	752	1	cup
2619	629502	286	0.5	lb
2620	629502	688	0.5	cup
2621	629502	449	1	cup
2622	629502	4	6	servings
2623	629502	413	1	cup
2624	629502	753	1	cup
2625	629502	754	1	
2626	568153	17	1	tablespoon
2627	568153	286	2	cups
2628	568153	70	1	
2629	568153	755	2	
2630	568153	345	3	
2631	568153	53	2	cloves
2632	568153	526	0.5	cup
2633	568153	504	1	tablespoons
2634	568153	61	3	servings
2635	568153	386	1	tablespoon
2636	88073	346	1	tablespoon
2637	88073	409	0.25	cup
2638	88073	756	2	tablespoons
2639	88073	757	1	lb
2640	88073	42	2	tablespoons
2641	88073	5	1	teaspoon
2648	88243	197	0.25	cup
2649	88243	758	24	ounces
2650	88243	729	0.5	cup
2651	88243	82	1	teaspoon
2652	88243	760	2	tablespoons
2660	88278	234	0.75	cup
2661	88278	761	30	inch
2662	88278	254	12	
2663	88278	326	0.75	cup
2670	88362	17	1	tablespoon
2671	88362	761	4	fillet
2672	88362	763	3	tablespoons
2673	88362	4	4	servings
2674	88362	22	0.5	teaspoon
2675	88362	13	0.5	bunch
2676	88362	431	4	slices
2677	88362	764	2	tablespoons
2678	522581	93	0.25	cup
2679	522581	2	0.75	cup
2680	522581	757	2	pound
2681	522581	765	1	teaspoon
2682	629215	17	3	servings
2683	629215	79	0.5	teaspoon
2684	629215	766	18	ounce
2685	629215	543	0.5	
2686	629215	767	0.333333333333333315	cup
2687	629215	8	3	servings
2688	629492	761	4	ounces
2689	629492	768	3	sheets
2690	629492	543	0.5	
2691	629492	85	1	
2697	367482	79	2	tablespoons
2698	367482	757	2	pounds
2699	367482	82	2	tablespoons
2700	367482	8	1	teaspoon
2701	367482	83	2	teaspoons
2702	367482	175	0.5	teaspoon
2703	162735	8	0.25	teaspoon
2704	162735	769	0.125	teaspoon
2705	162735	758	1	lb
2706	162735	729	2	tablespoons
2707	162735	770	2	teaspoons
2708	654435	17	0.25	cup
2709	654435	517	1	tbsp
2710	654435	151	1	tbsp
2711	654435	5	0.25	teaspoon
2712	654435	106	1	
2713	654435	758	12	oz
2714	654435	8	0.125	teaspoon
2715	7665	761	1	
2716	7665	771	1	serving
2717	7665	772	0.5	
2724	499271	35	1	tablespoons
2725	499271	758	24	ounce
2726	499271	53	2	cloves
2727	499271	292	1	tablespoons
2728	499271	494	2	tablespoons
2729	589379	590	2	tablespoons
2730	589379	420	8	ounce
2731	589379	761	4	ounces
2732	589379	774	1	pound
2733	589379	5	1	pinch
2734	589379	61	1	pinch
2735	212768	17	3	tbsp
2736	212768	775	9	
2737	212768	776	18	
2738	212768	761	1	fillet
2739	212768	777	18	
2740	589863	386	1	Tablespoon
2741	589863	505	0.25	cup
2742	589863	278	4	servings
2743	589863	22	0.25	cup
2744	589863	340	0.5	Tablespoon
2745	589863	82	0.25	cup
2746	589863	778	2	Tablespoons
2747	589863	758	24	oz
2748	589863	61	4	servings
2749	196	17	2	tbsp
2750	196	779	1	cup
2751	196	780	1	tbsp
2752	196	761	4	ozs
2753	196	151	0.25	cup
2754	196	53	2	cloves
2755	196	27	1	tbsp
2756	598233	420	8	ounces
2757	598233	761	2	ounces
2758	598233	85	2	tablespoons
2759	598233	781	6	
2760	598233	782	0.25	cup
2761	598233	61	0.5	teaspoon
2762	401676	17	2	tablespoons
2763	401676	19	0.25	teaspoon
2764	401676	454	1	tablespoon
2765	401676	783	2	tablespoons
2766	401676	139	1	teaspoon
2767	401676	42	1	tablespoon
2768	401676	758	24	ounces
2769	401676	8	0.25	teaspoon
2770	213402	17	3	tablespoons
2771	213402	36	1	
2772	213402	517	0.25	cup
2773	213402	5	0.5	teaspoon
2774	213402	784	0.25	cup
2775	213402	758	24	ounce
2776	213402	61	0.75	teaspoon
2777	213402	564	2	
2787	557565	17	2	servings
2788	557565	590	1	sprigs
2789	557565	786	0.5	cup
2790	557565	787	2	
2791	557565	149	0.5	cup
2792	557565	761	1	lb
2793	557565	22	2	Tbsp
2794	557565	82	2	Tbsp
2795	557565	34	2	servings
2803	524925	147	1	teaspoon
2804	524925	788	12	ounces
2805	524925	22	2	tablespoons
2806	524925	42	2	tablespoons
2807	524925	151	2	tablespoons
2808	524925	758	10	ounces
2809	524925	34	2	servings
2810	214240	17	3	tbsp
2811	214240	322	50	g
2812	214240	789	250	g
2813	214240	761	6	fillet
2814	214240	151	1	tablespoon
2815	214240	556	2	tbsp
2816	214240	203	200	g
2817	591129	17	2	tablespoons
2818	591129	790	3	tablespoons
2819	591129	766	2	pounds
2820	591129	128	1	
2821	591129	307	0.25	cup
2822	591129	53	1	cloves
2823	591129	34	4	servings
2824	304491	35	6	cups
2825	304491	791	3	teaspoons
2826	304491	517	20	servings
2827	304491	761	0.5	pound
2828	304491	792	12	ounce
2829	304491	336	0.25	cup
2830	304491	8	0.25	teaspoon
2831	550306	405	1	leaves
2832	550306	75	4	
2833	550306	517	4	servings
2834	550306	394	1	cup
2835	550306	758	24	ounce
2842	157206	17	4	tablespoons
2843	157206	408	1	
2844	157206	61	4	servings
2845	157206	793	2	tablespoons
2846	157206	556	2	tablespoons
2847	157206	758	24	ounce
2848	157206	468	1.5	pounds
2849	1593	17	4	servings
2850	1593	644	1	
2851	1593	4	4	servings
2852	1593	6	0.25	cup
2853	1593	794	4	ounce
2854	1593	758	24	ounce
2855	1593	33	2	tablespoons
2856	247371	17	4	servings
2857	247371	795	1	
2858	247371	202	0.25	cup
2859	247371	213	2	
2860	247371	5	4	servings
2861	247371	796	2	
2862	247371	758	24	ounce
2863	247371	8	4	servings
2864	624219	113	1	Tbsp
2865	624219	797	1	Tbsp
2866	624219	761	6	oz
2867	624219	151	1	tsp
2868	624219	53	1	Clove
2869	624219	15	1	serving
2870	624219	8	1	serving
2871	575123	17	1	T
2872	575123	798	2	cups
2873	575123	726	4	
2874	575123	173	4	oz
2875	575123	235	4	oz
2876	575123	799	3	
2877	575123	34	4	servings
2878	83652	17	5	tablespoons
2879	83652	380	2	tablespoons
2880	83652	660	0.5	teaspoon
2881	83652	741	4	ounces
2882	83652	106	1	
2883	83652	107	3	tablespoons
2884	83652	757	1.5	pounds
2885	83652	61	0.5	teaspoon
2886	599862	70	0.5	cup
2887	599862	21	0.5	cup
2888	599862	761	1	can
2889	599862	308	1.5	teaspoons
2890	599862	146	1	
2891	599862	800	1.5	cups
2892	559309	93	2	tbsp
2893	559309	761	115	g
2894	559309	4	4	servings
2895	559309	801	350	g
2896	559309	117	2	
2897	559309	802	0.66666666666666663	cup
2898	739543	93	1	tablespoon
2899	739543	17	1	tablespoon
2900	739543	21	0.5	cup
2901	739543	319	1	
2902	739543	5	4	servings
2903	739543	803	1	cup
2904	739543	804	0.5	cup
2905	739543	758	24	ounce
2906	739543	8	1	teaspoon
2907	739543	63	2	teaspoons
2908	149766	798	4	fillet
2909	149766	805	1	pint
2910	149766	720	4	
2911	149766	63	1	teaspoon
2912	149766	99	1	teaspoon
2913	149766	53	4	cloves
2914	149766	45	0.25	cup
2915	149766	806	4	teaspoons
2916	149766	8	0.25	teaspoon
2917	379151	19	0.25	teaspoon
2918	379151	202	1	
2919	379151	807	15	ounces
2920	379151	167	0.5	cup
2921	379151	164	11	ounces
2922	379151	758	24	ounces
2923	379151	8	0.25	teaspoon
2924	493889	808	2	tablespoons
2925	493889	75	4	
2926	493889	517	2	tablespoons
2927	493889	394	1	cup
2928	493889	758	24	ounce
2929	494005	809	1	
2930	494005	548	1	
2931	494005	810	3	cups
2932	494005	654	0.25	cup
2933	494005	758	24	ounces
2942	551687	22	0.25	cup
2943	551687	30	2	cups
2944	551687	761	3	fillet
2945	551687	4	4	servings
2946	551687	58	1	piece
2947	551687	813	1.5	tsp
2948	551687	72	2	Tb
2949	551687	714	1	cup
2950	551687	82	0.333333333333333315	cup
2951	19307	435	1	tablespoon
2952	19307	814	4	servings
2953	19307	8	1	teaspoon
2954	19307	5	0.25	teaspoon
2955	19307	164	10	ounce
2956	19307	758	24	ounce
2957	19307	582	1	teaspoon
2958	19307	83	2	teaspoons
2959	273352	155	0.5	cup
2960	273352	758	1	lb
2961	273352	56	4	slices
2962	273352	345	4	
2963	273352	606	4	
2970	658483	31	2	teaspoons
2971	658483	404	4	servings
2972	658483	42	1.5	tablespoons
2973	658483	151	2	tablespoons
2974	658483	816	3	cups
2975	658483	758	16	oz
2976	35967	17	1	Tbsp
2977	35967	817	2	cups
2978	35967	757	6	ozs
2979	35967	167	0.5	cup
2980	35967	164	12	ozs
2981	35967	818	2	
2982	35967	182	2	servings
2983	35967	22	2	Tbsps
2984	576717	93	0.5	cup
2985	576717	113	0.5	cup
2986	576717	553	1	teaspoon
2987	576717	790	2	cups
2988	576717	761	4	fillet
2989	576717	5	0.25	teaspoon
2990	576717	61	0.5	teaspoon
2991	593095	761	1.5	pounds
2992	593095	113	2	tablespoons
2993	593095	819	0.5	
2994	593095	36	0.5	
2995	593095	526	0.25	cup
3006	290093	129	0.333333333333333315	cup
3007	290093	40	2	tablespoons
3008	290093	4	4	servings
3009	290093	758	1.25	pounds
3010	290093	822	1	cup
3011	290093	294	4	servings
3012	265542	113	2	Tbsp
3013	265542	688	0.25	cup
3014	265542	151	2	tsp
3015	265542	819	0.5	cup
3016	265542	758	1	lb
3017	265542	15	0.125	tsp
3018	85405	17	4	servings
3019	85405	2	4	servings
3020	85405	823	1	bunch
3021	85405	761	4	fillet
3022	85405	288	1	bunch
3023	85405	33	4	servings
3024	85442	93	1	tablespoon
3025	85442	20	1	lb
3026	85442	3	3	tablespoons
3027	85442	761	4	fillet
3028	85442	42	1	tablespoon
3029	85442	55	0.5	cup
3030	85442	34	4	servings
3031	683484	581	0.25	teaspoon
3032	683484	17	2	tablespoons
3033	683484	824	1.5	teaspoons
3034	683484	766	24	oz
3035	683484	825	1	teaspoon
3036	683484	16	0.25	teaspoon
3037	683484	33	6	tablespoons
3044	85491	93	1	tablespoon
3045	85491	17	1	tablespoon
3046	85491	40	1	tablespoon
3047	85491	757	1	lb
3048	85491	42	1	tablespoon
3049	85491	53	2	cloves
3050	85491	82	1	tablespoon
3051	85491	22	1	tablespoon
3052	85505	93	100	g
3053	85505	17	4	servings
3054	85505	536	4	servings
3055	85505	761	4	fillet
3056	85505	67	500	g
3057	85505	4	4	servings
3058	85505	826	4	teaspoons
3059	85512	93	0.25	cup
3060	85512	65	0.25	teaspoon
3061	85512	757	1	lb
3062	85512	151	5	tablespoons
3063	85512	773	1	tablespoon
3064	85512	15	4	servings
3065	85512	16	4	servings
3066	85541	93	2	tablespoons
3067	85541	99	1	tablespoon
3068	85541	36	1	slice
3069	85541	550	3	tablespoons
3070	85541	22	2	tablespoons
3071	85541	340	1	tablespoon
3072	85541	15	0.25	tablespoon
3073	85541	758	16	ounces
3074	667231	36	1	slices
3075	667231	40	0.5	Tbsp
3076	667231	307	2	Tbsp
3077	667231	151	2	Tbsp
3078	667231	758	1.5	lbs
3079	667231	8	0.5	tsp
3080	487020	135	0.25	cup
3081	487020	77	2	tablespoons
3082	487020	592	1	cup
3083	487020	217	12	
3084	487020	761	1	pound
3085	487020	827	0.25	cup
3091	593806	113	4	Tablespoons
3092	593806	19	4	servings
3093	593806	761	4	fillet
3094	593806	114	1	cup
3095	593806	828	8	sheets
3096	593806	557	0.25	cup
3097	593806	8	4	servings
3098	602041	16	2	tsp
3099	602041	58	2	tbs
3100	602041	195	2	servings
3101	602041	806	1	tbs
3102	602041	758	12	oz
3103	602041	829	1	tbs
3104	610468	17	1	tablespoon
3105	610468	721	2	
3106	610468	761	1.5	pound
3107	610468	830	1.5	pound
3108	610468	14	2	tablespoons
3109	610468	61	4	servings
3110	610468	326	0.5	cup
3111	610524	17	2	tbsp
3112	610524	831	3	cups
3113	610524	40	0.5	tsp
3114	610524	508	0.5	cup
3115	610524	15	0.5	tsp
3116	610524	758	36	oz
3117	610524	8	0.5	tsp
3118	610524	832	0.25	cup
3119	176439	35	2	tablespoons
3120	176439	810	1	cup
3121	176439	833	1.5	cups
3122	176439	757	1.25	lb
3123	176439	478	1	teaspoon
3124	176439	48	2	teaspoons
3125	176439	9	1.5	cups
3140	4519	17	1	Tbsp
3141	4519	151	2	tsps
3142	4519	532	2	ozs
3143	4519	171	0.333333333333333315	cup
3144	4519	164	10	ozs
3145	4519	182	4	servings
3146	4519	758	24	ozs
3147	504233	420	8	oz
3148	504233	837	26	oz
3149	504233	798	3	
3150	504233	210	1	cup
3151	504233	208	7	
3152	4534	17	1	serving
3153	4534	837	1	serving
3154	4534	761	1	serving
3155	4534	4	1	serving
3156	4534	196	1	serving
3157	4534	27	1	serving
3158	4534	838	1	serving
3159	4584	17	4	tablespoons
3160	4584	590	1	sprigs
3161	4584	839	2	teaspoons
3162	4584	604	6	cups
3163	4584	758	24	ounce
3164	4584	8	0.5	teaspoon
3165	4584	78	3	bunches
3166	324170	17	2	tablespoons
3167	324170	644	1	
3168	324170	42	1.5	tablespoons
3169	324170	840	2	
3170	324170	758	24	ounce
3171	324170	61	4	servings
3172	324170	841	3	cups
3173	4705	17	6	servings
3174	4705	761	1	pound
3175	4705	842	18	
3176	4705	5	6	servings
3177	4705	573	4	cups
3178	4705	8	6	servings
3179	4705	843	6	servings
3180	4713	347	2	teaspoons
3181	4713	40	4	teaspoons
3182	4713	8	0.25	teaspoon
3183	4713	812	2	tablespoons
3184	4713	5	0.25	teaspoon
3185	4713	844	3	cups
3186	4713	758	24	ounce
3187	4713	759	1	teaspoon
3188	4729	17	2	teaspoons
3189	4729	845	0.333333333333333315	cup
3190	4729	706	1	tablespoon
3191	4729	5	0.25	teaspoon
3192	4729	575	2	tablespoons
3193	4729	14	1	tablespoon
3194	4729	758	24	ounce
3195	4729	61	0.5	teaspoon
3196	4747	1	2	
3197	4747	234	2	tablespoons
3198	4747	151	2	tablespoons
3199	4747	5	0.25	teaspoon
3200	4747	846	1	tablespoon
3201	4747	758	24	ounce
3202	4747	425	0.5	teaspoon
3203	4747	61	0.5	teaspoon
3212	86715	315	4	servings
3213	86715	549	2	
3214	86715	466	0.333333333333333315	cup
3215	86715	100	4	
3216	86715	758	480	g
3217	86715	84	0.333333333333333315	cup
3218	594615	848	3	tbsp
3219	594615	8	1	pinch
3220	594615	761	20	ounce
3221	594615	307	2	tbsp
3222	594615	53	3	cloves
3223	594615	96	2	
3224	4800	22	0.25	cup
3225	4800	30	2	cup
3226	4800	761	3	fillet
3227	4800	4	4	servings
3228	4800	58	1	
3229	4800	813	1.5	tsp
3230	4800	72	2	Tb
3231	4800	714	1	cup
3232	4800	82	0.333333333333333315	cup
3233	4820	17	2	tsps
3234	4820	849	2	
3235	4820	254	2	Tbsps
3236	4820	757	1.75	lbs
3237	4820	644	1	Tbsp
3238	4820	151	2	tsps
3239	4820	34	4	servings
3240	86744	850	2	tablespoons
3241	86744	35	4	servings
3242	86744	22	1	tablespoon
3243	86744	8	0.25	teaspoon
3244	86744	757	1	lb
3245	86744	5	0.25	teaspoon
3246	86744	164	3	cups
3247	86744	160	3	
3248	86744	146	1	
3249	86760	113	1	tablespoon
3250	86760	526	1	tablespoon
3251	86760	287	1	teaspoon
3252	86760	761	1	fillet
3253	86760	684	1	
3254	4850	17	2	teaspoons
3255	4850	42	1	teaspoon
3256	4850	19	4	servings
3257	4850	40	1	teaspoon
3258	4850	335	1	leaves
3259	4850	22	0.25	cup
3260	4850	340	1	teaspoon
3261	4850	758	24	ounce
3262	4857	17	2	Tbsps
3263	4857	480	0.25	cup
3264	4857	851	4	servings
3265	4857	5	4	servings
3266	4857	758	24	oz
3267	4857	27	4	sprigs
3268	4857	488	0.25	cup
3269	86809	17	0.5	cup
3270	86809	40	4	tablespoons
3271	86809	644	1	
3272	86809	761	2	fillet
3273	86809	42	2	tablespoons
3274	86809	360	3	tablespoons
3275	86809	82	4	tablespoons
3276	86809	34	4	servings
3277	86868	17	0.25	cup
3278	86868	36	8	
3279	86868	151	0.25	cup
3280	86868	852	1	tablespoon
3281	86868	556	4	teaspoons
3282	86868	758	24	ounce
3283	86868	8	0.5	teaspoon
3284	86868	15	0.5	teaspoon
3285	86907	17	2	tablespoons
3286	86907	36	4	servings
3287	86907	853	1	pint
3288	86907	757	1.5	pound
3289	86907	13	8	cups
3290	86907	854	1	pound
3291	86907	5	4	servings
3292	86907	8	4	servings
3293	529156	368	2	
3294	529156	855	0.5	tsp
3295	529156	63	0.25	cup
3296	529156	856	4	
3297	529156	148	1	
3298	529156	8	1	Dash
3299	578594	71	1	tablespoon
3300	578594	857	1	cup
3301	578594	858	1	
3302	529558	859	1.5	tablespoons
3303	529558	409	1	tablespoon
3304	529558	368	2	
3305	529558	860	0.25	cup
3306	267575	861	3	oz
3307	267575	368	2	
3308	267575	862	24	
3309	267575	82	0.25	cup
3310	578977	350	2	cups
3311	578977	374	1	cup
3312	578977	368	3	
3313	267748	143	2	cups
3314	267748	368	2	
3315	267748	863	0.75	cup
3316	759354	63	0.333333333333333315	cup
3317	759354	215	1	sheet
3318	759354	368	3	
3319	759354	864	0.5	cup
3320	546633	42	6	Tablespoon
3321	546633	409	4	Tablespoon
3322	546633	865	0.75	Cup
3323	546633	368	8	
3324	579424	71	1	tablespoon
3325	579424	857	1	cup
3326	579424	858	1	
3327	579441	866	2	cups
3328	579441	858	1	
3329	579441	867	12	oz
3330	169959	71	2	tablespoons
3331	169959	858	1	
3332	169959	868	2	cups
3333	186429	869	0.5	cup
3334	186429	96	0.5	
3335	186429	368	4	
3336	186429	186	1	
3337	268380	71	2	Tbsp
3338	268380	858	0.5	
3339	268380	689	2	slices
3340	219247	870	2	
3341	219247	368	4	
3342	219247	871	4	servings
3343	596192	767	1	
3344	596192	368	2	
3345	596192	664	4	
3346	596249	872	0.5	bunch
3347	596249	239	1	
3348	596249	45	1	cup
3349	596249	858	1	
3350	203161	409	3	tablespoons
3351	203161	873	1.5	cups
3352	203161	368	6	
3353	203161	874	12	ounces
3354	580034	875	1	cup
3355	580034	876	2	servings
3356	580034	877	0.125	tsp
3357	580034	368	2	
3358	580034	878	0.5	cup
3359	285205	879	8	
3360	285205	368	8	
3361	285205	863	1	cup
3362	72327	71	1	Tbsp
3363	72327	880	0.780000000000000027	oz
3364	72327	858	1	
3365	482276	881	4	servings
3366	482276	882	0.66666666666666663	cup
3367	482276	368	3	
3368	482276	82	2	ounces
3369	646426	409	2	tsp
3370	646426	858	1	
3371	646426	250	1	tbsp
3372	646426	860	2	tbsp
3373	269782	149	2	cups
3374	269782	866	1	cup
3375	269782	368	2	
3376	269782	883	1	liter
3377	171590	124	3	
3378	171590	77	0.333333333333333315	cup
3379	171590	368	1.5	cups
3380	171590	884	1	box
3381	515692	866	10	ounces
3382	515692	858	0.5	cup
3383	515692	49	0.5	cup
3384	483059	17	10	servings
3385	483059	885	10	servings
3386	483059	858	1	
3387	483059	250	10	servings
3388	483059	860	0.5	cup
3389	483082	35	5	servings
3390	483082	886	4	
3391	483082	887	4	tablespoons
3392	483082	858	1	
3393	155425	151	0.5	tablespoon
3394	155425	888	0.5	cup
3395	155425	368	2	
3396	155425	63	1	tablespoon
3397	597847	35	3	tablespoons
3398	597847	63	0.333333333333333315	cup
3399	597847	146	1	
3400	597847	368	3	
3401	597847	889	2	cups
3402	515973	35	2	Tablespoons
3403	515973	890	2	cups
3404	515973	891	8	servings
3405	515973	368	4	
3406	630732	308	0.25	teaspoon
3407	630732	124	4	
3408	630732	368	2	
3409	483336	892	0.5	cup
3410	483336	893	0.25	cup
3411	483336	368	6	
3412	483336	82	0.25	cup
3417	549115	146	1	
3418	549115	368	0.66666666666666663	Cup
3419	549115	895	1	Box
3420	762137	896	1	cup
3421	762137	858	1	
3422	762137	859	2	Tbs
3426	123348	149	0.5	cup
3427	123348	858	1	
3428	123348	899	1	cup
3429	565730	855	1	teaspoon
3430	565730	146	1	
3431	565730	368	2	
3432	549368	17	6	servings
3433	549368	368	2	
3434	549368	900	6	servings
3435	549368	124	2	
3436	549368	21	0.5	Cup
3437	549368	747	0.75	Cup
3438	549368	8	1	pinch
3439	483917	124	2	
3440	483917	409	1	teaspoon
3441	483917	901	1	oz
3442	483917	368	2	
3443	270968	902	7	oz
3444	270968	368	6	
3445	270968	903	2	cups
3446	189174	904	3	tablespoons
3447	189174	368	1	
3448	189174	905	2	slices
3449	697097	156	1	cup
3450	697097	876	4	
3451	697097	805	0.5	cup
3452	697097	858	1	
3453	697097	63	1	tablespoon
3454	582527	368	3	
3455	582527	484	1	tsp
3456	582527	21	3	cups
3457	582527	409	0.5	cup
3458	582527	63	1.25	cup
3459	582527	8	1	tsp
3460	582527	124	2	
3461	598996	368	3	
3462	598996	44	3	cups
3463	598996	63	1	teaspoon
3464	598996	42	2	tablespoons
3465	598996	804	5	cups
3466	598996	8	4	teaspoons
3467	484460	906	2	
3468	484460	409	2	teaspoons
3469	484460	901	2	teaspoons
3470	484460	907	2	oz
3471	484554	908	2	
3472	484554	909	1	C
3473	484554	858	1	
3474	697665	45	0.5	cup
3475	697665	197	2	tablespoons
3476	697665	63	0.5	cup
3477	697665	858	1	
3478	697665	18	3	
3479	566721	910	1	Tbsp
3480	566721	911	0.5	cup
3481	566721	368	2	
3482	566721	416	2	cups
3483	370181	45	0.75	cup
3484	370181	912	1	slicesslices
3485	370181	120	1	cup
3486	370181	858	0.333333333333333315	cup
3487	370181	913	1	teaspoon
3488	550536	487	0.75	cup
3489	550536	914	0.5	cup
3490	550536	368	1	cup
3491	665469	368	1	
3492	665469	250	1	tbsp
3493	665469	915	1	
3494	125011	906	2	
3495	125011	880	2	servings
3496	125011	49	0.5	cup
3497	125011	416	2	cups
3498	125011	63	2	tablespoons
3499	485471	916	4	
3500	485471	368	2	
3504	125033	308	2	teaspoons
3505	125033	21	2	cups
3506	125033	917	2	tablespoons
3507	125033	82	0.25	cup
3508	125033	906	4	
3512	125064	786	3	ounces
3513	125064	919	1	dash
3514	125064	858	1	slices
3515	125090	45	0.75	cup
3516	125090	866	2	cups
3517	125090	920	0.5	cup
3518	125090	368	2	
3527	125175	921	1	cup
3528	125175	805	1	cup
3529	125175	858	1	
3537	125234	923	0.5	cup
3538	125234	875	6	ounces
3539	125234	858	1	
3540	485711	924	6	tbsp
3541	485711	925	2	tbsp
3542	485711	909	1	cup
3543	485711	416	1	cup
3544	485711	858	1	
3551	125325	927	0.333333333333333315	cup
3552	125325	190	2	cups
3553	125325	928	85	g
3554	125325	858	1	
3555	387514	45	0.5	cup
3556	387514	22	4	teaspoons
3557	387514	368	2	
3558	387514	929	3	pounds
3559	387514	813	4	teaspoons
3560	125384	858	0.5	
3561	125384	930	1	
3562	125384	864	2	tablespoons
3569	125436	35	0.5	cup
3570	125436	368	2	
3571	125436	932	2.5	tablespoons
3572	125436	933	3	cups
3573	125436	45	0.333333333333333315	cup
3574	125436	82	0.5	cup
3575	125436	934	3	cups
3576	125436	8	1	tablespoon
3577	125436	935	1	cup
3578	535045	936	4	
3579	535045	866	16	
3580	535045	368	2	
3581	535045	867	1	
3582	535070	916	0.25	cup
3583	535070	368	2	
3584	535070	937	1	cup
3585	125483	938	6	tablespoons
3586	125483	368	6	
3587	125483	939	6	
3591	174694	45	0.75	cup
3592	174694	940	0.5	cup
3593	174694	875	6	oz
3594	174694	858	1	
3595	125571	391	2	lbs
3596	125571	858	1	
3597	125571	404	2	teaspoons
3598	125571	813	1.5	teaspoons
3599	125597	42	4	teaspoons
3600	125597	36	1	
3601	125597	368	4	
3602	125597	82	4	teaspoons
3603	125678	941	1	teaspoon
3604	125678	858	1	
3605	125678	868	1	cup
3606	60185	917	21	ounces
3607	60185	435	1	tablespoon
3608	60185	394	1.5	cups
3609	60185	368	3	
3610	568169	77	15	servings
3611	568169	368	2	
3612	568169	942	12	
3613	568169	45	1	cup
3614	568169	82	0.5	cup
3615	568169	943	0.333333333333333315	cup
3622	666724	308	1	pinch
3623	666724	146	1	
3624	666724	858	1	
3625	633969	45	1	cup
3626	633969	881	2	tablespoons
3627	633969	944	6	servings
3628	633969	120	1	cup
3629	633969	945	225	grams
3630	633969	858	2	
3631	568439	946	0.5	cup
3632	568439	35	24	servings
3633	568439	368	12	
3634	568439	942	24	
3635	568439	63	1	cup
3636	601309	875	0.25	cup
3637	601309	858	1	
3638	601309	59	2	
3639	650485	877	1	pinch
3640	650485	368	2	
3641	650485	149	0.5	cup
3642	503047	35	24	servings
3643	503047	420	8	ounces
3644	503047	368	12	
3645	503047	942	24	
3646	503047	63	1	cup
3647	732447	480	1	tablespoon
3648	732447	409	1	tablespoon
3649	732447	947	7	ounce
3650	732447	368	2	
3651	601422	948	1	cup
3652	601422	45	3	cup
3653	601422	858	1	teaspoon
3654	601422	949	0.5	cup
3655	601422	63	1	tablespoon
3656	486735	374	2	cups
3657	486735	368	3	
3658	486735	950	3	servings
3659	486735	951	1	pinch
3660	552324	487	0.333333333333333315	cup
3661	552324	124	6	
3662	552324	409	16	servings
3663	552324	368	3	
3664	585326	71	1	tablespoons
3665	585326	368	2	
3666	585326	952	1	teaspoon
3670	601839	953	1	
3671	601839	887	0.125	cup
3672	601839	858	0.5	
3673	274260	71	2	tsp
3674	274260	42	1	sheet
3675	274260	858	4	slices
3676	487319	18	2	
3677	487319	876	4	
3678	487319	931	0.5	
3679	487319	368	2	
3680	421980	526	0.333333333333333315	cup
3681	421980	368	3	
3682	421980	790	0.5	cup
3683	421980	63	1	teaspoons
3693	464827	93	0.5	teaspoon
3694	464827	374	0.25	cup
3695	464827	529	3	ounces
3696	464827	45	0.5	cup
3697	464827	38	1	cup
3698	464827	698	0.25	teaspoon
3699	464827	259	0.5	cup
3700	14280	17	1	Tbsp
3701	14280	202	2	Tbsps
3702	14280	954	4	
3703	14280	782	2	Tbsps
3704	14280	42	1	tsp
3705	14280	151	1	Tbsp
3706	14280	15	0.125	tsp
3707	14280	203	4	cups
3708	14280	8	0.125	tsp
3717	200703	956	0.25	cup
3718	200703	84	2	tablespoons
3719	200703	957	3	tablespoons
3720	200703	958	3	tablespoons
3721	200703	8	1	teaspoon
3722	200703	10	2	
3723	200703	529	1	pound
3724	200703	160	3	
3725	200703	99	2	teaspoons
3726	200703	959	10	ounces
3727	200703	293	2	tablespoons
3728	200703	63	1	tablespoon
3729	98333	17	1	teaspoon
3730	98333	197	0.25	cup
3731	98333	727	2	ounces
3732	98333	955	0.125	teaspoon
3733	98333	954	2	
3734	98333	42	2	tablespoons
3735	98333	960	1	
3736	98333	784	0.333333333333333315	cup
3737	98333	61	0.25	teaspoon
3738	761951	961	2	tsp
3739	761951	20	1	lb
3740	761951	529	13	oz
3741	761951	728	6	oz
3742	761951	99	1.5	Tbs
3743	761951	962	0.333333333333333315	
3744	761951	963	1	
3745	761951	654	6	servings
3746	143481	65	0.25	teaspoon
3747	143481	40	2	tablespoons
3748	143481	70	1	
3749	143481	201	6	servings
3750	143481	529	1.5	lbs
3751	143481	307	0.5	cup
3752	143481	22	0.333333333333333315	cup
3753	143481	5	0.25	teaspoon
3754	143481	447	0.333333333333333315	cup
3755	762000	17	1	Tbs
3756	762000	70	1	
3757	762000	92	14.5	oz
3758	762000	217	6	1-inch
3759	762000	529	1	lb
3760	762000	8	0.75	tsp
3761	762000	964	0.75	cup
3762	762000	586	4.5	oz
3763	762000	83	1	tsp
3764	762027	166	0.333333333333333315	cup
3765	762027	263	1	tsp
3766	762027	529	4	oz
3767	762027	455	2	tsp
3768	762027	101	2	Tbs
3769	762027	965	0.333333333333333315	cup
3770	762027	684	1	
3771	479421	17	3	tablespoons
3772	479421	202	0.5	
3773	479421	2	2	tablespoons
3774	479421	517	2	tablespoons
3775	479421	529	1	pound
3776	479421	356	1	tablespoon
3777	479421	42	2	teaspoons
3778	479421	360	2	tablespoons
3779	479421	8	1	teaspoon
3780	762068	17	2	Tbs
3781	762068	19	0.5	tsp
3782	762068	966	4	servings
3783	762068	529	13	oz
3784	762068	53	3	cloves
3785	762068	556	3	Tbs
3786	762068	48	0.25	cup
3787	762068	92	4	
3799	522588	93	4	servings
3800	522588	17	4	servings
3801	522588	19	4	servings
3802	522588	70	1	
3803	522588	967	4	servings
3804	522588	529	1	
3805	522588	968	1	tbsp
3806	522588	53	0.25	tsp
3807	522588	969	1	
3808	522588	468	1	bunch
3809	758140	664	1	lb
3810	758140	812	1	Tbs
3811	758140	529	6	oz
3812	758140	22	1	Tbs
3813	758140	99	2	Tbs
3814	758140	793	2	Tbs
3815	758140	970	6	oz
3816	758140	569	1	tsp
3817	758140	551	4	oz
3818	758140	170	1	
3830	272831	166	1	
3831	272831	396	8	oz
3832	272831	70	0.5	cup
3833	272831	529	8	oz
3834	272831	834	0.25	cup
3835	272831	971	2	cups
3836	272831	72	1	Tbsp
3837	272831	972	0.5	cup
3838	18964	17	0.25	cup
3839	18964	973	1	lb
3840	18964	435	1	Tbsp
3841	18964	790	3	ozs
3842	18964	954	0.5	lb
3843	18964	974	1	
3844	18964	975	4	servings
3845	18964	55	0.333333333333333315	cup
3846	18964	976	0.5	head
3847	143917	17	2	tablespoons
3848	143917	529	0.5	lb
3849	143917	977	1	teaspoon
3850	143917	187	1	teaspoon
3851	143917	524	1	loaf
3852	143917	436	0.125	teaspoon
3853	143917	53	1	teaspoon
3854	143917	4	12	servings
3855	143917	274	2	tablespoons
3856	143917	22	1	tablespoon
3857	516679	17	1.5	tsp
3858	516679	978	1	
3859	516679	979	10	oz
3860	516679	113	1	Tbsp
3861	516679	529	6	oz
3862	516679	95	6	cloves
3863	516679	411	1	
3864	516679	164	6	oz
3874	119382	35	1.5	cups
3875	119382	529	1	cup
3876	119382	21	2	cups
3877	119382	484	1	teaspoon
3878	119382	10	3	cups
3879	119382	873	0.5	cup
3880	119382	63	1	cup
3881	119382	308	3	teaspoons
3882	119382	82	1	cup
3883	119382	8	1	teaspoon
3884	119382	855	2	teaspoons
3885	119382	926	1	teaspoon
3886	660067	35	2	teaspoons
3887	660067	980	1	teaspoon
3888	660067	529	80	gm
3889	660067	58	30	gm
3890	660067	458	30	gm
3891	660067	99	2	teaspoons
3892	660067	981	10	gm
3893	660067	100	1	
3894	660067	53	1	teaspoon
3895	660067	63	1	teaspoon
3896	660067	8	0.25	teaspoon
3897	307838	480	0.5	cup
3898	307838	374	0.5	cup
3899	307838	893	2	tablespoons
3900	307838	982	4	teaspoons
3901	307838	529	12	ounce
3902	307838	881	2	teaspoons
3903	307838	63	1	tablespoon
3904	307838	354	2	tablespoons
3905	307838	82	1	tablespoon
3906	307838	8	0.125	teaspoon
3907	27284	17	0.25	cup
3908	27284	983	4	tsps
3909	27284	234	1	Tbsp
3910	27284	529	14	ozs
3911	27284	147	2	tsps
3912	27284	455	2	tsps
3913	27284	9	2	lbs
3914	27284	182	6	servings
3915	27284	984	1	Tbsp
3924	424601	1	2	
3925	424601	70	1	
3926	424601	353	6	ounces
3927	424601	986	0.25	cup
3928	424601	987	1	teaspoon
3929	424601	78	5	servings
3930	424601	45	4	cups
3931	424601	529	16	ounces
3932	424601	44	1	tablespoon
3933	262853	988	1	tsp
3934	262853	65	1	dash
3935	262853	989	1	tbsp
3936	262853	118	1	dash
3937	262853	529	6	
3938	262853	119	0.25	tsp
3939	262853	308	1	tsp
3940	262853	5	0.25	tsp
3941	262853	8	0.5	tsp
3942	262853	764	0.25	tsp
3952	109385	1	3	
3953	109385	992	2	cups
3954	109385	529	16	ounce
3955	109385	475	1	
3956	109385	85	1	bunch
3957	109385	99	3	teaspoons
3958	109385	784	2	tablespoons
3959	109385	22	3.5	teaspoons
3960	109385	638	4	cups
3969	35720	17	2	tsps
3970	35720	978	4	oz
3971	35720	99	0.5	tsp
3972	35720	166	1	
3973	35720	70	1	
3974	35720	529	6	ozs
3975	35720	340	0.75	tsp
3976	35720	42	0.5	tsp
3977	35720	250	2	Tbsps
3978	775115	135	2	tablespoons
3979	775115	971	2	cups
3980	775115	408	2	tablespoons
3981	775115	529	1	pound
3982	775115	58	1	teaspoon
3983	775115	996	2	tablespoons
3984	775115	82	2	teaspoons
3985	775115	899	2	cups
3986	635867	35	1	teaspoon
3987	635867	640	1	
3988	635867	997	1	tablespoon
3989	635867	30	1	cube
3990	635867	535	1	teaspoon
3991	635867	45	2	tablespoons
3992	635867	53	1	ts
3993	635867	998	1	piece
3994	635867	15	0.5	ts
3995	635867	433	5	pieces
3996	439251	35	0.5	cup
3997	439251	999	0.75	cup
3998	439251	529	14	ounce
3999	439251	124	2	
4000	439251	577	16	ounce
4001	439251	4	8	servings
4002	439251	340	0.5	teaspoon
4003	439251	354	1	cup
4004	439251	972	0.25	cup
4005	15357	35	4	tablespoons
4006	15357	197	2	tablespoons
4007	15357	985	1	
4008	15357	664	8	cups
4009	15357	70	0.5	
4010	15357	811	0.5	cup
4011	15357	529	14	ounce
4012	15357	340	1	tablespoon
4013	488479	45	0.5	cup
4014	488479	77	2	tbsp
4015	488479	1000	0.5	tsp
4016	488479	386	1	tbsp
4017	488479	999	0.5	tbsp
4018	488479	109	3	tbsp
4019	488479	529	250	g
4020	488479	859	3	tbsp
4021	488479	22	0.5	tsp
4022	488479	308	0.25	tsp
4023	488479	428	3	tbsp
4024	488479	5	0.5	tsp
4025	488479	8	2	servings
4026	521296	383	1	bunch
4027	521296	276	2	tbsps
4028	521296	70	1	
4029	521296	529	1	c
4030	521296	130	3	servings
4031	521296	63	1	tbsp
4032	521296	279	2	
4033	521296	53	1	tbsp
4034	521296	1001	0.75	c
4035	521296	330	1	tbsp
4036	23652	35	3	tablespoons
4037	23652	1	2	
4038	23652	166	1	
4039	23652	529	18	oz
4040	23652	254	0.25	cup
4041	23652	63	2	tablespoons
4042	23652	455	0.333333333333333315	cup
4043	23652	969	1	pound
4044	23652	330	2	tablespoons
4045	107681	386	1	teaspoon
4046	107681	44	2	tablespoons
4047	107681	529	14	ounce
4048	107681	85	1	
4049	107681	42	2	tablespoons
4050	107681	53	1	tablespoon
4051	107681	569	1	teaspoon
4052	107681	293	2	tablespoons
4053	107681	1002	1	
4065	662709	1004	3	packages
4066	662709	99	1	teaspoon
4067	662709	529	8	oz
4068	662709	160	3	
4069	662709	340	2	tablespoons
4070	662709	249	1	teaspoon
4071	662709	349	2	tablespoons
4072	662709	22	2	tablespoons
4073	662709	564	2	cups
4085	11532	600	4	tbsp
4086	11532	1005	1	tablespoon
4087	11532	954	1	lb
4088	11532	461	1	pound
4089	11532	340	2	tablespoons
4090	11532	1006	2	tablespoons
4091	11532	212	1	teaspoon
4092	11532	1007	1.5	teaspoons
4093	11532	78	2	tablespoons
4094	11532	1008	2.5	cups
4105	619918	1009	1	
4106	619918	16	0.5	teaspoon
4107	619918	1010	0.5	cup
4108	619918	409	0.5	cup
4109	619918	529	16	ounces
4110	619918	1011	8	ounces
4111	619918	1012	12	teaspoons
4112	619918	324	2	tablespoons
4113	619918	995	0.75	cup
4114	619918	1013	0.5	cup
4115	761276	35	3	cups
4116	761276	894	1	tsp
4117	761276	353	2	oz
4118	761276	1014	2	oz
4119	761276	22	4	Tbs
4120	761276	45	2	cups
4121	761276	969	2	oz
4122	761276	1015	2	oz
4123	761276	440	1.5	Tbs
4124	761276	551	4	oz
4125	761276	1016	4	oz
4126	13784	35	0.25	cup
4127	13784	1	2	
4128	13784	566	0.25	teaspoon
4129	13784	21	2.5	cups
4130	13784	1017	0.25	cup
4131	13784	529	14	ounce
4132	13784	8	1	teaspoon
4133	13784	160	2	
4134	13784	99	1	teaspoon
4135	13784	45	1	cup
4136	13784	203	10	ounce
4137	13784	146	1	
4147	624139	84	1	tsp
4148	624139	70	0.5	
4149	624139	458	2	servings
4150	624139	529	240	gm
4151	624139	63	1	tsp
4152	624139	86	1	tsp
4153	624139	53	1	tsp
4154	624139	539	1	
4155	624139	8	0.25	tsp
4156	624139	1019	2	servings
4157	104004	35	3	tablespoons
4158	104004	1	2	
4159	104004	252	1	
4160	104004	1020	0.25	cup
4161	104004	529	18	ounce
4162	104004	63	2	tablespoons
4163	104004	1021	0.333333333333333315	cup
4164	104004	969	1	lb
4165	104004	330	2	tablespoons
4166	9912	35	2	tablespoons
4167	9912	1022	1	tablespoon
4168	9912	529	14	oz
4169	9912	387	1	lb
4170	9912	99	1	tablespoon
4171	9912	455	2	tablespoons
4172	9912	991	1	cup
4173	9912	1023	7	oz
4174	9912	78	4	
4175	200490	17	1	teaspoon
4176	200490	197	0.25	cup
4177	200490	727	2	ounces
4178	200490	955	0.125	teaspoon
4179	200490	954	2	
4180	200490	42	2	tablespoons
4181	200490	960	1	
4182	200490	784	0.333333333333333315	cup
4183	200490	61	0.25	teaspoon
4194	186233	45	0.333333333333333315	cup
4195	186233	957	0.5	teaspoon
4196	186233	1026	2	
4197	186233	529	1	
4198	186233	1027	1	tablespoon
4199	186233	160	2	
4200	186233	99	2	tablespoons
4201	186233	225	2	tablespoons
4202	186233	996	1	tablespoon
4203	186233	82	2	tablespoons
4204	186233	1028	0.25	cup
4205	186233	22	0.25	cup
4206	186233	8	1	pinch
4207	202644	135	4	servings
4208	202644	328	1	
4209	202644	1029	2	tablespoons
4210	202644	97	2	tablespoons
4211	202644	433	8	ounces
4212	202644	348	0.5	teaspoons
4213	202644	349	2	tablespoons
4214	202644	991	3	cups
4215	202644	293	1	teaspoon
4216	202644	61	4	servings
4217	581520	480	0.333333333333333315	cup
4218	581520	529	8	ounces
4219	581520	45	4	ounces
4220	581520	324	0.5	cup
4221	581520	199	8	servings
4222	581520	49	1.5	cups
4223	581520	897	16	ounces
4224	581520	176	0.25	teaspoon
4225	143258	35	1	teaspoon
4226	143258	1030	8	ounce
4227	143258	21	0.333333333333333315	cup
4228	143258	529	14	ounce
4229	143258	516	4	servings
4230	143258	155	1	cup
4231	143258	8	0.125	teaspoon
4232	759701	17	1.5	tsp
4233	759701	978	1	
4234	759701	113	3	Tbs
4235	759701	644	0.25	cup
4236	759701	529	6	oz
4237	759701	1031	1	
4238	759701	95	6	cloves
4239	759701	164	3	oz
4240	470980	65	1	tablespoon
4241	470980	35	1	cup
4242	470980	346	1	
4243	470980	529	12	ounces
4244	470980	119	1	tablespoon
4245	470980	45	1	cup
4246	470980	1032	1.5	pounds
4247	470980	1033	1.5	cups
4248	470980	8	1	tablespoon
4249	470980	1034	1.5	cups
4250	18383	35	1	tsp
4251	18383	147	1	Tbsp
4252	18383	529	14	oz
4253	18383	810	4	ozs
4254	18383	160	2	
4255	18383	99	1.5	tsps
4256	18383	455	1.5	Tbsps
4257	18383	53	1	clove
4258	18383	182	4	servings
4259	18383	1013	0.5	tsp
4260	18383	73	0.5	tsp
4261	100488	1	2	
4262	100488	77	1	tablespoon
4263	100488	1035	0.25	cup
4264	100488	529	48	ounce
4265	100488	119	0.5	teaspoon
4266	100488	340	0.5	inch
4267	100488	1036	1	bunch
4268	100488	106	1	
4269	100488	15	0.25	teaspoon
4270	100488	22	2	tablespoons
4271	100488	78	2	
4282	116905	35	3	tablespoons
4283	116905	983	2	teaspoons
4284	116905	529	0.5	pound
4285	116905	743	1	pinch
4286	116905	1037	1	cup
4287	116905	4	4	servings
4288	116905	99	0.5	teaspoon
4289	116905	53	3	
4290	116905	1038	1	pound
4291	116905	442	1	
4292	116905	150	0.25	cup
4302	553182	17	3	tablespoons
4303	553182	1039	10	oz
4304	553182	1040	12	oz
4305	553182	137	1	cup
4306	553182	10	5	oz
4307	553182	529	2	lbs
4308	553182	208	12	
4309	553182	576	6	slices
4310	553182	1041	4	oz
4329	143648	77	1	cup
4330	143648	1046	1.5	tablespoons
4331	143648	66	0.75	cup
4332	143648	100	2	tablespoons
4333	143648	22	2	tablespoons
4334	143648	45	1	tablespoon
4335	143648	354	1	tablespoon
4336	143648	1047	250	g
4337	143648	53	1	teaspoon
4338	143648	341	1	tablespoon
4339	143648	440	8	pieces
4368	35239	197	2	Tbs
4369	35239	374	0.5	cup
4370	35239	310	1	cup
4371	35239	1029	1	Tbs
4372	35239	63	1	tsp
4373	35239	529	1	lb
4374	35239	22	2	Tbs
4375	35239	71	0.5	cup
4376	35239	991	0.25	cup
4377	35239	959	0.5	lb
4378	586184	147	1	teaspoon
4379	586184	529	8	ounces
4380	586184	99	1	tablespoon
4381	586184	238	1	cup
4382	586184	1050	8	cups
4383	586184	1051	4	ounces
4384	586184	411	3	cups
4385	586184	164	1	ounce
4386	586184	373	1	
4387	586184	61	2	teaspoon
4388	553501	1052	1	lb
4389	553501	1053	1	lb
4390	553501	529	1	lb
4391	553501	506	1	lb
4392	553501	274	6	oz
4393	553501	1054	12	oz
4394	553501	1055	16	
4395	553501	432	1	lb
4396	207384	17	2	tablespoons
4397	207384	166	1	
4398	207384	8	0.5	teaspoon
4399	207384	529	16	ounce
4400	207384	513	4	servings
4401	207384	53	4	cloves
4402	207384	1056	0.5	teaspoon
4403	207384	196	0.25	cup
4404	207384	1057	10	ounces
4405	207384	92	15	ounce
4406	207384	61	4	servings
4407	227975	17	2	tbsp
4408	227975	19	1	serving
4409	227975	8	1	serving
4410	227975	529	100	g
4411	227975	436	0.5	tsp
4412	227975	287	1	dash
4413	227975	1058	100	g
4414	227975	176	1	tsp
4415	227975	96	0.5	
4416	227975	83	2	tsp
4417	227975	1059	0.5	tsp
4418	758431	1060	0.5	cup
4419	758431	1061	0.5	tsp
4420	758431	21	0.25	cup
4421	758431	1062	2	Tbs
4422	758431	529	0.5	cup
4423	758431	215	17.3000000000000007	oz
4424	758431	308	2	tsp
4425	758431	914	1	cup
4426	758431	324	1	tsp
4427	758431	63	1	cup
4428	15054	1063	3	Tbsps
4429	15054	664	3	ozs
4430	15054	529	6	ozs
4431	15054	160	2	
4432	15054	340	2	tsps
4433	15054	455	2	tsps
4434	15054	991	5	cups
4435	15054	106	1	
4436	545511	17	2	tablespoons
4437	545511	1064	0.125	teaspoon
4438	545511	234	0.5	cup
4439	545511	277	5	cups
4440	545511	529	14	ounce
4441	545511	160	3	
4442	545511	151	1	teaspoons
4443	545511	1065	1	cup
4444	545511	61	2	servings
4445	545511	1066	0.5	teaspoon
4446	201600	68	3	
4447	201600	980	2	tablespoons
4448	201600	1067	1	
4449	201600	124	3	
4450	201600	1068	0.5	
4451	201600	954	1	
4452	201600	22	2	tablespoons
4453	201600	1069	0.5	cup
4454	201600	1070	2	oz
4455	201600	8	0.5	teaspoon
4456	95142	17	2	tablespoons
4457	95142	1	4	
4458	95142	19	4	servings
4459	95142	70	1	
4460	95142	529	0.5	lb
4461	95142	436	0.125	teaspoon
4462	95142	153	2	rib
4463	95142	1071	1	
4464	95142	45	2.5	cups
4465	95142	1072	1	teaspoon
4466	95142	8	4	servings
4467	95142	468	1	lb
4482	617466	65	0.25	teaspoon
4483	617466	252	1	
4484	617466	136	2	
4485	617466	70	1	
4486	617466	277	2	cups
4487	617466	529	14	oz
4488	617466	68	1	cup
4489	617466	5	0.25	teaspoon
4490	617466	1033	0.25	cup
4491	617466	16	0.5	teaspoon
4492	568328	35	144	servings
4493	568328	70	1	
4494	568328	451	4	cups
4495	568328	10	2	
4496	568328	529	12	ounces
4497	568328	942	12	
4498	568328	4	144	servings
4499	568328	45	0.5	cup
4500	568328	53	2	cloves
4501	568328	373	1	
4502	568328	406	0.5	head
4503	281631	35	0.5	teaspoon
4504	281631	1073	48	
4505	281631	36	1	
4506	281631	1074	1	teaspoon
4507	281631	529	0.5	cup
4508	281631	45	0.66666666666666663	cup
4509	281631	455	1.5	tablespoons
4510	281631	413	48	pieces
4511	281631	14	48	pieces
4512	281631	994	1	ounce
4513	281631	106	1	
4514	23654	17	3	tablespoons
4515	23654	25	2	
4516	23654	220	1	tablespoon
4517	23654	529	1	pound
4518	23654	284	0.333333333333333315	cup
4519	23654	1075	12	ounces
4520	23654	9	3	pounds
4521	23654	8	1	teaspoon
4522	23654	152	2	teaspoons
4523	23654	1066	1	tablespoon
4524	760928	35	1	Tbs
4525	760928	1	2	
4526	760928	441	9	cups
4527	760928	408	1	
4528	760928	455	3	Tbs
4529	760928	529	1	lb
4530	760928	85	1	cup
4531	760928	340	1	Tbs
4532	760928	1074	1	Tbs
4533	760928	238	4	cups
4534	760928	45	3	Tbs
4535	760928	63	1	tsp
4536	654460	45	90	ml
4537	654460	528	2	inches
4538	654460	458	1	stalk
4539	654460	529	300	grams
4540	654460	58	2	teaspoons
4541	654460	63	2	servings
4542	654460	99	1	teaspoon
4543	654460	1076	0.5	teaspoon
4544	654460	1077	5	tablespoons
4545	654460	111	1	teaspoon
4546	654460	1078	125	grams
4547	654460	8	0.5	teaspoon
4548	654460	330	5	tablespoons
4559	648462	36	0.5	
4560	648462	529	1	
4561	648462	30	4	cups
4562	648462	550	4	tablespoons
4563	648462	22	2	tablespoons
4564	648462	68	4	
4565	648462	413	0.5	
4566	648462	684	1	
4567	771447	17	4	tablespoons
4568	771447	1080	2	ounces
4569	771447	529	3	ounces
4570	771447	4	4	servings
4571	771447	42	0.333333333333333315	cup
4572	771447	455	0.25	cup
4573	771447	522	3	ounces
4574	771447	358	1	
4575	771447	638	2	ounces
4576	771447	73	1	pinch
4577	666997	17	2	tablespoons
4578	666997	251	8	ounce
4579	666997	553	0.5	teaspoon
4580	666997	113	5	tablespoons
4581	666997	529	12	ounce
4582	666997	187	2	teaspoons
4583	666997	114	4	ounces
4584	666997	53	1	clove
4585	666997	15	4	servings
4586	666997	8	4	servings
4587	666997	1081	0.5	cup
4588	478609	374	1	c
4589	478609	331	1	
4590	478609	70	1	
4591	478609	97	1	tbsp
4592	478609	529	100	g
4593	478609	58	1	serving
4594	478609	53	4	cloves
4595	478609	4	1	serving
4596	478609	586	2	
4597	478609	1082	3	sprigs
4598	624016	1083	2	tsp
4599	624016	1084	2	tsp
4600	624016	529	16	oz
4601	624016	909	0.25	cup
4602	624016	1085	2	cups
4603	624016	175	2	tsp
4604	624016	904	2	tbs
4605	624016	1086	0.5	tsp
4606	624016	8	0.25	tsp
4607	497065	1	2	
4608	497065	721	4	
4609	497065	1087	1	cup
4610	497065	44	1	teaspoon
4611	497065	529	4	servings
4612	497065	58	1	teaspoon
4613	497065	160	2	
4614	497065	99	1	teaspoon
4615	497065	225	1	teaspoon
4616	497065	991	4	cups
4617	497065	61	4	servings
4618	761281	17	4	Tbs
4619	761281	566	0.5	tsp
4620	761281	29	4	cups
4621	761281	1088	4	cups
4622	761281	21	0.25	cup
4623	761281	529	1	lb
4624	761281	160	2	
4625	761281	45	4	cups
4626	761281	53	2	cloves
4627	761281	171	0.5	cup
4628	761281	8	1	tsp
4629	761281	1089	2	Tbs
4630	761284	35	1	Tbs
4631	761284	956	1	Tbs
4632	761284	451	1	oz
4633	761284	529	2	oz
4634	761284	249	6	servings
4635	761284	413	0.25	cup
4636	761284	994	1	tsp
4637	761284	1090	12	sheets
4638	761284	146	1	
4639	529889	99	1	tablespoon
4640	529889	135	1	cup
4641	529889	441	2	
4642	529889	986	0.5	cup
4643	529889	10	2	cups
4644	529889	529	4	ounces
4645	529889	68	4	cups
4646	529889	991	32	ounces
4647	529889	45	6	cups
4648	529889	684	1	cup
\.


--
-- Name: recipe_ingredients_recipe_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('recipe_ingredients_recipe_ingredient_id_seq', 4648, true);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY recipes (recipe_id, title, prep_time, ready_in, yield_amt, image, instructions) FROM stdin;
74225	Chicken With Tomatoes And Olives Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/chicken-with-tomatoes-and-olives-recipe-2-74225.jpg	http://www.foodrepublic.com/2011/03/11/chicken-tomatoes-and-olives-recipe
74249	Transition Chicken With Chive Butter	\N	\N	\N	https://spoonacular.com/recipeImages/transition_chicken_with_chive_butter-74249.jpg	http://www.savvyeat.com/transition-chicken-with-chive-butter/
74407	Chicken with Slow-Roasted Tomatoes and Cheesy Grits	\N	\N	\N	https://spoonacular.com/recipeImages/chicken-with-slow-roasted-tomatoes-and-cheesy-grits-74407.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to  On a rimmed baking sheet, toss the tomatoes with 2 tablespoons of the oil and season with salt and pepper. Turn the tomatoes cut side down and scatter the rosemary around; bake on the bottom shelf of the oven for 1 hour and 15 minutes, or until very soft and starting to brown. </li>\n<li>Let cool, then discard the skins.Meanwhile, in a roasting pan, rub the chicken all over with 1 tablespoon of the oil and season with salt and pepper. Scatter the onion wedges around the chicken, drizzle with the remaining 1 tablespoon of oil and season with salt and pepper. Roast the chicken and onions in the upper third of the oven for 1 hour and 10 minutes.Increase the oven temperature to  </li>\n<li>Add the wine to the pan and roast the chicken for about 20 minutes longer, until the onions are well browned and the chicken is golden and the cavity juices run clear. </li>\n<li>Pour the cavity juices into the pan. </li>\n<li>Transfer the chicken and onions to a platter; let the chicken rest for 10 minutes.Set the roasting pan over moderately high heat and add 4 of the tomato halves and 1/2 cup of water. Simmer, scraping up any browned bits and mashing the tomatoes, until reduced by one-third. Strain the jus into a saucepan and season with salt and pepper. Carve the chicken and serve with the tomatoes, onions, tomato jus and Creamy Cheese Grits.</li>\n</ol>\n</div>
25369	Sunday Roast With Butternut Squash Anna	\N	\N	\N	https://spoonacular.com/recipeImages/sunday-roast-with-butternut-squash-anna-2-25369.jpg	http://www.britishlarder.co.uk/one-10-chicken-three-meals-part-one/#axzz1SWgy9QlH
172864	Herb Roast Chicken and Vegetables	\N	\N	\N	https://spoonacular.com/recipeImages/Herb-Roast-Chicken-and-Vegetables-172864.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat oven to 375°F. In small bowl, mix oil, thyme, marjoram, salt and pepper. Grate 1 teaspoon peel from lemon; stir peel into oil mixture. </li>\n<li>Cut lemon into quarters; place in cavity of chicken.</li>\n<li>2</li>\n<li>Fold wings across back of chicken so tips are touching. Skewer or tie legs together. On rack in shallow roasting pan or 13x9 inch pan fitted with rack, place chicken, breast side up. </li>\n<li>Brush some of the oil mixture on chicken. Insert ovenproof meat thermometer so tip is in thickest part of thigh and does not touch bone.</li>\n<li>3</li>\n<li>Roast uncovered 45 minutes. Arrange potatoes, carrots and green beans around chicken; brush remaining oil mixture on chicken and vegetables. Roast uncovered 30 to 45 minutes longer or until thermometer reads at least 165°F, legs move easily when lifted or twisted and vegetables are tender. Cover loosely with foil; let stand 15 to 20 minutes for easiest carving.</li>\n<li>4</li>\n\n<li>Remove lemon and discard. </li>\n<li>Place chicken on platter; arrange vegetables around chicken. </li>\n<li>Serve with pan drippings.</li>\n</ol>\n</div>
189301	Dijon and Tarragon Grilled Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Dijon-and-Tarragon-Grilled-Chicken-189301.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine first 5 ingredients in processor. Process until smooth. </li>\n<li>Place chicken pieces in 15x10x2-inch glass baking dish. Sprinkle chicken with salt and pepper. </li>\n<li>Pour tarragon-mustard mixture over chicken; toss to coat. </li>\n<li>Let stand at room temperature 1 hour or refrigerate 2 to 4 hours, turning occasionally.</li>\n<li>Prepare barbecue (medium heat). </li>\n<li>Place chicken on barbecue. Cover and grill until chicken is almost cooked through, turning every 5 minutes and basting with marinade, about 30 minutes. Grill without basting until chicken is cooked through, about 7 minutes longer. </li>\n<li>Serve chicken hot, warm, or at room temperature.</li>\n</ol>\n</div>
418827	Chicken and Rice Dinner	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-Rice-Dinner-418827.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Dredge chicken in flour. In a large skillet, brown chicken in oil on all sides over medium heat.</li>\n<li>In a large bowl, combine the water, rice, milk, salt, poultry seasoning and pepper. </li>\n<li>Pour into a greased 13-in. x 9-in. baking dish. Top with chicken.</li>\n<li>Cover and bake at 350° for 55 minutes or until chicken juices run clear. </li>\n<li>Garnish with parsley.</li>\n</ol>\n</div>
164950	Quick Chicken and Dumplings	\N	\N	\N	https://spoonacular.com/recipeImages/Quick-Chicken-and-Dumplings-164950.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat 1 1/2 cups milk, the peas and carrots, chicken and soup to boiling in 3-quart saucepan, stirring frequently.</li>\n<li>2</li>\n<li>Stir Bisquick mix and 1/3 cup milk until soft dough forms. Drop dough by 8 spoonfuls onto chicken mixture (do not drop directly into liquid). Sprinkle with paprika.</li>\n<li>3</li>\n<li>Cook uncovered over low heat 10 minutes. Cover and cook 10 minutes longer.</li>\n</ol>\n</div>
615508	Simple Roast Chicken with Garlic and Lemon	\N	\N	\N	https://spoonacular.com/recipeImages/Simple-Roast-Chicken-with-Garlic-and-Lemon-615508.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 450F with rack in center.</li>\n<li>Remove the giblets from the chicken then trim the excess fat from around the chicken cavity then rinse and thoroughly dry the chicken. (The drier the chicken, the crispier the skin.) </li>\n<li>Place the chicken in a roasting pan, baking dish or cast iron skillet.Melt the butter with the garlic in a small saucepan over medium-low heat. </li>\n<li>Brush the melted garlic butter all over the chicken. Season the chicken liberally all over (including inside the cavity) with salt and pepper. </li>\n<li>Place the two lemon halves and the sprigs of rosemary inside the cavity.Tie the legs together with kitchen twine. (Keep it simple with a loop around each leg and knotted in the center.)Roast the chicken for about 1 hour, basting it every 15 minutes by using a spoon and tilting the pan to collect the juices then spooning them atop the chicken, until the internal temperature reaches 165F. (When testing the temperature with a meat thermometer, insert it into the breast but do not touch the bone for the most accurate reading.) Rotate the pan after every time you baste the chicken to guarantee even cooking.</li>\n<li>Remove the chicken from the oven and transfer it to a cutting board. Allow the chicken to rest for 10 minutes before slicing and serving.Kelly's Note:It's important to baste the chicken every 15 minutes so that the minced garlic stays moist and doesn't burn. If you don't want to baste the chicken as frequently, simply smash the cloves of garlic (rather than mince them) and place them inside the cavity of the chicken then baste the chicken two to three times while it's roasting.The total cooking time will depend on a variety of factors, including the weight of your chicken and how heat circulates within your specific oven.</li>\n</ol>\n</div>
115813	Braised Chicken with Shallots, Garlic, and Balsamic Vinegar	\N	\N	\N	https://spoonacular.com/recipeImages/braised-chicken-with-shallots-garlic-and-balsamic-vinegar-2-115813.png	http://www.epicurious.com/recipes/food/views/Braised-Chicken-with-Shallots-Garlic-and-Balsamic-Vinegar-105589
42099	Citrus-and-Ginger-Roasted Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/citrus-and-ginger-roasted-chicken-42099.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to  Finely grate the zest of 1 lemon and 1 orange. Quarter the zested lemon and orange. Set the chicken on a rack in a roasting pan. In a small bowl, combine the citrus zests with 1 tablespoon of the ginger. Generously season the cavity of the chicken with salt and pepper and all of the zest mixture. Stuff as many lemon and orange quarters inside the chicken as will fit.</li>\n<li>Juice the remaining 2 lemons and 1 orange. In a small bowl, mix the citrus juice with the remaining 2 tablespoons of ginger, the olive oil and the honey. </li>\n<li>Brush the chicken with the juice mixture and roast, basting with the juice every 20 minutes, for 1 1/4 hours, or until an instant-read thermometer inserted in the thickest part of a thigh registers  If the skin browns too quickly, cover the chicken with foil.</li>\n\n<li>Transfer the chicken to a cutting board and let rest for 15 minutes. </li>\n<li>Pour the pan juices into a glass measuring cup and skim off the fat. </li>\n<li>Remove the chicken skin and discard, carve the meat and transfer to plates. </li>\n<li>Serve with the pan juices.</li>\n</ol>\n</div>
484691	Crock-Pot Easy Chicken With Mushrooms and Peas	\N	\N	\N	https://spoonacular.com/recipeImages/Crock-Pot-Easy-Chicken-With-Mushrooms-and-Peas-484691.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse off chicken and pat dry.</li>\n<li>Place in bottom of your crock-pot, breast side up.</li>\n<li>Pour in broth.</li>\n<li>Add mushrooms, pepper and garlic powder.Cover and cook on low for 8-10 hours.</li>\n<li>Add frozen peas in last hour of cooking.Push the peas down into the liquid around the chicken.Carefully remove chicken from the crock when done.Spoon out vegetables and serve with broth.NOTE: To make part two of this meal, Crock-Pot Italian Chicken Noodle Casserole, keep one whole breast aside (more if desired).</li>\n</ol>\n</div>
443795	Peanutty Chicken Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Peanutty-Chicken-Soup-443795.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a Dutch oven, brown chicken in 2 tablespoons oil; drain. </li>\n<li>Brush chicken with soy sauce; sprinkle with salt. </li>\n<li>Add water. Bring to a boil. Reduce heat; cover and simmer for 30-35 minutes or until chicken juices run clear.</li>\n<li>Meanwhile, in a food processor, combine the tomatoes, red peppers and onion. Cover and process until blended.</li>\n<li>In a large saucepan, heat remaining oil over medium heat; add tomato mixture. Bring to a boil. Reduce heat; cook and stir for 5-7 minutes or until thickened. </li>\n<li>Remove from the heat; stir in peanut butter until blended. </li>\n<li>Add to the chicken; heat through.</li>\n</ol>\n</div>
649072	Korean Roast Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Korean-Roast-Chicken-649072.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place chicken skin side down in large baking dish. </li>\n<li>Combine soy sauce and remaining ingredients. </li>\n<li>Pour over chicken. </li>\n<li>Bake, uncovered, at 375 degrees for 45 minutes. Turn each piece and continue baking for 10 to 15 minutes until done.</li>\n</ol>\n</div>
706454	Mesquite-Smoked Beer Can Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/mesquite-smoked-beer-can-chicken-706454.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Soak wood chips in water for 30 minutes; drain well. Preheat grill to medium-high heat using both burners. After preheating, turn the left burner off (leave the right burner on). Pierce the bottom of an aluminum foil pan liberally with the tip of a knife. </li>\n<li>Place pan on heat element on heated side of grill; add wood chips to pan. </li>\n<li>Remove giblets and neck from chicken, and discard. Starting at the neck cavity, loosen skin from breasts and drumsticks by inserting fingers, gently pushing between skin and meat. </li>\n<li>Combine oil and next 5 ingredients (through black pepper) in a bowl. Rub spice mixture under loosened skin and over drumsticks and breasts; let stand 20 minutes. Discard 6 ounces beer from can. Holding chicken upright with the body cavity facing down, insert beer can into cavity. </li>\n<li>Place chicken, upright, on grill rack covering left burner, spreading legs out to form a tripod. Cover and grill 1 1/2 hours or until a thermometer inserted in thigh registers  </li>\n<li>Place chicken and can on cutting board; let stand 10 minutes. Discard can and skin.</li>\n</ol>\n</div>
526278	Steamed Chicken with Sand Ginger Powder	\N	\N	\N	https://spoonacular.com/recipeImages/Steamed-Chicken-with-Sand-Ginger-Powder-526278.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse chicken and wipe dry with paper towels. Season with salt, pepper and wine on skin and inside. Leave it for a while, then rub sand ginger powder evenly on chicken on all sides.</li>\n</ol>\n</div>
526548	Chicken and Rice Casserole	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-Rice-Casserole-526548.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350F.</li>\n<li>Mix all the ingredients together in a 9 x 13 casserole dish placing the chicken on top to sink into the liquid.</li>\n<li>Bake covered with aluminum foil until chicken is done and the rice is tender. About 1½ to 2 hours. (Optional) Just before the casserole is finished cooking remove the aluminum foil; move the chicken pieces to the top, and brown them a little bit.</li>\n<li>Let the casserole rest for about 15 minutes before serving.</li>\n</ol>\n</div>
477720	Roast Chicken with Lemon and Rosemary	\N	\N	\N	https://spoonacular.com/recipeImages/Roast-Chicken-with-Lemon-and-Rosemary-477720.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 425 degrees with the skillet inside the oven. When the skillet and oven have preheated, remove the skillet from the oven and place the chicken inside of the skillet.</li>\n<li>Place lemon quarters, rosemary sprigs, and garlic in the cavity of the chicken. Tie legs using kitchen twin if you so choose.Coat the chicken well with olive oil or softened butter and then sprinkle with salt and pepper.Roast chicken for 15-20 minutes per pound or until an internal probe registers 165 degrees when inserted into the breast of the chicken.</li>\n<li>Remove from the oven and allow to rest for about 5-10 minutes to allow the juices to return to the meat.Use pan juices to baste the chicken, if desired.</li>\n<li>Garnish with lemon quarters and rosemary sprigs, optional.</li>\n</ol>\n</div>
125529	Ugandan Plantains With Chicken Stew	\N	\N	\N	https://spoonacular.com/recipeImages/ugandan-plantains-with-chicken-stew-2-125529.jpg	http://www.food.com/recipe/ugandan-plantains-with-chicken-stew-235859
649827	Lemon, Garlic and Thyme Roast Chicken – Quick and Easy Method	\N	\N	\N	https://spoonacular.com/recipeImages/Lemon--Garlic-and-Thyme-Roast-Chicken--Quick-and-Easy-Method-649827.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat your oven to 220 C (only for 10 minutes, before turning it down to 180 C)Take lemon zest,roasted garlic, butter and 1/2 the bunch of thyme and fill the underside of the chicken skin. This way all your flavours are seeping into your meat.Pat chicken dry with paper towel, rub the chicken all over with a 2tsp of salt, pepper and olive oil. Not only are you further flavouring the chicken, but the chicken skin will be crispier when roasted.Put chicken on to a roasting pan, pour lemon juice around it. Put lemon skins and remaining thyme underneath the chicken.Roast for 10 minutes on 220C, then lower the heat to 180 C and cook for a further 25- 35 mins depending on how large the chicken is.You can check if your chicken is ready by inserting a skewer/ fork into the thickest part ( thigh). If the juices run clear, your chicken is ready. If its still is pink, leave it in for a couple more minutes.Take chicken out, keep warm and rest the chicken while you make the sauce.Sauce on the side: Deglaze the roasting pan with a little white wine and chicken stock, bring to a simmer. </li>\n<li>Add a cornflour mixture (water and cornflour) till you are happy with the consistency of the sauce. Season to tasteYUM, its all the lemony, buttery, garlicky thyme goodness</li>\n</ol>\n</div>
494248	[] Dan Dan Noodles	\N	\N	\N	https://spoonacular.com/recipeImages/[]-Dan-Dan-Noodles-494248.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large pan, add cooking oil. When the oil is hot, add mince chicken and pepper. </li>\n<li>Saute until golden brown. Season with light soy sauce to taste and a couple drops of sesame oil. </li>\n<li>Transfer to a plate and keep warm.Wash and dry the pan. </li>\n<li>Add a teaspoon of oil. When the oil is hot, add garlic and the white section of the spring onion and saute until aromatic. On very low heat, add tahini, sweet soy sauce and hot water. Stir until well combined. Don't be alarmed if the tahini appears to be "curdled" initially, just keep stirring as the mixture will become smooth. Stir in chilli oil and season with light soy sauce. Keep warm while you cook the spaghetti.Cook the spaghetti according to packet instructions. </li>\n<li>Drained.Toss the spaghetti and mince chicken into the sauce until well combined.</li>\n<li>Garnish with the green section of the spring onions and serve immediately.</li>\n</ol>\n</div>
84694	Tomato-and-Garlic-Stuffed Chicken Cutlets	\N	\N	\N	https://spoonacular.com/recipeImages/tomato-and-garlic-stuffed-chicken-cutlets-2-84694.png	http://www.epicurious.com/recipes/food/views/Tomato-and-Garlic-Stuffed-Chicken-Cutlets-239250
43883	Baked Chicken And Potatoes	\N	\N	\N	https://spoonacular.com/recipeImages/baked_chicken_and_potatoes-43883.jpg	http://magpiesrecipes.blogspot.com/2011/06/easy-baked-chicken-and-kerala-kitchen.html
510892	Creamy Chicken Parmesan Pasta	\N	\N	\N	https://spoonacular.com/recipeImages/Creamy-Chicken-Parmesan-Pasta-510892.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook pasta according to directions.Meanwhile in a Skillet add chicken broth and chicken. Cook until chicken is no longer pink. Stir in Progresso Recipe Starter in Creamy Parmesan. Cook and stir until thick and bubbly. Stir in mozzarella cheese.Evenly divide pasta between four plates and evenly divide pasta sauce over the top of the spaghetti. </li>\n<li>Garnish with shredded Parmesan cheese and fresh basil.</li>\n</ol>\n</div>
707663	Italian Roasted Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/italian-roasted-chicken-707663.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to  </li>\n<li>Remove skin from chickens; reserve skin for Dinner  Discard necks and giblets. </li>\n<li>Place chickens on the rack of a broiler pan coated with cooking spray. Chop herb leaves; place stems in cavities. </li>\n<li>Combine leaves, garlic, and oil in a small bowl. </li>\n<li>Spread oil mixture evenly over chickens. Sprinkle chickens with pepper and salt. Squeeze lemon juice over chickens; place lemon halves in cavities. Secure chicken legs with twine. </li>\n<li>Pour 3/4 cup water into bottom of broiler pan. </li>\n<li>Bake at 400 for 1 hour and 20 minutes or until a thermometer inserted in thigh registers  </li>\n<li>Let stand ?15 minutes. </li>\n<li>Remove meat from bones. Reserve bones for stock in Dinner 3; reserve meat from 1 chicken for Dinner </li>\n</ol>\n</div>
167036	Grilled Herb Chicken on a Can	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-Herb-Chicken-on-a-Can-167036.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>If using charcoal grill, place drip pan directly under grilling area, and arrange coals around edge of firebox. </li>\n<li>Heat coals or gas grill for indirect heat. In small bowl, mix paprika, salt, garlic powder, onion powder and pepper.</li>\n<li>2</li>\n<li>Fold wings of chicken across back with tips touching. Sprinkle paprika mixture inside cavity and over outside of chicken; rub with fingers.</li>\n<li>3</li>\n\n<li>Pour 1/2 cup of beer from can. Hold chicken upright, with opening of body cavity down; insert beer can into cavity. Insert barbecue meat thermometer so tip is in thickest part of inside thigh muscle and does not touch bone.</li>\n<li>4</li>\n<li>Cover and grill chicken upright over drip pan or over unheated side of gas grill over medium heat 1 hour 15 minutes to 1 hour 30 minutes or until thermometer reads 180°F and juice is no longer pink when center of thigh is cut.</li>\n<li>5</li>\n<li>Using tongs, carefully lift chicken and place in 13x9-inch pan, holding large metal spatula under beer can for support. </li>\n<li>Let stand 15 minutes before carving. </li>\n<li>Remove beer can; discard.</li>\n</ol>\n</div>
601217	Fried Chicken with Beer – beer adds a very flavorful and earthly taste to so many things. Fried chicken with beer is fabulous	\N	\N	\N	https://spoonacular.com/recipeImages/Fried-Chicken-with-Beer--beer-adds-a-very-flavorful-and-earthly-taste-to-so-many-things--Fried-chicken-with-beer-is-fabulous-601217.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine and mix well all dry ingredients. Dip chicken into beer then in flour mixture. Cook in a deep fat fryer at 350 degrees. Turning over once, do not cover.</li>\n</ol>\n</div>
535745	Not My Grandmother’s Chicken Cordon Blue	\N	\N	\N	https://spoonacular.com/recipeImages/Not-My-Grandmothers-Chicken-Cordon-Blue-535745.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 375 degrees.Lay out the chicken slices. Season lightly with salt and pepper on both sides. Top each one with a slice of Virginia ham and a slice of Swiss cheese. </li>\n<li>Roll up and secure with toothpicks.Lay out three bowls for dredging and put flour in one, egg in the second and breadcrumbs in the third. Dredge each chicken roll first in flour, then in egg and finally in the breadcrumbs. Set aside.In a deep, oven-safe skillet, add the olive oil and heat over medium heat. Once it's hot, place the chicken in the pan and cook for 4-5 minutes per side until browned. </li>\n<li>Transfer the skillet to the oven and bake for about 20 minutes, or until cooked through.</li>\n</ol>\n</div>
290013	Grilled Chicken with Dijon and Meyer Lemon	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-chicken-with-dijon-and-meyer-lemon-290013.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Watch how to make this recipe.</li>\n\n<li>Combine the lemon juice, zest, mustard, rosemary and crushed red pepper in a small bowl. </li>\n<li>Add 1 to 2 tablespoons of olive oil to the mustard mixture to loosen it.  Paint this mixture generously all over the chicken and let sit for up to 2 hours at room temperature or overnight in the refrigerator.  If you have any of the mustard mixture left over, save it for repainting while the chicken is cooking.Preheat the grill to medium (you want the chicken to cook on the grill as long as possible without burning to develop lovely crispy, tasty, tangy skin). </li>\n<li>Place the chicken on the grill skin side down and cook for 5 to 6 minutes. If the chicken flares up, move it to a cooler part of the grill; you don't want sooty film on the chicken (it won't taste good).Once the chicken has started to brown and crisp, it's a good idea to close the grill to allow the heat to cook the chicken from all directions. You want to cook the chicken skin side down for a total of 10 to 12 minutes, then turn it over and cook it for another 10 to 12 minutes. If you're using a grill pan, you can transfer the chicken to a 375 degree F oven when it's ready to flip so it can finish cooking. If there is leftover mustard mixture, use it to paint the skin of the chicken on the second side. The chicken is done when an instant-read thermometer registers 165 degrees F.When the chicken is nearly done, place the lemon halves on the grill cut side down and leave them alone until brown and caramelized, 5 to 6 minutes. (These will smell great while they're grilling!)</li>\n<li>Remove the chicken from the heat and serve with the grilled lemon for extra lemony goodness.Cook's Note: During the cooking time it is a great idea to close the grill to allow the heat to cook from all directions. If grilling indoors, the chicken can be transferred to a preheated 375 degree F oven to finish cooking once the grill marks have been established.</li>\n</ol>\n</div>
511195	Balsamic Glazed Chicken and Roasted Potatoes	\N	\N	\N	https://spoonacular.com/recipeImages/Balsamic-Glazed-Chicken-and-Roasted-Potatoes-511195.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a ziplock bag add chicken and potatoes; set aside.In a small bowl, add olive oil, balsamic vinegar, dijon mustard and Italian seasoning. </li>\n<li>Whisk together until combined. </li>\n<li>Add to chicken and potatoes and marinate for at least 30 minutes or up to 4 hours, depending on how strong of a balsamic taste you like. I marinated for one hour.Preheat oven to 375 degrees</li>\n<li>Spray a 9 x 13 baking dish with cooking spray and add chicken and potato mixture, along with marinade.</li>\n<li>Spread the potatoes along sides of the chicken.Cover and bake in the oven for 15 minutes. </li>\n<li>Mix the potatoes, uncover and bake for 20- 25 minutes longer or until chicken is no longer pink and potatoes are fork tender.</li>\n<li>Serve immediately</li>\n</ol>\n</div>
478432	How to cook: Sinampalukang manok (sour soup with chicken and tamarind leaves)	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-cook--Sinampalukang-manok-(sour-soup-with-chicken-and-tamarind-leaves)-478432.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the vegetable oil. </li>\n<li>Saute the onion, garlic and tomatoes.</li>\n<li>Pour in four to five cups of water and add the tamarind leaves. Bring to the boil (watch the tamarind leaves change color), add the chicken, bring to the boil once more, season with patis (fish sauce) and simmer for about 40 minutes.Taste the broth. If it isn’t sour enough for you, add some tamarind juice or tamarind paste. When the broth tastes perfect, simmer for five minutes longer then turn off the heat.Ladle the chicken and soup into individual bowls, making sure that each bowl gets a nice piece of chicken and a generous amount of tamarind leaves.</li>\n<li>Serve hot.</li>\n</ol>\n</div>
445704	Chicken and Potato Bake	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-Potato-Bake-445704.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place chicken in a greased 13-in. x 9-in. baking dish. Arrange potatoes around chicken. </li>\n<li>Drizzle with dressing; sprinkle with Italian seasoning and Parmesan cheese.</li>\n<li>Cover and bake at 400° for 20 minutes. Uncover; bake 20-30 minutes longer or until potatoes are tender and chicken juices run clear.</li>\n</ol>\n</div>
519514	Cilantro Mesquite BBQ Chicken Taquitos	\N	\N	\N	https://spoonacular.com/recipeImages/Cilantro-Mesquite-BBQ-Chicken-Taquitos-519514.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 425 degrees. </li>\n<li>Mix the chicken, BBQ sauce, cheese, seasoned salt and cilantro in a bowl. </li>\n<li>Place tortillas on plate, cover with plastic wrap and warm in microwave 30 seconds so they are easy to roll.</li>\n<li>Spread 1/10 of chicken mixture in center of tortilla. </li>\n<li>Roll up and place seam side down in 9x13 in. glass baking dish. Repeat until all the tortillas are filled. Spray the top of the tortillas with non-stick baking spray. Sprinkle sea salt over the top of the tortillas.</li>\n<li>Bake 20-25 minutes or until edges of shells are golden brown.</li>\n</ol>\n</div>
20418	Rainbow Chard And Ricotta Stuffed Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/rainbow_chard_and_ricotta_stuffed_chicken-20418.jpg	http://cookalmostanything.blogspot.com/2007/07/more-rainbow-chard.html
159714	Easy Chicken and Dumplings	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Chicken-and-Dumplings-159714.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In 3-quart saucepan, heat 1 1/2 cups milk, the frozen peas and carrots, chicken and soup to boiling.</li>\n<li>2</li>\n<li>In small bowl, stir together Bisquick® mix and 1/3 cup milk until soft dough forms. Drop dough by 8 spoonfuls onto chicken mixture (do not drop directly into liquid). Sprinkle with paprika.</li>\n<li>3</li>\n<li>Cook uncovered over low heat 10 minutes. Cover and cook 10 minutes longer.</li>\n</ol>\n</div>
38840	Paprika Chickens With Garlic And Potatoes	\N	\N	\N	https://spoonacular.com/recipeImages/paprika_chickens_with_garlic_and_potatoes-38840.jpg	http://college.biggirlssmallkitchen.com/2011/03/why-did-the-chicken-cross-the-kitchen%E2%80%A6and-now-what-do-i-do-with-it.html
137151	Weight Watchers Chicken and Cheese Casserole	\N	\N	\N	https://spoonacular.com/recipeImages/weight-watchers-chicken-and-cheese-casserole-2-137151.jpg	http://www.food.com/recipe/weight-watchers-chicken-and-cheese-casserole-158634
38847	Roast Chicken With Garlic And Thyme	\N	\N	\N	https://spoonacular.com/recipeImages/roast-chicken-with-garlic-and-thyme-2-38847.jpg	http://www.marthastewart.com/314123/roast-chicken-with-garlic-and-thyme
200784	Sunday Supper: Beer Can Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Sunday-Supper--Beer-Can-Chicken-200784.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Preheat oven to 425 [°].  </li>\n<li>Cut each potato into pieces 6 pieces and place in 9X13 inch baking dish.  </li>\n<li>Add 6 cloves garlic and sprigs of thyme, drizzle with olive oil and toss with salt and pepper.</li>\n<li>2</li>\n<li>Rinse and dry chicken.  Open beer and drink half, add extra garlic clove and a few sprigs of thyme to beer.  Push potatoes to each end of baking dish and place open beer in center.  Chop 1 teaspoon worth of thyme leaves.  </li>\n<li>Drizzle chicken with olive oil and sprinkle with chopped thyme, salt and pepper.  Carefully ease beer can into chicken cavity and sit in center of baking dish surrounded by potatoes.</li>\n<li>3</li>\n<li>Roast chicken until internal temperature reaches 160[°], about 90 minutes.  Allow chicken to rest 10 minutes before carving and serve with potatoes and more beer.</li>\n</ol>\n</div>
274643	Oven-Fried Crunchy Parmesan Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Oven-Fried-Crunchy-Parmesan-Chicken-274643.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>PREHEAT oven to 375Â°F.  </li>\n<li>Mix flour and seasonings in shallow dish.  </li>\n<li>Add chicken; toss to coat.  Beat egg and water in separate shallow dish.  </li>\n<li>Mix cheese and corn flakes in third shallow dish. DIP chicken in egg mixture, then in cheese mixture, turning over to evenly coat both sides.  </li>\n<li>Place in 13x9-inch baking dish; drizzle with butter. BAKE 1 hour or until chicken is cooked through (180Â°F).</li>\n</ol>\n</div>
749952	Quick and Easy Sweet and Sticky Orange Chicken Glaze	\N	\N	\N	https://spoonacular.com/recipeImages/quick-and-easy-sweet-and-sticky-orange-chicken-glaze-749952.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Watch how to make this recipe.</li>\n<li>To make the glaze: In a medium bowl, mix the hoisin, orange zest and enough orange juice so the hoisin is a little looser but still thick enough to stick to the chicken.Toss with hot chicken and sprinkle with sesame seeds to coat.</li>\n</ol>\n</div>
471483	BBQ Ranch Chicken Salad	\N	\N	\N	https://spoonacular.com/recipeImages/BBQ-Ranch-Chicken-Salad-471483.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine chicken, Marzetti Classic Ranch Dressing, barbecue sauce, celery and carrots in medium bowl. Season, if desired, with salt and black pepper. </li>\n<li>Serve on your favorite rolls.</li>\n</ol>\n</div>
160342	Oven-Fried Ranch Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Oven-Fried-Ranch-Chicken-160342.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In large resealable food-storage plastic bag, mix buttermilk, dressing mix and chicken. Seal bag; turn bag several times to coat chicken. Refrigerate at least 1 hour or overnight.</li>\n<li>2</li>\n\n<li>Heat oven to 425°F. Spray 15x10x1-inch pan with cooking spray. In shallow dish, mix breading ingredients. </li>\n<li>Remove chicken pieces one at a time from buttermilk mixture. Dip chicken in breading, turning to coat completely; shake off excess. </li>\n<li>Place chicken, bone side down, in pan. Lightly spray top of chicken with cooking spray.</li>\n<li>3</li>\n\n<li>Bake 35 to 40 minutes or until juice of chicken is clear when thickest piece is cut to bone (170°F for breasts; 180°F for thighs and drumsticks). </li>\n<li>Garnish with parsley sprigs.</li>\n</ol>\n</div>
496462	Smoked Chicken and Apple Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Smoked-Chicken-and-Apple-Salad-496462.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients except romaine in in a large bowl.  Toss gently to dress.</li>\n<li>Place 2 or 3 romaine tips on a serving plate. Mound 1/4 of the salad on the lettuce, arrange a few apple slices nicely on top.</li>\n<li>Serve immediately.What I would have done differently had I thought of it at the time:In the photo shown above, I use a golden delicious apple, not a Granny Smith as directed in the recipe.  The golden delicious, while good, simply wasn’t tart enough to compliment as well as it should.Also, the next time I make this (and there will be many more next times) I’m going to add some walnuts for a bit of added crunch.  I’ll also use a bit less chicken so that the apples really shine.</li>\n</ol>\n</div>
611209	Skillet-Roasted Whole Chicken with Lemon and Potatoes	\N	\N	\N	https://spoonacular.com/recipeImages/Skillet-Roasted-Whole-Chicken-with-Lemon-and-Potatoes-611209.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat oven to 425F.</li>\n<li>2</li>\n\n<li>Cut potatoes into halves, or into quarters if larger; place cut side down in 10-inch cast iron skillet. Sprinkle potatoes with dash salt. Layer about 5 lemon slices over top.</li>\n<li>3</li>\n<li>Pat chicken dry with paper towels; remove any giblets. Stuff cavity of chicken with any remaining lemon slices. In small bowl, stir together sage, garlic, 1 teaspoon salt, the pepper and olive oil. Rub sage-garlic mixture beneath breast skin of chicken and all over outside of chicken skin. </li>\n<li>Place chicken on bed of potatoes and lemon.</li>\n<li>4</li>\n<li>Roast about 1 hour 30 minutes or until instant-read thermometer inserted into thickest part of thigh reads 165F. </li>\n<li>Let chicken rest about 15 minutes before carving.</li>\n</ol>\n</div>
521148	Chicken and asparagus eggdrop soup	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-asparagus-eggdrop-soup-521148.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Boil the chicken with the half onion and garlic cloves in about eight cups of water for about 30 minutes.Scoop out the chicken, cool, pick the meat and discard the bones.Strain the broth to remove any impurities (you can leave the garlic and onion though).Beat the egg.Reheat the broth and bring to the boil. </li>\n<li>Add the chicken meat. Season with patis. </li>\n<li>Add the asparagus. Cook for a minute. Turn off the heat. </li>\n<li>Pour the beaten egg in a thin stream. Do not stir for about ten seconds to allow the egg to set partially. Then, stir. Season with freshly ground black pepper. </li>\n<li>Serve hot.</li>\n</ol>\n</div>
521279	Sinampalukang manok (sour soup with chicken and tamarind leaves)	\N	\N	\N	https://spoonacular.com/recipeImages/Sinampalukang-manok-(sour-soup-with-chicken-and-tamarind-leaves)-521279.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the vegetable oil. </li>\n<li>Saute the onion, garlic and tomatoes.</li>\n<li>Pour in four to five cups of water and add the tamarind leaves. Bring to the boil (watch the tamarind leaves change color), add the chicken, bring to the boil once more, season with patis (fish sauce) and simmer for about 40 minutes.Taste the broth. If it isn’t sour enough for you, add some tamarind juice or tamarind paste. When the broth tastes perfect, simmer for five minutes longer then turn off the heat.Ladle the chicken and soup into individual bowls, making sure that each bowl gets a nice piece of chicken and a generous amount of tamarind leaves.</li>\n<li>Serve hot.</li>\n</ol>\n</div>
537708	Queso Fresco & Chipotle Chicken and Veggie Wraps	\N	\N	\N	https://spoonacular.com/recipeImages/Queso-Fresco---Chipotle-Chicken-and-Veggie-Wraps-537708.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>On one side of the tortilla wrap, spread both of the wedges of The Laughing Cow Light Queso Fresco & Chipotle. Arrange your preferred filling ingredients, making sure not to fill the tortilla too full. Starting at one end, tightly roll the tortilla up like a pinwheel. Slice into 2 - 3 inch sections. Hold together with a toothpick if needed. </li>\n<li>Serve with salsa.</li>\n</ol>\n</div>
365791	White Pizza with Chicken, Pesto and Pine Nuts	\N	\N	\N	https://spoonacular.com/recipeImages/white-pizza-with-chicken-pesto-and-pine-nuts-365791.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 450 degrees F.</li>\n<li>Place pizza crust on a large baking sheet and top with pesto, chicken, cheese and pine nuts. </li>\n<li>Bake 8 to 10 minutes, until cheese melts and crust is golden brown.</li>\n</ol>\n<div class="subRecipeInstructionTitle">CATEGORIES:</div>\n<ol>\n<li>Chicken</li>\n<li>Dinner</li>\n<li>Pizza</li>\n<li>View All</li>\n<li>Main Ingredient</li>\n<li>Chicken</li>\n<li>Nuts</li>\n<li>Mozzarella</li>\n<li>Course</li>\n<li>Dinner</li>\n<li>Lunch</li>\n<li>Dish</li>\n<li>Pizza</li>\n<li>Cooking Style</li>\n<li>Easy</li>\n<li>Season</li>\n<li>Spring</li>\n</ol>\n</div>
136486	Moroccan-Style Roast Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/moroccan-style-roast-chicken-2-136486.jpg	http://www.food.com/recipe/moroccan-style-roast-chicken-421201
292273	Braised Chicken with Onions, Garlic, and Balsamic Vinegar	\N	\N	\N	https://spoonacular.com/recipeImages/braised-chicken-with-onions-garlic-and-balsamic-vinegar-292273.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook bacon in a deep, 12-inch, heavy skillet over moderately low heat, turning twice, until crisp, about 8 minutes. </li>\n<li>Transfer with a slotted spoon to paper towels to drain and reserve bacon fat in skillet.While bacon is cooking, pat chicken dry and season with salt and pepper. Brown in bacon fat, beginning with skin side down, in 2 batches, over moderately high heat, turning, about 8 minutes. </li>\n<li>Transfer browned chicken with tongs to a plate, and pour off all but 2 tablespoons fat from skillet.Lower heat, add onions to skillet and cook, covered, stirring occasionally, until soft and pale golden, about 10 minutes.</li>\n<li>Remove lid and cook onions, stirring, until deep golden, about 10 minutes more. </li>\n<li>Add garlic and 1 cup water to skillet and boil, stirring, 1 minute.Return chicken to skillet, turning pieces to coat, then arrange them skin sides up and gently simmer, covered, until chicken is cooked through and garlic is tender, about 30 minutes.</li>\n<li>Transfer chicken with tongs to a serving dish. </li>\n<li>Add vinegar to sauce and boil, uncovered, mashing garlic with back of a spoon or a potato masher, until slightly thickened. Season sauce with salt and pepper and pour over chicken, then sprinkle with bacon.</li>\n</ol>\n</div>
382457	Jamaican Jerk Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/jamaican-jerk-chicken-382457.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Smash the allspice as fine as possible using a mortar and pestle. Put in a food processor and add the seasoning salt, peppers, green onions, thyme and 1/2 cup water. Blend to the consistency of lumpy oatmeal and pour into a bowl.Rub the chicken with the jerk seasoning and stuff the jerk seasoning between the skin and the meat. </li>\n<li>Place the chicken pieces into a storage pan and let marinade overnight (at least 12 hours).</li>\n<li>Remove the excess seasoning from the chicken. </li>\n<li>Heat the grill to high heat (about 350 degrees F) and then place the chicken meat-side down first as to not let the chicken burn too quickly. Flip the chicken every 5 to 7 minutes until the skin has a nice brown color with grill marks, and then every 7 to 10 minutes on lower heat until cooked, around 40 minutes total or until the internal temperature of the chicken reaches 165 degrees F.Chop each quarter into 4 to 5 pieces to get the real Jamaican jerk experience.This recipe was provided by professional chefs and has been scaled down from a bulk recipe provided by a restaurant. The Food Network Kitchens chefs have not tested this recipe, in the proportions indicated, and therefore, we cannot make any representation as to the results.</li>\n</ol>\n</div>
136838	Roasted Chicken With Rosemary, Lemon and Garlic	\N	\N	\N	https://spoonacular.com/recipeImages/roasted-chicken-with-rosemary-lemon-and-garlic-2-136838.jpg	http://italian.food.com/recipe/roasted-chicken-with-rosemary-lemon-and-garlic-172790
489236	Sweet BBQ Chicken Kabobs and Our Menu Plan	\N	\N	\N	https://spoonacular.com/recipeImages/Sweet-BBQ-Chicken-Kabobs-and-Our-Menu-Plan-489236.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Soak wooden skewers in water about 15-20 minutes. Thread chicken, peppers and pineapple onto skewers. </li>\n<li>Mix barbecue sauce and orange juice concentrate in a small bowl and set aside. </li>\n<li>Heat the grill to medium-high. </li>\n<li>Brush half of the sauce onto the skewers. Grill 8-10 minutes or until chicken is done, turning occasionally. </li>\n<li>Brush on remainder of sauce while skewers are cooking.</li>\n</ol>\n</div>
530277	Chicken with Lemon, Oregano and Feta Cheese	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-with-Lemon--Oregano-and-Feta-Cheese-530277.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oven to 375 degrees. Coat the chicken with the oil; arrange the pieces, skin-side up, in a large roasting pan. Sprinkle the chicken with the oregano, lemon juice, salt and pepper, Top each piece of chicken with a piece of butter.Cook the chicken until the breasts are just done, about 30 minutes. </li>\n<li>Remove the breasts and continue to cook the legs until done, about 5 minutes longer. </li>\n<li>Remove the roasting pan from the oven; return the breasts to the pan. Top the chicken pieces with the feta cheese. Press any cheese that rolls off into the pan back onto the chicken. Baste the chicken with the pan juices.</li>\n<li>Heat the broiler. Broil chicken until the cheese is melted and golden brown, about 2 minutes. </li>\n<li>Serve with the pan juices.</li>\n</ol>\n</div>
38830	Chicken With Onions And Garlic	\N	\N	\N	https://spoonacular.com/recipeImages/chicken-with-onions-and-garlic-2-38830.jpg	http://www.marthastewart.com/314948/chicken-with-onions-and-garlic
481242	Pollo all’ischitana (Ischia-Style Chicken)	\N	\N	\N	https://spoonacular.com/recipeImages/Pollo-allischitana-(Ischia-Style-Chicken)-481242.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Melt a good dollop of lard in a sauté pan or braiser large enough to hold all the chicken pieces in one layer. When the lard is melted and hot, add the chicken pieces and brown them well on all sides. Season the chicken pieces well with salt and pepper on all sides, turning them as you go. Now add a good glug of white wine and the tomato.</li>\n<li>Let the chicken simmer uncovered in the wine and tomato over moderate heat, turning them from time to time, until the meat is quite tender, about 30-45 minutes, depending on the size and age of your chicken. By the time the chicken is cooked, the tomatoes will have melted and the wine will have reduced down to glossy sauce that should cling nicely to all the chicken pieces. Just a few minutes before the chicken is done, add the fresh basil and mix well.Adjust the seasoning and serve right away, napping the chicken with any sauce that is left in the pan.</li>\n</ol>\n</div>
276448	Caribbean BBQ Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Caribbean-BBQ-Chicken-276448.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>HEAT grill to medium heat.  Trim and discard excess fat from chicken. MIX seasonings in small bowl until well blended; stir in lime juice to form paste.  Rub onto chicken. PLACE chicken, skin-side up, on grill; cover with lid.  Grill 25 min., turning and brushing with 1/4 cup barbecue sauce after 15 min.  Turn chicken over; brush with remaining barbecue sauce.  Grill 5 min. or until chicken is done (165Â°F).</li>\n</ol>\n</div>
481250	Pollo fritto per Chanukà (Hannukah Fried Chicken)	\N	\N	\N	https://spoonacular.com/recipeImages/Pollo-fritto-per-Chanuk-(Hannukah-Fried-Chicken)-481250.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>The day before, cut up your chicken into ten pieces (two wings, two drumsticks, two thighs, and the breast cut into four pieces, in half along the breastbone and then in half again across). </li>\n<li>Place in a large bowl and marinate with the juice of a whole freshly squeezed lemon, salt, pepper, a finely minced garlic clove or two, a generous grating of nutmeg and a good pour of olive oil. </li>\n<li>Let it marinate in the fridge overnight. </li>\n<li>Mix at least once during this period to ensure even marination.The next day, when you are ready to cook, let the chicken come back to room temperature by removing it from the fridge about an hour ahead of time. In a large, heavy skillet, heat enough olive oil to come at least 2cm (3/4 inch) up the sides until it is quite hot (but not smoking). Then take each piece of chicken (tongs are very useful here) and dredge it successively in flour and then in beaten egg, and then immediately into the hot oil. Fry over moderate heat until the chicken is golden brown on all sides. This should take about 15-20 minutes. If you are not ready to eat the chicken right away, you can keep the pieces warm, on a baking rack set over a cookie sheet in the oven.</li>\n<li>Serve hot, sprinkled with additional salt (preferably some fine sea salt) with some lemon wedges on the side, and accompanied by a nice green salad.</li>\n</ol>\n</div>
481267	Pollo al vino bianco con funghi (Chicken Braised in White Wine with Mushrooms)	\N	\N	\N	https://spoonacular.com/recipeImages/Pollo-al-vino-bianco-con-funghi-(Chicken-Braised-in-White-Wine-with-Mushrooms)-481267.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large sauté pan or braiser large enough to hold your chicken pieces in a single layer, sauté the garlic and rosemary gently in the olive oil until the garlic is lightly browned. </li>\n<li>Remove both garlic and rosemary from the pan.Pat the chicken pieces dry with paper towels, dust them ever so lightly in flour and add them to the oil, raising the heat a bit. Brown the pieces on all sides, turning them from time to time for even cooking. Season generously with salt and pepper.</li>\n<li>Add a generous amount of white wine, enough to come up about 1 cm (1/4 inch) up the pan. Turn the chicken pieces in the wine for a minute or two so they are covered well, then lower the heat and cover. </li>\n<li>Let the chicken simmer gently until it is cooked through and tender. For a young chicken, this should take about 30 minutes. For older or larger chicken the cooking time may be upwards of 45 minutes to an hour.About halfway through the cooking time add your mushrooms. If you are using reconstituted dried mushrooms or very tender fresh ones, you can simply cut them up roughly and add them raw (see Notes). (If using dried mushrooms, add their water, too, as it has lots of flavor.) Then re-cover the pan and continue simmering until the chicken is done through.When the chicken is done, uncover and remove the chicken pieces to a warm serving platter. Check the consistency of the sauce. If it is a bit watery, raise the heat and let it reduce a bit. Taste and adjust for seasoning. Then nap your chicken with the mushrooms and sauce. Top with a bit of minced parsley, if you like, for color</li>\n\n<li>Serve immediately, while still hot, with some nice, crusty bread and a crisp white wine. (Giusti-Lanham and Dodi recommend a Durello or Pinot Grigio.)</li>\n</ol>\n</div>
137287	Parmesan Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/parmesan-chicken-2-137287.jpg	http://www.food.com/recipe/parmesan-chicken-264409
96394	Quick Roasted Chicken with Potatoes, Onions, and Watercress	\N	\N	\N	https://spoonacular.com/recipeImages/quick-roasted-chicken-with-potatoes-onions-and-watercress-2-96394.png	http://www.marthastewart.com/340387/quick-roasted-chicken-with-potatoes-onio
359131	Roast Chicken with Rosemary and Lemon	\N	\N	\N	https://spoonacular.com/recipeImages/359131-556x370.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oven to  Rub the cavity of the chicken with the dried rosemary, 1/4 teaspoon salt, and 1/8 teaspoon pepper and then stuff with the strips of lemon zest and the quartered onion. Twist the wings behind the back of the chicken and tie the legs together. </li>\n<li>Put the chicken, breast-side up, in a roasting pan. Coat the chicken with the oil and sprinkle it with 1/4 teaspoon of salt, 1/8 teaspoon of pepper, and the 1 tablespoon lemon juice.  Roast the chicken until it is just done, 50 to 60 minutes. </li>\n<li>Transfer the bird to a plate and leave to rest in a warm spot for about 10 minutes.  Meanwhile, pour off the fat from the roasting pan. Set the pan over moderate heat and add the water. Bring to a boil, scraping the bottom of the pan to dislodge any brown bits. Boil until reduced to approximately 1/4 cup, about 4 minutes. </li>\n<li>Add any accumulated juices from the chicken along with the remaining 1/4 teaspoon lemon juice and a pinch each of salt and pepper. </li>\n<li>Serve the bird with the pan juices. Menu Suggestions: The simplicity of this chicken means that an almost endless list of accompaniments will work well with it. Among the easiest are vegetables that you can roast in a separate pan alongside the chicken, such as potatoes, squash, asparagus, or fennel. Other good choices include rice, polenta, or mashed potatoes. Wine Recommendation: A straightforward gulpable red wine will pair best with this aromatic dish. Try a Chianti from the Italian region of Tuscany.</li>\n</ol>\n</div>
580342	Easy Hand-Held Pot Pies	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Hand-Held-Pot-Pies-580342.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350º. Spray cookie sheet with cooking spray, set aside.Spray a skillet with cooking spray and cooked diced onion until soft. </li>\n<li>Add remaining ingredients and heat through.Open package of biscuits and flatten each circle out with your fingertips. </li>\n<li>Place chicken filling on one half of the circle and bring the other half over. Press edges with a fork to seal closed. Carefully place on the cookie sheet.Finish each mini pot pie and then bake for about 30-35 minutes or until the outside is golden and the middle is cooked. </li>\n<li>Serve immediately and enjoy!</li>\n</ol>\n</div>
170862	Chicken and Squash Quesadillas	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-Squash-Quesadillas-170862.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In medium bowl, mix cheese, chicken, 1/3 cup salsa and the squash purée.</li>\n<li>2</li>\n<li>Spray 1 side of 1 tortilla with cooking spray; place sprayed side down in 10-inch skillet. </li>\n<li>Spread with one-fourth of the chicken mixture. Top with another tortilla; spray top of tortilla with cooking spray.</li>\n<li>3</li>\n<li>Cook over medium heat about 2 minutes or until golden brown. Carefully turn quesadilla over; cook 1 to 2 minutes or until golden brown. Repeat with remaining tortillas and chicken mixture. To serve, cut quesadillas into wedges. </li>\n<li>Serve with sour cream and additional salsa.</li>\n</ol>\n</div>
220041	Lime & coriander chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Lime---coriander-chicken-220041.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>First, spatchcockthe chicken so thatit will sit flat on thebarbecue. All thismeans is usinga pair of kitchenscissors or a sharpkitchen knife to cutdown either side ofthe parson’s nose tocompletely removethe backbone.Then, place the chicken, breast side up, on achopping board and push down hard to flattenwith your hands. Use a sharp knife to make lotsof deep slashes in the chicken, about three ineach breast and two in each leg.In a mortar and pestle, crush the garlic andpeppercorns together to a grey, mushy paste.Stir the lime juice into the paste, then thechopped coriander. </li>\n<li>Put the chicken in a dishand massage the marinade into the chicken.Cover with cling film and refrigerate for atleast 2 hours, but preferably overnight.To cook the chicken, fire up the barbecue.When the flames die down and the coalsare hot and glowing, lay the chicken on thebarbecue, skin side up, and sprinkle with salt.You will be tempted to keep prodding it andlifting it up, but leave it alone. After 25 mins,the chicken will look like it’s cooked through,but flip it over and give the skin side 10 minsto brown. Lift the chicken onto a choppingboard and leave to rest for a few minutes.You can now carve conventionally but I liketo get a cleaver and chop it straight downinto thick slices. Pile it up on a platter and servescattered with fresh coriander and lime wedges.</li>\n</ol>\n</div>
187337	Chicken, Ham, and Tarragon Pie	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken--Ham--and-Tarragon-Pie-187337.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Roll out the pastry on a floured counter and, using your pie dish as a template, cut out a piece to generously fit the top. From the trimmings, cut a 3/4-inch wide strip (it can be in pieces) to fit around the rim of the dish. Dampen the edges and stick the strips in place around the rim.</li>\n\n<li>Mix the ham and tarragon into the chicken filling, then spoon this into the dish. Dampen the top of the pastry strip and place the pastry round on top.Trim the edges and press down gently. Decorate the top if you wish with pastry shapes made from the trimmings, then brush with the beaten egg and make a small slit in the top for a steam hole. Either freeze or cook within 4 hours (keep the pie in the fridge).</li>\n<li>(F) Cover the pie dish, label, and freeze.(D) </li>\n<li>Let stand overnight in the fridge.(C) </li>\n<li>Remove the pie from the fridge 20 minutes before cooking. Preheat the oven to 375°F. </li>\n<li>Bake the pie for 30 to 35 minutes, or until piping hot and deep golden.</li>\n<li>From The Foolproof Freezer Cookbook: Prepare-ahead meals, Stress-free entertaining, Making the Most of Excess Fruits and Vegetables, Feeding the Family the Modern Way by Ghillie James. Text © 2011 Ghillie James; photographs © 2011 Tara Fisher. Published in 2012 by Kyle Books.</li>\n</ol>\n</div>
39977	Roast Chicken and Onion Tacos	\N	\N	\N	https://spoonacular.com/recipeImages/roast-chicken-and-onion-tacos-39977.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Peel onions and cut lengthwise into 1/2-inch-thick wedges. </li>\n<li>Place in a 12- by 17-inch roasting pan with 2-inch-tall sides. In a small bowl, mix oregano, 1 teaspoon salt, and pepper. </li>\n<li>Add half the oregano mixture and 1 tablespoon olive oil to onions; mix well. Set one or two wire racks (overlap, if necessary) over onions, extending beyond pan sides so racks are not resting directly on onions. </li>\n<li>Remove giblets from chicken; discard or reserve for other uses. With poultry shears or sturdy scissors, cut along one side of the backbone of chicken. Pull bird open and lay, skin side up, on a flat surface; push down to crack bones slightly so bird lies reasonably flat. Pull off and discard lumps of fat. Rinse bird well on both sides; pat dry. Rub remaining 1 tablespoon oil and oregano mixture all over chicken. Set, skin side up, on racks over onions. Roast in a 425 oven until a thermometer reaches 170 when inserted through thickest part of chicken breast to bone and 180 when inserted through thickest part of thigh at joint, 50 to 60 minutes. Set chicken on a board or rimmed platter and let rest 5 to 10 minutes. </li>\n<li>Remove racks from pan. If onions are not browned, stir and continue roasting until browned, 5 to 10 minutes longer. Scrape browned bits off pan bottom and stir into onions; spoon onions into a bowl. Wrap tortillas in plastic wrap and heat in a microwave oven on full power (100%) just until hot and steamy, 45 seconds to 1 minute. </li>\n<li>Serve chicken with onions, tortillas, and salsa. To eat, cut chicken off bone in chunks or slices and let guests wrap chicken in tortillas with onions, green salsa, and salt to taste.</li>\n</ol>\n</div>
212044	Cambodian Grilled Chicken (Mann Oeng K'tem Sor, Marech)	\N	\N	\N	https://spoonacular.com/recipeImages/Cambodian-Grilled-Chicken-(Mann-Oeng-Ktem-Sor--Marech)-212044.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Prepare the chicken and marinade: </li>\n<li>Remove and discard the fat just inside the neck and body cavities of the chicken. </li>\n<li>Remove the package of giblets and set it aside for another use. Rinse the chicken, inside and out, under cold running water, then drain and blot it dry, inside and out, with paper towels. Spatchcock the chicken. Make 2 deep slashes to the bone in both sides of the chicken breast and in each leg and thigh. Trim or fold the wing tips back behind the wings. </li>\n<li>Place the bird in a nonreactive baking dish just large enough to hold it.</li>\n\n<li>Place the garlic halves, sugar, and salt in a heavy mortar and pound to a paste with a pestle. Work in the soy sauce and fish sauce. If you do not have a mortar and pestle, combine the garlic, sugar, and salt in a small food processor and puree to a paste, then work in the soy sauce and fish sauce. Spoon the marinade over the chicken, forcing it into the slits and turning the bird to coat it well on both sides. </li>\n<li>Let the chicken marinate in the refrigerator, covered, for 1 hour to 4 hours; the longer it marinates, the richer the flavor will be.</li>\n<li>Meanwhile, make the glaze: </li>\n<li>Heat the oil in a small saucepan over medium heat. </li>\n<li>Add the crushed clove of garlic and cook until just beginning to brown, about 1 minute. Using a slotted spoon, transfer the garlic to a small heatproof bowl. </li>\n<li>Add the annatto seeds to the saucepan with the oil and cook until fragrant and browned and the oil turns orange, about 2 minutes. If you are using paprika instead of annatto seeds, cook it for only 15 seconds. Strain the oil through a fine-mesh wire strainer into the bowl with the garlic. Set the glaze aside.</li>\n<li>Prepare the dipping sauce: </li>\n<li>Place 1/2 teaspoon each of salt and pepper and 1/4 teaspoon of sugar, if using, in 2 small attractive bowls. Have the limes ready; you'll add the lime juice at the last minute. (See Note.)</li>\n<li>Set up the grill for direct grilling and preheat it to medium. Leave one section of the grill bare for a safety zone.</li>\n<li>When ready to cook, brush and oil the grill grate. </li>\n<li>Drain the chicken and discard the marinade and arrange it on the hot grate or in an oiled grill basket, if using, skin side down. Grill the chicken until it is golden brown and cooked through, 12 to 20 minutes per side. Move the chicken as needed to dodge any flare-ups. Use an instant-read meat thermometer to test for doneness, inserting it into the thickest part of a thigh but not so that it touches a bone. The internal temperature should be about 170°F. Alternatively, you can make a cut in the chicken meat where the thigh connects to the body; there should be no traces of red at the bone. During the last 10 minutes of cooking, start brushing the chicken on both sides with the glaze.</li>\n<li>To serve, transfer the chicken, skin side up, to a platter. </li>\n<li>Let it rest for about 2 minutes, then cut it into pieces with a cleaver. </li>\n<li>Add 2 tablespoons of lime juice to each bowl with the salt, pepper, and sugar for the dipping sauce and stir it with a fork or chopsticks until the salt and sugar dissolves. To eat, dip the pieces of chicken in the salted lime juice.</li>\n<li>Variation</li>\n<li>Khmer Chicken Grilled Using the Indirect Method: You can also grill the chicken using the indirect method, a process that, although not traditionally Khmer, has the advantage of eliminating all risk of flare-ups. Set up the grill for indirect grilling, place a drip pan in the center, and preheat the grill to medium. </li>\n<li>Place the marinated chicken skin side up in the center of the grate over the drip pan and away from the heat. Cover the grill and cook the chicken until browned and cooked through, 40 minutes to 1 hour. Start brushing the chicken with the glaze during the last 15 minutes of cooking and baste it again every 5 minutes.</li>\n</ol>\n<div class="subRecipeInstructionTitle">Note:</div>\n<ol>\n<li>If you are serving 4 people, double the dipping sauce ingredients and divide them among 4 bowls.</li>\n<li>From Planet Barbecue! An Electrifying Journey Around the World's Barbecue Trail by Steven Raichlen. Copyright © 2010 by Steven Raichlen. Published by Workman Publishing Company, Inc.</li>\n</ol>\n</div>
130140	Beer-Can Roasted Chicken with Fig-Jam Pan Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/beer-can-roasted-chicken-with-fig-jam-pan-sauce-2-130140.png	http://www.marthastewart.com/326626/beer-can-roasted-chicken-with-fig-jam-pa
171114	Crispy Parmesan Chicken a la Cordon Bleu	\N	\N	\N	https://spoonacular.com/recipeImages/Crispy-Parmesan-Chicken-a-la-Cordon-Bleu-171114.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In 2-quart nonstick saucepan, stir hot water, 1 1/2 cups milk, 2 tablespoons butter, and the sauce mix and uncooked pasta (from Chicken Helper box). </li>\n<li>Heat just to boiling, stirring frequently. Reduce heat. Simmer uncovered about 12 minutes, stirring frequently, until pasta is tender. </li>\n<li>Remove from heat; stir in ham. Cover to keep warm. Sauce will thicken as it stands.</li>\n<li>2</li>\n<li>Meanwhile, cut each chicken breast into 3 to 5 slices, holding knife at an angle. Slices should be about 1/2 inch thick. Reserve 2 tablespoons seasoned crumbs (from Chicken Helper box).</li>\n<li>3</li>\n\n<li>Place chicken in medium bowl. </li>\n<li>Add 1 tablespoon milk to moisten. </li>\n<li>Add remaining crumbs to coat chicken.</li>\n<li>4</li>\n<li>In 10-inch nonstick skillet, heat 2 tablespoons butter and the oil over medium heat until butter is melted. Carefully add chicken to hot butter mixture; cook 4 to 6 minutes or until golden brown. Reduce heat to medium-low. Turn chicken; cook 4 to 6 minutes longer or until golden brown and centers are no longer pink.</li>\n<li>5</li>\n<li>Meanwhile, in 7-inch skillet, melt 1 tablespoon butter; stir in reserved 2 tablespoons crumbs. Cook over medium heat, stirring frequently, just until crumbs are brown. </li>\n<li>Remove from heat.</li>\n<li>6</li>\n\n<li>Place pasta in serving dish; top with chicken and sprinkle with buttered crumbs and cheese.</li>\n</ol>\n</div>
113897	Sweet and Savory Baked Chicken With Pineapple and Tarragon	\N	\N	\N	https://spoonacular.com/recipeImages/sweet-and-savory-baked-chicken-with-pineapple-and-tarragon-2-113897.jpg	http://www.food.com/recipe/sweet-and-savory-baked-chicken-with-pineapple-and-tarragon-219229
32316	Roast Chicken With Fava Beans	\N	\N	\N	https://spoonacular.com/recipeImages/roast-chicken-with-fava-beans-2-32316.jpg	http://www.wholeliving.com/176730/roast-chicken-fava-beans
303132	One-Pan Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/one-pan-chicken-303132.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 425 degrees F.Get 2 baking dishes and pour in some olive oil to coat. Arrange the pieces of chicken, the potatoes, onions, garlic cloves, and peppers on them. (If you want to use 3 dishes and have got the room, do; the less packed everything is, the crispier the potatoes will be.) Then drizzle some more oil over, making sure everything's glossy and well slicked (but not dripping), sprinkle with the salt, and bake for about 45 minutes.When done (and test all the component parts), strew over the parsley and - I always do this - serve straight from the baking dishes.</li>\n</ol>\n</div>
139296	Speedy Spaghetti with Chicken and Fresh Tomato	\N	\N	\N	https://spoonacular.com/recipeImages/speedy-spaghetti-with-chicken-and-fresh-tomato-139296.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring a large pot of salted water to a boil, add spaghetti and cook according to package directions, stirring often, until al dente. Reserve 1 1/2 cups cooking liquid from pasta. </li>\n<li>Drain spaghetti in a colander and reserve.</li>\n<li>Heat oil over medium heat in same pot. </li>\n<li>Add onion and cook, stirring, until softened, about 5 minutes. Return pasta to pot along with tomato, chicken and pasta liquid. Toss well and season with salt and pepper to taste.</li>\n<li>Transfer pasta to plates. Sprinkle with basil, dot with crumbled goat cheese and serve immediately.</li>\n</ol>\n</div>
286759	Roasted Garlic and Orange Roast Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/roasted-garlic-and-orange-roast-chicken-286759.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 400 degrees F. </li>\n<li>Cut the top 1/4-inch from the garlic head, then drizzle with oil, and sprinkle with a pinch of salt. Wrap the garlic in foil, then place in the oven and roast until golden, about 40 minutes. </li>\n<li>Let cool, then peel and smash the cloves into a paste.  </li>\n<li>Mix half the chopped tarragon with the garlic, season with salt and pepper, then place the paste between the flesh and skin of the chicken. Slice the skin on the thighs, then coat with the paste. Sprinkle the chicken cavity with the remaining chopped tarragon, salt, and pepper. Squeeze the orange over the chicken and put the orange in the cavity. Loosely tie the legs together, drizzle with 1 tablespoon oil, and sprinkle all over with salt and pepper.  </li>\n<li>Cut the squash into 1/2-inch slices. Toss the squash and mushrooms in a roasting pan with the remaining 3 tablespoons oil, salt, and pepper. </li>\n<li>Place the chicken over the vegetables. Roast the chicken until a thermometer registers 160 degrees F in the thigh, not touching the bone, 50 to 60 minutes. </li>\n<li>Let stand 10 minutes before carving. </li>\n<li>Garnish with a tarragon sprig.</li>\n</ol>\n</div>
172081	Chicken and Bacon Flatbreads	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-Bacon-Flatbreads-172081.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat oven to 400°F. </li>\n<li>Place tortillas on 2 ungreased large cookie sheets. </li>\n<li>Bake 5 minutes.</li>\n<li>2</li>\n\n<li>Mix cooking sauce and 1 cup of the cheese. </li>\n<li>Spread slightly less than 1/4 cup sauce mixture evenly over each tortilla. Top each with 1/4 cup chicken and remaining cheese.</li>\n<li>3</li>\n\n<li>Bake 5 to 7 minutes or until heated through and cheese is melted. Sprinkle with desired toppings. </li>\n<li>Cut into wedges.</li>\n</ol>\n</div>
499805	Chicken Salad Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-Salad-Sandwiches-499805.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Put cooked meat in food processor and shred.</li>\n<li>Pour into mixing bowl.</li>\n<li>Mix with red pepper, onion, celery, relish, salt and pepper and sugar.Stir in Miracle Whip – start with about ½ cup and add until mixed well.Don’t put too much or it won’t stick together well.</li>\n<li>Spread on sandwich bread and top with salad pepper rings for a delicious sandwich.Also good stuffed in pita pockets or croissants with salad pepper rings.</li>\n</ol>\n</div>
164057	Chicken Parmesan	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-Parmesan-164057.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In 2-quart nonstick saucepan, stir hot water, 1 1/2 cups milk, 2 tablespoons butter, and the sauce mix and uncooked pasta (from Chicken Helper box). </li>\n<li>Heat just to boiling, stirring frequently. Reduce heat. Simmer uncovered about 12 minutes, stirring frequently, until pasta is tender. </li>\n<li>Remove from heat. Sauce will thicken as it stands.</li>\n<li>2</li>\n<li>Meanwhile, cut each chicken breast into 3 to 5 slices, holding knife at an angle. Slices should be about 1/2 inch thick.</li>\n<li>3</li>\n\n<li>Place chicken in medium bowl. </li>\n<li>Add 1 tablespoon milk to moisten. </li>\n<li>Add seasoned crumbs (from Chicken Helper box) to coat chicken.</li>\n<li>4</li>\n<li>In 10-inch nonstick skillet, heat 2 tablespoons butter and the oil over medium heat until butter is melted. Carefully add chicken to hot butter mixture; cook 4 to 6 minutes or until golden brown. Reduce heat to medium-low. Turn chicken, cook 4 to 6 minutes longer or until golden brown and centers are no longer pink.</li>\n<li>5</li>\n<li>In 2-cup microwavable measuring cup, microwave pasta sauce uncovered on High 1 to 2 minutes or until hot. To serve, place chicken on individual plates. Spoon pasta sauce over chicken; sprinkle with cheese. </li>\n<li>Serve with pasta.</li>\n</ol>\n</div>
172277	Chicken Pasta Salad with Grapes and Poppy Seed Dressing	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-Pasta-Salad-with-Grapes-and-Poppy-Seed-Dressing-172277.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Empty Pasta mix into 3-quart saucepan 2/3 full of boiling water. Gently boil uncovered 12 minutes, stirring occasionally.</li>\n<li>2</li>\n\n<li>Drain pasta; rinse with cold water. Shake to drain well.</li>\n<li>3</li>\n<li>In large bowl, stir together seasoning mix and dressing. </li>\n<li>Add pasta and remaining ingredients; toss to combine. </li>\n<li>Serve immediately, or refrigerate.</li>\n</ol>\n</div>
401676	Salmon with Tangy Raspberry Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Salmon-with-Tangy-Raspberry-Sauce-401676.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine the paprika, salt and pepper; sprinkle over salmon. </li>\n<li>Drizzle with oil. Moisten a paper towel with cooking oil; using long-handled tongs, lightly coat the grill rack. </li>\n<li>Place salmon skin side down on grill rack.</li>\n<li>Grill, covered, over medium heat or broil 4 in. from the heat for 10-12 minutes or until fish flakes easily with a fork. In a small bowl, whisk the preserves, vinegar and honey; spoon over fillets.</li>\n</ol>\n</div>
164108	Indonesian Peanut Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Indonesian-Peanut-Chicken-164108.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Sprinkle chicken with salt and pepper.</li>\n<li>2</li>\n\n<li>Heat oil in 12-inch skillet or 4-quart Dutch oven over medium heat. Cook chicken in oil about 15 minutes, turning occasionally, until brown on all sides. Cover and cook over low heat about 20 minutes or until juice is no longer pink when centers of thickest pieces are cut. </li>\n<li>Remove chicken from skillet with tongs.</li>\n<li>3</li>\n\n<li>Drain all but 1 tablespoon drippings from skillet; heat over medium heat. Cook onion in drippings, stirring occasionally, until tender; reduce heat. Stir in peanut butter, chili sauce and red pepper. Gradually stir in water, stirring constantly, until peanut butter is melted.</li>\n<li>4</li>\n\n<li>Add chicken. Spoon sauce over chicken. </li>\n<li>Heat to boiling; reduce heat. Simmer uncovered about 5 minutes, spooning sauce frequently over chicken, until sauce is slightly thickened. </li>\n<li>Serve sauce over chicken. Sprinkle with peanuts and bell pepper.</li>\n</ol>\n</div>
115016	Roast Chicken With Potatoes, Lemon, and Asparagus	\N	\N	\N	https://spoonacular.com/recipeImages/roast-chicken-with-potatoes-lemon-and-asparagus-2-115016.jpg	http://www.food.com/recipe/roast-chicken-with-potatoes-lemon-and-asparagus-222931
434643	Chicken and Rice Soup Mix	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-Rice-Soup-Mix-434643.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, combine the first six ingredients. </li>\n<li>Transfer to a small spice jar. Store in a cool dry place for up to 6 months.</li>\n</ol>\n</div>
442901	Chicken and Pumpkin Lasagna	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-Pumpkin-Lasagna-442901.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large bowl, combine milk and cream of pumpkin soup. Set aside.</li>\n\n<li>Heat oil in a large saucepan over medium heat.  </li>\n<li>Add chicken, and saute until done. Stir in Bolognese sauce; simmer for 15 minutes, stirring occasionally.</li>\n<li>Spoon 1/3 meat sauce into a 2 quart casserole dish, cover with 3 uncooked noodles, and top with 1/3 soup mixture. Repeat twice. Sprinkle cheese over lasagna.</li>\n\n<li>Bake in a preheated 400 degree F (200 degree C) oven for 35 minutes, or until hot and bubbly. </li>\n<li>Remove from oven, and let stand 15 minutes before serving.</li>\n<li>Kitchen-Friendly View</li>\n</ol>\n</div>
74262	Baked Chicken With Fennel And Apples	\N	\N	\N	https://spoonacular.com/recipeImages/baked-chicken-with-fennel-and-apples-2-74262.jpg	http://www.thebittenword.com/thebittenword/2010/01/baked-chicken-with-apple-and-fennel.html
16996	Quick-Roasted Chicken with Mustard and Garlic	\N	\N	\N	https://spoonacular.com/recipeImages/quick-roasted-chicken-with-mustard-and-garlic-16996.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to  Using poultry shears, cut along each side of the chicken backbone and remove it. Turn the chicken breast side up and press on the breast bone to flatten the chicken. Using a sharp knife, cut partway through both sides of the joint between the thighs and the drumsticks. </li>\n<li>Cut partway through the joint between the wings and the breast.</li>\n<li>In a bowl, mix all of the remaining ingredients. Turn the chicken breast down and spread it with half of the mustard mixture. Set the chicken in a large skillet skin side up; spread with the remaining mixture.</li>\n<li>Set the skillet over high heat and cook the chicken until it starts to brown, 5 minutes. </li>\n<li>Transfer the skillet to the oven and roast the chicken for 30 minutes, until the skin is browned and the chicken is cooked through. </li>\n<li>Let the chicken rest for 5 minutes. </li>\n<li>Transfer the chicken to a cutting board, cut it into 8 pieces and serve.</li>\n</ol>\n</div>
410262	Spanish Potatoes	\N	\N	\N	https://spoonacular.com/recipeImages/Spanish-Potatoes-410262.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place potatoes in a large saucepan and cover with water. Bring to a boil. Reduce heat; cover and cook for 15 minutes or until tender.</li>\n<li>Meanwhile, in a small saucepan, combine the onions, green pepper, water, oil and bouillon. bring to a boil. Reduce heat; cover and simmer for 8-10 minutes or until vegetables are tender. </li>\n<li>Drain potatoes; add onion mixture, tomatoes and oregano. Stir gently to coat.</li>\n</ol>\n</div>
74391	Ginger Ale-Can Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/ginger-ale-can-chicken-74391.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Remove giblets and necks, if necessary. Rinse chickens with cold water; pat dry. </li>\n<li>Place each chicken in a large zip-top plastic freezer bag. </li>\n<li>Whisk together oil and next 5 ingredients. </li>\n<li>Pour evenly over chickens. Seal bags, and chill, turning occasionally, 8 hours. </li>\n<li>Remove chickens from marinade, discarding marinade. Using a can opener, carefully remove lids from cans of ginger ale. </li>\n<li>Remove one-fourth ginger ale from each can, and reserve for another use, leaving remaining ginger ale in can. </li>\n<li>Place cans in a lightly greased large roasting pan. </li>\n<li>Place each chicken upright onto a ginger ale can, fitting can into cavity. Pull legs forward to form a tripod, allowing chickens to stand upright. </li>\n<li>Bake, uncovered, at 325 for 1 hour and 40 minutes or until a meat thermometer inserted into thigh registers 170 and chickens are golden brown. </li>\n<li>Let stand 10 minutes; carefully remove cans before serving. </li>\n<li>Garnish, if desired.Note: For testing purposes only, we used Dale's liquid steak seasoning.</li>\n</ol>\n</div>
520701	Orange pork with Szechuan pepper	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-pork-with-Szechuan-pepper-520701.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Measure the soy sauce and rice wine. Stir together.</li>\n<li>Place the pork in a pan. </li>\n<li>Pour in the soy sauce and rice vinegar. </li>\n<li>Add enough water to cover. Throw in the orange peel. Bring to the boil.In another pan, saute the onion, garlic, Szechuan peppercorns and star anise in a little oil.Cook until the onion slices start to turn translucent.</li>\n<li>Add the sauteed ingredients to the pork. Cover, lower the heat and simmer for an hour to an hour and a half or until the sauce is thick and clear.</li>\n<li>Serve hot with rice or manthao (steamed sweet buns).</li>\n</ol>\n</div>
273352	BBQ Salmon Bacon Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/BBQ-Salmon-Bacon-Sandwich-273352.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>PREHEAT greased grill to medium-high heat.  </li>\n<li>Brush salmon fillets with 1/4 cup of the barbecue sauce. GRILL 10 to 12 min. or until fish flakes easily with fork, turning once. SPREAD bottom of rolls with remaining 1/4 cup barbecue sauce.   Top each with salmon fillet, bacon slice, lettuce leaf and top half of roll.</li>\n</ol>\n</div>
598746	Chicken Stewed in Wine, Garlic, and Cinnamon	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-Stewed-in-Wine--Garlic--and-Cinnamon-598746.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Pat the chicken pieces dry with paper towels so they don’t spatter in the pan. </li>\n<li>Mix the cinnamon, salt, and pepper together in a small bowl and rub the chicken pieces on all sides with the mixture. Mince 3 of the garlic cloves and set aside. </li>\n<li>Heat the olive oil in a large, deep, non-aluminum skillet over high heat. A 12-inch skillet with sides about 3 inches high will allow you to brown all the chicken pieces at once. If you don’t have a skillet large enough, brown the chicken in 2 batches, using 1 tablespoon of oil for each batch. Don’t crowd the pieces in the pan or the chicken will steam rather than brown. </li>\n<li>Add the chicken to the skillet and brown for 4 to 5 minutes on each side, shifting the pieces with a metal spatula so the chicken doesn’t stick to the skillet. When the pieces are nicely browned on all sides, remove from the pan and set aside. Reduce the heat to medium-high and add the onions and minced garlic. Cook for about 3 minutes, stirring constantly, until the onions have softened and are a rich golden brown. </li>\n<li>Add the wine and scrape the bottom of the pan with a spatula or spoon to deglaze, loosening any browned bits. When the wine has evaporated, add the water, tomato paste, and remaining 2 whole garlic cloves. Return the chicken to the pan. The liquid should cover about three quarters of the chicken. Reduce the heat to low, cover skillet with a lid, and simmer for about 1 hour, or until the chicken is tender and thoroughly cooked. (If the sauce becomes too thick, thin it with a little more water.) Taste and adjust the seasoning. I like to serve this with my family’s homemade buttered noodles, but it’s also great over rice, orzo, or macaroni. Sprinkle the grated cheese over the top of each serving.</li>\n</ol>\n</div>
522193	Ginger pork with spinach and baby corn	\N	\N	\N	https://spoonacular.com/recipeImages/Ginger-pork-with-spinach-and-baby-corn-522193.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the pork into thin, thin slices — less than a quarter inch, ideally. </li>\n<li>Place in a bowl, add the ginger, black pepper, fish sauce and sesame seed oil. </li>\n<li>Mix thoroughly.Rinse the spinach and drain. If you’re using the stems, roughly chop so that you get bite size pieces.</li>\n<li>Cut the baby corn into halves or thirds. Finely slice the chilies.</li>\n<li>Heat the cooking oil in a pan. When smoking hot, add the pork and cook, stirring, until the meat changes color.</li>\n<li>Pour in some soy sauce (a tablespoon at this point should be enough) and continue stir frying until the mixture is almost dry.</li>\n<li>Add the onion slices and the chilies, stir fry for another 30 seconds, then add the spinach and baby corn. Stir fry just until the spinach wilts and the baby corn pieces are heated through.Taste the dish, add more fish sauce or soy sauce, if needed.</li>\n</ol>\n</div>
417788	Hungry Man's Baked Potatoes	\N	\N	\N	https://spoonacular.com/recipeImages/Hungry-Mans-Baked-Potatoes-417788.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Scrub and pierce potatoes; place on a microwave-safe plate. Microwave, uncovered, on high for 12-15 minutes or until tender, turning once.</li>\n<li>In a large skillet, cook bacon over medium heat until crisp. </li>\n<li>Remove to paper towels with a slotted spoon; drain, reserving 1 tablespoon drippings. </li>\n<li>Saute corn and onion in drippings until tender.</li>\n<li>With a sharp knife, cut an "X" in each potato; fluff pulp with a fork. </li>\n<li>Place pork in a microwave-safe bowl. Microwave, uncovered, for 1-2 minutes or until heated through. Top potatoes with pork, corn mixture, bacon, goat cheese and cilantro.</li>\n</ol>\n</div>
116737	North Croatian Beef Cutlet	\N	\N	\N	https://spoonacular.com/recipeImages/north-croatian-beef-cutlet-2-116737.jpg	http://www.food.com/recipe/north-croatian-beef-cutlet-284674
565284	Ginger and Scallions Pork	\N	\N	\N	https://spoonacular.com/recipeImages/Ginger-and-Scallions-Pork-565284.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Marinate the pork slices in (A) for at least 10 minutes.</li>\n<li>Heat oil in wok, stir fry ginger for 20 seconds. Then add garlic and chilli. Stir fry for another 30 seconds.</li>\n<li>Add pork slices, stir fry until you see that they are fully cooked on the surface.</li>\n<li>Add water and spring onions. At the first sight of the spring onions withering, drizzle Chinese cooking wine along the side of the wok and let the alcohol evaporate in a few seconds. Turn off the flame. This dish is best served with steamed rice.</li>\n</ol>\n</div>
602196	Chinese Daikon and Carrot Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Chinese-Daikon-and-Carrot-Soup-602196.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring a large soup pot filled with water to a rolling boil. </li>\n<li>Add pork and bones and let boil rapidly for 10 minutes. </li>\n<li>Remove pork and set aside. </li>\n<li>Drain and discard the water, clean the pot if needed. Fill the pot with new water to make the broth (approximately 4 quarts) and add in the pork, bones, shrimp, scallops, ginger, garlic. Bring to a simmer and then turn the heat to medium-low, or hot enough to just produce a gentle simmer for 30-40 minutes.Occassionally, skim the soup of any fats or particles and discard. </li>\n<li>Add radish, carrots and tomatoes to the soup and simmer for another 15-20 minutes. Season with salt (or fish sauce) to taste.</li>\n</ol>\n</div>
290906	Cowboy Beans	\N	\N	\N	https://spoonacular.com/recipeImages/cowboy-beans-290906.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Watch how to make this recipe.</li>\n<li>In a large saucepan, bring the soaked beans, ham hock, bay leaf, garlic, jalapeno, and 5 cups of water to a boil over high heat. Cover the pan, reduce the heat to medium and simmer for 2 hours or until beans are tender. If the beans absorb too much water, add 1 cup of water after 1 hour and continue cooking (Beans mixture should remain soupy while cooking). Turn off the heat.Cook the bacon in a large saute pan over medium-high heat until almost crisp, about 10 minutes. </li>\n<li>Add onion and cook for about 3 minutes or until translucent. </li>\n<li>Transfer bacon and onion mixture to the pot with the beans. Wipe pan clean. In same pan cook chorizo over medium heat until crisp, about 1 minutes. Using a  slotted spoon,  remove the chorizo and drain on paper towels. </li>\n<li>Add to the beans. Season lightly with salt, if necessary. Stir the  beans over medium-high heat until heated through. </li>\n<li>Remove the bay leaf and ham hock and discard. Ladle into bowls and serve.Cook's Note: In place of soaking the beans, you can use 3 (15-ounce) cans rinsed and drained pinto beans. Proceed as above but reduce the cooking time to 1 hour.</li>\n</ol>\n</div>
520803	Broiled pork with pineapple chunks and sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Broiled-pork-with-pineapple-chunks-and-sauce-520803.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking oil in a frying pan or wok. </li>\n<li>Add the pork. Cook, stirring often, just until heated through.</li>\n<li>Add the onion, garlic and chili flakes. Stir fry for about 30 seconds.</li>\n<li>Pour in the fish sauce. Stir and allow most of the liquid to boil off.Disperse the starch in the pineapple syrup. </li>\n<li>Pour into the pan.</li>\n<li>Add the pineapple chunks.Cook over high heat for about three minutes or until the sauce is thick and clear.Sprinkle with onion leaves and serve on top of very hot rice.</li>\n</ol>\n</div>
246381	Japanese Tofu with Enoki Mushroom and Minced Pork	\N	\N	\N	https://spoonacular.com/recipeImages/Japanese-Tofu-with-Enoki-Mushroom-and-Minced-Pork-246381.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Marinate pork in all ingredients for marinade for at least 30 mins.</li>\n</ol>\n</div>
608393	Pork and herbed dumplings stew	\N	\N	\N	https://spoonacular.com/recipeImages/Pork-and-herbed-dumplings-stew-608393.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the butter. </li>\n<li>Add the pork, sprinkle with salt and pepper. Cook over medium-high heat, turning once in a while, until lightly browned.Throw in the chopped onion and continue cooking until softened.</li>\n<li>Add the rosemary and tarragon. </li>\n<li>Pour in two cups of broth. Bring to the boil. Lower the heat, cover and simmer for 40 to 50 minutes or until the pork is tender. Taste the sauce once in a while and add more salt and pepper, as needed.Meanwhile, prepare the dumplings. Rub together the flour, baking powder and butter until the texture resembles oatmeal. </li>\n<li>Add about ¼ tsp. of salt, a little pepper and the parsley. </li>\n<li>Pour in enough ice cold water, one tablespoonful at a time, to bind the dough into a ball. Wrap in cling film and leave in the fridge for about 20 minutes.When the pork is almost done, take out the dough and form into balls about an inch and a half in diameter.Drop the balls of dough into the stew. Cover the pan and let the dumplings cook for 10 to 15 minutes.Note that the flour in the dumplings will thicken the sauce of the stew so check the liquid 10 minutes after dropping in the balls of dough. If the mixture appears too thick or dry, add more broth.Taste the sauce. Adjust the seasonings, if needed, before serving.</li>\n</ol>\n</div>
37069	Pork And Noodle Salad	\N	\N	\N	https://spoonacular.com/recipeImages/pork-and-noodle-salad-2-37069.jpg	http://www.donnahay.com.au/recipes/mains/meat/pork-and-noodle-salad
16665	Pork & Mango Lettuce Wraps	\N	\N	\N	https://spoonacular.com/recipeImages/pork-mango-lettuce-wraps-2-16665.jpg	http://www.williams-sonoma.com/recipe/pork-and-mango-lettuce-wraps.html
211275	Pan-fried pork with crème fraîche & prunes	\N	\N	\N	https://spoonacular.com/recipeImages/Pan-fried-pork-with-crme-frache---prunes-211275.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Dust the pork with a little of the seasoned flour. </li>\n<li>Heat the butter in a large non-stickfrying pan, then cook the pork in batches for about 3 mins on each side. </li>\n<li>Remove fromthe pan, then add the prunes, brandy, wine, mustard and redcurrant jelly and simmer toreduce the mixture by half.Stir in the crème fraîche to make a creamy sauce, season well, then return the pork to the pan to heat through. </li>\n<li>Serve withtagliatelle and broccoli or a green salad.</li>\n</ol>\n</div>
82263	Pepper And Cumin Spiced Pork	\N	\N	\N	https://spoonacular.com/recipeImages/pepper-and-cumin-spiced-pork-2-82263.jpg	http://www.donnahay.com.au/recipes/mains/meat/pepper-and-cumin-spiced-pork
82262	Sticky Asian Pork Neck	\N	\N	\N	https://spoonacular.com/recipeImages/sticky-asian-pork-neck-2-82262.jpg	http://www.donnahay.com.au/recipes/mains/meat/sticky-asian-pork-neck
522587	Pork, chayote, squash and spinach soup	\N	\N	\N	https://spoonacular.com/recipeImages/Pork--chayote--squash-and-spinach-soup-522587.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Melt the butter in a pot. </li>\n<li>Add the pork and cook until nicely browned. Trust me, the browning process will add so much flavor and texture to the cooked dish so don’t skip this step.When the meat is nicely browned, add the chopped onion and continue cooking, with occasional stirring, until the onion bits start to soften.</li>\n<li>Pour in five cups of broth. Stir and remember to scrape whatever bits may be stuck in the bottom of the pot. Taste. </li>\n<li>Add salt and pepper, as needed. Bring to the boil.</li>\n<li>Add the chayote. Bring to the boil once more then lower the heat, cover and simmer for about 10 minutes.Dissolve the soup mix in the remaining broth. </li>\n<li>Pour into the pot. Taste. </li>\n<li>Add more salt and pepper, if needed.</li>\n<li>Add the squash. Bring to the boil, lower the heat and simmer for another 10 minutes or until the squash is done and the soup leaves no flour-y sensation in the mouth.Stir in the spinach leaves. Cook for another minute.</li>\n<li>Serve the soup hot with buttered bread.</li>\n</ol>\n</div>
598373	Pulled Pork Tacos with Habanero Salsa	\N	\N	\N	https://spoonacular.com/recipeImages/Pulled-Pork-Tacos-with-Habanero-Salsa-598373.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Make the habanero salsa Char the pepper by holding it with tongs over the flame of a gas burner, turning as needed, until it’s spotted black and blistered all over. (If you don’t have a gas stove, broil the habanero a few inches from the broiler element, turning as needed, until charred all over.) </li>\n<li>Let cool. </li>\n<li>Remove the loose outer layers of papery skin from the garlic clove but leave the tight inner peel intact. Char the garlic clove over the gas burner, using the same technique as you did for the habanero, until it’s completely blackened. Carefully stem the habanero, scrape out the seeds, and coarsely chop the pepper, preferably wearing plastic gloves to protect your fingers. (And by all means, whatever you do, resist the urge to rub your eyes.) Peel the garlic clove, coarsely chop it, and add it to the bowl of a food processor (preferably a mini one) along with about half the habanero. </li>\n<li>Add the cilantro, scallion, lime juice, oil, and salt to taste and process until a loose salsa forms. Taste. If you want the salsa to be spicier, add more of the habanero and adjust the amout of lime juice and/or salt if need be. Set aside for just a few minutes. (You can cover and refrigerate the habanero salsa for up to 2 weeks.)Make the pulled pork tacos </li>\n<li>Heat the pork in a small saucepan over medium heat, stirring occasionally, until warmed through, 4 to 5 minutes. Warm the tortillas in a dry skillet over a medium-low flame, then wrap in aluminum foil to keep warm. Lay the tortillas out on a plate. Divide the pork among the tortillas and top with just a little bit of the salsa (be judicious until you know how much you can handle). Any remaining salsa can be covered and refrigerated for up to a week or so to be spooned onto more tacos or eggs or baked potatoes or just about anything at will.</li>\n</ol>\n</div>
215410	Pork Milanese with spaghetti	\N	\N	\N	https://spoonacular.com/recipeImages/Pork-Milanese-with-spaghetti-215410.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oil in a pan, then frythe garlic for a few secs. </li>\n<li>Add thechopped tomatoes and balsamicvinegar and bubble for about15-20 mins until the sauce isthick.Meanwhile, lay the porkmedallions between two layers ofcling film and bash with a rolling pinuntil they are about 1cm thick. </li>\n<li>Mixthe flour with some seasoning inone bowl, put the egg in anotherand the breadcrumbs in a third.Dip the pork in the flour, then theegg, then the breadcrumbs. </li>\n<li>Heata grill to hot, then cook the pork for3 mins on each side, until goldenand cooked through. Keep warm.Cook the pasta following packinstructions. Stir through thetomato sauce and the choppedbasil, divide the pasta between4 plates, put the crispy pork ontop and eat immediately.</li>\n</ol>\n</div>
578594	Peanut Butter Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Peanut-Butter-Smoothie-578594.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Blend the frozen banana, chocolate milk, and cream peanut butter for 30 seconds or until smooth.Use a single serve blending cup if possible. If not, use a mason jar and any standard blender base! Or simply use your normal blender and pitcher, but double the servings.</li>\n</ol>\n</div>
367226	Chicken and Truffle Terrine	\N	\N	\N	https://spoonacular.com/recipeImages/chicken-and-truffle-terrine-367226.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Line a 2 pound loaf pan with bacon, overlapping the entire area.  Put chicken in a chilled food processor and blend until minced.  </li>\n<li>Add pork, shallots and garlic and pulse until mixed.  Season with salt and pepper and fold in parsley and truffles.   </li>\n<li>Mix in eggs by hand until incorporated. Chill mixture for 1 hour and preheat oven to 325 degrees.  </li>\n<li>Place mixture in loaf pan and place in water bath going half way up loaf pan.  </li>\n<li>Bake for 45 minutes or until firm.  Allow to chill before removing from pan.  Slice 1/4-inch thick and serve with 1 tablespoon of grain mustard.</li>\n</ol>\n<div class="subRecipeInstructionTitle">CATEGORIES:</div>\n<ol>\n<li>Chicken</li>\n<li>Appetizer</li>\n<li>Baking</li>\n<li>View All</li>\n<li>Main Ingredient</li>\n<li>Chicken</li>\n<li>Meat</li>\n<li>Shallot</li>\n<li>Course</li>\n<li>Appetizer</li>\n<li>Main Dish</li>\n<li>Technique</li>\n<li>Baking</li>\n<li>Cuisine</li>\n<li>European</li>\n<li>Season</li>\n<li>Fall</li>\n</ol>\n</div>
17057	Pork Chops with Granny Smith Apples	\N	\N	\N	https://spoonacular.com/recipeImages/pork-chops-with-granny-smith-apples-17057.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix together the flour, cumin, salt, and pepper on a large plate. Lightly coat each piece of pork with the flour mixture; set aside. </li>\n<li>Heat the vegetable oil and butter in a large skillet over medium-high heat. Sprinkle the apple halves with a pinch of salt and pepper. Cook the apples cut-side down about 5 minutes or until golden brown. </li>\n<li>Remove from the skillet, cover, and set aside. </li>\n<li>Place the pork in the skillet, sprinkle with the parsley, and cook until the meat is golden brown and crispy, 4 to 5 minutes per side. While the pork is cooking, whisk together the broth and vinegar. </li>\n<li>Remove the pork from the skillet and set aside. </li>\n<li>Pour the broth mixture into the skillet, stirring and scraping up any browned bits. Bring to a boil and cook until slightly thickened. Divide the pork among 4 plates and pour some pan sauce over each. Before serving, place an apple half and a dab of mustard on each plate.</li>\n</ol>\n</div>
213670	Jerk pork & pineapple skewers with black beans & rice	\N	\N	\N	https://spoonacular.com/recipeImages/Jerk-pork---pineapple-skewers-with-black-beans---rice-213670.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix together the pork, jerk seasoning,allspice, chilli sauce, if using, limezest and juice, and some seasoning.Thread the pork and pineapple ontometal skewers (or pre-soaked woodenskewers) and brush with the oil.Cook rice following pack instructions.</li>\n<li>Drain well, then put back in the saucepanwith the beans, stir and keep warm.Meanwhile, heat a griddle pan until veryhot. Cook the skewers for 3 mins on eachside until nicely charred and the pork iscooked through. </li>\n<li>Serve skewers with thebeans and rice, extra chilli sauce, if youlike, and lime wedges for squeezing over.</li>\n</ol>\n</div>
522969	Stir-fried paprika-chili pork with pineapple and bananas	\N	\N	\N	https://spoonacular.com/recipeImages/Stir-fried-paprika-chili-pork-with-pineapple-and-bananas-522969.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Thinly slice the pork. </li>\n<li>Place in a bowl and mix with the paprika, chili powder, garlic and salt. Set aside.</li>\n<li>Brush a heated non-stick pan very lightly with oil.Arrange the saba banana slices, cut side down, and cook over medium-high heat until nicely browned. Flip to brown the opposite side. Scoop out the bananas and transfer to a plate.</li>\n<li>Add the pineapple wedges to the hot pan (no need to add more oil) and brown them as well. </li>\n<li>Remove the pineapple wedges to a plate.</li>\n<li>Heat a wok. </li>\n<li>Pour in the two tablespoonfuls of vegetable oil and allow to reach smoking point.Stir fry the pork in hot oil for two to three minutes or until done.</li>\n<li>Add the sliced onion to the pork. Stir fry for another 30 seconds.Throw in the bananas and pineapple wedges. Sprinkle with salt. Toss. </li>\n<li>Drizzle in a few tablespoonfuls of water (so that nothing burns while waiting for the fruits to get heated through). Cook, stirring and tossing gently, until the mixture is steamy and everything is hot.Tip the contents of the wok onto a platter. Sprinkle with cilantro and the sliced chili.</li>\n</ol>\n</div>
146293	Mexican Pulled Pork	\N	\N	\N	https://spoonacular.com/recipeImages/mexican-pulled-pork-2-146293.jpg	http://www.food.com/recipe/mexican-pulled-pork-293172
484216	Crock-Pot Mexican Stew	\N	\N	\N	https://spoonacular.com/recipeImages/Crock-Pot-Mexican-Stew-484216.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place pork in a 5-quart slow cooker.</li>\n<li>Add broth, onion, green chiles, tomatoes, cumin, salt and pepper; stir well.Cover and cook on LOW setting for 3 hours.</li>\n<li>Add Sweet Potato around 3 hours or 4 hours cooking.Cook a total of 6-7 hours on Low.</li>\n<li>Add lime juice and stir well. Top with cilantro.</li>\n</ol>\n</div>
447384	Sweet and Sour Pork Kabobs	\N	\N	\N	https://spoonacular.com/recipeImages/Sweet-and-Sour-Pork-Kabobs-447384.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small saucepan, bring 1 in. of water to a boil; add carrots. Cover and cook for 10-12 minutes or until almost tender; drain well. </li>\n<li>Drain pineapple, reserving 1/4 cup juice. Set pineapple aside.</li>\n<li>In a small bowl, combine the vinegar, oil, soy sauce, sugar, garlic and reserved pineapple juice. </li>\n<li>Pour over cubed pork; let stand for 30 minutes.</li>\n<li>On four metal or soaked wooden skewers, alternate the pork, carrots, peppers and reserved pineapple. Grill over medium-hot heat for 5-6 minutes or until meat is tender, basting with reserved marinade. </li>\n<li>Serve with rice.</li>\n</ol>\n</div>
478159	How to cook: Yang Chow (Yeung Chow, Yang Zhou) fried rice	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-cook--Yang-Chow-(Yeung-Chow--Yang-Zhou)-fried-rice-478159.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
521187	Sinigang na baboy (pork and vegetables in tamarind broth)	\N	\N	\N	https://spoonacular.com/recipeImages/Sinigang-na-baboy-(pork-and-vegetables-in-tamarind-broth)-521187.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking oil in a pot. </li>\n<li>Saute the garlic, onion and tomatoes until they start to soften.</li>\n<li>Add the pork cubes. Cook, stirring, until the meat changes color.</li>\n<li>Pour in enough water (or rice washing) to cover. </li>\n<li>Add the finger chilis. Season with patis. Bring to the boil, cover and simmer for an hour to an hour and a half, or until the pork is tender.About 20 minutes before the pork is done, add the taro wedges.Meanwhile, place a fine sieve over a bowl. </li>\n<li>Pour in the tamarind with the boiling water. Press the boiled tamarinds through a fine sieve to get the juice and as much of the pulp as you can. For a more detailed tutorial (and more illustrative photos), click here to view how to extract tamarind juice.About ten minutes after adding the taro (gabi) to the pot, add the eggplant wedges.When the eggplants are almost done, add the kangkong to the pot, pressing them down gently into the broth. </li>\n<li>Let boil for five minutes. Taste the broth and add more patis if necessary.</li>\n<li>Serve the soup hot.</li>\n</ol>\n</div>
478227	How to cook: Sinigang na baboy (pork and vegetables in tamarind broth)	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-cook--Sinigang-na-baboy-(pork-and-vegetables-in-tamarind-broth)-478227.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking oil in a pot. </li>\n<li>Saute the garlic, onion and tomatoes until they start to soften.</li>\n<li>Add the pork cubes. Cook, stirring, until the meat changes color.</li>\n<li>Pour in enough water (or rice washing) to cover. </li>\n<li>Add the finger chilis. Season with patis. Bring to the boil, cover and simmer for an hour to an hour and a half, or until the pork is tender.About 20 minutes before the pork is done, add the taro wedges.Meanwhile, place a fine sieve over a bowl. </li>\n<li>Pour in the tamarind with the boiling water. Press the boiled tamarinds through a fine sieve to get the juice and as much of the pulp as you can. For a more detailed tutorial (and more illustrative photos), click here to view how to extract tamarind juice.About ten minutes after adding the taro (gabi) to the pot, add the eggplant wedges.When the eggplants are almost done, add the kangkong to the pot, pressing them down gently into the broth. </li>\n<li>Let boil for five minutes. Taste the broth and add more patis if necessary.</li>\n<li>Serve the soup hot.</li>\n</ol>\n</div>
640050	Coriander Pork With Baby Bok Choy	\N	\N	\N	https://spoonacular.com/recipeImages/Coriander-Pork-With-Baby-Bok-Choy-640050.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oil in a wok. </li>\n<li>Add the onion and garlic, cook. </li>\n<li>Add the pork and cook well. Sprinkle with pepper and pour in the wine, soy sauce, vinegar and sugar and stir. </li>\n<li>Add a little water too to lighted the sauce.</li>\n<li>Add in the carrots and stir. </li>\n<li>Add the baby bok choy and stir until cooked.</li>\n<li>Add the coriander last and cook lightly. </li>\n<li>Serve with rice.</li>\n</ol>\n</div>
595029	Nourishing Rice (Arroz de Sustancia)	\N	\N	\N	https://spoonacular.com/recipeImages/Nourishing-Rice-(Arroz-de-Sustancia)-595029.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a medium to large pan with a tight fitting cover, over medium heat, place bacon fat and oil. Once hot add onions, carrots and garlic and sauté six minutes. </li>\n<li>Add Prosciutto and tomato paste and stir. Cover and lower heat to lowest setting and cook covered for 25 minutes. </li>\n<li>Remove lid, raise heat, add broth and pepper and bring to a boil. </li>\n<li>Add rice and when the mixture just starts to come back to a boil, cover and lower heat to lowest setting.After 20 minutes remove from heat, fluff with fork and taste. Salt now if needed and let sit five minutes, and then serve.</li>\n</ol>\n</div>
136287	German Homemade Bockwurst	\N	\N	\N	https://spoonacular.com/recipeImages/german_homemade_bockwurst-136287.jpg	http://www.food.com/recipe/german-homemade-bockwurst-85439
523370	Pork asado with stir-fried kangkong	\N	\N	\N	https://spoonacular.com/recipeImages/Pork-asado-with-stir-fried-kangkong-523370.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Prick the meat with a fork in several places.</li>\n<li>Heat the cooking oil in a large heavy pan. Lightly brown the pork, rolling it in hot oil to brown all sides evenly. </li>\n<li>Pour enough water to reach about half the height of the pork. </li>\n<li>Pour in the soy sauce and add the rest of the ingredients. What you’re looking for is an agreeable balance between the saltiness of the soy sauce and the sweetness of the sugar. So, use more or less of either ingredient to suit your taste. Bring to the boil, lower the heat, cover and simmer the pork, fat side up, for an hour to an hour and a half, depending on its thickness. Flip the pork halfway through the cooking time.Lift the pork out of the liquid, place on a plate and cool to room temperature, </li>\n<li>Cut into 1/4 inch slices and arrange on a serving platter.Strain the braising liquid. Reheat. Dissolve the starch in 1/8 cup of water. </li>\n<li>Pour into the braising liquid and cook, stirring, until thickened. Stir in the hoisin sauce and sesame seed oil, and stir well to blend.</li>\n<li>Pour the sauce over the sliced pork and serve.</li>\n</ol>\n</div>
107643	River Road Cookbook Sweet and Sour Pork	\N	\N	\N	https://spoonacular.com/recipeImages/river-road-cookbook-sweet-and-sour-pork-2-107643.jpg	http://chinese.food.com/recipe/river-road-cookbook-sweet-and-sour-pork-263410
738558	Chorizo and Potato Mini Flautas	\N	\N	\N	https://spoonacular.com/recipeImages/chorizo-and-potato-mini-flautas-738558.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Watch how to make this recipe.</li>\n<li>Special equipment: 10 toothpicks</li>\n<li>In a large, heavy saute pan, heat the oil on medium-high heat. </li>\n<li>Saute the potatoes and onions until translucent, about 2 minutes. </li>\n<li>Add the chorizo and cook until crisp, browned and fully cooked, about 10 minutes. </li>\n<li>Transfer to a medium mixing bowl and let cool.</li>\n<li>Heat the tortillas directly on a gas burner just until they are soft and pliable, about 10 seconds per side. </li>\n<li>Place 2 tablespoons of the chorizo and potato mixture on each and roll to from a rolled taco. Stick each roll with a toothpick to hold.In a separate heavy saute pan, heat enough oil for frying the tacos. When the oil it hot, add the rolled tacos in batches and fry on all sides until golden, about 4 minutes.</li>\n<li>Cut the flautas in half and serve on a large platter topped with lettuce and crumbled queso fresco. </li>\n<li>Drizzle with Mexican crema and serve with salsa.</li>\n</ol>\n</div>
249076	Daeji Bulgogi (Korean Spicy BBQ Pork)	\N	\N	\N	https://spoonacular.com/recipeImages/Daeji-Bulgogi-(Korean-Spicy-BBQ-Pork)-249076.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix everything in a freezer bag and marinate over night.Cook the meat on a barbecue or in a pan on the stove.</li>\n</ol>\n</div>
11563	Thyme Pork With Cabbage-and-ham Mash	\N	\N	\N	https://spoonacular.com/recipeImages/thyme-pork-with-cabbage-and-ham-mash-2-11563.jpg	http://www.donnahay.com.au/recipes/mains/meat/thyme-pork-with-cabbage-and-ham-mash
509280	Pork and Plantain Cuban Breakfast Hash	\N	\N	\N	https://spoonacular.com/recipeImages/Pork-and-Plantain-Cuban-Breakfast-Hash-509280.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>First you need to caramelize your plantains.</li>\n<li>Add them to a large skillet over medium heat with a tablespoon of coconut oil. Cook on both sides for about 2-3 minutes, being sure not to burn them.Once they are cooked through, add your plantains to a large bowl and small with a fork. Then add your minced garlic clove, onion, jalapeno, lime, seasonings and leftover pork. Mash thoroughly together.Form a large ball then press down into a thin patty.</li>\n<li>Heat skillet back up and place another tablespoon of coconut oil in your skillet.</li>\n<li>Add your hash to the pan and press down to make it as flat as possible.Cook on both sides for 4-5 minutes or until each side is crispy.Cook up your egg(s) however you’d like. I cooked mine over easy.Top hash with egg. This would also be great with guacamole and/or salsa.</li>\n</ol>\n</div>
583101	Ukrainian Aspic (Kholodets)	\N	\N	\N	https://spoonacular.com/recipeImages/Ukrainian-Aspic-(Kholodets)-583101.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Make sure you soak the pork legs in cold wate (3 hours to overnight - it's also a good way to thaw the pork)In a large pot, add pork legs, and chicken drum sticks. </li>\n<li>Add enough water to cover all of the meat. Set over high heat, cover and bring to a boil. As soon as it starts boiling, remove from heat and drain off the water. Rinse the meat, refill with fresh water (enough water to cover all of the meat, plus an extra ½-inch over the meat); Don't add too much water or it won't be "gelatiney" enough later. Cover and bring to a boil again. Reduce heat to a light boil/simmer and set a timer for 5 hours.After cooking for 5 hours, </li>\n<li>Add 1 large carrot, 2 medium onions (both ends removed), 1 celery stick, 2 bay leaves, 5-8 peppercorns and 2 tsp salt into the pot and continue boiling on low heat 1 more hour. It should look like a nice chicken broth. Now it's important that you do not discard the broth and do not add more water to the pot!</li>\n<li>Remove the drumsticks and carrot from the broth and let them cool. Discard pork legs, onion and bay leaves. Use a fine mesh sieve with 3 bounty paper towels over the sieve and filter the broth through the paper towels. You will be left with a clean broth.Peel and press 4 garlic cloves into the broth and do a taste test to see if more salt is needed.Once the meat has cooled, use a fork to separate meat from the bones. Keep the good meat; discard the bones. Thinly slice the carrot. You can make one big holodets in a rectangular pyrex dish or you can make smaller serving bowls.Start by placing carrots on the bottom and top with some dill if you wish. Next add the meat in an even layer and pour broth over the meat; enough to cover the meat and a little extra over the top. Refrigerate 3 hours to overnight, or until firm. </li>\n<li>Serve with red horseradish/hren (recipe on Natashas</li>\n<li>Kitchen.com) or Russian mustard. Once it's set, set the bowl in hot water for a few seconds, then use a slim spatula to release the gelatin from the dish. Or you can just serve it out of the dish and save yourself a step.</li>\n</ol>\n</div>
212453	Mojo pork skewers with Cuban coolers	\N	\N	\N	https://spoonacular.com/recipeImages/Mojo-pork-skewers-with-Cuban-coolers-212453.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>To make the skewers, pour the oil intoa large heavy-based pan, add the garlicand cook over a low heat until cooked andstarting to toast – take care not to burn.Tip in the cumin, stir briefly, then addthe citrus juices, thyme and someseasoning. Allow to boil for several minsto concentrate and make a sauce. Cool.Put your pork into a bowl, and stir inthree-quarters of the cooled marinade.Leave to marinate for 1 hr at roomtemperature or overnight in the fridge.When ready to serve, thread the porkonto 18 pre-soaked wooden skewers.Griddle for 2 mins on each side or untilcooked. Arrange on a platter, pour overthe remaining sauce and serve garnishedwith orange wedges.To make the coolers, put a handful ofcrushed ice into each of 6 tall glasses.Stir the lime juice and sugar togetheruntil the sugar dissolves, then tip into theglasses. Divide the lager, then the gingerale between the glasses, top with limeslices and serve with the pork skewers.</li>\n</ol>\n</div>
556537	Jalapeno Popper Pork Panini	\N	\N	\N	https://spoonacular.com/recipeImages/Jalapeno-Popper-Pork-Panini-556537.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>For the Jalapeno Cream Cheese: </li>\n<li>Mix all ingredients and season to taste.For the Sandwich: </li>\n<li>Heat a saute pan or electric skillet over medium heat. Butter the outside of each bread slice. </li>\n<li>Place 1 slice butter-side down on the skillet, then top with pork. Sprinkle cheese on top. </li>\n<li>Spread cream cheese on non-buttered side of the other slice of bread, then top the sandwich with the butter-side up. Cook 3-4 minutes, or until golden brown on one side. Then flip and cook until cheese is melty and bread is crispy and golden brown. </li>\n<li>Serve immediately!</li>\n</ol>\n</div>
226838	Regios o Bollitos de Carne (Colombian-Style Pork and Beef Rolls)	\N	\N	\N	https://spoonacular.com/recipeImages/Regios-o-Bollitos-de-Carne-(Colombian-Style-Pork-and-Beef-Rolls)-226838.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Season the meat with, cumin, salt and pepper. </li>\n<li>Spread a thin layer of hogao down the center of each pork slice. Top with a slice of beef.</li>\n<li>Roll tightly and tie with kitchen string. Set a steamer basket in a medium pot filled with the beef stock. Arrange the beef rolls in the steamer. Bring the stock to a boil over medium-high heat, cover and steam for about 40 minutes.In a small bowl combine the batter ingredients, except the oil. </li>\n<li>Mix well.In a large frying pan, heat vegetable oil to 375 degrees F. Dip cooked beef rolls in the batterand immediately place into hot oil.Cook until golden and skim any loose pieces of batter from the oil. </li>\n<li>Drain on paper towels. </li>\n<li>Place on a large platter, season with salt and pepper. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
521938	Yang Chow (Yeung Chow, Yang Zhou) fried rice	\N	\N	\N	https://spoonacular.com/recipeImages/Yang-Chow-(Yeung-Chow--Yang-Zhou)-fried-rice-521938.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
564971	Stir-fried Leeks with Roast Pork and Bean Curd	\N	\N	\N	https://spoonacular.com/recipeImages/Stir-fried-Leeks-with-Roast-Pork-and-Bean-Curd-564971.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oil in wok. Stir fry garlic for about 30 seconds. </li>\n<li>Add leeks (the white portion) and carrot. Stir fry for about 1 minute over high heat.</li>\n<li>Add fried beancurd, oyster sauce and fish sauce. Stir fry for another 1-2 minutes, or until the leeks are softened.</li>\n<li>Add the remaining leeks (leaves) and roasted pork to the wok. Stir fry briefly until the leaves are cooked. </li>\n<li>Drizzle Chinese wine along the sides of the wok and the wine evaporate seconds later (you'll smell the aroma) before you turn off the stove.</li>\n</ol>\n</div>
647656	Hungarian Goulash Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Hungarian-Goulash-Soup-647656.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat butter in large pan and fry onion until golden brown.  </li>\n<li>Add meat and fry 5 more minutes.</li>\n<li>Add carrot, green pepper, tomatoes, paprika, salt, pepper, and garlic salt. Stir well. </li>\n<li>Add 3/4 pint water, cover and simmer for 1 hour, adding more water, if necessary.Before serving, add cream. For variation, add a pinch of cumin and 2 cubed, peeled potatoes for the last 30 minutes of cooking.</li>\n</ol>\n</div>
347907	Sweet and Spicy Shredded Pork	\N	\N	\N	https://spoonacular.com/recipeImages/sweet-and-spicy-shredded-pork-347907.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 350 degrees F. Rinse and dry the pork shoulder.</li>\n<li>Mix together the brown sugar, garlic, cumin, salt, and cayenne. Rub the mixture generously and evenly over the pork shoulder.In a large roasting pan or Dutch oven, add the chopped onions, broth, and cola. </li>\n<li>Place the seasoned pork in the Dutch oven and roast for 4 to 6 hours, checking the pork every hour for tenderness and liquid level.When the pork is tender enough that it is falling apart, shred it with a fork. Reserve the juices and pour them over the shredded pork before serving.*Cook's Note: This recipe is so versatile for entertaining because it can be served in so many different ways. It's comfort food that is easy to serve and pleases the masses.Shredded Pork Serving Variations:Shredded Pork Salads (my favorite): </li>\n<li>Serve the shredded pork over toasted corn tortillas with romaine lettuce, fresh cilantro, pico de gallo, pinto beans, lime wedges, and dressed with a creamy tomatillo dressing, recipe follows. </li>\n<li>Serve with a quick coleslaw on the side as well, recipe follows.Shredded Pork Sandwiches: </li>\n<li>Serve the shredded pork on toasted potato buns.Shredded Pork Tacos: Set up a taco bar featuring guacamole, sour cream, pico de gallo, cilantro, lime wedges, cotija cheese, etc. Works well for a casual party atmosphere.</li>\n</ol>\n</div>
124781	Christine's Hawaiian Pork Steaks	\N	\N	\N	https://spoonacular.com/recipeImages/christines-hawaiian-pork-steaks-2-124781.jpg	http://www.food.com/recipe/christines-hawaiian-pork-steaks-361791
298934	Bean, Cauliflower and Cheese Burritos	\N	\N	\N	https://spoonacular.com/recipeImages/bean-cauliflower-and-cheese-burritos-298934.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Watch how to make this recipe.</li>\n\n<li>Heat the oil in a large heavy saute pan over medium-high heat. </li>\n<li>Add the onions and cook until translucent, about 3 minutes. </li>\n<li>Add the cauliflower and saute until tender, about 5 minutes. Season with salt and pepper. </li>\n<li>Add the oregano. Turn the heat off and reserve.</li>\n<li>Heat a large heavy griddle. Working in batches, heat the tortillas one at a time until they are soft and pliable, about 1 minute per side. </li>\n<li>Add 2 tablespoons of warm Chorizo Refried Beans to the center of the tortilla, spreading outward to the sides. </li>\n<li>Add 1 tablespoon of the sauteed cauliflower mixture. </li>\n<li>Add 1 tablespoon of cheese. Fold in the edges and roll to form a burrito. Return to the griddle just for the cheese to melt, about 10 seconds. </li>\n<li>Serve warm.</li>\n</ol>\n<div class="subRecipeInstructionTitle">Chorizo  Refried Beans:</div>\n<ol>\n\n<li>Heat a medium saute pan on medium heat. </li>\n<li>Add the chorizo and cook until golden in color, about 6 minutes. </li>\n<li>Remove the chorizo to a drain on a plate lined with some paper towels. </li>\n<li>Add the onions to the pan with the chorizo fat. </li>\n<li>Saute until the onions are translucent, about 4 minutes. Return the chorizo to the pan. </li>\n<li>Add the refried beans to the mixture. Continue cooking for about 5 minutes. Turn the heat off and reserve for tostadas and burritos.</li>\n</ol>\n</div>
143426	Rosie's Chicken and Pork Adobo	\N	\N	\N	https://spoonacular.com/recipeImages/rosies-chicken-and-pork-adobo-2-143426.jpg	http://www.food.com/recipe/rosies-chicken-and-pork-adobo-393045
567366	Pork and Kimchi Stew (Dwaejigogi Kimchijjigae)	\N	\N	\N	https://spoonacular.com/recipeImages/Pork-and-Kimchi-Stew-(Dwaejigogi-Kimchijjigae)-567366.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse the meat in running cold water.Marinade the meat with the refined rice wine and ground black pepper (for 15 minutes).Thin slice the mushrooms, onion and spring onion.</li>\n<li>Cut the tofu into medium size cubes.Make a long cut in the middle of the chili and wash out the seeds in cold water (Make sure you don’t touch them. Scrub it out with spoon or knife, if it is necessary. It makes you sting all night if you touch the seeds.) Then thin slice it.Pre heat the wok then add some vegetable oil.</li>\n<li>Add the Kimchi and stir it until it is cooked.</li>\n<li>Put the marinated meat into the bottom of the pot. </li>\n<li>Add all the other ingredients (Kimchi, mushrooms, onion, tofu, water and the sauce) except chili and spring onion.Boil the pot on high heat until it boils.</li>\n<li>Add the chili and spring onion near the end of boiling.</li>\n<li>Serve it.</li>\n</ol>\n</div>
36997	Pan-fried Pork With Snow Pea Slaw	\N	\N	\N	https://spoonacular.com/recipeImages/pan-fried-pork-with-snow-pea-slaw-2-36997.jpg	http://www.donnahay.com.au/recipes/mains/meat/pan-fried-pork-with-snow-pea-slaw
145647	Orange Pork Stroganoff	\N	\N	\N	https://spoonacular.com/recipeImages/orange-pork-stroganoff-2-145647.jpg	http://www.food.com/recipe/orange-pork-stroganoff-203779
706967	Chicken with Chorizo and Tomato Salsa	\N	\N	\N	https://spoonacular.com/recipeImages/chicken-with-chorizo-and-tomato-salsa-706967.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat a large skillet over medium-high heat. </li>\n<li>Add chorizo to pan; cook 4 minutes or until browned, stirring to crumble. </li>\n<li>Place chorizo in a bowl (do not wipe out pan). Sprinkle chicken evenly with salt, black pepper, and cumin seeds. </li>\n<li>Add oil to drippings in pan; swirl to coat. </li>\n<li>Add chicken to pan; cook 5 minutes on each side or until done. </li>\n<li>Remove chicken from pan. </li>\n<li>Add tomato to pan; cook 3 minutes. </li>\n<li>Add tomato, cilantro, onion, juice, and jalapeo to chorizo, stirring to combine. </li>\n<li>Place 1 chicken breast half on each of 4 plates; top with 2 tablespoons chorizo mixture and 2 tablespoons cheese.</li>\n</ol>\n</div>
102482	Vincent Price Sopa Poblano - Poblano Chile Soup	\N	\N	\N	https://spoonacular.com/recipeImages/vincent-price-sopa-poblano-poblano-chile-soup-2-102482.jpg	http://www.food.com/recipe/vincent-price-sopa-poblano-poblano-chile-soup-114908
551453	Crispy Pulled Pork and Caramelized Apples Pancake Stack	\N	\N	\N	https://spoonacular.com/recipeImages/Crispy-Pulled-Pork-and-Caramelized-Apples-Pancake-Stack-551453.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine all ingredients for the pancakes in a small food processor and blend until very well combined.</li>\n<li>Let the batter sit for a few minutes to give the coconut flour a chance to thicken.Meawhile, add some coconut oil to a large skillet and heat over medium-high heat.When pan is hot enough, slowly pour about ¼ of a cup of batter per pancake. </li>\n<li>Spread slightly, lower heat to medium-low and cook all the way through, until tops become sort of matte and dull looking and edges are nice and golden.Very, VERY delicately flip the pancakes and continue cooking until golden on both sides.If you have to work in several batches, place the cooked pancakes in a very low temp oven to keep them warm while you cook the remaining pancakes.While your pancakes are cooking, heat some coconut oil in a separate skillet over medium-high heat. When pan is hot enough, add the apple slices and cook until nice and caramelized on both sides. </li>\n<li>Remove from pan and reserve. In the same pan, add the pork and cook until nice and crispy; reserve. To assemble the pancakes, place one or two pancakes in a small plate, top with a few slices of apple, a pinch of crispy pork followed by another pancake or two. Continue building layers until you run out of ingredients. For a prettier look, finish with a few slices of apples and a few pieces of crispy pork. </li>\n<li>Drizzle with maple syrup to taste.</li>\n</ol>\n</div>
492226	Sweet Potato and Sausage Stuffing	\N	\N	\N	https://spoonacular.com/recipeImages/Sweet-Potato-and-Sausage-Stuffing-492226.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large skillet saute celery, onion, thyme, a pinch or two of salt and pepper together in a couple of tablespoons olive oil over medium-low heat until tender. </li>\n<li>Add sausage and brown, breaking it apart as it cooks.When the sausage is cooked mash up one of the potatoes and combine with the sausage mixture. </li>\n<li>Add 3/4 of the bread stuffing and then begin mixing with the chicken broth a little at a time starting with one cup. Keep adding chicken broth until all of the croutons are soaked but not soggy. If the mixture seems soggy mix in more stuffing mix. </li>\n<li>Mix well incorporating the sausage throughout, taste and season with salt and pepper. Preheat oven to 400 degrees F. Grease a 9x13 pan. Thinly slice the remaining sweet potato and cover bottom of pan, add stuffing. Dot a tablespoon or two (or more) of butter over top and sprinkle with crumbs. </li>\n<li>Bake for 20-25 minutes or until top is browned.</li>\n</ol>\n</div>
246503	Lemongrass and Honey Pork Stir-Fry	\N	\N	\N	https://spoonacular.com/recipeImages/Lemongrass-and-Honey-Pork-Stir-Fry-246503.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all marinade ingredients in a food processor. Blend until a paste is formed.</li>\n</ol>\n</div>
146280	Pork and Potato Hash	\N	\N	\N	https://spoonacular.com/recipeImages/pork-and-potato-hash-2-146280.jpg	http://www.food.com/recipe/pork-and-potato-hash-140508
437120	Pork and Winter Squash Stew	\N	\N	\N	https://spoonacular.com/recipeImages/Pork-and-Winter-Squash-Stew-437120.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a Dutch oven or saucepan, brown pork in 1 tablespoon of oil. </li>\n<li>Remove from pan; drain. </li>\n<li>Heat remaining oil in the same pan over medium heat. </li>\n<li>Saute onion and garlic for 3 minutes.</li>\n<li>Return pork to pan. </li>\n<li>Add the mushrooms, carrots, tomatoes and seasonings; bring to a boil. Reduce heat; cover and simmer for 1 hour.</li>\n\n<li>Add squash; simmer, uncovered for 30 minutes or until meat and vegetables are tender. </li>\n<li>Serve with noodles if desired.</li>\n</ol>\n</div>
588717	Kalua Pork Eggs Benedict With Sriracha Hollandaise Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Kalua-Pork-Eggs-Benedict-With-Sriracha-Hollandaise-Sauce-588717.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Make the hollandaise:Fill a pan less than halfway with water, set it over medium heat until simmering.In a medium bowl, that fits the pan with water but wont touch the water when placed on it, whisk the egg yolks and lemon juice briskly until thickened. You can use a hand mixer for this to speed up the process. Set the bowl over the pan of simmering water while continuing to whisk the mixture and slowly add in the melted butter a little at a time. Once all the butter is combined and the mixture has thickened back up, turn off the heat. </li>\n<li>Add in the salt, pepper and 1 tsp of the sriracha. </li>\n<li>Whisk again well. Taste and add more sriracha if desired for more heat. The mixture will be thick. If not using immediately keep warm and when ready to use whisk again and add water, 1 teaspoon at a time until you reach desired consistency. Spoon over benedict when ready to serve.Make the poached eggs:Set a deep saucepan, at least 3” deep with water and bring to a simmer. </li>\n<li>Add in 1 tsp vinegar. Crack one egg into a very shallow bowl and slowly set it into the simmering water. Using a spoon gently fold any stray egg white to keep the egg as compact as possible. </li>\n<li>Add 1-2 more eggs this way. You don’t want to over crowd the pan. Simmer 2-3 min for runny yolks, 5-6 min for well done. </li>\n<li>Remove using a slotted spoon. Gently transfer to a paper towel to get rid of excess water and then place on top of the muffins when ready.For the Bok Choy:Slice off the bottom of the baby bok choy and separate all the leaves. Rinse well and pat dry. </li>\n<li>Heat a small sauté pan with 1 tsp coconut oil over medium heat. </li>\n<li>Add the chopped baby bok choy and sauté about 4-5 minutes until softened. This can be done while the eggs are poaching.For assembly:Toast the English muffin and place two halves on a plate. Top with each with 2 ounces of the kalua pork, then ¼ cup of the baby bok choy. Top with the poached egg and spoon some of the hollandaise on top. </li>\n<li>Serve immediately!</li>\n</ol>\n</div>
146476	Jamaican Jerk Pork	\N	\N	\N	https://spoonacular.com/recipeImages/jamaican-jerk-pork-2-146476.jpg	http://www.food.com/recipe/jamaican-jerk-pork-373129
118976	Madame Wong's Hot and Sour Soup	\N	\N	\N	https://spoonacular.com/recipeImages/madame-wongs-hot-and-sour-soup-2-118976.jpg	http://chinese.food.com/recipe/madame-wongs-hot-and-sour-soup-55709
214135	Slow-cooked celeriac with pork & orange	\N	\N	\N	https://spoonacular.com/recipeImages/Slow-cooked-celeriac-with-pork---orange-214135.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to fan 120C/conventional 140C/gas  </li>\n<li>Cut each leek into about five pieces, chop the carrots into pieces the same size as the leeks. </li>\n<li>Heat a large, lidded, flameproof casserole dish on the hob until it’s very hot. </li>\n<li>Add 2 tbsp of the olive oil, then carefully tip the pork into the casserole and leave it for a couple of minutes to brown. Stir once, then leave for another couple of minutes. Using a slotted spoon, transfer the meat to a plate. </li>\n<li>Pour the rest of the oil into the dish, tip in the leeks, carrots and celeriac and fry for 3-4 minutes, stirring, until they start to brown. </li>\n<li>Add the garlic and fry for a minute more.Stir the pork and any juices into the vegetables, then pour in the wine, stock, orange juice and soy sauce. Throw in the rosemary and orange zest, season with salt and pepper, give it a stir, then bring everything to the boil. Cover the dish, transfer it to the oven and cook for 2 hours, stirring after an hour. Cook until the pork is very tender and the leeks fall apart when prodded with a spoon. (It can now be left to cool and then frozen for up to 1 month.) Leave to stand for at least 10 minutes, then spoon into bowls. </li>\n<li>Serve with crusty bread to soak up all those juices.</li>\n</ol>\n</div>
144528	Pork Mixed Bean Chili	\N	\N	\N	https://spoonacular.com/recipeImages/pork-mixed-bean-chili-2-144528.jpg	http://www.food.com/recipe/pork-mixed-bean-chili-199107
226536	Fresh Ham with Cloves and Grilled Pineapple	\N	\N	\N	https://spoonacular.com/recipeImages/fresh-ham-with-cloves-and-grilled-pineapple-226536.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Oven Bag Method: Preheat oven to  Slice away tough outer skin from ham. Carefully score fat in a diamond pattern: Slice through fat, being careful not to cut through meat, with a sharp knife on a diagonal going from front to back and then across from side to side. </li>\n<li>Combine rosemary and next 4 ingredients in a small bowl; mix thoroughly to make a liquid paste. Rub mixture over the outside of ham, including slits and crevices; stick whole cloves in the center of the diamonds. </li>\n<li>Place ham, cut side down, in oven bag in large roasting pan. Roast at 350 for 2 hours. Carefully cut bag at the top for steam to escape; roll bag down around the bottom of the ham so ham will brown. Roast 35 more minutes or until the internal temperature reaches 150 to  </li>\n<li>Remove ham, and let rest, loosely tented with foil, at least 30 minutes before slicing. The ham will continue to cook another 5 to  </li>\n<li>Heat a grill pan over medium heat while ham rests. Cook pineapple slices, 4 to 5 at a time, for 2 minutes on each side or until grill marks appear and sugars in the pineapple caramelize. Arrange pineapple slices around platter with the ham, and serve together.Brining Method: Slice away tough outer skin from ham. Carefully score fat in a diamond pattern: Slice through fat, being careful not to cut through meat, with a sharp knife on a diagonal going from front to back and then across from side to side. </li>\n<li>Place ham in brine mixture, and store, covered, in a large plastic bucket or container in refrigerator 24 hours. Preheat oven to  </li>\n<li>Remove ham from liquid brine, rinse with cold water, and pat dry. </li>\n<li>Place ham, cut side down, in a large roasting pan. Roast at 350 for 2 hours 30 minutes or until the internal temperature reaches 150 to 155 and skin is golden brown and crispy, basting with pan liquids every 30 to 40 minutes. </li>\n<li>Remove ham from oven, and let rest, loosely tented with foil, at least 30 minutes before slicing. The ham will continue to cook another 5 to  </li>\n<li>Heat a grill pan over medium heat while ham rests. Cook pineapple slices, 4 to 5 at a time, for 2 minutes on each side or until grill marks appear and sugars in the pineapple caramelize. Arrange pineapple slices around platter with the ham, and serve together.</li>\n</ol>\n</div>
582904	Cheesy Pork and Potato Bake	\N	\N	\N	https://spoonacular.com/recipeImages/Cheesy-Pork-and-Potato-Bake-582904.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wash and peel potatoes. </li>\n<li>Cut them in to big chunks and place them in to a pot with cold water. </li>\n<li>Add 1 bay leaf and ½ tbsp of salt. Cook for 15 min on medium high heat until they can be pierced with a fork, but are not fully cooked. </li>\n<li>Drain potatoes and place them in a large bowl.While potatoes are cooking, cut pork in to small chunks. </li>\n<li>Add some oil to large skillet and cook pork for 7-10 min. Half way through, add 1 tbsp of soy sauce and mix well. Once pork starts to brown, remove from heat.Next, mince 3 cloves of garlic and saute on medium high heat until it starts to brown. Be carefull not to burn it. Stir frequently. After garlic is done cooking, remove it to a separate bowl, add more olive oil and saute onion in the same skillet until it is golden brown.Start preheating oven to 350°F.In a big mixing bowl, combine cooked potatoes, onion, garlic, ¼ cup of fresh dill, 1 cup of heavy whipping cream, 1 tbsp of Mrs. Dash seasoning and gently mix everything together.Empty mixture into a large rectangular baking dish and top with cooked pork. Cover baking dish with foil and place in to preheated oven for 15 min.While potatoes are baking, shred 1 cup of mozzarella cheese.After 15 min are up, take potatoes out of the oven, remove foil, and sprinkle them with mozzarella cheese. Set oven to broil and put the dish back for 2 min to melt the cheese. !You are done, it goes great with canned pickled tomatoes.</li>\n</ol>\n</div>
568618	Slow Cooker Pork and Beans	\N	\N	\N	https://spoonacular.com/recipeImages/Slow-Cooker-Pork-and-Beans-568618.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add all the ingredients into the slow cooker from the beans to the bay leaf in the list above. For the chicken stock, use as little or as much as you will need to cover the beans so they cook evenly.Cook on High for 4 hours. You may want to stir everything together once or twice just to make sure the all the beans are cooking properly.After 4 hours, if the beans are tender, add the tomato paste, canned tomatoes, and crushed red pepper. Season with salt and pepper, as needed. I like to add a little fish sauce for an extra savory flavor but you may omit.Turn the power down to Low and cook for another hour.</li>\n<li>Serve with rice or with country bread</li>\n</ol>\n</div>
433475	Sweet-and-Sour Pork	\N	\N	\N	https://spoonacular.com/recipeImages/Sweet-and-Sour-Pork-433475.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Drain pineapple, reserving juice; set pineapple aside. In a small bowl, combine corn syrup, vinegar, ketchup, soy sauce and reserved juice; set aside.</li>\n<li>In a small skillet, stir-fry the pork and garlic in oil for 4 minutes or until pork is browned. </li>\n<li>Add green pepper; stir-fry for 2 minutes or until crisp-tender. Stir in pineapple juice mixture; bring to a boil.</li>\n\n<li>Combine the cornstarch and water until smooth; gradually stir into the skillet. Cook and stir for 1-2 minutes or until thickened. Stir in the reserved pineapple; heat through. </li>\n<li>Serve over rice.</li>\n</ol>\n</div>
243067	Down-South Banh Mi	\N	\N	\N	https://spoonacular.com/recipeImages/down-south-banh-mi-243067.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to  </li>\n<li>Bake baguette on an ungreased baking sheet 10 minutes or until warm. Meanwhile, stir together mayonnaise and sriracha in a small bowl. Stir together carrots and fish sauce in a separate bowl. Split baguette horizontally. </li>\n<li>Cut each half into 3 (6-inch-long) pieces. </li>\n<li>Spread cut sides of bread with mayonnaise mixture. Layer bottom halves with Slow-cooker Mustard Barbecued Pork, Pickled Peppers and Onions, serrano pepper slices, carrot mixture, and cilantro to taste. Top with remaining bread slices. </li>\n<li>Serve immediately.* 1/2 small jalapeo pepper may be substituted.</li>\n</ol>\n</div>
564983	Chinese-style Potato and Pork	\N	\N	\N	https://spoonacular.com/recipeImages/Chinese-style-Potato-and-Pork-564983.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Marinade minced pork with (A) for 10 minutes.</li>\n<li>Heat oil in pan. </li>\n<li>Add onions and stir fry until they just start to soften. </li>\n<li>Add garlic and stir fry for 30 seconds.Push onions and garlic to side of the wok, then add marinaded minced pork. Stir fry pork until semi-cooked, breaking the meat to smaller bits with your spatula while doing so.</li>\n<li>Add potato slices and stir fry for two minutes. </li>\n<li>Add (B), stirring to coat everything evenly in the sauce, then cover with lid and simmer for 10 minutes. </li>\n<li>Add the thawed vegetables half way through cooking time. </li>\n<li>Add hot water any time the simmering sauce runs dry. Season to taste and garnish with coriander.</li>\n</ol>\n</div>
212766	Asian aubergine & pork hotpot	\N	\N	\N	https://spoonacular.com/recipeImages/Asian-aubergine---pork-hotpot-212766.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oven to 200C/fan 180C/gas  </li>\n<li>Heat 2 tbsp of the oil in an ovenproof sauté pan and brown the meat well (you may have to do this in batches), then scoop out of the pan. </li>\n<li>Add the rest of the oil and the aubergine, brown on all sides, scoop out and add to the pork. Tip the sugar into the pan and leave to caramelise slightly, then return the pork and aubergine to the pan with the star anise and cinnamon, then coat in the sticky caramel.</li>\n<li>Add the onions, ginger and half the chilli, and cook for a few mins with the pork. </li>\n<li>Add the coriander stalks and splash in the fish sauce and enough water to come about a third of the way up. Cover and place the dish, undisturbed, in the oven for 1 hr, then remove from the oven and add the lime juice and more fish sauce to taste. Stir through half the coriander leaves and the remaining chilli, and scatter over the rest of the coriander. You should have a hotpot of tender meat with soft aubergines all in a punchy little sauce.</li>\n</ol>\n</div>
745330	Jersey Ham, Egg, Bagel and Herb Cream Cheese Breakfast Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/jersey-ham-egg-bagel-and-herb-cream-cheese-breakfast-sandwich-745330.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Watch how to make this recipe.</li>\n\n<li>Place the cream cheese in a large bowl. Finely chop the dill and parsley and add to the cream cheese with a pinch of chile powder. Season with salt and pepper, and thoroughly mix the ingredients to evenly distribute and combine the flavors.Slice 4 rounds from the center of the tomato, each about 1/4 inch thick. Season with salt and pepper and set aside.Set a skillet over medium heat and add a little oil. Cook the pork roll slices until lightly browned on each side, about 5 minutes. Set aside.</li>\n<li>Whisk the eggs in a bowl and sprinkle with salt and pepper. Put a nonstick skillet on medium heat and add the butter. </li>\n<li>Add the eggs and cook until scrambled, stirring occasionally, about 5 minutes.</li>\n<li>Spread about 1 1/2 tablespoons of the herb cream cheese on each bagel half. </li>\n<li>Place 2 slices of the meat on the bottom half of each bagel and top with scrambled eggs and sliced tomato. </li>\n<li>Place the top half of each bagel on the sandwiches and serve.</li>\n<li>Contestant/Competition Recipe: This recipe was created by a contestant during a cooking competition. The Food Network Kitchen have not tested it for home use and therefore cannot make any representation as to the results.</li>\n<li>Pork roll, a seasoned ground pork product sold in cylinders or slices, is typically fried or grilled before serving.</li>\n</ol>\n</div>
92100	Stir-Fry Pork and Jicama	\N	\N	\N	https://spoonacular.com/recipeImages/stir-fry-pork-and-jicama-2-92100.png	http://www.food.com/recipe/stir-fry-pork-and-jicama-256538
143357	Pork in Orange Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/pork-in-orange-sauce-2-143357.jpg	http://www.food.com/recipe/pork-in-orange-sauce-299725
661533	Steaks with pesto, tomatoes and feta cheese	\N	\N	\N	https://spoonacular.com/recipeImages/Steaks-with-pesto--tomatoes-and-feta-cheese-661533.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the tomatoes on a baking tray lined with baking paper, scatter over capers, garlic cloves and crumbled fetta.Sprinkle with olive oil and cracked pepper. Cook in oven at 200C for 30 minutes or until tomatoes are soft. </li>\n<li>Remove and set aside.Sprinkle with fresh basil.Meanwhile, flaten the steaks with a meat mallet.Smear one side of each steak with  tablespoon of red pesto, make a roll (pesto side inside) and secure it with a wooden or metal toothpick.</li>\n<li>Mix cornflour, dry basil, salt and pepper in a plate. Dredge the rolls through the flour mixture, shake off excess flour.In a large skillet heat olive oil over medium-high heat, then brown the rolls for 5 -6, constantly turning them until golden all around.Before serving, take out toothpick and serve with tomatoes, capers, garlic and fetta bake.</li>\n</ol>\n</div>
526400	Hong Kong Style Zha Jiang Noodles	\N	\N	\N	https://spoonacular.com/recipeImages/Hong-Kong-Style-Zha-Jiang-Noodles-526400.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix the pork with marinade. Set aside for 10 minutes.</li>\n</ol>\n</div>
567525	Udon Noodle Stir-fry with Pork and Edamame	\N	\N	\N	https://spoonacular.com/recipeImages/Udon-Noodle-Stir-fry-with-Pork-and-Edamame-567525.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place pork in a bowl. In another bowl whisk together soy sauce, sambal oelek, sesame oil, rice vinegar, ginger and 1 minced garlic clove. </li>\n<li>Pour marinade over the top of the pork and toss to coat. Cover and refrigerate for 30 minutes.While your pork is marinating, cook udon noodles and edamame according to package directions. Set aside.</li>\n<li>Heat peanut oil in a large skillet over medium-high heat. </li>\n<li>Add mushrooms and onions and cook until onions start to caramelize, about 5 minutes. </li>\n<li>Add in edamame and noodles. Stir to combine. </li>\n<li>Transfer to a plate.In the same skillet, add pork and marinade. Cook until pork is cooked through, about 5 minutes. Return noodle mixture to the pan. </li>\n<li>Add green onions. Toss to combine well.</li>\n<li>Serve.</li>\n</ol>\n</div>
482250	Roast Beef Sandwich with Creamy Horseradish and Sun Dried Tomatoes	\N	\N	\N	https://spoonacular.com/recipeImages/Roast-Beef-Sandwich-with-Creamy-Horseradish-and-Sun-Dried-Tomatoes-482250.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Toast the roll in the oven.</li>\n<li>Mix the chopped Mezetta Sun-Ripened Dried Tomato and the Mezzetta Horseradish Cream Style.</li>\n<li>Spread on one side of the roll.On the other side of the roll, add the roast beef, the Provolone cheese and then top with fresh spinach leaves.</li>\n<li>Put the top on.If you want, you can wrap this in tinfoil and place it in the oven for a few minutes to warm it.</li>\n</ol>\n</div>
482262	Mongolian Beef	\N	\N	\N	https://spoonacular.com/recipeImages/Mongolian-Beef-482262.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Marinate the beef with the seasonings for 30 minutes. </li>\n<li>Heat up a pan with 1 tablespoon of oil and stir-fry the marinated beef until they are half-done. </li>\n<li>Remove from pan and set aside.</li>\n<li>Heat up another 1 tablespoon of oil and saute the garlic and ginger until soft. </li>\n<li>Add the beef back into the pan and then add the sauce. Continue to stir-fry until the beef is almost done. </li>\n<li>Add the vegetables and cook until done.**Note - My kids don't like pieces of ginger so I add a bit of powdered to the seasonings instead.**</li>\n</ol>\n</div>
521179	Cheesesteak sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/Cheesesteak-sandwich-521179.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the french baguette into three to four equal portions. Split each piece in half vertically.Divide the beef slices into three to four portions.Take a portion and fold each slice in half. Arrange the folded beef in a row, slightly overlapping one another to form a rather flat-looking log.Repeat with the remaining portions.Sprinkle each “log” with salt and pepper.</li>\n<li>Heat the grill and skillet (or frying pan).Melt the butter in the skillet (or frying pan) and remember that you’re cooking steaks so the temperature should be very, very high to sear the meat.Carefully move the beef “logs” to the skillet or pan. Arrange them side by side with about two inches of space between them to make flipping easier.On the grill, arrange the bread, cut side down.After about two minutes, partially lift one end of a beef “log”. If the underside is nicely charred, flip it over. This is a little tricky as you’re handling overlapping slices of meat. A spatula does the job well.Do the same with the others.Meanwhile, flip over the bread on the grill.Top each beef “log” with slices of cheese. Cook for another minute. If the timing and cooking temperature are just right, the cheese should melt at the same time that the beef gets done.</li>\n<li>Place the bread on plates.</li>\n<li>Spread mayo on the bottom halves.Cover the bottom halves with onion rings.Using a spatula, transfer the cooked beef and cheese filling to the bread, arranging them on top of the onion slices.</li>\n<li>Serve the sandwiches while hot.</li>\n</ol>\n</div>
146420	Boerewors - South African Sausage	\N	\N	\N	https://spoonacular.com/recipeImages/boerewors-south-african-sausage-2-146420.jpg	http://www.food.com/recipe/boerewors-south-african-sausage-120735
478210	Vegetarian beef, lima beans and Chinese broccoli stir fry. Meatless and vegan	\N	\N	\N	https://spoonacular.com/recipeImages/Vegetarian-beef--lima-beans-and-Chinese-broccoli-stir-fry--Meatless-and-vegan-478210.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking oil in a frying pan.</li>\n<li>Saute the chilies and garlic for half a minute then add the vegetarian beef. Stir fry until the vegetarian beef strips (or slices, if that was how you cut the chunks) are lightly browned.</li>\n<li>Pour in the soy sauce and kalamansi juice. Stir. </li>\n<li>Add the Chinese broccoli and lima beans. Stir fry just until the vegetables are heated through.</li>\n</ol>\n</div>
99336	The Champion of Roast Beef Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/the-champion-of-roast-beef-sandwiches-2-99336.jpg	http://www.food.com/recipe/the-champion-of-roast-beef-sandwiches-54588
119918	Easy Roast Beef Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/easy-roast-beef-sandwiches-2-119918.jpg	http://www.food.com/recipe/easy-roast-beef-sandwiches-300703
502923	Scandi meatballs	\N	\N	\N	https://spoonacular.com/recipeImages/Scandi-meatballs-502923.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oil in a large lidded pan. Cook the meatballs for 3-4 mins over a medium heat, turning often so that they brown all over. </li>\n<li>Remove from the pan with a slotted spoon and drain away any excess oil, reserving about 1 tbsp.</li>\n<li>Add the onion and garlic to the pan and cook for 4-5 mins, stirring to soften. Stir in the soup with half a can of water. Return the meatballs to the pan and bring to the boil. Turn down the heat, cover and simmer for a further 10-15 mins until the meatballs are cooked through. Stir in the dill, mustard and some seasoning. </li>\n<li>Serve with mashed potato and cabbage.</li>\n</ol>\n</div>
595148	Beef Chimichangas	\N	\N	\N	https://spoonacular.com/recipeImages/Beef-Chimichangas-595148.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat vegetable oil to 350 degrees in a large heavy bottomed pan full enough to cover the chimichangas while cooking.Lay out the four tortillas and divide the heated (shredded beef) and two cheeses equally between them.</li>\n<li>Roll tightly from one side to the other and fold over each end and pinch closed with a bull dog clip.Fry a few at a time in hot oil until golden brown, about 4-5 minutes. </li>\n<li>Serve with heated enchilada sauce.</li>\n</ol>\n</div>
468546	Deli Beef Sandwiches with Horseradish Mayonnaise	\N	\N	\N	https://spoonacular.com/recipeImages/Deli-Beef-Sandwiches-with-Horseradish-Mayonnaise-468546.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, combine the mayonnaise, preserves and horseradish. </li>\n<li>Spread 1 tablespoon over each of four bread slices. Layer with roast beef, lettuce and tomato; sprinkle with salt and pepper. </li>\n<li>Spread remaining mayonnaise mixture over remaining bread; place over top.</li>\n</ol>\n</div>
625898	Slow-Cooker Beef and Barley	\N	\N	\N	https://spoonacular.com/recipeImages/Slow-Cooker-Beef-and-Barley-625898.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Prepare ingredients for the dish. </li>\n<li>Cut mushrooms into four pieces, cut meat into cubes, dice onions and carrots into chunks. Preheat skillet to a high heat, brown the meat until it's browned. </li>\n<li>Remove meat form the skillet and place it into a slow cooker. Into the same skillet, place carrots and onion and cook until they are lightly browned. </li>\n<li>Place them into a slow cooker.Brown mushrooms on a skillet and add them into the slow cooker.Into the slow cooker, add in barley, bay leaves, better than bullion and season with salt. Fill the slow cooker with water, covering 2/3 of the ingredients(I used about 5 cups). Depending on your slow cooker you would need to cook the food on high for 2-4 hours. Check while it's cooking to see if it's ready.</li>\n</ol>\n</div>
267514	Beef and Slaw Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/Beef-and-Slaw-Sandwiches-267514.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>COMBINE coleslaw blend, dressing and pepper. FILL bread slices with coleslaw and remaining ingredients to make 4 sandwiches.</li>\n</ol>\n</div>
288023	Pepperoni and Cheese Scrambled Eggs	\N	\N	\N	https://spoonacular.com/recipeImages/pepperoni-and-cheese-scrambled-eggs-288023.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat grapeseed oil over medium-high heat in a large skillet. Fry pepperoni, transfer to paper towels to drain, pour off fat and wipe out pan. Melt butter in pan over medium heat. </li>\n<li>Whisk together eggs and milk, add to pan, and season with salt and pepper. Loosen edges to prevent eggs from sticking. When eggs begin to set, sprinkle with cheese and top with pepperoni and scallions. </li>\n<li>Remove from heat. Cover and let carryover cook until firm.</li>\n</ol>\n<div class="subRecipeInstructionTitle">CATEGORIES:</div>\n<ol>\n<li>Eggs</li>\n<li>Breakfast</li>\n<li>American</li>\n<li>View All</li>\n<li>Main Ingredient</li>\n<li>Eggs</li>\n<li>Meat</li>\n<li>Cheese</li>\n<li>Course</li>\n<li>Breakfast</li>\n<li>Main Dish</li>\n<li>Cuisine</li>\n<li>American</li>\n<li>Cooking Style</li>\n<li>Easy</li>\n</ol>\n</div>
417110	Creamy Onion Beef Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/Creamy-Onion-Beef-Sandwiches-417110.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, combine the sour cream, soup mix and horseradish. </li>\n<li>Spread over cut side of roll tops; set aside. Layer bottom halves with roast beef and cheese. </li>\n<li>Place on an ungreased baking sheet. Broil 2-4 in. from the heat for 2-3 minutes or until cheese is melted. Replace roll tops.</li>\n</ol>\n</div>
159122	Green Bean and Beef Pasta Supper	\N	\N	\N	https://spoonacular.com/recipeImages/Green-Bean-and-Beef-Pasta-Supper-159122.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In 10-inch skillet, cook beef over medium-high heat 5 to 7 minutes, stirring frequently, until thoroughly cooked; drain.</li>\n<li>2</li>\n<li>Stir in hot water, milk, sauce mix and uncooked pasta (from Hamburger Helper box), onion, frozen green beans and mushrooms. </li>\n<li>Heat to boiling, stirring occasionally.</li>\n<li>3</li>\n<li>Reduce heat; cover and simmer 10 minutes, stirring occasionally. </li>\n<li>Remove from heat; uncover and let stand 5 minutes (sauce will thicken as it stands). Stir before serving.</li>\n</ol>\n</div>
265621	Hot and Hearty Baked Beef Sandwich Loaf	\N	\N	\N	https://spoonacular.com/recipeImages/Hot-and-Hearty-Baked-Beef-Sandwich-Loaf-265621.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>PREHEAT oven to 400Â°F.  Spray 15x10x1-inch baking pan with cooking spray.  </li>\n<li>Place pizza dough in pan; pat out with fingers to completely cover bottom of pan. ARRANGE meat slices, in lengthwise row, down center of dough; top with onions, peppers, potatoes and cheese.  Fold over long sides of dough to cover filling, slightly overlapping edges of dough in center.  Pinch ends of dough together to seal. BAKE 15 to 20 min. or until golden brown.  </li>\n<li>Remove from baking pan; let stand 5 min. before cutting into 6 slices to serve.</li>\n</ol>\n</div>
42444	Roast Beef And Cheddar Roll-ups	\N	\N	\N	https://spoonacular.com/recipeImages/roast-beef-and-cheddar-roll-ups-2-42444.jpg	http://framed-mylifeonepictureatatime.blogspot.com/2009/06/roast-beef-and-cheddar-roll-ups.html
13964	Grilled Chorizo, Goat Cheese, And Watercress Pita Pizzas	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-chorizo-goat-cheese-and-watercress-pita-pizzas-2-13964.jpg	http://www.epicurious.com/recipes/food/views/Grilled-Chorizo-Goat-Cheese-and-Watercress-Pita-Pizzas-235343
370332	Peppercorn Encrusted Beef Tenderloin on Beef Tomato with Goat Cheese, French Fried Onions and Balsamic Vinegar Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/peppercorn-encrusted-beef-tenderloin-on-beef-tomato-with-goat-cheese-french-fried-onions-and-balsamic-vinegar-sauce-370332.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Crush the black peppercorns coarsely and pack liberally on both sides of the beef.</li>\n<li>Drizzle a few tablespoons of balsamic vinegar over the tenderloins and set at room temperature for 20 to 25 minutes to marinate. Grill tenderloins to likeness. While resting, slice the tomato into 1/2-inch thick slices and spread each slice with goat cheese. </li>\n<li>Spread it thick! Set the tomatoes aside. </li>\n<li>Heat a saute pan and add the remaining balsamic vinegar and sugar. Reduce until halved. Set the filet atop the goat cheese tomato slices and drizzle with the reduced balsamic sauce. Top with the French fried onions and serve immediately.</li>\n</ol>\n</div>
81583	Italian Beef Subs	\N	\N	\N	https://spoonacular.com/recipeImages/italian-beef-subs-81583.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oil in a large nonstick skillet over medium heat. </li>\n<li>Add bell pepper and garlic; saut for 2 minutes. Stir in oregano and broth. Bring to a boil; reduce heat, and simmer for 10 minutes. </li>\n<li>Remove bell pepper mixture from pan. </li>\n<li>Add beef to pan, and cook for 45 seconds. Divide beef evenly among the bottom halves of rolls; top each roll half with 1/4 cup bell pepper mixture, and 2 tablespoons giardiniera; cover with roll tops.</li>\n</ol>\n</div>
534220	Quick Barbecue Cheddar Sausage Sandwiches with Balsamic Onions	\N	\N	\N	https://spoonacular.com/recipeImages/Quick-Barbecue-Cheddar-Sausage-Sandwiches-with-Balsamic-Onions-534220.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat a medium nonstick skillet over medium heat on the stove. </li>\n<li>Add the oil and heat for 1-2 minutes. Stir in the onions and salt. Cook for 10 minutes stirring occasionally, or until softened and mostly translucent. Stir in the balsamic vinegar and cook for one more minute.Meanwhile, heat the grill (or a stovetop grill pan). Slice the sausages in half, leaving them partially attached on one side (you are essentially butterflying the sausage). Grill until hot, flipping once -- 3-4 minutes per side.Now, it's time to assemble your sandwiches. </li>\n<li>Place one sausage on each roll and top with 1/4 of the onions, 1/4 of the cheese and barbecue sauce, to taste. Close, slice in half and serve.</li>\n</ol>\n</div>
16164	Grilled Lamb Chops with Red Wine Pan Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-lamb-chops-with-red-wine-pan-sauce-16164.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In each of 2 large heavy skillets, heat 1 tablespoon of the oil until almost smoking. Season the lamb chops with salt and pepper, add them to the pans and cook over high heat, turning once, until browned and crusty, 5 to 6 minutes. </li>\n<li>Transfer the lamb to a platter, cover loosely with foil and keep warm.</li>\n\n<li>Add half of the shallots to each skillet and cook, stirring constantly, until softened, about 2 minutes. </li>\n<li>Add 1/4 cup of the wine to each pan and cook until almost completely reduced, scraping up any browned bits, about 5 minutes.</li>\n<li>Scrape the shallot mixture into 1 skillet and add the tomato paste. Cook over high heat until beginning to brown, about 2 minutes. </li>\n<li>Add the demiglace and cook until reduced by half, about 8 minutes. </li>\n<li>Add the butter and swirl until it melts. </li>\n<li>Add any accumulated lamb juices and season with salt and pepper. Strain the sauce through a fine sieve into a bowl. </li>\n<li>Serve the lamb chops with the pan sauce.</li>\n</ol>\n</div>
42806	Beef & Cheese Croissant	\N	\N	\N	https://spoonacular.com/recipeImages/beef_cheese_croissant-42806.jpg	http://www.landolakes.com/recipe/1528/beef-cheese-croissant
522111	Beef, tofu and Chinese cabbage stir fry	\N	\N	\N	https://spoonacular.com/recipeImages/Beef--tofu-and-Chinese-cabbage-stir-fry-522111.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking oil in a wok or frying pan.</li>\n<li>Add the beef and onion and stir fry over high heat for about a minute.</li>\n<li>Add the tofu cubes. Season with soy sauce, fish sauce, lemon juice and sugar. Stir lightly and cook for 30 seconds.</li>\n<li>Add the stalks of the Chinese cabbage since they require a longer cooking time than the leaves. Stir. Cook for 30 seconds.</li>\n<li>Add the chili garlic sauce (you can actually add it earlier, along with the soy sauce, etc.). Stir.</li>\n<li>Add the leaves. Stir. Cook for another 30 seconds. Taste and adjust the seasonings.</li>\n<li>Serve hot over rice.</li>\n</ol>\n</div>
597924	Roast Beef and Cheddar Roll-Ups	\N	\N	\N	https://spoonacular.com/recipeImages/Roast-Beef-and-Cheddar-Roll-Ups-597924.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, combine cream cheese and horseradish. </li>\n<li>Spread evenly over each tortilla. Layer the tortillas with the lettuce, roast beef and cheddar. </li>\n<li>Roll up. </li>\n<li>Serve with kettle-cooked potato chips and give a cheer for Sandwich Night. Consider watching old movies from the 80's after dinner. Anything with Molly Ringwald is a great choice.</li>\n</ol>\n</div>
22448	Easy Beef Stroganoff	\N	\N	\N	https://spoonacular.com/recipeImages/easy-beef-stroganoff-22448.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook the noodles according to the package directions. Meanwhile, in a large saucepan, over medium heat, heat the oil. </li>\n<li>Add the onion and salt and cook for 5 minutes. </li>\n<li>Add the mushrooms and bell pepper (if using) and cook for 5 minutes. </li>\n<li>Add the beef and cook until warmed through, about 8 minutes. In a small bowl, combine the sour cream and steak sauce and stir the mixture into the beef and mushrooms. Divide the drained noodles among individual plates and top with the stroganoff.</li>\n</ol>\n</div>
128992	Vegetarian Cranberry - Barbecue Pizza	\N	\N	\N	https://spoonacular.com/recipeImages/vegetarian-cranberry-barbecue-pizza-2-128992.jpg	http://www.food.com/recipe/vegetarian-cranberry-barbecue-pizza-294390
526315	Beef Tendon and Brisket Stew	\N	\N	\N	https://spoonacular.com/recipeImages/Beef-Tendon-and-Brisket-Stew-526315.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Blanch beef brisket and tendon in boiling water for about 3 minutes to remove the blood and impurities. (Remark: blanch in batches if your wok or pot is not large enough.) Rinse and drain well.</li>\n</ol>\n</div>
620572	Sancocho Antioqueño o Paisa (Paisa Region Soup)	\N	\N	\N	https://spoonacular.com/recipeImages/Sancocho-Antioqueo-o-Paisa-(Paisa-Region-Soup)-620572.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the beef and pork in a large pot, add about 12 cups of water, alios sauce and salt. Bring to a boil, reduce to a simmer. Cover and let simmer for about 30 minutes. </li>\n<li>Add the corn and simmer for 30 minutes more.</li>\n<li>Add the plantains, yuca and potato and cook for 30 minutes more. </li>\n<li>Add more water if necessary. </li>\n<li>Add chopped fresh cilantro and serve with avocado, white rice and aj on the side.</li>\n</ol>\n</div>
227381	Arepa con Carne Asada (Arepa with Colombian-Style Grilled Beef)	\N	\N	\N	https://spoonacular.com/recipeImages/Arepa-con-Carne-Asada-(Arepa-with-Colombian-Style-Grilled-Beef)-227381.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix the chopped onion, minced garlic, scallions, cumin, beer, oil salt and pepper together to make a marinade for the meat.Rub the marinade on the steaks and let marinate for a bout 3 hours or overnight in the refrigerator.Grill or fry the steaks over high heat to desired doneness, about 3 minutes on each side. To serve, top each arepa with a piece of meat, sprinkle fresh cilantro and serve immediately.</li>\n</ol>\n</div>
112695	Make Ahead Chimichangas	\N	\N	\N	https://spoonacular.com/recipeImages/make-ahead-chimichangas-2-112695.jpg	http://www.food.com/recipe/make-ahead-chimichangas-57027
395397	Open-Faced Roast Beef Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/Open-Faced-Roast-Beef-Sandwiches-395397.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place roast beef on ciabatta slices. In a large bowl, combine arugula and romaine. In a small bowl, whisk remaining ingredients until blended. </li>\n<li>Drizzle over greens; toss to coat. Arrange over beef; serve immediately.</li>\n</ol>\n</div>
321688	Beef Medallions with Bacon and Morels	\N	\N	\N	https://spoonacular.com/recipeImages/beef-medallions-with-bacon-and-morels-321688.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wrap a slice of bacon around each beef medallion and secure with toothpicks. Season with salt and pepper. In a skillet, heat the oil until shimmering. </li>\n<li>Add the medallions and cook over moderately high heat until browned on the bottom, 2 minutes; turn and cook for 1 minute. </li>\n<li>Add the morels and scallions and cook over moderate heat until the scallions are tender. </li>\n<li>Transfer the meat to a plate. Cook the vegetables for 2 minutes more, add the Madeira and simmer for 2 minutes. </li>\n<li>Add the meat and stock and simmer over moderately low heat, turning, until an instant-read thermometer inserted in the center of the meat registers 140, about 3 minutes. </li>\n<li>Transfer the meat to plates; discard the toothpicks. </li>\n<li>Remove the skillet from the heat and swirl in the butter. Season with salt and pepper, spoon over the meat and serve.</li>\n</ol>\n</div>
266917	Southwest Beef Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/Southwest-Beef-Sandwich-266917.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>COMBINE first 4 ingredients. FILL rolls with lettuce, meat, cheese and corn mixture.</li>\n</ol>\n</div>
782571	Roast Beef and Cheddar Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/roast-beef-and-cheddar-sandwiches-782571.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat a large skillet over medium heat. </li>\n<li>Add 1/2 teaspoon olive oil the skillet along with the mushrooms. Cook mushrooms for 2-3 minutes or until they begin to soften; season with salt and pepper. </li>\n<li>Remove mushrooms and set aside.</li>\n<li>Add onion slices to the same skillet. Cook onions for 10-15 minutes, stir occasionally. You want the onions to turn caramel in color and be quite soft. When onions have caramelized, remove from heat.Prepare the cheese sauce by stirring together butter and flour in a small saucepan over medium heat. Slowly whisk in the milk until the mixture is smooth. Stir in cheese.To assemble the sandwich, place 2 slices of roast beef on two slices of toasted bread.Top beef with cheese.Divide the mushrooms and onions between the two sandwiches, top with remaining bread slices and serve.</li>\n</ol>\n</div>
110879	Beef and Broccoli Stir-Fry	\N	\N	\N	https://spoonacular.com/recipeImages/beef-and-broccoli-stir-fry-2-110879.jpg	http://www.food.com/recipe/beef-and-broccoli-stir-fry-69229
172345	Beef Pasta and Mushroom Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Beef-Pasta-and-Mushroom-Soup-172345.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In 4-quart Dutch oven, cook beef and onion over medium-high heat 5 to 7 minutes, stirring occasionally, until beef is brown; drain.</li>\n<li>2</li>\n<li>Stir in hot water, Sauce </li>\n<li>Mix, basil, salt, pepper and garlic. </li>\n<li>Heat to boiling, stirring constantly.</li>\n<li>3</li>\n<li>Reduce heat. Cover; simmer 10 minutes, stirring occasionally. Stir in uncooked Pasta, mushrooms and wine. Cover; cook 10 minutes longer. Stir in parsley.</li>\n</ol>\n</div>
336280	French Dip Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/french-dip-sandwiches-336280.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large, shallow skillet over moderate heat, melt butter. </li>\n<li>Add shallots to butter and saute 2 minutes. </li>\n<li>Add flour to butter and shallot and cook a minute longer. </li>\n<li>Whisk in sherry and cook liquid out. </li>\n<li>Whisk in consomme in a slow stream. Bring sauce to a bubble and allow to simmer over low heat until ready to serve sandwiches.Pile meat loosely across your cutting board or a large work surface. Season meat with grill seasoning or salt and black pepper. Set out 4 ramekins or small soup cups for dipping sauce, 4 dinner plates and 4 split torpedo rolls. To assemble, using a pair of kitchen tongs, dip meat into loose au jus sauce and pile into rolls. Set ramekins or cups with extra dipping sauce along side the sandwiches.</li>\n</ol>\n</div>
223667	Asian beef salad	\N	\N	\N	https://spoonacular.com/recipeImages/Asian-beef-salad-223667.jpg	http://www.bbcgoodfood.com/recipes/2500/asian-beef-salad
172477	Asian Steak Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Asian-Steak-Salad-172477.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Spray 12-inch nonstick skillet with cooking spray; heat over medium-high heat. </li>\n<li>Place beef in skillet; sprinkle with 1 teaspoon seasoning mix from soup mix. (Discard remaining seasoning mix.) Cook beef 4 to 5 minutes, stirring occasionally, until brown. Stir in 1 tablespoon of the dressing.</li>\n<li>2</li>\n<li>Break block of noodles from soup mix into small pieces. </li>\n<li>Mix noodles, lettuce, pea pods, carrots, and orange segments in large bowl. </li>\n<li>Add remaining dressing; toss until well coated. Divide mixture among individual serving plates. Top with beef strips.</li>\n</ol>\n</div>
385491	Bistro Beef Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/Bistro-Beef-Sandwich-385491.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Spread one bread slice with spreadable cheese. Layer with beef, tomato, lettuce and red pepper. </li>\n<li>Spread remaining bread with salad dressing; place on top.</li>\n</ol>\n</div>
385499	Pepper-Topped Beef Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/Pepper-Topped-Beef-Sandwiches-385499.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a nonstick skillet, saute onion and garlic in oil until tender. </li>\n<li>Add the red and green peppers, bay leaf, salt and pepper. Cook and stir until peppers are tender, about 10 minutes. </li>\n<li>Add sugar; cover and simmer for 10-15 minutes or until heated through.</li>\n<li>Discard bay leaf. </li>\n<li>Place beef on rolls; top with pepper mixture.</li>\n</ol>\n</div>
436742	Philadelphia Beef Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/Philadelphia-Beef-Sandwich-436742.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut bread in half. Carefully hollow out bottom and top of loaf, leaving a 3/4-in. shell (discard removed bread or save for another use).</li>\n<li>In a large skillet, saute onion and green pepper in oil for 5 minutes or until tender. Meanwhile, in a small saucepan, combine water and au jus sauce; bring to a boil. </li>\n<li>Add beef. Reduce heat to medium; cook for 3 minutes or until meat is heated through. </li>\n<li>Remove beef with a slotted spoon; reserving 1/4 cup au jus.</li>\n<li>Spoon the onion and green pepper onto the bread bottom. Top with beef; drizzle with reserved au jus. </li>\n<li>Spread with horseradish sauce and top with cheese.</li>\n\n<li>Transfer to a baking sheet. Broil 3-4 in. from the heat for 1-2 minutes or until cheese is melted. Replace bread top. </li>\n<li>Cut into six wedges with a serrated knife.</li>\n</ol>\n</div>
416319	Beef and Blue Cheese Crostini	\N	\N	\N	https://spoonacular.com/recipeImages/Beef-and-Blue-Cheese-Crostini-416319.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut baguette into 36 slices. </li>\n<li>Place on ungreased baking sheets. Spritz with cooking spray. Sprinkle with pepper. </li>\n<li>Bake at 400° for 4-6 minutes or until lightly browned.</li>\n<li>Meanwhile, in a small bowl, combine the sour cream, chives, horseradish and salt. Top toasts with beef; dollop with sour cream mixture. Sprinkle with cheese and additional chives.</li>\n</ol>\n</div>
567923	Sausage, White Bean and Kale Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Sausage--White-Bean-and-Kale-Soup-567923.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large soup pot heat olive oil over medium heat.  Stir in onions, garlic and crushed red peppers. Cook 2 minutes. Stir in kielbasa. </li>\n<li>Pour in chicken broth bring to a boil and reduce heat to low.Stir in white beans and kale. Cook 20 minutes or until kale is tender. Season to taste with salt and pepper. </li>\n<li>Serve.</li>\n</ol>\n</div>
549495	Pot Roast Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/Pot-Roast-Sandwich-549495.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the beef in a slow cooker and sprinkle with the entire pot roast seasoning packet. </li>\n<li>Add the butter on top, place the lid on and cook on low for 8 hours, flipping over halfway through and dumping the juices over the top to flavor the other side. About 20 minutes before the beef is done, add the butter to a skillet and heat over medium heat until melted. </li>\n<li>Add the onions, turn down to low and let the onions caramelize for about 20 minutes. Once the beef is done, scoop out 3/4 cup of the juices and place in a sauce pan over medium heat. </li>\n<li>Add the water and bring to a boil, whisking to break up any browned bits. In a small bowl combine the cold water and corn starch. </li>\n<li>Add 2 tablespoons of the hot liquid to the cornstarch mixture and then while whisking the drippings, slowly pour in the corn starch. </li>\n<li>Whisk to combine, bring back to a boil and then turn down to a simmer for about 10 minutes or until thickened. </li>\n<li>Cut the hoagie open and butter each side of the bread. </li>\n<li>Heat the oven to broil and lay the bread open so it can get browned. DO NOT WALK AWAY! I know you think you can run to change the laundry but the bread will burn. Talking from experience here. </li>\n<li>Remove the bread from the oven. Using tongs pick up chunks of the meat, it should fall apart, no cutting needed. </li>\n<li>Place on the bread, top with gravy and caramelized onions. Enjoy!</li>\n</ol>\n</div>
572040	Steak Sandwich Stackers	\N	\N	\N	https://spoonacular.com/recipeImages/Steak-Sandwich-Stackers-572040.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350 degrees.  Line 2 cookie sheets with parchment paper.On a lightly floured surface, roll a biscuit into a 5-inch circle.</li>\n<li>Cut 7 - 1-1/2-inch circles and place on the prepared cookie sheets.</li>\n<li>Mix together the Italian seasoning, salt and pepper.  </li>\n<li>Brush olive oil on each circle and sprinkle with the seasoning mixture.</li>\n<li>Bake 13 minutes or until done.Using the 1-1/2 inch circle cutter cut cheese into rounds, slice beef and cut peppers into small pieces.  Once the biscuits are done and cooled stack your sandwiches.  Start with the top biscuit round.  Using the sharp end of the skewer poke through the round and bring it up to the top.  Now add an olive, cheese, pepper, meat, biscuit round, cheese, pepper, meat and the last biscuit round.  TIP:  Hold the skewer straight up, lay the biscuit on the counter and poke down the center NOT through but to the bottom.  Bring down the other ingredients and press together.  This will help it hold together.  This will make 18 appetizers WITHOUT using the scraps of biscuit dough.  If you use the scraps you'll need to adjust the ingredients for extra.</li>\n</ol>\n</div>
39607	Beef And Pinto Bean Pho	\N	\N	\N	https://spoonacular.com/recipeImages/beef_and_pinto_bean_pho-39607.jpg	http://adventurescooking.blogspot.com/2011/02/beef-and-pinto-bean-pho.html
756524	Wisconsin Beef and Cheddar Brats with Beer-Braised Onions	\N	\N	\N	https://spoonacular.com/recipeImages/wisconsin-beef-and-cheddar-brats-with-beer-braised-onions-756524.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Watch how to make this recipe.</li>\n<li>Set up grill for direct cooking over high heat. Oil grill grate when ready to start cooking.</li>\n<li>Place a large skillet on a grill or side burner and add butter. When butter has melted, add onions. Cook until softened, about 10 minutes. </li>\n<li>Add beer and cover; cook an additional 10 minutes.</li>\n<li>Remove cover from skillet and let simmer until most of the liquid has evaporated, about 5 minutes.Turn the heat on the grill down to medium. </li>\n<li>Place brats on oiled grill grates and cook 4 to 5 minutes per side</li>\n\n<li>Serve brats hot on toasted rolls smothered with onions and topped with mustard.INDOOR: In a large skillet over medium heat melt butter add brats and brown 10 minutes, turning them occasionally as they brown. </li>\n<li>Remove the brats and set aside. </li>\n<li>Add the onions and cook for 10 minutes, stirring frequently until softened. </li>\n<li>Pour in the beer and scrape up any brown bits in the bottom of the pan. Return the brats to the pan and cook over medium heat for 15 minutes or until beer has all but evaporated.</li>\n</ol>\n</div>
365597	Curried Mince and Peas	\N	\N	\N	https://spoonacular.com/recipeImages/Curried-Mince-and-Peas-365597.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Fry the onion in a little oil for 5 minutes, then add the chilli and minced beef and cook until the beef is browned.Step 2: </li>\n<li>Add the tikka paste and fry for a further minute before the adding tomatoes and stock.Step 3: Simmer for 15 minutes then add the handful of frozen peas. Simmer until peas cooked through.Step 4: Season and serve with basmati rice.</li>\n</ol>\n</div>
52299	Cantaloupe And Cheese Appetizer Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/cantaloupe_and_cheese_appetizer_recipe-52299.jpg	http://www.phamfatale.com/id_2629/title_Cantaloupe-and-Cheese-Appetizer-Recipe/
521431	Beef, mushrooms and vegetables soup	\N	\N	\N	https://spoonacular.com/recipeImages/Beef--mushrooms-and-vegetables-soup-521431.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking oil in a pot. Throw in the garlic, onion, tomatoes and sliced mushrooms. Sprinkle with salt and pepper. </li>\n<li>Saute until the vegetables soften a bit.</li>\n<li>Pour in the broth. Taste. </li>\n<li>Add more salt and pepper, as needed.</li>\n<li>Add the spinach leaves, diced upo and kalabasa.Bring the contents of the pot to a gentle boil, lower the heat, cover and simmer for about 10 minutes. Taste at this point. Depending on how well-seasoned the broth is, you may need to add more salt and pepper as the vegetables would have soaked up a lot of the salt in the broth.If you are cooking two versions of the soup, meaty and meatless, this is the time to divide the soup into two portions. Ladle into another pot enough soup for the meatless version. Continue cooking the meatless soup until the vegetables are done.To the remaining soup in the original pot, add the sliced beef. Cover the pot once more and continue cooking just until the vegetables are done and the beef is heated through.</li>\n<li>Serve hot.</li>\n</ol>\n</div>
351485	Stuffed Peppers with Beef, Rice, Spinach and Cheese	\N	\N	\N	https://spoonacular.com/recipeImages/stuffed-peppers-with-beef-rice-spinach-and-cheese-351485.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat a griddle or grill pan. Seed chile peppers. </li>\n<li>Drizzle peppers with a little oil and grill over medium high to high heat 3 or 4 minutes on each side, until tender. </li>\n<li>Transfer peppers to a broiler pan or baking sheet, hollow side up.</li>\n<li>Place a small skillet on the stove top and add 1 tablespoon, 1 turn of the pan, olive oil and a crushed clove of garlic. </li>\n<li>Heat over medium flame and add spinach in bunches until it is all wilted and is giving off liquid. Season greens with salt and pepper. </li>\n<li>Remove spinach and drain. Set aside.Preheat broiler to high.Defrost beef and rice in microwave oven. </li>\n<li>Combine 1/2 cup broth and defrosted rice in the skillet you cooked the spinach in and reheat over medium flame. </li>\n<li>Add 1 cup tomato sauce and heat through.Pile spinach and hot beef and tomato rice into peppers, mounding them up in the center of each pepper. Top liberally with grated cheese and melt cheese under broiler 3 to 5 minutes, then serve.</li>\n</ol>\n</div>
511310	Zuppa Toscana	\N	\N	\N	https://spoonacular.com/recipeImages/Zuppa-Toscana-511310.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Pour water into a pot, season water with Beef Better Than Bullion and bring it to a boil. Clean potatoes, slice them into medium size pieces and set a side. Dice onions into tiny pieces. </li>\n<li>Add diced onions to a saucepan, press garlic into cooking onions and saute mixture until onions are tender. </li>\n<li>Add cooked ingredients into boiling water. </li>\n<li>Heat olive oil in a large saucepan over medium-high heat. Crumble sausage into 1-inch pieces and add to saucepan. Cook sausage, stirring occasionally until cooked through. </li>\n<li>Drain sausage onto a plate lined with paper towels, set sausage aside. </li>\n<li>Add whipping cream into water and bring it to a boil. </li>\n<li>Add potatoes and sausage into the cooking ingredients, cook until potatoes are tender. Then add in chopped kale, cover pot with a lid and turn off the heat. </li>\n<li>Serve with parmesan cheese.</li>\n</ol>\n</div>
167251	Beef and Peppers with Cheese Biscuits	\N	\N	\N	https://spoonacular.com/recipeImages/Beef-and-Peppers-with-Cheese-Biscuits-167251.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat oven to 450°F. In medium bowl, stir Bisquick mix, milk and cheese with fork until soft dough forms; beat 20 strokes. </li>\n<li>Place dough on surface generously dusted with Bisquick mix; gently roll in Bisquick mix to coat. Shape into a ball; knead 10 times. </li>\n<li>Roll 1/4 inch thick. </li>\n<li>Cut into 6 biscuits with 3-inch round cookie cutter.</li>\n<li>2</li>\n\n<li>Place biscuits on ungreased cookie sheet. </li>\n<li>Bake 6 to 8 minutes or until golden brown.</li>\n<li>3</li>\n<li>Meanwhile, in 2-quart saucepan, mix soup, beef, bell peppers, garlic-pepper blend and 1 cup of the water. </li>\n<li>Heat to boiling over medium-high heat. Reduce heat to medium-low. In small bowl, stir remaining 1/3 cup water and the flour until mixed; stir into beef mixture. </li>\n<li>Heat to boiling, stirring frequently, until thickened.</li>\n<li>4</li>\n<li>Split biscuits. </li>\n<li>Serve beef mixture over biscuits.</li>\n</ol>\n</div>
511316	Whole Wheat Mushroom Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/Whole-Wheat-Mushroom-Sandwich-511316.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Fry Mushrooms in frying pan with olive oil, until they have crust on outside. Sprinkle with salt and pepper to taste. Grill or fry sausage on high heat until it has little crust. Toast bread. Divide meat evenly among two sandwiches. Top with cheese and mushrooms. Sprinkle some parmesan cheese and add spinach. </li>\n<li>Place it in George Foreman grill for about 1 minute, until cheese will melt little more. Or if you front have grill then just broil in oven for few minutes.</li>\n</ol>\n</div>
28004	Meat, Tomato, And Mozzarella Stuffed Zucchini Cups	\N	\N	\N	https://spoonacular.com/recipeImages/meat_tomato_and_mozzarella_stuffed_zucchini_cups-28004.jpg	http://kalynskitchen.blogspot.com/2009/09/recipe-for-meat-tomato-and-mozzarella.html
472443	Open-Faced Broiled Roast Beef Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/Open-Faced-Broiled-Roast-Beef-Sandwich-472443.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven on broiler setting.</li>\n\n<li>Cut rolls in half, and toast in a bread toaster. </li>\n<li>Place on a baking sheet. </li>\n<li>Spread each half with mayonnaise and mustard. Layer with roast beef, tomato, red onion, Provolone, salt and pepper.</li>\n<li>Broil 3 to 6 inches from heat source for 2 to 4 minutes (keep a constant eye on it) until cheese is bubbly and is beginning to brown.</li>\n<li>Kitchen-Friendly View</li>\n</ol>\n</div>
470452	Beef and Swiss Wrap	\N	\N	\N	https://spoonacular.com/recipeImages/Beef-and-Swiss-Wrap-470452.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the wraps in the microwave on High for 30 seconds.</li>\n<li>On the right side of one wrap (the side that will fold in last), spread 1 tablespoon Neufchatel cheese about 2/3 of the way down that side. Layer half of the romaine, spinach, beef, Swiss cheese, and tomatoes in the center of the wrap, leaving 1/3 of the wrap open at the bottom. Fold that third up over the bottom of your fillings, then fold in the left side and roll toward the right, letting the Neufchatel seal the wrap together. Repeat with the second wrap.</li>\n<li>Kitchen-Friendly View</li>\n</ol>\n</div>
372154	Curried Beef Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/Curried-Beef-Sandwiches-372154.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, combine the mayonnaise, chutney and curry. </li>\n<li>Spread about 1 tablespoon over six slices of bread; layer with beef, lettuce and tomato. Top with remaining bread.</li>\n</ol>\n</div>
603602	Sweet N Simple Mongolian Beef	\N	\N	\N	https://spoonacular.com/recipeImages/Sweet-N-Simple-Mongolian-Beef-603602.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine marinade ingredients in a small bowl and whisk until combined.</li>\n<li>Pour marinade into a zip-lock bag, add beef strips, seal and chill for at least 1 hour (or overnight)</li>\n<li>Combine sauce ingredients in a medium pan over medium heat until brown sugar dissolves</li>\n<li>Meanwhile, whisk together corn starch and water in a small bowl until corn starch dissolves</li>\n<li>Bring sauce to a boil, then reduce heat to medium low and stir in corn starch-water mixture</li>\n<li>Allow sauce to thicken slightly, then remove from heat</li>\n<li>Cook beef strips in a large skillet over medium-high heat for about 5-7 minutes or until fully cooked</li>\n<li>Reduce to medium heat and add up to ½ cup of sauce depending how "saucy" you want the beef</li>\n<li>Stir and cook 1-2 minutes then serve over rice or noodles!</li>\n</ol>\n</div>
200242	Grilled Beef Satay with Asian Lo Mein	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-beef-satay-with-asian-lo-mein-200242.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>For marinade, blend 1/2 cup Dressing, sugar, cilantro and ginger. </li>\n<li>Pour 1/4 cup marinade over steak in large, shallow nonaluminum baking dish or plastic bag; turn to coat. Cover, or close bag, and marinate in refrigerator, turning occasionally, 2 hours. Refrigerate remaining marinade. Meanwhile, blend Peanut Butter, remaining 1/2 cup Dressing, curry and red pepper in small bowl; set aside. </li>\n<li>Remove steak from marinade, discarding marinade. Thread steak on skewers*. Grill steak, turning once and brushing frequently with refrigerated marinade, 2 minutes or until steak is desired doneness. </li>\n<li>Serve with Knorr Asian Sides - Beef Lo Mein, peanut sauce and, if desired, Cucumber Relish**.*If using wooden skewers soak at least 30 minutes in water prior to use. **CUCUMBER RELISH: </li>\n<li>Combine 1 large cucumber, peeled, seeded and diced, 1/3 cup finely chopped red onion, 1/4 cup Wish-Bone Italian Dressing and 1 tablespoon finely chopped fresh cilantro in small bowl; refrigerate.</li>\n</ol>\n</div>
34447	Beef and Broccoli Stir-fry	\N	\N	\N	https://spoonacular.com/recipeImages/beef-and-broccoli-stir-fry-34447.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine beef, garlic, ginger and soy sauce in a bowl and let stand.Wash broccoli thoroughly and cut into florets. Trim and peel stems and cut into 1/4-inch thick slices.</li>\n<li>Heat 1 Tbsp. oil in a large nonstick skillet or wok over high heat, add broccoli florets and stems, then stir-fry for 2 minutes. </li>\n<li>Add 1/2 cup water and stir until water evaporates. </li>\n<li>Transfer broccoli to a plate.</li>\n<li>Add remaining oil to pan, add beef mixture and stir-fry for 3 minutes. Stir together broth and cornstarch, add to meat and stir-fry until sauce is thickened, about 3 minutes longer. </li>\n<li>Add broccoli and bean sprouts, then cook, stirring, until heated through, about 2 minutes.</li>\n</ol>\n</div>
542352	Post-Workout Sweet and Savory Pastrami Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Post-Workout-Sweet-and-Savory-Pastrami-Salad-542352.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Arrange baby spinach in a plate, followed by all the others ingredients.  Prepare the vinaigrette. In a small bowl, combine all ingredients together. </li>\n<li>Drizzle over salad and serve.</li>\n</ol>\n</div>
521924	Beef, mushroom and celery stir fry	\N	\N	\N	https://spoonacular.com/recipeImages/Beef--mushroom-and-celery-stir-fry-521924.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>First, marinate the beef. </li>\n<li>Place the meat in a bowl, pour in the soy sauce, wine, black vinegar, sugar and some pepper. </li>\n<li>Mix. </li>\n<li>Add the cornstarch and mix to coat each piece of meat well.Prepare the vegetables. Peel and slice the onion or shallots. Slice the mushrooms, </li>\n<li>Cut the celery ribs diagonally into one-inch lengths.If you’re not using a non-stick pan, heat the pan before adding the oil to prevent the meat from sticking. Why that is so, I don’t know. But, trust me, it works. So, heat the oil and, when smoking hot, add the beef and stir fry, separating the pieces as you do, just until the meat starts to change color.</li>\n<li>Add the rest of the ingredients and stir fry for two to three minutes or until the vegetables are done but not overcooked. The term tender-crisp has been used to describe this ideal texture of vegetables in a stir fry. It isn’t easy to determine when exactly the vegetables get to that stage but if you’ve been stir frying for a long time, you’d know. And if you practice stir frying enough, you’d find out too.Turn off the heat and adjust the seasonings. </li>\n<li>Transfer the cooked stir fry to a dish and serve hot.</li>\n</ol>\n</div>
648993	Kobe Beef Sliders With Tarragon Aioli and Caramelized Onions	\N	\N	\N	https://spoonacular.com/recipeImages/Kobe-Beef-Sliders-With-Tarragon-Aioli-and-Caramelized-Onions-648993.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Slice onions into  inch slices.</li>\n<li>Heat a wide pan or wide dutch oven to medium-high with olive oil to coat the bottom. </li>\n<li>Add the onions.Turn the pan down to medium. Cook for 20-30 minutes before stirring. Essentially, you want to brown an entire layer of onions before stirring.Next, flip the onions. The objective is to keep even browning and even heat on the onions.Youll need to flip/stir a few times more. You may need to add a couple tablespoons of water to release the fond and avoid burning.Within an hour, your onions should be perfectly browned.To make the Tarragon Aioli, add egg yolks, garlic, vinegar & salt to food processor. Pulse until everything is chopped and the egg is frothy.With the food processor running, slowly add oil, until the mixture is thick.</li>\n<li>Add minced tarragon, and salt & pepper to taste.Burgers:The easiest way is to simply remove the burgers from the box and grill. If you are pan frying them, use a high-heat oil like grape seed or peanut oil. Cook on high for a couple minutes on each side to get a nice sear.Presentation</li>\n\n<li>Cut buns and brush them with clarified butter or olive oil and grill or toast to golden. </li>\n<li>Spread one side of each bun generously with aioli. Then, add the grilled burger and some caramelized onions.</li>\n</ol>\n</div>
425833	Easy Beef and Noodles	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Beef-and-Noodles-425833.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook noodles according to package directions. In a large skillet, saute mushrooms and onion in oil until tender. </li>\n<li>Add the broth, roast beef and pepper. Bring to a boil. Reduce heat; simmer, uncovered, for 10 minutes.</li>\n\n<li>Drain noodles; stir into skillet. Top with sour cream if desired. </li>\n<li>Garnish with parsley.</li>\n</ol>\n</div>
329630	Wisconsin Beef-and-Cheddar Brats	\N	\N	\N	https://spoonacular.com/recipeImages/wisconsin-beef-and-cheddar-brats-329630.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Set up a grill for direct cooking over high heat. Melt the butter in a large skillet on the grill or side burner. </li>\n<li>Add the onions and cook until soft, about 10 minutes, stirring occasionally. </li>\n<li>Add the beer and cover; cook about 10 more minutes. Uncover the skillet and simmer until most of the beer has evaporated, about 5 minutes.Reduce the heat to medium and oil the grates. Grill the brats on the grates 4 to 5 minutes per side. Lightly toast the rolls on the grill. </li>\n<li>Serve the hot brats on the rolls, smothered with the onions and topped with mustard.Photograph by Andrew McCaul</li>\n</ol>\n</div>
389026	Roast Beef Sandwich Roll	\N	\N	\N	https://spoonacular.com/recipeImages/Roast-Beef-Sandwich-Roll-389026.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine loaves of dough and shape into one ball. </li>\n<li>Place in a greased bowl, turning once to grease top. Cover and let rise in a warm place for 90 minutes.</li>\n<li>In a microwave-safe bowl, combine the red pepper, onion, garlic salt and Italian seasoning. Cover and microwave on high for 1 minute or until vegetables are tender.</li>\n<li>Punch dough down. On a lightly floured surface, roll into a 15-in. x 12-in. rectangle. </li>\n<li>Combine the beef, cheese and red pepper mixture; spread over the dough to within 1/2 in of edges. </li>\n<li>Roll up jelly-roll style, starting with a long edge; pinch seams and ends to seal. </li>\n<li>Place seam side down on a lightly greased baking sheet.</li>\n<li>In a small bowl, beat egg white and water; brush over dough. </li>\n<li>Cut a slit with a sharp knife in top of dough. </li>\n<li>Bake at 400° for 30-35 minutes or until golden brown. </li>\n<li>Let stand for 10 minutes before slicing.</li>\n</ol>\n</div>
169974	Beef and Provolone Pinwheels	\N	\N	\N	https://spoonacular.com/recipeImages/Beef-and-Provolone-Pinwheels-169974.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Mix mayonnaise and garlic in small bowl. </li>\n<li>Spread mixture evenly over tortillas.</li>\n<li>2</li>\n<li>Top tortillas with layers of spinach, beef, cheese and tomato; roll up tightly. </li>\n<li>Cut each tortilla into 12 pieces; secure with toothpicks. </li>\n<li>Serve immediately, or refrigerate until serving.</li>\n</ol>\n</div>
565258	Japanese Beef Rice Curry	\N	\N	\N	https://spoonacular.com/recipeImages/Japanese-Beef-Rice-Curry-565258.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Japanese Curry</li>\n<li>Grease casserole with oil. When the oil is heated, brown beef cubes in batches, taking care not to overcrowd the meat in the casserole. When the beef browns on one side, turn over with kitchen tongs to brown on the other side. Repeat until all the beef cubes are browned (adding more oil if needed). Do not discard the brown bits or juices collected in the casserole.</li>\n<li>Add another tbsp oil to the casserole. Then add onions and ‘sweat’ them on medium low heat until they turn soft and translucent.</li>\n<li>Add water and bring to a simmer. </li>\n<li>Add the previously browned beef and simmer for about 2 hours, or until they are soft and tender. Top up with more water whenever the water level runs low due to evaporation.</li>\n<li>Add carrots and potatoes and simmer for another 30 minutes.</li>\n<li>Add the instant Japanese curry cubes and stir through until they are dissolved. Adjust the consistency of the curry (simmer for a few more minutes if too watery; add water if the curry is too thick). Season to taste if necessary (example salt, dashi, soy sauce, fish sauce or chilli powder; I usually do not add further seasonings as the instant curry sauce is already nicely seasoned).Rice</li>\n<li>Wash rice until the water is clear. </li>\n<li>Drain the rice and add to rice cooker with 1 1/2 cups water. Cook in rice cooker.Serving</li>\n<li>Scoop rice to occupy half of the serving plate and ladle curry over the other half of the plate. </li>\n<li>Garnish with spring onions and pickled ginger.</li>\n</ol>\n</div>
600076	Jamaican soup – beef and pumpkin flavor this soup. Be adventurous and try soup from the carribean	\N	\N	\N	https://spoonacular.com/recipeImages/Jamaican-soup--beef-and-pumpkin-flavor-this-soup--Be-adventurous-and-try-soup-from-the-carribean-600076.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine the beef, pumpkin, and water in a large stockpot. Bring to a boil. Reduce to a simmer, and cook until pumpkin has dissolved and beef is tender, about 1 1/2 hours.Meanwhile, prepare the spinners: In a medium bowl, sift together the flour and salt. </li>\n<li>Add the water, and blend with a wooden spoon until a ball forms. Flour hands, and knead slightly to form a soft dough. </li>\n<li>Add more flour if dough is too sticky. Cover, and set aside.When meat is tender, remove it from pot. </li>\n<li>Remove meat from bones, chop it, and return to the pot. Bring to a brisk simmer over medium heat and add scallions, garlic, Scotch bonnet pepper, thyme, salt, pepper, yam, and carrot.Return to a simmer. Form spinners by rolling small pieces of dough between floured palms to form 1-inch-long oblongs. Drop into soup one at a time. Stir gently to prevent them from sticking to bottom. Simmer for 15 minutes. </li>\n<li>Remove Scotch bonnet before serving.Thanks to dmcbean for this Jamaican Soup recipe.</li>\n</ol>\n</div>
362508	Beef Tripe and Hominy Stew: Posole	\N	\N	\N	https://spoonacular.com/recipeImages/beef-tripe-and-hominy-stew-posole-362508.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Season tripe with salt and pepper and add to a large stockpot. Cover with water and bring to a gentle boil. Reduce heat to low and simmer for about 3 hours, skimming any impurities from the surface</li>\n<li>While tripe is cooking cover the chiles with water in a separate small saucepot and boil until re-hydrated and soft. Cool and strain, reserving the cooking liquid. </li>\n<li>Heat one tablespoon of the grapeseed oil over medium heat in a skillet (reserving the rest of the oil). When the oil begins to shimmer, saute onion and garlic until the onions become translucent. </li>\n<li>Remove from heat and transfer onions and garlic to a small bowl and reserve the skillet. </li>\n<li>Remove the stems and seeds from the chiles and add to the bowl with the onions. Using the cooking liquid as needed (reserving the rest of the cooking liquid), mash into a paste with the onions and garlic. Using the same skillet heat the reserved tablespoon of grapeseed oil over medium-high heat and fry the paste for a few minutes. </li>\n<li>Remove from heat and set aside until needed.Prepare the hominy as directed on the package, utilizing the remaining chile cooking liquid as part of the cooking liquid for the hominy. (Usually you will need 4 times as much water as hominy). </li>\n<li>Mix the chile paste well with the cooked hominy. Stir into the pot of tripe, season with chili powder and return to a simmer and allow to thicken. Ladle into bowls and place small amount of sliced radishes in the center. Squeeze fresh lime juice over.</li>\n</ol>\n<div class="subRecipeInstructionTitle">CATEGORIES:</div>\n<ol>\n<li>Beef</li>\n<li>Dinner</li>\n<li>Stew</li>\n<li>View All</li>\n<li>Main Ingredient</li>\n<li>Beef</li>\n<li>Course</li>\n<li>Dinner</li>\n<li>Main Dish</li>\n<li>Dish</li>\n<li>Stew</li>\n<li>Technique</li>\n<li>Simmer</li>\n<li>Cuisine</li>\n<li>Mexican</li>\n<li>Who's Dining</li>\n<li>For A Crowd</li>\n<li>Season</li>\n<li>Winter</li>\n</ol>\n</div>
632891	Asian Style Meatballs	\N	\N	\N	https://spoonacular.com/recipeImages/Asian-Style-Meatballs-632891.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Oven at 375 degrees.</li>\n<li>Add the beef, panko, sesame oil, garlic powder, ginger, egg, scallion and water to a bowl. </li>\n<li>Mix to combine.Form into approx 1-1 1/2 inch balls. </li>\n<li>Place on a parchment lined baking sheet. </li>\n<li>Bake for about 15-18 minutes until lightly golden.</li>\n<li>Add all the ingredients for the sauce to a small saucepan over medium low heat. Stir to combine and cook until warmed through.Toss the cooked meatballs in the sauce. </li>\n<li>Garnish with scallions.</li>\n</ol>\n</div>
438431	Italian Roast Beef Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/Italian-Roast-Beef-Sandwiches-438431.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large bowl, combine the cheese, salad dressing and pepper. </li>\n<li>Add salad greens; toss to coat.</li>\n\n<li>Place salad green mixture over roll bottoms. Layer with roast beef, tomato, cucumber and olives; replace tops. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
37032	Orange Beef Pasta	\N	\N	\N	https://spoonacular.com/recipeImages/orange-beef-pasta-37032.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Prepare pasta according to package directions. </li>\n<li>Heat oil in a Dutch oven over medium-high heat. </li>\n<li>Add carrots and snow peas, and stir-fry 4 to 5 minutes or until crisp-tender. Stir in beef broth and next 3 ingredients. Bring to a boil. </li>\n<li>Remove from heat; add Greek-Style Beef and hot cooked pasta; toss well to combine. </li>\n<li>Serve immediately with desired toppings.</li>\n</ol>\n</div>
401627	Double-Cheese Beef Panini	\N	\N	\N	https://spoonacular.com/recipeImages/Double-Cheese-Beef-Panini-401627.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, combine the mayonnaise, blue cheese, horseradish and pepper; set aside. In a large skillet, saute onion in oil until tender.</li>\n\n<li>Spread mayonnaise mixture over one side of each slice of bread. On four slices, layer one piece of cheese, two slices of roast beef, sauteed onion and another piece of cheese; top with remaining bread.</li>\n\n<li>Spread butter over both sides of sandwiches. Cook on a panini maker or indoor grill for 2-3 minutes or until bread is browned and cheese is melted.</li>\n</ol>\n</div>
775115	Grilled Asian Tofu and Grape Kebabs	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-asian-tofu-and-grape-kebabs-775115.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat your grill to high.In a medium bowl, whisk together the jalapeno, soy sauce, sugar and ginger. </li>\n<li>Add the tofu and stir to coat.Thread the tofu and grapes, alternating, onto 4 skewers.Grill for 2 to 4 minutes or until heated through.Divide the rice among 4 bowls, top with skewers and sprinkle with cilantro.</li>\n</ol>\n</div>
569577	Cheesesteak Subs – Quick and Tasty	\N	\N	\N	https://spoonacular.com/recipeImages/Cheesesteak-Subs--Quick-and-Tasty-569577.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the broiler in your oven and adjust a rack to the upper-middle position. Meanwhile, in a large skillet, melt the butter, </li>\n<li>Add the onion and cook until softened and golden, about 8 minutes. Stir in the garlic and oregano and cook for a minute, until it smells fragrant. </li>\n<li>Add the A-1 sauce and the beef, stirring well to coat the beef with the sauce and onion/butter mixture. Cook until the meat is heated through, about 2 minutes. Season with salt and pepper.</li>\n<li>Place the sliced rolls on a rimmed baking sheet. Divide the beef mixture among the rolls. Top with the cheese and broil until the cheese is melted, about 2 minutes (don’t even take your hand off the oven door handle – stand right there so they don’t burn!). </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
137565	Manicotti (Beef or Turkey)	\N	\N	\N	https://spoonacular.com/recipeImages/manicotti-2-137565.jpg	http://www.food.com/recipe/manicotti-beef-or-turkey-82451
174454	Beef, Bacon and Blues Wrap	\N	\N	\N	https://spoonacular.com/recipeImages/Beef--Bacon-and-Blues-Wrap-174454.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Let cracker breads come to room temperature as directed on package. Meanwhile, mix cream cheese, blue cheese, milk, bacon, chives and pepper.</li>\n<li>2</li>\n\n<li>Spread half of cream cheese mixture evenly over 1 cracker bread. Layer half of roast beef, salad greens and tomatoes (in that order) on cracker bread, leaving 4 inches at one side covered only with cream cheese mixture. Beginning at side covered with fillings, roll up tightly. Repeat with remaining cracker bread, cream cheese mixture and fillings.</li>\n<li>3</li>\n<li>For uniform-size slices, cut ends without fillings from each roll (about 1 inch from each end). </li>\n<li>Cut remaining portion of each roll into 5 slices. </li>\n<li>Serve immediately, or wrap securely with plastic wrap and refrigerate no longer than 24 hours.</li>\n</ol>\n</div>
403903	Steak Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/Steak-Sandwich-403903.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large skillet, saute the onion and peppers in 2 tablespoons of mayonnaise until crisp-tender. </li>\n<li>Remove vegetables and keep warm.</li>\n<li>In the same skillet, add the roast beef, Italian dressing and remaining mayonnaise. Cook and stir for 4-5 minutes or until heated through. </li>\n<li>Place beef and vegetables on rolls; sprinkle with mozzarella cheese.</li>\n</ol>\n</div>
145925	Savory Beef and Onion Stew (Hachée)	\N	\N	\N	https://spoonacular.com/recipeImages/savory-beef-and-onion-stew-2-145925.jpg	http://www.food.com/recipe/savory-beef-and-onion-stew-hach-e-305037
215564	Italian meatloaf	\N	\N	\N	https://spoonacular.com/recipeImages/Italian-meatloaf-215564.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oven to 190C/170C fan/gas  Linethe long sides and base of a 2lb loaf tinwith double thickness baking parchment.</li>\n<li>Mix 2 tbsp each of the breadcrumbs and</li>\n<li>Parmesan in a small bowl and set aside.Tip all the remaining ingredients into alarge bowl with a good shake of saltand pepper and mix well – hands arethe best for this job.Press the mixture into the loaf tin andsprinkle with the reserved crumb mix.</li>\n<li>Bake for 40-45 mins until the top isgolden and crunchy. If the top does notcolour in the oven, pop the tin under thegrill and brown the top for 5 mins. Cool inthe tin for 5 mins, then lift out using theparchment and put on a board. Slice andserve with potatoes and green beans.</li>\n</ol>\n</div>
168489	Bagels and Beer Cream Cheese	\N	\N	\N	https://spoonacular.com/recipeImages/Bagels-and-Beer-Cream-Cheese-168489.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In medium microwavable bowl, microwave cream cheese on High 30 to 60 seconds until softened. </li>\n<li>Add beer, sour cream, green onion, garlic powder and 1/4 teaspoon salt; stir until well blended. Season with pepper and additional salt, if desired. Cover tightly; refrigerate at least 20 minutes.</li>\n<li>2</li>\n\n<li>Spread cream cheese on bagels; serve open-face with roast beef and red onion.</li>\n</ol>\n</div>
197217	Beef, Broccoli Rabe and Provolone Panini	\N	\N	\N	https://spoonacular.com/recipeImages/beef-broccoli-rabe-and-provolone-panini-197217.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat a panini press or griddle. Bring a large pot of water to a boil. </li>\n<li>Add the broccoli rabe and cook until bright green, about 3 minutes. </li>\n<li>Drain well.In a large skillet, heat the 1/4 cup of oil. </li>\n<li>Add the minced garlic, anchovy paste and crushed red pepper and cook over moderately high heat for 10 seconds. </li>\n<li>Add the broccoli rabe and season with salt. Cover and cook over moderately high heat, stirring occasionally, until the broccoli rabe is tender, about 5 minutes.Layer 2 slices of provolone on the bottom of each roll. Top with the broccoli rabe, roast beef, Peppadews and the remaining provolone. Close the rolls and brush lightly with oil. Grill the sandwiches until toasted and the cheese is melted, about 7 minutes. </li>\n<li>Serve hot.</li>\n</ol>\n</div>
617102	15-Minute BBQ Beef Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/15-Minute-BBQ-Beef-Sandwiches-617102.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large pan, saut onion in butter until tender and starting to turn golden.</li>\n<li>Add barbecue sauce, chili sauce, lemon juice, brown sugar and worcerstershire sauce. Stir to combine and bring to a simmer.</li>\n<li>Add beef to the pan and stir until coated and heated through.</li>\n<li>Serve on favorite rolls or buns. Cheese would be great on these too!</li>\n</ol>\n</div>
402106	Italian Style Meat Roll	\N	\N	\N	https://spoonacular.com/recipeImages/Italian-Style-Meat-Roll-402106.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Process bread in a blender or food processor until fine crumbs form; transfer to a bowl. In same blender, combine the egg, water, onion, celery, Italian seasoning, salt and pepper; cover and process until smooth. Stir into the bread crumbs. Crumble beef over mixture and mix well.</li>\n<li>On a 16-in. x 12-in. piece of waxed paper, shape meat mixture into an 11-in. x 8-in. rectangle. Top with the dried beef and cheese to within 1/2 in. of edge. </li>\n<li>Roll up jelly-roll style,starting with a short side; pinch to seal edges.</li>\n\n<li>Place seam side down in a greased 11-in. x 7-in. baking dish. </li>\n<li>Bake, uncovered, at 350° for 1-1/4 to 1-1/2 hours or until a meat thermometer reads 160°. </li>\n<li>Let stand for 10 minutes before serving.</li>\n</ol>\n</div>
629502	Beet and Pomegranate Kaleidoscope Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Beet-and-Pomegranate-Kaleidoscope-Salad-629502.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Slice beef into thin strips. Season with salt and pepper and saute over high heat until browned and cooked through. </li>\n<li>Remove from heat and set aside to cool.</li>\n<li>Place all of the prepared ingredients into a large salad bowl, keeping the ingredients separate until ready to serve.Just before serving, stir together all ingredients except the potato sticks then stir mayo into the salad to taste. Finally, toss in the potato sticks and stir lightly.</li>\n</ol>\n</div>
568153	Shredded Beef Sandwiches with Sriracha Mayo	\N	\N	\N	https://spoonacular.com/recipeImages/Shredded-Beef-Sandwiches-with-Sriracha-Mayo-568153.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Whisk together mayonnaise, rice vinegar, sriracha, salt and pepper. (Note: Mayo will be thin , but should be spreadable. If it appears too thin add a little more mayo.) Chill for 30 minutes. Preheat oven broiler.</li>\n<li>Heat olive oil in a pan over medium heat. Cook garlic, peppers and onions until slightly softened, 3-5 minutes.Stir in shredded beef. Cook until warmed through. About 3 minutes.Toast bread under broiler just until browned.For each sandwich, pile meat mixture on bottom half of bun. </li>\n<li>Spread sriracha mayo on top of bun, place on top of meat mixture. </li>\n<li>Serve</li>\n</ol>\n</div>
88073	Delicious and Simple Baked Salmon With &quot;fancy&quot; Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/delicious-and-simple-baked-salmon-with-quot-fancy-quot-sauce-2-88073.jpg	http://www.food.com/recipe/delicious-and-simple-baked-salmon-with-fancy-sauce-327390
88243	Orange-Glazed Salmon Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/orange-glazed-salmon-recipe-2-88243.png	http://www.tasteofhome.com/Recipes/Orange-Glazed-Salmon-2
88278	Smoked Salmon and Basil Rolls with Crème Fraîche	\N	\N	\N	https://spoonacular.com/recipeImages/smoked-salmon-and-basil-rolls-with-cr-egrave-me-fra-icirc-che-2-88278.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place 1 salmon slice on work surface. </li>\n<li>Spread 2 teaspoons crème fraîche over salmon. Sprinkle with 2 teaspoons chopped basil. Sprinkle with pepper. Starting at 1 short end, roll up salmon slice, enclosing filling. </li>\n<li>Spread 1 teaspoon crème fraîche over top of roll; sprinkle with 1 teaspoon chopped basil. </li>\n<li>Cut roll crosswise into 5 slices (keep sliced roll together). Repeat with remaining salmon, crème fraîche, and chopped basil. (Can be made 6 hours ahead. </li>\n<li>Transfer salmon rolls to plate; cover and chill.) Arrange basil leaves on platter. Using small spatula, top each basil leaf with 1 sliced salmon roll, fanning slightly.</li>\n</ol>\n</div>
88362	Grilled Salmon Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-salmon-sandwich-2-88362.png	http://www.marthastewart.com/317202/grilled-salmon-sandwich
522581	Salmon with Mustard and Brown Sugar Glaze	\N	\N	\N	https://spoonacular.com/recipeImages/Salmon-with-Mustard-and-Brown-Sugar-Glaze-522581.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350°F.    Boil wine, butter, and Old Bay seasoning in small saucepan 3 minutes.    Sprinkle salmon on both sides with salt and pepper. </li>\n<li>Place fish on heavy rimmed baking sheet. </li>\n<li>Pour wine mixture over.    </li>\n<li>Bake until fish is opaque in center, about 8-10 minutes. </li>\n<li>Remove from oven.    Preheat broiler. </li>\n<li>Mix mustard and sugar in small bowl to blend; spread over salmon to cover. Broil salmon until topping is brown and bubbling, about 3 minutes.    </li>\n<li>Transfer salmon to platter and serve.</li>\n</ol>\n</div>
629215	Broiled Salmon with Avocado and Grapefruit	\N	\N	\N	https://spoonacular.com/recipeImages/Broiled-Salmon-with-Avocado-and-Grapefruit-629215.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Turn the oven to broil.</li>\n<li>Place the salmon skin side down on a greased baking pan and drizzle olive oil over the top. Sprinkle the top with salt and then with chili powder. </li>\n<li>Place on the middle rack and broil for 6 minutes or until salmon is flaky.</li>\n<li>Remove and top with grapefruit and avocado.</li>\n</ol>\n</div>
196	Salmon With Anchovy Olive Tapenade	\N	\N	\N	https://spoonacular.com/recipeImages/Salmon-With-Anchovy-Olive-Tapenade-196.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse salmon fillets, place in a 7 x 11 inch baking dish and drizzle with lemon juice</li>\n<li>In a food processor, place anchovies, rosemary, olives, garlic and olive oil; pulse until mixture turns into a coarse paste</li>\n\n<li>Spread paste over fillets and marinate 2- 6 hours; if short on time, skip marinating time</li>\n\n<li>Bake at 350 for 15-20 minutes</li>\n\n<li>Serve</li>\n</ol>\n</div>
598233	Cream Cheese, Fig, and Walnut Spread with Smoked Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Cream-Cheese--Fig--and-Walnut-Spread-with-Smoked-Salmon-598233.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Finely chop the figs in a food processor. </li>\n<li>Add the cream cheese and process until combined. </li>\n<li>Add the salmon, walnuts, and salt; pulse just to blend. </li>\n<li>Scrape into a bowl. </li>\n<li>Add the scallions, if desired. </li>\n<li>Serve the spread on crisped endive leaves, celery boats, crackers, apple or pear slices, or toast, or use it as a sandwich spread.</li>\n</ol>\n</div>
629492	Smoked Salmon Sushi and SushiQuik Review	\N	\N	\N	https://spoonacular.com/recipeImages/Smoked-Salmon-Sushi-and-SushiQuik-Review-629492.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>For the sushi rice: </li>\n<li>Place 1 cup sushi rice in a fine mesh strainer and rinse well (until the water runs clear. </li>\n<li>Drain well, then place the rice in a medium pot with a tight fitting lid. </li>\n<li>Add 1 cup cold water, bring to a boil, reduce heat to low, cover and cook for 20 minutes. </li>\n<li>Remove from the heat, let stand, covered, for 10 minutes. </li>\n<li>Mix together  cup seasoned rice vinegar and 1 teaspoon sugar until the sugar is dissolved, stir mixture into the rice. Cover the rice with a damp paper towel until ready to use.</li>\n<li>Place the nori on the Sushi</li>\n<li>Quik or other rolling mat with the shiny side down, cover evenly with a thin layer of prepared sushi rice, leaving a  inch piece gap at the top of the nori without rice. . If you prefer the rice on the outside of the sushi roll, carefully flip the rice covered nori sheet over. </li>\n<li>Place a line of smoked salmon strips a quarter of the way away from you, then top with a line of sliced avocado and sprinkle with sliced scallion. Wet the uncovered end of the nori with a water from your fingertip. Lift the sushi mat at the end closest to you and begin to roll, pressing down slightly and pulling out on the mat when it reaches the rice. Continue to roll, pressing down slightly, until you have a round, sealed roll. </li>\n<li>Remove to a cutting board, and slice with a sharp, damp knife, rinsing the knife every few slices.</li>\n<li>Serve cold with soy sauce, prepared wasabi, and thin slices of ginger. Use within 24 hours of preparation. Keep refrigerated until ready to serve.</li>\n</ol>\n</div>
367482	Island Spiced Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Island-Spiced-Salmon-367482.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, combine the first five ingredients; mix well. Rub over flesh side of fillet; refrigerate for 30 minutes. </li>\n<li>Place skin side down in a 13-in. x 9-in. baking dish coated with cooking spray. </li>\n<li>Bake at 375° for 20-25 minutes or until fish flakes easily with a fork.</li>\n</ol>\n</div>
162735	Broiled Salmon with Orange-Mustard Glaze	\N	\N	\N	https://spoonacular.com/recipeImages/Broiled-Salmon-with-Orange-Mustard-Glaze-162735.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Set oven control to broil. Spray broiler pan rack with cooking spray. </li>\n<li>Place salmon, skin side down, on rack in broiler pan. Broil with tops 4 inches from heat 10 to 15 minutes or until fish flakes easily with fork.</li>\n<li>2</li>\n<li>Meanwhile, in small bowl, mix remaining ingredients. </li>\n<li>Spread on salmon during last 5 minutes of broiling.</li>\n</ol>\n</div>
654435	Pan Seared Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Pan-Seared-Salmon-654435.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a bowl combine 1 tbsp olive oil, salt, pepper, garlic, lemon jiuce and dill and add salmon fillets. </li>\n<li>Let them marinate for 15 minutes at room temperature.Preheat a large skillet on medium heat for 2 minutes. </li>\n<li>Add 1 tsp olive oil and then add salmon. Cook for 5 minutes per side. Salmon should be done, when it flakes easily with a fork.</li>\n<li>Transfer to plates. </li>\n<li>Serve with lemon wedges.</li>\n</ol>\n</div>
7665	Salmon And Tuna Nigiri	\N	\N	\N	https://spoonacular.com/recipeImages/salmon-and-tuna-nigiri-2-7665.jpg	http://www.donalskehan.com/2011/03/salmon-and-tuna-nigiri/
499271	Pan-Seared Lemongrass Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Pan-Seared-Lemongrass-Salmon-499271.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
589379	Persian Cucumber Bites with Lox + Dill Cream Cheese	\N	\N	\N	https://spoonacular.com/recipeImages/Persian-Cucumber-Bites-with-Lox-+-Dill-Cream-Cheese-589379.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Clean cucumbers, trim ends and evenly cut into ¾" rounds.</li>\n<li>Cut the smoked salmon into evenly sized pieces so that they will fit on top of the cucumber rounds. </li>\n<li>Place the cucumber rounds on a serving tray and top with the salmon pieces. Use up all the salmon. I put about two pieces per cucumber round.</li>\n<li>Combine the cream cheese, dill leaves, salt and pepper in the body of a food processor or blender. Process until well combined and softened.Use a piping bag (I used Wilton Tip #to evenly distribute the Dill Cream Cheese onto the rounds. (See NOTES if you do not have a piping bag).Finish by placing a small sprig of fresh dill on top of each round and refrigerate until ready to use. </li>\n<li>Serve and Enjoy!</li>\n</ol>\n</div>
212768	Mediterranean salmon fillet	\N	\N	\N	https://spoonacular.com/recipeImages/Mediterranean-salmon-fillet-212768.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oven to 200C/fan 180C/gas  Lay the salmon on a board and, using an apple corer, make 18 holes in rows of hree in the salmon fillet, just going down to the skin, but not cutting all the way through. Take a piece of sun-dried tomato and an olive and, using a basil leaf as a wrapper, roll up into a tight little parcel. Each parcel should be just big enough to plug into one of the holes.As you roll each parcel, stuff them into the holes until they are all filled.</li>\n<li>Place the salmon fillet on a piece of greased foil on a baking tray, then season with salt and pepper and drizzle with the olive oil. Roast in the oven for 20 mins until just cooked. </li>\n<li>Remove from the oven and leave to cool until just warm, then carefully lift the salmon onto a serving dish and serve, or leave to cool completely (see Gordon’s tips, below).</li>\n</ol>\n</div>
589863	Japanese Style Glazed Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Japanese-Style-Glazed-Salmon-589863.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine glaze ingredients in a bowl and stir until brown sugar is completely dissolved.Rinse and pat dry salmon fillets. </li>\n<li>Place salmon fillets in glaze and marinate for a few minutes, and then flip over and marinate for a couple more minutes.</li>\n<li>Heat oil in a large saute-pan over high heat. Season salmon fillets with salt and pepper (remember glaze will have a bit of saltiness from soy sauce as well). Sear salmon in hot pan, turning once, until browned but barely cooked through, about 3 minutes each side.While salmon cooks, place glaze in a small saucepan. Bring to a simmer over high heat. Vigorously simmer for 5 minutes.Plate salmon and brush or pour glaze over salmon.</li>\n</ol>\n</div>
213402	Michael Symon's Grilled Salmon and Zucchini Salad	\N	\N	\N	https://spoonacular.com/recipeImages/michael-symons-grilled-salmon-and-zucchini-salad-213402.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat grill or grill pan to high heat. </li>\n<li>Drizzle fillets with 1 tablespoon oil. Sprinkle fillets evenly with 3/8 teaspoon salt and 1/4 teaspoon pepper. Arrange fillets on grill rack or grill pan; grill 5 minutes or until desired degree of doneness, turning once. Grate lemon rind to equal 1 1/2 teaspoons; squeeze juice to equal 2 tablespoons. </li>\n<li>Combine rind, juice, remaining 2 tablespoons oil, remaining 3/8 teaspoon salt, remaining 1/4 teaspoon pepper, zucchini, and dill in a bowl; toss gently to coat. </li>\n<li>Place 1 fillet on each of 4 plates. Top each serving with about 2/3 cup salad; sprinkle each serving with 1 tablespoon almonds.</li>\n</ol>\n</div>
557565	Vodka and Clementine Glazed Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Vodka-and-Clementine-Glazed-Salmon-557565.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Set the oven to broil</li>\n<li>Rub the salmon with olive oil and sprinkle with salt and pepper.  </li>\n<li>Place skin side down in a roasting pan just big enough to fit it.   Lay the clementine slices over the fish.In a small saucepan, bring the juice, vodka, brown sugar and soy sauce to a boil.  Cook for about 5 minutes or until reduced by half.</li>\n<li>Pour the sauce over the fish and clementines</li>\n<li>Broil the fish for about 15 minutes, or until the fish is done to your liking.  You may need to flip the clementine slices once to prevent them from burning.</li>\n<li>Garnish with sprigs of fresh dill, and scoop any pan drippings over the fish before serving.</li>\n</ol>\n</div>
524925	Crock Pot Salmon Fillets and Asian Style Vegetables	\N	\N	\N	https://spoonacular.com/recipeImages/Crock-Pot-Salmon-Fillets-and-Asian-Style-Vegetables-524925.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>I used my 1-1/2-Quart crock pot.Dump the frozen vegetables in the slow cooker.Season the salmon with salt and pepper to taste.</li>\n<li>Place salmon on top of the vegetables.</li>\n<li>Mix together the soy sauce, honey and lemon juice and drizzle over the salmon.</li>\n<li>Drizzle with sesame seeds, if using.Cover and cook on LOW 2 to 3 hours, until the salmon is done to your liking. I'm a huge salmon lover, so like it on the just barely done side and cooked mine about 2-1/2 hours.</li>\n<li>Serve with brown rice, if desired.</li>\n<li>Drizzle everything with the sauce from the slow cooker.</li>\n</ol>\n</div>
214240	Pan-fried salmon with watercress, polenta croutons & capers	\N	\N	\N	https://spoonacular.com/recipeImages/Pan-fried-salmon-with-watercress--polenta-croutons---capers-214240.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the polenta into approximately 5cmcubes, toss in flour and fry in a little oiluntil slightly coloured. Keep warm.</li>\n<li>Heat oven to 190C/170C fan/gas </li>\n<li>Heat the remaining oil in a non-stick panand fry the salmon portions for 1 min oneach side until lightly golden, thentransfer to a non-stick baking tray andcook in the oven for 8-10 mins. Test thefish to see if it is cooked by pushing acocktail stick into the top of it. If the fishoffers resistance, then it is not fullycooked and will need further cooking.When cooked, remove from the ovenand set to one side.Dress the watercress with a little oliveoil and a few drops of lemon juice.Scatter the polenta croutons and capersover each salmon fillet and serve withthe watercress.</li>\n</ol>\n</div>
591129	Pecan Crusted Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Pecan-Crusted-Salmon-591129.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350°F (180°C).In a small bowl, combine pecans, parsley, garlic and lemon zest with olive oil.Season the salmon filets liberally with salt and pepper.</li>\n<li>Spread the topping evenly over the salmon filets.</li>\n<li>Bake salmon on a parchment lined baking sheet for 20 minutes or until fish is fully cooked.</li>\n</ol>\n</div>
304491	Gaufrette Potatoes with Gravlax, Sour Cream and Osetra Caviar	\N	\N	\N	https://spoonacular.com/recipeImages/gaufrette-potatoes-with-gravlax-sour-cream-and-osetra-caviar-304491.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>To make the gaufrette potatoes, adjust the mandoline so that the ridged blade is exposed by about 1/8 of an inch. </li>\n<li>Remove the potato from the water and pat dry with a paper towel. Hold the potato at an angle of 45 degrees, and run the potato over the ridged blade of the mandoline. (The first slice will not be usable, so discard it.) Turn the potato sideways 45 degrees in the opposite direction, this will make your first waffle-cut potato slice. Repeat the process, turning the potato after each pass over the blade to maintain the waffle-cut. </li>\n<li>Place the potato slices in cold water to keep them from oxidizing.    </li>\n<li>Heat the oil to 350 degrees F in a 1-gallon pot. Working in batches, add the potato slices a few at a time to the hot oil. Turn occasionally to ensure even browning, and cook until golden brown and crispy, about 3 to 4 minutes. Using a slotted spoon or strainer, remove the chips from the oil and place on a paper-lined plate and sprinkle with the salt.    To assemble the dish, cut the gravlax slices into small 1 to 2-inch length pieces and arrange 1 piece of gravlax on top of each potato chip. Top each chip with a small dollop of sour cream, and place 1/4 teaspoon or more of caviar on top of the sour cream. </li>\n<li>Garnish with a small sprig of fresh dill, and serve.</li>\n</ol>\n</div>
550306	Salmon Baked in Cream with Sweet Bay, Thyme and Dill; The Nourished Kitchen and a Giveaway	\N	\N	\N	https://spoonacular.com/recipeImages/Salmon-Baked-in-Cream-with-Sweet-Bay--Thyme-and-Dill--The-Nourished-Kitchen-and-a-Giveaway-550306.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 400°F.</li>\n<li>Place the salmon fillets in a single layer in a small baking dish or gratin dish. Top each fillet with a bay leaf. </li>\n<li>Pour the heavy cream over the salmon and sprinkle with the thyme and dill. </li>\n<li>Bake until the fish flakes easily when pierced with a fork and the cream thickens, about 15 minutes.Discard the bay leaves and serve, spooning warm cream and herbs over the fish.Reprinted with permission from The Nourished Kitchen written and photographed by Jennifer McGruther (Ten Speed Press, © .</li>\n</ol>\n</div>
370181	Banana Pancake Snowmen	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Pancake-Snowmen-370181.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, stir the pancake mix, water and banana just until moistened.</li>\n\n<li>Pour 1/4 cup batter onto a greased hot griddle, making three circles to form a snowman. Turn when bubbles form on top. Cook until the second side is golden brown. </li>\n<li>Transfer to a serving plate. Repeat with remaining batter.</li>\n<li>Sprinkle with confectioners' sugar. Decorate snowmen with pretzels, chocolate chips, cranberries and/or banana if desired.</li>\n</ol>\n</div>
157206	Roast Salmon and Broccoli with Chile-Caper Vinaigrette	\N	\N	\N	https://spoonacular.com/recipeImages/roast-salmon-and-broccoli-with-chile-caper-vinaigrette-157206.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 400°F. Toss broccoli and2 tablespoons oil on a large rimmed baking sheet;season with salt and pepper. Roast broccoli,tossing occasionally, until crisp-tender,12–15 minutes.</li>\n<li>Rub salmon with 1 tablespoon oil; season withsalt and pepper. Push broccoli to edges ofbaking sheet and place salmon in the center.Roast until salmon is opaque throughoutand broccoli is tender, 10–15 minutes.</li>\n<li>Meanwhile, combine jalapeño, vinegar,and a pinch of salt in small bowl and let situntil jalapeño is slightly softened, about10 minutes. </li>\n<li>Mix in capers and remaining1 tablespoon oil; season with salt and pepper.</li>\n\n<li>Serve salmon and broccoli drizzled withchile-caper vinaigrette.</li>\n<li>Per serving: 410 calories, 25 g fat, 5 g fiber</li>\n<li>Nutritional analysis provided by</li>\n<li>Bon Appétit</li>\n</ol>\n</div>
1593	Salmon with Andouille Sausage and Green Olives	\N	\N	\N	https://spoonacular.com/recipeImages/salmon-with-andouille-sausage-and-green-olives-1593.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat a small skillet over high heat. </li>\n<li>Add the andouille and cook, stirring, until sizzling, about 1 minute. </li>\n<li>Transfer to a medium bowl and let cool to room temperature. </li>\n<li>Mix the sausage with the sliced olives, softened butter and minced shallot.</li>\n<li>Light a grill. Rub the salmon fillets all over with olive oil and season lightly with salt and pepper. Grill the salmon over high heat, turning once, until nicely charred and just cooked through, about 3 minutes per side. </li>\n<li>Transfer the salmon to plates, top with the buttered andouille mixture and serve immediately.</li>\n</ol>\n</div>
247371	Baked Salmon with Avocado Mango Salsa	\N	\N	\N	https://spoonacular.com/recipeImages/Baked-Salmon-with-Avocado-Mango-Salsa-247371.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1 Preheat oven to 400°F. While the oven is preheating, prep the mangos.  Either peel and then cut away the mango flesh from the core seed, and then cut the mango into 1/3-inch cubes, or follow the instructions here on How to </li>\n<li>Cut a Mango. Set the cut mango aside in a medium bowl. 2 Line a roasting pan with aluminum foil. </li>\n<li>Spread some olive oil on top of the foil. Coat the salmon fillets with olive oil and lay, skin side down, on the foil lined roasting pan.  Sprinkle with salt. </li>\n<li>Place in the 400°F oven and cook for 10 minutes.3 While the salmon is cooking, prep the other ingredients. </li>\n<li>Cut the avocados in half. </li>\n<li>Remove the seeds. Score the inside of the avocados with a small knife in a cross hatch pattern. Scoop out the avocado pieces and add them to the bowl with the cut mango pieces. (See How to </li>\n<li>Cut and Peel and Avocado.) </li>\n<li>Add the minced red onion, serrano chile, and lime juice to the bowl. Sprinkle with a little salt. Gently fold the ingredients together.</li>\n<li>Serve the salmon fillets with a generous portion of avocado mango salsa.</li>\n</ol>\n</div>
624219	Parmesan Garlic Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Parmesan-Garlic-Salmon-624219.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat Oven to 170C.</li>\n<li>Mix the butter, Parmesan cheese, grated garlic, lemon juice, pepper and salt in a bowl to make a paste.</li>\n<li>Cut a piece of foil large enough for the Salmon. </li>\n<li>Place the salmon on the foil paper.</li>\n<li>Spread the paste on top of the salmon.</li>\n<li>Cut another piece of foil paper large enough to cover the salmon and fold up the sides. </li>\n<li>Place it on a baking tray and bake for about 30min.</li>\n</ol>\n</div>
575123	Real Men Cook: Porto-BOOM Panini	\N	\N	\N	https://spoonacular.com/recipeImages/Real-Men-Cook--Porto-BOOM-Panini-575123.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat grill to medium high heat. Season both sides of portobello mushrooms with olive oil, salt, and pepper.Grill mushrooms for 8-10 minutes per side. (will have slight grill marks)Bring Mushrooms in to cool, once cool, slice mushrooms into 1" slices. Set aside to use for assembly.</li>\n<li>Cut mini ciabatta's in half. Put 1 T. of pesto on one side and 1 oz. of crumbled goat cheese on the other side.Arrange 3 slices of portobello on the goat cheese side along with ½ cup of grilled vegetables.</li>\n<li>Place the pesto side on top of the grilled vegetable side and place on panini press. (or on a grill pan)Cook panini for about 4-5 minutes. (cheese will be gooey and you will have a nice crust on your bread) Slice in half and eat! :)</li>\n</ol>\n</div>
83652	Pancetta Salmon Kebabs with Parsley Vinaigrette	\N	\N	\N	https://spoonacular.com/recipeImages/pancetta-salmon-kebabs-with-parsley-vinaigrette-83652.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine 1/4 cup oil, the vinegar, garlic, salt, and 1/4 tsp. pepper in a bowl. Set aside. </li>\n<li>Heat grill to high (450 to . In a large bowl, combine remaining tbsp. oil with remaining 1/4 tsp. pepper. Turn salmon in oil to coat. Set out rows of 3 salmon chunks on a work surface. Unroll pancetta slices into strips and wrap strips once or twice around salmon, weaving long pieces between chunks. Skewer each row of salmon with chunks slightly separated. Oil cooking grate, using tongs and a wad of oiled paper towels. Set kebabs on grate, then grill, covered, turning once, until fish is barely cooked through, 4 minutes. Arrange kebabs on plates. Stir parsley into dressing; spoon on top of kebabs. </li>\n<li>Serve with warm, crusty bread for dunking.Note: Nutritional analysis is per serving.</li>\n</ol>\n</div>
599862	Quick and Easy Salmon Patties	\N	\N	\N	https://spoonacular.com/recipeImages/Quick-and-Easy-Salmon-Patties-599862.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Drain salmon, set aside 2 tablespoons of the juice. In a mixing bowl mix together the salmon, egg, and onion until sticky. Stir in flour. </li>\n<li>Add baking powder to the salmon juice, and stir this into the salmon mixture. Form into patties and fry in Crisco until golden brown.</li>\n</ol>\n</div>
174694	Raspberry-Banana Yogurt Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Raspberry-Banana-Yogurt-Salad-174694.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In small bowl, pour boiling water over gelatin; stir until gelatin is dissolved. Stir in yogurt; gently stir in raspberries and banana. </li>\n<li>Pour into two 6-ounce custard cups.</li>\n<li>2</li>\n<li>Refrigerate about 2 hours or until set.</li>\n</ol>\n</div>
559309	Penne with Cream and Smoked Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Penne-with-Cream-and-Smoked-Salmon-559309.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook the pasta in a saucepan with salted boiling water according to the instructions on the package.Meanwhile, slice the smoked salmon or chop it up into thin strips. Strip the leaves from the thyme sprigs.Melt the butter in a large saucepan. Stir in the cream with about a quarter of the salmon and thyme leaves, then season with pepper. </li>\n<li>Heat gently for 3 to 4 minutes, stirring all the time. Do not allow to boil. Taste the sauce for seasoning.</li>\n<li>Drain the pasta and toss it in the cream and salmon sauce. Divide among four warmed bowls and top with the remaining salmon and thyme leaves. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
739543	Corny Mango Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/corny-mango-salmon-739543.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small saucepan over high heat, bring mango nectar and mango to a boil. As mango begins to break down, press down on it with a fork or potato masher, to mash it. Continue cooking until mango cooks down to form a chunky puree, about 15 minutes. </li>\n<li>Remove half to serve as a sauce. Set the other half aside for dredging.On a large plate, mix together flour, cornmeal, sugar and salt.Preheat a large skillet. Season salmon with salt and freshly ground black pepper. </li>\n<li>Brush glaze over top of salmon, then dredge in cornmeal mixture. </li>\n<li>Add oil and butter to skillet. Over high heat, sear salmon cornmeal mixture face down until golden, about 6 to 8 minutes for medium rare, flipping halfway through to crisp skin.</li>\n</ol>\n</div>
149766	Sweet and Spicy Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/sweet-and-spicy-salmon-149766	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place chiles and water in a skillet and simmer until soft, about 2 minutes. </li>\n<li>Add sesame oil and garlic; cook until fragrant, 1 to 2 minutes. Stir in blueberries, apple cider vinegar, sugar and salt. Bring to a boil and cook, mashing berries with a wooden spoon until a thick sauce forms, 5 minutes. </li>\n<li>Remove from heat. Divide sauce over salmon fillets.</li>\n<li>Per serving: 319 calories, 4 g, fat 9 g saturated, 5 g carbohydrates, 5 g fiber, 3 g protein</li>\n<li>Nutritional analysis provided by</li>\n<li>Self</li>\n</ol>\n</div>
379151	Roasted Salmon & White Bean Spinach Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Salmon---White-Bean-Spinach-Salad-379151.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place salmon on a greased 15-in. x 10-in. x 1-in. baking pan; sprinkle with salt and pepper. </li>\n<li>Bake at 400° for 11-13 minutes or until fish flakes easily with a fork. Cool slightly.</li>\n<li>Meanwhile, in a large bowl, toss beans with vinaigrette; set aside.</li>\n<li>Just before serving, add spinach and onion to bean mixture; toss to combine. Divide among four plates. Top with salmon.</li>\n</ol>\n</div>
493889	Salmon Baked In Cream With Sweet Bay, Thyme And Dill	\N	\N	\N	https://spoonacular.com/recipeImages/Salmon-Baked-In-Cream-With-Sweet-Bay--Thyme-And-Dill-493889.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 400°F.</li>\n<li>Place the salmon fillets in a single layer in a small baking dish or gratin dish.Top each fillet with a bay leaf.</li>\n<li>Pour the heavy cream over the salmon and sprinkle with the thyme and dill.</li>\n<li>Bake until the fish flakes easily when pierced with a fork and the cream thickens, about 15 minutes.Discard the bay leaves and serve, spooning warm cream and herbs over the fish.Find more salmon recipes on Food Republic:Citrus-Poached Salmon With Dijon Mustard Sauce Recipe</li>\n<li>Cedar-Plank Sockeye Salmon With Hazelnut Vinaigrette Recipe</li>\n<li>Proscuitto-Wrapped Salmon Recipe</li>\n</ol>\n</div>
494005	Grilled Asian Salmon Packets	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-Asian-Salmon-Packets-494005.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place each salmon fillet on a double thickness of heavy-duty foil (about 12 in. square). </li>\n<li>Combine sugar snap peas and peppers; spoon over salmon. </li>\n<li>Drizzle with salad dressing. Fold foil around mixture and seal tightly.</li>\n<li>Grill, covered, over medium heat for 15-20 minutes or until fish flakes easily with a fork. Open foil carefully to allow steam to escape.</li>\n</ol>\n</div>
551687	Sweet-n-Smoky Salmon with Ginger Mahogany Rice	\N	\N	\N	https://spoonacular.com/recipeImages/Sweet-n-Smoky-Salmon-with-Ginger-Mahogany-Rice-551687.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the salmon in bowl, or large zip bag with soy sauce, liquid smoke and brown sugar. </li>\n<li>Let it marinate for at least 1 hour—but you could marinate over night! When ready to use, preheat the grill or an iron skillet to high heat.In a medium sauce pan, over high heat, toast the rice in 1 Tb. of oil for 2 minutes. Then add the chicken stock and a large pinch of salt and pepper. Bring to a boil. Lower the heat to a simmer and cover. Simmer the rice for about 40 minutes—or as directed on the package.Meanwhile, peel the ginger and cut into thin strips. (julienne) </li>\n<li>Heat a small skillet over medium-high. </li>\n<li>Add 1 Tb. of oil to the skillet. When the oil is hot, drop the ginger in and pan-fry for 1-2 minutes, moving with a spatula, until they are light brown.</li>\n<li>Remove from the pan and drain on a paper towel. Sprinkle with salt.While the rice is cooking, CAREFULLY brush the grill with vegetable oil. (You could also use grill spray.) Pepper the salmon and place it on the grill, top-side-down. Cook 3 minutes.Flip, then carefully sprinkle the tops with a little extra brown sugar and grill for another 3-5 minutes—until just cooked through.Cover with foil and let them rest for 5-10 minutes before serving.</li>\n</ol>\n</div>
19307	Grilled Salmon and Spinach Salad with Peach Dressing	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-salmon-and-spinach-salad-with-peach-dressing-19307.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine first 5 ingredients in a shallow bowl.Rub salmon with brown sugar mixture. </li>\n<li>Place fillets, skin-side down, on grill rack coated with cooking spray. Grill over medium-high heat (350 to 12 minutes or until desired degree of doneness. </li>\n<li>Remove skin and discard.Toss spinach with 1/3 cup Peach Dressing. Arrange spinach on individual serving plates, top with salmon, and drizzle with remaining dressing.</li>\n</ol>\n</div>
658483	Roasted Alaskan Salmon with Cherries	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Alaskan-Salmon-with-Cherries-658483.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 350F.In a large bowl, toss together cherries, lemon juice, honey and thyme. Arrange salmon skin-side down on a large parchment or foil-lined baking sheet, sprinkle with a pinch of sea salt and black pepper. Scatter cherry mixture over and around salmon and bake 12-15 minutes. Switch oven to broil and cook an additional 3 minutes until salmon is just cooked through and cherries are juicy and caramelized, (you want the thickest part of the fish to reach an internal temperature of 131 degrees F on an instant-read thermometer). </li>\n<li>Remove the salmon from the oven and allow to rest, uncovered, for 5 minutes.</li>\n</ol>\n</div>
35967	Seared Salmon On Rice With Brazilian Vinaigrette	\N	\N	\N	https://spoonacular.com/recipeImages/seared-salmon-on-rice-with-brazilian-vinaigrette-2-35967.jpg	http://www.marthastewart.com/316441/seared-salmon-on-rice-with-brazilian-vin
576717	Parmesan Pecan Crusted Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Parmesan-Pecan-Crusted-Salmon-576717.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 425 degrees F.In a small bowl mix together the pecans, parmesan cheese, basil, salt and pepper.  Set aside.</li>\n<li>Place the melted butter in a medium sized bowl and coat each piece of salmon with the butter, then dredge in the parmesan pecan mixture.  </li>\n<li>Place on a baking sheet.  </li>\n<li>Bake for 12-15 minutes or until fish flakes easily with a fork.</li>\n</ol>\n</div>
593095	Parmesan-Baked Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Parmesan-Baked-Salmon-593095.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 400 degrees F. Line a baking sheet with foil.Leave skin on the salmon and cut into four equal portions. </li>\n<li>Place salmon on baking prepared baking sheet, skin side down.In a small bowl, whisk together mayonnaise, cayenne, and Parmesan cheese.Squeeze lemon juice evenly over salmon fillets. </li>\n<li>Spread ¼ of mayonnaise mixture over each filet. Top each filet with crushed crackers to form a crust.</li>\n<li>Bake for 12 to 15 minutes, until salmon is med well to well done and crackers are golden brown.Carefully slide a spatula between the skin and meat of the salmon. The skin will stick to the foil, and the meat will slide off for plating. You’ll be left with skin stuck on the foil; wad up the foil and toss. Easy cleaning.</li>\n</ol>\n</div>
290093	Napa Valley Wine Planked Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/napa-valley-wine-planked-salmon-290093.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large zip-top bag, combine salmon, Champagne vinaigrette, and mustard. Squeeze out air and seal bag. Gently massage bag so that everything is thoroughly combined. Marinate in refrigerator for 30 minutes.Set up grill for direct cooking over medium-high heat. </li>\n<li>Remove salmon from marinade and discard marinade. </li>\n<li>Place on wine-soaked plank, season with salt and pepper and coverwith herbs. </li>\n<li>Place planked salmon on grill. Cover grill and cook for 8 to 12 minutes or until done. </li>\n<li>Remove from grill and serve hot.INDOOR: Marinate and prepare salmon as directed. Preheat oven to 450 degrees F. </li>\n<li>Remove salmon fillets from marinade and place on a baking sheet lined with foil. Season with salt and pepper and cover with herbs. Roast for 8 to 10 minutes, remove from oven and let stand tented with foil for 5 minutes. </li>\n<li>Serve hot.</li>\n</ol>\n</div>
265542	Parmesan Baked Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Parmesan-Baked-Salmon-265542.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>HEAT oven to 400Â°F. MIX mayo, cheese and pepper until well blended. PLACE fish in shallow foil-lined pan; drizzle with lemon juice.  Cover with mayo mixture and cracker crumbs. BAKE 12 to 15 min. or until fish flakes easily with fork.</li>\n</ol>\n</div>
85405	Salmon and Leeks Baked in Parchment	\N	\N	\N	https://spoonacular.com/recipeImages/salmon-and-leeks-baked-in-parchment-2-85405.png	http://www.marthastewart.com/318725/salmon-and-leeks-baked-in-parchment
85442	Grilled Salmon and Asparagus With Balsamic Butter	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-salmon-and-asparagus-with-balsamic-butter-2-85442.jpg	http://www.food.com/recipe/grilled-salmon-and-asparagus-with-balsamic-butter-385534
683484	Pan Seared Salmon with Sage Brown Butter Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Pan-Seared-Salmon-with-Sage-Brown-Butter-Sauce-683484.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring a large skillet to medium high heat.Pat the salmon dry and season the flesh side of the salmon using 1 teaspoon of sea salt.</li>\n<li>Add the olive oil to the hot skillet and immediately add the salmon to the pan flesh side down. </li>\n<li>Saute the salmon for 4-5 minutes until browned.Gently flip the salmon to saute on the skin side for another 4-6 minutes. (it may take longer depending on thickness of your salmon. </li>\n<li>Remove from pan and let sit to cool.In the meantime, bring a small skillet to medium heat.</li>\n<li>Add butter and  teaspoon of sea salt to the pan and melt.Once the butter is melted, add the honey, sage, and nutmeg. Stir and let the butter begin to brown, for about 5 minutes. Be sure to stir throughout cooking process so the butter does not burn. </li>\n<li>Remove from heat.</li>\n<li>Serve salmon with drizzle of sage brown butter sauce. (i used about 1 tablespoon for each salmon filet)</li>\n</ol>\n</div>
85491	Salmon with Honey and Mustard Glaze	\N	\N	\N	https://spoonacular.com/recipeImages/salmon-with-honey-and-mustard-glaze-2-85491.jpg	http://www.food.com/recipe/salmon-with-honey-and-mustard-glaze-67742
85505	Cajun Blackened Salmon With Pureed Peas and Door Stop Fries	\N	\N	\N	https://spoonacular.com/recipeImages/cajun-blackened-salmon-with-pureed-peas-and-door-stop-fries-2-85505.jpg	http://www.food.com/recipe/cajun-blackened-salmon-with-pureed-peas-and-door-stop-fries-269619
85512	Salmon With Lemon and Dill	\N	\N	\N	https://spoonacular.com/recipeImages/salmon-with-lemon-and-dill-2-85512.png	http://www.food.com/recipe/salmon-with-lemon-and-dill-199260
85541	Cedar Plank Salmon With Ginger Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/cedar-plank-salmon-with-ginger-sauce-2-85541.jpg	http://www.food.com/recipe/cedar-plank-salmon-with-ginger-sauce-227727
125571	Solar Cooked Hawaiian Kalua Pork	\N	\N	\N	https://spoonacular.com/recipeImages/solar_cooked_hawaiian_kalua_pork-125571.jpg	http://www.food.com/recipe/solar-cooked-hawaiian-kalua-pork-383145
125597	Kids Favorite Honey Baked Bananas	\N	\N	\N	https://spoonacular.com/recipeImages/kids-favorite-honey-baked-bananas-2-125597.jpg	http://www.food.com/recipe/kids-favorite-honey-baked-bananas-293155
667231	Baked Salmon with Garlic and Dijon	\N	\N	\N	https://spoonacular.com/recipeImages/Baked-Salmon-with-Garlic-and-Dijon-667231.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, mix together: 2 Tbsp chopped parsley, 2-3 pressed cloves garlic,  Tbsp Dijon mustard,  tsp salt,  tsp of pepper,  cup of olive oil and 2 Tbsp of lemon juice.Slice salmon into even portions. Lay them onto a lined baking dish with the skin-side-down.Generously brush all sides of salmon with sauce and top with fresh slices of lemon.</li>\n<li>Bake at 450F for 12-15 min or until just cooked through and flaky. Don't over-cook or it will be dry. There you have it! An easy, excellent dish.</li>\n</ol>\n</div>
487020	Cilantro Lime Salmon Taquitos	\N	\N	\N	https://spoonacular.com/recipeImages/Cilantro-Lime-Salmon-Taquitos-487020.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix the salmon, salsa, cheese and cilantro.Working one at a time, warm the tortillas in a damp paper towel in the microwave for 20 seconds to soften, place 2 tablespoons of the mixture in the centre, roll the tortilla up and pin it closed with a toothpick.</li>\n<li>Heat the oil in a large skillet, working in batches add the rolls and cook until golden brown and crispy on all sides, about 4-6 minutes, and set aside on paper towels.Enjoy while warm with salsa verde, sour cream and guacamole for dipping or make a meal out of it and serve them on a bed of lettuce topped with guacamole, pico de gallo, crumbled queso fresco and hot sauce!</li>\n</ol>\n</div>
593806	Phyllo Wrapped Salmon with Pesto and Cheese	\N	\N	\N	https://spoonacular.com/recipeImages/Phyllo-Wrapped-Salmon-with-Pesto-and-Cheese-593806.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat over to 350 degrees.Gather all of your ingredients and utensils.</li>\n<li>Place 1 sheet of phyllo dough on a work surface.Sprinkle 1 Tablespoon Parmesan cheese over the phyllo dough.</li>\n<li>Place a second sheet of phyllo dough over the first piece and spray lightly with cooking spray.</li>\n<li>Place one salmon fillet about 2 inches from the left hand side of the prepared phyllo dough.Season with salt and pepper.Top with 1 Tablespoon pesto and 1/4 cup of mozzarella cheese.Fold the long sides up over the salmon and then roll up so that the pesto and cheese are on the top (not the bottom.) Tuck extra phyllo dough underneath.Lightly spray the top of the wrap with cooking spray.Repeat for each salmon fillet.</li>\n<li>Bake uncovered for 20 to 25 minutes or until the internal temperature reaches 145 degrees. If the phyllo doughs begins to brown too much, then tent it with aluminum foil.Enjoy!</li>\n</ol>\n</div>
602041	Ginger Cilantro Salmon Cakes	\N	\N	\N	https://spoonacular.com/recipeImages/Ginger-Cilantro-Salmon-Cakes-602041.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add all ingredients except for the lard to a large mixing bowl and combine evenly using your hands.</li>\n<li>Transfer mixture to a food processor and pulse until salmon is broken down somewhat. Do not overdo this or you will have a salmon slurry. You still want your salmon somewhat chunky</li>\n<li>Melt lard in a 12 inch cast iron skillet over medium heat.While skillet is heating, form salmon mixture into patties.Fry salmon patties in cast iron skillet for 3-4 minutes per side.</li>\n<li>Serve with Crispy Salmon Skins and enjoy.</li>\n</ol>\n</div>
610468	Roasted Salmon with Potatoes and Herbed Crème Fraîche	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Salmon-with-Potatoes-and-Herbed-Crme-Frache-610468.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n\n<div class="subRecipeInstructionTitle">Potatoes:</div>\n<ol>\n\n<li>Place potatoes in a medium saucepan and add cold water to cover by 1"; season with salt. Bring to a boil, reduce heat, and simmer until tender, 15-20 minutes; drain and pat dry. </li>\n<li>Let cool slightly, halve potatoes and toss with oil; season with salt.</li>\n</ol>\n<div class="subRecipeInstructionTitle">Salmon and assembly:</div>\n<ol>\n<li>Preheat oven to  </li>\n<li>Place salmon, skin side down, on a parchment-lined rimmed baking sheet; rub with 1 tablespoon oil and season with salt. Roast until medium-rare (mostly opaque but still slightly translucent in the center), 10-15 minutes. Break up salmon into pieces, removing skin if desired.</li>\n\n<li>Whisk crme frache and chopped herbs in a small bowl; season with salt.</li>\n\n<li>Spread herbed crme frache on plates and top with salmon, potatoes, radishes, and tarragon and dill sprigs; drizzle with oil.</li>\n</ol>\n</div>
610524	Cedar-Planked Salmon with Fresh Sorrel Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Cedar-Planked-Salmon-with-Fresh-Sorrel-Sauce-610524.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>About 1 hour before youre ready to fire up the grill, place the cedar planks in a large pan of water to soak.Strip the stems from the sorrel, and discard. Finely chop the leaves into thin strips to make a chiffonade.In the bowl of a food processor, combine the chopped sorrel with the remaining dressing ingredients. Process until smooth. Taste to check for seasoning, and adjust as necessary.Preheat grill to medium-high heat. </li>\n<li>Brush the salmon with olive oil, and sprinkle generously with salt and pepper.Arrange the salmon fillets skin-side down on the soaked planks, spacing them at least 1 apart, and place on the preheated grill. Close the lid and cook for about 10-15 minutes, or until the salmon is opaque and flakes easily with a fork.To serve, place the individual fillets onto plates, and spoon a generous dollop of sauce onto each fillet.</li>\n</ol>\n</div>
176439	Grilled Dilled Salmon and Vegetable Packs	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-Dilled-Salmon-and-Vegetable-Packs-176439.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat gas or charcoal grill. </li>\n<li>Cut salmon fillet into 4 serving pieces.</li>\n<li>2</li>\n<li>In small bowl, mix oil, dill weed, parsley and garlic salt. In heavy-duty foil bag, place salmon, tomatoes, squash and pea pods. </li>\n<li>Brush oil mixture over salmon and vegetables. Double-fold open end of bag.</li>\n<li>3</li>\n\n<li>Place bag on grill. Cover grill; cook over medium heat 15 to 20 minutes or until salmon flakes easily with fork. </li>\n<li>Place bag on serving plate; unfold.</li>\n</ol>\n</div>
125678	Chocolate Soy Banana Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/chocolate-soy-banana-smoothie-2-125678.png	http://www.food.com/recipe/chocolate-soy-banana-smoothie-171064
4519	Broiled Salmon With Spinach-and-feta Saute	\N	\N	\N	https://spoonacular.com/recipeImages/broiled-salmon-with-spinach-and-feta-saute-2-4519.jpg	http://www.marthastewart.com/316859/broiled-salmon-with-spinach-and-feta-sau
504233	Grilled Chicken and Cream Cheese Enchiladas – 5 Ingredients	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-Chicken-and-Cream-Cheese-Enchiladas--5-Ingredients-504233.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the cream cheese into cubes and put it in a microwave safe bowl.  </li>\n<li>Pour about half the salsa over the cream cheese.  Warm in the microwave for a minute or two, just long enough to melt the cream cheese.  Stir and pop back in the microwave if it needs to melt more.</li>\n<li>Add the sliced chicken to the cream cheese and salsa, stirring to combine.  Fill tortillas with the mixture, rolling and placing in a greased 9×13 casserole dish.  </li>\n<li>Pour the rest of the salsa over the top of all the filled tortillas.  Top with cheddar cheese.  </li>\n<li>Bake at 350 for 20-30 minutes or until hot and bubbly.</li>\n</ol>\n</div>
4534	Salmon With Corn And Tomato Relish	\N	\N	\N	https://spoonacular.com/recipeImages/salmon_with_corn_and_tomato_relish-4534.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>This is what I had.  Leftover grilled corn.  Some heirloom tomatoes from my garden and olive oil, balsamic vinegar, salt, and pepper.  I ended up using some fresh basil from my garden also, but it was an afterthought so it did not make its way into the picture.I took the corn of the cob, sliced up the tomatoes, drizzled a little olive oil and vinegar over it and seasoned it with salt and pepper.  Done.  Set it aside.I put the salmon  in a screaming hot pan with a little olive oil and just seasoned with salt and pepper.  I roasted some fingerling potatoes the same way, olive oil, salt and pepper.  I had some rosemary so I threw that into the pan as well.  Steamed some asparagus and dinner was ready.  Right before I served, I added some chopped basil to my corn mixture.</li>\n</ol>\n</div>
4584	Blackened Salmon With Hash Browns and Green Onions	\N	\N	\N	https://spoonacular.com/recipeImages/blackened-salmon-with-hash-browns-and-green-onions-4584.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Remove and discard root ends and 1 inch of top green portions of green onions, and set green onions aside.Toss together hash browns, dill, and salt in a large bowl.</li>\n<li>Heat 2 tablespoons oil in a large nonstick skillet over medium heat. </li>\n<li>Add hash brown mixture in an even layer, and cook 5 minutes or until lightly browned. (Do not stir.) </li>\n<li>Place a lightly greased baking sheet, greased side down, onto skillet; invert hash browns onto baking sheet. </li>\n<li>Place skillet back on heat. Slide hash browns back into skillet, cooked side up, and cook 5 more minutes or until golden brown.Press hash browns down with a spatula to flatten. </li>\n<li>Remove from skillet onto same lightly greased baking sheet, and keep warm in oven at  Sprinkle blackened seasoning evenly over fillets.Cook salmon in 1 tablespoon hot oil in same nonstick skillet over medium heat 4 to 6 minutes on each side or just until fish begins to flake with a fork. </li>\n<li>Remove from pan onto serving plates.Saut green onions in remaining 1 tablespoon hot oil in same nonstick skillet over medium heat 4 minutes or until tender; remove from pan, and serve with salmon and hash browns.Note: For testing purposes only, we used Old Bay Blackened Seasoning. Use a skillet with flared sides so the cooked hash browns slide out of the pan easily.</li>\n</ol>\n</div>
324170	Grapefruit and Honey Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/grapefruit-and-honey-salmon-324170.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Juice 1 grapefruit into a bowl. </li>\n<li>Cut the peel and pith from the other grapefruit. </li>\n<li>Remove the flesh from the membranes with a sharp knife, adding any juice to the juice in the bowl. Reserve the grapefruit segments.Boil the reserved juice, honey and 1/4 teaspoon each salt and pepper in a small saucepan until reduced by half and slightly syrupy, 4 to 6 minutes.Toss the grapefruit segments with the shallots, oil, parsley, 1/2 teaspoon salt and 1/4 teaspoon pepper.Bring a large, straight-sided skillet with 4 cups of well-salted water to a simmer; the water should cover the salmon. </li>\n<li>Add the salmon to the skillet and remove from the heat. </li>\n<li>Let the salmon cook in the hot water until just cooked through, 5 to 7 minutes.</li>\n<li>Transfer the salmon to paper towels and pat dry. </li>\n<li>Place on serving plates. </li>\n<li>Drizzle the salmon with the sauce and top with the grapefruit salad.</li>\n<li>From Food Network Kitchens</li>\n</ol>\n<div class="subRecipeInstructionTitle">CATEGORIES:</div>\n<ol>\n<li>Salmon</li>\n<li>Main Dish</li>\n<li>Poaching</li>\n<li>View All</li>\n<li>Main Ingredient</li>\n<li>Salmon</li>\n<li>Grapefruit</li>\n<li>Course</li>\n<li>Main Dish</li>\n<li>Technique</li>\n<li>Poaching</li>\n</ol>\n</div>
4705	Grilled Wild Salmon with Roasted Beets and Arugula	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-wild-salmon-with-roasted-beets-and-arugula-4705.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Scrub beets thoroughly; remove greens and save for another use. </li>\n<li>Drizzle lightly with olive oil, and place in a roasting pan. </li>\n<li>Bake, covered with foil, at 400 for 30 minutes or until tender. Rub the skins off beets with a towel, and slice.</li>\n<li>Remove any bones from the salmon. </li>\n<li>Brush with olive oil, and season lightly with salt and pepper. Grill salmon over medium-hot coals on both sides until medium rare (translucent in the center). </li>\n<li>Drizzle plates with Balsamic Reduction. Top with beet slices and arugula. </li>\n<li>Cut salmon into serving pieces, and place on plates.</li>\n</ol>\n</div>
4713	Orange-Spiced Salmon with Spaghetti Squash	\N	\N	\N	https://spoonacular.com/recipeImages/orange-spiced-salmon-with-spaghetti-squash-4713.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to </li>\n<li>Combine first 5 ingredients in a bowl. </li>\n<li>Combine 2 tablespoons sugar mixture and squash; toss gently. Arrange squash in an 11 x 7-inch baking dish coated with cooking spray. Arrange salmon on top of squash; brush with mustard. Sprinkle fish with remaining sugar mixture. </li>\n<li>Bake at 450 for 15 minutes or until fish flakes easily when tested with a fork. </li>\n<li>Garnish with parsley sprigs, if desired.</li>\n</ol>\n</div>
4729	Apple and Horseradish-Glazed Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/apple-and-horseradish-glazed-salmon-4729.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to </li>\n<li>Combine apple jelly, chives, horseradish, vinegar, and 1/4 teaspoon salt, stirring well with a whisk.Sprinkle salmon with 1/4 teaspoon salt and pepper. </li>\n<li>Heat oil in a large nonstick skillet over medium heat. </li>\n<li>Add salmon, and cook 3 minutes. Turn salmon over; brush with half of apple mixture. Wrap handle of skillet with foil; bake at 350 for 5 minutes or until fish flakes easily when tested with a fork. </li>\n<li>Brush with remaining apple mixture.</li>\n</ol>\n</div>
4747	Grilled Salmon with Garlic, Lemon, and Basil	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-salmon-with-garlic-lemon-and-basil-4747.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>To prepare sauce, combine first 5 ingredients in a small bowl; set aside.To prepare fish, heat a nonstick grill pan over medium-high heat. Coat pan with cooking spray. Sprinkle fish evenly with salt and pepper; add fish to pan. Cover and grill 4 minutes on each side or until fish flakes easily when tested with a fork or until desired degree of doneness. </li>\n<li>Serve with sauce.</li>\n</ol>\n</div>
86715	Fast Asian Fish	\N	\N	\N	https://spoonacular.com/recipeImages/fast-asian-fish-2-86715.jpg	http://www.food.com/recipe/fast-asian-fish-306248
594615	Baked Salmon with Honey Dijon and Garlic	\N	\N	\N	https://spoonacular.com/recipeImages/Baked-Salmon-with-Honey-Dijon-and-Garlic-594615.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 425 degrees and line a large baking sheet with foil. </li>\n<li>Place salmon pieces on top of the foil and set aside.In a medium bowl, whisk together garlic, parsley, honey Dijon, lemon juice, salt, and olive oil. </li>\n<li>Whisk well until well-combined then using a pastry brush, brush on the sauce onto the salmon pieces.</li>\n<li>Bake uncovered for 15-20 minutes (or depending on how thick your slices of salmon are, you may need to reduce the time by 2-3 minutes or increase it by 2-3 minutes - just keep an eye on it!)</li>\n<li>Serve with your favorite sides (we served it with a side of Israeli couscous).</li>\n</ol>\n</div>
4800	Sweet-n-smoky Salmon With Ginger Mahogany Rice	\N	\N	\N	https://spoonacular.com/recipeImages/sweet-n-smoky_salmon_with_ginger_mahogany_rice-4800.jpg	http://aspicyperspective.com/2010/06/03/less-is-more/
4820	Oven Roasted Salmon With Grapefruit And Basil Relish	\N	\N	\N	https://spoonacular.com/recipeImages/oven-roasted-salmon-with-grapefruit-and-basil-relish-2-4820.jpg	http://www.thebittenword.com/thebittenword/2008/03/post.html
86744	Salmon Burgers with Spinach and Ginger	\N	\N	\N	https://spoonacular.com/recipeImages/salmon-burgers-with-spinach-and-ginger-2-86744.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut salmon into 1/4-inch dice, then stir together with spinach, scallions, ginger, salt, and pepper in a large bowl until well combined.</li>\n<li>Beat together egg white and soy sauce in a small bowl and stir into salmon mixture, then form into 4 (1/2-inch-thick) patties.</li>\n\n<li>Heat a 12-inch nonstick skillet over moderate heat until hot and lightly brush with oil. Cook patties, carefully turning once, until golden brown and cooked through, 6 to 7 minutes total.</li>\n\n<li>Serve each burger topped with 1 1/2 teaspoons pickled ginger.</li>\n</ol>\n<div class="subRecipeInstructionTitle">Cooks' note:</div>\n<ol>\n<li>• Patties can be formed 4 hours ahead and chilled on a wax paper–lined baking sheet, then covered with plastic wrap.</li>\n<li>Each serving contains about 179 calories and 7 grams fat.</li>\n<li>Nutritional analysis provided by</li>\n<li>Gourmet</li>\n</ol>\n</div>
86760	Parmesan Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/parmesan-salmon-2-86760.jpg	http://www.food.com/recipe/parmesan-salmon-74438
4850	Pan-Roasted Salmon with Soy-Ginger Glaze	\N	\N	\N	https://spoonacular.com/recipeImages/pan-roasted-salmon-with-soy-ginger-glaze-4850.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to  In a small saucepan, combine the soy sauce and ginger and bring to a simmer. </li>\n<li>Remove from heat and stir in the honey and mustard.</li>\n\n<li>Heat the olive oil in a large nonstick ovenproof skillet. Season the salmon with pepper and add it to the skillet, skinned side up. Cook over high heat until golden and crusty, 2 to 3 minutes. Turn the salmon and spoon the ginger-soy glaze on top. </li>\n<li>Transfer the skillet to the oven and bake the salmon for 5 minutes, or until cooked through. Using a slotted spatula, transfer the salmon fillets to plates, garnish with the cilantro and serve.</li>\n</ol>\n</div>
4857	Cedar Plank Salmon Fillets	\N	\N	\N	https://spoonacular.com/recipeImages/cedar_plank_salmon_fillets-4857.jpg	http://www.wholefoodsmarket.com/recipes/1611
86809	Cedar Planked Salmon With Sweet Mustard Vinaigrette	\N	\N	\N	https://spoonacular.com/recipeImages/cedar-planked-salmon-with-sweet-mustard-vinaigrette-2-86809.jpg	http://www.food.com/recipe/cedar-planked-salmon-with-sweet-mustard-vinaigrette-322424
86868	Salmon With Lemon Capers and Rosemary	\N	\N	\N	https://spoonacular.com/recipeImages/salmon-with-lemon-capers-and-rosemary-2-86868.jpg	http://www.food.com/recipe/salmon-with-lemon-capers-and-rosemary-173426
86907	Grilled Salmon-and-Asparagus Salad	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-salmon-and-asparagus-salad-86907.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Brush salmon and toss asparagus with olive oil; sprinkle with salt and pepper. Grill salmon over medium-high heat (350 to for 3 to 5 minutes on each side or until desired degree of doneness. Grill asparagus, turning occasionally, 3 to 5 minutes or until tender. Divide arugula evenly among 4 plates; top with flaked salmon, asparagus, and tomatoes. </li>\n<li>Serve with vinaigrette.</li>\n</ol>\n</div>
529156	Caramel Bananas and Doughnuts	\N	\N	\N	https://spoonacular.com/recipeImages/Caramel-Bananas-and-Doughnuts-529156.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Divide doughnuts into four dishes. If using full size doughnuts, crumble into chunks. In a skillet over medium heat, whisk together sugar, vanilla, orange zest, juice and dash of salt (if using) - and bring to a simmer. Allow the mixture to start to caramelize and thicken. </li>\n<li>Add in sliced bananas and toss to coat. Spoon over crumbled doughnuts and serve immediately.</li>\n</ol>\n</div>
529558	Step By Step: Chocolate-Covered Banana & PB Bites (GF and Vegan!)	\N	\N	\N	https://spoonacular.com/recipeImages/Step-By-Step--Chocolate-Covered-Banana---PB-Bites-(GF-and-Vegan)-529558.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut bananas into ½ inch rounds, or smaller.</li>\n<li>Place ½ teaspoon of peanut butter on top of half the rounds and top each one with another banana round (to make little “sandwiches”).</li>\n<li>Place a toothpick in each sandwich and put in the freezer for 10 minutes.</li>\n<li>Heat a small saucepan at low heat and add coconut oil and chocolate chips. Stir constantly until melted into a smooth sauce, transfer to a bowl.Dip a banana ‘sandwich’ into the sauce and twirl to coat one at a time. </li>\n<li>Let air dry for about 10 seconds before setting down, the chocolate will harden very fast.Repeat for all banana bites. </li>\n<li>Place in the freezer for 10 minutes to set.Enjoy!Store in the fridge or freezer.</li>\n</ol>\n</div>
267575	Easy Banana Creme Brulee	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Banana-Creme-Brulee-267575.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>SPREAD wafer pieces onto bottom of shallow 1-1/2-qt. casserole; top with bananas. COOK pudding with 2 cups milk as directed on package; pour over bananas. Refrigerate several hours or until firm. HEAT broiler when ready to serve dessert.  Sprinkle sugar over pudding.  Broil 3 to 5 min. or until sugar is melted and lightly browned.  </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
578977	Paleo Pina Colada: Frosty and Healthy	\N	\N	\N	https://spoonacular.com/recipeImages/Paleo-Pina-Colada--Frosty-and-Healthy-578977.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Buzz everything here together in a blender, helping it along, if needed, by pushing things down (with the blender turned off, of course).If it's still too thick, add up to 1/2 cup of water to get things going.</li>\n</ol>\n</div>
267748	Low-Fat Chocolate-Banana Parfaits	\N	\N	\N	https://spoonacular.com/recipeImages/Low-Fat-Chocolate-Banana-Parfaits-267748.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>BEAT pudding mix and milk with whisk 2 min. SPOON half the pudding evenly into 4 dessert glasses; cover with layers of bananas and half the COOL WHIP. Top with remaining pudding and COOL WHIP. REFRIGERATE 1 hour.</li>\n</ol>\n</div>
759354	Chocolate-Hazelnut Banana Rounds	\N	\N	\N	https://spoonacular.com/recipeImages/chocolate-hazelnut-banana-rounds-759354.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 375°F, and line 1 baking sheet with parchment paper. Sprinkle half of sugar on work surface and place puff pastry on top. Sprinkle remaining sugar over dough and use rolling pin to press in. </li>\n<li>Roll dough to 11-inch square and cut out rounds with 2-inch round cutter. Reroll scraps, and repeat until you have 34 rounds. </li>\n<li>Place rounds on prepared baking sheet. </li>\n<li>Place another piece of parchment on top of rounds, and top with another baking sheet. </li>\n<li>Bake 15 minutes, or until barely golden. </li>\n<li>Remove top baking sheet and parchment. </li>\n<li>Bake 5 minutes more, or until cookies are brown and crisp. Cool. To serve: </li>\n<li>Spread chocolate-hazelnut spread on each round, and top with banana slice.</li>\n</ol>\n</div>
546633	Roasted Banana Peanut Butter “Ice Cream”	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Banana-Peanut-Butter-Ice-Cream-546633.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>(makes 1 quart)Preheat oven to 375F and line a baking sheet with parchment paper.In a bowl, toss sliced bananas with the honey and coconut oil. </li>\n<li>Spread into a single layer on the baking sheet.Roast for 30 minutes.</li>\n<li>Remove from oven, lift the parchment on both sides and pour the bananas and caramelizing liquid into a high speed blender.</li>\n<li>Add the peanut butter and blend until very smooth.</li>\n<li>Pour into a freezer safe container and freeze for at least 2 hours or overnight.***When ready to serve, allow ice cream to sit on the counter to soften a bit and make sure you use an ice cream scoop dipped in hot water to help with the scooping.</li>\n</ol>\n</div>
579424	Jamba Juice Peanut Butter Moo'd Smoothie: Homemade and the Best	\N	\N	\N	https://spoonacular.com/recipeImages/Jamba-Juice-Peanut-Butter-Mood-Smoothie--Homemade-and-the-Best-579424.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Blend the frozen banana, chocolate milk, and cream peanut butter for 30 seconds or until smooth.Use a single serve blending cup if possible. If not, use a mason jar and any standard blender base! Or simply use your normal blender and pitcher, but double the servings.</li>\n</ol>\n</div>
579441	Strawberry Banana Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Strawberry-Banana-Smoothie-579441.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Blend all ingredients until smooth. </li>\n<li>Serve immediately or chill.</li>\n</ol>\n</div>
169959	Chocolate-Peanut Butter-Banana Smoothies	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-Peanut-Butter-Banana-Smoothies-169959.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Cut banana into 1-inch chunks. </li>\n<li>Place banana and remaining ingredients in blender or food processor. Cover; blend on high speed about 30 seconds or until smooth.</li>\n<li>2</li>\n\n<li>Pour into 2 glasses. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
186429	Grilled Pineapple and Bananas with Lemonade Glaze	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-Pineapple-and-Bananas-with-Lemonade-Glaze-186429.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Make a lengthwise slice on the skin of each unpeeled banana chunk to allow easy peeling after bananas are grilled. Thread the fruit onto skewers, alternating chunks of banana and pineapple.</li>\n<li>To make the glaze, put the sugar in a stainless-steel saucepan and cook over medium-high heat until it becomes liquid, about 3 minutes. Stir with a wooden spoon and add the lemon juice and zest. If using cane syrup, simply add the lemon juice with zest and stir, without heating. Set aside.</li>\n<li>Fill a charcoal chimney with hardwood lump charcoal, set the chimney on the bottom grill grate, and light. When the coals are ready, dump them into the bottom of the grill and spread evenly. For a gas grill, turn to medium-high.</li>\n\n<li>Brush the skewered fruits with the glaze. </li>\n<li>Place the skewers over direct heat. Grill 3 minutes on each side, until fruit is browned. </li>\n<li>Remove from grill and brush again with the glaze. </li>\n<li>Serve immediately.</li>\n<li>Excerpt from 25 Essentials: Techniques for Grilling, by Ardie A. Davis, ©  Photographs © 2009 by Joyce Oudkerk Pool. Used by permission of The Harvard Common Press.</li>\n</ol>\n</div>
268380	P. B. & Banana Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/P--B----Banana-Sandwich-268380.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>SPREAD each bread slice with 1 Tbsp. peanut butter. Top 1 of the bread slices with banana slices. Cover with second bread slice. CUT sandwich diagonally in half.</li>\n</ol>\n</div>
650485	Luscious Orange Cardamom Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Luscious-Orange-Cardamom-Smoothie-650485.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Blend all the three ingredients together until smooth and frothy. If sweetener needed, while blending add dates, honey, maple syrup, almond butter or sugar as per taste.</li>\n</ol>\n</div>
219247	Chocolate baked bananas	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-baked-bananas-219247.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oven to 200C/180C fan/gas 6 (ora BBQ). Make a slit through the skin ofthe bananas along one side – makingsure you don’t cut all the way through tothe other side. Poke in the chocolatebuttons along the cut. Put each bananaonto a sheet of foil and crimp the edgestogether to seal into a parcel. </li>\n<li>Transfer toa baking sheet and cook for 25 mins untilthe bananas have turned black (or popstraight into the BBQ embers for 15 mins).</li>\n<li>Serve with a scoop of ice cream andany melted chocolate that has escaped!</li>\n</ol>\n</div>
596192	Kale Green Smoothie with Grapefruit and Bananas	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-Green-Smoothie-with-Grapefruit-and-Bananas-596192.jpg	http://www.wishfulchef.com/kale-green-smoothie-with-grapefruit/
596249	Banana Orange and Curly Parsley Green Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Orange-and-Curly-Parsley-Green-Smoothie-596249.jpg	http://www.wishfulchef.com/orange-banana-green-smoothie/
203161	Chocolate Dipped Frozen Bananas	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-Dipped-Frozen-Bananas-203161.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Slice bananas in half and carefully mount on Popsicle sticks. </li>\n<li>Place bananas on a tray, plate or baking dish in the freezer for 2 hours or until firm. You can freeze up to overnight. Do not cover bananas as this will cause ice crystals to form.</li>\n<li>2</li>\n<li>In a medium bowl whisk together melted chocolate and coconut oil until thoroughly combined. </li>\n<li>Place nuts in a wide, shallow plate or pie plate (if using).</li>\n<li>3</li>\n\n<li>Remove bananas from freezer. If ice crystals have formed on the bananas use a paper towel to gently brush them off. Dip banana in chocolate and swirl to cover. Alternately you can use a spoon to help cover and ensure even chocolate distribution.</li>\n<li>4</li>\n\n<li>Roll bananas in chopped nuts. </li>\n<li>Let cool for 1 minute, Then place on a serving platter. If you don't plan on serving the bananas immediately, return them to the freezer for up to a few hours. If serving from freezer, place on plate and allow to thaw for 10 minutes before serving.</li>\n</ol>\n</div>
580034	Banana Lassi - How to make Banana Lassi - Indian Yogurt Drink	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Lassi---How-to-make-Banana-Lassi---Indian-Yogurt-Drink-580034.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Take the yogurt, chopped bananas, cardamom powder and sugar in a blender.Blend it well until smooth and creamy.</li>\n<li>Add water and blend until well combined.If you want a slightly thin consistency, add little more water to the lassi while blending.</li>\n<li>Pour it into glasses and add ice cubes.You can also chill the lassi in the refrigerator.</li>\n<li>Serve chilled.</li>\n</ol>\n</div>
285205	Grilled Banana Mini-Pies	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-Banana-Mini-Pies-285205.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>HEAT grill to medium heat. ARRANGE banana slices in single layer in centers of 8 sheets of heavy-duty foil sprayed with cooking spray. Top each with 1 Tbsp. cajeta and 1 cookie. BRING up foil sides. Double fold top and both ends to seal each packet, leaving room for heat circulation inside. GRILL 3 to 5 min. or until cajeta is melted.  Top each opened packet with COOL WHIP.</li>\n</ol>\n</div>
72327	Chocolate Frozen Banana Bites	\N	\N	\N	https://spoonacular.com/recipeImages/chocolate-frozen-banana-bites-2-72327.jpg	http://www.kraftrecipes.com/recipes/chocolate-frozen-banana-bites-114519.aspx
482276	Banana Coconut Crunch with “The Perfect Snaque”	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Coconut-Crunch-with-The-Perfect-Snaque-482276.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 425 degrees F.  Lightly grease a baking dish.  An 8×8 square dish or 9-inch pie plate work well.  Feel free to adjust the recipe depending on how many bananas you want to use.  (Keep in mind that the leftovers are fabulous!)Slice the bananas into thick rounds (1/2-3/4-inch) and evenly distribute over the bottom of the baking dish.Sprinkle the brown sugar evenly over the top, and then sprinkle the Snaque mix evenly over all.  If desired, add a light coating of flaked coconut over the top (sweetened or unsweetened, according to preference).</li>\n<li>Bake for 10-15 minutes or until the brown sugar is melted and the bananas are beginning to caramelize but still have a hint of firmness.Enjoy warm, as is, or with a dollop of Greek yogurt.</li>\n</ol>\n</div>
646426	Vegan Peanut Butter Ice Cream	\N	\N	\N	https://spoonacular.com/recipeImages/Healthier--Reeses-Peanut-Butter-Ice-Cream-(Vegan)-646426.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Put slightly thawed banana through a food processor.Stir in peanut butter.</li>\n<li>Place ice cream into freezer.Prepare chocolate shell sauce by combining coconut oil and chocolate chips in microwave safe bowl. Microwave for approximately 1 minute, stirring halfway.</li>\n<li>Pour onto ice cream.</li>\n</ol>\n</div>
269782	Strawberry-Banana Punch	\N	\N	\N	https://spoonacular.com/recipeImages/Strawberry-Banana-Punch-269782.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>BLEND first 4 ingredients in blender until smooth.  </li>\n<li>Pour into large plastic or glass pitcher.  Refrigerate. STIR in club soda just before serving.</li>\n</ol>\n</div>
171590	Easy Cake-Mix Banana Bread	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Cake-Mix-Banana-Bread-171590.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat oven to 350°F. Generously spray 2 (8x4-inch) loaf pans with cooking spray; lightly flour pans.</li>\n<li>2</li>\n<li>Select your favorite banana bread recipe variation from those below.</li>\n<li>3</li>\n<li>In large bowl, beat all ingredients above plus ingredients from selected variation below until well mixed. Divide batter evenly between pans.</li>\n<li>4</li>\n\n<li>Bake 45 to 55 minutes or until toothpick inserted in center of loaves comes out clean and inside of cracks do not look wet. Cool 15 minutes in pans on cooling racks. </li>\n<li>Remove loaves from pans to cooling racks. Cool completely, about 2 hours, to prevent crumbling when slicing. For easier slicing, store loaves tightly covered 24 hours. </li>\n<li>Cut with serrated knife, using a light sawing motion.</li>\n</ol>\n</div>
515692	3 Ingredient strawberry banana smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/3-Ingredient-strawberry-banana-smoothie-515692.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the strawberries, bananas, and milk in a blender. Puree until smooth and creamy.</li>\n</ol>\n</div>
483059	Chocolate Peanut Butter Banana Bites	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-Peanut-Butter-Banana-Bites-483059.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Peel banana and cut into 1/2 inch slices. </li>\n<li>Place on parchment paper on baking sheet and freeze for about an hour. </li>\n<li>Place a small dollop of peanut butter on top of each banana slice. Return to freezer and freeze for another 30 minutes or so.In a microwave-safe bowl, melt chocolate chips and a tiny bit of olive oil. Stir until smooth. Spoon some of the melted chocolate on top of each banana/peanut butter slice. Sprinkle on toppings. Return to freezer to set the chocolate, and keep frozen until ready to eat.</li>\n</ol>\n</div>
483082	Banana-Nutella Egg Rolls	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Nutella-Egg-Rolls-483082.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut banana in half the long way. </li>\n<li>Cut each half in half again, lengthwise.Lay egg roll wrapper on the counter in front of you. </li>\n<li>Spread a bit of Nutella on each wrapper and lay a banana slice on top. (See photo above.) Start rolling from the bottom, fold in the sides when you get to them, and finish rolling until you have an egg roll. Seal the edges with a bit of water.</li>\n<li>Heat a couple tablespoons of vegetable oil in a frying pan over medium-high heat (use enough oil to cover the bottom of the pan.) You'll know when the oil is hot enough when the egg roll wrapper sizzles when you place it in the oil. </li>\n<li>Place egg roll in the pan and cook on one side until golden brown. Turn and heat the other side until golden brown. </li>\n<li>Remove egg roll from pan and place on a plate lined with paper towels. Continue frying each egg roll.To serve, dust egg rolls with powdered sugar. </li>\n<li>Serve warm with extra Nutella for dipping, if desired.</li>\n</ol>\n</div>
155425	Banana Cajeta Cashew Gelato	\N	\N	\N	https://spoonacular.com/recipeImages/banana-cajeta-cashew-gelato-155425.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Make the Plain Baseand chill as directed.</li>\n\n<li>Place the bananas, sugar, and lemon juice in a blender and add half of the base. Blend until smooth, then whisk into the remaining base. </li>\n<li>Pour the mixture into the container of an ice cream machine and churn according to the manufacturer's instructions. </li>\n<li>Add the cashews 5 minutes before the churning is completed.</li>\n<li>Just after churning, drizzle the cajeta over the top and quickly and lightly swirl in a zigzag pattern with a spoon or butter knife.</li>\n<li>Reprinted from the book THE CIAO BELLA BOOK OF GELATO AND SORBETTO by F.W. PEARCE & DANILO ZECCHIN.  Copyright © 2010 by F.W. PEARCE & DANILO ZECCHIN.  Photographs copyright © 2010 by IAIN BAGWELL.  Published by Clarkson Potter, a division of Random House, Inc.</li>\n</ol>\n</div>
597847	Easy Banana Muffins	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Banana-Muffins-597847.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to   Grease one 12 cup muffin pan, or two 24 cup mini muffin pans, or line them with paper muffin cups. </li>\n<li>Combine egg, Bisquick, sugar, mashed bananas and vegetable oil and stir until just combined.  Divide batter evenly among muffin cups. </li>\n<li>Bake 15-20 minutes for large muffins, or 10-12 minutes for mini muffins, until golden brown.  </li>\n<li>Remove from muffin pans and cool...but make sure you eat at least one while they are still warm!</li>\n</ol>\n</div>
515973	Frozen Chocolate-Covered Bananas	\N	\N	\N	https://spoonacular.com/recipeImages/Frozen-Chocolate-Covered-Bananas-515973.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Line a baking sheet with wax paper.Peel the bananas and then slice them in half width-wise. Carefully insert a stick into the bottom of each banana and then place it on the baking sheet. Freeze the bananas for 1 hour.Melt the chocolate chips with the vegetable oil in a deep metal bowl set over a saucepan of barely simmering water, stirring occasionally, until the mixture is smooth. </li>\n<li>Remove the bowl of chocolate and set it aside.</li>\n<li>Remove the bananas from the freezer, and one at a time, dip them in the chocolate, smoothing it over the entirety of the banana with a spoon. Immediately sprinkle the banana with the assorted sprinkles and then lay the banana on the wax paper-lined baking sheet. Repeat the dipping and decorating process with the remaining bananas and then return them to the freezer for 10 minutes, or until the chocolate is firm.</li>\n</ol>\n</div>
630732	Two Ingredient Banana Pancakes (Gluten & Dairy Free)	\N	\N	\N	https://spoonacular.com/recipeImages/Two-Ingredient-Banana-Pancakes-(Gluten---Dairy-Free)-630732.jpg	http://www.fromaway.com/cooking/two-ingredient-banana-pancakes-gluten-dairy-free
483336	Crock Pot Bananas Foster	\N	\N	\N	https://spoonacular.com/recipeImages/Crock-Pot-Bananas-Foster-483336.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Melt margarine in slow cooker by turning cooker on Low.It will take about 10 minutes.</li>\n<li>Mix in brown sugar when margarine or butter is melted.Gently stir in fresh bananas and rum.Cook on Low for 1 hour.Spoon banana mixture over vanilla ice cream and serve</li>\n</ol>\n</div>
549115	Banana Coffee Cake	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Coffee-Cake-549115.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Follow the directions on the back of the box, heating the oven to 350 degrees. </li>\n<li>Mix together the cake, bananas, and egg. </li>\n<li>Place half in a greased 8x8 inch baking dish. Sprinkle 1/2 cup of the crumb topping and then add dolops of the remaining batter on top of the mixture. Use a knife to drag through the batter, swirling the mixture. Top with remaining crumb mixture and bake for 40 minutes. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
762137	Chocolate-Peanut Butter Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/chocolate-peanut-butter-smoothie-762137.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In blender, combine soy milk, banana and peanut butter. Blend until smooth and creamy. With blender running, add ice if using and blend until almost smooth. </li>\n<li>Serve right away.</li>\n</ol>\n</div>
123348	Banana & Grape Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/banana-grape-smoothie-2-123348.jpg	http://www.food.com/recipe/banana-grape-smoothie-166535
565730	Chocolate Chip Banana Bread made with Greek Yogurt	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-Chip-Banana-Bread-made-with-Greek-Yogurt-565730.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350 degrees. Grease a large loaf pan.</li>\n<li>Mix together bananas, egg, greek yogurt, vanilla, and sugar.Gradually stir in the pastry flour, baking powder, and salt. </li>\n<li>Add in the chocolate chips.Evenly pour the batter into the pan about 3/4 full. </li>\n<li>Bake for 45 minutes, or until toothpick comes out clean. Cool completely before removing and cutting.</li>\n</ol>\n</div>
549368	Tucanos Fried Bananas	\N	\N	\N	https://spoonacular.com/recipeImages/Tucanos-Fried-Bananas-549368.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the flour and salt in one bowl, eggs in another and bread crumbs in a third. Cinnamon sugar should go in another bowl if you choose to use it. Peel the bananas and cut it into thirds. </li>\n<li>Roll the banana in the flour, then the egg and finally the bread crumbs. </li>\n<li>Drizzle a little olive oil in a shallow dish and quickly roll the bananas in it. </li>\n<li>Place 4-5 pieces directly into the airfryer basket and push to close. Plug in the airfryer, set the temperature to 355 and the timer to 8 minutes. At 4 minutes take the basket out and give it a little shake to move the bananas. Continue frying and then remove and drop directly into cinnamon sugar or onto a serving plate. Allow to cool for 1 minute and eat!</li>\n</ol>\n</div>
483917	Three-Ingredient Banana Pancakes	\N	\N	\N	https://spoonacular.com/recipeImages/Three-Ingredient-Banana-Pancakes-483917.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a medium bowl, mash bananas well with a fork. </li>\n<li>Add the eggs and the coconut and use a hand whisk to whisk everything together until as smooth as possible.With your fingers, spread a thin layer of coconut oil (about ½ teaspoon) on the bottom of a large, 12-inch skillet. </li>\n<li>Heat over medium heat, about 4 minutes.Measuring ¼-cup per pancake, pour batter onto three spots on the skillet. Fry 3 minutes on the first side or until set and golden, then flip and fry 2 more minutes on the second side.</li>\n<li>Place ½ more teaspoon coconut oil in the skillet, brush to coat, and repeat with 3 more pancakes. </li>\n<li>Serve immediately, with or without berries and warm maple syrup.</li>\n</ol>\n</div>
270968	Frozen Banana Treats	\N	\N	\N	https://spoonacular.com/recipeImages/Frozen-Banana-Treats-270968.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>MELT chocolate as directed on package.  Meanwhile, insert a wooden pop stick into cut end of each banana piece. DIP bananas in chocolate, or brush chocolate onto banana pieces with pastry brush.  </li>\n<li>Roll bananas in cereal, completely coating all sides. FREEZE bananas 4 hours or until firm.  Store in airtight container in freezer.</li>\n</ol>\n</div>
189174	Almond Butter and Finger Bananas on Fruit Bread	\N	\N	\N	https://spoonacular.com/recipeImages/Almond-Butter-and-Finger-Bananas-on-Fruit-Bread-189174.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Spread a thick layer of the almond butter over each bread slice. Top with the banana slices and serve open-faced.</li>\n<li>Suggestions for the kids</li>\n<li>Use smaller slices or remove the crusts, and cut the bananas crosswise, not lengthwise.</li>\n</ol>\n</div>
697097	Blueberry-Banana Smoothie (Batido)	\N	\N	\N	https://spoonacular.com/recipeImages/blueberry-banana-smoothie-batido-697097.jpg	http://www.eatingwell.com/recipes/blueberry_banana_batido.html
582527	Classic Banana Bread {Mom’s }	\N	\N	\N	https://spoonacular.com/recipeImages/Classic-Banana-Bread-{Moms-}-582527.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350 degrees</li>\n\n<li>Combine sugar, oil and eggs in mixing bowl and beat until mixed well</li>\n<li>Blend in baking soda and sour milk</li>\n\n<li>Add flour and salt mix gently and then stir in smashed bananas, mix until well combined</li>\n\n<li>Pour into greased loaf pans, makes two large or four small loaves</li>\n\n<li>Bake at 350 degrees 45 minutes to 1 hour for large loaves, 30-40 minutes for small loaves. Bread is done when toothpick inserted in the middle of the loaf comes out clean.Cool on cooling rack</li>\n</ol>\n</div>
598996	Banana Fritters	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Fritters-598996.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine the bananas, cornmeal, sugar, and salt in a bowl and mash with a fork until smooth. </li>\n<li>Heat 2 1/2 inches of oil in a deep pot to 350°F (175°C). Working in batches, add the banana mixture, a heaping tablespoon at a time, and fry until golden brown, about 2 to 3 minutes, turning once halfway through cooking. </li>\n<li>Remove from the oil with a skimmer or slotted spoon and drain on paper towels. Before serving, drizzle with the honey.</li>\n</ol>\n</div>
484460	Chocolate-Covered Banana Bites	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-Covered-Banana-Bites-484460.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Line a baking sheet or a tray with wax paper. Slice bananas into ½-inch-thick pieces, about 8 pieces per banana.In a small pot over low heat, melt chocolate and coconut oil, stirring constantly. Turn off heat.Using two teaspoons, dip each banana piece into the melted chocolate. Swirl to coat. </li>\n<li>Remove from chocolate, allowing excess to drip back into pot. </li>\n<li>Place on wax paper. Sprinkle dipped banana pieces with coconut.</li>\n<li>Place the chocolate covered banana bites in fridge for about an hour, until chocolate is set, then serve.</li>\n</ol>\n</div>
484554	Healthy, 3 Ingredient Date Shake(Naturally Vegan and Grain/Gluten Free)	\N	\N	\N	https://spoonacular.com/recipeImages/Healthy--3-Ingredient-Date-Shake(Naturally-Vegan-and-Grain-Gluten-Free)-484554.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>If using harder dates, roughly chop, cover with almond milk and let sit 20-30 minutes before blending.</li>\n<li>Place all ingredients in a blender and blend until as smooth as possible(there will still be some small date pieces left).</li>\n<li>Serve immediately.</li>\n</ol>\n</div>
697665	Roasted Mango Sorbet	\N	\N	\N	https://spoonacular.com/recipeImages/roasted-mango-sorbet-697665.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350F. </li>\n<li>Place whole mangoes in a shallow baking pan and roast until very soft, 70 to 90 minutes. Refrigerate until cool, about 1 hour.Meanwhile, combine sugar and water in a small saucepan. Bring to a boil, stirring to dissolve sugar. </li>\n<li>Remove from heat and refrigerate until cold, about 1 hour.When the mangoes are cool enough to handle, remove skin and coarsely chop pulp, discarding pit. </li>\n<li>Place the mango pulp and accumulated juices in a food processor. </li>\n<li>Add banana and lime juice; process until very smooth. </li>\n<li>Transfer to a large bowl and stir in the sugar syrup. Cover and refrigerate until cold, 40 minutes or overnight.Freeze the mixture in an ice cream maker according to manufacturer's directions. (Alternatively, freeze the mixture in a shallow metal pan until solid, about 6 hours. Break into chunks and process in a food processor until smooth.) </li>\n<li>Serve immediately or transfer to a storage container and let harden in the freezer for 1 to 1 1/2 hours. </li>\n<li>Serve in chilled dishes.</li>\n</ol>\n</div>
566721	Banana Yogurt Oatmeal Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Yogurt-Oatmeal-Smoothie-566721.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Put bananas, yogurt, oatmeal and almonds blender. </li>\n<li>Add ice and blend on high until smoothie thickens, about 30 seconds.For chocolate banana smoothie add cocoa and pulse a few times.</li>\n</ol>\n</div>
109385	Broccoli and Tofu Stir-Fry With Toasted Almonds	\N	\N	\N	https://spoonacular.com/recipeImages/broccoli-and-tofu-stir-fry-with-toasted-almonds-2-109385.png	http://www.food.com/recipe/broccoli-and-tofu-stir-fry-with-toasted-almonds-241162
550536	Banana Bread (Grain Free, Gluten Free, Paleo, Primal)	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Bread-(Grain-Free--Gluten-Free--Paleo--Primal)-550536.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350ºF and adjust rack to middle position. </li>\n<li>Place all ingredients in the bowl of a food processor and process until smooth. </li>\n<li>Pour into a buttered loaf pan (I always use a glass loaf pan to ensure even baking). </li>\n<li>Bake for 40-55 minutes until tester inserted in the middle comes out with a few moist crumbs attached. Cool for 10 minutes and then invert bread onto a cooling rack.*To make homemade grain-free baking powder combine 1 part baking soda, 1 part arrowroot powder and 2 parts cream of tartar. Store in an airtight container for up to 6 months.</li>\n</ol>\n</div>
665469	Xocai Healthy Chocolate Peanut Butter Bannana Dip	\N	\N	\N	https://spoonacular.com/recipeImages/Xocai-Healthy-Chocolate-Peanut-Butter-Bannana-Dip-665469.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place Nugget in a custard cup and microwave in 10 seconds increments until melted.Stir in the peanut butter and mix thoroughly. Swirl the banana in the dip.</li>\n</ol>\n</div>
125011	Chocolate Banana Shake	\N	\N	\N	https://spoonacular.com/recipeImages/chocolate-banana-shake-2-125011.jpg	http://www.food.com/recipe/chocolate-banana-shake-50472
485471	Boonanas Halloween Snack	\N	\N	\N	https://spoonacular.com/recipeImages/Boonanas-Halloween-Snack-485471.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Peel the bananas then slice them in half. Try standing them on the cut end and continue trimming until they are able to stand on their own.Press two mini chocolate chips into the banana pointy side first, about 1/2 inch down from the tip.Press one chocolate chip pointy side first into the banana, below the mini chocolate chips.</li>\n<li>Serve standing on a plate, use a little peanut butter to help them stay standing if needed.</li>\n</ol>\n</div>
125033	Aubby Gobby Nana Muffins	\N	\N	\N	https://spoonacular.com/recipeImages/aubby-gobby-nana-muffins-2-125033.jpg	http://www.food.com/recipe/aubby-gobby-nana-muffins-369629
125064	Banana Nut Martini	\N	\N	\N	https://spoonacular.com/recipeImages/banana-nut-martini-2-125064.jpg	http://www.food.com/recipe/banana-nut-martini-271019
125090	Strawberry Banana Colada	\N	\N	\N	https://spoonacular.com/recipeImages/strawberry-banana-colada-2-125090.jpg	http://www.food.com/recipe/strawberry-banana-colada-309117
125175	Banana-Blueberry Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/banana-blueberry-smoothie-2-125175.png	http://www.marthastewart.com/336635/banana-blueberry-smoothie
125234	Berry Banana Pina Colada Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/berry-banana-pina-colada-smoothie-2-125234.jpg	http://www.food.com/recipe/berry-banana-pina-colada-smoothie-321550
485711	Peanut Butter Banana Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Peanut-Butter-Banana-Smoothie-485711.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add all ingredients to blender and blend</li>\n<li>Drink and Enjoy!!</li>\n</ol>\n</div>
125325	Banana and Chocolate Shake	\N	\N	\N	https://spoonacular.com/recipeImages/banana-and-chocolate-shake-2-125325.jpg	http://www.food.com/recipe/banana-and-chocolate-shake-380990
387514	Hawaiian Pork Roast	\N	\N	\N	https://spoonacular.com/recipeImages/Hawaiian-Pork-Roast-387514.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the roast on a 22-in. x 18-in. piece of heavy-duty foil; sprinkle with liquid smoke and soy sauce. Wash bananas and place at the base of each side of roast. Pull sides of foil up round meat; add water. Seal foil tightly; wrap again with another large piece of foil. </li>\n<li>Place in a shallow baking pan; refrigerate overnight, turning several times. </li>\n<li>Place foil-wrapped meat in a roasting pan. </li>\n<li>Bake at 400° for 1 hour. Reduce heat to 325°; continue baking for 3-1/2 hours. </li>\n<li>Drain; discard bananas and liquid. Shred meat with a fork.</li>\n</ol>\n</div>
125384	Chocolate-Hazelnut and Banana Crepe	\N	\N	\N	https://spoonacular.com/recipeImages/chocolate-hazelnut-and-banana-crepe-2-125384.png	http://www.marthastewart.com/335093/chocolate-hazelnut-and-banana-crepe
125436	Vegan Challah	\N	\N	\N	https://spoonacular.com/recipeImages/vegan-challah-2-125436.png	http://www.food.com/recipe/vegan-challah-221339
535045	Skinny Grilled Strawberry Banana Yoplait® Frozen Yogurt Sundaes	\N	\N	\N	https://spoonacular.com/recipeImages/Skinny-Grilled-Strawberry-Banana-Yoplait-Frozen-Yogurt-Sundaes-535045.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat your grill to its medium setting, or prepare charcoals for grilling.Using four skewers, skewer all the bananas and strawberries. Grill for 2-3 minutes per side, until softened. Grill marks are always welcome. </li>\n<li>Remove from the grill and use a fork to push the fruit off the skewers.To serve, divide the Yoplait®  Frozen Yogurt evenly among four dishes and top with grilled strawberries and bananas.</li>\n</ol>\n</div>
535070	Banana & Oat Cookies #BacktoSchoolWeek	\N	\N	\N	https://spoonacular.com/recipeImages/banana-oat-cookies-backtoschoolweek-535070.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350 degrees</li>\n<li>Mash bananas and oats together until well combined</li>\n<li>Stir in chocolate chips</li>\n<li>Drop dough by spoonfuls on a baking sheet</li>\n\n<li>Bake for 13-15 minutes</li>\n<li>Enjoy</li>\n</ol>\n</div>
125483	Banana Pops	\N	\N	\N	https://spoonacular.com/recipeImages/banana-pops-2-125483.jpg	http://www.food.com/recipe/banana-pops-134135
60185	Banoffee Pie	\N	\N	\N	https://spoonacular.com/recipeImages/banoffee-pie-2-60185.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Put oven rack in middle position and preheat oven to 425°F.</li>\n\n<li>Pour condensed milk into pie plate and stir in a generous pinch of salt. Cover pie plate with foil and crimp foil tightly around rim. Put in a roasting pan, then add enough boiling-hot water to reach halfway up side of pie plate, making sure that foil is above water. </li>\n<li>Bake, refilling pan to halfway with water about every 40 minutes, until milk is thick and a deep golden caramel color, about 2 hours. </li>\n<li>Remove pie plate from water bath and transfer toffee to a bowl, then chill toffee, uncovered, until it is cold, about 1 hour.</li>\n<li>While toffee is chilling, clean pie plate and bake piecrust in it according to package instructions. Cool piecrust completely in pan on a rack, about 20 minutes.</li>\n\n<li>Spread toffee evenly in crust, and chill, uncovered, 15 minutes.</li>\n\n<li>Cut bananas into 1/4-inch-thick slices and pile over toffee.</li>\n<li>Beat cream with brown sugar in a clean bowl with an electric mixer until it just holds soft peaks, then mound over top of pie.</li>\n</ol>\n<div class="subRecipeInstructionTitle">Cooks' notes:</div>\n<ol>\n<li>• Toffee can be chilled up to 2 days (cover after 1 hour).• Toffee-filled crust can be chilled up to 3 hours.</li>\n</ol>\n</div>
568169	Chocolate Banana Lumpia	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-Banana-Lumpia-568169.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Dredge bananas in brown sugar to lightly coat.Separate the lumpia wrappers and cover with a damp towel to keep them from drying out. Using one wrapper, lay 2 pieces of the sugar coated banana end to end about an inch from the edge closest to you, and sprinkle about 4 dark chocolate morsels over banana. Working away from you, fold the lumpia wrapper over the banana and chocolate. Next fold in both sides, wet the end of the wrapper and roll to seal completely. Continue process until all lumpia are rolled.</li>\n<li>Heat about 3/4 of an inch of oil in a skillet over medium-high heat.  Once the oil hot, fry the lumpia until golden brown. </li>\n<li>Remove to paper towel lined plate . </li>\n<li>Let cool slightly. </li>\n<li>Serve.</li>\n</ol>\n</div>
666724	5:2 Diet – Three Ingredient Banana Pancakes	\N	\N	\N	https://spoonacular.com/recipeImages/5-2-Diet--Three-Ingredient-Banana-Pancakes-666724.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Mash the banana with a fork.  Try to get a mixture which is just slightly lumpy - you don't want a 'puree' and nor do you want large pieces of banana.  It's best to use a slightly over-ripe banana for these pancakes.  Sprinkle over the baking powder and mix well.Beat the egg in a separate bowl until the yolk and white are well mixed and then add the egg to the banana and baking powder. Don't add all the egg at once, the mixture should be about the thickness of creme fraiche - if it's too runny you've added too much egg and you may find the result is closer to an omelette than a pancake! </li>\n<li>Heat a non-stick skillet or frying pan over a medium heat (or lightly grease if you don't have a non-stick pan)Drop about a tablespoon of the mixture into the pan and let it spread.  Continue making small pancakes (this quantity should make 5 or .  It's important to make small drop pancakes.  If necessary you can cook these in batches and keep them warm in the oven for 10 minutes or so.Cook for about 2 minutes till the bottom of the pancakes are set and have started to go golden brown and there are little bubbles rising from the baking powder.  Flip the pancakes over and cook for a further minute.</li>\n<li>Serve drizzled with a teaspoon of honey or with fresh fruit and creme fraiche or greek yoghurt</li>\n</ol>\n</div>
633969	Banana & Coconut Pancakes With Palm Sugar Syrup	\N	\N	\N	https://spoonacular.com/recipeImages/Banana---Coconut-Pancakes-With-Palm-Sugar-Syrup-633969.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Pour water and a palm sugar block into a pot and heat over moderate heat until the block is fully dissolve and slightly thickened. Set aside.</li>\n<li>Add dessicated coconut into the pancake batter and stir to combine.Slice the banana into 1/4 inch thick. Set aside.Set the pan over moderate heat. </li>\n<li>Pour a thin layer of oil over the pan.When the oil is heated, place a slice of banana first and pour about a tablespoon full of batter over the banana.When the batter starts to bubble, flip the pancake to the other side. Cook until golden brown.</li>\n<li>Serve the banana side up with warm palm sugar syrup.</li>\n</ol>\n</div>
568439	Banana Turon	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Turon-568439.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Prepare bananas by peeling and cutting lengthwise into two halves. </li>\n<li>Roll in sugar.Separate wrappers into individual sheets. On a flat working surface, lay wrapper like a diamond. Arrange 1 banana slice in the middle of diamond and place 2 to 3 jackfruit strips lengthwise on top of banana slice. Fold bottom pointed end of wrapper over filling. Fold side ends of the sheet inward and roll into a log. Wet the pointed edge of the wrapper to completely seal. </li>\n<li>Roll sealed springrolls in sugar. Repeat with the remaining bananas.In a skillet over medium heat, heat about 1 inch of oil. </li>\n<li>Add banana springrolls seam side down and fry, turning once or twice, for about 3 to 5 minutes on each side or until golden brown.</li>\n</ol>\n</div>
601309	Coconut Pineapple Orange Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Coconut-Pineapple-Orange-Smoothie-601309.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Blend until smooth. Sprinkle with coconut and/or orange zest.</li>\n</ol>\n</div>
35720	Crisp Tofu Sandwich With Peanut-ginger Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/crisp-tofu-sandwich-with-peanut-ginger-sauce-2-35720.jpg	http://www.wholeliving.com/132891/crisp-tofu-sandwich-peanut-ginger-sauce
503047	Banana and Cream Cheese Springrolls	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-and-Cream-Cheese-Springrolls-503047.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Prepare bananas by peeling and cutting lengthwise into two halves. </li>\n<li>Roll in sugar. Slice cream cheese into 48 1/2-inch thick strips. Separate springroll wrappers into individual sheets. On a flat working surface, lay wrapper like a diamond. Arrange 1 banana slice in the middle of diamond and place 2 cream cheese slices lengthwise on top of banana slice. Fold bottom pointed end of wrapper over filling. Fold side ends of the sheet inward and roll into a log. Wet the pointed edge of the wrapper to completely seal. </li>\n<li>Roll sealed springrolls in sugar. Repeat with the remaining bananas.In a skillet over medium heat, heat about 1 inch of oil. </li>\n<li>Add banana springrolls and fry, turning once or twice, for about 3 to 5 minutes on each side or until golden brown.</li>\n</ol>\n</div>
732447	Acai-Banana Sorbet	\N	\N	\N	https://spoonacular.com/recipeImages/acai-banana-sorbet-732447.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>From Food Network Kitchen</li>\n</ol>\n<div class="subRecipeInstructionTitle">CATEGORIES:</div>\n<ol>\n<li>Banana</li>\n<li>Dessert</li>\n<li>Sorbet</li>\n<li>View All</li>\n<li>Main Ingredient</li>\n<li>Banana</li>\n<li>Course</li>\n<li>Dessert</li>\n<li>Dish</li>\n<li>Sorbet</li>\n<li>Cooking Style</li>\n<li>Healthy</li>\n<li>Nutrition</li>\n<li>Diabetic</li>\n<li>Heart Healthy</li>\n<li>Low Calorie</li>\n<li>Low Carbohydrate</li>\n<li>Low Cholesterol</li>\n<li>Low Fat</li>\n<li>Low Sodium</li>\n</ol>\n</div>
601422	Chocolate Banana	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-Banana-601422.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>You can change the flavor, by changing the extract. </li>\n<li>Combine all the ingredients in a blender and mix on low speed for 10-15 seconds or until sugar is dissolved allow foam to settle, then stir before drinking. Best if served cold.  Makes </li>\n</ol>\n</div>
486735	banana milkshake , how to make banana milkshake	\N	\N	\N	https://spoonacular.com/recipeImages/banana-milkshake---how-to-make-banana-milkshake-486735.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>peel the bananas and chop them.put the bananas, vanilla and coconut milk into the blender.also add the jaggery or sugar as required.blend everything till smooth.pour banana milkshake in tall glass and sprinkle cardamom or cinnamon powder.serve the banana milkshake immediately as with time its color and taste starts changing. so you can not store banana milkshake in fridge to have it later.</li>\n</ol>\n</div>
552324	Paleo Pancakes	\N	\N	\N	https://spoonacular.com/recipeImages/Paleo-Pancakes-552324.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat a non-stick skillet over medium heat. (You could preheat more than one to speed up the cooking process.) </li>\n<li>Place the bananas, eggs, coconut flour and 2 pinches of salt in the blender. Puree until smooth. The batter should be thick, but pourable. If it seems thin, add 1-2 more tablespoons of coconut flour.</li>\n<li>Brush the skillet lightly with coconut oil. </li>\n<li>Pour in a 3 inch circle of batter. Shake the skillet gently to spread the batter into a 4 inch circle. Cook for 2-4 minutes until the bottom is golden-brown and the edges are firm. Flip gently with a flexible spatula, and continue cooking another 2-4 minutes. If the bottoms turn dark, lower the heat a little.</li>\n</ol>\n</div>
585326	Healthy Peanut Butter Banana Ice Cream	\N	\N	\N	https://spoonacular.com/recipeImages/Healthy-Peanut-Butter-Banana-Ice-Cream-585326.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut bananas into about 1 inch thick chunks.  </li>\n<li>Place on a freezer safe plate in the freezer for 1-2 hours.  No longer or they will be way too hard to process.</li>\n<li>Place frozen banana pieces into the bowl of a food processor and process until completely smooth.  This takes a few minutes and you may need to scrape down the bowl or break up large chunks.Once the banana is creamy, add the peanut butter and vanilla and process until combined.  Eat immediately for a soft serve like treat or place in a freezer safe container and freeze until firm or up to 1 day.</li>\n</ol>\n</div>
601839	Nutella Banana Quesadilla	\N	\N	\N	https://spoonacular.com/recipeImages/Nutella-Banana-Quesadilla-601839.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Spread the Nutella over the whole tortilla.  </li>\n<li>Place the banana on half of the tortilla on top of the Nutella.  </li>\n<li>Place the tortilla in a medium sized skillet.  Cook until the Nutella starts to melt or about 2 minutes on medium heat.  Once the Nutella begins to melt, fold the Nutella only side over the side of the tortilla with the banana.   Cook for 2 minutes then flip to the other side of the quesadilla.  Cook for another 2 minutes, each side should be browned and crispy.   </li>\n<li>Remove from heat. To serve cut the quesadilla into 3 pieces.</li>\n</ol>\n</div>
274260	Open-Face Cracker Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/Open-Face-Cracker-Sandwiches-274260.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>SPREAD each cracker with peanut butter. TOP with banana slices.</li>\n</ol>\n</div>
487319	mango banana papaya smoothie – fruit s	\N	\N	\N	https://spoonacular.com/recipeImages/mango-banana-papaya-smoothie--fruit-s-487319.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>peel and chop the fruitsliquidize or blend all in a blender.pour in glasses and serve mango banana papaya smoothie immediately.add ice cubes if required.</li>\n</ol>\n</div>
421980	Nutty Bananas	\N	\N	\N	https://spoonacular.com/recipeImages/Nutty-Bananas-421980.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Slice bananas in half lengthwise; cut each piece in half. </li>\n<li>Spread with mayonnaise; sprinkle with sugar and nuts. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
464827	Coconut Curried Tofu with Green Beans and Coconut Rice	\N	\N	\N	https://spoonacular.com/recipeImages/Coconut-Curried-Tofu-with-Green-Beans-and-Coconut-Rice-464827.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Pour water, 1/2 cup coconut milk, and rice into a small saucepan. Bring to a boil over medium-high heat, then reduce heat to medium-low, cover, and simmer until the rice is tender, about 20 minutes.</li>\n<li>Meanwhile, melt the butter in a skillet over medium-high heat. </li>\n<li>Add the tofu and cook until golden-brown on all sides, about 5 minutes. When browned, stir in green beans, curry powder, and 1/4 cup of coconut milk. Simmer until the green beans are tender, then serve over rice.</li>\n<li>Kitchen-Friendly View</li>\n</ol>\n</div>
14280	Grilled Nectarine And Watercress Salad	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-nectarine-and-watercress-salad-2-14280.jpg	http://recipes.menshealth.com/Recipe/grilled-nectarine-and-watercress-salad.aspx
200703	Dinner Tonight: Spicy Noodles with Tofu (Dou Hua Mian)	\N	\N	\N	https://spoonacular.com/recipeImages/Dinner-Tonight--Spicy-Noodles-with-Tofu-(Dou-Hua-Mian)-200703.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>For the quick pickled carrots: Slice carrots in half lengthwise, and then thinly slice crosswise. </li>\n<li>Place in medium-sized bowl with salt and sugar. Toss well with fingers, and set aside for at least 10 minutes, stirring occasionally. When ready, drain away any liquid that has collected.</li>\n<li>2</li>\n<li>For the noodles: Fill medium-sized saucepan halfway up with water. Bring to simmer, add tofu. Cook until tofu is hot, about 5 minutes. Turn off the heat and drain tofu.</li>\n<li>3</li>\n<li>Bring large pot of water to boil. </li>\n<li>Add dried Chinese flat noodles and cook according to directions on packaging, usually about four minutes. </li>\n<li>Drain noodles when done.</li>\n<li>4</li>\n<li>Meanwhile, combine sesame paste (or tahini), chili oil, light soy sauce, dark soy sauce, and sesame oil in large bowl. </li>\n<li>Whisk until smooth.</li>\n<li>5</li>\n\n<li>Transfer noodles to large bowl with sauce. Toss well. </li>\n<li>Add carrots, tofu, peanuts, and scallions. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
98333	Asian Pear, Persimmon, and Almond Salad	\N	\N	\N	https://spoonacular.com/recipeImages/asian-pear-persimmon-and-almond-salad-98333.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a medium bowl, whisk lime juice, oil, honey, salt, and cayenne until blended. In another medium bowl, gently mix lettuces with 1 to 2 tbsp. dressing. </li>\n<li>Add remaining ingredients to first bowl with dressing and mix gently to coat. Divide lettuce among 4 salad plates. Spoon fruit mixture on top.Note: Nutritional analysis is per serving.</li>\n</ol>\n</div>
761951	Sesame Noodle Salad with Asparagus and Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/sesame-noodle-salad-with-asparagus-and-tofu-761951.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring large pot of lightly salted water to a boil for vermicelli. Meanwhile, in large skillet, heat sesame oil over medium-high heat. Stir in asafetida if desired and tofu. Sprinkle with liquid aminos and cook, stirring often, until tofu is golden-brown, about 7 minutes.</li>\n<li>Add asparagus, sprinkle lightly with salt, cover and cook until crisp-tender, 3 to 4 minutes. Immediately remove from heat; set aside.</li>\n<li>Add vermicelli to boiling water; stir to prevent sticking. Cook until just tender, about 6 minutes. </li>\n<li>Drain, rinse under cold running water and drain well. </li>\n<li>Transfer noodles to large bowl; add half of the Sesame Dressing and season with salt and freshly ground pepper to taste. Toss well. Spoon asparagus-tofu mixture on top, sprinkle with cucumber and drizzle with some remaining Sesame Dressing. Sprinkle with cilantro and serve.</li>\n</ol>\n</div>
143481	Thanksgiving Faux Meatloaf	\N	\N	\N	https://spoonacular.com/recipeImages/thanksgiving-faux-meatloaf-2-143481.png	http://www.food.com/recipe/thanksgiving-faux-meatloaf-14620
762000	Southwestern Tofu and Tortilla Scramble	\N	\N	\N	https://spoonacular.com/recipeImages/southwestern-tofu-and-tortilla-scramble-762000.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>   Meal plan:  Microwave several sweet potatoes to serve on the side and prepare a simple salad of cherry tomatoes and arugula. Finish with a refreshing mixture of canned unsweetened pineapple chunks and peeled, diced papaya spooned over vanilla low-fat yogurt or soy yogurt if desired.</li>\n</ol>\n</div>
762027	Tangy Tofu Spread	\N	\N	\N	https://spoonacular.com/recipeImages/tangy-tofu-spread-762027.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place tofuin medium bowl and mash with a fork. </li>\n<li>Mix in tahini, tamari and vinegar, then fold in remaining ingredients. </li>\n<li>Transfer to storage container and use within 3 or 4 days.</li>\n</ol>\n</div>
479421	Greek Baked Tofu with Red Onion, Mustard, and Dill	\N	\N	\N	https://spoonacular.com/recipeImages/Greek-Baked-Tofu-with-Red-Onion--Mustard--and-Dill-479421.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 350°F.In a bowl, combine the onion, oil, vinegar, wine, dill, mustard, honey, and salt.Pat the tofu dry with paper towels. Slice the block 1/2 inch thick. You should get 12 pieces.</li>\n<li>Place the tofu slices in a baking dish that can hold them in a single snug layer. </li>\n<li>Pour the marinade over the tofu.</li>\n<li>Bake for 45 minutes, or until the marinade is no longer liquid, and the onions are crisp and caramelized.</li>\n<li>Serve as a vegetarian entree on top of a bed of lentils or rice. The tofu is great room temperature or warm.</li>\n</ol>\n</div>
762068	Tofu Ravioli with Tomatoes, Olives and Capers	\N	\N	\N	https://spoonacular.com/recipeImages/tofu-ravioli-with-tomatoes-olives-and-capers-762068.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring large pot of lightly salted water to a boil. </li>\n<li>Add ravioli; stir to prevent sticking. Cook ravioli until just tender, about 8 minutes for fresh; 15 minutes for frozen. Meanwhile, in large shallow serving bowl, combine tomatoes, parsley, chopped olives, garlic, capers, oil and pepper. </li>\n<li>Drain ravioli and add to tomato mixture. Toss well to combine. Adjust seasoning to taste, divide among plates and garnish with whole black olives if desired.</li>\n</ol>\n</div>
522588	Vegetarian scrambled “egg” and vegetables pie	\N	\N	\N	https://spoonacular.com/recipeImages/Vegetarian-scrambled-egg-and-vegetables-pie-522588.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oven to 400F.Butter the bottom and sides of an eight-inch pie pan.Prepare the pâte à choux.</li>\n<li>Spread the dough evenly in the pie dish pushing it up all the way to the rim.</li>\n<li>Bake at 400F for ten minutes. Lower the heat to 350F and continue baking for another 30 minutes until puffed and lightly browned. If the bottom rises, don’t worry about it. It will get pressed down once the filling is spooned in.Prepare the pie filling.</li>\n<li>Heat about 2 tbsps. of olive oil and 2 tbsps. of butter in a pan (if you prefer vegan, just substitute olive oil for all the butter).Crumble the tofu into the pan.Sprinkle in the turmeric, Himalayan black salt and pepper. Cook, stirring, for about half a minute.</li>\n<li>Add the eggplants, onion and garlic. Sprinkle with more Himalayan black salt. Toss. If the mixture looks like it needs more oil (eggplants soak up oil like crazy), add more butter or olive oil.Cover and cook over medium heat for about five minutes or until the eggplant cubes are done but not mushy. The water from the tofu should create enough steam in which the eggplant cubes can cook. By the time the eggplant cubes are done, the mixture should be quite dry.Taste. </li>\n<li>Add more Himalayan black salt, if needed.Toss in the Chinese broccoli. Cook for a few minutes just until the greens are wilted. Taste once more and, if needed, adjust the seasoning. If you’re wondering why salt was added at several points during cooking, read about layering flavors.</li>\n</ol>\n</div>
758140	Asian Kale, Green Bean, and Tofu Salad	\N	\N	\N	https://spoonacular.com/recipeImages/asian-kale-green-bean-and-tofu-salad-758140.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place beans and 1/4 cup water in skillet, and bring to a boil over medium-high heat. Cover, and cook 3 minutes, or until beans are just tender. </li>\n<li>Drain, and rinse under cold water to cool. </li>\n<li>Drain again. Toss together beans, kale, bell pepper, and jicama in large bowl. </li>\n<li>Whisk together oil, vinegar, sugar, soy sauce, and sambal oelek in separate bowl. Season with salt and pepper, if desired. </li>\n<li>Pour dressing over salad, and toss to coat. Evenly divide salad among 4 bowls, and gently set tofu strips on each salad.</li>\n</ol>\n</div>
272831	Thai Pineapple-Peanut Fried Rice	\N	\N	\N	https://spoonacular.com/recipeImages/Thai-Pineapple-Peanut-Fried-Rice-272831.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>POUR teriyaki sauce over tofu in shallow dish.  Refrigerate 5 to 10 minutes to marinate.  </li>\n<li>Drain tofu; reserve teriyaki sauce. HEAT oil in large skillet on medium-high heat.  </li>\n<li>Add tofu; cook 3 to 4 minutes or until golden brown on all sides, stirring occasionally.  </li>\n<li>Remove from skillet. ADD red pepper to skillet; cook and stir 2 minutes.  </li>\n<li>Add green onion; cook and stir 1 minute. </li>\n<li>Add rice and pineapple; mix lightly.  Cook 2 to 3 minutes or until heated through, stirring frequently.  </li>\n<li>Add tofu, peanuts and reserved teriyaki sauce; mix lightly.   Cook until heated through, stirring occasionally.</li>\n</ol>\n</div>
18964	Smoked-turkey, Plum, And Fennel Salad	\N	\N	\N	https://spoonacular.com/recipeImages/smoked-turkey-plum-and-fennel-salad-2-18964.jpg	http://www.epicurious.com/recipes/food/views/Smoked-Turkey-Plum-and-Fennel-Salad-243166
143917	French Bread Pizza (vegetarian)	\N	\N	\N	https://spoonacular.com/recipeImages/french-bread-pizza-2-143917.jpg	http://www.food.com/recipe/french-bread-pizza-vegetarian-83305
516679	Mushroom and Spinach Tartines with Roasted Garlic Spread	\N	\N	\N	https://spoonacular.com/recipeImages/Mushroom-and-Spinach-Tartines-with-Roasted-Garlic-Spread-516679.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Roast the garlic. This is very easy to do: simply trim the tops of whole garlic bulbs to expose the cloves, set on a piece of foil, and drizzle with olive oil (about 1 tsp).Wrap the garlic tightly in foil, and bake 30 to 35 minutes at 400°F, or until garlic bulbs are soft. When it’s done, it looks like this:</li>\n<li>Place tofu and garlic in blender or food processor, season with salt and pepper, and blend until smooth.</li>\n<li>Heat oil in skillet over medium heat. Sauté mushroom and onion 3 to 5 minutes, or until softened.Stir in spinach, and sauté 2 minutes, or until wilted. </li>\n<li>Add 1 Tbs. Parmesan cheese to pan, and remove from heat. I also added salt and pepper to taste for more flavor.If you have any roasted garlic left over, spread one clove over each baguette half. Top with tofu-garlic spread, then with mushroom-spinach mixture, and sprinkle with remaining Parmesan cheese. Toast under broiler 1 to 2 minutes, or until cheese begins to brown. I also added a bit of salt and pepper on top (just a sprinkle) for extra flavor.</li>\n</ol>\n</div>
119382	Vegan Carrot Cake	\N	\N	\N	https://spoonacular.com/recipeImages/vegan-carrot-cake-2-119382.jpg	http://www.food.com/recipe/vegan-carrot-cake-185092
660067	Silky Tofu In Ginger and Spring Onion Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Silky-Tofu-In-Ginger-and-Spring-Onion-Sauce-660067.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
307838	Rum And Coconut Crème Brûlée	\N	\N	\N	https://spoonacular.com/recipeImages/rum-and-coconut-crme-brle-307838.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to </li>\n<li>Place first 7 ingredients in a food processor; process until smooth, scraping sides of processor bowl occasionally.Spoon mixture evenly into 4 (4-ounce) ramekins or custard cups. </li>\n<li>Place ramekins in an 8-inch square baking dish; add hot water to baking dish to a depth of 1 inch. Cover and bake at 325 for 40 minutes or until a knife inserted near center comes out clean. </li>\n<li>Remove cups from baking dish; let cool on a wire rack. Cover and chill at least 2 hours.</li>\n<li>Combine sugar, brown sugar, and coconut; sprinkle evenly over each serving. </li>\n<li>Place ramekins on a baking sheet; broil 2 minutes or until sugars melt and coconut is lightly browned.</li>\n</ol>\n</div>
27284	Tofu With Tomatoes, Basil, And Mint	\N	\N	\N	https://spoonacular.com/recipeImages/tofu-with-tomatoes-basil-and-mint-2-27284.jpg	http://www.wholeliving.com/183707/tofu-tomatoes-basil-and-mint
424601	Miso Soup with Tofu and Enoki	\N	\N	\N	https://spoonacular.com/recipeImages/Miso-Soup-with-Tofu-and-Enoki-424601.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a Dutch oven, saute the mushrooms, onion, garlic and ginger in oil until tender. </li>\n<li>Add the water and miso paste. Bring to a boil. Reduce heat; simmer, uncovered, for 15 minutes. </li>\n<li>Add tofu; heat through. Ladle into bowls; garnish with green onions.</li>\n</ol>\n</div>
262853	Baked Vegan Corndogs	\N	\N	\N	https://spoonacular.com/recipeImages/Baked-Vegan-Corndogs-262853.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 450 F. Grease a cookie sheet or line with parchment paper and set aside. </li>\n<li>Mix cornmeal, flour, baking powder, salt, spices, pepper, ener-g-egg replacer, 1/3 cup non-dairy milk and sugar together in a medium bowl. Slowly add additional non-dairy milk until the mixture is wet and can be worked with. However, be careful it's not too soupy or dry and doughy. Stir gently for 30 seconds. For mini-corndogs, cut the tofu dogs into 3 equal pieces, or the size that fits your Twinkie pan. Dip each tofu dog into the cornmeal mixture, making sure its evenly coated. Then place on the prepared cookie sheet, moving the coating around as necessary to ensure it's evenly coated. If using a Twinkie pan, pour a little mixture to line the bottom of the insert, add the dog, then add more batter over top until it's covered. Repeat. </li>\n<li>Bake for 10-15 minutes until golden and a little crisp.Nutritional Information</li>\n</ol>\n<div class="subRecipeInstructionTitle">Serving Size: 1Servings Per Batch:</div>\n<ol>\n<li>6Amount Per Serving</li>\n<li>Calories</li>\n<li>215Fat</li>\n<li>1g</li>\n<li>Carbohydrate</li>\n<li>23gDietary Fiber4gSugars4gProtein11g</li>\n</ol>\n</div>
635867	Braised Ridged Gourd With Beancurd Skin	\N	\N	\N	https://spoonacular.com/recipeImages/Braised-Ridged-Gourd-With-Beancurd-Skin-635867.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oil in work and deep fry tofu skin golden set on serving plate. </li>\n<li>Remove skin and ridges from gourd. </li>\n<li>Cut into wedges about 2-3 inches length. </li>\n<li>Heat up 1 tbsp oil in wok, saute chopped ginger until fragrant. </li>\n<li>Add in ridged gourd and stir well.</li>\n<li>Add mushroom and (A) and cook for 5 mins. </li>\n<li>Mix (B) pour into wok to thicken the gravy.  </li>\n<li>Mix well and dish everything and pour over tofu skin.  Ready to serve.</li>\n</ol>\n</div>
439251	Tofu Peanut Stir-Fry	\N	\N	\N	https://spoonacular.com/recipeImages/Tofu-Peanut-Stir-Fry-439251.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oil in a large skillet or wok over medium heat, and cook the vegetables until tender. </li>\n<li>Mix in the ginger, and season with salt and pepper. </li>\n<li>Remove vegetables from skillet, and set aside.</li>\n\n<li>Place the eggs in a bowl. In a separate bowl, mix the cornstarch, salt, and pepper. Dip tofu cubes first in the egg, then the cornstarch mixture to coat.</li>\n\n<li>Heat the remaining oil in the skillet or wok over medium heat, and cook the coated tofu 5 minutes, or until golden brown. Stir in the peanut sauce and peanuts. Continue to cook and stir until sauce has thickened and tofu is well-coated. </li>\n<li>Serve with the vegetables.</li>\n<li>Kitchen-Friendly View</li>\n</ol>\n</div>
15357	Mustard-Crusted Tofu with Kale and Sweet Potato	\N	\N	\N	https://spoonacular.com/recipeImages/mustard-crusted-tofu-with-kale-and-sweet-potato-2-15357.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut tofu into eight 1/2-inch-thick slices. Arrange on paper towels; drain 10 minutes. </li>\n<li>Spread both sides of each slice with mustard.</li>\n\n<li>Heat 2 tablespoons oil in large nonstick skillet over medium-high heat. </li>\n<li>Add onion and ginger; sauté 1 minute. </li>\n<li>Add kale, sweet potato, and lime juice. Cover, reduce heat to low, and cook until potato is tender and kale is wilted, about 12 minutes.</li>\n<li>Meanwhile, heat remaining 2 tablespoons oil in another large nonstick skillet over medium heat. </li>\n<li>Add tofu; cover and cook until heated through and crisp, about 2 minutes per side (some mustard seeds may fall off tofu).</li>\n<li>Arrange kale and sweet potato mixture on plate. Overlap tofu slices atop vegetables and serve.</li>\n<li>Per serving: 418 calories, 24 g fat (2 g saturated), 0 mg cholesterol, 775 mg sodium, 31 g carbohydrate, 7 g fiber, 21 g protein</li>\n<li>Nutritional analysis provided by</li>\n<li>Nutrition Data</li>\n<li>See Nutrition Data's complete analysis of this recipe ›</li>\n</ol>\n</div>
488479	pan fried tofu , how to make pan fried tofu with peanut sauce	\N	\N	\N	https://spoonacular.com/recipeImages/pan-fried-tofu---how-to-make-pan-fried-tofu-with-peanut-sauce-488479.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>first combine the vinegar, sugar and salt in a pan.keep on flame and bring to boil. then simmer for 1-2 minutes.remove from heat and add peanut butter, soy sauce, chili powder or flakes.stir and mix well. pour peanut sauce in a serving bowl and keep aside.chop the tofu into cubes or triangles or rectangles.take the all purpose flour, corn flour, sichuan pepper, red chili powder, baking powder, soy sauce, water and mix to a smooth batter.heat oil in a frying pan. dip the tofu pieces in the batter and place them one by one in the pan.when one side of tofu becomes opaque and done, flip and cook the other side.pan fry till the tofu till they are crisp and light golden and done.serve the pan fried tofu with the peanut sauce.</li>\n</ol>\n</div>
521296	Sweet and spicy kangkong	\N	\N	\N	https://spoonacular.com/recipeImages/Sweet-and-spicy-kangkong-521296.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking oil. </li>\n<li>Add the shredded pork. Season with a little patis. Cook over high heat until the meat is nicely browned and lightly crisp.</li>\n<li>Add the onion, garlic, chilies and sugar. Cook for a minute, stirring often.</li>\n<li>Add the kangkong. Season with more patis. Stir fry for two to three minutes.Finally, add the fried tofu. </li>\n<li>Pour in the oyster sauce. Stir fry just until the tofu is heated through.</li>\n</ol>\n</div>
23652	Stir-fried Eggplant and Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/stir-fried-eggplant-and-tofu-23652.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oil in a large nonstick frying pan over high heat, add tofu, and gently cook, turning tofu occasionally, until browned slightly, about 5 minutes. Use a slotted spoon to transfer tofu to a plate. Cook garlic, eggplant, and bell pepper in pan until softened, stirring occasionally, 8 to 10 minutes. </li>\n<li>Add soy sauce, sugar, and oyster sauce and cook until heated through, another 2 minutes. Return tofu to pan and gently stir to coat. </li>\n<li>Remove from heat and stir in basil leaves. </li>\n<li>Serve over rice.Note: Nutritional analysis is per serving.</li>\n</ol>\n</div>
107681	Dinner Tonight: Pan-Fried Tofu with Dark Sweet Soy Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/dinner-tonight-pan-fried-tofu-with-dark-sweet-soy-sauce-2-107681.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Mix together the soy sauce, honey, rice vinegar, and sambal oelek in a medium-sized bowl. Set aside.</li>\n<li>2</li>\n\n<li>Cut the tofu into ½-inch thick slices, which are approximately 3-inches long. Dry the tofu pieces on paper towels.</li>\n<li>3</li>\n\n<li>Place a large saute pan or wok over high heat. When smoking, add just enough of the canola oil to coat the bottom of the pan. </li>\n<li>Add as many of the tofu slices as will fit in one layer. Cook until tofu is browned on the bottom, two to three minutes. Flip the pieces with a pair of tongs, and brown on the other side, about two minutes. When done, drain the tofu pieces on paper towels. Repeat process with remaining tofu pieces, adding more oil if necessary.</li>\n<li>4</li>\n\n<li>Pour off all but 1 teaspoon of the canola oil, and turn the heat down to medium. </li>\n<li>Add garlic and cook until fragrant, about 15 seconds. </li>\n<li>Pour in the soy sauce mixture, and cook until it thickens slightly, about 30 seconds. Turn off the heat.</li>\n<li>5</li>\n<li>Divide the tofu between two plates, and pour half of the sauce over each. </li>\n<li>Garnish with the chopped serrano and scallion.</li>\n</ol>\n</div>
662709	Szechuan-Style Shirataki Noodles	\N	\N	\N	https://spoonacular.com/recipeImages/Szechuan-Style-Shirataki-Noodles-662709.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Microwave the noodles for 1 minute on high, drain them thoroughly, pat them dry, and set aside.</li>\n<li>Add the soy sauce, rice wine, and chili sauce to your protein, toss to coat (or mix thoroughly if youre using ground meat) and set aside.Spray a non-stick skillet with a little vegetable oil and heat it over a high flame. </li>\n<li>Add the ginger and cook for about 30 seconds until it starts to become fragrant. Toss in your veggies and cook, stirring, until theyre al dente  nearly (but not quite) done.</li>\n<li>Add the scallions and your protein and continue to stir-fry until its cooked through (about 1-2 minutes for tofu, soy, or turkey). </li>\n<li>Add the noodles, sprinkle with a tiny bit more soy sauce (about 2 tsp.), and cook about 1 minute until the shirataki are heated through.Turn into a serving bowl, drizzle the sesame oil over the noodles, and toss.</li>\n</ol>\n</div>
11532	Crisp Genmaicha Tofu with Shiitakes and Savoy Cabbage	\N	\N	\N	https://spoonacular.com/recipeImages/crisp-genmaicha-tofu-with-shiitakes-and-savoy-cabbage-11532.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine 2 tsp. genmaicha leaves and 1 1/2 cups boiling water; let steep 5 minutes, then strain into a bowl. Meanwhile, heat 2 tbsp. oil in a large frying pan over medium heat. </li>\n<li>Add mushrooms and ginger; sprinkle with 1/2 tsp. salt and cook until mushrooms begin to shrink. </li>\n<li>Add brewed tea; cook 5 minutes. Stir in cabbage and cook until slightly wilted but still green and most of liquid has evaporated, about 5 minutes. Set aside, covered. Slice tofu in half horizontally and set on paper towels. </li>\n<li>Cut an X through each half, forming 4 triangles per half, or 8 total. Blot tops with paper towels. Pulverize polenta and peppercorns in a spice grinder. </li>\n<li>Add remaining 1 tbsp. tea and 1 tsp. salt and pulse just to combine. </li>\n<li>Brush tofu on both sides with some oil. Liberally sprinkle oiled sides with polenta mixture and press on with your fingers. </li>\n<li>Heat remaining 2 tbsp. oil in a large nonstick frying pan over medium-high heat. Cook tofu until deeply golden brown on one side, about 8 minutes. Flip and brown other side lightly, about 3 minutes more. Arrange 2 tofu triangles on each of 4 warmed dinner plates. Reheat mushrooms and cabbage in pan, stir in green onions, and spoon mixture around tofu.</li>\n</ol>\n</div>
619918	Individual Pumpkin Butter-Swirled Vanilla Bean Ice Cream Cheesecakes	\N	\N	\N	https://spoonacular.com/recipeImages/Individual-Pumpkin-Butter-Swirled-Vanilla-Bean-Ice-Cream-Cheesecakes-619918.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 325 degrees. Pulse the graham crackers in a food processor until fine crumbs form. You should end up with about 2 cup (a little more or less isn't a big deal). </li>\n<li>Add the melted coconut oil, and pulse to combine. Divide the graham cracker crust among 12 well-greased muffin tins, pressing down firmly. Poke each one with a fork, and bake for 7-10 minutes, until golden.</li>\n<li>Combine the tofu, agave, sugar, and coconut milk, brandy, vanilla bean, and sea salt in a food processor and process until totally smooth.Divide the tofu mixture among the 12 muffin tins (about 3 tablespoons in each). If you did not grease the sides of your muffin tin before, make sure to do so now. Fill each muffin tin with 1 teaspoon of pumpkin butter, and use a knife to swirl.Freeze until solid. Eat straight out of the freezer, or let sit at room temperature for 10 minutes (I prefer them a bit thawed).If you do not want to use liners, here is how you remove the cakes from the pan: push a knife firmly into the side of one cheesecake. Once you get to the bottom, the cheesecake will pop out. Repeat with remaining cheesecakes. If you use greased muffin liners, you should be able to just peel them :)</li>\n</ol>\n</div>
761276	Luo Han Mian (Lo Han Noodles)	\N	\N	\N	https://spoonacular.com/recipeImages/luo-han-mian-lo-han-noodles-761276.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat 3 cups oil in deep saucepan to 325F. Plunge bean curd sticks into hot oil for 2 to 3 minutes, or until golden. </li>\n<li>Remove from heat with tongs, and drain on paper towels. Set aside. Steam bean thread noodles over hot water, remove from heat and set aside. </li>\n<li>Heat wok over medium heat, and when hot, add oil.  </li>\n<li>Add bean curd paste, and stir-fry about 30 seconds.  </li>\n<li>Add all vegetables.Stir in water, soy sauce, sugar and bean thread noodles, and cook for 2 to 3 minutes. </li>\n<li>Remove from heat. </li>\n<li>Place noodles on bottom of serving dish, and place vegetables on top or around noodles. Alternatively, cook vegetables and noodles separately, but serve together.</li>\n</ol>\n</div>
13784	Watercress-and-Tofu Dumplings	\N	\N	\N	https://spoonacular.com/recipeImages/watercress-and-tofu-dumplings-13784.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Put the flour in a medium bowl. </li>\n<li>Add the water in a steady stream, stirring until a raggy dough forms. Turn the dough out on a work surface and knead until smooth, about 5 minutes. Sprinkle the dough with flour, cover loosely with plastic wrap and let stand at room temperature for 15 minutes.</li>\n<li>In a large skillet, cook the watercress over moderately high heat until wilted, about 2 minutes; squeeze out any liquid. </li>\n<li>Transfer to a large bowl and let cool. </li>\n<li>Add the tofu, scallions, garlic, water chestnuts, sesame oil, egg, salt and white pepper. Using your hands, knead the mixture to form a coarse paste.</li>\n<li>Line a baking sheet with wax paper and dust with flour. Quarter the dumpling dough. On a lightly floured work surface, roll each piece of dough into a 12-inch rope. </li>\n<li>Cut each rope into 12 pieces and roll into balls; sprinkle with flour. Working with 5 or 6 balls at a time, roll to 3 1/2-inch rounds. </li>\n<li>Brush the excess flour off of the rounds. Spoon 1 tablespoon of the filling onto the center of each round. Bring up the sides of the wrapper; press and pleat the edges to seal in the filling. Lift each dumpling by the pleated edge, transfer to the baking sheet and press down lightly to flatten. Repeat with the remaining dough.</li>\n<li>In a very large nonstick skillet, heat 2 tablespoons of the oil. Arrange half of the dumplings in the pan, pleated edge up. Cook over high heat until the bottoms are lightly browned, about 2 minutes. </li>\n<li>Add 1/2 cup of water to the skillet, cover and cook until the water is evaporated and the dumplings are cooked through, about 5 minutes longer. Uncover and cook until the bottoms are well browned, about 1 minute longer. </li>\n<li>Transfer the dumplings to a plate. Cook the remaining dumplings in the remaining oil and serve.</li>\n</ol>\n</div>
624139	Salt and Pepper Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Salt-and-Pepper-Tofu-624139.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut tofu into smaller pieces. Blanch in salted water for 5 minutes. Carefully drain and wipe dry with kitchen towel.</li>\n</ol>\n</div>
104004	Stir-Fried Eggplant and Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/stir-fried-eggplant-and-tofu-2-104004.jpg	http://www.food.com/recipe/stir-fried-eggplant-and-tofu-334175
9912	Bok Choy and Tofu Noodle Bowl	\N	\N	\N	https://spoonacular.com/recipeImages/bok-choy-and-tofu-noodle-bowl-9912.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook noodles as package directs. </li>\n<li>Drain and divide among 4 bowls. Meanwhile, combine soy sauce, sesame oil, and broth and set aside. </li>\n<li>Cut tofu lengthwise into 3 pieces. </li>\n<li>Cut crosswise into 1/2-in. sticks and blot dry. </li>\n<li>Heat 1 tbsp. vegetable oil in a large frying pan over high heat. Brown tofu (don't stir), 4 minutes; brown on other side. Set on noodles. </li>\n<li>Add remaining 1 tbsp. vegetable oil to same pan over medium-high heat. Cook ginger and garlic until fragrant, 30 seconds. </li>\n<li>Add bok choy and cook until wilted, 5 minutes. </li>\n<li>Add reserved broth mixture and cook until hot, about 1 minute. Spoon mixture over noodles and tofu and sprinkle with onions.Note: Nutritional analysis is per serving.</li>\n</ol>\n</div>
200490	Cook the Book: Asian Pear, Persimmon, and Almond Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Cook-the-Book--Asian-Pear--Persimmon--and-Almond-Salad-200490.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In a medium bowl, whisk lime juice, oil, honey, salt, and cayenne until blended.</li>\n<li>2</li>\n<li>In another medium bowl, gently mix lettuces with 1 to 2 tbsp. dressing. </li>\n<li>Add pear, persimmons, and almonds to bowl with remaining dressing and mix gently to coat.</li>\n<li>3</li>\n<li>Divide lettuce among salad plates. Spoon fruit mixture on top.</li>\n</ol>\n</div>
186233	Tofu Triangles in Creamy Nut Buttter Sauce with Scallions	\N	\N	\N	https://spoonacular.com/recipeImages/Tofu-Triangles-in-Creamy-Nut-Buttter-Sauce-with-Scallions-186233.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Slice the tofu crosswise into scant 1/ 2-inch slabs, then cut each slab into 2 triangles. Blot with paper towels.</li>\n\n<li>Heat a large cast-iron or nonstick skillet and add the oil. When hot, add the tofu and fry over medium-high heat until golden. Turn and cook on the second side.</li>\n<li>Meanwhile, combine all the ingredients for the sauce in a small food processor and puree until smooth. Taste for salt and add a little extra, if needed.</li>\n<li>When the tofu is done, pour in half the sauce and cook until bubbling and partially reduced.</li>\n<li>Turn off the heat, scatter the scallions and sesame seeds over the top, and bring to the table.</li>\n<li>Per serving: 5 calories, 7 calories from fat, 0g total fat, 8g saturated fat, 6 mg cholesterol, 5 mg sodium, 9g total carbs, 8g dietary fiber, 8g sugars, 8g protein</li>\n<li>Nutritional analysis provided by</li>\n<li>Taste</li>\n<li>Book, using the USDA Nutrition Database</li>\n<li>From This Can't Be Tofu! by Deborah Madison. © 2000 by Deborah Madison. Published by Broadway Books.Deborah Madison's Vegetarian Cooking for Everyone and The Savory Way each earned the IACP's Julia Child Cookbook of the Year award. Vegetarian Cooking for Everyone also received a James Beard Award, as did Local Flavors, her most recent book. She is also the author of the James Beard Award nominee This Can't Be Tofu! and The Greens Cookbook, which is now a classic. She lives in Galisteo, New Mexico.</li>\n</ol>\n</div>
202644	Beancurd Sticks Simmered with Chili Bean Paste	\N	\N	\N	https://spoonacular.com/recipeImages/Beancurd-Sticks-Simmered-with-Chili-Bean-Paste-202644.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Cut the soaked bean curd sticks into 2-inch segments and set aside. (You can soak the tofu skin the night before, placing them in the refrigerator in a large bowl of water.)</li>\n<li>2</li>\n\n<li>Heat the oil in a wok or sauté pan over medium heat until shimmering. </li>\n<li>Add the chill bean paste and stir-fry until it is fragrant, about 20 seconds. </li>\n<li>Add the stock, wine, soy sauce, spices, and segments of tofu skin. Simmer until the tofu skin is tender and flavorful, about 20 minutes. Season to taste with salt. </li>\n<li>Serve immediately, garnishing with scallions and cilantro.</li>\n</ol>\n</div>
581520	Vegan Eggnog	\N	\N	\N	https://spoonacular.com/recipeImages/Vegan-Eggnog-581520.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the tofu and water in your blender jar.For Vitamix: Turn on Speed 1 and ramp up to Speed 5; blend for approximately 30 seconds.For Blendtec: Run the BATTERS cycle to combine.</li>\n<li>Add the remaining ingredients to the blender jar and then blend at the lowest speed for approximately 30 seconds to combine.Chill for several hours, serve, and enjoy!</li>\n</ol>\n</div>
143258	Barbecued-Tofu Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/barbecued-tofu-sandwich-143258.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place tofu on several layers of paper towels; cover with additional paper towels. </li>\n<li>Let stand 1 hour, pressing down occasionally. Sprinkle slices with salt.Lightly spoon flour into a dry measuring cup; level with a knife. </li>\n<li>Place flour in a shallow dish; dredge tofu slices in flour. </li>\n<li>Heat oil in a large nonstick skillet over medium-high heat. </li>\n<li>Add tofu; brush half of barbecue sauce over tofu, and cook 2 minutes. Turn slices over; brush with remaining barbecue sauce, and cook 3 minutes or until tofu is glazed. </li>\n<li>Place 2 tofu slices on bottom halves of buns; cover with tops of buns.</li>\n</ol>\n</div>
759701	Portobello Mushroom and Spinach Tartines with Roasted Garlic Spread	\N	\N	\N	https://spoonacular.com/recipeImages/portobello-mushroom-and-spinach-tartines-with-roasted-garlic-spread-759701.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place tofu and garlic in blender or food processor, season with salt and pepper, and blend until smooth.</li>\n<li>Heat oil in skillet over medium heat. Sauté mushroom and shallot 3 to 5 minutes, or until softened. Stir in spinach, and sauté 2 minutes, or until wilted. </li>\n<li>Add 1 Tbs. Parmesan cheese to pan, and remove from heat.</li>\n<li>Spread a little less than 1 Tbs. tofu-garlic mixture on each baguette half. Top with mushroom-spinach mixture, and sprinkle with remaining Parmesan cheese. Toast under broiler 1 to 2 minutes, or until cheese begins to brown.</li>\n</ol>\n</div>
470980	Baked Vegan Mac and Cheese Casserole	\N	\N	\N	https://spoonacular.com/recipeImages/Baked-Vegan-Mac-and-Cheese-Casserole-470980.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350ºF. Boil water in a big pot and cook pasta according to package directions.</li>\n<li>Add all of the ingredients (except pasta) in a blender and process until smooth. Once pasta is cooked, drain and put it in the baking pan.</li>\n<li>Pour ingredients from blender over the pasta.</li>\n<li>Bake until the top of the pasta look slightly browned and crispy, about 15 minutes.</li>\n</ol>\n</div>
18383	Tofu With Snap Peas And Scallions	\N	\N	\N	https://spoonacular.com/recipeImages/tofu-with-snap-peas-and-scallions-2-18383.jpg	http://www.wholeliving.com/132709/tofu-snap-peas-and-scallions
100488	Tibetan Greens With Tofu (Tse Tofu)	\N	\N	\N	https://spoonacular.com/recipeImages/tibetan-greens-with-tofu-2-100488.jpg	http://www.food.com/recipe/tibetan-greens-with-tofu-tse-tofu-137135
116905	Pork-and-Tofu Stir-Fry	\N	\N	\N	https://spoonacular.com/recipeImages/pork-and-tofu-stir-fry-116905.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large skillet, heat 1 tablespoon of the vegetable oil. </li>\n<li>Add the pork, season with salt and pepper and stir-fry over high heat until cooked, 2 minutes. </li>\n<li>Transfer to a plate. </li>\n<li>Add the remaining vegetable oil to the skillet. </li>\n<li>Add the garlic and crushed pepper and stir-fry for 1 minute. </li>\n<li>Add the leek and 1/4 cup of the stock, cover and cook until the leek is softened, 2 minutes. </li>\n<li>Add the remaining 3/4 cup of stock and bring to a simmer. </li>\n<li>Add the tofu, then stir in the pork, hoisin, vinegar and sesame oil. </li>\n<li>Transfer to bowls and serve.</li>\n</ol>\n</div>
553182	Whole Grain BBQ Tofu and Vegetable Rollups	\N	\N	\N	https://spoonacular.com/recipeImages/Whole-Grain-BBQ-Tofu-and-Vegetable-Rollups-553182.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a heavy sauce pan heat the oil and add all the veggies. Cook until they wilt, about 5-7 minutes. In a large bowl mash the tofu with bbq sauce. </li>\n<li>Add cooked veggies and mozzarella cheese.</li>\n<li>Place about 2-3 tablespoons of the mixture on each tortilla. </li>\n<li>Roll up and place on an oven proof dish.</li>\n<li>Heat oven to 375 degrees and place roll ups in the oven for about 5-10 minutes, just until warm through. </li>\n<li>Remove from oven and place provolone slices on top of the roll ups. </li>\n<li>Place them under a low broiler for 3-6 minutes or until cheese is melted. Enjoy!</li>\n</ol>\n</div>
143648	Mapo Tofu (Bean Curd)	\N	\N	\N	https://spoonacular.com/recipeImages/mapo_tofu-143648.jpg	http://www.food.com/recipe/mapo-tofu-bean-curd-323413
35239	Peanut-braised Tofu With Noodles	\N	\N	\N	https://spoonacular.com/recipeImages/peanut-braised-tofu-with-noodles-2-35239.jpg	http://www.williams-sonoma.com/recipe/peanut-braised-tofu-with-noodles.html
586184	Soba Noodle Soup with Tofu, Sweet Potato, Shiitake Mushrooms and Spinach	\N	\N	\N	https://spoonacular.com/recipeImages/Soba-Noodle-Soup-with-Tofu--Sweet-Potato--Shiitake-Mushrooms-and-Spinach-586184.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>While preparing ingredients, heat water to boil the soba noodles.Once noodles are done, drain and cool with running water. When noodles are cooled and drained, toss with sesame oil and sesame seeds. Set aside for now.In a soup pot, combine the stock and salt and bring to a simmer.</li>\n<li>Add the sweet potato, onion and mushrooms. Stir well and continue to simmer for 10 minutes.Gently stir in the tofu and cook for an additional 5 minutes. Test sweet potatoes to make sure they're tender.If sweet potatoes are tender, turn off heat. If not, continue to cook for another 5 minutes.Once the soup's off the flame, gently mix in the spinach and noodles. Allow to sit for 5 minutes so spinach can wilt and noodles heat then serve.</li>\n</ol>\n</div>
553501	vegetarian lasagna	\N	\N	\N	https://spoonacular.com/recipeImages/vegetarian-lasagna-553501.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook lasagna noodles until aldente stage and set aside. Preheat oven to 375F.In a bowl mix tofu, ricotta cheese, soy chorizo, spinach and 1/2 cup shredded mozzarella. (I my metal potato puree tool to do this). Set aside. In another bowl mix the tomato sauce with the tomato paste. Set aside.To assemble the lasagna, place 2-3 tablespoons of the tomato mixture at the bottom of a 9x13 square baking pan. </li>\n<li>Place 3-4 lasagna noodles over the tomato sauce. </li>\n<li>Place 4-5 tablespoons of the ricotta mixture over the noddles and spread (I do with a spoon or my hands). </li>\n<li>Place 2-3 of tomato sauce followed by the 3-4 tablespoons shredded mozzarella and another layer of lasagna noddles.Repeat layers until ricotta mixture is done. I normally end up with 3 layers. </li>\n<li>Bake lasagna for 20-30 minutes until cheese bubbles on top and its starts to brown up a bit.Sprinkle some dry oregano over the lasagna and serve.</li>\n</ol>\n</div>
207384	Healthy & Delicious: Tofu and Mushroom Marsala	\N	\N	\N	https://spoonacular.com/recipeImages/Healthy---Delicious--Tofu-and-Mushroom-Marsala-207384.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In a small Dutch oven or large pot, heat oil over medium heat. </li>\n<li>Add garlic and sauté until fragrant, about 30 seconds. </li>\n<li>Add bell pepper, oregano, and salt. Sauté 5 minutes. Turn heat up to high. </li>\n<li>Add Marsala and tofu and cook 4 minutes, so wine reduces a little. Turn heat to medium-high. </li>\n<li>Add mushrooms and tomatoes. Cook 5 minutes. Kill heat. Stir in basil, plus salt and pepper to taste. </li>\n<li>Serve in bowls with crusty bread.</li>\n</ol>\n</div>
227975	Spiced Moroccan Pâté	\N	\N	\N	https://spoonacular.com/recipeImages/Spiced-Moroccan-Pt-227975.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Blend all the ingredients in a Vitamix or blender. You could mash the ingredients, but you wouldn't get the same smooth finish.  Check the seasoning and top with a dash of worcestershire sauce. </li>\n<li>Serve on oatcakes, in ciabatta, in panini, on a tortilla wrap or with crudités. Oh and it would be good on toast too.  The pate will sit happily in the fridge for a few days.</li>\n</ol>\n</div>
758431	Vegan Galette des Rois	\N	\N	\N	https://spoonacular.com/recipeImages/vegan-galette-des-rois-758431.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Beat margarine and tofu with electric mixer until creamy. </li>\n<li>Add 1/2 cup sugar, and beat 2 minutes, or until sugar is dissolved (mixture will look grainy). Beat in almond extract and Kirsch, if using. </li>\n<li>Add almond flour, all-purpose flour, flaxseed meal, and baking powder; beat 3 minutes, or until mixture is smooth and light in color. Chill batter 2 hours, or overnight. Line baking sheet with parchment paper. Unroll puff pastry sheets onto lightly floured work surface. </li>\n<li>Cut each puff pastry sheet into largest circle possible. Discard scraps.  </li>\n<li>Transfer 1 puff pastry sheet to prepared baking sheet. </li>\n<li>Spread almond mixture in circle in center of pastry, leaving a 1-inch border all around. </li>\n<li>Brush border with water, and top galette with remaining puff pastry sheet. Press edges well to seal. Chill 1 hour, or overnight. Preheat oven to 425°F. Draw circle with tip of knife on top of galette around almond filling. Score curved lines to create pinwheel inside of circle with tip of knife, making sure puff pastry is slashed but not completely cut through. Score edges outside circle with diagonal lines. To crimp edges of galette, slide back of knife under galette, and gently lift upward and inward to create scallop effect, cutting into dough a bit.  </li>\n<li>Bake 15 minutes. Reduce oven to 350°F, and bake 45 minutes more, or until galette is brown on top and bottom. Meanwhile, bring remaining 1/2 cup sugar and 1/4 cup water to a boil in small saucepan. Cook 1 minute, or until sugar is completely dissolved.  </li>\n<li>Remove galette from oven, and brush sugar syrup all over top. Sprinkle with additional sugar, if using. Cool completely before serving.</li>\n</ol>\n</div>
15054	Miso Soup With Tofu And Kale	\N	\N	\N	https://spoonacular.com/recipeImages/miso-soup-with-tofu-and-kale-2-15054.jpg	http://www.wholeliving.com/131032/miso-soup-tofu-and-kale
545511	Vegan Tofu and Spinach Scramble	\N	\N	\N	https://spoonacular.com/recipeImages/vegan-tofu-and-spinach-scramble-545511.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>From Food Network Kitchen</li>\n</ol>\n<div class="subRecipeInstructionTitle">CATEGORIES:</div>\n<ol>\n<li>Tofu</li>\n<li>Breakfast</li>\n<li>Healthy</li>\n<li>View All</li>\n<li>Main Ingredient</li>\n<li>Tofu</li>\n<li>Spinach</li>\n<li>Course</li>\n<li>Breakfast</li>\n<li>Cooking Style</li>\n<li>Healthy</li>\n<li>Vegan</li>\n<li>Nutrition</li>\n<li>Diabetic</li>\n<li>High Fiber</li>\n<li>Low Calorie</li>\n<li>Low Carbohydrate</li>\n<li>Low Cholesterol</li>\n</ol>\n</div>
201600	Seriously Asian: Scrambled Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Seriously-Asian--Scrambled-Tofu-201600.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
95142	Vegan Creamy Broccoli Soup	\N	\N	\N	https://spoonacular.com/recipeImages/vegan-creamy-broccoli-soup-2-95142.jpg	http://www.food.com/recipe/vegan-creamy-broccoli-soup-290235
617466	Vegan Quiche	\N	\N	\N	https://spoonacular.com/recipeImages/Vegan-Quiche-617466.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 350Spray a pie plate with oil</li>\n\n<li>Cut one of the tortillas in half</li>\n<li>Overlap the full tortilla and 2 halves so the top of the pie pan is covered and there is a good tortilla wall to protect against the filling</li>\n\n<li>Bake for about 15 minutes, or until the crust is golden (you may need to prick any bubbles with a fork and press them down with the fork during the 15 mins)In a large saute pan add olive oil and all the veggies</li>\n\n<li>Saute on medium heat until the spinach is wilted, about 3 minutes</li>\n<li>In a food processor (or a blender) add the tofu, milk, garlic, salt and pepper</li>\n<li>Process until smooth</li>\n<li>Stir the veggies into the tofu mixture</li>\n\n<li>Pour the filling into the tortilla crust</li>\n\n<li>Bake at 350 for about 50 minutes, or until it begins to crack on top and it feels set to the touch</li>\n<li>Allow to cool for about 10 minutes</li>\n<li>Slice up and serve (its also great cold!!)</li>\n</ol>\n</div>
568328	Lumpiang Prito	\N	\N	\N	https://spoonacular.com/recipeImages/Lumpiang-Prito-568328.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Drain tofu from packing liquid and gently pat with paper towels to extract moisture. </li>\n<li>Cut into 1/2 inch cubes.</li>\n<li>Drain tofu from packing liquid. Pat dry with paper towels to absorb moisture. </li>\n<li>Cut into 1/2- inch cubes. In a wide skillet over medium heat, heat oil until very hot. </li>\n<li>Add tofu and spread into a single layer. When starting to crisp, turn and continue to cook until lightly browned. </li>\n<li>Remove from pan, drain excess oil on paper towels and keep warm.</li>\n<li>Add onions and garlic to pan and cook until limp. </li>\n<li>Add sweet potatoes. </li>\n<li>Add water and cook until potatoes are tender and most of liquid is absorbed. </li>\n<li>Add carrots and tofu. Cook for about 2 to 3 minutes or until carrots are half-cooked. </li>\n<li>Add cabbage and cook for about 1 minute. </li>\n<li>Add bean sprouts and stir-fry briefly for about 1 to 2 minutes. Season with salt and pepper to taste. Cook until vegetables are tender yet crisp.</li>\n<li>Remove vegetable mixture from heat and on a strainer, drain well of liquid.Separate wrappers into individual sheets. On a flat working surface, lay wrapper like a diamond. Spoon about 2 tablespoons of vegetable mixture on middle of wrapper. Fold bottom pointed end of wrapper over filling. Fold side ends of the sheet inward and roll tightly into a log. Wet the pointed edge of the wrapper with a dab of water to completely seal. Repeat with the remaining vegetable mixture.In a skillet over medium heat, heat about 1 inch of oil. </li>\n<li>Add spring rolls seam side down and fry, turning once or twice, for about 3 to 5 minutes on each side or until golden brown. </li>\n<li>Remove from pan and drain of paper towels. </li>\n<li>Serve hot with spiced vinegar dip.</li>\n</ol>\n</div>
281631	Hiziki Caviar with Lemon Tofu Cream and Chives	\N	\N	\N	https://spoonacular.com/recipeImages/hiziki-caviar-with-lemon-tofu-cream-and-chives-281631.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>To prepare caviar, place seaweed in a large bowl; cover with hot water to 2 inches above seaweed. Cover and let stand 30 minutes or until soft. </li>\n<li>Drain. Rinse with cold water, and drain. </li>\n<li>Place seaweed in a food processor; process until minced.</li>\n<li>Heat oils in a large nonstick skillet over medium heat. </li>\n<li>Add seaweed; cook 3 minutes, stirring occasionally. </li>\n<li>Add 2/3 cup water, soy sauce, and garlic; bring to a boil. Reduce heat; simmer 6 minutes or until liquid evaporates.To prepare remaining ingredients, peel lemon, and cut lengthwise into 6 wedges. </li>\n<li>Cut each wedge crosswise into 8 pieces to yield 48 triangles.</li>\n<li>Place 1 teaspoon seaweed caviar on each cracker. </li>\n<li>Place Lemon Tofu Cream in a small zip-top plastic bag; seal. Snip a small hole in 1 corner of bag; pipe about 1/2 teaspoon tofu cream on each cracker. </li>\n<li>Place 1 lemon triangle, 1 chive piece, and 1 carrot piece on each cracker.</li>\n</ol>\n</div>
23654	Eggplant-Tofu Ragout	\N	\N	\N	https://spoonacular.com/recipeImages/eggplant-tofu-ragout-23654.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Pour olive oil into a 12-inch frying pan with 2-inch-tall sides or a 5- to 6-quart pan over medium-high heat. When hot, add onions and stir frequently until limp, about 5 minutes. </li>\n<li>Add tomatoes; stir occasionally until tomatoes are soft and have released their juices, about 10 minutes. Stir in fish sauce, turmeric, ginger, and salt. Meanwhile, rinse eggplant and cut into 1-inch chunks, discarding ends. Stir into tomato mixture along with tofu. Cover and cook until eggplant is tender when pierced, about 20 minutes longer. Sprinkle with cilantro and serve immediately (see notes).</li>\n</ol>\n</div>
760928	Spiced Bok Choy and Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/spiced-bok-choy-and-tofu-760928.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oils in a large skillet or wok over high heat. </li>\n<li>Add bok choy and mushrooms, and stir-fry for 5 minutes, or until tender-crisp. </li>\n<li>Add scallion, garlic, jalapeño and ginger, and stir-fry for 1 1/2 minutes.Meanwhile, mix water, soy sauce and sugar substitute together in a cup. Stir into bok choy mixture, and top with tofu. Cover, and cook just to heat through, for 1 minute.</li>\n</ol>\n</div>
654460	Pan-Fried Stuffed Tofu With Oyster Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Pan-Fried-Stuffed-Tofu-With-Oyster-Sauce-654460.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine all the ingredients for the filling in a bowl and stir until the mixture is well-blended. Stir together all the ingredients for the sauce in a small bowl. Set aside.</li>\n<li>Cut the tofu into 10 rectangles, each about 4x7cm in size. Using a spoon to hollow out the center of each tofu rectangle to make a little box. Pat the tofu 'boxes' dry and dust them lightly with cornstarch. Fill each with about 1 tablespoon of the stuffing, mounding it slightly. Pat each piece of stuffed tofu with additional cornstarch.</li>\n<li>Pour enough oil into a skillet to fill 3 inches. </li>\n<li>Heat oil over medium-high heat to 150C/300F. Deep-fry the stuffed tofu, a few pieces at a time, until the tofu is golden brown and the filling is cooked through, about 5-6 minutes. </li>\n<li>Remove with a slotted spoon and drain on paper towels.</li>\n<li>Heat a skillet over high heat until hot. </li>\n<li>Add 1 tablespoon of the reserved oil and swirl to coat the sides. </li>\n<li>Add green onions and stir-fry until fragrant. </li>\n<li>Add the sauce and bring to a simmer.Slip the fried tofu into the sauce and stir gently to coat. </li>\n<li>Transfer the tofu onto a serving platter, and serve hot.</li>\n</ol>\n</div>
648462	Japanese Clear Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Japanese-Clear-Soup-648462.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large saucepan bring chicken stock to a boil. Stir in sherry and soy sauce. Reduce heat and simmer several minutes. Arrange your choice of garnishes in small bowls to pass at the table.Ladle broth into soup bowls and serve. Microwave Version:  </li>\n<li>Place chicken stock in a deep 2-quart casserole. Microwave, uncovered, on 100%% power until stock boils, about 5 to 7 minutes. Stir in sherry and soy sauce. Microwave on 30%% power 2 minutes. Continue with step </li>\n</ol>\n</div>
771447	Soy-Glazed Chicken and Tofu with Spring Vegetables	\N	\N	\N	https://spoonacular.com/recipeImages/soy-glazed-chicken-and-tofu-with-spring-vegetables-771447.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Set a saute pan with 2 tablespoons of the olive oil over medium-high heat. Season the chicken with salt and pepper and, once oil starts to smoke lightly, place the chicken into the hot pan. </li>\n<li>Saute the chicken until it is cooked through. </li>\n<li>Remove the chicken from the pan and set aside.Wipe the pan clean and set it back over medium-high heat. </li>\n<li>Add the remaining 2 tablespoons olive oil. Once the oil begins to lightly smoke again, add the floured tofu and saute until golden brown on all sides. </li>\n<li>Remove the tofu from the pan and set it aside.Next, add the broccoli and peas to the pan and saute until tender. Reduce heat to medium-low and push the vegetables to one side of the pan. </li>\n<li>Add the honey to the other side of the pan and heat it until it begins to simmer. </li>\n<li>Add the soy sauce and bring everything to a simmer.Stir in the edamame and red pepper flakes, cooking for 30 seconds, before adding the chicken and tofu to the pan. </li>\n<li>Saute everything together until all the ingredients are evenly coated and glazed.</li>\n</ol>\n</div>
666997	Tofu Parmigiana	\N	\N	\N	https://spoonacular.com/recipeImages/Tofu-Parmigiana-666997.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, combine bread crumbs, 2 tablespoons Parmesan cheese, 1 teaspoon oregano, salt, and black pepper.Slice tofu into 1/4 inch thick slices, and place in bowl of cold water. One at a time, press tofu slices into crumb mixture, turning to coat all sides.</li>\n<li>Heat oil in a medium skillet over medium heat. Cook tofu slices until crisp on one side. </li>\n<li>Drizzle with a bit more olive oil, turn, and brown on the other side.</li>\n<li>Combine tomato sauce, basil, garlic, and remaining oregano. </li>\n<li>Place a thin layer of sauce in an 8 inch square baking pan. Arrange tofu slices in the pan. Spoon remaining sauce over tofu. Top with shredded mozzarella and remaining 3 tablespoons Parmesan.</li>\n<li>Bake at 400 degrees F (205 degrees C) for 20 minutes.Kitchen-Friendly View</li>\n</ol>\n</div>
478609	Halang-halang, vegan style	\N	\N	\N	https://spoonacular.com/recipeImages/Halang-halang--vegan-style-478609.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking oil in a pot. </li>\n<li>Saute the garlic, onion, ginger and chilies with a little salt and pepper until softened and fragrant, about five minutes with occasional stirring.</li>\n<li>Pour in the coconut milk.</li>\n<li>Add the chayote wedges. Bring to the boil, lower the heat, cover the pan and simmer for about 10 minutes.Taste the broth, add more salt and pepper, if needed.</li>\n<li>Add the fried tofu. Simmer for another four minutes or until the tofu is heated through.Taste the broth once more. The tofu would have soaked up the salt so you may need to ajust the seasonings.</li>\n<li>Add the spearmint and simmer for another minute.</li>\n<li>Serve as a soup or with rice.</li>\n</ol>\n</div>
624016	Healthy Pumpkin Pie Pudding (sugar free, low carb, vegan)	\N	\N	\N	https://spoonacular.com/recipeImages/Healthy-Pumpkin-Pie-Pudding-(sugar-free--low-carb--vegan)-624016.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>After draining your tofu, press the block between paper towels to remove as much water as possible (mine weighed 405g after pressing).  Dump the tofu into a high-speed blender (I used my Vitamix).</li>\n<li>Add the rest of the ingredients to the blender and puree until completely smooth and even.Scoop into serving bowls, cover and refrigerate overnight.</li>\n<li>Serve!</li>\n</ol>\n</div>
497065	Tofu Soup with Pea Shoots and Radish	\N	\N	\N	https://spoonacular.com/recipeImages/Tofu-Soup-with-Pea-Shoots-and-Radish-497065.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat canola oil in a saucepan over medium heat. </li>\n<li>Add garlic and ginger to infuse the oil with flavor, taking care not to brown the garlic. Stir in the chicken or vegetable broth and bring to a boil. Season with salt and pepper, if necessary. </li>\n<li>Remove from heat, and strain, if desired.Divide the tofu, pea shoots and radish in 4 bowls, and ladle the broth over top. </li>\n<li>Garnish with scallions. </li>\n<li>Drizzle lightly with a few drops of sesame oil and rice wine vinegar. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
761281	Butternut Stew with Tofu, Corn and Pine Nuts	\N	\N	\N	https://spoonacular.com/recipeImages/butternut-stew-with-tofu-corn-and-pine-nuts-761281.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place corn in blender or food processor, and purée until coarse. </li>\n<li>Transfer corn to heavy saucepan, and add squash, garlic, salt, pepper, water and broth powder. Bring to a boil over medium heat, and cook until squash is tender. Meanwhile, heat large skillet over medium heat, and add oil. Toss diced tofu in flour, and sauté until browned on all sides. </li>\n<li>Add pine nuts, and sauté 1 minute more. When squash is tender, add tofu and pine nuts, stir and continue cooking 5 minutes. </li>\n<li>Remove from heat, garnish with scallions and serve.</li>\n</ol>\n</div>
761284	Su Cai Juan (Vegetable-Filled Soft Spring Rolls)	\N	\N	\N	https://spoonacular.com/recipeImages/su-cai-juan-vegetable-filled-soft-spring-rolls-761284.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat wok over medium-high heat until hot. </li>\n<li>Add oil, and when hot, pour in beaten egg, tilting wok so egg forms thin layer. Carefully remove from heat, and cut into thin shreds.Soak rice paper in warm water for 30 seconds, or until soft. </li>\n<li>Place flat on work surface, and let dry. Arrange shredded egg, tofu, seaweed, carrot, bean sprouts and peanuts in separate piles on work surface. Layer small portions of each in rice paper. Wrap up roll tightly by starting at closest rounded end, taking one fold. Fold in first one side over filling, then other side. Continue rolling wrapper up tightly into neat packet, and place on serving platter.To serve, place chili sauce in dish, and pass with spring rolls.</li>\n</ol>\n</div>
529889	Mellow Miso Soup with Bok Choy and Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Mellow-Miso-Soup-with-Bok-Choy-and-Tofu-529889.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat a large dutch oven over medium high heat.</li>\n<li>Add vegetable broth, water and carrots. Bring to a boil and boil for 8 - 10 minutes until carrots are just tender.</li>\n<li>Add mushrooms and bok chou. Simmer another 5 minutes until vegetables are just tender.</li>\n<li>Add miso and tofu. Simmer for another 3 - 5 minutes to melt the miso into the soup, and warm through the tofu.</li>\n<li>Serve topped with scallions, cilantro and a few drops of sesame oil.</li>\n</ol>\n</div>
\.


--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('recipes_recipe_id_seq', 1, false);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY roles (role_id, name, description) FROM stdin;
\.


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('roles_role_id_seq', 1, false);


--
-- Data for Name: roles_users; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY roles_users (user_role_id, id, role_id) FROM stdin;
\.


--
-- Name: roles_users_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('roles_users_user_role_id_seq', 1, false);


--
-- Data for Name: shoppinglist_ingredients; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY shoppinglist_ingredients (shoppinglist_ingredient_id, shoppinglist_id, ingredient_id) FROM stdin;
\.


--
-- Name: shoppinglist_ingredients_shoppinglist_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('shoppinglist_ingredients_shoppinglist_ingredient_id_seq', 1, false);


--
-- Data for Name: shoppinglists; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY shoppinglists (shoppinglist_id, id) FROM stdin;
\.


--
-- Name: shoppinglists_shoppinglist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('shoppinglists_shoppinglist_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY users (id, fname, lname, email, password, active, confirmed_at) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


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
-- Name: favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (favorite_id);


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
-- Name: roles_name_key; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: roles_users_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY roles_users
    ADD CONSTRAINT roles_users_pkey PRIMARY KEY (user_role_id);


--
-- Name: shoppinglist_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY shoppinglist_ingredients
    ADD CONSTRAINT shoppinglist_ingredients_pkey PRIMARY KEY (shoppinglist_ingredient_id);


--
-- Name: shoppinglists_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY shoppinglists
    ADD CONSTRAINT shoppinglists_pkey PRIMARY KEY (shoppinglist_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: favorites_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY favorites
    ADD CONSTRAINT favorites_id_fkey FOREIGN KEY (id) REFERENCES users(id);


--
-- Name: favorites_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY favorites
    ADD CONSTRAINT favorites_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id);


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
-- Name: roles_users_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY roles_users
    ADD CONSTRAINT roles_users_id_fkey FOREIGN KEY (id) REFERENCES users(id);


--
-- Name: roles_users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY roles_users
    ADD CONSTRAINT roles_users_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(role_id);


--
-- Name: shoppinglist_ingredients_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY shoppinglist_ingredients
    ADD CONSTRAINT shoppinglist_ingredients_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES ingredients(ingredient_id);


--
-- Name: shoppinglist_ingredients_shoppinglist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY shoppinglist_ingredients
    ADD CONSTRAINT shoppinglist_ingredients_shoppinglist_id_fkey FOREIGN KEY (shoppinglist_id) REFERENCES shoppinglists(shoppinglist_id);


--
-- Name: shoppinglists_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kathyma
--

ALTER TABLE ONLY shoppinglists
    ADD CONSTRAINT shoppinglists_id_fkey FOREIGN KEY (id) REFERENCES users(id);


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

