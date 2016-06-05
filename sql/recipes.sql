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
1	butter
2	flour
3	whole chicken
4	water
5	buttermilk
6	salt
7	milk
8	crisco
9	olive oil
10	rub
11	red potatoes
12	chickens
13	beer
14	green beans
15	kosher salt
16	honey
17	chicken
18	unsalted butter
19	ground cinnamon
20	turmeric
21	lemon
22	rosemary
23	saffron threads
24	black peppercorns
25	garlic cloves
26	low sodium soy sauce
27	fresh ginger
28	dark sesame oil
29	green onions
30	on holes of a box grater
31	dijon mustard
32	chicken stock
33	salt and pepper
34	cow pea
35	heavy cream
36	parmesan cheese
37	potatoes
38	beans
39	dry white wine
40	extra virgin olive oil
41	black pepper
42	green olives
43	tomatoes
44	white onions
45	plum tomatoes
46	creamy cheese grits
47	butternut squash
48	fresh thyme
49	sunflower oil
50	Salt & Pepper
51	fresh tarragon
52	green sweet pepper
53	mayonnaise
54	red sweet pepper
55	sriachi
56	hot pepper
57	pepper
58	canola oil
59	long grain rice
60	poultry seasoning
61	fresh parsley
62	nut mix
63	condensed cream of chicken soup
64	peas and carrots
65	balsamic vinegar
66	garlic
67	bacon
68	shallots
69	carrot
70	dried garlic
71	pasta
72	capsicums
73	garlic powder
74	chicken broth
75	peas
76	mushrooms
77	lemons
78	red pepper flakes
79	onion
80	beefsteak tomatoes
81	bay leaves
82	yukon gold potatoes
83	orange zest
84	ground pepper
85	fresh rosemary
86	vegetable oil
87	light soy sauce
88	ginger
89	scallion
90	shaoxing wine
91	ginger powder
92	dry onion soup mix
93	condensed cream of mushroom soup
94	slivered almonds
95	soy sauce
96	brown sugar
97	garlic clove
98	ground ginger
99	oil
100	plantains
101	canned tomatoes
102	thyme
103	roasted garlic
104	juice of lemon
105	anchovy paste
106	plum tomato
107	flat-leaf parsley
108	shredded mozzarella cheese
109	cooked spaghetti
110	patis
111	vegetable oil cooking spray
112	papayas
113	chili
114	white onion
115	onion powder
116	paprika
117	pancake mix
118	celery salt
119	curry paste
120	deli ham
121	eggs
122	swiss cheese
123	unseasoned breadcrumbs
124	rosemary leaves
125	lemon zest
126	herb tea
127	tamarind
128	italian salad dressing
129	italian seasoning
130	seasoned salt
131	cilantro
132	tortillas
133	bbq sauce
134	pepper jack cheese
135	sea salt
136	buns
137	skinless boneless chicken breasts
138	Low Moisture Part-Skim Mozzarella Cheese
139	spaghetti sauce
140	Stone-Ground Mustard
141	pecans
142	cranberry bread
143	smoked paprika
144	pecorino
145	ricotta
146	chard
147	fat-free milk
148	fresh sage
149	red skinned potatoes
150	corn flakes
151	egg
152	olives
153	whole garlic cloves
154	artichoke hearts
155	flat leaf parsley
156	carrots
157	celery
158	ranch dressing
159	barbecue sauce
160	baby potatoes
161	fennel bulbs
162	flat leaf parsley leaves
163	fresh ginger root
164	roasted red bell pepper
165	scallions
166	granny smith apple
167	fresh sage leaves
168	baby dill
169	baby spinach
170	pita
171	red bell pepper
172	vinaigrette
173	cooking oil
174	parsley
175	sweet tea
176	deep dish pie shell
177	store bought polenta
178	food dye
179	rib tips
180	clabber girl baking powder
181	plant oil
182	rib eye
183	real cheese
184	kitchen bouquet
185	salsa
186	salmon fillet
187	limes
188	cracked pepper
189	allergy friendly chocolate chips
190	simple syrup
191	spinach wrap
192	queso fresco
193	orange bell pepper
194	coarsely ground pepper
195	cauliflower
196	capers
197	pine nuts
198	pizza crust
199	basil pesto
200	part-skim mozzarella cheese
201	onions
202	scotch bonnet chili peppers
203	allspice
204	seasoning salt
205	lemon juice
206	coarse salt
207	fresh oregano leaves
208	orange peppers
209	orange juice concentrate
210	pineapple
211	dried oregano
212	feta cheese
213	creamer potatoes
214	skim milk
215	cream of mushroom soup
216	cheddar cheese
217	cooked macaroni
218	white wine
219	lard
220	basil
221	nutmeg
222	orange
223	fresh mushrooms
224	breadcrumbs
225	fresh thyme leaves
226	orange juice
227	red onion
228	watercress
229	mixed veggies
230	cream of chicken soup
231	biscuits
232	flour tortillas
233	veggie blend
234	shredded cheddar cheese
235	coriander
236	juice of lime
237	cooked ham
238	puff pastry
239	green salsa
240	corn tortillas
241	fig jam
242	stout
243	ham
244	sugar
245	oyster sauce
246	lemongrass
247	buttery spread
248	sourdough bread
249	½ cups cheese
250	sage
251	chilli flakes
252	oranges
253	fat free chicken broth
254	bow tie pasta
255	fava beans
256	coarse sea salt
257	parsley leaves
258	new potatoes
259	red peppers
260	red onions
261	spaghetti
262	fresh basil
263	goat cheese
264	acorn squash
265	tarragon
266	shiitake mushroom caps
267	real bacon pieces
268	pepper rings
269	miracle whip
270	pasta sauce
271	pasta salad mix
272	red grapes
273	poppy seed
274	canned tomato sauce
275	bell pepper
276	canned cannellini beans
277	fresh basil leaves
278	asparagus
279	celery flakes
280	dried parsley flakes
281	dried onion
282	chicken bouillon granules
283	white rice
284	pork
285	basil leaves
286	monggo
287	coconut cream
288	talbos ng kamote
289	beet
290	roasted cashews
291	baby bok choy
292	sesame oil
293	beef stock
294	yam bean
295	brocollini
296	tofu
297	spring onions
298	kecap manis
299	beef stew meat
300	dried marjoram
301	cooked noodles
302	sour cream
303	fish
304	vegetarian bacon
305	kiwi fruits
306	lunch meat
307	turkey
308	mahi-mahi
309	breakfast links
310	gingerbread kids
311	super fine sugar
312	southern comfort
313	seafood stock
314	deep dish pie crust
315	frank
316	Dairy Free Cheese
317	poultry
318	meat
319	passion-fruit
320	pita breads
321	ranch
322	ez-sweets
323	pesto sauces
324	bison
325	bread crumbs
326	pretzel sandwiches
327	pinto beans
328	fresh oregano
329	purple plum
330	monterey jack
331	bacon strips
332	fresh corn
333	fresh cilantro
334	sweet potatoes
335	beef
336	worcestershire sauce
337	leeks
338	bread
339	whole garlic
340	dried shrimp
341	daikon radish
342	scallops
343	bay leaf
344	thick-cut bacon
345	ham hock
346	jalapeno chile
347	dried tarragon
348	dried rosemary
349	baking powder
350	plain flour
351	jelly
352	brandy
353	prunes
354	creme fraiche
355	eggplants
356	ground cumin
357	chilli
358	star anise
359	spice mix
360	chayote
361	spinach leaves
362	squash
363	chili pepper
364	cilantro leaves
365	fresh breadcrumbs
366	rice wine
367	sweet onion
368	sweet pepper
369	green onion
370	pork butt
371	whole wheat tortillas
372	chili-garlic sauce
373	crunchy peanut butter
374	hoisin sauce
375	dill pickle
376	turkey breast
377	rolls
378	mustard
379	miso
380	corn starch
381	mirin
382	shiso leaves
383	eggplant
384	vinegar
385	finger chilis
386	pork belly
387	pork liver
388	pineapple chunks
389	chili flakes
390	tapioca starch
391	enoki mushrooms
392	cornstarch
393	red pepper powder
394	whole-grain mustard
395	chicken breast
396	granny smith apples
397	white wine vinegar
398	coarse grain mustard
399	basmati rice
400	creole seasoning
401	sweet chilli sauce
402	lime zest
403	canned black beans
404	ground allspice
405	chili powder
406	bananas
407	grapeseed oil
408	spinach
409	parmesan
410	fresh mint leaves
411	kale
412	fennel
413	dill pickles
414	blueberries
415	avocado
416	pancetta
417	cranberries
418	couscous
419	chickpeas
420	pesto
421	lasagna pasta
422	plums
423	swiss chard
424	greens
425	prosciutto
426	cookies
427	Sushi Nori
428	almonds
429	balsamic glaze
430	ice cream
431	sausage
432	meatballs
433	yogurt
434	mussels
435	corn
436	chiles
437	mexican rub
438	meatloaf mix
439	quinoa
440	shrimp
441	morningstar farms patty
442	peanut butter
443	cheese
444	coconut
445	arugula
446	asian pear
447	lime
448	pears
449	cooked penne pasta
450	soy oil
451	peppers
452	roasting chicken
453	shallot
454	chocolate
455	strawberries
456	rice
457	oats
458	apples
459	ribs
460	stew vegetables
461	vodka
462	pizza mix
463	grilling cheese
464	mint
465	lamb
466	peach
467	baking bar
468	nuts
469	zucchini
470	tuna
471	tomato soup
472	salmon
473	herbs
474	fruit
475	cucumber
476	cabbage
477	broccoli
478	beets
479	wine
480	lime juice
481	chile
482	sweet potato
483	coconut milk
484	sigarillas
485	two
486	bird's eye chile
487	patani
488	cooked rice
489	sesame seed oil
490	peanut oil
491	shrimps
492	kangkong
493	taro
494	port wine
495	peppercorns
496	pineapple juice
497	cider vinegar
498	canned pineapple
499	red wine vinegar
500	red sweet peppers
501	chili paste
502	red chilis
503	pork tenderloins
504	sandwich buns
505	thyme leaves
506	lemon wedges
507	jalapeno
508	coconut oil
509	cumin
510	yellow onion
511	chicken drumsticks
512	lager
513	cumin seed
514	ginger ale
515	ice
516	juice of orange
517	caster sugar
518	multi-grain bread
519	low fat cream cheese
520	cream cheese
521	jalapenos
522	marjoram
523	caraway seed
524	sweet paprika
525	lemon rind
526	beef broth
527	all purpose flour
528	ground achiote
529	tomatillo salsa
530	frozen spinach
531	low sodium broth
532	light brown sugar
533	pork shoulder
534	cayenne pepper
535	cola
536	baby corns
537	korean marinade
538	fish sauce
539	dark soy sauce
540	white vinegar
541	dark corn syrup
542	reduced sodium soy sauce
543	green pepper
544	ketchup
545	red pepper
546	jack cheese
547	chives
548	snow peas
549	horseradish cream
550	baby corn
551	cornflour
552	sweet chili sauce
553	hokkien noodles
554	ketjap manis
555	sprinkles
556	potato
557	vanilla bean paste
558	cane syrup
559	noodles
560	dried coriander leaves
561	sesame seeds
562	whole-wheat noodles
563	yellow capsicum
564	lettuce leaves
565	orange rind
566	cashew nuts
567	asian fish sauce
568	fresh cilantro leaves
569	iceberg lettuce leaves
570	mango
571	dry roasted peanuts
572	serrano chili
573	stock
574	pork roll
575	cheddar
576	green chilies
577	quick-cooking brown rice
578	mushroom
579	summer savory
580	garlic salt
581	chuck steak
582	maple syrup
583	cream of tartar
584	apple
585	unrefined sea salt
586	baking soda
587	whole eggs
588	applesauce
589	coconut flour
590	apple juice
591	broth
592	pork ribs
593	celery stalks
594	red chili
595	bacon drippings
596	tabasco sauce
597	dried thyme
598	stewed tomatoes
599	chillies
600	sauerkraut
601	english muffins
602	egg yolks
603	sriracha
604	greek yogurt
605	fresh coriander
606	fennel seed
607	coriander seed
608	crushed red pepper
609	dry red wine
610	scotch bonnet chili pepper
611	rice vinegar
612	chicken base
613	frozen corn
614	bamboo shoots
615	rice cake
616	napa cabbage
617	vegetable broth
618	pear
619	fuji apple
620	gochujang
621	on the stove
622	tomato paste
623	french bread
624	chili sauce
625	serrano pepper
626	cheese of choice
627	cream
628	pimenton de la vera
629	garlic paste
630	cumin seeds
631	fresh flat-leaf parsley
632	allspice berries
633	fresh herbs
634	cous cous
635	feta
636	romano cheese
637	smoked sausage
638	tequila
639	littleneck clams
640	clam juice
641	cinnamon stick
642	thai fish sauce
643	red chilli
644	ginger root
645	dark muscovado sugar
646	ears corn
647	bean curd
648	kalamata olives
649	oregano
650	red capsicum
651	baguette
652	harissa
653	dried apricots
654	chervil
655	grill cheese
656	roasted almonds
657	pearl couscous
658	romaine lettuce
659	dried cranberries
660	tomato
661	raisins
662	tomato puree
663	string beans
664	sultanas
665	ears of corn
666	cranberry beans
667	white-wine vinegar
668	cornmeal
669	okra
670	baby peas
671	mixed spice
672	lettuce
673	5 spice powder
674	ground nutmeg
675	low sodium chicken broth
676	apricot
677	dates
678	orange blossom water
679	blanched almonds
680	tahini
681	whole tomatoes
682	dark brown sugar
683	red chilies
684	ground cloves
685	quinces
686	pomegranate molasses
687	vine ripened tomatoes
688	mint leaves
689	dried mint
690	yeast
691	natural yogurt
692	ground coriander
693	plum vinegar
694	crystallized ginger
695	unseasoned rice vinegar
696	panko breadcrumbs
697	juniper berries
698	malt vinegar
699	cardamom pods
700	plain yogurt
701	beef top sirloin steak
702	canned garbanzo beans
703	tomato sauce
704	bouquet garni
705	guinness stout
706	matzo
707	slivered blanched almonds
708	ground cumin seed
709	fennel bulb
710	spring water
711	ground turmeric
712	italian tomatoes
713	red jalapeno chili
714	curry powder
715	beluga lentils
716	red wine
717	stout beer
718	garam masala
719	teriyaki sauce
720	mesclun
721	vegetable
722	saffron
723	black olives
724	cooked couscous
725	lentils
726	fresh horseradish
727	lamb stock
728	canned coconut milk
729	dill
730	phyllo dough
731	green bell pepper
732	orzo pasta
733	cinnamon
734	fresh bay leaves
735	runner beans
736	stock cubes
737	dried coriander
738	fresh peas
739	fennel powder
740	maca powder
741	cardamom
742	smen
743	wheat flatbreads
744	thyme sprigs
745	pomegranate seeds
746	lowfat greek yoghurt
747	fresh mint
748	lemon peel
749	mace
750	powdered ginger
751	soy chunks
752	sweet onions
753	dry sherry
754	low sodium beef broth
755	wide egg noodles
756	baby bella mushroom
757	ground beef
758	brown onion
759	chick peas
760	whole egg
761	mustard greens
762	canned kidney beans
763	mutton
764	ginger paste
765	turmeric powder
766	cumin powder
767	curry leaves
768	yellow onions
769	romaine lettuce leaves
770	cooked white rice
771	chili garlic sauce
772	lebanese cucumber
773	sumac
774	bread flour
775	fresh yeast
776	blanched almond flour
777	bulgur
778	flatleaf parsley
779	whole milk
780	chipotle chiles in adobo
781	roasted red peppers
782	crusty rolls
783	fresh chives
784	minutes and then flushed
785	canned chickpeas
786	green capsicum
787	yoghurt
788	turnips
789	rutabaga
790	savoy cabbage
791	pearl barley
792	leek
793	ground veal
794	beef chuck roast
795	parmigiano reggiano cheese
796	semolina flour
797	freekeh
798	red bell peppers
799	yellow bell peppers
800	green bell peppers
801	finger chili
802	chilies
803	pomegranate
804	pita bread
805	juice
806	green peas
807	fresh dill
808	celery root
809	eggwash
810	sage leaves
811	vegetable stock
812	golden raisin
813	lamb stew meat
814	baking potatoes
815	sheep milk
816	blood orange juice
817	blood orange zest
818	long-grain rice
819	lemon thyme
820	limoncello
821	seasoning mix
822	ras-el-hanout
823	whole blanched almonds
824	cinnamon sticks
825	bulgur wheat
826	chicken stock powder
827	quick cooking oats
828	sherry wine
829	bouillon granules
830	extra-virgin olive oil
831	slaw dressing
832	green tea
833	peaches
834	cherry
835	grapefruit
836	pumpkin
837	anchovy
838	watermelon
839	figs
840	raspberries
841	grapes
842	oatmeal
843	buckwheat
844	radish
845	hungarian sweet paprika
846	duck
847	anise
848	artichokes
849	blue cheese
850	tangerine
851	olive
852	strawberry
853	corned beef
854	brussel sprouts
855	apricots
856	papaya
857	melon
858	poppy seeds
859	tamarind paste
860	unsweetened coconut flakes
861	chile powder
862	clear honey
863	ground almonds
864	cooked basmati rice
865	mango chutney
866	ground cardamom
867	peanuts
868	pistachios
869	green peppers
870	red chili pepper
871	peanut butter chips
872	shortening
873	fish sticks
874	semi sweet chocolate chips
875	corn cereal
876	light corn syrup
877	white chocolate morsels
878	almond bark
879	oreos
880	hemp hearts
881	white fish
882	bell peppers
883	smoked salmon
884	trout
885	candy coated chocolate pieces
886	sugar cookie mix
887	marshmallows
888	crisp rice cereal
889	smoked fish
890	baby arugula leaves
891	coriander powder
892	chilli powder
893	K-Cups
894	chocolate milk
895	creamy peanut butter
896	gelatin
897	vanilla extract
898	vanilla yogurt
899	orange gelatin
900	cheese cake mix
901	canned mushrooms
902	panko bread crumbs
903	m&m candy
904	caramels
905	salted peanuts
906	ground nuts
907	mixed fresh herbs
908	dry breadcrumbs
909	granulated sugar
910	sweetened coconut flakes
911	red cabbage
912	tartar sauce
913	red food coloring
914	white sugar
915	red apples
916	crab boil seasoning
917	evaporated milk
918	iceberg lettuce
919	white pepper
920	hot dog buns
921	anchovies
922	" of daikon
923	" square of seaweed
924	sweet red peppers
925	fish fillets
926	italian bread
927	hershey's cocoa
928	banana
929	coconut sugar
930	vanilla
931	orange marmalade
932	foil
933	cream of coconut
934	low fat vanilla yogurt
935	diet pop
936	berries
937	fillings
938	takuan
939	cooked sushi rice
940	nori
941	radish sprouts
942	white chocolate chips
943	crispy rice cereal
944	parsley flakes
945	fresh dill weed
946	cassava flour
947	salmon filets
948	whole grain mustard
949	red cinnamon candies
950	red chili powder
951	yellow mustard seeds
952	banana leaves
953	mustard oil
954	white flour
955	asian toasted sesame dressing
956	fresh tarragon leaves
957	asparagus spears
958	rice paper
959	roasted peanuts
960	whole almonds
961	icing
962	chicken bites
963	brownie mix
964	wafers
965	blood oranges
966	black beans
967	coarse breadcrumbs
968	white cake mix
969	black licorice
970	roll
971	breaded fish
972	hamburger buns
973	kraft singles
974	salmon fillets
975	fat-free low sodium beef broth
976	gingerroot
977	cajun seasoning
978	low fat mayonnaise
979	old bay seasoning
980	pepper sauce
981	mustard seed
982	wasabi
983	tuna steak
984	cucumbers
985	cedar plank
986	whole grain dijon mustard
987	sundried tomatoes
988	salted anchovies
989	walnuts
990	raspberry preserves
991	corn chips
992	rocket
993	caviar
994	croutons
995	half and half
996	grain blend
997	baking potato
998	serrano chile
999	avocados
1000	grilled salmon
1001	ciabatta rolls
1002	portobello mushrooms
1003	bourbon
1004	penne
1005	apple cider vinegar
1006	canned great northern beans
1007	yellow sweet pepper
1008	sugar snap peas
1009	dried dill weed
1010	pecan halves
1011	cherries
1012	dried basil
1013	crackers
1014	hot pepper sauce
1015	pepper jelly
1016	champagne
1017	raw honey
1018	spices
1019	monterey jack cheese
1020	salsa verde
1021	sriracha sauce
1022	prawns
1023	prawn
1024	cherry tomatoes
1025	radishes
1026	waxy potatoes
1027	yellow summer squash
1028	rye meal
1029	sheeps milk cheese
1030	white miso
1031	coarse kosher salt
1032	whole coriander seeds
1033	heirloom tomatoes
1034	blackened seasoning
1035	hash browns
1036	ruby port
1037	baby beets
1038	arugula leaves
1039	spaghetti squash
1040	fennel seeds
1041	dry vermouth
1042	apple jelly
1043	champagne vinegar
1044	horseradish
1045	extravirgin olive oil
1046	thai red curry paste
1047	fat-free less-sodium chicken broth
1048	honey dijon mustard
1049	sesame
1050	parsnips
1051	safflower oil
1052	tamari
1053	salmon filet
1054	grape tomatoes
1055	fruit pectin
1056	vanilla ice cream
1057	orange extract
1058	tang
1059	aioli
1060	navel orange
1061	ice cubes
1062	grand marnier
1063	mild cheddar cheese
1064	sparkling wine
1065	cranberry juice
1066	apple cider
1067	pork tenderloin
1068	cranberry juice cocktail
1069	cointreau
1070	canned chipotle pepper
1071	whisky
1072	coffee
1073	orange peel
1074	demerara sugar
1075	avocado oil
1076	grapefruits
1077	sea bass
1078	angostura bitters
1079	rum
1080	cream soda
1081	sugar cube
1082	soda water
1083	maraschino cherries
1084	beet greens
1085	pomegranate juice
1086	red leaf lettuce
1087	blue 1
1088	hazelnut liqueur
1089	mangoes
1090	cup cake
1091	sugar-free jam
1092	vanilla pod
1093	mackerel
1094	sherry
1095	campari
1096	rhubarb
1097	sparkling water
1098	maraschino syrup
1099	apricot preserves
1100	green cardamom pods
1101	grapefruit juice
1102	lillet blanc
1103	frozen cranberry juice concentrate
1104	club soda
1105	tomatillos
1106	jicama
1107	turbinado sugar
1108	sea scallops
1109	sweetened coconut
1110	powdered sugar
1111	oil cured black olives
1112	almond flour
1113	gin
1114	vermouth
1115	rose hips
1116	baby cut carrots
1117	berry
1118	walnut pieces
1119	stilton
1120	walnut oil
1121	mounds candy bar
1122	cake mix
1123	lemon flavored gelatin
1124	scotch whisky
1125	shredded coconut
1126	confectioners' sugar
1127	cantaloupe
1128	mixed berries
1129	stevia
1130	canned mandarin oranges
1131	ground mustard
1132	hard-boiled eggs
1133	salt cod
1134	golden caster sugar
1135	dark chocolate
1136	whiskey
1137	raspberry jam
1138	raspberry
1139	iced tea
1140	heavy whipping cream
1141	strong coffee
1142	agave
1143	ground flax seed
1144	superfine sugar
1145	bittersweet chocolate
1146	almond milk
1147	elderflower
1148	no calorie sweetener
1149	cherry gelatin
1150	blood orange
1151	peach nectar
1152	molasses
1153	cereal
1154	chocolate soy pudding
1155	almond butter
1156	dairy free margarine
1157	toppings
1158	soy milk
1159	cocoa powder
1160	honey sticks
1161	whipped topping
1162	smooth peanut butter
1163	medjool dates
1164	old fashion doughnuts
1165	low fat milk
1166	vanilla essence
1167	salted butter
1168	dark chocolate chips
1169	chocolate chips
1170	pancake and waffle mix
1171	vanilla pudding mix
1172	nilla wafers
1173	chocolate hazelnut spread
1174	roasted nuts
1175	strawberry yogurt
1176	soymilk
1177	whole wheat bread
1178	curly parsley
1179	double cream
1180	cardamom powder
1181	as needed
1182	gluten free refrigerated pie crusts
1183	almond
1184	desired toppings
1185	egg roll wrappers
1186	nutella
1187	bisquick
1188	sturdy straws
1189	margarine
1190	coffee cake mix
1191	cinnamon sugar
1192	unsweetened shredded coconut
1193	semi-sweet chocolate
1194	cocoa krispies cereal
1195	ripe bananas
1196	snickers chocolate bar
1197	unsweetened coconut
1198	cocoa
1199	white bread
1200	sweetened condensed milk
1201	granola cereal
1202	frangelico
1203	malt drink mix
1204	plain nonfat yogurt
1205	whole wheat flour
1206	ice cube
1207	light coconut milk
1208	tapioca
1209	crepes
1210	active yeast
1211	whole wheat pastry flour
1212	unbleached flour
1213	soy flour
1214	special: skewers
1215	preserves
1216	shredded pork
1217	flank steak
1218	gorgonzola
1219	asiago cheese
1220	fusilli
1221	cannellini beans
1222	cooked cavatappi
1223	tamari soy sauce
1224	dandelion greens
1225	white whole wheat flour
1226	elk fillet
1227	fontina cheese
1228	sundried tomato halves
1229	sun-dried tomatoes
1230	wheat germ
1231	provolone cheese
1232	tangerines
1233	rustic bread
1234	gouda cheese
1235	pesto sauce
1236	sun dried tomatoes
1237	gruyere cheese
1238	olive tapenade
1239	orecchiette
1240	gorgonzola cheese
1241	chicharon
1242	munggo
1243	chicken thighs
1244	low-salt chicken broth
1245	lime wedge
1246	hummus
1247	muffin mix
1248	chicken breasts
1249	italian seasoned breadcrumbs
1250	sherry vinegar
1251	sweet italian sausage
1252	pumpkin seeds
1253	beetroot
1254	skinless boneless chicken thighs
1255	kaiser rolls
1256	portobello mushroom caps
1257	vegetable bouillon cubes
1258	refrigerated cheese tortellini
1259	chorizo
1260	canned white beans
1261	extra firm tofu
1262	Chevre
1263	chorizo sausage
1264	white button mushrooms
1265	pecan pieces
1266	white mushrooms
1267	short pasta
1268	mozzarella
1269	tabasco
1270	flax seed meal
1271	soumbala
1272	sardines
1273	penne pasta
1274	in a can
1275	steak
1276	ranch salad dressing
1277	nut blend
1278	optional
1279	free range eggs
1280	navel oranges
1281	ranch dressing mix
1282	bone-in chicken thighs
1283	spice blend
1284	cream cheese spread
1285	flat bread
1286	whole cranberry sauce
1287	shredded cheese
1288	elk sausages
1289	goji berries
1290	balsamic vinaigrette
1291	sprouted grain bread
1292	ditalini
1293	fresh bread crumbs
1294	fat-free vanilla yogurt
1295	low-fat cream cheese
1296	pizza sauce
1297	shell pasta
1298	soba noodles
1299	white corn grits
1300	bun
1301	condensed french onion soup
1302	protein powder
1303	shredded mozzarella
1304	tortilla wrap
1305	chicken breast meat
1306	agave nectar
1307	baby spinach leaves
1308	red miso
1309	edamame
1310	bean sprouts
1311	shiitake mushrooms
1312	korean chile
1313	broccoli florets
1314	chicory
1315	spiral pasta
1316	brussels sprouts
1317	stevia extract
1318	unsweetened coconut milk
1319	handfuls
1320	sesame seed
1321	dashi
1322	brown rice
1323	doenjang
1324	aleppo
1325	Miso Soybean Paste
1326	ear corn
1327	jumbo shells
1328	marinara sauce
1329	firm tofu
1330	sherry wine vinegar
1331	dried currants
1332	sake
1333	mung bean sprouts
1334	bird's eye chilis
1335	udon noodles
1336	bird's eye chili pepper
1337	wonton wrappers
1338	ginger garlic paste
1339	broad beans
1340	ciabatta bread
1341	pink himalayan salt
1342	both
1343	ground szechuan peppercorns
1344	thai chili pepper
1345	cayenne
1346	ground fennel
1347	granulated garlic
1348	bragg's liquid aminos
1349	egg vermicelli
1350	english cucumber
1351	japanese eggplant
1352	yellow curry paste
1353	soy cheese
1354	light-brown sugar
1355	whole-wheat spaghetti
1356	soya sauce
1357	spring onion
1358	fresh coriander leaves
1359	tart apple
1360	romaine hearts
1361	wasabi powder
1362	rice wine vinegar
1363	light olive oil
1364	natural cane sugar
1365	unsweetened cocoa powder
1366	daikon
1367	kombu
1368	dried sage
1369	dried dill
1370	seasoned rice vinegar
1371	chile garlic sauce
1372	filo dough
1373	vegetable stock cube
1374	red-skinned sweet potato
1375	fresh gingerroot
1376	Ener-G egg replacer
1377	raw sugar
1378	dry mustard
1379	baby carrots
1380	veganaise
1381	vegan margarine
1382	scallion greens
1383	lechon kawali
1384	ponzu sauce
1385	fresh bean sprouts
1386	seasoned bread crumbs
1387	cashews
1388	potato starch
1389	peanut
1390	egg noodles
1391	red curry paste
1392	lite coconut milk
1393	bok choy
1394	cane sugar
1395	chili oil
1396	sesame seed paste
1397	ramen noodles
1398	braggs liquid aminos
1399	lower sodium shoyu
1400	linguine
1401	green apple
1402	coconut water
1403	green grapes
1404	filtered water
1405	liquid stevia
1406	nutritional yeast
1407	mandarin orange segments
1408	hemp seeds
1409	red delicious apple
1410	ginger juice
1411	sweetened dried cranberries
1412	bartlett pear
1413	sunflower seeds
1414	ancho chile powder
1415	dried fava beans
1416	pinenuts
1417	raw pumpkin seeds
1418	white rum
1419	rye ipa
1420	craisins
1421	dulse
1422	celtic sea salt
1423	rice milk
1424	purple potatoes
1425	green apples
1426	great northern beans
1427	dried sweet cherries
1428	aged balsamic vinegar
1429	kumquats
1430	farro
1431	unsweetened flake coconut
1432	ground flaxseed
1433	wheat berries
1434	red chili flakes
1435	tahini paste
1436	garbanzo beans
1437	dried onion flakes
1438	grape
1439	cauliflower rice
1440	unrefined sugar
1441	flax
1442	flax seeds
1443	vegan mayonnaise
1444	summer squash
1445	fine grain sea salt
1446	fresh rosemary leaves
1447	unsalted pistachios
1448	kiwi
1449	endive
1450	pink grapefruit
1451	naturally
1452	canteloupe
1453	cooked brown rice
1454	pizza dough
1455	le roulé garlic and herb cheese
1456	macaroni
1457	mixed vegetables
1458	brown lentils
1459	palm sugar
1460	urad dal
1461	expeller pressed canola oil
1462	button mushrooms
1463	shao xing
1464	white cabbage
1465	cheese tortellini
1466	fenugreek seeds
1467	oil to apply to the idli moulds
1468	quick cooking barley
1469	pistachio nuts
1470	water chestnuts
1471	rock salt
1472	virgin olive oil
1473	cauliflower florets
1474	whole wheat pasta
1475	alfredo sauce
1476	dried adzuki beans
1477	chestnut mushrooms
1478	goats cheese
1479	tinapang bangus
1480	steranis
1481	pre-cooked farro
1482	furikake
1483	gyudon
1484	romaine
1485	marinated artichoke hearts
1486	dried shiitake mushrooms
1487	jaggery
1488	caesar salad dressing
1489	ears sweet corn
1490	lemon-pepper seasoning
1491	vegetable bouillon cube
1492	courgette
1493	coconut milk beverage
1494	black eyed beans
1495	onion salt
1496	high gluten flour
1497	single serve tea
1498	granola
1499	rice syrup
1500	better than bullion
1501	cremini mushrooms
1502	wild rice
1503	polenta
1504	marcela
1505	hot sauce
1506	as required
1507	TSP
1508	barley
1509	mixed salad greens
1510	dried basil leaves
1511	to 6
1512	escarole
\.


--
-- Name: ingredients_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('ingredients_ingredient_id_seq', 1512, true);


--
-- Data for Name: recipe_diets; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY recipe_diets (recipe_diet_id, recipe_id, diet_code) FROM stdin;
1	475433	a
2	33119	a
3	156006	a
4	197005	a
5	213397	a
6	74166	a
7	164332	a
8	74225	a
9	74407	a
10	25369	a
11	189301	a
12	549859	a
13	418827	a
14	164950	a
15	115813	a
16	107667	a
17	484691	a
18	116208	a
19	108340	a
20	517989	a
21	526278	a
22	526548	a
23	477720	a
24	395808	a
25	125529	a
27	84694	a
28	510892	a
29	478222	a
30	167036	a
33	290013	a
34	511195	a
35	478432	a
36	445704	a
37	519514	a
38	273991	a
39	257899	a
40	20418	a
41	159714	a
42	643114	a
43	200784	a
44	274643	a
45	28891	a
46	471483	a
47	45703	a
48	299722	a
49	496462	a
50	611209	a
51	521148	a
52	619512	a
53	5116	a
54	521279	a
55	537708	a
56	275627	a
57	619703	a
58	365791	a
59	292273	a
60	382457	a
61	136838	a
62	120580	a
63	489236	a
64	530277	a
65	38830	a
66	38840	a
67	137151	a
68	38847	a
71	137203	a
72	481267	a
73	137287	a
74	292972	a
75	96394	a
76	506548	a
77	580342	a
78	170862	a
79	220041	a
80	187337	a
81	39977	a
82	130140	a
83	171114	a
84	138490	a
86	32104	a
87	163179	a
88	122256	a
89	32316	a
90	303132	a
91	139296	a
92	286759	a
93	172081	a
94	499805	a
95	164057	a
96	172277	a
98	115016	a
99	434643	a
100	478622	a
101	204207	a
102	91665	a
103	10015	a
104	10049	a
105	401266	a
106	3962	a
107	298934	a
108	417788	a
109	116737	a
110	602196	a
111	290906	a
112	608393	a
114	82263	a
115	82262	a
116	522587	a
117	598373	a
118	215410	a
119	526709	a
120	35219	a
121	133555	a
122	541207	a
123	520797	a
124	520803	a
125	246381	a
126	367226	a
127	17057	a
128	213670	a
129	522969	a
130	322325	a
131	4928	a
132	484216	a
133	478098	a
134	478159	a
135	521187	a
136	478227	a
137	187487	a
138	523370	a
139	107643	a
140	478349	a
141	203978	a
142	11501	a
143	11563	a
144	509280	a
145	583101	a
146	212453	a
147	556537	a
148	97791	a
149	226838	a
150	26215	a
151	521938	a
152	347907	a
153	210792	a
154	616391	a
155	522193	a
156	565284	a
157	106561	a
158	22616	a
159	36997	a
160	106665	a
161	567461	a
162	37069	a
163	145647	a
164	143626	a
165	16665	a
166	203052	a
167	45392	a
168	113032	a
169	143778	a
170	647656	a
171	520701	a
172	551453	a
173	522816	a
174	492226	a
175	246503	a
176	146280	a
177	437120	a
178	220036	a
179	146318	a
180	447384	a
181	588717	a
182	478122	a
183	119823	a
184	599085	a
185	146476	a
186	640050	a
187	144528	a
188	17619	a
189	249076	a
190	568618	a
191	243067	a
192	615855	a
193	157207	a
195	93848	a
196	304822	a
197	212766	a
198	40736	a
199	97660	a
200	381354	a
201	15803	a
202	22997	a
203	15840	a
204	95712	a
205	97768	a
206	220681	a
207	97889	a
208	56929	a
209	311906	a
210	91849	a
211	98037	a
212	98079	a
213	98094	a
214	98114	a
215	213830	a
216	34656	a
217	92065	a
218	97215	a
219	337917	a
220	97310	a
221	97339	a
222	16459	a
223	200786	a
224	541891	a
225	97539	a
226	97614	a
227	15725	a
229	525822	a
231	97849	a
232	97852	a
233	97874	a
234	97908	a
235	97920	a
236	16028	a
237	220839	a
238	247521	a
239	96999	a
240	36615	a
241	98084	a
242	98110	a
243	98123	a
244	97109	a
245	16229	a
246	98173	a
247	207782	a
248	16359	a
249	649184	a
250	517174	a
251	97334	a
252	97349	a
253	97385	a
254	97435	a
255	144563	a
256	203969	a
257	97490	a
258	498917	a
259	22811	a
260	97598	a
261	155969	a
262	322946	a
263	97694	a
264	93673	a
266	582163	a
267	520854	a
268	206488	a
269	92860	a
270	97004	a
271	71493	a
272	188240	a
273	321361	a
274	98159	a
275	205788	a
276	97270	a
277	51195	a
278	8269	a
279	185480	a
280	149673	a
281	649403	a
282	618731	a
283	97508	a
284	97561	a
285	97576	a
286	97632	a
287	30052	a
288	97686	a
289	97728	a
290	97742	a
291	3586	a
292	207390	a
293	222818	a
294	97902	a
295	48754	a
296	97959	a
297	35604	a
298	224086	a
299	543678	a
300	150558	a
301	7227	a
302	171180	a
303	269549	a
304	7409	a
305	7422	a
306	494926	a
307	425376	a
308	511402	a
309	85458	a
310	429543	a
311	85611	a
312	511608	a
313	298642	a
314	478994	a
315	122675	a
316	360252	a
317	470849	a
318	516047	a
319	85980	a
320	90097	a
321	90096	a
322	90122	a
323	438371	a
324	224	a
325	430322	a
326	49408	a
327	618816	a
328	213356	a
329	45474	a
330	49592	a
331	541196	a
332	197226	a
333	524936	a
335	4970	a
336	949	a
337	242821	a
338	1162	a
339	99568	a
340	120056	a
341	144792	a
342	181790	a
343	542301	a
344	1624	a
345	484978	a
346	1678	a
347	202583	a
348	173956	a
349	600042	a
350	161761	a
351	51177	a
352	649262	a
353	411811	a
354	157957	a
355	403725	a
356	276766	a
357	423933	a
358	88073	a
359	88186	a
360	88243	a
361	88269	a
363	88361	a
364	522581	a
365	629215	a
366	629492	a
368	367482	a
369	162735	a
370	23639	a
371	654435	a
372	580860	a
373	7665	a
374	302602	a
375	499271	a
376	589379	a
377	228971	a
378	212768	a
380	196	a
381	598233	a
382	401676	a
383	33059	a
384	450	a
385	25110	a
386	17085	a
387	8915	a
388	8931	a
389	599196	a
390	214240	a
391	591129	a
392	304491	a
393	550306	a
394	1454	a
395	157206	a
396	247371	a
397	575123	a
398	599862	a
399	313370	a
400	559309	a
401	149766	a
402	379151	a
403	493889	a
404	494005	a
405	346939	a
406	19307	a
407	273352	a
408	44046	a
409	658483	a
410	576717	a
411	593095	a
412	85230	a
413	85241	a
414	290093	a
415	85405	a
416	85442	a
417	683484	a
418	85464	a
419	85505	a
420	667231	a
421	487020	a
422	85822	a
423	593806	a
424	716674	a
425	602041	a
426	4165	a
428	176439	a
429	4429	a
430	4448	a
431	4507	a
432	4514	a
433	4519	a
435	4534	a
436	4584	a
437	4627	a
438	4654	a
439	4672	a
440	324170	a
441	4705	a
442	4713	a
443	4720	a
444	4728	a
445	4729	a
446	4747	a
447	4753	a
448	4775	a
449	86715	a
450	594615	a
451	4809	a
452	4825	a
453	86760	a
454	4845	a
455	761087	vg
456	761087	v
457	761087	a
458	400681	vg
459	400681	v
460	400681	a
461	204260	vg
462	204260	v
463	204260	a
464	409081	a
465	581314	v
466	581314	a
467	524051	vg
468	524051	v
469	524051	a
471	147323	vg
472	147323	v
473	147323	a
474	524156	vg
475	524156	v
476	524156	a
477	368584	a
478	508029	vg
479	508029	v
480	508029	a
481	172186	v
482	172186	a
483	278737	vg
484	278737	v
485	278737	a
486	246022	v
487	246022	a
488	41221	vg
489	41221	v
490	41221	a
491	41275	vg
492	41275	v
493	41275	a
494	41340	v
495	41340	a
496	483797	vg
497	483797	v
498	483797	a
499	287186	vg
500	287186	v
501	287186	a
502	532984	a
503	197176	vg
504	197176	v
505	197176	a
506	205606	vg
507	205606	v
508	205606	a
509	107321	v
510	107321	a
511	615246	vg
512	615246	v
513	615246	a
514	870	a
515	148421	vg
516	148421	v
517	148421	a
518	623598	vg
519	623598	v
520	623598	a
521	140297	vg
522	140297	v
523	140297	a
524	123924	vg
525	123924	v
526	123924	a
527	541736	vg
528	541736	v
529	541736	a
530	140357	v
531	140357	a
532	189529	vg
533	189529	v
534	189529	a
535	492696	vg
536	492696	v
537	492696	a
538	369858	a
539	58572	vg
540	58572	v
541	58572	a
542	402718	a
543	75056	vg
544	75056	v
545	75056	a
546	83295	a
547	1456	a
548	493059	vg
549	493059	v
550	493059	a
551	419336	vg
552	419336	v
553	419336	a
554	353842	vg
555	353842	v
556	353842	a
557	337469	a
558	91709	vg
559	91709	v
560	91709	a
561	165624	vg
562	165624	v
563	165624	a
564	141130	v
565	141130	a
566	141144	vg
567	141144	v
568	141144	a
569	173932	vg
570	173932	v
571	173932	a
572	26507	vg
573	26507	v
574	26507	a
575	42931	vg
576	42931	v
577	42931	a
578	51124	vg
579	51124	v
580	51124	a
581	18423	a
582	206875	v
583	206875	a
584	206895	vg
585	206895	v
586	206895	a
587	624777	vg
588	624777	v
589	624777	a
590	542867	v
591	542867	a
592	207005	vg
593	207005	v
594	207005	a
595	215283	vg
596	215283	v
597	215283	a
598	174323	v
599	174323	a
600	215291	a
601	518510	vg
602	518510	v
603	518510	a
604	420245	v
605	420245	a
606	600466	a
607	207263	vg
608	207263	v
609	207263	a
610	264663	a
611	485916	v
612	485916	a
613	436881	vg
614	436881	v
615	436881	a
616	584396	vg
617	584396	v
618	584396	a
619	125714	vg
620	125714	v
621	125714	a
622	215865	v
623	215865	a
624	510801	vg
625	510801	v
626	510801	a
627	527244	vg
628	527244	v
629	527244	a
630	175000	a
631	84947	a
632	617434	vg
633	617434	v
634	617434	a
636	44030	vg
637	44030	v
638	44030	a
639	216185	v
640	216185	a
641	322694	vg
642	322694	v
643	322694	a
644	126142	vg
645	126142	v
646	126142	a
647	388326	a
648	593156	vg
649	593156	v
650	593156	a
651	159020	vg
652	159020	v
653	159020	a
654	396602	v
655	396602	a
656	544075	vg
657	544075	v
658	544075	a
659	281947	vg
660	281947	v
661	281947	a
662	527715	vg
663	527715	v
664	527715	a
666	44517	vg
667	44517	v
668	44517	a
669	437739	vg
670	437739	v
671	437739	a
672	249351	vg
673	249351	v
674	249351	a
675	626236	vg
676	626236	v
677	626236	a
678	249441	a
679	3714	vg
680	3714	v
681	3714	a
682	667304	vg
683	667304	v
684	667304	a
685	224936	v
686	224936	a
687	503510	a
688	126760	vg
689	126760	v
690	126760	a
691	233262	vg
692	233262	v
693	233262	a
694	126773	a
695	511572	vg
696	511572	v
697	511572	a
698	544360	vg
699	544360	v
700	544360	a
701	167540	v
702	167540	a
703	282237	vg
704	282237	v
705	282237	a
706	249481	vg
707	249481	v
708	249481	a
709	544410	vg
710	544410	v
711	544410	a
712	249496	vg
713	249496	v
714	249496	a
715	446178	a
716	511860	a
717	544638	vg
718	544638	v
719	544638	a
720	610209	vg
721	610209	v
722	610209	a
723	200715	v
724	200715	a
725	102457	vg
726	102457	v
727	102457	a
728	282712	a
729	529010	v
730	529010	a
731	414401	vg
732	414401	v
733	414401	a
734	627406	a
735	529156	vg
736	529156	v
737	529156	a
738	250761	v
739	250761	a
740	54208	vg
741	54208	v
742	54208	a
743	578594	v
744	578594	a
745	611447	a
746	529558	a
747	349428	a
748	267575	vg
749	267575	v
750	267575	a
751	578977	vg
752	578977	v
753	578977	a
754	267748	a
755	759354	vg
756	759354	v
757	759354	a
760	579424	v
761	579424	a
762	579441	v
763	579441	a
764	169959	vg
765	169959	v
766	169959	a
767	186429	vg
768	186429	v
769	186429	a
770	268380	vg
771	268380	v
772	268380	a
773	219247	a
774	596146	vg
775	596146	v
776	596146	a
777	596192	vg
778	596192	v
779	596192	a
780	596249	vg
781	596249	v
782	596249	a
783	203161	v
784	203161	a
785	580034	v
786	580034	a
787	285205	a
788	350764	a
789	72327	v
790	72327	a
794	646426	a
795	269782	vg
796	269782	v
797	269782	a
798	171590	v
799	171590	a
800	515692	v
801	515692	a
802	483059	a
803	483082	a
804	155425	vg
805	155425	v
806	155425	a
807	597847	v
808	597847	a
809	515973	a
810	630732	v
811	630732	a
812	483336	a
813	549020	v
814	549020	a
815	549115	v
816	549115	a
817	762137	vg
818	762137	v
819	762137	a
820	123348	vg
821	123348	v
822	123348	a
823	565730	v
824	565730	a
825	549368	a
826	483917	v
827	483917	a
828	270968	a
829	189174	vg
830	189174	v
831	189174	a
834	598996	v
835	598996	a
836	484460	a
837	304363	vg
838	304363	v
839	304363	a
840	566721	vg
841	566721	v
842	566721	a
843	550536	vg
844	550536	v
845	550536	a
846	665469	a
847	387100	vg
848	387100	v
849	387100	a
850	124985	v
851	124985	a
852	124996	a
853	125011	v
854	125011	a
855	485471	a
856	125018	v
857	125018	a
858	125033	v
859	125033	a
860	125041	v
861	125041	a
862	125064	a
863	125090	v
864	125090	a
865	125103	vg
866	125103	v
867	125103	a
868	125145	v
869	125145	a
870	125175	v
871	125175	a
872	125187	vg
873	125187	v
874	125187	a
875	125209	v
876	125209	a
877	125234	v
878	125234	a
879	125297	vg
880	125297	v
881	125297	a
882	125310	v
883	125310	a
884	125325	v
885	125325	a
886	125349	vg
887	125349	v
888	125349	a
889	125384	a
890	125403	vg
891	125403	v
892	125403	a
893	125436	vg
894	125436	v
895	125436	a
898	157418	vg
899	157418	v
900	157418	a
901	485135	a
902	247611	v
903	247611	a
904	510004	v
905	510004	a
906	329850	a
907	542863	v
908	542863	a
909	100668	a
910	624990	a
911	362866	v
912	362866	a
913	584084	vg
914	584084	v
915	584084	a
916	158169	a
917	543214	v
918	543214	a
919	223755	a
920	584240	a
921	27230	v
922	27230	a
923	289432	vg
924	289432	v
925	289432	a
926	166559	v
927	166559	a
928	19220	v
929	19220	a
932	322387	v
933	322387	a
934	609110	v
935	609110	a
936	19299	a
937	617473	vg
938	617473	v
939	617473	a
940	601088	a
941	19486	v
942	19486	a
943	478242	vg
944	478242	v
945	478242	a
946	248872	v
947	248872	a
948	568359	a
949	101432	a
950	27706	v
951	27706	a
952	617553	a
953	101464	a
954	19549	a
955	19582	a
956	19584	a
957	576665	a
958	19693	vg
959	19693	v
960	19693	a
961	216328	a
962	19729	vg
963	19729	v
964	19729	a
965	380187	v
966	380187	a
967	265576	a
968	19830	a
970	175502	vg
971	175502	v
972	175502	a
973	19883	a
974	306613	vg
975	306613	v
976	306613	a
977	19896	v
978	19896	a
979	527829	a
980	757327	vg
981	757327	v
982	757327	a
983	609905	v
984	609905	a
985	609970	v
986	609970	a
987	364310	a
988	593797	a
989	626595	a
990	577563	v
991	577563	a
992	28795	a
993	553104	v
994	553104	a
995	512190	v
996	512190	a
997	553160	a
998	4390	a
999	487712	v
1000	487712	a
1001	553297	a
1002	471420	a
1003	176512	vg
1004	176512	v
1005	176512	a
1006	78273	v
1007	78273	a
1008	78355	v
1009	78355	a
1010	668224	v
1011	668224	a
1012	275055	v
1013	275055	a
1014	266886	a
1015	78584	a
1016	512812	a
1017	521029	vg
1018	521029	v
1019	521029	a
1020	95073	v
1021	95073	a
1022	619685	a
1023	521394	a
1024	627928	a
1025	619744	v
1026	619744	a
1027	267539	vg
1028	267539	v
1029	267539	a
1030	529745	a
1031	562597	vg
1032	562597	v
1033	562597	a
1034	489029	a
1035	489033	vg
1036	489033	v
1037	489033	a
1038	530108	v
1039	530108	a
1040	661259	a
1041	587539	a
1042	423876	v
1043	423876	a
1044	14335	v
1045	14335	a
1046	227365	a
1047	202812	a
1048	219209	a
1049	301215	a
1050	497879	vg
1051	497879	v
1052	497879	a
1053	31003	vg
1054	31003	v
1055	31003	a
1056	579984	v
1057	579984	a
1058	506269	a
1059	506288	a
1060	620981	a
1061	506316	a
1062	758032	vg
1063	758032	v
1064	758032	a
1065	80201	vg
1066	80201	v
1067	80201	a
1068	350565	vg
1069	350565	v
1070	350565	a
1071	207201	vg
1072	207201	v
1073	207201	a
1074	207206	vg
1075	207206	v
1076	207206	a
1077	760162	vg
1078	760162	v
1079	760162	a
1080	18863	vg
1081	18863	v
1082	18863	a
1083	424378	vg
1084	424378	v
1085	424378	a
1086	602619	vg
1087	602619	v
1088	602619	a
1089	37402	vg
1090	37402	v
1091	37402	a
1092	143910	vg
1093	143910	v
1094	143910	a
1095	522811	vg
1096	522811	v
1097	522811	a
1098	143954	vg
1099	143954	v
1100	143954	a
1101	516710	vg
1102	516710	v
1103	516710	a
1104	37483	vg
1105	37483	v
1106	37483	a
1107	287348	vg
1108	287348	v
1109	287348	a
1110	582299	vg
1111	582299	v
1112	582299	a
1113	60102	vg
1114	60102	v
1115	60102	a
1116	150237	vg
1117	150237	v
1118	150237	a
1119	500511	vg
1120	500511	v
1121	500511	a
1122	514870	vg
1123	514870	v
1124	514870	a
1125	56231	vg
1126	56231	v
1127	56231	a
1128	478124	vg
1129	478124	v
1130	478124	a
1131	478137	vg
1132	478137	v
1133	478137	a
1134	478199	vg
1135	478199	v
1136	478199	a
1137	189475	vg
1138	189475	v
1139	189475	a
1140	451692	vg
1141	451692	v
1142	451692	a
1143	21626	vg
1144	21626	v
1145	21626	a
1146	543882	vg
1147	543882	v
1148	543882	a
1149	486541	vg
1150	486541	v
1151	486541	a
1152	478414	vg
1153	478414	v
1154	478414	a
1155	478410	vg
1156	478410	v
1157	478410	a
1158	310553	vg
1159	310553	v
1160	310553	a
1161	540001	vg
1162	540001	v
1163	540001	a
1164	13864	vg
1165	13864	v
1166	13864	a
1167	470619	vg
1168	470619	v
1169	470619	a
1170	11909	vg
1171	11909	v
1172	11909	a
1173	9912	vg
1174	9912	v
1175	9912	a
1176	32463	vg
1177	32463	v
1178	32463	a
1179	521985	vg
1180	521985	v
1181	521985	a
1182	112479	vg
1183	112479	v
1184	112479	a
1185	522135	vg
1186	522135	v
1187	522135	a
1188	38843	vg
1189	38843	v
1190	38843	a
1191	143339	vg
1192	143339	v
1193	143339	a
1194	143435	vg
1195	143435	v
1196	143435	a
1197	761951	vg
1198	761951	v
1199	761951	a
1200	370822	vg
1201	370822	v
1202	370822	a
1203	762000	vg
1204	762000	v
1205	762000	a
1206	659604	vg
1207	659604	v
1208	659604	a
1209	37023	vg
1210	37023	v
1211	37023	a
1212	118962	vg
1213	118962	v
1214	118962	a
1215	96473	vg
1216	96473	v
1217	96473	a
1218	16601	vg
1219	16601	v
1220	16601	a
1221	762068	vg
1222	762068	v
1223	762068	a
1224	618722	vg
1225	618722	v
1226	618722	a
1227	22798	vg
1228	22798	v
1229	22798	a
1230	80157	vg
1231	80157	v
1232	80157	a
1233	110961	vg
1234	110961	v
1235	110961	a
1236	760214	vg
1237	760214	v
1238	760214	a
1239	102853	vg
1240	102853	v
1241	102853	a
1242	137692	vg
1243	137692	v
1244	137692	a
1245	205281	vg
1246	205281	v
1247	205281	a
1248	14824	vg
1249	14824	v
1250	14824	a
1251	481770	vg
1252	481770	v
1253	481770	a
1254	10778	vg
1255	10778	v
1256	10778	a
1257	170527	vg
1258	170527	v
1259	170527	a
1260	119382	vg
1261	119382	v
1262	119382	a
1263	660067	vg
1264	660067	v
1265	660067	a
1269	27284	vg
1270	27284	v
1271	27284	a
1272	14999	vg
1273	14999	v
1274	14999	a
1275	424601	vg
1276	424601	v
1277	424601	a
1278	250533	vg
1279	250533	v
1280	250533	a
1281	262853	vg
1282	262853	v
1283	262853	a
1284	543463	vg
1285	543463	v
1286	543463	a
1287	35597	vg
1288	35597	v
1289	35597	a
1290	21453	vg
1291	21453	v
1292	21453	a
1293	121843	vg
1294	121843	v
1295	121843	a
1296	15357	vg
1297	15357	v
1298	15357	a
1299	478291	vg
1300	478291	v
1301	478291	a
1302	760933	vg
1303	760933	v
1304	760933	a
1305	478330	vg
1306	478330	v
1307	478330	a
1308	478370	vg
1309	478370	v
1310	478370	a
1314	17773	vg
1315	17773	v
1316	17773	a
1317	478584	vg
1318	478584	v
1319	478584	a
1320	105880	vg
1321	105880	v
1322	105880	a
1323	761301	vg
1324	761301	v
1325	761301	a
1326	114160	vg
1327	114160	v
1328	114160	a
1329	624139	vg
1330	624139	v
1331	624139	a
1332	222803	vg
1333	222803	v
1334	222803	a
1338	620332	vg
1339	620332	v
1340	620332	a
1341	495516	vg
1342	495516	v
1343	495516	a
1344	14265	vg
1345	14265	v
1346	14265	a
1347	92091	vg
1348	92091	v
1349	92091	a
1350	18383	vg
1351	18383	v
1352	18383	a
1353	200703	vg
1354	200703	v
1355	200703	a
1356	653322	vg
1357	653322	v
1358	653322	a
1359	641057	vg
1360	641057	v
1361	641057	a
1362	552202	vg
1363	552202	v
1364	552202	a
1365	15628	vg
1366	15628	v
1367	15628	a
1368	507177	vg
1369	507177	v
1370	507177	a
1371	560600	vg
1372	560600	v
1373	560600	a
1374	286168	vg
1375	286168	v
1376	286168	a
1377	527883	vg
1378	527883	v
1379	527883	a
1380	618083	vg
1381	618083	v
1382	618083	a
1383	609907	vg
1384	609907	v
1385	609907	a
1386	573057	vg
1387	573057	v
1388	573057	a
1389	544388	vg
1390	544388	v
1391	544388	a
1392	609926	vg
1393	609926	v
1394	609926	a
1395	524038	vg
1396	524038	v
1397	524038	a
1398	544620	vg
1399	544620	v
1400	544620	a
1401	626641	vg
1402	626641	v
1403	626641	a
1404	524262	vg
1405	524262	v
1406	524262	a
1407	524326	vg
1408	524326	v
1409	524326	a
1410	626747	vg
1411	626747	v
1412	626747	a
1413	573683	vg
1414	573683	v
1415	573683	a
1416	573713	vg
1417	573713	v
1418	573713	a
1419	557362	vg
1420	557362	v
1421	557362	a
1422	758114	vg
1423	758114	v
1424	758114	a
1425	500244	vg
1426	500244	v
1427	500244	a
1428	721437	vg
1429	721437	v
1430	721437	a
1431	762412	vg
1432	762412	v
1433	762412	a
1434	373375	vg
1435	373375	v
1436	373375	a
1437	660108	vg
1438	660108	v
1439	660108	a
1440	205460	vg
1441	205460	v
1442	205460	a
1443	512669	vg
1444	512669	v
1445	512669	a
1446	537238	vg
1447	537238	v
1448	537238	a
1449	516844	vg
1450	516844	v
1451	516844	a
1452	533222	vg
1453	533222	v
1454	533222	a
1455	758513	vg
1456	758513	v
1457	758513	a
1458	627519	vg
1459	627519	v
1460	627519	a
1461	602969	vg
1462	602969	v
1463	602969	a
1464	13196	vg
1465	13196	v
1466	13196	a
1467	95138	vg
1468	95138	v
1469	95138	a
1470	304127	vg
1471	304127	v
1472	304127	a
1473	619542	vg
1474	619542	v
1475	619542	a
1476	628033	vg
1477	628033	v
1478	628033	a
1479	619940	vg
1480	619940	v
1481	619940	a
1482	611773	vg
1483	611773	v
1484	611773	a
1485	398788	vg
1486	398788	v
1487	398788	a
1488	615902	vg
1489	615902	v
1490	615902	a
1491	521800	vg
1492	521800	v
1493	521800	a
1494	149107	vg
1495	149107	v
1496	149107	a
1497	149117	vg
1498	149117	v
1499	149117	a
1500	497294	vg
1501	497294	v
1502	497294	a
1503	157343	vg
1504	157343	v
1505	157343	a
1506	251657	vg
1507	251657	v
1508	251657	a
1509	522029	vg
1510	522029	v
1511	522029	a
1512	473051	vg
1513	473051	v
1514	473051	a
1515	559063	vg
1516	559063	v
1517	559063	a
1518	759851	vg
1519	759851	v
1520	759851	a
1521	604203	vg
1522	604203	v
1523	604203	a
1524	608417	vg
1525	608417	v
1526	608417	a
1527	760020	vg
1528	760020	v
1529	760020	a
1530	555476	vg
1531	555476	v
1532	555476	a
1533	506377	vg
1534	506377	v
1535	506377	a
1536	14869	vg
1537	14869	v
1538	14869	a
1539	14874	vg
1540	14874	v
1541	14874	a
1542	14889	vg
1543	14889	v
1544	14889	a
1545	14892	vg
1546	14892	v
1547	14892	a
1548	14929	vg
1549	14929	v
1550	14929	a
1551	14942	vg
1552	14942	v
1553	14942	a
1554	14991	vg
1555	14991	v
1556	14991	a
1557	14996	vg
1558	14996	v
1559	14996	a
1560	15006	vg
1561	15006	v
1562	15006	a
1563	15010	vg
1564	15010	v
1565	15010	a
1566	15011	vg
1567	15011	v
1568	15011	a
1569	15030	vg
1570	15030	v
1571	15030	a
1572	96955	vg
1573	96955	v
1574	96955	a
1575	608948	vg
1576	608948	v
1577	608948	a
1578	608950	vg
1579	608950	v
1580	608950	a
1581	96958	vg
1582	96958	v
1583	96958	a
1584	621273	vg
1585	621273	v
1586	621273	a
1587	502480	vg
1588	502480	v
1589	502480	a
1590	15076	vg
1591	15076	v
1592	15076	a
1593	506620	vg
1594	506620	v
1595	506620	a
1596	15155	vg
1597	15155	v
1598	15155	a
1599	576331	vg
1600	576331	v
1601	576331	a
1602	15194	vg
1603	15194	v
1604	15194	a
1605	15206	vg
1606	15206	v
1607	15206	a
1608	666496	vg
1609	666496	v
1610	666496	a
1611	666514	vg
1612	666514	v
1613	666514	a
1614	15266	vg
1615	15266	v
1616	15266	a
1617	15279	vg
1618	15279	v
1619	15279	a
1620	15395	vg
1621	15395	v
1622	15395	a
1623	253015	vg
1624	253015	v
1625	253015	a
1626	539733	vg
1627	539733	v
1628	539733	a
1629	15497	vg
1630	15497	v
1631	15497	a
1632	552084	vg
1633	552084	v
1634	552084	a
1635	584906	vg
1636	584906	v
1637	584906	a
1638	56655	vg
1639	56655	v
1640	56655	a
1641	552277	vg
1642	552277	v
1643	552277	a
1644	245088	vg
1645	245088	v
1646	245088	a
1647	482698	vg
1648	482698	v
1649	482698	a
1650	609705	vg
1651	609705	v
1652	609705	a
1653	573147	vg
1654	573147	v
1655	573147	a
1656	8973	vg
1657	8973	v
1658	8973	a
1659	25435	vg
1660	25435	v
1661	25435	a
1662	222072	vg
1663	222072	v
1664	222072	a
1665	582561	vg
1666	582561	v
1667	582561	a
1668	9363	vg
1669	9363	v
1670	9363	a
1671	272024	vg
1672	272024	v
1673	272024	a
1674	91868	vg
1675	91868	v
1676	91868	a
1677	173946	vg
1678	173946	v
1679	173946	a
1680	206726	vg
1681	206726	v
1682	206726	a
1683	26746	vg
1684	26746	v
1685	26746	a
1686	666056	vg
1687	666056	v
1688	666056	a
1689	76451	vg
1690	76451	v
1691	76451	a
1692	109300	vg
1693	109300	v
1694	109300	a
1695	11187	vg
1696	11187	v
1697	11187	a
1698	11309	vg
1699	11309	v
1700	11309	a
1701	109786	vg
1702	109786	v
1703	109786	a
1704	77127	vg
1705	77127	v
1706	77127	a
1707	421678	vg
1708	421678	v
1709	421678	a
1710	487282	vg
1711	487282	v
1712	487282	a
1713	143686	vg
1714	143686	v
1715	143686	a
1716	209453	vg
1717	209453	v
1718	209453	a
1719	111196	vg
1720	111196	v
1721	111196	a
1722	668417	vg
1723	668417	v
1724	668417	a
1725	46032	vg
1726	46032	v
1727	46032	a
1728	406548	vg
1729	406548	v
1730	406548	a
1731	423044	vg
1732	423044	v
1733	423044	a
1734	488605	vg
1735	488605	v
1736	488605	a
1737	111874	vg
1738	111874	v
1739	111874	a
1740	570630	vg
1741	570630	v
1742	570630	a
1743	636292	vg
1744	636292	v
1745	636292	a
1746	30979	vg
1747	30979	v
1748	30979	a
1749	96535	vg
1750	96535	v
1751	96535	a
1752	522589	vg
1753	522589	v
1754	522589	a
1755	14873	vg
1756	14873	v
1757	14873	a
1758	604744	vg
1759	604744	v
1760	604744	a
1761	227950	vg
1762	227950	v
1763	227950	a
1764	96904	vg
1765	96904	v
1766	96904	a
1767	523011	vg
1768	523011	v
1769	523011	a
1770	113765	vg
1771	113765	v
1772	113765	a
1773	392324	vg
1774	392324	v
1775	392324	a
1776	588931	vg
1777	588931	v
1778	588931	a
1779	425703	vg
1780	425703	v
1781	425703	a
1782	540657	vg
1783	540657	v
1784	540657	a
1785	540716	vg
1786	540716	v
1787	540716	a
1788	98352	vg
1789	98352	v
1790	98352	a
1791	114860	vg
1792	114860	v
1793	114860	a
1794	115048	vg
1795	115048	v
1796	115048	a
1797	82590	vg
1798	82590	v
1799	82590	a
1800	607160	vg
1801	607160	v
1802	607160	a
1803	394275	vg
1804	394275	v
1805	394275	a
1806	377980	vg
1807	377980	v
1808	377980	a
1809	230537	vg
1810	230537	v
1811	230537	a
1812	411053	vg
1813	411053	v
1814	411053	a
1815	18001	vg
1816	18001	v
1817	18001	a
1818	18245	vg
1819	18245	v
1820	18245	a
1821	591790	vg
1822	591790	v
1823	591790	a
1824	83997	vg
1825	83997	v
1826	83997	a
1827	591894	vg
1828	591894	v
1829	591894	a
1830	199061	vg
1831	199061	v
1832	199061	a
1833	18852	vg
1834	18852	v
1835	18852	a
1836	248562	vg
1837	248562	v
1838	248562	a
1839	215792	vg
1840	215792	v
1841	215792	a
1842	19207	vg
1843	19207	v
1844	19207	a
1845	379806	vg
1846	379806	v
1847	379806	a
1848	379877	vg
1849	379877	v
1850	379877	a
1851	314362	vg
1852	314362	v
1853	314362	a
1854	625680	vg
1855	625680	v
1856	625680	a
1857	379983	vg
1858	379983	v
1859	379983	a
1860	495013	vg
1861	495013	v
1862	495013	a
1863	544252	vg
1864	544252	v
1865	544252	a
1866	511507	vg
1867	511507	v
1868	511507	a
1869	757276	vg
1870	757276	v
1871	757276	a
1872	36510	vg
1873	36510	v
1874	36510	a
1875	397061	vg
1876	397061	v
1877	397061	a
1878	757545	vg
1879	757545	v
1880	757545	a
1881	36780	vg
1882	36780	v
1883	36780	a
1884	479202	vg
1885	479202	v
1886	479202	a
1887	37120	vg
1888	37120	v
1889	37120	a
1890	200971	vg
1891	200971	v
1892	200971	a
1893	250182	vg
1894	250182	v
1895	250182	a
1896	250263	vg
1897	250263	v
1898	250263	a
1899	381761	vg
1900	381761	v
1901	381761	a
1902	611350	vg
1903	611350	v
1904	611350	a
1905	382038	vg
1906	382038	v
1907	382038	a
1908	103519	vg
1909	103519	v
1910	103519	a
1911	398580	vg
1912	398580	v
1913	398580	a
1914	612102	vg
1915	612102	v
1916	612102	a
1917	120922	vg
1918	120922	v
1919	120922	a
1920	39436	vg
1921	39436	v
1922	39436	a
1923	465516	vg
1924	465516	v
1925	465516	a
1926	171020	vg
1927	171020	v
1928	171020	a
1929	597035	vg
1930	597035	v
1931	597035	a
1932	106312	vg
1933	106312	v
1934	106312	a
1935	417737	vg
1936	417737	v
1937	417737	a
1938	761991	vg
1939	761991	v
1940	761991	a
1941	582106	vg
1942	582106	v
1943	582106	a
1944	8918	vg
1945	8918	v
1946	8918	a
1947	19241	v
1948	19241	a
1949	19850	a
1950	649827	a
1951	601217	a
1952	535745	a
1953	481242	a
1954	481250	a
1955	556315	a
1956	164135	a
\.


--
-- Name: recipe_diets_recipe_diet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('recipe_diets_recipe_diet_id_seq', 1956, true);


--
-- Data for Name: recipe_ingredients; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY recipe_ingredients (recipe_ingredient_id, recipe_id, ingredient_id, measurement) FROM stdin;
1	475433	1	0.5 cup
2	475433	2	2.0 cups
3	475433	3	1.0 
4	475433	4	0.5 cup
5	475433	5	0.5 cup
6	475433	6	1.5 teaspoons
7	475433	7	2.0 cups
8	475433	8	1.0 tablespoon
9	33119	9	3.0 Tb
10	33119	10	8.0 Tb
11	33119	11	1.5 lb
12	33119	12	2.0 
13	33119	13	0.75 cup
14	33119	14	1.0 lb
15	33119	15	8.0 servings
16	156006	16	0.25 cup
17	156006	17	4.75 pound
18	156006	18	0.25 cup
19	156006	19	1.0 teaspoon
20	156006	20	0.25 teaspoon
21	197005	21	1.0 
22	197005	22	1.0 Sprigs
23	197005	23	1.0 pinch
24	197005	24	0.25 teaspoon
25	197005	17	3.0 pounds
26	197005	6	2.0 teaspoons
27	213397	25	2.0 
28	213397	26	0.25 cup
29	213397	27	1.0 tablespoon
30	213397	28	0.25 teaspoon
31	213397	17	3.0 pound
32	213397	29	0.5 cup
33	74166	30	1.25 cups
34	74166	31	2.0 tbsp
35	74166	32	0.5 cup
36	74166	33	4.0 servings
37	74166	34	8.0 oz
38	74166	35	1.5 cups
39	74166	17	3.0 lb
40	164332	36	0.5 cup
41	164332	37	4.7 ounces
42	164332	4	2.25 cups
43	164332	38	3.0 cups
44	164332	17	1.0 pound
45	164332	7	0.666666666667 cup
46	74225	25	2.0 
47	74225	39	1.0 cup
48	74225	40	2.0 Tbsps
49	74225	33	6.0 servings
50	74225	41	0.25 tsp
51	74225	42	5.0 ozs
52	74225	17	4.0 lb
53	74225	6	0.25 tsp
54	74225	43	0.75 cup
55	74407	9	0.25 cup
56	74407	44	2.0 
57	74407	39	0.5 cup
58	74407	33	4.0 servings
59	74407	45	8.0 
60	74407	17	2.0 pound
61	74407	22	4.0 
62	74407	46	4.0 servings
63	25369	47	400.0 g
64	25369	32	300.0 ml
65	25369	48	1.0 sprig
66	25369	49	1.0 tbs
67	25369	17	1.0 
68	25369	18	1.0 tbs
69	25369	50	3.0 servings
70	189301	9	1.0 tablespoon
71	189301	31	0.25 cup
72	189301	39	0.25 cup
73	189301	51	0.333333333333 cup
74	189301	16	1.0 tablespoon
75	189301	12	2.0 
76	549859	52	1.0 tablespoon
77	549859	53	1.0 tablespoon
78	549859	54	1.0 tablespoon
79	549859	17	1.0 can
80	549859	55	0.5 teaspoon
81	549859	56	1.0 teaspoon
82	418827	57	0.5 teaspoon
83	418827	2	0.25 cup
84	418827	58	2.0 tablespoons
85	418827	4	2.0 cups
86	418827	59	1.0 cups
87	418827	60	1.0 teaspoon
88	418827	17	3.0 pounds
89	418827	61	6.0 servings
90	418827	6	1.0 teaspoon
91	418827	7	1.0 cup
92	164950	62	1.0 cup
93	164950	63	10.75 ounces
94	164950	17	1.0 cup
95	164950	7	0.333333333333 cup
96	164950	64	1.0 cup
97	115813	65	0.25 cup
98	115813	66	1.0 head
99	115813	17	3.5 lb
100	115813	67	4.0 oz
101	115813	68	1.0 lb
102	107667	9	3.0 tablespoons
103	107667	32	0.5 cup
104	107667	69	1.0 
105	107667	70	6.0 
106	107667	41	2.0 servings
107	107667	71	200.0 g
108	107667	72	2.0 
109	107667	17	200.0 g
110	107667	6	2.0 servings
111	484691	73	6.0 servings
112	484691	57	6.0 servings
113	484691	74	0.5 Cup
114	484691	75	16.0 
115	484691	76	12.0 
116	484691	17	1.0 
117	116208	25	8.0 
118	116208	33	4.0 servings
119	116208	77	4.0 
120	116208	17	1.0 lb
121	116208	22	16.0 sprigs
122	116208	78	0.5 teaspoon
123	108340	79	1.0 
124	108340	80	4.0 
125	108340	81	2.0 
126	108340	3	1.0 
127	108340	82	4.0 
128	108340	15	4.0 servings
129	517989	3	1.0 
130	517989	83	1.0 
131	517989	84	4.0 servings
132	517989	15	1.0 teaspoon
133	517989	85	1.0 tablespoon
134	517989	18	3.0 tablespoons
135	526278	86	2.0 Tbsp
136	526278	57	3.0 servings
137	526278	87	3.0 servings
138	526278	88	3.0 slices
139	526278	89	2.0 stalks
140	526278	90	0.5 Tbsp
141	526278	91	2.0 tsp
142	526278	17	0.5 
143	526278	6	3.0 servings
144	526548	92	1.0 package
145	526548	4	3.0 
146	526548	59	1.0 cup
147	526548	93	10.5 ounces
148	526548	63	1.0 can
149	526548	17	4.0 pieces
150	477720	9	6.0 servings
151	477720	21	1.0 
152	477720	3	5.0 pound
153	477720	33	6.0 servings
154	477720	66	4.0 cloves
155	477720	22	3.0 sprigs
156	477720	85	3.0 sprigs
157	395808	94	0.25 cup
158	395808	58	2.0 tablespoons
159	395808	95	0.333333333333 cup
160	395808	4	2.0 tablespoons
161	395808	96	2.0 tablespoons
162	395808	97	1.0 
163	395808	17	3.0 pounds
164	395808	98	1.0 teaspoon
165	125529	57	0.25 teaspoon
166	125529	99	4.0 tablespoons
167	125529	79	1.0 
168	125529	100	2.0 lbs
169	125529	12	3.0 lbs
170	125529	6	0.5 teaspoon
171	125529	4	6.0 servings
172	125529	37	2.0 
173	125529	101	2.0 
181	84694	105	1.0 tablespoon
182	84694	9	2.0 tablespoons
183	84694	106	1.0 
184	84694	97	1.0 
185	84694	107	0.25 cup
186	84694	17	1.0 pound
187	510892	36	4.0 servings
188	510892	17	1.0 lbs
189	510892	74	0.25 cup
190	510892	108	0.333333333333 cup
191	510892	109	8.0 oz
192	478222	110	4.0 servings
193	478222	111	2.0 tbsps
194	478222	3	1.0 
195	478222	88	2.0 
196	478222	112	2.0 
197	478222	66	1.0 head
198	478222	113	1.0 bunch
199	478222	114	1.0 
200	167036	73	0.5 teaspoon
201	167036	57	0.5 teaspoon
202	167036	115	0.5 teaspoon
203	167036	3	4.0 lb
204	167036	116	1.0 tablespoon
205	167036	13	12.0 oz
206	167036	6	2.0 teaspoons
223	290013	9	4.0 servings
224	290013	31	1.0 cup
225	290013	124	2.0 tablespoons
226	290013	125	4.0 
227	290013	12	6.0 pound
228	290013	15	4.0 servings
229	290013	78	1.0 teaspoon
230	511195	9	2.0 tbsp
231	511195	31	1.0 tsp
232	511195	11	1.0 lbs
233	511195	65	3.0 tbsp
234	511195	17	1.0 lbs
235	511195	126	2.0 tsp
236	478432	86	2.0 tbsps
237	478432	110	4.0 servings
238	478432	79	1.0 
239	478432	66	4.0 cloves
240	478432	17	750.0 g
241	478432	127	1.0 c
242	478432	43	2.0 
243	445704	128	0.5 cup
244	445704	129	1.0 tablespoon
245	445704	17	3.0 pounds
246	445704	11	1.0 pound
247	445704	36	0.5 cup
248	519514	130	1.0 tsp
249	519514	131	2.0 tsp
250	519514	132	10.0 
251	519514	133	0.75 c
252	519514	134	1.0 c
253	519514	135	2.0 tsp
254	519514	17	1.0 
255	273991	136	4.0 
256	273991	137	1.0 lb
257	273991	138	0.75 cup
258	273991	17	0.5 
259	273991	139	0.5 cup
260	257899	25	2.0 
261	257899	140	0.5 cup
262	257899	12	7.0 pound
263	257899	141	0.25 cup
264	257899	142	1.0 cup
265	20418	143	9.0 servings
266	20418	144	50.0 g
267	20418	33	9.0 servings
268	20418	145	200.0 g
269	20418	17	4.0 
270	20418	146	150.0 g
271	159714	147	0.333333333333 cup
272	159714	63	10.75 oz
273	159714	17	1.0 cup
274	159714	64	1.0 cup
275	159714	62	1.0 cup
276	643114	9	4.0 tablespoons
277	643114	148	4.0 servings
278	643114	2	2.0 pounds
279	643114	48	4.0 servings
280	643114	3	4.5 pound
281	643114	4	2.0 cups
282	643114	66	8.0 cloves
283	643114	77	2.0 
284	643114	50	1.0 Dash
285	200784	9	4.0 servings
286	200784	102	1.0 bunch
287	200784	149	4.0 
288	200784	13	16.0 ounce
289	200784	66	7.0 cloves
290	200784	17	5.0 pound
291	200784	15	4.0 servings
292	274643	1	2.0 Tbsp
293	274643	36	0.25 cup
294	274643	57	1.0 Dash
295	274643	2	0.333333333333 cup
296	274643	6	1.0 tsp
297	274643	4	2.0 Tbsp
298	274643	17	3.0 lb
299	274643	150	0.5 cup
300	274643	151	1.0 
301	28891	9	2.0 tablespoons
302	28891	152	1.0 cup
303	28891	153	6.0 
304	28891	154	5.0 
305	28891	155	5.0 
306	28891	17	4.0 lb
307	28891	15	1.5 teaspoons
308	471483	156	0.25 cup
309	471483	33	4.0 servings
310	471483	157	0.25 cup
311	471483	158	0.25 cup
312	471483	159	3.0 tablespoons
313	471483	17	2.0 cups
314	45703	160	1.0 lb
315	45703	9	2.0 Tbsps
316	45703	66	8.0 cloves
317	45703	161	4.0 
318	45703	17	3.0 
319	45703	15	4.0 servings
320	45703	162	0.25 cup
321	299722	16	1.0 cup
322	299722	66	8.0 cloves
323	299722	12	7.0 pound
324	299722	163	0.5 cup
325	299722	95	0.75 cup
326	496462	128	2.0 tbsp
327	496462	164	2.0 
328	496462	33	4.0 servings
329	496462	165	3.0 
330	496462	166	1.0 
331	496462	17	8.0 oz
332	611209	9	2.0 tablespoons
333	611209	57	0.5 teaspoon
334	611209	21	1.0 
335	611209	37	1.0 lb
336	611209	3	4.0 lb
337	611209	167	2.0 tablespoons
338	611209	66	2.0 cloves
339	611209	15	1.0 Dash
340	521148	57	4.0 servings
341	521148	79	0.5 
342	521148	168	250.0 g
343	521148	66	2.0 cloves
344	521148	17	4.0 servings
345	521148	151	1.0 
346	619512	169	1.0 cup
347	619512	170	1.0 6-inch
348	619512	17	4.0 ounces
349	619512	171	0.5 cup
350	619512	172	2.0 tablespoons
351	5116	9	2.0 tbsp
352	5116	173	1.0 serving
353	5116	174	2.0 tbsp
354	5116	175	1.0 serving
355	5116	176	1.0 serving
356	5116	177	1.0 serving
357	5116	178	1.0 serving
358	5116	179	1.0 serving
359	5116	180	1.0 serving
360	5116	75	2.0 
361	5116	181	1.0 serving
362	5116	182	1.0 serving
363	5116	183	1.0 serving
364	5116	184	1.0 serving
365	5116	185	2.0 cup
366	5116	186	1.0 lb
367	5116	187	2.0 
368	5116	12	1.0 serving
369	5116	188	12.0 servings
370	5116	189	1.0 serving
371	5116	190	1.0 serving
372	5116	15	12.0 servings
373	521279	86	2.0 tbsps
374	521279	110	4.0 servings
375	521279	79	1.0 
376	521279	66	4.0 cloves
377	521279	17	750.0 g
378	521279	127	1.0 c
379	521279	43	2.0 
380	537708	191	1.0 
381	537708	192	2.0 
382	537708	17	1.0 serving
383	537708	131	1.0 serving
384	537708	193	1.0 serving
385	275627	9	3.0 tablespoons
386	275627	25	3.0 
387	275627	21	1.0 
388	275627	3	3.0 pound
389	275627	194	1.0 tablespoon
390	275627	6	1.0 teaspoon
391	275627	85	3.0 sprigs
392	619703	195	1.0 head
393	619703	2	1.0 cup
394	619703	121	2.0 
395	619703	53	1.0 cup
396	619703	49	2.0 liters
397	619703	196	2.0 Tbsp
398	619703	17	2.0 packets
399	365791	17	1.0 cup
400	365791	197	2.0 tablespoons
401	365791	198	1.0 
402	365791	199	1.0 cup
403	365791	200	1.0 cup
404	292273	65	0.25 cup
405	292273	66	1.0 head
406	292273	17	3.5 pound
407	292273	67	4.0 ounces
408	292273	201	1.0 pound
409	382457	202	1.0 
410	382457	203	7.0 
411	382457	48	1.0 sprig
412	382457	3	1.0 
413	382457	204	3.0 tablespoons
414	382457	201	1.0 
415	136838	160	2.0 lbs
416	136838	25	4.0 
417	136838	12	5.0 lbs
418	136838	9	0.25 cup
419	136838	205	5.0 tablespoons
420	136838	85	2.0 sprigs
421	136838	50	4.0 servings
422	120580	9	0.25 cup
423	120580	57	0.25 teaspoon
424	120580	79	1.0 
425	120580	82	4.0 
426	120580	45	4.0 
427	120580	17	3.5 pounds
428	120580	206	0.5 teaspoon
429	120580	207	0.25 cup
430	489236	133	1.0 cup
431	489236	17	1.0 pounds
432	489236	208	1.0 
433	489236	209	6.0 tablespoons
434	489236	210	1.0 
435	530277	1	1.0 tbsp
436	530277	9	1.0 tbsp
437	530277	211	1.5 tsp
438	530277	205	1.0 tbsp
439	530277	212	1.5 ounces
440	530277	17	3.0 pounds
441	530277	6	0.25 tsp
442	38830	25	10.0 
443	38830	57	1.0 tsp
444	38830	102	6.0 sprigs
445	38830	17	4.0 lbs
446	38830	201	2.0 
447	38830	206	2.0 tsps
448	38830	18	1.0 Tbsp
449	38840	9	0.25 cup
450	38840	12	2.0 
451	38840	211	1.0 tsp
452	38840	116	2.0 Tbsps
453	38840	66	8.0 heads
454	38840	206	4.0 servings
455	38840	213	6.0 
456	137151	214	2.0 cups
457	137151	215	2.0 cups
458	137151	17	2.0 cups
459	137151	216	8.0 ounces
460	137151	217	2.0 cups
461	38847	206	4.0 servings
462	38847	66	1.0 head
463	38847	3	4.0 lbs
464	38847	102	4.0 servings
465	38847	18	2.0 Tbsps
480	137203	44	2.0 
481	137203	12	4.0 lb
482	137203	95	0.25 cup
483	137203	41	4.0 servings
484	137203	96	1.0 tablespoon
485	137203	222	1.0 
486	137203	97	1.0 
487	137203	6	4.0 servings
488	481267	9	4.0 servings
489	481267	223	8.0 oz
490	481267	39	1.0 cup
491	481267	33	4.0 servings
492	481267	66	1.0 cloves
493	481267	17	1.0 
494	481267	85	1.0 sprig
495	137287	1	0.5 cup
496	137287	36	0.5 cup
497	137287	224	1.0 cup
498	137287	3	1.0 
499	137287	97	1.0 
500	137287	50	4.0 servings
501	292972	1	2.0 tablespoons
502	292972	9	2.0 tablespoons
503	292972	15	1.0 tablespoon
504	292972	66	1.0 teaspoon
505	292972	17	3.5 pound
506	292972	225	1.0 teaspoon
507	292972	84	2.0 teaspoons
508	96394	9	2.0 tablespoons
509	96394	226	1.0 tablespoon
510	96394	227	1.0 
511	96394	3	3.5 pounds
512	96394	206	4.0 servings
513	96394	228	0.75 pound
514	96394	82	1.5 pounds
515	506548	160	1.0 pound
516	506548	25	1.0 head
517	506548	3	3.0 
518	506548	77	2.0 
519	506548	135	4.0 servings
520	506548	85	1.0 bunch
521	580342	79	1.0 
522	580342	229	10.0 oz
523	580342	33	16.0 servings
524	580342	230	1.0 can
525	580342	17	2.0 cups
526	580342	231	2.0 packages
527	170862	232	8.0 8-inch
528	170862	17	1.0 cup
529	170862	233	4.0 oz
530	170862	234	6.0 oz
531	170862	185	0.333333333333 cup
532	220041	235	1.0 bunch
533	220041	24	2.0 tbsp
534	220041	17	1.0 
535	220041	236	2.0 
536	220041	25	3.0 
537	187337	51	1.0 tablespoon
538	187337	17	0.5 
539	187337	237	2.0 slices
540	187337	151	1.0 
541	187337	238	18.0 ounce
542	39977	9	2.0 tablespoons
543	39977	57	0.5 teaspoon
544	39977	44	5.0 
545	39977	239	16.0 servings
546	39977	17	4.0 lb
547	39977	6	1.0 teaspoon
548	39977	240	12.0 
549	39977	207	2.0 tablespoons
550	130140	241	2.0 tablespoons
551	130140	2	1.0 tablespoon
552	130140	48	1.0 bunch
553	130140	3	4.5 pounds
554	130140	4	0.25 cup
555	130140	242	1.0 can
556	130140	206	6.0 servings
557	130140	18	2.0 tablespoons
558	171114	1	1.0 tablespoon
559	171114	86	1.0 tablespoon
560	171114	137	1.0 lb
561	171114	243	1.0 cup
562	171114	4	1.33333333333 cups
563	171114	17	1.0 box
564	171114	7	1.0 tablespoon
565	138490	244	1.0 tablespoon
566	138490	12	2.0 lbs
567	138490	95	1.0 tablespoon
568	138490	41	1.0 teaspoon
569	138490	66	6.0 cloves
570	138490	135	1.0 teaspoon
571	138490	245	0.333333333333 cup
572	138490	246	0.25 cup
579	32104	1	40.0 g
580	32104	250	2.0 tsps
581	32104	66	1.0 clove
582	32104	17	2.0 
583	32104	135	2.0 servings
584	32104	251	0.5 tsp
585	163179	9	4.0 teaspoons
586	163179	10	4.0 tablespoons
587	163179	12	8.0 lb
588	163179	252	2.0 
589	163179	13	24.0 oz
590	163179	66	4.0 cloves
591	122256	230	1.0 can
592	122256	253	0.5 cup
593	122256	254	16.0 ounce
594	122256	215	1.0 can
595	122256	17	4.0 cups
596	32316	9	1.0 Tbsp
597	32316	255	4.0 cups
598	32316	48	2.0 tsps
599	32316	3	4.0 lbs
600	32316	218	0.25 cup
601	32316	66	6.0 cloves
602	32316	206	4.0 servings
603	303132	9	4.0 servings
604	303132	25	16.0 
605	303132	256	4.0 servings
606	303132	257	0.5 cup
607	303132	258	2.25 pounds
608	303132	259	3.0 
609	303132	17	3.5 pound
610	303132	260	3.0 
611	139296	9	2.0 tablespoons
612	139296	79	1.0 
613	139296	261	12.0 ounces
614	139296	262	2.0 tablespoons
615	139296	263	4.0 oz
616	139296	45	6.0 
617	139296	41	4.0 servings
618	139296	17	3.0 cups
619	139296	6	0.5 teaspoon
620	286759	9	4.0 tablespoons
621	286759	264	2.0 
622	286759	265	1.5 tablespoons
623	286759	57	6.0 servings
624	286759	3	3.5 pound
625	286759	266	6.0 ounces
626	286759	66	1.0 head
627	286759	222	0.5 
628	286759	15	6.0 servings
629	172081	267	1.0 pieces
630	172081	108	8.0 oz
631	172081	232	6.0 8-inch
632	172081	45	6.0 servings
633	172081	17	1.5 cups
634	172081	29	6.0 servings
635	499805	268	8.0 servings
636	499805	171	0.5 
637	499805	269	0.5 cup
638	499805	227	0.25 cup
639	499805	3	1.0 
640	499805	244	1.0 tablespoon
641	499805	157	2.0 ribs
642	499805	50	8.0 servings
643	164057	1	2.0 tablespoons
644	164057	86	1.0 tablespoon
645	164057	137	1.0 lb
646	164057	270	1.0 cup
647	164057	108	1.0 oz
648	164057	4	1.33333333333 cups
649	164057	17	1.0 box
650	164057	7	1.0 tablespoon
651	172277	94	0.25 cup
652	172277	271	1.0 box
653	172277	272	0.75 cup
654	172277	157	0.5 cup
655	172277	273	0.5 cup
656	172277	17	1.5 cups
664	115016	1	3.0 tablespoons
665	115016	21	1.0 
666	115016	278	1.0 lb
667	115016	48	6.0 sprigs
668	115016	12	3.0 lb
669	115016	258	1.5 lbs
670	115016	206	4.0 servings
671	434643	57	0.125 teaspoon
672	434643	279	1.0 teaspoon
673	434643	280	1.0 teaspoon
674	434643	4	0.75 cup
675	434643	281	0.25 teaspoon
676	434643	282	1.0 teaspoons
677	434643	17	5.0 ounces
678	434643	283	2.0 tablespoons
679	478622	131	1.0 bunch
680	478622	79	1.0 
681	478622	173	3.0 tbsps
682	478622	284	500.0 g
683	478622	285	4.0 
684	478622	286	150.0 g
685	478622	287	0.5 c
686	478622	41	1.0 teaspoon
687	478622	66	6.0 cloves
688	478622	288	1.0 handful
689	478622	110	4.0 servings
690	478622	43	2.0 
691	204207	1	1.0 tablespoons
692	204207	86	1.0 tablespoon
693	204207	284	4.0 
694	204207	102	1.0 bunch
695	204207	79	1.0 
696	204207	32	2.0 cups
697	204207	157	2.0 ribs
698	204207	13	12.0 ounces
699	204207	15	4.0 servings
700	91665	1	2.0 ounces
701	91665	57	4.0 servings
702	91665	6	4.0 servings
703	91665	284	400.0 g
704	91665	37	600.0 g
705	91665	121	4.0 
706	91665	174	2.0 tablespoons
707	91665	49	1.0 tablespoon
708	91665	289	4.0 servings
709	91665	201	2.0 
710	10015	86	1.0 Tbsp
711	10015	284	600.0 g
712	10015	290	2.0 Tbsps
713	10015	291	1.0 bunch
714	10015	292	1.0 tsp
715	10015	205	1.0 Tbsp
716	10015	14	200.0 g
717	10015	293	60.0 ml
718	10015	294	1.0 Tbsp
719	10049	86	2.0 tbsp
720	10049	284	1.0 lb
721	10049	295	1.0 bunch
722	10049	296	0.666666666667 lb
723	10049	32	2.0 tbsp
724	10049	291	2.0 bunches
725	10049	297	4.0 
726	10049	298	2.0 tbsp
727	10049	66	2.0 cloves
728	10049	245	0.5 cup
729	401266	299	1.0 pound
730	401266	6	0.5 teaspoon
731	401266	2	1.0 tablespoon
732	401266	58	2.0 tablespoons
733	401266	284	1.0 pound
734	401266	116	2.0 tablespoons
735	401266	4	2.0 cups
736	401266	300	0.5 teaspoon
737	401266	301	8.0 servings
738	401266	302	8.0 ounces
739	401266	201	2.0 
740	3962	9	2.0 Tbsps
741	3962	284	1.0 serving
742	3962	303	1.0 serving
743	3962	205	1.0 Tbsp
744	3962	304	1.0 serving
745	3962	17	1.0 serving
746	3962	305	1.0 serving
747	3962	306	1.0 serving
748	3962	307	1.0 serving
749	3962	308	12.0 oz
750	3962	174	1.0 Tbsp
751	3962	178	1.0 serving
752	3962	309	1.0 serving
753	3962	310	1.0 serving
754	3962	311	1.0 serving
755	3962	312	1.0 serving
756	3962	313	1.0 serving
757	3962	314	1.0 serving
758	3962	50	1.0 dash
759	3962	315	1.0 serving
760	3962	316	1.0 serving
761	3962	179	1.0 serving
762	3962	66	2.0 cloves
763	3962	317	1.0 serving
764	3962	318	1.0 serving
765	3962	102	1.0 serving
766	3962	319	1.0 serving
767	3962	320	1.0 serving
768	3962	321	1.0 
769	3962	322	1.0 serving
770	3962	116	0.25 tsp
771	3962	323	1.0 serving
772	3962	324	1.0 serving
773	3962	325	0.333333333333 cup
774	3962	326	1.0 serving
775	298934	327	30.4 ounce
776	298934	9	2.0 tablespoons
777	298934	284	6.0 ounces
778	298934	328	1.0 tablespoon
779	298934	33	8.0 servings
780	298934	232	8.0 
781	298934	329	1.0 head
782	298934	114	0.5 
783	298934	330	0.5 cup
784	417788	331	3.0 
785	417788	332	1.0 cup
786	417788	227	1.0 
787	417788	284	2.0 cups
788	417788	263	0.25 cup
789	417788	333	0.25 cup
790	417788	334	4.0 
791	116737	25	2.0 
792	116737	57	0.5 teaspoon
793	116737	6	1.0 teaspoon
794	116737	335	500.0 g
795	116737	224	150.0 g
796	116737	336	0.5 teaspoon
797	116737	284	200.0 g
798	116737	151	1.0 
799	116737	337	200.0 g
800	116737	338	150.0 g
801	602196	284	1.0 pound
802	602196	339	2.0 cloves
803	602196	156	3.0 
804	602196	88	1.0 piece
805	602196	340	6.0 
806	602196	341	1.0 
807	602196	342	2.0 
808	602196	6	8.0 servings
809	602196	43	2.0 
810	290906	327	2.0 cups
811	290906	284	4.0 ounces
812	290906	343	1.0 
813	290906	33	6.0 servings
814	290906	4	5.0 cups
815	290906	66	3.0 cloves
816	290906	344	2.0 slices
817	290906	345	1.0 
818	290906	346	1.0 
819	290906	114	0.666666666667 cup
820	608393	1	2.0 tbsps
821	608393	347	0.5 tbsp
822	608393	284	0.5 
823	608393	318	2.0 c
824	608393	79	0.5 c
825	608393	2	1.0 c
826	608393	348	1.0 tbsp
827	608393	174	0.25 c
828	608393	33	3.0 servings
829	608393	349	0.5 tsp
839	82263	1	40.0 g
840	82263	355	3.0 
841	82263	284	350.0 g
842	82263	125	2.0 Tbsps
843	82263	188	1.0 tsp
844	82263	9	60.0 ml
845	82263	205	2.0 tsps
846	82263	14	200.0 g
847	82263	356	1.0 tsp
848	82262	357	1.0 
849	82262	284	1.7 g
850	82262	358	4.0 
851	82262	359	1.0 tsp
852	82262	88	50.0 g
853	82262	90	250.0 ml
854	82262	66	4.0 cloves
855	82262	96	90.0 g
856	82262	245	0.5 cup
857	522587	1	2.0 tbsps
858	522587	284	1.5 c
859	522587	360	1.0 
860	522587	318	6.0 c
861	522587	79	1.0 
862	522587	215	1.0 
863	522587	361	1.0 handful
864	522587	33	4.0 servings
865	522587	362	2.0 c
866	598373	9	1.0 teaspoon
867	598373	363	1.0 
868	598373	284	1.0 cup
869	598373	135	4.0 servings
870	598373	240	4.0 
871	598373	364	0.25 cup
872	598373	236	1.0 
873	598373	302	4.0 servings
874	598373	66	1.0 clove
875	598373	89	1.0 
876	215410	9	1.0 tbsp
877	215410	284	420.0 g
878	215410	350	2.0 tbsp
879	215410	151	1.0 
880	215410	365	100.0 g
881	215410	220	1.0 bunch
882	215410	261	300.0 g
883	215410	65	2.0 tsp
884	215410	97	1.0 
885	215410	101	800.0 g
886	526709	86	2.0 tablespoons
887	526709	223	4.0 ounces
888	526709	163	0.5 inch
889	526709	284	0.25 pound
890	526709	95	1.5 teaspoon
891	526709	366	1.0 tablespoon
892	526709	367	1.0 
893	526709	368	2.0 
894	526709	6	0.5 teaspoon
895	526709	369	1.0 
896	35219	370	6.0 lbs
897	35219	284	35.0 servings
898	35219	371	24.0 
899	35219	33	35.0 servings
900	35219	27	1.0 piece
901	35219	66	6.0 cloves
902	35219	372	35.0 servings
903	35219	373	1.0 
904	35219	374	12.0 ozs
905	133555	1	6.0 servings
906	133555	284	1.0 lb
907	133555	243	1.0 lb
908	133555	375	1.0 slicesslices
909	133555	122	0.5 lb
910	133555	376	1.0 lb
911	133555	377	6.0 
912	133555	378	6.0 servings
913	541207	379	0.5 tsp
914	541207	284	1.0 pkg
915	541207	380	4.0 Tbsp
916	541207	381	1.5 Tbsp
917	541207	88	0.5 tsp
918	541207	95	1.5 Tbsp
919	541207	292	1.0 Tbsp
920	541207	382	4.0 
921	541207	383	1.0 
922	541207	244	1.0 tsp
923	520797	384	0.333333333333 c
924	520797	284	2.0 c
925	520797	111	3.0 tbsps
926	520797	79	2.0 
927	520797	385	5.0 
928	520797	88	2.0 
929	520797	33	4.0 servings
930	520797	386	500.0 g
931	520797	97	1.0 clove
932	520797	387	0.25 
933	520803	284	200.0 grams
934	520803	79	1.0 
935	520803	173	2.0 tbsps
936	520803	388	234.0 g
937	520803	389	0.5 tsp
938	520803	110	1.0 tbsp
939	520803	66	2.0 cloves
940	520803	390	2.0 tsps
941	520803	210	234.0 g
942	246381	4	0.75 cup
943	246381	284	250.0 g
944	246381	87	1.0 tbs
945	246381	6	0.25 tsp
946	246381	391	150.0 g
947	246381	244	2.0 servings
948	246381	292	2.0 servings
949	246381	392	1.0 tbs
950	246381	66	3.0 cloves
951	246381	393	0.25 tsp
952	246381	151	1.0 tube
953	246381	245	2.0 servings
954	367226	284	8.0 ounces
955	367226	121	2.0 
956	367226	67	8.0 ounces
957	367226	33	10.0 servings
958	367226	394	10.0 tablespoons
959	367226	66	1.0 clove
960	367226	68	3.0 
961	367226	155	2.0 tablespoons
962	367226	395	1.0 pound
963	17057	1	1.0 tablespoon
964	17057	86	1.0 tablespoon
965	17057	284	24.0 ounce
966	17057	2	2.0 tablespoons
967	17057	74	0.5 cup
968	17057	396	2.0 
969	17057	15	1.0 tablespoon
970	17057	397	2.0 tablespoons
971	17057	41	1.0 teaspoon
972	17057	61	0.25 cup
973	17057	398	2.0 tablespoons
974	17057	356	1.0 teaspoon
975	213670	399	200.0 g
976	213670	86	1.0 tbsp
977	213670	284	400.0 g
978	213670	400	2.0 tbsp
979	213670	401	1.0 tbsp
980	213670	402	3.0 
981	213670	403	400.0 g
982	213670	404	1.0 tsp
983	213670	210	0.5 
984	522969	405	1.0 tsp
985	522969	284	150.0 g
986	522969	406	2.0 
987	522969	79	1.0 
988	522969	116	1.0 tsp
989	522969	66	1.0 tsp
990	522969	210	1.0 c
991	522969	113	2.0 servings
992	522969	6	1.0 tsp
993	522969	111	2.0 tbsps
994	322325	9	0.25 cup
995	322325	284	6.0 pound
996	322325	407	3.0 tablespoons
997	322325	408	2.0 cups
998	322325	197	0.25 cup
999	322325	277	1.0 cup
1000	322325	33	6.0 servings
1001	322325	66	1.0 tablespoon
1002	322325	212	0.5 cup
1003	322325	409	0.5 cup
1004	322325	410	0.5 cup
1005	322325	6	1.0 teaspoon
1006	4928	411	1.0 serving
1007	4928	412	1.0 serving
1008	4928	334	1.0 serving
1009	4928	17	1.0 serving
1010	4928	413	1.0 serving
1011	4928	131	1.0 serving
1012	4928	414	1.0 serving
1013	4928	415	1.0 serving
1014	4928	178	1.0 serving
1015	4928	157	1.0 serving
1016	4928	416	1.0 serving
1017	4928	417	1.0 serving
1018	4928	418	1.0 serving
1019	4928	419	1.0 serving
1020	4928	420	1.0 serving
1021	4928	421	1.0 serving
1022	4928	422	1.0 serving
1023	4928	314	1.0 
1024	4928	263	1.0 serving
1025	4928	423	1.0 serving
1026	4928	119	1.0 serving
1027	4928	76	1.0 serving
1028	4928	132	1.0 serving
1029	4928	318	1.0 serving
1030	4928	424	1.0 serving
1031	4928	278	1.0 serving
1032	4928	37	1.0 serving
1033	4928	320	1.0 serving
1034	4928	323	1.0 serving
1035	4928	425	1.0 serving
1036	4928	324	1.0 serving
1037	4928	22	1.0 serving
1038	4928	426	1.0 serving
1039	4928	284	1.0 serving
1040	4928	303	1.0 serving
1041	4928	67	1.0 serving
1042	4928	427	1.0 serving
1043	4928	428	1.0 serving
1044	4928	261	1.0 serving
1045	4928	429	1.0 serving
1046	4928	430	1.0 serving
1047	4928	431	1.0 serving
1048	4928	265	1.0 serving
1049	4928	432	1.0 balls
1050	4928	33	4.0 servings
1051	4928	35	0.5 cup
1052	4928	433	1.0 serving
1053	4928	195	1.0 serving
1054	4928	434	1.0 serving
1055	4928	435	1.0 serving
1056	4928	436	1.0 serving
1057	4928	212	1.0 serving
1058	4928	197	1.0 serving
1059	4928	71	1.0 serving
1060	4928	159	1.0 serving
1061	4928	384	1.0 serving
1062	4928	437	1.0 serving
1063	4928	438	1.0 loaf
1064	4928	439	1.0 serving
1065	4928	40	2.0 Tbsps
1066	4928	440	1.0 serving
1067	4928	38	1.0 serving
1068	4928	383	1.0 serving
1069	4928	66	1.0 serving
1070	4928	441	1.0 serving
1071	4928	326	1.0 serving
1072	4928	442	1.0 serving
1073	4928	9	1.0 serving
1074	4928	443	1.0 serving
1075	4928	444	1.0 serving
1076	4928	445	1.0 serving
1077	4928	446	1.0 serving
1078	4928	304	1.0 serving
1079	4928	337	1.0 serving
1080	4928	447	1.0 serving
1081	4928	307	1.0 serving
1082	4928	335	1.0 serving
1083	4928	408	1.0 serving
1084	4928	174	4.0 servings
1085	4928	448	1.0 serving
1086	4928	5	1.0 serving
1087	4928	220	1.0 serving
1088	4928	449	8.0 ozs
1089	4928	450	1.0 serving
1090	4928	451	1.0 serving
1091	4928	452	1.0 serving
1092	4928	453	1.0 
1093	4928	362	1.0 serving
1094	4928	454	1.0 serving
1095	4928	222	1.0 serving
1096	4928	455	1.0 serving
1097	4928	145	1.0 serving
1098	4928	113	1.0 serving
1099	4928	456	1.0 serving
1100	4928	457	1.0 serving
1101	4928	458	1.0 serving
1102	4928	459	1.0 ribs
1103	4928	460	1.0 serving
1104	4928	461	0.5 cup
1105	4928	462	1.0 serving
1106	4928	173	1.0 serving
1107	4928	156	1.0 serving
1108	4928	88	1.0 serving
1109	4928	463	1.0 serving
1110	4928	464	1.0 serving
1111	4928	465	1.0 serving
1112	4928	21	1.0 serving
1113	4928	466	1.0 serving
1114	4928	201	1.0 serving
1115	4928	467	1.0 serving
1116	4928	468	1.0 serving
1117	4928	309	1.0 serving
1118	4928	43	3.0 
1119	4928	469	1.0 
1120	4928	470	1.0 serving
1121	4928	471	1.0 serving
1122	4928	121	1.0 serving
1123	4928	472	1.0 lb
1124	4928	473	1.0 serving
1125	4928	474	1.0 serving
1126	4928	475	1.0 serving
1127	4928	476	1.0 serving
1128	4928	477	1.0 serving
1129	4928	1	1.0 serving
1130	4928	478	1.0 serving
1131	4928	210	1.0 serving
1132	4928	479	1.0 serving
1133	484216	480	1.0 Tablespoon
1134	484216	284	1.0 lbs
1135	484216	101	1.0 Can
1136	484216	74	0.5 Cup
1137	484216	481	1.0 Can
1138	484216	482	1.0 
1139	484216	201	1.0 
1140	484216	356	0.5 Teaspoon
1141	484216	50	6.0 servings
1142	478098	86	2.0 tbsps
1143	478098	483	0.75 c
1144	478098	318	0.75 c
1145	478098	79	1.0 
1146	478098	484	1.0 bunch
1147	478098	57	3.0 servings
1148	478098	88	1.0 tsp
1149	478098	485	3.0 servings
1150	478098	110	3.0 servings
1151	478098	287	0.5 c
1152	478098	486	2.0 
1153	478098	66	1.0 tsp
1154	478098	487	1.0 c
1155	478098	284	0.5 c
1156	478159	284	0.5 c
1157	478159	488	4.0 c
1158	478159	489	4.0 servings
1159	478159	431	1.0 
1160	478159	121	3.0 
1161	478159	75	0.5 c
1162	478159	33	4.0 servings
1163	478159	165	1.0 bunch
1164	478159	490	2.0 tbsps
1165	478159	491	0.5 c
1166	478159	245	2.0 tbsps
1167	521187	355	2.0 
1168	521187	492	1.0 bunch
1169	521187	493	1.0 
1170	521187	79	1.0 
1171	521187	173	2.0 tbsps
1172	521187	385	3.0 
1173	521187	284	700.0 g
1174	521187	110	4.0 servings
1175	521187	66	4.0 cloves
1176	521187	127	100.0 g
1177	521187	43	2.0 
1178	478227	355	2.0 
1179	478227	492	1.0 bunch
1180	478227	493	1.0 
1181	478227	79	1.0 
1182	478227	173	2.0 tbsps
1183	478227	385	3.0 
1184	478227	284	700.0 g
1185	478227	110	4.0 servings
1186	478227	66	4.0 cloves
1187	478227	127	100.0 g
1188	478227	43	2.0 
1189	187487	480	0.75 cup
1190	187487	284	8.0 pound
1191	187487	226	1.0 cup
1192	187487	494	0.25 cup
1193	187487	404	2.0 teaspoons
1194	187487	66	1.0 head
1195	187487	24	2.0 teaspoons
1196	187487	6	1.0 teaspoon
1197	187487	356	2.0 teaspoons
1198	523370	284	1.0 
1199	523370	380	2.0 tbsps
1200	523370	87	0.5 c
1201	523370	79	1.0 
1202	523370	173	2.0 tbsps
1203	523370	81	2.0 
1204	523370	495	12.0 
1205	523370	244	4.0 tbsps
1206	523370	4	6.0 servings
1207	523370	489	0.5 tsp
1208	523370	358	2.0 
1209	523370	339	1.0 
1210	523370	374	1.0 tsp
1211	107643	284	1.0 lb
1212	107643	99	4.0 servings
1213	107643	6	1.0 teaspoon
1214	107643	496	0.5 cup
1215	107643	497	0.5 cup
1216	107643	498	14.0 ounce
1217	107643	499	0.5 cup
1218	107643	244	1.0 cup
1219	107643	392	2.0 tablespoons
1220	107643	500	2.0 
1221	107643	151	1.0 
1222	478349	384	0.333333333333 c
1223	478349	284	2.0 c
1224	478349	111	3.0 tbsps
1225	478349	79	2.0 
1226	478349	385	5.0 
1227	478349	88	2.0 
1228	478349	33	4.0 servings
1229	478349	386	500.0 g
1230	478349	97	1.0 clove
1231	478349	387	0.25 
1232	203978	86	0.25 cup
1233	203978	284	1.5 pounds
1234	203978	501	2.0 tablespoons
1235	203978	74	2.0 quarts
1236	203978	495	1.5 teaspoons
1237	203978	165	3.0 
1238	203978	366	1.5 tablespoons
1239	203978	95	1.0 teaspoon
1240	203978	15	4.0 servings
1241	203978	502	8.0 
1242	11501	284	4.0 servings
1243	11501	156	2.0 cups
1244	11501	89	1.0 
1245	11501	503	1.0 
1246	11501	205	2.0 Tbsps
1247	11501	476	4.0 cups
1248	11501	504	4.0 
1249	11501	374	0.333333333333 cup
1250	11563	1	30.0 g
1251	11563	9	1.0 Tbsp
1252	11563	284	750.0 g
1253	11563	243	100.0 g
1254	11563	37	1.0 kg
1255	11563	505	1.0 Tbsp
1256	11563	476	200.0 g
1257	11563	135	2.0 servings
1258	11563	506	2.0 servings
1259	11563	7	125.0 ml
1260	509280	284	0.5 cup
1261	509280	507	0.5 
1262	509280	100	1.0 
1263	509280	508	2.0 tablespoons
1264	509280	509	0.5 teaspoon
1265	509280	33	1.0 serving
1266	509280	236	0.5 
1267	509280	510	0.25 
1268	509280	97	1.0 
1269	509280	151	1.0 
1270	583101	284	2.0 lb
1271	583101	378	8.0 servings
1272	583101	6	2.0 tsp
1273	583101	81	2.0 
1274	583101	511	5.0 
1275	583101	157	1.0 stick
1276	583101	69	1.0 
1277	583101	495	5.0 
1278	583101	201	2.0 
1279	212453	512	990.0 ml
1280	212453	25	6.0 
1281	212453	284	500.0 g
1282	212453	513	1.0 tsp
1283	212453	102	1.0 pinch
1284	212453	514	1.0 l
1285	212453	515	6.0 servings
1286	212453	236	5.0 
1287	212453	9	4.0 tbsp
1288	212453	516	2.0 
1289	212453	517	85.0 g
1290	556537	1	1.0 T
1291	556537	518	2.0 slices
1292	556537	216	2.0 oz
1293	556537	79	2.0 
1294	556537	519	0.5 c
1295	556537	520	1.0 serving
1296	556537	284	3.0 oz
1297	556537	33	1.0 serving
1298	556537	521	0.25 c
1299	97791	284	2.5 lbs
1300	97791	522	2.0 teaspoons
1301	97791	523	1.0 teaspoon
1302	97791	201	1.5 cups
1303	97791	4	2.0 cups
1304	97791	66	2.0 cloves
1305	97791	96	2.0 tablespoons
1306	97791	524	1.0 tablespoon
1307	97791	302	0.5 cup
1308	97791	525	6.0 servings
1309	226838	443	1.0 cup
1310	226838	284	8.0 slices
1311	226838	335	8.0 slices
1312	226838	133	1.0 cup
1313	226838	121	2.0 
1314	226838	7	1.0 tablespoon
1315	226838	33	4.0 servings
1316	226838	526	1.0 cup
1317	226838	527	2.0 tablespoons
1318	226838	356	1.0 teaspoon
1319	226838	528	1.0 teaspoon
1320	26215	36	1.0 cup
1321	26215	284	15.0 ozs
1322	26215	529	16.0 ozs
1323	26215	6	1.0 tsp
1324	26215	121	6.0 
1325	26215	333	0.5 cup
1326	26215	248	1.0 lb
1327	26215	530	10.0 ozs
1328	26215	7	4.0 cups
1329	521938	284	0.5 c
1330	521938	488	4.0 c
1331	521938	489	4.0 servings
1332	521938	431	1.0 
1333	521938	121	3.0 
1334	521938	75	0.5 c
1335	521938	33	4.0 servings
1336	521938	165	1.0 bunch
1337	521938	490	2.0 tbsps
1338	521938	491	0.5 c
1339	521938	245	2.0 tbsps
1340	347907	531	2.0 cups
1341	347907	284	10.0 servings
1342	347907	532	0.5 cup
1343	347907	6	1.0 tablespoon
1344	347907	533	5.0 pound
1345	347907	534	1.5 teaspoons
1346	347907	66	4.0 cloves
1347	347907	201	2.0 
1348	347907	356	1.0 tablespoon
1349	347907	535	1.0 cup
1350	210792	86	2.0 tbsp
1351	210792	25	2.0 
1352	210792	284	400.0 g
1353	210792	401	1.0 tbsp
1354	210792	480	1.0 tbsp
1355	210792	227	1.0 
1356	210792	95	1.0 tsp
1357	210792	14	140.0 g
1358	210792	245	75.0 ml
1359	616391	1	1.0 tablespoon
1360	616391	284	1.0 package
1361	616391	99	4.0 servings
1362	616391	133	4.0 servings
1363	616391	533	3.0 pound
1364	616391	4	1.0 cup
1365	616391	232	8.0 
1366	616391	210	1.5 cups
1367	616391	283	0.5 cup
1368	616391	29	3.0 
1369	522193	284	150.0 g
1370	522193	111	2.0 tbsps
1371	522193	79	1.0 
1372	522193	408	1.0 bunch
1373	522193	188	1.0 pinch
1374	522193	88	1.0 tbsp
1375	522193	95	3.0 servings
1376	522193	110	1.0 tsp
1377	522193	486	2.0 
1378	522193	489	3.0 servings
1379	522193	536	12.0 
1380	565284	357	2.0 
1381	565284	284	200.0 g
1382	565284	87	1.0 tsp
1383	565284	173	1.0 tbsp
1384	565284	537	3.0 servings
1385	565284	538	0.5 tsp
1386	565284	88	4.0 slices
1387	565284	292	1.0 tsp
1388	565284	297	2.0 stalks
1389	565284	66	3.0 cloves
1390	565284	4	40.0 ml
1391	565284	539	0.5 tsp
1392	565284	479	1.0 tbsp
1393	106561	284	0.75 lb
1394	106561	540	0.333333333333 cup
1395	106561	541	0.5 cup
1396	106561	542	2.0 tablespoons
1397	106561	388	8.0 ounce
1398	106561	58	1.0 tablespoon
1399	106561	4	2.0 tablespoons
1400	106561	392	1.0 tablespoon
1401	106561	543	0.5 cup
1402	106561	97	1.0 
1403	106561	544	2.0 tablespoons
1404	22616	131	2.0 tbsp
1405	22616	545	0.25 cup
1406	22616	210	0.5 cup
1407	22616	284	0.5 cup
1408	22616	165	0.25 
1409	22616	198	1.0 
1410	22616	546	2.0 cup
1411	22616	159	0.5 cup
1412	36997	9	1.0 tsp
1413	36997	547	2.0 Tbsps
1414	36997	548	200.0 g
1415	36997	549	2.0 Tbsps
1416	36997	284	400.0 g
1417	36997	244	1.0 tsp
1418	36997	4	2.0 Tbsps
1419	36997	205	2.0 tsps
1420	36997	14	200.0 g
1421	36997	66	1.0 clove
1422	36997	476	2.0 cups
1423	36997	135	4.0 servings
1424	36997	506	4.0 servings
1425	106665	25	2.0 
1426	106665	490	2.0 tablespoons
1427	106665	550	200.0 g
1428	106665	79	1.0 
1429	106665	551	1.0 teaspoon
1430	106665	156	2.0 
1431	106665	284	600.0 g
1432	106665	552	0.333333333333 cup
1433	106665	553	500.0 g
1434	106665	96	1.0 tablespoon
1435	106665	477	300.0 g
1436	106665	554	2.0 tablespoons
1437	567461	9	2.0 tbsp
1438	567461	284	100.0 g
1439	567461	555	1.0 tsp
1440	567461	79	1.0 
1441	567461	556	1.0 
1442	567461	557	3.0 tbsp
1443	567461	244	2.0 tbsp
1444	567461	4	2.0 cups
1445	567461	69	0.25 
1446	567461	558	1.0 tbsp
1447	567461	559	2.0 servings
1448	567461	366	2.0 tbsp
1449	567461	469	0.25 
1450	37069	560	0.25 cup
1451	37069	284	500.0 g
1452	37069	548	150.0 g
1453	37069	561	4.0 servings
1454	37069	95	2.0 Tbsps
1455	37069	292	2.0 tsps
1456	37069	205	2.0 Tbsps
1457	37069	562	250.0 g
1458	37069	490	2.0 tsps
1459	37069	563	1.0 
1460	37069	564	4.0 servings
1461	37069	517	1.0 Tbsp
1462	145647	1	30.0 g
1463	145647	284	750.0 g
1464	145647	99	2.0 tablespoons
1465	145647	565	1.0 teaspoon
1466	145647	226	0.75 cup
1467	145647	79	1.0 
1468	145647	551	1.0 teaspoon
1469	145647	76	250.0 g
1470	145647	302	0.5 cup
1471	145647	85	1.0 teaspoon
1472	143626	86	2.0 tablespoons
1473	143626	157	1.0 cup
1474	143626	284	500.0 g
1475	143626	156	2.0 
1476	143626	488	4.0 servings
1477	143626	226	0.5 cup
1478	143626	551	2.0 teaspoons
1479	143626	95	2.0 tablespoons
1480	143626	566	0.25 cup
1481	143626	244	1.0 teaspoon
1482	143626	98	0.125 teaspoon
1483	16665	25	3.0 
1484	16665	284	3.0 cups
1485	16665	567	3.0 Tb
1486	16665	58	2.0 Tb
1487	16665	568	1.0 cup
1488	16665	95	0.25 cup
1489	16665	569	8.0 
1490	16665	570	1.0 
1491	16665	571	0.5 cup
1492	16665	244	2.0 Tb
1493	16665	572	1.0 
1494	203052	86	1.0 tablespoon
1495	203052	131	4.0 servings
1496	203052	501	6.0 tablespoons
1497	203052	173	3.0 tablespoons
1498	203052	284	3.0 pounds
1499	203052	495	1.0 teaspoon
1500	203052	33	4.0 servings
1501	203052	366	0.25 cup
1502	203052	88	1.0 inch
1503	203052	165	2.0 
1504	203052	539	1.0 tablespoon
1505	203052	573	5.0 cups
1506	45392	1	1.0 Tbsps
1507	45392	102	1.0 tsp
1508	45392	79	1.0 cup
1509	45392	574	8.0 ozs
1510	45392	74	2.0 cups
1511	45392	575	0.333333333333 cup
1512	45392	33	8.0 servings
1513	45392	157	1.0 cup
1514	45392	334	1.0 
1515	45392	126	12.0 ozs
1516	113032	284	1.5 lbs
1517	113032	576	8.0 ounce
1518	113032	173	1.0 tablespoon
1519	113032	403	15.0 ounce
1520	113032	577	1.0 cup
1521	113032	4	0.25 cup
1522	113032	185	3.0 tablespoons
1523	113032	63	10.75 ounce
1524	113032	101	14.5 ounce
1525	113032	356	1.0 teaspoon
1526	113032	234	1.0 cup
1527	143778	9	2.0 tablespoons
1528	143778	284	1.0 lb
1529	143778	578	4.0 servings
1530	143778	79	1.0 
1531	143778	388	8.0 ounce
1532	143778	397	2.0 tablespoons
1533	143778	579	0.5 teaspoon
1534	143778	95	2.0 tablespoons
1535	143778	209	0.333333333333 cup
1536	143778	84	0.25 teaspoon
1537	647656	1	1.0 ounce
1538	647656	57	0.25 teaspoon
1539	647656	6	1.0 teaspoon
1540	647656	201	2.0 
1541	647656	284	5.0 ounces
1542	647656	116	1.5 teaspoons
1543	647656	580	1.0 pinch
1544	647656	69	1.0 piece
1545	647656	302	0.5 pint
1546	647656	101	16.0 ozs
1547	647656	581	4.0 ounces
1548	647656	543	1.0 piece
1549	520701	284	1.0 
1550	520701	565	4.0 servings
1551	520701	111	1.0 tbsp
1552	520701	79	1.0 
1553	520701	495	1.0 tbsp
1554	520701	366	0.25 c
1555	520701	66	6.0 cloves
1556	520701	358	2.0 
1557	520701	539	0.25 c
1558	551453	582	1.0 serving
1559	551453	583	0.25 tsp
1560	551453	584	0.5 
1561	551453	585	1.0 pinch
1562	551453	586	0.25 tsp
1563	551453	587	2.0 
1564	551453	284	100.0 g
1565	551453	588	0.25 cup
1566	551453	589	3.0 tbsp
1567	551453	508	1.0 tsp
1568	551453	590	0.5 cup
1569	522816	1	1.0 tbsps
1570	522816	9	4.0 tbsps
1571	522816	57	6.0 servings
1572	522816	284	6.0 servings
1573	522816	2	2.0 tbsps
1574	522816	591	2.0 c
1575	522816	174	1.0 tbsp
1576	522816	33	6.0 servings
1577	522816	592	6.0 
1578	522816	69	1.0 
1579	522816	37	300.0 g
1580	522816	593	2.0 
1581	522816	206	6.0 servings
1582	522816	6	6.0 servings
1583	522816	337	2.0 
1584	492226	1	1.0 tablespoons
1585	492226	102	1.0 teaspoon
1586	492226	79	1.0 cup
1587	492226	574	8.0 ounces
1588	492226	74	2.0 cups
1589	492226	575	0.333333333333 cup
1590	492226	33	8.0 servings
1591	492226	157	1.0 cup
1592	492226	334	1.0 
1593	492226	126	12.0 ounces
1594	246503	284	300.0 g
1595	246503	79	1.0 
1596	246503	594	1.0 
1597	246503	538	1.0 tbs
1598	246503	236	1.0 
1599	246503	16	3.0 tbs
1600	246503	66	1.0 
1601	246503	246	1.0 stalk
1602	246503	6	0.25 tsp
1603	246503	447	0.5 
1604	146280	9	3.0 tablespoons
1605	146280	25	3.0 
1606	146280	284	2.0 cups
1607	146280	79	1.0 
1608	146280	37	1.75 lbs
1609	146280	336	2.0 teaspoons
1610	146280	6	0.75 teaspoon
1611	146280	165	3.0 
1612	146280	4	1.5 cups
1613	146280	595	3.0 tablespoons
1614	146280	596	0.25 teaspoon
1615	146280	151	1.0 
1616	437120	25	2.0 
1617	437120	47	4.0 cups
1618	437120	79	2.0 cups
1619	437120	58	2.0 tablespoons
1620	437120	156	2.0 cups
1621	437120	223	3.0 cups
1622	437120	57	0.5 teaspoon
1623	437120	597	2.0 teaspoons
1624	437120	301	8.0 servings
1625	437120	284	2.0 pounds
1626	437120	598	28.0 ounces
1627	437120	6	1.0 teaspoon
1628	220036	235	1.0 leaves
1629	220036	25	8.0 
1630	220036	284	1.0 fillet
1631	220036	79	1.0 
1632	220036	497	120.0 ml
1633	220036	599	2.0 
1634	220036	236	1.0 
1635	220036	96	8.0 tbsp
1636	220036	210	1.0 
1637	220036	201	2.0 
1638	146318	1	2.0 tablespoons
1639	146318	25	3.0 
1640	146318	284	2.0 lbs
1641	146318	600	32.0 ounce
1642	146318	523	1.0 teaspoon
1643	146318	244	0.5 teaspoon
1644	146318	116	3.0 teaspoons
1645	146318	13	12.0 ounce
1646	146318	41	0.25 teaspoon
1647	146318	302	1.0 cup
1648	146318	201	2.0 
1649	447384	284	0.75 pound
1650	447384	488	4.0 servings
1651	447384	388	8.0 ounces
1652	447384	545	4.0 servings
1653	447384	58	1.0 tablespoon
1654	447384	156	2.0 
1655	447384	499	0.25 cup
1656	447384	95	1.0 tablespoon
1657	447384	543	4.0 servings
1658	447384	97	1.0 
1659	447384	244	1.0 teaspoon
1660	588717	1	4.0 tbsp
1661	588717	601	2.0 
1662	588717	284	8.0 ounces
1663	588717	540	2.0 tsp
1664	588717	508	1.0 tsp
1665	588717	291	2.0 
1666	588717	4	1.0 tbsp
1667	588717	205	1.0 tbsp
1668	588717	41	2.0 servings
1669	588717	135	2.0 servings
1670	588717	602	4.0 
1671	588717	121	4.0 
1672	588717	603	1.0 tsp
1673	478122	483	1.0 c
1674	478122	79	1.0 
1675	478122	173	1.0 tbsp
1676	478122	385	2.0 
1677	478122	284	1.0 
1678	478122	88	0.5 tsp
1679	478122	110	2.0 servings
1680	478122	287	1.0 c
1681	478122	14	200.0 g
1682	478122	66	4.0 cloves
1683	478122	43	2.0 
1684	119823	25	6.0 
1685	119823	284	1.5 kg
1686	119823	99	3.0 tablespoons
1687	119823	79	1.0 
1688	119823	604	1.0 cup
1689	119823	605	1.0 cup
1690	119823	4	0.75 cup
1691	119823	88	2.0 
1692	119823	606	1.0 teaspoon
1693	119823	607	1.0 tablespoon
1694	119823	24	1.0 teaspoon
1695	119823	6	6.0 servings
1696	599085	284	4.0 pounds
1697	599085	116	1.0 tablespoon
1698	599085	608	1.0 teaspoon
1699	599085	188	2.0 teaspoons
1700	599085	534	1.0 teaspoon
1701	599085	606	0.5 teaspoon
1702	599085	609	4.0 tablespoons
1703	599085	66	2.0 tablespoons
1704	599085	61	2.0 tablespoons
1705	599085	6	1.0 tablespoon
1706	146476	86	3.0 tablespoons
1707	146476	25	4.0 
1708	146476	57	2.0 teaspoons
1709	146476	610	1.0 
1710	146476	203	2.0 teaspoons
1711	146476	48	2.0 tablespoons
1712	146476	284	24.0 ounces
1713	146476	116	1.0 tablespoon
1714	146476	221	0.25 teaspoon
1715	146476	19	0.25 teaspoon
1716	146476	6	0.5 teaspoon
1717	146476	356	1.0 teaspoon
1718	640050	235	1.0 bunch
1719	640050	57	1.0 pinch
1720	640050	611	0.5 teaspoon
1721	640050	79	1.0 
1722	640050	156	0.25 cup
1723	640050	291	4.0 
1724	640050	284	300.0 grams
1725	640050	95	2.0 teaspoons
1726	640050	90	1.0 teaspoon
1727	640050	66	2.0 cloves
1728	640050	244	1.0 pinch
1729	144528	9	1.0 tablespoon
1730	144528	480	2.0 tablespoons
1731	144528	284	2.0 cups
1732	144528	612	1.0 tablespoon
1733	144528	276	15.0 ounce
1734	144528	613	1.5 cups
1735	144528	403	15.0 ounce
1736	144528	33	6.0 servings
1737	144528	333	0.25 cup
1738	144528	510	1.0 
1739	144528	101	15.0 ounce
1740	17619	284	8.0 ozs
1741	17619	173	2.0 Tbsps
1742	17619	244	1.0 pinch
1743	17619	95	2.0 tsps
1744	17619	76	4.0 
1745	17619	392	1.0 tsp
1746	17619	41	6.0 servings
1747	17619	614	6.0 oz
1748	17619	615	24.0 oz
1749	17619	616	6.0 ozs
1750	17619	366	1.0 tsp
1751	17619	617	0.25 cup
1752	249076	57	0.25 teaspoon
1753	249076	79	1.0 
1754	249076	618	1.0 
1755	249076	284	1.0 pound
1756	249076	88	1.0 inch
1757	249076	95	0.5 cup
1758	249076	292	1.0 tablespoon
1759	249076	66	5.0 cloves
1760	249076	244	1.0 tablespoon
1761	249076	29	2.0 
1762	249076	619	1.0 
1763	249076	620	0.5 cup
1764	568618	621	2.0 cups
1765	568618	284	1.5 pound
1766	568618	343	1.0 
1767	568618	79	0.5 
1768	568618	48	0.5 teaspoon
1769	568618	538	1.0 tablespoon
1770	568618	33	4.0 servings
1771	568618	38	0.5 pound
1772	568618	622	1.0 tablespoon
1773	568618	66	3.0 cloves
1774	568618	101	14.5 oz
1775	243067	284	1.0 cup
1776	243067	156	0.25 cup
1777	243067	568	1.0 leaves
1778	243067	538	1.0 teaspoon
1779	243067	623	18.0 inch
1780	243067	624	1.0 teaspoon
1781	243067	625	1.0 slices
1782	243067	53	3.0 tablespoons
1783	243067	201	0.333333333333 cup
1784	615855	235	0.5 teaspoon
1785	615855	73	0.5 teaspoon
1786	615855	57	0.25 teaspoon
1787	615855	405	1.0 teaspoon
1788	615855	121	10.0 
1789	615855	509	1.0 teaspoon
1790	615855	574	12.0 ounces
1791	615855	626	1.0 cup
1792	615855	185	1.0 cup
1793	615855	6	0.25 teaspoon
1794	615855	7	1.0 cup
1795	615855	627	10.0 servings
1796	157207	284	10.0 servings
1797	157207	628	10.0 servings
1798	157207	328	10.0 servings
1799	157207	256	10.0 servings
1800	157207	40	10.0 servings
1801	157207	629	1.0 pound
1802	157207	495	10.0 servings
1803	157207	630	10.0 servings
1804	157207	135	10.0 servings
1805	157207	222	1.0 
1806	157207	631	1.0 leaf
1807	157207	632	10.0 servings
1818	93848	25	2.0 
1819	93848	284	2.0 lbs
1820	93848	99	3.0 tablespoons
1821	93848	600	2.0 lbs
1822	93848	523	0.25 teaspoon
1823	93848	6	1.0 teaspoon
1824	93848	67	3.0 slices
1825	93848	116	2.0 tablespoons
1826	93848	637	0.5 lb
1827	93848	302	8.0 ounces
1828	93848	201	2.0 
1829	304822	284	6.0 ounces
1830	304822	638	1.0 cup
1831	304822	568	0.25 cup
1832	304822	639	2.0 pounds
1833	304822	248	1.0 loaf
1834	304822	66	5.0 cloves
1835	304822	114	1.0 
1836	304822	640	0.75 cup
1837	304822	18	2.0 tablespoons
1838	212766	235	1.0 bunch
1839	212766	284	750.0 g
1840	212766	641	1.0 
1841	212766	358	5.0 
1842	212766	642	2.0 tbsp
1843	212766	236	1.0 
1844	212766	49	3.0 tbsp
1845	212766	643	1.0 
1846	212766	644	4.0 servings
1847	212766	201	2.0 
1848	212766	645	2.0 tbsp
1849	40736	86	1.0 tbs
1850	40736	4	2.0 servings
1851	40736	284	1.0 tbs
1852	40736	90	1.0 tbs
1853	40736	646	0.5 cup
1854	40736	95	4.0 oz
1855	40736	76	0.5 cup
1856	40736	392	1.0 tbs
1857	40736	614	0.5 cup
1858	40736	647	8.0 oz
1859	40736	244	1.0 pinch
1860	97660	465	400.0 g
1861	97660	648	12.0 
1862	97660	649	1.0 tablespoon
1863	97660	9	1.0 tablespoon
1864	97660	564	100.0 g
1865	97660	650	1.0 
1866	97660	212	60.0 g
1867	97660	65	1.0 tablespoon
1868	97660	97	1.0 
1869	97660	104	0.5 
1870	381354	465	2.0 racks
1871	381354	651	0.5 
1872	381354	652	0.5 cup
1873	381354	653	20.0 servings
1874	381354	654	1.0 sprigs
1875	381354	125	1.0 
1876	381354	9	20.0 servings
1877	381354	33	20.0 servings
1878	381354	655	1.0 
1879	381354	302	0.25 cup
1880	381354	338	1.0 Slice
1881	15803	465	4.0 
1882	15803	9	4.0 Tbsps
1883	15803	499	1.0 Tbsp
1884	15803	656	0.25 cup
1885	15803	227	0.25 
1886	15803	356	0.5 tsp
1887	15803	657	1.0 cup
1888	15803	658	6.0 cups
1889	15803	631	2.0 Tbsps
1890	15803	15	4.0 servings
1891	15803	659	0.25 cup
1892	22997	465	1.5 lbs
1893	22997	660	0.5 cups
1894	22997	99	0.25 cups
1895	22997	6	8.0 servings
1896	22997	661	0.25 cup
1897	22997	156	0.5 cups
1898	22997	4	6.0 cups
1899	22997	205	1.5 tsp
1900	22997	475	0.5 cups
1901	22997	662	3.5 tbsp
1902	22997	201	3.0 cups
1903	15840	465	2.0 
1904	15840	9	1.0 serving
1905	15840	21	1.0 
1906	15840	218	200.0 ml
1907	15840	663	1.0 serving
1908	15840	66	2.0 cloves
1909	15840	338	1.0 
1910	15840	22	1.0 sprig
1911	15840	664	1.0 tbsp
1912	15840	659	1.0 tbsp
1913	95712	665	2.0 
1914	95712	465	2.5 cups
1915	95712	86	8.0 servings
1916	95712	666	1.0 cup
1917	95712	31	1.0 teaspoon
1918	95712	667	2.0 tablespoons
1919	95712	2	0.25 cup
1920	95712	262	0.5 cup
1921	95712	9	0.25 cup
1922	95712	668	0.25 cup
1923	95712	169	2.0 cups
1924	95712	206	8.0 servings
1925	95712	669	4.0 ounces
1926	97768	465	600.0 g
1927	97768	25	4.0 
1928	97768	99	2.0 tablespoons
1929	97768	79	1.0 
1930	97768	670	0.25 cup
1931	97768	171	1.0 
1932	97768	69	1.0 
1933	97768	671	2.0 teaspoons
1934	97768	418	4.0 servings
1935	97768	101	400.0 g
1936	220681	465	1.0 
1937	220681	25	2.0 
1938	220681	532	2.0 tbsp
1939	220681	539	6.0 tbsp
1940	220681	88	1.0 piece
1941	220681	672	1.0 
1942	220681	297	3.0 
1943	220681	366	150.0 ml
1944	220681	475	0.25 
1945	220681	673	1.0 tbsp
1946	97889	674	0.125 teaspoon
1947	97889	465	4.0 
1948	97889	675	14.0 fluid ounces
1949	97889	580	0.5 teaspoon
1950	97889	676	4.0 ounces
1951	97889	348	0.25 teaspoon
1952	97889	211	0.5 teaspoon
1953	97889	597	0.5 teaspoon
1954	97889	65	0.5 teaspoon
1955	97889	84	0.5 teaspoon
1956	97889	6	0.25 teaspoon
1957	56929	1	5.5 Tbsps
1958	56929	465	3.0 lbs
1959	56929	677	5.0 ozs
1960	56929	661	0.333333333333 cup
1961	56929	33	5.0 servings
1962	56929	678	1.0 Tbsp
1963	56929	19	1.0 tsp
1964	56929	86	2.0 Tbsps
1965	56929	418	1.25 cups
1966	56929	679	0.5 cup
1967	311906	465	10.0 
1968	311906	25	4.0 
1969	311906	79	1.0 
1970	311906	104	2.0 
1971	311906	125	1.0 
1972	311906	9	1.0 tablespoon
1973	311906	561	1.0 tablespoon
1974	311906	680	8.0 tablespoons
1975	311906	206	0.5 teaspoon
1976	311906	530	1.0 package
1977	311906	356	0.25 teaspoon
1978	91849	465	1500.0 g
1979	91849	9	4.0 tablespoons
1980	91849	488	12.0 servings
1981	91849	37	500.0 g
1982	91849	334	500.0 g
1983	91849	289	2.0 cups
1984	91849	293	1.5 cups
1985	91849	681	800.0 g
1986	91849	201	2.0 
1987	91849	119	210.0 g
1988	98037	465	6.0 slabs
1989	98037	480	2.0 tablespoons
1990	98037	496	0.5 cup
1991	98037	682	2.0 tablespoons
1992	98037	568	1.0 tablespoon
1993	98037	9	1.0 tablespoon
1994	98037	95	2.0 tablespoons
1995	98037	27	1.0 tablespoon
1996	98037	397	0.25 cup
1997	98037	33	6.0 servings
1998	98037	410	1.0 tablespoon
1999	98037	544	0.25 cup
2000	98079	465	750.0 g
2001	98079	25	3.0 
2002	98079	548	150.0 g
2003	98079	565	3.0 teaspoons
2004	98079	87	100.0 ml
2005	98079	292	1.0 teaspoon
2006	98079	27	2.0 teaspoons
2007	98079	683	2.0 
2008	98079	96	3.0 tablespoons
2009	98079	293	60.0 ml
2010	98079	294	1.0 tablespoon
2011	98079	559	400.0 g
2012	98079	490	2.0 tablespoons
2013	98094	1	2.0 tablespoons
2014	98094	684	1.0 pinch
2015	98094	79	1.0 
2016	98094	685	1.0 lb
2017	98094	686	3.0 tablespoons
2018	98094	404	0.5 teaspoon
2019	98094	9	4.0 tablespoons
2020	98094	4	1.0 cup
2021	98094	465	1.0 lb
2022	98094	19	0.5 teaspoon
2023	98094	84	0.25 teaspoon
2024	98094	6	0.5 teaspoon
2025	98094	96	2.0 tablespoons
2026	98114	465	4.0 fillet
2027	98114	25	3.0 
2028	98114	359	2.0 teaspoons
2029	98114	328	20.0 leaves
2030	98114	687	2.0 
2031	98114	125	1.0 
2032	98114	9	3.0 tablespoons
2033	98114	688	20.0 
2034	98114	155	1.0 cup
2035	98114	104	1.0 
2036	213830	465	250.0 g
2037	213830	689	1.0 handful
2038	213830	79	1.0 
2039	213830	690	1.0 tsp
2040	213830	2	250.0 g
2041	213830	197	2.0 tbsp
2042	213830	6	0.5 tsp
2043	213830	244	1.0 tsp
2044	213830	4	150.0 ml
2045	213830	691	2.0 tbsp
2046	213830	97	1.0 
2047	213830	692	1.0 tsp
2048	213830	356	1.0 tsp
2049	34656	665	2.0 
2050	34656	465	2.5 cups
2051	34656	86	6.0 servings
2052	34656	666	1.0 cup
2053	34656	31	1.0 tsp
2054	34656	667	2.0 Tbsps
2055	34656	2	0.25 cup
2056	34656	262	0.5 cup
2057	34656	9	0.25 cup
2058	34656	668	0.25 cup
2059	34656	169	2.0 cups
2060	34656	206	6.0 servings
2061	34656	669	4.0 ozs
2062	92065	465	1.0 
2063	92065	407	1.25 cups
2064	92065	378	1.0 teaspoon
2065	92065	693	0.25 cup
2066	92065	694	2.0 tablespoons
2067	92065	291	3.0 
2068	92065	695	1.0 teaspoon
2069	92065	696	0.25 cup
2070	92065	206	2.0 servings
2071	92065	697	0.5 tablespoon
2072	92065	18	2.0 teaspoons
2073	97215	465	1.0 lb
2074	97215	25	2.0 
2075	97215	203	2.0 teaspoons
2076	97215	698	0.25 cup
2077	97215	205	1.0 
2078	97215	41	1.0 teaspoon
2079	97215	221	0.5 teaspoon
2080	97215	699	2.0 
2081	97215	6	1.5 teaspoons
2082	97215	700	0.5 cup
2083	97215	701	1.0 lb
2084	337917	465	2.0 
2085	337917	9	35.0 servings
2086	337917	547	1.0 tablespoon
2087	337917	121	2.0 
2088	337917	174	1.0 tablespoon
2089	337917	394	0.75 cup
2090	337917	397	2.0 tablespoons
2091	337917	66	1.0 clove
2092	337917	53	0.75 cup
2093	337917	15	35.0 servings
2094	337917	82	8.0 
2095	97310	73	4.0 servings
2096	97310	465	1.25 pounds
2097	97310	361	10.0 ounce
2098	97310	156	1.0 cup
2099	97310	79	1.0 
2100	97310	74	0.5 cup
2101	97310	702	15.0 ounce
2102	97310	9	3.0 tablespoons
2103	97310	205	1.0 tablespoon
2104	97310	703	0.5 cup
2105	97310	506	4.0 servings
2106	97339	1	1.0 ounce
2107	97339	465	2.0 lbs
2108	97339	79	1.0 
2109	97339	2	1.0 tablespoon
2110	97339	156	2.0 
2111	97339	244	0.5 tablespoon
2112	97339	704	1.0 
2113	97339	293	0.5 pint
2114	97339	37	2.0 
2115	97339	662	2.0 tablespoons
2116	97339	596	4.0 servings
2117	97339	705	12.0 ounce
2118	97339	50	4.0 servings
2119	16459	465	3.5 lb
2120	16459	25	3.0 
2121	16459	79	1.0 
2122	16459	408	1.5 lb
2123	16459	101	14.0 oz
2124	16459	156	12.0 
2125	16459	4	2.0 cups
2126	16459	6	1.5 teaspoons
2127	16459	9	1.0 tablespoons
2128	16459	157	1.0 rib
2129	16459	706	8.0 servings
2130	16459	41	1.0 teaspoon
2131	16459	692	2.0 teaspoons
2132	16459	356	4.0 teaspoons
2133	200786	465	1.25 pounds
2134	200786	25	2.0 
2135	200786	641	2.0 inch
2136	200786	81	2.0 
2137	200786	707	0.25 cup
2138	200786	534	0.75 teaspoon
2139	200786	27	1.0 piece
2140	200786	35	0.5 cup
2141	200786	699	8.0 
2142	200786	23	0.5 teaspoon
2143	200786	6	1.25 teaspoons
2144	200786	58	3.0 tablespoons
2145	541891	465	1.5 pounds
2146	541891	25	2.0 
2147	541891	131	4.0 servings
2148	541891	708	2.0 teaspoons
2149	541891	227	1.0 
2150	541891	677	1.0 cup
2151	541891	9	2.0 tablespoons
2152	541891	534	0.25 teaspoon
2153	541891	709	1.0 
2154	541891	710	2.0 cups
2155	541891	135	4.0 servings
2156	541891	692	2.0 teaspoons
2157	541891	98	1.0 teaspoon
2158	97539	465	2.0 lbs
2159	97539	661	0.25 cup
2160	97539	74	2.0 cups
2161	97539	69	1.0 cup
2162	97539	43	2.0 cups
2163	97539	418	10.0 ounce
2164	97539	201	2.0 
2165	97539	356	1.5 teaspoons
2166	97539	78	0.25 teaspoon
2167	97539	711	0.5 teaspoon
2168	97614	1	1.0 teaspoon
2169	97614	235	1.0 tablespoon
2170	97614	359	1.0 teaspoon
2171	97614	79	1.0 
2172	97614	224	2.0 ounces
2173	97614	121	5.0 
2174	97614	174	1.0 tablespoon
2175	97614	9	2.0 tablespoons
2176	97614	244	2.0 teaspoons
2177	97614	465	8.0 ounces
2178	97614	19	1.0 teaspoon
2179	97614	712	14.0 oz
2180	15725	465	2.0 lb
2181	15725	25	3.0 
2182	15725	488	4.0 servings
2183	15725	6	2.0 tsp
2184	15725	88	2.0 Tb
2185	15725	4	2.0 cups
2186	15725	713	1.0 
2187	15725	19	0.25 tsp
2188	15725	510	1.0 
2189	15725	714	1.0 tsp
2190	15725	692	1.0 Tb
2191	15725	700	1.0 cup
2192	15725	490	3.0 Tb
2205	525822	465	2.5 Pounds
2206	525822	540	1.0 Tbsp
2207	525822	717	8.0 
2208	525822	79	0.5 
2209	525822	2	2.0 Tbsp
2210	525822	58	1.0 Tbsp
2211	525822	156	2.0 
2212	525822	153	4.0 
2213	525822	593	2.0 
2214	525822	716	1.0 Cup
2215	525822	293	3.0 Cups
2216	525822	464	3.0 sprigs
2227	97849	465	200.0 g
2228	97849	9	1.0 teaspoon
2229	97849	719	2.0 tablespoons
2230	97849	650	1.0 
2231	97849	596	6.0 drops
2232	97849	66	1.0 tablespoon
2233	97849	196	1.0 tablespoon
2234	97849	302	3.0 tablespoons
2235	97849	84	0.25 teaspoon
2236	97849	720	2.0 cups
2237	97849	338	100.0 g
2238	97852	465	2.0 
2239	97852	25	2.0 
2240	97852	721	4.0 servings
2241	97852	104	1.0 
2242	97852	40	1.0 tablespoon
2243	97852	143	1.0 teaspoon
2244	97852	9	1.0 tablespoon
2245	97852	155	2.0 tablespoons
2246	97852	383	1.0 
2247	97852	418	4.0 servings
2248	97852	97	1.0 
2249	97852	135	4.0 servings
2250	97852	151	2.0 tablespoons
2251	97852	50	4.0 servings
2252	97874	465	500.0 g
2253	97874	25	2.0 
2254	97874	79	0.5 
2255	97874	404	0.5 teaspoon
2256	97874	9	2.0 tablespoons
2257	97874	688	6.0 
2258	97874	660	1.0 
2259	97874	205	2.0 tablespoons
2260	97874	19	0.25 teaspoon
2261	97874	692	1.5 teaspoons
2262	97874	356	0.5 teaspoon
2263	97908	235	2.0 tablespoons
2264	97908	465	1.0 kg
2265	97908	652	1.0 teaspoon
2266	97908	21	1.0 
2267	97908	79	1.0 
2268	97908	75	500.0 g
2269	97908	9	2.0 tablespoons
2270	97908	33	4.0 servings
2271	97908	43	2.0 
2272	97908	722	1.0 pinch
2273	97908	723	12.0 
2274	97908	98	1.0 teaspoon
2275	97920	684	0.25 teaspoons
2276	97920	465	2.0 pounds
2277	97920	79	1.0 cup
2278	97920	37	2.0 
2279	97920	32	4.0 cups
2280	97920	568	1.0 leaves
2281	97920	9	1.0 tablespoons
2282	97920	724	5.0 cups
2283	97920	19	0.5 teaspoons
2284	97920	84	0.25 teaspoons
2285	97920	725	1.0 cup
2286	16028	465	3.0 lb
2287	16028	99	3.0 Tbsps
2288	16028	6	4.0 servings
2289	16028	156	3.0 
2290	16028	726	1.0 Tbsp
2291	16028	75	4.0 lbs
2292	16028	157	0.5 Head
2293	16028	392	4.0 servings
2294	16028	716	375.0 mLs
2295	16028	293	1.0 
2296	16028	510	1.0 
2297	16028	244	4.0 servings
2298	16028	464	1.0 bunch
2299	220839	399	400.0 g
2300	220839	25	2.0 
2301	220839	727	700.0 ml
2302	220839	357	1.0 
2303	220839	605	1.0 handful
2304	220839	86	1.0 tbsp
2305	220839	570	1.0 
2306	220839	728	400.0 ml
2307	220839	465	600.0 g
2308	220839	714	3.0 tbsp
2309	220839	201	2.0 
2310	247521	465	0.5 pound
2311	247521	729	1.0 tablespoon
2312	247521	57	4.0 servings
2313	247521	79	0.5 
2314	247521	408	4.0 cups
2315	247521	9	0.25 cup
2316	247521	730	8.0 sheets
2317	247521	66	1.0 clove
2318	247521	660	1.0 inch
2319	247521	635	2.0 tablespoons
2320	247521	731	0.25 
2321	247521	29	2.0 
2322	96999	1	2.0 tablespoons
2323	96999	465	1.0 lb
2324	96999	57	6.0 servings
2325	96999	79	1.0 
2326	96999	732	1.0 cup
2327	96999	74	8.0 cups
2328	96999	509	0.25 teaspoon
2329	96999	9	2.0 tablespoons
2330	96999	69	1.0 
2331	96999	733	0.25 teaspoon
2332	96999	97	1.0 
2333	96999	725	1.0 cup
2334	96999	6	6.0 servings
2335	36615	465	1.4 kg
2336	36615	44	3.0 
2337	36615	734	2.0 
2338	36615	37	6.0 
2339	36615	33	6.0 servings
2340	36615	66	1.0 clove
2341	36615	735	1.0 kg
2342	36615	727	700.0 ml
2343	36615	692	1.0 tsp
2344	36615	356	1.0 tsp
2345	36615	18	1.0 tbs
2346	98084	465	2.0 fillet
2347	98084	25	3.0 
2348	98084	652	0.5 teaspoon
2349	98084	280	1.0 teaspoon
2350	98084	9	2.0 tablespoons
2351	98084	116	1.0 teaspoon
2352	98084	205	2.0 tablespoons
2353	98084	733	0.5 teaspoon
2354	98084	244	1.0 teaspoon
2355	98084	692	1.0 teaspoon
2356	98084	356	1.0 teaspoon
2357	98084	98	0.5 teaspoon
2358	98110	465	1.0 lb
2359	98110	25	2.0 
2360	98110	510	1.0 
2361	98110	736	1.0 liter
2362	98110	4	1.0 cup
2363	98110	41	1.0 teaspoon
2364	98110	737	1.0 teaspoon
2365	98110	622	3.0 tablespoons
2366	98110	714	0.5 teaspoon
2367	98110	596	1.0 dash
2368	98110	6	2.0 teaspoons
2369	98110	43	3.0 
2370	98110	738	1.0 lb
2371	98123	465	1.5 kg
2372	98123	739	1.0 tablespoon
2373	98123	641	0.75 inch
2374	98123	740	1.0 pinch
2375	98123	534	0.5 teaspoon
2376	98123	116	4.0 teaspoons
2377	98123	99	6.0 tablespoons
2378	98123	91	1.5 teaspoons
2379	98123	526	3.66666666667 cups
2380	98123	718	0.25 teaspoon
2381	98123	6	4.0 servings
2382	98123	700	3.25 cups
2383	97109	1	2.0 teaspoons
2384	97109	235	1.0 teaspoon
2385	97109	79	1.0 cup
2386	97109	25	2.0 
2387	97109	741	1.0 teaspoon
2388	97109	408	5.0 ounces
2389	97109	509	1.0 teaspoon
2390	97109	534	0.125 teaspoon
2391	97109	4	0.25 cup
2392	97109	41	0.25 teaspoon
2393	97109	660	1.0 
2394	97109	465	0.5 lb
2395	97109	6	0.25 teaspoon
2396	16229	465	2.0 
2397	16229	742	50.0 g
2398	16229	652	4.0 Tbsps
2399	16229	135	1.0 tsp
2400	16229	41	1.0 serving
2401	16229	66	1.0 
2402	16229	743	4.0 
2403	16229	744	1.0 handful
2404	16229	745	1.0 serving
2405	16229	746	250.0 g
2406	16229	692	1.0 tsp
2407	16229	356	1.0 tsp
2408	16229	85	3.0 sprigs
2409	98173	465	2.0 lbs
2410	98173	9	0.333333333333 cup
2411	98173	79	1.0 
2412	98173	201	2.0 teaspoons
2413	98173	81	3.0 
2414	98173	244	0.5 teaspoon
2415	98173	700	0.666666666667 cup
2416	98173	22	5.0 
2417	98173	84	6.0 servings
2418	98173	104	1.0 
2419	98173	605	1.0 tablespoon
2420	98173	747	1.0 tablespoon
2421	207782	465	1.5 pounds
2422	207782	25	1.0 
2423	207782	102	1.0 teaspoon
2424	207782	39	1.0 cup
2425	207782	32	1.0 cup
2426	207782	748	2.0 strips
2427	207782	174	2.0 tablespoons
2428	207782	33	4.0 servings
2429	207782	205	2.0 teaspoons
2430	207782	68	2.0 
2431	207782	2	2.0 tablespoons
2432	207782	86	2.0 tablespoons
2433	207782	337	3.0 
2434	16359	465	500.0 g
2435	16359	686	2.0 tbs
2436	16359	40	1.0 tbs
2437	16359	125	1.0 
2438	16359	174	1.0 tbs
2439	16359	116	1.0 tsp
2440	16359	16	1.0 tbs
2441	16359	66	1.0 clove
2442	16359	745	3.0 servings
2443	16359	692	1.0 tsp
2444	16359	356	1.0 tsp
2445	649184	1	0.5 pound
2446	649184	235	1.0 
2447	649184	79	1.0 
2448	649184	653	115.0 grams
2449	649184	749	1.0 
2450	649184	41	1.0 serving
2451	649184	19	2.0 teaspoons
2452	649184	465	550.0 grams
2453	649184	750	1.0 teaspoon
2454	649184	155	1.0 
2455	649184	751	1.0 Chunks
2456	649184	135	1.0 serving
2457	517174	465	1.75 pounds
2458	517174	9	1.0 tablespoon
2459	517174	752	2.0 cups
2460	517174	343	1.0 
2461	517174	31	1.0 tablespoon
2462	517174	2	0.333333333333 cup
2463	517174	753	0.25 cup
2464	517174	754	0.75 cup
2465	517174	755	12.0 ounce
2466	517174	41	0.25 teaspoon
2467	517174	66	3.0 cloves
2468	517174	107	0.25 cup
2469	517174	756	4.0 cups
2470	517174	302	1.0 cup
2471	517174	6	0.5 teaspoon
2472	97334	465	1.0 lb
2473	97334	99	2.0 tablespoons
2474	97334	6	1.5 teaspoons
2475	97334	79	1.0 tablespoon
2476	97334	37	2.0 
2477	97334	174	2.0 tablespoons
2478	97334	757	0.5 lb
2479	97334	4	3.0 cups
2480	97334	205	1.0 tablespoon
2481	97334	41	0.5 teaspoon
2482	97334	419	0.5 cup
2483	97334	733	0.5 teaspoon
2484	97334	456	2.0 tablespoons
2485	97334	151	1.0 
2486	97334	469	2.0 
2487	97349	465	500.0 g
2488	97349	689	1.0 tablespoon
2489	97349	135	4.0 servings
2490	97349	21	1.0 
2491	97349	405	0.5 teaspoon
2492	97349	464	4.0 
2493	97349	758	1.0 
2494	97349	607	1.0 teaspoon
2495	97349	4	1.0 liter
2496	97349	662	3.0 tablespoons
2497	97349	759	200.0 g
2498	97349	104	0.5 
2499	97349	711	1.0 teaspoon
2500	97385	465	1.0 lb
2501	97385	25	4.0 
2502	97385	99	2.0 tablespoons
2503	97385	79	1.0 
2504	97385	201	2.0 
2505	97385	509	1.0 tablespoon
2506	97385	116	2.0 teaspoons
2507	97385	4	2.0 cups
2508	97385	622	2.0 tablespoons
2509	97385	282	1.0 tablespoon
2510	97385	84	0.5 teaspoon
2511	97385	760	1.0 
2512	97385	692	2.0 teaspoons
2513	97435	465	1.0 lb
2514	97435	25	3.0 
2515	97435	131	1.0 bunch
2516	97435	187	3.0 
2517	97435	761	1.0 bunch
2518	97435	762	15.0 ounce
2519	97435	174	1.0 bunch
2520	97435	33	4.0 servings
2521	97435	4	4.0 cups
2522	97435	408	1.0 bunch
2523	97435	221	1.0 pinch
2524	97435	19	0.25 teaspoon
2525	97435	464	1.0 bunch
2526	144563	131	2.0 tablespoons
2527	144563	576	2.0 
2528	144563	763	1.0 kg
2529	144563	698	2.0 teaspoons
2530	144563	6	6.0 servings
2531	144563	629	1.0 tablespoon
2532	144563	764	2.0 teaspoons
2533	144563	99	2.0 tablespoons
2534	144563	244	2.0 teaspoons
2535	144563	765	0.5 teaspoon
2536	144563	41	1.0 teaspoon
2537	144563	766	2.0 teaspoons
2538	144563	767	8.0 
2539	144563	201	4.0 
2540	144563	43	4.0 
2541	203969	465	1.0 pound
2542	203969	99	0.25 cup
2543	203969	501	3.0 tablespoons
2544	203969	79	1.0 
2545	203969	39	0.5 cup
2546	203969	81	2.0 
2547	203969	495	1.0 teaspoon
2548	203969	165	3.0 
2549	203969	90	1.0 tablespoon
2550	203969	38	1.0 tablespoon
2551	203969	66	1.0 head
2552	203969	95	1.0 teaspoon
2553	97490	1	1.0 tablespoon
2554	97490	465	2.0 lbs
2555	97490	689	0.5 teaspoon
2556	97490	174	0.5 cup
2557	97490	33	6.0 servings
2558	97490	768	3.0 
2559	97490	205	3.0 tablespoons
2560	97490	154	28.0 ounce
2561	97490	66	2.0 cloves
2562	97490	660	1.0 can
2563	97490	622	3.0 ounces
2564	97490	716	1.0 cup
2565	498917	465	1.0 lb
2566	498917	480	0.25 cup
2567	498917	171	0.5 
2568	498917	244	1.0 teaspoon
2569	498917	538	1.0 tablespoon
2570	498917	86	2.0 tablespoons
2571	498917	769	1.0 leaves
2572	498917	41	4.0 servings
2573	498917	66	3.0 cloves
2574	498917	770	4.0 servings
2575	498917	771	0.5 teaspoon
2576	498917	475	1.0 
2577	498917	165	6.0 
2578	498917	43	2.0 
2579	22811	465	480.0 g
2580	22811	464	6.0 servings
2581	22811	21	1.0 tsp
2582	22811	772	1.0 
2583	22811	773	1.0 pinch
2584	22811	774	500.0 g
2585	22811	40	2.0 tbs
2586	22811	6	1.0 tsp
2587	22811	4	300.0 ml
2588	22811	297	2.0 
2589	22811	66	0.5 clove
2590	22811	775	50.0 g
2591	22811	135	6.0 servings
2592	22811	746	150.0 g
2593	22811	104	1.0 
2594	97598	399	2.0 cups
2595	97598	1	0.5 cup
2596	97598	677	1.0 cup
2597	97598	203	0.25 teaspoon
2598	97598	79	1.0 
2599	97598	776	0.333333333333 cup
2600	97598	661	0.5 cup
2601	97598	722	0.5 teaspoon
2602	97598	33	6.0 servings
2603	97598	465	1.0 lb
2604	97598	733	1.0 teaspoon
2605	97598	725	1.0 cup
2606	155969	465	1.0 pound
2607	155969	9	2.0 tablespoons
2608	155969	777	0.5 cup
2609	155969	156	0.5 cup
2610	155969	33	6.0 servings
2611	155969	157	0.5 cup
2612	155969	609	2.0 cups
2613	155969	205	1.0 tablespoon
2614	155969	66	2.0 cloves
2615	155969	660	2.0 tablespoons
2616	155969	778	3.0 tablespoons
2617	155969	86	6.0 servings
2618	155969	225	3.0 tablespoons
2619	155969	201	1.0 cup
2620	322946	465	3.0 pounds
2621	322946	779	0.5 cup
2622	322946	780	2.0 ounces
2623	322946	781	60.0 servings
2624	322946	284	1.0 pound
2625	322946	782	60.0 servings
2626	322946	41	1.0 tablespoon
2627	322946	783	0.25 cup
2628	322946	212	60.0 servings
2629	322946	83	1.0 
2630	322946	784	30.0 
2631	322946	716	0.5 cup
2632	322946	15	60.0 servings
2633	322946	747	1.0 cup
2634	97694	465	600.0 g
2635	97694	9	60.0 ml
2636	97694	499	20.0 ml
2637	97694	464	0.25 cup
2638	97694	227	1.0 
2639	97694	509	1.0 teaspoon
2640	97694	785	800.0 g
2641	97694	786	1.0 
2642	97694	97	1.0 
2643	97694	787	1.0 cup
2644	97694	692	1.0 teaspoon
2645	97694	43	2.0 
2646	97694	50	4.0 servings
2647	93673	465	2.0 lbs
2648	93673	788	4.0 
2649	93673	225	3.0 tablespoons
2650	93673	789	1.0 
2651	93673	79	1.0 
2652	93673	156	3.0 
2653	93673	75	0.5 cup
2654	93673	33	12.0 servings
2655	93673	790	1.0 
2656	93673	4	12.0 cups
2657	93673	791	4.0 ounces
2658	93673	61	2.0 tablespoons
2659	93673	792	1.0 
2677	582163	465	200.0 g
2678	582163	797	1.0 cup
2679	582163	689	1.0 tsp
2680	582163	79	1.0 
2681	582163	405	1.0 pinch
2682	582163	798	2.0 
2683	582163	174	0.5 bunch
2684	582163	9	5.0 tbsp
2685	582163	4	1.0 
2686	582163	799	2.0 
2687	582163	660	1.0 
2688	582163	800	2.0 
2689	582163	84	0.5 tsp
2690	582163	6	3.0 servings
2691	520854	465	500.0 g
2692	520854	86	2.0 tbsps
2693	520854	131	1.0 handful
2694	520854	79	0.5 c
2695	520854	498	1.0 c
2696	520854	88	2.0 
2697	520854	33	2.0 servings
2698	520854	801	1.0 
2699	520854	96	2.0 tbsps
2700	520854	210	1.5 c
2701	520854	802	4.0 
2702	520854	43	4.0 
2703	520854	246	2.0 
2704	206488	465	5.0 pound
2705	206488	25	6.0 
2706	206488	727	2.0 cups
2707	206488	68	4.0 
2708	206488	256	6.0 servings
2709	206488	803	1.0 
2710	206488	804	6.0 servings
2711	206488	445	2.0 heads
2712	206488	805	2.0 tablespoons
2713	206488	212	3.0 tablespoons
2714	206488	197	2.0 tablespoons
2715	206488	747	1.0 handful
2716	92860	465	1000.0 g
2717	92860	9	1.0 tablespoon
2718	92860	156	200.0 g
2719	92860	6	10.0 g
2720	92860	806	150.0 g
2721	92860	2	20.0 g
2722	92860	681	100.0 g
2723	92860	807	100.0 g
2724	92860	174	100.0 g
2725	92860	4	3.0 liters
2726	92860	41	10.0 g
2727	92860	66	2.0 g
2728	92860	476	10.0 g
2729	92860	302	100.0 g
2730	92860	201	150.0 g
2731	92860	808	50.0 g
2732	97004	465	1.5 lbs
2733	97004	9	0.25 cup
2734	97004	499	0.25 cup
2735	97004	171	1.0 
2736	97004	328	1.5 tablespoons
2737	97004	227	1.0 
2738	97004	188	0.25 teaspoon
2739	97004	33	4.0 servings
2740	97004	154	14.0 ounce
2741	97004	66	4.0 cloves
2742	97004	43	2.0 
2743	97004	212	0.5 cup
2744	97004	747	1.0 tablespoon
2745	71493	465	1.0 
2746	71493	343	1.0 
2747	71493	809	3.0 servings
2748	71493	464	2.0 Tbsps
2749	71493	75	1.0 cups
2750	71493	238	1.0 sheet
2751	71493	69	1.0 
2752	71493	716	1.0 cup
2753	71493	293	1.0 cup
2754	71493	97	1.0 
2755	71493	101	0.5 cup
2756	71493	792	1.0 
2757	188240	465	1.0 
2758	188240	25	3.0 
2759	188240	791	0.75 cup
2760	188240	32	1.25 cups
2761	188240	156	4.0 
2762	188240	41	4.0 servings
2763	188240	157	2.0 stalks
2764	188240	428	12.0 
2765	188240	716	1.25 cups
2766	188240	495	8.0 
2767	188240	810	12.0 
2768	188240	9	4.0 tablespoon
2769	188240	6	4.0 servings
2770	188240	260	4.0 
2771	321361	465	5.0 pounds
2772	321361	407	1.0 cup
2773	321361	740	6.0 teaspoons
2774	321361	20	4.0 teaspoons
2775	321361	2	2.0 cups
2776	321361	568	0.5 cup
2777	321361	436	1.0 
2778	321361	6	2.0 teaspoons
2779	321361	66	8.0 cloves
2780	321361	37	3.0 
2781	321361	811	1.5 quarts
2782	321361	456	2.0 cups
2783	321361	201	3.0 
2784	321361	622	6.0 ounce
2785	98159	399	1.0 cup
2786	98159	1	1.0 teaspoon
2787	98159	79	0.5 
2788	98159	741	1.5 teaspoons
2789	98159	591	2.0 cups
2790	98159	509	2.0 teaspoons
2791	98159	812	0.333333333333 cup
2792	98159	69	1.0 
2793	98159	733	1.0 teaspoon
2794	98159	465	1.0 lb
2795	98159	84	0.5 teaspoon
2796	98159	6	4.0 servings
2797	205788	1	4.0 servings
2798	205788	465	3.0 
2799	205788	102	1.0 bunch
2800	205788	79	1.0 
2801	205788	813	2.0 pounds
2802	205788	2	1.0 tablespoon
2803	205788	174	4.0 servings
2804	205788	86	4.0 servings
2805	205788	526	24.0 ounces
2806	205788	157	1.0 rib
2807	205788	69	1.0 
2808	205788	814	4.0 
2809	205788	66	3.0 cloves
2810	205788	15	4.0 servings
2811	97270	465	500.0 g
2812	97270	4	150.0 ml
2813	97270	57	4.0 servings
2814	97270	156	2.0 
2815	97270	727	2.0 
2816	97270	378	1.0 tablespoon
2817	97270	79	1.0 
2818	97270	37	800.0 g
2819	97270	551	4.0 servings
2820	97270	336	3.0 teaspoons
2821	97270	157	2.0 rib
2822	97270	99	0.5 tablespoon
2823	97270	6	4.0 servings
2824	97270	7	0.25 cup
2825	97270	85	2.0 tablespoons
2826	51195	465	2.0 lbs
2827	51195	9	1.0 Tbsp
2828	51195	815	1.0 cup
2829	51195	31	0.5 tsp
2830	51195	816	1.0 cup
2831	51195	39	0.5 cup
2832	51195	15	1.0 Tbsp
2833	51195	16	2.0 Tbsps
2834	51195	41	4.0 servings
2835	51195	66	3.0 cloves
2836	51195	293	1.0 cup
2837	51195	464	3.0 Tbsps
2838	51195	817	1.0 Tbsp
2839	51195	18	2.0 tsps
2840	8269	1	2.0 Tbsps
2841	8269	465	1.5 lbs
2842	8269	135	0.25 tsp
2843	8269	818	1.0 cup
2844	8269	32	4.0 cups
2845	8269	748	2.0 tsps
2846	8269	819	2.0 Tbsps
2847	8269	820	2.0 Tbsps
2848	8269	16	2.0 tsps
2849	8269	205	2.0 Tbsps
2850	8269	84	0.25 tsp
2851	8269	9	2.0 Tbsps
2852	8269	821	1.0 Tbsp
2853	8269	98	0.5 tsp
2854	185480	465	2.0 pound
2855	185480	25	2.0 
2856	185480	343	1.0 
2857	185480	675	8.0 cups
2858	185480	102	1.0 sprig
2859	185480	39	1.0 cup
2860	185480	121	2.0 
2861	185480	86	0.75 cup
2862	185480	15	0.5 teaspoons
2863	185480	205	3.0 tablespoons
2864	185480	22	1.0 sprig
2865	185480	244	0.25 cup
2866	185480	201	4.0 
2867	185480	477	1.0 bunch
2868	185480	162	1.0 leaf
2869	149673	465	3.0 lb
2870	149673	25	2.0 
2871	149673	79	1.0 cup
2872	149673	822	2.0 teaspoons
2873	149673	823	1.25 cups
2874	149673	661	1.25 cups
2875	149673	4	3.0 cups
2876	149673	16	0.5 cup
2877	149673	41	0.75 teaspoon
2878	149673	19	1.0 teaspoon
2879	149673	418	8.0 servings
2880	149673	23	0.25 teaspoon
2881	149673	824	2.0 sticks
2882	149673	6	2.0 teaspoons
2883	149673	98	0.75 teaspoon
2884	149673	18	0.25 cup
2885	649403	1	1.0 tablespoon
2886	649403	465	8.0 ounces
2887	649403	99	2.0 tablespoons
2888	649403	79	1.0 
2889	649403	604	2.5 cups
2890	649403	404	0.5 teaspoon
2891	649403	66	8.0 cloves
2892	649403	197	0.25 cup
2893	649403	825	0.75 cup
2894	649403	84	6.0 servings
2895	649403	464	1.0 
2896	649403	747	1.0 tablespoon
2897	618731	1	4.0 tbs
2898	618731	25	4.0 
2899	618731	57	0.5 tsp
2900	618731	201	2.0 
2901	618731	48	1.0 tbs
2902	618731	4	0.5 cup
2903	618731	465	3.0 lbs
2904	618731	524	1.0 tsp
2905	618731	433	4.0 servings
2906	618731	185	4.0 servings
2907	618731	745	4.0 servings
2908	618731	135	0.5 tsp
2909	618731	692	1.0 tsp
2910	618731	356	2.0 tsp
2911	618731	85	1.0 tbs
2912	97508	465	2.25 pounds
2913	97508	25	2.0 
2914	97508	79	0.5 
2915	97508	6	0.25 teaspoon
2916	97508	320	6.0 6-inch
2917	97508	807	2.0 tablespoons
2918	97508	9	2.0 tablespoons
2919	97508	4	1.0 cup
2920	97508	205	1.0 tablespoon
2921	97508	475	0.5 
2922	97508	660	1.0 
2923	97508	418	0.666666666667 cup
2924	97508	692	1.0 teaspoon
2925	97508	356	2.0 teaspoons
2926	97508	700	1.5 cups
2927	97561	465	500.0 g
2928	97561	9	2.0 tablespoons
2929	97561	104	1.0 
2930	97561	464	1.0 tablespoon
2931	97561	79	1.0 
2932	97561	101	425.0 g
2933	97561	32	1.5 cups
2934	97561	785	300.0 g
2935	97561	66	2.0 cloves
2936	97561	84	4.0 servings
2937	97561	692	0.5 teaspoon
2938	97561	356	1.0 teaspoon
2939	97561	20	1.0 teaspoon
2940	97576	465	2.5 lb
2941	97576	9	3.0 tablespoons
2942	97576	561	1.0 tablespoon
2943	97576	227	1.0 
2944	97576	4	2.5 cups
2945	97576	16	3.0 tablespoons
2946	97576	218	1.0 tablespoon
2947	97576	19	1.0 teaspoon
2948	97576	20	1.0 teaspoon
2949	97576	23	1.0 pinch
2950	97576	824	3.0 sticks
2951	97576	823	0.5 cup
2952	97576	98	1.0 teaspoon
2953	97576	353	2.0 cups
2954	97632	465	1.0 kg
2955	97632	25	4.0 
2956	97632	87	3.0 tablespoons
2957	97632	826	1.0 teaspoon
2958	97632	201	2.0 
2959	97632	827	250.0 g
2960	97632	551	1.5 teaspoons
2961	97632	9	3.0 tablespoons
2962	97632	552	2.0 teaspoons
2963	97632	4	1.0 cup
2964	97632	828	1.0 tablespoon
2965	97632	96	1.5 tablespoons
2966	97632	294	1.0 cup
2967	97632	829	2.0 teaspoons
2968	97632	673	0.5 teaspoon
2969	97632	29	6.0 
2970	30052	73	2.0 tsps
2971	30052	465	2.0 
2972	30052	57	0.5 tsp
2973	30052	649	0.5 tsp
2974	30052	40	2.0 Tbsps
2975	30052	174	1.0 tsp
2976	30052	205	2.0 
2977	30052	830	6.0 
2978	30052	66	1.0 tsp
2979	30052	77	2.0 
2980	30052	68	2.0 tsps
2981	30052	196	2.0 tsps
2982	30052	135	6.0 servings
2983	30052	831	6.0 servings
2984	97686	465	2.0 lbs
2985	97686	9	4.0 tablespoons
2986	97686	788	2.0 
2987	97686	524	2.0 teaspoons
2988	97686	69	1.0 
2989	97686	722	1.0 pinch
2990	97686	660	1.0 
2991	97686	543	1.0 
2992	97686	19	0.5 teaspoon
2993	97686	82	2.0 
2994	97686	469	1.0 
2995	97686	201	2.0 
2996	97686	356	2.0 teaspoons
2997	97686	50	6.0 servings
2998	97728	465	3.0 lbs
2999	97728	25	3.0 
3000	97728	135	6.0 servings
3001	97728	173	6.0 servings
3002	97728	67	8.0 slices
3003	97728	622	1.0 tablespoon
3004	97728	48	1.0 teaspoon
3005	97728	116	2.0 teaspoons
3006	97728	811	2.0 cups
3007	97728	37	1.5 lbs
3008	97728	84	6.0 servings
3009	97728	50	6.0 servings
3010	97728	104	2.0 
3011	97728	201	3.0 
3012	97728	627	10.0 ounces
3013	97742	465	1.0 kg
3014	97742	483	500.0 ml
3015	97742	490	2.0 tablespoons
3016	97742	758	1.0 
3017	97742	4	250.0 ml
3018	97742	475	1.0 
3019	97742	699	4.0 
3020	97742	766	1.0 teaspoon
3021	97742	282	1.0 teaspoon
3022	97742	283	2.0 cups
3023	97742	29	5.0 
3024	97742	700	300.0 g
3025	97742	119	2.0 tablespoons
3026	3586	9	1.0 serving
3027	3586	406	1.0 serving
3028	3586	255	1.0 serving
3029	3586	832	1.0 serving
3030	3586	833	1.0 serving
3031	3586	412	1.0 serving
3032	3586	17	1.0 serving
3033	3586	414	1.0 serving
3034	3586	834	1.0 serving
3035	3586	157	1.0 serving
3036	3586	416	1.0 serving
3037	3586	835	1.0 serving
3038	3586	222	1.0 serving
3039	3586	61	0.5 cup
3040	3586	422	1.0 serving
3041	3586	836	1.0 serving
3042	3586	547	1.0 serving
3043	3586	837	1.0 serving
3044	3586	263	1.0 serving
3045	3586	838	1.0 serving
3046	3586	839	1.0 serving
3047	3586	79	1.0 serving
3048	3586	187	2.0 
3049	3586	278	1.0 serving
3050	3586	425	1.0 serving
3051	3586	36	1.0 serving
3052	3586	284	1.0 serving
3053	3586	39	0.25 cup
3054	3586	303	2.0 fillet
3055	3586	812	1.0 serving
3056	3586	428	1.0 serving
3057	3586	725	1.0 serving
3058	3586	265	1.0 serving
3059	3586	433	1.0 serving
3060	3586	195	1.0 serving
3061	3586	435	1.0 serving
3062	3586	840	1.0 serving
3063	3586	841	1.0 serving
3064	3586	71	1.0 serving
3065	3586	677	1.0 serving
3066	3586	259	1.0 serving
3067	3586	842	1.0 serving
3068	3586	38	1.0 serving
3069	3586	843	1.0 serving
3070	3586	66	1.0 serving
3071	3586	379	1.0 serving
3072	3586	443	1.0 serving
3073	3586	584	1.0 serving
3074	3586	844	1.0 serving
3075	3586	296	1.0 serving
3076	3586	76	1.0 serving
3077	3586	845	2.0 Tbsps
3078	3586	846	1.0 serving
3079	3586	337	1.0 serving
3080	3586	335	1.0 serving
3081	3586	408	1.0 serving
3082	3586	847	1.0 serving
3083	3586	848	1.0 serving
3084	3586	448	1.0 serving
3085	3586	356	1.5 tsps
3086	3586	849	1.0 serving
3087	3586	142	1.0 serving
3088	3586	220	1.0 serving
3089	3586	313	1.0 serving
3090	3586	660	1.0 serving
3091	3586	850	1.0 serving
3092	3586	362	1.0 serving
3093	3586	454	1.0 serving
3094	3586	333	0.5 cup
3095	3586	418	1.0 serving
3096	3586	481	1.0 serving
3097	3586	851	1.0 serving
3098	3586	456	1.0 serving
3099	3586	852	1.0 serving
3100	3586	482	1.0 serving
3101	3586	853	1.0 serving
3102	3586	729	1.0 serving
3103	3586	444	1.0 serving
3104	3586	156	1.0 serving
3105	3586	788	1.0 serving
3106	3586	88	1.0 serving
3107	3586	16	1.0 serving
3108	3586	854	1.0 serving
3109	3586	464	1.0 serving
3110	3586	627	1.0 serving
3111	3586	465	1.0 serving
3112	3586	25	5.0 
3113	3586	21	1.0 
3114	3586	468	1.0 serving
3115	3586	855	1.0 serving
3116	3586	856	1.0 serving
3117	3586	378	1.0 serving
3118	3586	121	1.0 serving
3119	3586	622	1.0 Tbsps
3120	3586	75	1.0 serving
3121	3586	439	1.0 serving
3122	3586	475	1.0 serving
3123	3586	857	1.0 serving
3124	3586	196	1.0 serving
3125	3586	165	1.0 serving
3126	3586	477	1.0 serving
3127	3586	1	1.0 serving
3128	3586	478	1.0 serving
3129	3586	556	1.0 serving
3130	3586	133	1.0 Tbsps
3131	3586	210	1.0 serving
3132	3586	479	1.0 serving
3133	207390	465	1.0 pound
3134	207390	858	2.0 teaspoons
3135	207390	483	8.0 tablespoons
3136	207390	79	1.0 
3137	207390	740	3.0 teaspoons
3138	207390	859	1.0 teaspoons
3139	207390	364	1.0 Handful
3140	207390	86	4.0 tablespoons
3141	207390	718	1.5 teaspoons
3142	207390	27	1.25 inch
3143	207390	66	5.0 cloves
3144	207390	860	0.333333333333 cup
3145	207390	861	0.5 teaspoon
3146	207390	6	4.0 servings
3147	222818	465	550.0 g
3148	222818	25	2.0 
3149	222818	641	1.0 
3150	222818	862	1.0 tsp
3151	222818	79	1.0 
3152	222818	32	700.0 ml
3153	222818	863	25.0 g
3154	222818	9	2.0 tbsp
3155	222818	855	175.0 g
3156	222818	428	25.0 g
3157	222818	83	1.0 
3158	222818	477	4.0 servings
3159	222818	747	3.0 tbsp
3160	97902	465	1.25 lbs
3161	97902	9	4.0 teaspoons
3162	97902	864	2.0 cups
3163	97902	79	0.5 cup
3164	97902	865	0.5 cup
3165	97902	356	1.0 teaspoon
3166	97902	57	4.0 servings
3167	97902	232	4.0 10-inch
3168	97902	69	0.75 cup
3169	97902	866	0.25 teaspoon
3170	97902	15	1.5 teaspoons
3171	97902	714	1.0 teaspoon
3172	97902	867	0.25 cup
3173	97902	369	0.25 cup
3174	97902	700	0.5 cup
3175	48754	465	1.5 lbs
3176	48754	79	1.0 
3177	48754	653	0.5 cup
3178	48754	2	2.0 Tbsps
3179	48754	156	4.0 
3180	48754	15	4.0 servings
3181	48754	868	4.0 servings
3182	48754	66	2.0 cloves
3183	48754	19	0.5 tsp
3184	48754	42	0.5 cup
3185	48754	418	1.0 cup
3186	48754	116	1.0 tsp
3187	48754	356	1.0 tsp
3188	48754	98	0.5 tsp
3189	97959	465	2.0 lbs
3190	97959	9	4.0 tablespoons
3191	97959	869	3.0 
3192	97959	6	6.0 servings
3193	97959	37	4.0 
3194	97959	121	3.0 
3195	97959	174	6.0 servings
3196	97959	4	6.0 servings
3197	97959	14	0.5 lb
3198	97959	660	1.0 lb
3199	97959	383	1.0 
3200	97959	433	3.0 tablespoons
3201	97959	84	6.0 servings
3202	97959	201	2.0 
3203	97959	870	1.0 teaspoon
3204	35604	871	1.0 cups
3205	35604	872	0.25 cup
3206	35604	458	10.0 
3207	35604	873	10.0 
3208	35604	874	1.0 cup
3209	224086	1	0.25 cup
3210	224086	875	8.0 cups
3211	224086	876	0.5 cup
3212	224086	873	12.0 sticks
3213	224086	877	0.333333333333 cup
3214	543678	878	6.0 oz
3215	543678	879	12.0 
3216	543678	880	12.0 servings
3217	543678	873	96.0 inch
3218	543678	244	12.0 servings
3219	150558	131	4.0 
3220	150558	87	0.25 cup
3221	150558	58	0.5 cup
3222	150558	88	2.0 
3223	150558	89	1.0 
3224	150558	366	1.0 tablespoon
3225	150558	881	1.5 pound
3226	150558	15	2.0 servings
3227	7227	9	6.0 tbsp
3228	7227	882	1.0 pound
3229	7227	187	2.0 
3230	7227	668	0.5 cup
3231	7227	883	8.0 slices
3232	7227	15	1.0 tsp
3233	7227	884	8.0 
3234	171180	1	0.333333333333 cup
3235	171180	885	30.0 
3236	171180	2	1.0 tablespoon
3237	171180	873	30.0 
3238	171180	886	1.0 pouch
3239	171180	151	1.0 
3240	269549	1	1.0 Tbsp
3241	269549	887	20.0 
3242	269549	303	40.0 
3243	269549	474	10.0 sheet
3244	269549	888	3.0 cups
3245	7409	9	1.0 tbsp
3246	7409	14	1.0 C
3247	7409	41	1.0 serving
3248	7409	428	2.0 tsp
3249	7409	668	1.0 tbsp
3250	7409	61	0.5 tsp
3251	7409	6	1.0 serving
3252	7409	884	1.0 fillet
3253	7422	9	2.0 tablespoons
3254	7422	205	1.0 tablespoon
3255	7422	709	1.0 
3256	7422	783	3.0 tablespoons
3257	7422	889	1.25 pounds
3258	7422	890	2.0 cups
3259	494926	99	3.0 tsp
3260	494926	303	200.0 g
3261	494926	765	0.5 tsp
3262	494926	891	0.5 tsp
3263	494926	767	1.0 handful
3264	494926	892	1.0 tsp
3265	425376	4	1.0 cup
3266	425376	893	30.0 ounces
3267	425376	894	1.0 cup
3268	425376	873	10.0 
3269	425376	244	0.5 cup
3270	425376	895	1.0 cup
3271	425376	896	1.0 
3272	511402	121	6.0 
3273	511402	53	2.0 tablespoons
3274	511402	338	15.0 slices
3275	511402	413	3.0 
3276	511402	303	15.0 
3277	511402	50	15.0 servings
3278	85458	1	2.0 ounces
3279	85458	25	1.0 
3280	85458	57	4.0 servings
3281	85458	365	6.0 ounces
3282	85458	881	4.0 fillet
3283	85458	516	1.0 
3284	85458	6	4.0 servings
3285	429543	897	0.5 teaspoon
3286	429543	873	10.0 
3287	429543	898	8.0 ounces
3288	429543	4	1.0 cup
3289	429543	899	3.0 ounces
3290	429543	7	0.5 cup
3291	85611	1	0.25 cup
3292	85611	900	7.25 ounce
3293	85611	901	4.0 ounce
3294	85611	303	7.0 ounce
3295	85611	7	0.5 cup
3296	511608	36	1.0 cup
3297	511608	99	6.0 servings
3298	511608	2	1.0 cup
3299	511608	902	1.0 cup
3300	511608	881	3.0 pounds
3301	511608	151	1.0 
3302	511608	7	0.25 cups
3303	511608	50	6.0 servings
3304	298642	903	8.0 servings
3305	298642	35	0.25 cup
3306	298642	904	28.0 ounce
3307	298642	396	8.0 
3308	298642	873	8.0 
3309	478994	895	2.0 tablespoons
3310	478994	874	0.75 cup
3311	478994	406	2.0 
3312	478994	873	1.0 sticks
3313	478994	905	0.25 cup
3314	122675	36	0.25 cup
3315	122675	350	0.5 cup
3316	122675	906	1.0 tablespoon
3317	122675	907	1.0 tablespoon
3318	122675	908	1.0 cup
3319	122675	881	4.0 fillet
3320	122675	151	1.0 
3321	360252	86	4.0 servings
3322	360252	909	1.5 cups
3323	360252	404	0.125 teaspoon
3324	360252	873	4.0 
3325	360252	910	2.0 cups
3326	360252	4	0.5 cup
3327	360252	876	0.25 cup
3328	360252	19	0.125 teaspoon
3329	470849	86	0.5 cup
3330	470849	911	0.5 pound
3331	470849	912	0.75 cup
3332	470849	240	10.0 
3333	470849	873	30.0 
3334	470849	185	0.75 cup
3335	516047	4	1.0 cup
3336	516047	913	0.5 teaspoon
3337	516047	914	3.0 cups
3338	516047	873	12.0 
3339	516047	903	12.0 servings
3340	516047	876	0.5 cup
3341	516047	915	12.0 
3342	85980	79	0.5 
3343	85980	303	3.0 fillet
3344	85980	15	1.5 teaspoons
3345	85980	916	1.0 teaspoon
3346	85980	84	0.5 teaspoon
3347	85980	917	12.0 ounce
3348	90097	131	4.0 servings
3349	90097	201	3.0 
3350	90097	57	1.0 dash
3351	90097	66	3.0 
3352	90097	881	2.0 lbs
3353	90097	77	8.0 
3354	90097	6	1.0 dash
3355	90096	36	2.0 tablespoons
3356	90096	99	0.25 cup
3357	90096	224	1.0 cup
3358	90096	121	2.0 
3359	90096	33	6.0 servings
3360	90096	473	1.0 tablespoon
3361	90096	881	800.0 g
3362	90096	2	0.5 cup
3363	90122	292	4.0 servings
3364	90122	87	1.0 tablespoon
3365	90122	918	3.0 cups
3366	90122	919	1.0 pinch
3367	90122	32	4.0 cups
3368	90122	27	2.0 slices
3369	90122	366	1.0 tablespoon
3370	90122	490	1.0 tablespoon
3371	90122	6	0.25 teaspoon
3372	90122	303	0.5 lb
3373	438371	1	0.25 cup
3374	438371	873	11.4 ounces
3375	438371	672	6.0 servings
3376	438371	205	2.0 tablespoons
3377	438371	53	2.0 tablespoons
3378	438371	920	6.0 
3379	224	303	150.0 g
3380	224	95	1.0 serving
3381	224	921	5.0 
3382	224	922	1.0 slice
3383	224	539	1.0 T
3384	224	369	2.0 T
3385	224	923	1.0 square
3386	430322	1	3.0 tablespoons
3387	430322	200	4.0 ounces
3388	430322	924	0.5 cup
3389	430322	925	15.2 ounces
3390	430322	66	1.0 teaspoon
3391	430322	926	1.0 pound
3392	49408	927	0.25 cup
3393	49408	893	6.0 
3394	49408	226	1.0 cups
3395	49408	873	6.0 
3396	49408	917	0.5 cup
3397	49408	244	0.5 cup
3398	49408	928	1.0 
3399	618816	582	0.25 cup
3400	618816	483	0.5 cup
3401	618816	508	0.5 cup
3402	618816	929	0.5 cup
3403	618816	873	1.0 sticks
3404	618816	205	2.0 tsp
3405	618816	458	8.0 
3406	618816	135	1.0 pinch
3407	618816	930	1.0 tsp
3408	213356	9	2.0 teaspoons
3409	213356	57	0.25 teaspoon
3410	213356	226	1.0 tablespoon
3411	213356	6	0.5 teaspoon
3412	213356	143	0.5 teaspoon
3413	213356	925	24.0 ounce
3414	213356	397	1.0 tablespoon
3415	213356	631	1.0 tablespoon
3416	213356	931	2.0 tablespoons
3417	45474	480	1.0 oz
3418	45474	856	1.0 
3419	45474	893	1.0 cups
3420	45474	873	1.0 sticks
3421	45474	4	0.25 cup
3422	45474	932	1.0 serving
3423	45474	933	2.0 ozs
3424	49592	934	1.0 cup
3425	49592	935	20.0 oz
3426	49592	873	1.0 sticks
3427	49592	16	0.5 cup
3428	49592	936	3.0 cups
3429	49592	928	1.0 
3430	541196	937	0.5 cup
3431	541196	382	1.0 leaves
3432	541196	303	2.0 servings
3433	541196	938	2.0 servings
3434	541196	475	2.0 servings
3435	541196	939	0.5 cup
3436	541196	940	1.0 sheet
3437	541196	941	2.0 servings
3438	197226	1	3.0 tablespoon
3439	197226	942	0.5 cup
3440	197226	943	6.0 cups
3441	197226	874	10.0 servings
3442	197226	873	12.0 
3443	197226	887	10.0 oz
3444	524936	944	1.0 teaspoons
3445	524936	945	1.0 teaspoon
3446	524936	21	1.0 
3447	524936	262	1.0 teaspoon
3448	524936	925	20.0 ounces
3449	524936	821	1.0 teaspoon
3460	4970	411	1.0 serving
3461	4970	412	1.0 serving
3462	4970	334	1.0 serving
3463	4970	17	1.0 serving
3464	4970	413	1.0 serving
3465	4970	131	1.0 serving
3466	4970	414	1.0 serving
3467	4970	415	1.0 serving
3468	4970	178	1.0 serving
3469	4970	157	1.0 serving
3470	4970	416	1.0 serving
3471	4970	417	1.0 serving
3472	4970	222	1.0 serving
3473	4970	145	1.0 serving
3474	4970	420	1.0 serving
3475	4970	421	1.0 serving
3476	4970	422	1.0 serving
3477	4970	314	1.0 
3478	4970	263	1.0 serving
3479	4970	423	1.0 serving
3480	4970	119	1.0 serving
3481	4970	76	1.0 serving
3482	4970	132	1.0 serving
3483	4970	318	1.0 serving
3484	4970	424	1.0 serving
3485	4970	278	1.0 serving
3486	4970	37	1.0 serving
3487	4970	320	1.0 serving
3488	4970	323	1.0 serving
3489	4970	425	1.0 serving
3490	4970	324	1.0 serving
3491	4970	22	1.0 serving
3492	4970	426	1.0 serving
3493	4970	303	1.0 serving
3494	4970	67	1.0 serving
3495	4970	427	1.0 serving
3496	4970	428	1.0 serving
3497	4970	261	1.0 serving
3498	4970	429	1.0 serving
3499	4970	430	1.0 serving
3500	4970	431	1.0 serving
3501	4970	265	1.0 serving
3502	4970	432	1.0 balls
3503	4970	33	4.0 servings
3504	4970	419	1.0 serving
3505	4970	433	1.0 serving
3506	4970	195	1.0 serving
3507	4970	434	1.0 serving
3508	4970	435	1.0 serving
3509	4970	436	1.0 serving
3510	4970	212	1.0 serving
3511	4970	197	1.0 serving
3512	4970	71	1.0 serving
3513	4970	159	1.0 serving
3514	4970	384	1.0 serving
3515	4970	437	1.0 serving
3516	4970	438	1.0 loaf
3517	4970	439	1.0 serving
3518	4970	40	2.0 Tbsps
3519	4970	440	1.0 serving
3520	4970	38	1.0 serving
3521	4970	383	1.0 serving
3522	4970	475	1.0 serving
3523	4970	441	1.0 serving
3524	4970	326	1.0 serving
3525	4970	442	1.0 serving
3526	4970	9	1.0 serving
3527	4970	443	1.0 serving
3528	4970	284	1.0 serving
3529	4970	445	1.0 serving
3530	4970	446	1.0 serving
3531	4970	304	1.0 serving
3532	4970	337	1.0 serving
3533	4970	447	1.0 serving
3534	4970	307	1.0 serving
3535	4970	335	1.0 serving
3536	4970	408	1.0 serving
3537	4970	174	1.0 serving
3538	4970	448	1.0 serving
3539	4970	5	1.0 serving
3540	4970	220	1.0 serving
3541	4970	450	1.0 serving
3542	4970	451	1.0 serving
3543	4970	354	4.0 Tbsps
3544	4970	452	1.0 serving
3545	4970	453	1.0 
3546	4970	362	1.0 serving
3547	4970	454	1.0 serving
3548	4970	418	1.0 serving
3549	4970	455	1.0 serving
3550	4970	113	1.0 serving
3551	4970	456	1.0 serving
3552	4970	457	1.0 serving
3553	4970	458	1.0 serving
3554	4970	459	1.0 ribs
3555	4970	460	1.0 serving
3556	4970	444	1.0 serving
3557	4970	462	1.0 serving
3558	4970	947	4.0 
3559	4970	173	1.0 serving
3560	4970	156	1.0 serving
3561	4970	88	1.0 serving
3562	4970	463	1.0 serving
3563	4970	464	1.0 serving
3564	4970	465	1.0 serving
3565	4970	21	1.0 serving
3566	4970	466	1.0 serving
3567	4970	201	1.0 serving
3568	4970	467	1.0 serving
3569	4970	468	1.0 serving
3570	4970	309	1.0 serving
3571	4970	43	4.0 
3572	4970	469	1.0 serving
3573	4970	470	1.0 serving
3574	4970	471	1.0 serving
3575	4970	121	1.0 serving
3576	4970	472	1.0 serving
3577	4970	473	1.0 serving
3578	4970	474	1.0 serving
3579	4970	66	1.0 clove
3580	4970	476	1.0 serving
3581	4970	477	1.0 serving
3582	4970	1	1.0 serving
3583	4970	948	1.0 Tbsp
3584	4970	478	1.0 serving
3585	4970	210	1.0 serving
3586	4970	479	1.0 serving
3587	949	1	0.5 cup
3588	949	256	6.0 servings
3589	949	397	0.5 teaspoon
3590	949	252	2.0 
3591	949	209	3.0 tablespoons
3592	949	23	1.0 pinch
3593	949	884	6.0 pound
3594	242821	1	1.0 cup
3595	242821	913	0.5 teaspoon
3596	242821	540	0.25 cup
3597	242821	396	10.0 
3598	242821	873	10.0 
3599	242821	244	4.0 cups
3600	242821	4	0.25 cup
3601	242821	949	0.25 cup
3602	1162	9	4.0 Tb
3603	1162	152	0.5 cup
3604	1162	39	0.333333333333 cup
3605	1162	285	5.0 Tb
3606	1162	66	1.5 Tb
3607	1162	881	4.0 fillet
3608	1162	197	0.25 cup
3609	1162	15	35.0 servings
3610	99568	765	0.5 teaspoon
3611	99568	802	6.0 
3612	99568	950	1.0 teaspoon
3613	99568	244	2.0 teaspoons
3614	99568	881	12.0 fillet
3615	99568	951	1.0 cup
3616	99568	952	12.0 pieces
3617	99568	6	12.0 servings
3618	99568	953	2.0 tablespoons
3619	120056	9	0.333333333333 cup
3620	120056	480	2.0 tablespoons
3621	120056	402	1.0 teaspoon
3622	120056	37	4.0 
3623	120056	925	800.0 g
3624	120056	726	1.0 tablespoon
3625	120056	830	4.0 servings
3626	120056	66	1.0 teaspoon
3627	120056	50	4.0 servings
3628	144792	9	2.0 tablespoons
3629	144792	363	0.5 
3630	144792	925	12.0 ounce
3631	144792	650	1.0 
3632	144792	236	1.0 
3633	144792	333	2.0 tablespoons
3634	144792	297	3.0 
3635	144792	50	1.0 dash
3636	181790	1	0.25 cup
3637	181790	57	0.25 teaspoon
3638	181790	6	0.5 teaspoon
3639	181790	81	10.0 
3640	181790	925	1.0 pound
3641	181790	116	0.5 teaspoon
3642	181790	4	2.0 tablespoons
3643	181790	731	1.0 
3644	181790	201	2.0 
3645	542301	227	1.5 tbsp
3646	542301	33	4.0 servings
3647	542301	333	1.0 tbsp
3648	542301	570	2.0 cups
3649	542301	881	4.0 fillet
3650	542301	6	1.0 pinch
3651	542301	78	0.25 tsp
3652	542301	447	1.0 
3653	1624	1	100.0 g
3654	1624	506	4.0 servings
3655	1624	303	750.0 g
3656	1624	66	4.0 cloves
3657	1624	525	1.0 Tbsp
3658	1624	135	2.0 Tbsps
3659	1624	151	150.0 g
3660	484978	1	2.0 tablespoons
3661	484978	73	1.0 teaspoon
3662	484978	407	2.0 tablespoons
3663	484978	954	0.25 cup
3664	484978	955	2.0 tablespoons
3665	484978	84	0.25 teaspoon
3666	484978	135	0.25 teaspoon
3667	484978	98	1.0 teaspoon
3668	484978	881	1.0 lb
3669	1678	1	2.0 Tbsps
3670	1678	226	4.0 Tbsps
3671	1678	925	20.0 oz
3672	1678	956	12.0 
3673	1678	957	1.0 lb
3674	1678	958	60.0 inch
3675	202583	292	2.0 teaspoons
3676	202583	303	2.0 fillet
3677	202583	165	8.0 
3678	202583	27	2.0 inch
3679	202583	366	2.0 tablespoons
3680	202583	770	2.0 servings
3681	202583	95	2.0 tablespoons
3682	173956	959	1.0 cup
3683	173956	4	0.75 cup
3684	173956	873	10.0 
3685	173956	872	1.0 tablespoon
3686	173956	895	1.0 cup
3687	173956	876	1.0 cup
3688	173956	458	10.0 
3689	173956	244	2.0 cups
3690	600042	9	1.0 tablespoon
3691	600042	31	1.0 teaspoon
3692	600042	960	0.5 cup
3693	600042	125	1.0 
3694	600042	925	24.0 ounce
3695	600042	165	4.0 
3696	600042	15	4.0 servings
3697	600042	338	2.0 slices
3698	161761	86	2.0 teaspoons
3699	161761	4	18.0 servings
3700	161761	961	4.25 oz
3701	161761	873	18.0 
3702	161761	903	36.0 
3703	161761	962	36.0 
3704	161761	963	1.0 box
3705	161761	964	20.0 oz
3706	51177	9	0.5 cups
3707	51177	734	4.0 
3708	51177	303	1.0 
3709	51177	965	4.0 
3710	51177	21	1.0 
3711	51177	22	2.0 
3712	51177	15	1.0 box
3713	51177	50	4.0 servings
3714	649262	9	2.0 T
3715	649262	25	7.0 
3716	649262	483	1.0 c
3717	649262	130	2.0 servings
3718	649262	303	0.5 lb
3719	649262	227	0.5 
3720	649262	966	2.0 T
3721	649262	660	0.25 c
3722	411811	1	0.25 cup
3723	411811	57	0.25 teaspoon
3724	411811	79	0.25 cup
3725	411811	2	0.25 cup
3726	411811	613	20.0 ounces
3727	411811	873	24.0 ounces
3728	411811	244	2.0 teaspoons
3729	411811	543	0.25 cup
3730	411811	598	28.0 ounces
3731	411811	6	1.0 teaspoons
3732	157957	9	0.25 cup
3733	157957	948	2.0 tablespoons
3734	157957	48	1.0 tablespoon
3735	157957	97	1.0 
3736	157957	884	3.0 pound
3737	157957	506	4.0 servings
3738	157957	15	4.0 servings
3739	157957	967	1.0 cup
3740	403725	968	1.0 package
3741	403725	930	2.0 cups
3742	403725	969	12.0 servings
3743	403725	970	12.0 servings
3744	403725	903	1.0 stick
3745	403725	303	12.0 servings
3746	276766	660	4.0 slices
3747	276766	971	10.0 oz
3748	276766	972	4.0 
3749	276766	973	4.0 
3750	276766	269	0.25 cup
3751	276766	564	4.0 
3752	423933	1	3.0 tablespoons
3753	423933	130	0.5 teaspoon
3754	423933	57	0.25 teaspoon
3755	423933	141	0.25 cup
3756	423933	16	0.25 cup
3757	423933	974	16.0 ounces
3758	88073	975	2.0 tablespoons
3759	88073	378	1.0 tablespoon
3760	88073	508	0.25 cup
3761	88073	186	8.0 lb
3762	88073	16	2.0 tablespoons
3763	88073	41	1.0 teaspoon
3764	88186	976	0.5 cup
3765	88186	96	0.25 cup
3766	88186	389	0.5 teaspoon
3767	88186	974	1.5 lbs
3768	88186	673	0.5 teaspoon
3769	88186	15	2.0 tablespoons
3770	88243	480	0.25 cup
3771	88243	974	24.0 ounces
3772	88243	931	0.5 cup
3773	88243	96	1.0 teaspoon
3774	88243	977	2.0 tablespoons
3775	88269	9	6.0 tablespoons
3776	88269	974	3.0 lbs
3777	88269	66	0.5 teaspoon
3778	88269	31	2.0 tablespoons
3779	88269	95	3.0 tablespoons
3784	88361	532	0.5 cup
3785	88361	31	2.0 tablespoons
3786	88361	807	0.333333333333 cup
3787	88361	978	0.5 cup
3788	88361	974	3.0 lb
3789	88361	15	2.0 tablespoons
3790	522581	1	0.25 cup
3791	522581	39	0.75 cup
3792	522581	186	2.0 pound
3793	522581	979	1.0 teaspoon
3794	629215	9	3.0 servings
3795	629215	405	0.5 teaspoon
3796	629215	947	18.0 ounce
3797	629215	415	0.5 
3798	629215	835	0.333333333333 cup
3799	629215	6	3.0 servings
3800	629492	472	4.0 ounces
3801	629492	940	3.0 sheets
3802	629492	415	0.5 
3803	629492	89	1.0 
3809	367482	405	2.0 tablespoons
3810	367482	186	2.0 pounds
3811	367482	96	2.0 tablespoons
3812	367482	6	1.0 teaspoon
3813	367482	356	2.0 teaspoons
3814	367482	19	0.5 teaspoon
3815	162735	6	0.25 teaspoon
3816	162735	980	0.125 teaspoon
3817	162735	974	1.0 lb
3818	162735	931	2.0 tablespoons
3819	162735	981	2.0 teaspoons
3820	23639	355	2.0 lbslices
3821	23639	9	2.0 tablespoons
3822	23639	909	0.5 cup
3823	23639	807	1.0 cup
3824	23639	186	48.0 oz
3825	23639	4	7.5 cups
3826	23639	412	8.0 servings
3827	23639	532	3.0 cups
3828	23639	15	1.5 cups
3829	654435	9	0.25 cup
3830	654435	807	1.0 tbsp
3831	654435	205	1.0 tbsp
3832	654435	41	0.25 teaspoon
3833	654435	97	1.0 
3834	654435	974	12.0 oz
3835	654435	6	0.125 teaspoon
3836	580860	9	6.0 tablespoons
3837	580860	472	3.0 pounds
3838	580860	66	0.5 teaspoon
3839	580860	31	2.0 tablespoons
3840	580860	95	3.0 tablespoons
3841	7665	472	1.0 
3842	7665	982	1.0 serving
3843	7665	983	0.5 
3844	302602	520	8.0 ounces
3845	302602	472	0.75 pound
3846	302602	33	8.0 servings
3847	302602	984	2.0 
3848	302602	354	3.0 tablespoons
3849	499271	86	1.0 tablespoons
3850	499271	974	24.0 ounce
3851	499271	66	2.0 cloves
3852	499271	538	1.0 tablespoons
3853	499271	246	2.0 tablespoons
3854	589379	729	2.0 tablespoons
3855	589379	520	8.0 ounce
3856	589379	472	4.0 ounces
3857	589379	984	1.0 pound
3858	589379	41	1.0 pinch
3859	589379	15	1.0 pinch
3860	228971	582	2.0 tablespoons
3861	228971	985	15.0 
3862	228971	986	1.0 tablespoon
3863	228971	186	1.5 pound
3864	228971	41	0.25 teaspoon
3865	228971	6	0.25 teaspoon
3866	212768	9	3.0 tbsp
3867	212768	987	9.0 
3868	212768	723	18.0 
3869	212768	472	1.0 fillet
3870	212768	285	18.0 
3878	196	9	2.0 tbsp
3879	196	648	1.0 cup
3880	196	988	1.0 tbsp
3881	196	472	4.0 ozs
3882	196	205	0.25 cup
3883	196	66	2.0 cloves
3884	196	22	1.0 tbsp
3885	598233	520	8.0 ounces
3886	598233	472	2.0 ounces
3887	598233	89	2.0 tablespoons
3888	598233	839	6.0 
3889	598233	989	0.25 cup
3890	598233	15	0.5 teaspoon
3891	401676	9	2.0 tablespoons
3892	401676	57	0.25 teaspoon
3893	401676	540	1.0 tablespoon
3894	401676	990	2.0 tablespoons
3895	401676	143	1.0 teaspoon
3896	401676	16	1.0 tablespoon
3897	401676	974	24.0 ounces
3898	401676	6	0.25 teaspoon
3899	33059	16	0.25 cup
3900	33059	805	0.25 cup
3901	33059	14	1.0 bunch
3902	33059	472	1.0 package
3903	33059	95	0.25 cup
3904	450	9	2.0 servings
3905	450	837	10.0 fillet
3906	450	22	1.0 sprig
3907	450	40	2.0 servings
3908	450	41	2.0 servings
3909	450	135	2.0 servings
3910	450	974	800.0 g
3911	450	104	1.0 
3912	450	477	500.0 g
3913	25110	9	3.0 Tbsps
3914	25110	611	2.0 Tbsps
3915	25110	453	1.0 
3916	25110	807	2.0 Tbsps
3917	25110	186	1.25 lbs
3918	25110	15	4.0 servings
3919	25110	469	1.5 lbs
3920	17085	378	3.0 tablespoons
3921	17085	807	1.0 tablespoon
3922	17085	186	1.5 pound
3923	17085	205	1.0 tablespoon
3924	17085	6	0.5 teaspoon
3925	17085	991	2.0 cups
3926	8915	547	1.0 serving
3927	8915	992	50.0 gr
3928	8915	472	50.0 gr
3929	8915	152	7.0 
3930	8915	258	3.0 
3931	8915	830	1.0 serving
3932	8931	547	1.0 serving
3933	8931	992	50.0 gr
3934	8931	993	2.0 Tbsps
3935	8931	472	120.0 gr
3936	8931	830	1.0 
3937	8931	994	1.0 handful
3938	599196	9	2.0 tablespoons
3939	599196	520	8.0 ounces
3940	599196	472	1.0 pound
3941	599196	15	0.5 teaspoon
3942	599196	995	2.0 tablespoons
3943	599196	84	0.25 teaspoon
3944	599196	420	2.0 tablespoons
3945	214240	9	3.0 tbsp
3946	214240	350	50.0 g
3947	214240	996	250.0 g
3948	214240	472	6.0 fillet
3949	214240	205	1.0 tablespoon
3950	214240	196	2.0 tbsp
3951	214240	228	200.0 g
3952	591129	9	2.0 tablespoons
3953	591129	141	3.0 tablespoons
3954	591129	947	2.0 pounds
3955	591129	125	1.0 
3956	591129	174	0.25 cup
3957	591129	66	1.0 cloves
3958	591129	50	4.0 servings
3959	304491	86	6.0 cups
3960	304491	993	3.0 teaspoons
3961	304491	807	20.0 servings
3962	304491	472	0.5 pound
3963	304491	997	12.0 ounce
3964	304491	302	0.25 cup
3965	304491	6	0.25 teaspoon
3966	550306	505	1.0 leaves
3967	550306	81	4.0 
3968	550306	807	4.0 servings
3969	550306	35	1.0 cup
3970	550306	974	24.0 ounce
3971	1454	14	1.0 lb
3972	1454	186	1.25 lbs
3973	1454	428	0.25 cup
3974	1454	196	2.0 Tbsps
3975	1454	15	20.0 servings
3976	1454	18	4.0 Tbsps
3977	157206	9	4.0 tablespoons
3978	157206	507	1.0 
3979	157206	15	4.0 servings
3980	157206	695	2.0 tablespoons
3981	157206	196	2.0 tablespoons
3982	157206	974	24.0 ounce
3983	157206	477	1.5 pounds
3984	247371	9	4.0 servings
3985	247371	998	1.0 
3986	247371	227	0.25 cup
3987	247371	236	2.0 
3988	247371	41	4.0 servings
3989	247371	999	2.0 
3990	247371	974	24.0 ounce
3991	247371	6	4.0 servings
3992	575123	9	1.0 T
3993	575123	1000	2.0 cups
3994	575123	1001	4.0 
3995	575123	199	4.0 oz
3996	575123	263	4.0 oz
3997	575123	1002	3.0 
3998	575123	50	4.0 servings
3999	599862	79	0.5 cup
4000	599862	2	0.5 cup
4001	599862	472	1.0 can
4002	599862	349	1.5 teaspoons
4003	599862	151	1.0 
4004	599862	8	1.5 cups
4005	313370	86	2.0 tablespoons
4006	313370	985	1.0 
4007	313370	33	4.0 servings
4008	313370	95	3.0 tablespoons
4009	313370	66	1.0 tablespoons
4010	313370	96	1.0 tablespoons
4011	313370	1003	0.333333333333 cups
4012	313370	974	2.0 pounds
4013	559309	1	2.0 tbsp
4014	559309	472	115.0 g
4015	559309	33	4.0 servings
4016	559309	1004	350.0 g
4017	559309	744	2.0 
4018	559309	627	0.666666666667 cup
4019	149766	1000	4.0 fillet
4020	149766	414	1.0 pint
4021	149766	436	4.0 
4022	149766	244	1.0 teaspoon
4023	149766	292	1.0 teaspoon
4024	149766	66	4.0 cloves
4025	149766	4	0.25 cup
4026	149766	1005	4.0 teaspoons
4027	149766	6	0.25 teaspoon
4028	379151	57	0.25 teaspoon
4029	379151	227	1.0 
4030	379151	1006	15.0 ounces
4031	379151	172	0.5 cup
4032	379151	169	11.0 ounces
4033	379151	974	24.0 ounces
4034	379151	6	0.25 teaspoon
4035	493889	225	2.0 tablespoons
4036	493889	81	4.0 
4037	493889	807	2.0 tablespoons
4038	493889	35	1.0 cup
4039	493889	974	24.0 ounce
4040	494005	1007	1.0 
4041	494005	54	1.0 
4042	494005	1008	3.0 cups
4043	494005	955	0.25 cup
4044	494005	974	24.0 ounces
4045	346939	1	6.0 tablespoons
4046	346939	25	2.0 
4047	346939	472	3.0 lb
4048	346939	41	0.5 teaspoon
4049	346939	1009	1.5 teaspoons
4050	346939	1010	1.5 cups
4051	346939	15	1.25 teaspoons
4052	19307	532	1.0 tablespoon
4053	19307	466	4.0 servings
4054	19307	6	1.0 teaspoon
4055	19307	41	0.25 teaspoon
4056	19307	169	10.0 ounce
4057	19307	974	24.0 ounce
4058	19307	692	1.0 teaspoon
4059	19307	356	2.0 teaspoons
4060	273352	159	0.5 cup
4061	273352	974	1.0 lb
4062	273352	67	4.0 slices
4063	273352	377	4.0 
4064	273352	769	4.0 
4065	44046	1	1.5 tbsp
4066	44046	21	2.0 servings
4067	44046	472	2.0 fillet
4068	44046	75	1.0 cup
4069	44046	33	2.0 servings
4070	44046	464	1.0 tbsp
4071	658483	974	16.0 oz
4072	658483	48	2.0 teaspoons
4073	658483	16	1.5 tablespoons
4074	658483	205	2.0 tablespoons
4075	658483	1011	3.0 cups
4076	658483	135	4.0 servings
4077	576717	1	0.5 cup
4078	576717	36	0.5 cup
4079	576717	1012	1.0 teaspoon
4080	576717	141	2.0 cups
4081	576717	472	4.0 fillet
4082	576717	41	0.25 teaspoon
4083	576717	15	0.5 teaspoon
4084	593095	472	1.5 pounds
4085	593095	36	2.0 tablespoons
4086	593095	1013	0.5 
4087	593095	21	0.5 
4088	593095	53	0.25 cup
4089	85230	1	1.0 tablespoon
4090	85230	185	0.5 cup
4091	85230	1014	2.0 tablespoons
4092	85230	186	1.0 lb
4093	85230	979	1.0 teaspoon
4094	85241	1	1.0 tablespoon
4095	85241	1015	3.0 tablespoons
4096	85241	336	1.0 teaspoon
4097	85241	472	2.0 fillet
4098	85241	114	1.0 
4099	290093	126	0.333333333333 cup
4100	290093	31	2.0 tablespoons
4101	290093	33	4.0 servings
4102	290093	974	1.25 pounds
4103	290093	1016	1.0 cup
4104	290093	479	4.0 servings
4105	85405	9	4.0 servings
4106	85405	39	4.0 servings
4107	85405	654	1.0 bunch
4108	85405	472	4.0 fillet
4109	85405	337	1.0 bunch
4110	85405	18	4.0 servings
4111	85442	1	1.0 tablespoon
4112	85442	278	1.0 lb
4113	85442	40	3.0 tablespoons
4114	85442	472	4.0 fillet
4115	85442	16	1.0 tablespoon
4116	85442	65	0.5 cup
4117	85442	50	4.0 servings
4118	683484	674	0.25 teaspoon
4119	683484	9	2.0 tablespoons
4120	683484	1017	1.5 teaspoons
4121	683484	947	24.0 oz
4122	683484	250	1.0 teaspoon
4123	683484	135	0.25 teaspoon
4124	683484	18	6.0 tablespoons
4125	85464	21	2.0 slices
4126	85464	265	2.0 
4127	85464	33	2.0 servings
4128	85464	186	1.0 lb
4129	85464	205	2.0 tablespoons
4130	85464	18	1.0 tablespoon
4131	85505	1	100.0 g
4132	85505	9	4.0 servings
4133	85505	556	4.0 servings
4134	85505	472	4.0 fillet
4135	85505	75	500.0 g
4136	85505	33	4.0 servings
4137	85505	1018	4.0 teaspoons
4138	667231	21	1.0 slices
4139	667231	31	0.5 Tbsp
4140	667231	174	2.0 Tbsp
4141	667231	205	2.0 Tbsp
4142	667231	974	1.5 lbs
4143	667231	6	0.5 tsp
4144	487020	131	0.25 cup
4145	487020	99	2.0 tablespoons
4146	487020	1019	1.0 cup
4147	487020	240	12.0 
4148	487020	472	1.0 pound
4149	487020	1020	0.25 cup
4150	85822	1	2.0 tablespoons
4151	85822	125	2.0 
4152	85822	66	1.0 clove
4153	85822	148	20.0 
4154	85822	974	22.0 ounce
4155	593806	36	4.0 Tablespoons
4156	593806	57	4.0 servings
4157	593806	472	4.0 fillet
4158	593806	108	1.0 cup
4159	593806	730	8.0 sheets
4160	593806	420	0.25 cup
4161	593806	6	4.0 servings
4162	716674	236	3.0 
4163	716674	244	1.0 tsp
4164	716674	568	1.0 tbsp
4165	716674	509	1.0 dash
4166	716674	186	1.0 lb
4167	716674	95	2.0 tbsp
4168	716674	50	1.0 serving
4169	602041	135	2.0 tsp
4170	602041	88	2.0 tbs
4171	602041	219	2.0 servings
4172	602041	1005	1.0 tbs
4173	602041	974	12.0 oz
4174	602041	1021	1.0 tbs
4175	4165	9	2.0 Tbsps
4176	4165	729	1.0 serving
4177	4165	135	4.0 servings
4178	4165	168	560.0 g
4179	4165	434	1.0 serving
4180	4165	303	1.0 serving
4181	4165	472	1.0 serving
4182	4165	1022	1.0 serving
4183	4165	88	1.0 serving
4184	4165	1023	1.0 serving
4185	4165	175	1.0 serving
4186	4165	412	1.0 serving
4187	4165	1024	500.0 g
4188	4165	224	100.0 g
4189	4165	66	2.0 cloves
4190	4165	470	1.0 serving
4191	4165	456	1.0 serving
4192	4165	379	1.0 serving
4193	4165	162	0.5 cup
4201	176439	86	2.0 tablespoons
4202	176439	1008	1.0 cup
4203	176439	1027	1.5 cups
4204	176439	186	1.25 lb
4205	176439	580	1.0 teaspoon
4206	176439	61	2.0 teaspoons
4207	176439	43	1.5 cups
4208	4429	9	1.0 tablespoon
4209	4429	985	1.0 
4210	4429	507	1.0 
4211	4429	186	24.0 ounce
4212	4429	205	2.0 tablespoons
4213	4429	475	1.0 
4214	4429	1028	1.0 serving
4215	4429	1029	1.0 serving
4216	4429	15	1.0 serving
4217	4448	9	1.0 Tbsp
4218	4448	719	0.25 cup
4219	4448	1008	12.0 ozs
4220	4448	165	2.0 
4221	4448	1030	0.25 cup
4222	4448	974	24.0 oz
4223	4448	15	4.0 servings
4224	4507	9	2.0 Tbsps
4225	4507	729	6.0 servings
4226	4507	226	0.5 cup
4227	4507	75	6.0 servings
4228	4507	186	2.5 lb
4229	4507	205	0.25 cup
4230	4507	1031	1.0 tsp
4231	4514	86	2.0 tsps
4232	4514	95	5.0 Tbsps
4233	4514	1032	1.0 Tbsp
4234	4514	16	0.25 cup
4235	4514	205	2.0 tsps
4236	4514	974	20.0 ozs
4237	4519	9	1.0 Tbsp
4238	4519	205	2.0 tsps
4239	4519	635	2.0 ozs
4240	4519	197	0.333333333333 cup
4241	4519	169	10.0 ozs
4242	4519	206	4.0 servings
4243	4519	974	24.0 ozs
4249	4534	9	1.0 serving
4250	4534	435	1.0 serving
4251	4534	472	1.0 serving
4252	4534	33	1.0 serving
4253	4534	220	1.0 serving
4254	4534	22	1.0 serving
4255	4534	1033	1.0 serving
4256	4584	9	4.0 tablespoons
4257	4584	729	1.0 sprigs
4258	4584	1034	2.0 teaspoons
4259	4584	1035	6.0 cups
4260	4584	1028	1.0 serving
4261	4584	1029	1.0 serving
4262	4584	974	24.0 ounce
4263	4584	6	0.5 teaspoon
4264	4584	29	3.0 bunches
4265	4627	21	1.0 slicesslices
4266	4627	79	1.0 serving
4267	4627	985	1.0 
4268	4627	10	3.0 tablespoons
4269	4627	186	1.5 pound
4270	4627	1028	1.0 serving
4271	4627	1029	1.0 serving
4272	4654	86	1.0 serving
4273	4654	751	1.0 serving
4274	4654	57	0.5 tsp
4275	4654	21	1.0 
4276	4654	472	1.0 fillet
4277	4654	709	1.0 
4278	4654	510	1.0 
4279	4654	744	4.0 
4280	4654	6	1.0 tsp
4281	4672	582	0.25 cup
4282	4672	31	1.0 tablespoon
4283	4672	41	0.25 teaspoon
4284	4672	26	3.0 tablespoons
4285	4672	428	4.0 teaspoons
4286	4672	96	0.25 cup
4287	4672	1028	1.0 serving
4288	4672	1029	1.0 serving
4289	4672	974	36.0 ounce
4290	324170	9	2.0 tablespoons
4291	324170	453	1.0 
4292	324170	16	1.5 tablespoons
4293	324170	1036	2.0 
4294	324170	974	24.0 ounce
4295	324170	15	4.0 servings
4296	324170	162	3.0 cups
4297	4705	9	1.0 serving
4298	4705	472	1.0 pound
4299	4705	1037	18.0 
4300	4705	41	1.0 serving
4301	4705	1038	4.0 cups
4302	4705	1028	1.0 serving
4303	4705	1029	1.0 serving
4304	4705	6	1.0 serving
4305	4705	429	1.0 serving
4306	4713	565	2.0 teaspoons
4307	4713	31	4.0 teaspoons
4308	4713	6	0.25 teaspoon
4309	4713	682	2.0 tablespoons
4310	4713	1039	3.0 cups
4311	4713	41	0.25 teaspoon
4312	4713	1028	1.0 serving
4313	4713	1029	1.0 serving
4314	4713	974	24.0 ounce
4315	4713	673	1.0 teaspoon
4316	4720	565	2.0 teaspoons
4317	4720	226	0.5 cup
4318	4720	1040	1.0 teaspoon
4319	4720	41	0.125 teaspoon
4320	4720	1028	1.0 serving
4321	4720	1029	1.0 serving
4322	4720	974	24.0 ounce
4323	4720	6	0.25 teaspoon
4324	4720	85	1.0 teaspoon
4325	4728	1041	2.0 tablespoons
4326	4728	27	1.5 teaspoons
4327	4728	31	1.5 teaspoons
4328	4728	16	2.0 tablespoons
4329	4728	41	0.125 teaspoon
4330	4728	1028	1.0 serving
4331	4728	1029	1.0 serving
4332	4728	974	12.0 ounce
4333	4728	6	0.125 teaspoon
4334	4729	9	2.0 teaspoons
4335	4729	1042	0.333333333333 cup
4336	4729	1043	1.0 tablespoon
4337	4729	1044	2.0 tablespoons
4338	4729	41	0.25 teaspoon
4339	4729	783	1.0 tablespoon
4340	4729	1028	1.0 serving
4341	4729	1029	1.0 serving
4342	4729	974	24.0 ounce
4343	4729	15	0.5 teaspoon
4344	4747	25	2.0 
4345	4747	262	2.0 tablespoons
4346	4747	205	2.0 tablespoons
4347	4747	41	0.25 teaspoon
4348	4747	1045	1.0 tablespoon
4349	4747	1028	1.0 serving
4350	4747	1029	1.0 serving
4351	4747	974	24.0 ounce
4352	4747	525	0.5 teaspoon
4353	4747	15	0.5 teaspoon
4354	4753	532	1.0 tsp
4355	4753	1046	1.0 Tbsp
4356	4753	58	4.0 Tbsps
4357	4753	568	1.0 cup
4358	4753	291	4.0 cups
4359	4753	186	1.25 lbs
4360	4753	210	0.5 
4361	4753	15	4.0 servings
4362	4775	86	1.0 tablespoon
4363	4775	25	2.0 
4364	4775	1047	0.25 cup
4365	4775	480	2.0 tablespoons
4366	4775	538	1.0 tablespoon
4367	4775	26	1.0 tablespoon
4368	4775	41	0.25 teaspoon
4369	4775	96	2.0 tablespoons
4370	4775	1028	1.0 serving
4371	4775	1029	1.0 serving
4372	4775	974	24.0 ounce
4373	4775	6	0.25 teaspoon
4374	86715	488	4.0 servings
4375	86715	976	2.0 
4376	86715	552	0.333333333333 cup
4377	86715	297	4.0 
4378	86715	974	480.0 g
4379	86715	87	0.333333333333 cup
4380	594615	1048	3.0 tbsp
4381	594615	6	1.0 pinch
4382	594615	472	20.0 ounce
4383	594615	174	2.0 tbsp
4384	594615	66	3.0 cloves
4385	594615	104	2.0 
4386	4809	480	0.25 cup
4387	4809	244	1.0 tsp
4388	4809	568	1.0 Tbsp
4389	4809	95	2.0 Tbsps
4390	4809	1049	4.0 servings
4391	4809	206	4.0 servings
4392	4809	974	24.0 ozs
4393	4825	1050	1.0 pound
4394	4825	1051	3.0 tablespoons
4395	4825	226	0.25 cup
4396	4825	88	2.0 teaspoons
4397	4825	1052	2.0 tablespoons
4398	4825	974	24.0 oz
4399	4825	85	2.0 tsps
4400	86760	36	1.0 tablespoon
4401	86760	53	1.0 tablespoon
4402	86760	336	1.0 teaspoon
4403	86760	472	1.0 fillet
4404	86760	369	1.0 
4405	4845	9	1.0 Tbsp
4406	4845	1053	1.0 
4407	4845	303	1.0 serving
4408	4845	227	2.0 Tbsp
4409	4845	472	1.0 fillet
4410	4845	277	5.0 
4411	4845	33	1.0 serving
4412	4845	1054	1.0 handful
4413	4845	65	1.0 Tbsp
4414	4845	958	1.0 serving
4415	761087	21	1.0 
4416	761087	252	2.0 
4417	761087	43	2.0 lb
4418	761087	244	2.0 lb
4419	400681	222	1.0 
4420	400681	414	1.0 cups
4421	400681	1055	3.0 ounces
4422	400681	244	2.0 cups
4423	204260	1005	1.0 cup
4424	204260	222	1.0 
4425	204260	41	0.25 teaspoon
4426	204260	161	3.0 
4427	204260	15	2.0 tablespoons
4428	409081	222	4.0 cups
4429	409081	1056	2.0 cup
4430	409081	1057	0.25 teaspoon
4431	581314	1058	0.333333333333 cup
4432	581314	515	1.0 cup
4433	581314	4	1.0 cup
4434	581314	69	1.0 
4435	581314	222	1.0 
4436	581314	7	0.5 cup
4437	524051	222	1.0 
4438	524051	417	12.0 ounce
4439	524051	203	0.25 teaspoon
4440	524051	96	0.5 cup
4447	147323	222	1.0 
4448	147323	4	4.0 cups
4449	147323	824	8.0 sticks
4450	147323	909	1.25 cups
4451	147323	447	1.0 
4452	524156	222	1.0 
4453	524156	417	12.0 ounce
4454	524156	203	0.25 teaspoon
4455	524156	96	0.5 cup
4456	368584	222	8.0 
4457	368584	1056	8.0 scoops
4458	368584	226	8.0 cups
4459	508029	909	0.25 cup
4460	508029	21	1.0 
4461	508029	1061	6.0 
4462	508029	252	2.0 
4463	508029	218	750.0 mL
4464	508029	1062	2.0 tablespoons
4465	172186	185	0.5 cup
4466	172186	403	30.0 oz
4467	172186	252	3.0 
4468	172186	1063	0.333333333333 cup
4469	278737	222	8.0 slices
4470	278737	1062	0.25 cup
4471	278737	1064	20.0 ounces
4472	278737	1065	1.0 cup
4473	278737	515	8.0 servings
4474	246022	68	2.0 teaspoons
4475	246022	218	0.5 cup
4476	246022	33	4.0 servings
4477	246022	252	2.0 
4478	246022	18	0.5 pound
4479	41221	205	2.0 tablespoons
4480	41221	156	10.0 ounce
4481	41221	525	2.0 teaspoons
4482	41221	252	3.0 
4483	41221	244	4.0 cups
4484	41275	222	1.0 
4485	41275	156	2.0 
4486	41275	21	0.25 
4487	41275	210	0.125 
4488	41340	9	2.0 Tbsps
4489	41340	729	2.0 Tbsps
4490	41340	156	2.0 lbs
4491	41340	16	2.0 Tbsps
4492	41340	222	1.0 
4493	41340	15	8.0 servings
4494	483797	40	2.0 tsp
4495	483797	227	1.0 
4496	483797	709	1.0 
4497	483797	222	1.0 
4498	483797	104	1.0 
4499	483797	15	2.0 servings
4500	287186	27	1.0 inch
4501	287186	222	0.5 
4502	287186	1066	4.0 cups
4503	287186	641	1.0 pieces
4504	532984	222	1.0 
4505	532984	1067	2.0 lb
4506	532984	66	2.0 cloves
4507	532984	33	4.0 servings
4508	532984	22	4.0 
4509	197176	222	1.0 slicesslices
4510	197176	1064	25.4 ounce
4511	197176	1068	1.5 cups
4512	197176	226	1.5 cups
4513	205606	1069	2.0 ounces
4514	205606	252	2.0 
4515	205606	244	1.0 cup
4516	205606	4	1.0 cup
4517	205606	455	2.0 
4518	205606	558	4.0 ounces
4519	205606	77	2.0 
4520	107321	334	4.0 pounds
4521	107321	18	4.0 tablespoons
4522	107321	33	8.0 servings
4523	107321	252	5.0 
4524	107321	1070	1.0 teaspoon
4525	615246	222	4.0 dashes
4526	615246	1071	1.0 ounce
4527	615246	1072	1.0 
4528	615246	1073	1.0 
4529	615246	1074	0.5 tablespoons
4530	870	1075	4.0 Tbsps
4531	870	407	1.0 Tbsp
4532	870	415	1.0 
4533	870	252	2.0 
4534	870	1076	2.0 
4535	870	1077	24.0 oz
4536	870	15	4.0 servings
4537	148421	1078	1.0 dashes
4538	148421	222	11.5 ounce
4539	148421	1079	4.5 ounces
4540	148421	447	1.0 
4541	623598	222	1.0 slicesslices
4542	623598	1080	1.5 cups
4543	623598	1065	0.25 cup
4544	623598	226	0.25 cup
4545	140297	1078	1.0 dashes
4546	140297	1081	1.0 
4547	140297	515	1.0 serving
4548	140297	352	2.0 ounces
4549	140297	1082	1.0 serving
4550	140297	222	1.0 slice
4551	140297	1083	2.0 
4552	123924	222	1.0 
4553	123924	141	1.0 cup
4554	123924	417	10.0 ounce
4555	123924	166	1.0 
4556	123924	244	0.75 cup
4557	541736	222	1.0 
4558	541736	1084	1.0 bunch
4559	541736	21	1.0 
4560	541736	478	300.0 grams
4561	140357	1	0.5 teaspoon
4562	140357	1085	1.5 cup
4563	140357	638	0.25 cup
4564	140357	252	4.0 pounds
4565	140357	244	4.0 cups
4566	140357	4	1.5 cups
4567	140357	6	0.25 teaspoon
4568	189529	65	1.5 tablespoons
4569	189529	9	1.5 tablespoons
4570	189529	252	2.0 
4571	189529	79	1.25 cups
4572	189529	1086	1.0 head
4573	492696	222	1.0 ounce
4574	492696	1087	4.0 ounces
4575	492696	226	4.0 ounces
4576	369858	222	1.0 slices
4577	369858	1088	0.0 oz
4578	369858	461	0.25 oz
4579	369858	226	3.0 oz
4580	58572	222	4.0 slices
4581	58572	39	2.0 cups
4582	58572	1089	2.0 
4583	58572	515	4.0 servings
4584	58572	42	4.0 
4585	402718	584	0.5 
4586	402718	1090	1.0 
4587	402718	1061	240.0 ml
4588	402718	4	120.0 ml
4589	402718	210	1.0 inch
4590	402718	222	1.0 
4591	75056	9	6.0 Tbsps
4592	75056	25	8.0 
4593	75056	250	1.0 bunch
4594	75056	252	2.0 
4595	75056	37	4.25 lbs
4596	83295	21	1.0 
4597	83295	1091	1.0 kg
4598	83295	252	1.1 kg
4599	83295	1092	1.0 
4600	83295	4	2.0 
4601	83295	517	1.0 kg
4602	1456	222	1.0 
4603	1456	1093	4.0 
4604	1456	66	1.0 clove
4605	1456	79	1.0 
4606	1456	50	4.0 servings
4607	493059	222	1.0 serving
4608	493059	1094	0.75 ounces
4609	493059	1095	0.75 ounces
4610	493059	1079	2.0 ounces
4611	419336	989	1.0 cup
4612	419336	661	1.0 cup
4613	419336	244	6.0 cups
4614	419336	252	2.0 
4615	419336	1096	6.0 cups
4616	353842	222	6.0 servings
4617	353842	648	8.0 
4618	353842	709	1.0 
4619	353842	252	2.0 
4620	337469	222	1.0 
4621	337469	1003	4.0 
4622	337469	1097	4.0 servings
4623	337469	1098	2.0 tablespoons
4624	337469	244	2.0 tablespoons
4625	91709	222	1.0 
4626	91709	289	0.5 lb
4627	91709	1099	0.5 cup
4628	91709	1062	2.0 servings
4629	165624	222	1.0 
4630	165624	410	2.0 tablespoons
4631	165624	989	3.0 tablespoons
4632	165624	417	2.0 cups
4633	165624	244	0.5 cup
4634	141130	1100	0.25 ounce
4635	141130	244	0.5 cup
4636	141130	35	1.75 cups
4637	141130	222	1.0 
4638	141130	602	5.0 
4639	141130	15	0.25 teaspoon
4640	141144	222	1.0 slice
4641	141144	1101	2.5 ounces
4642	141144	461	1.0 ounce
4643	141144	1102	1.0 ounce
4644	173932	226	0.5 cup
4645	173932	205	1.0 tablespoon
4646	173932	4	1.5 cups
4647	173932	1103	12.0 oz
4648	173932	222	1.0 
4649	173932	1104	24.0 oz
4650	26507	780	1.0 
4651	26507	227	0.5 
4652	26507	1105	8.0 ozs
4653	26507	206	6.0 servings
4654	26507	252	2.0 
4655	42931	169	3.0 ozs
4656	42931	1106	1.5 lbs
4657	42931	509	4.0 servings
4658	42931	252	2.0 
4659	51124	816	0.5 cup
4660	51124	410	8.0 
4661	51124	1003	1.5 ounces
4662	51124	1107	1.0 serving
4663	51124	222	1.0 
4664	18423	9	2.0 tsps
4665	18423	548	0.75 lb
4666	18423	222	1.0 
4667	18423	1108	1.5 lbs
4668	18423	418	1.0 cup
4669	18423	15	4.0 servings
4670	206875	1	0.75 cup
4671	206875	444	0.25 teaspoon
4672	206875	2	2.0 cups
4673	206875	1109	0.333333333333 cup
4674	206875	1110	0.666666666667 cup
4675	206875	222	8.0 servings
4676	206895	222	1.0 slice
4677	206895	840	0.5 cup
4678	206895	1061	3.0 
4679	206895	716	0.5 cup
4680	206895	1069	0.5 ounce
4681	624777	9	2.0 tablespoons
4682	624777	86	8.0 servings
4683	624777	1111	10.0 
4684	624777	252	6.0 
4685	624777	41	8.0 servings
4686	624777	965	6.0 
4687	624777	22	4.0 
4688	624777	15	8.0 servings
4689	542867	349	1.0 teaspoon
4690	542867	1112	2.0 cups
4691	542867	121	6.0 
4692	542867	252	2.0 
4693	542867	244	1.0 cup
4694	207005	222	1.0 dashes
4695	207005	1113	2.0 ounces
4696	207005	748	1.0 strip
4697	207005	1114	0.5 ounce
4698	215283	1115	1.0 tbsp
4699	215283	677	12.0 
4700	215283	464	1.0 bunch
4701	215283	252	4.0 
4702	174323	1116	1.0 cup
4703	174323	147	1.0 cup
4704	174323	1117	7.6 oz
4705	174323	222	1.0 
4706	215291	1118	85.0 g
4707	215291	1119	140.0 g
4708	215291	992	200.0 g
4709	215291	252	2.0 
4710	215291	1120	1.0 tbsp
4711	518510	222	12.0 slices
4712	518510	1016	1500.0 ml
4713	518510	1065	4.0 cups
4714	518510	226	4.0 cups
4715	420245	222	24.0 servings
4716	420245	1121	24.0 servings
4717	420245	930	16.0 ounces
4718	420245	1122	1.0 package
4719	600466	4	3.0 cups
4720	600466	1123	6.0 ounces
4721	600466	244	1.75 cups
4722	600466	157	0.5 cup
4723	600466	417	2.0 cups
4724	600466	222	1.0 
4725	207263	222	2.0 dashes
4726	207263	1041	0.5 ounce
4727	207263	1036	1.0 ounce
4728	207263	1124	2.0 ounces
4729	264663	222	1.0 
4730	264663	4	2.0 cups
4731	264663	514	4.0 cups
4732	264663	584	1.0 
4733	264663	841	1.0 cup
4734	485916	1	1.0 stick
4735	485916	222	1.0 
4736	485916	244	0.75 C
4737	485916	231	3.0 packages
4738	485916	83	0.75 
4739	436881	1125	0.5 cup
4740	436881	209	4.0 tablespoons
4741	436881	679	0.5 cup
4742	436881	252	8.0 
4743	436881	1126	0.5 cup
4744	584396	516	1.0 
4745	584396	222	1.0 slicesslices
4746	584396	1127	2.0 pound
4747	584396	909	0.333333333333 cup
4748	584396	1069	1.0 tablespoon
4749	125714	1128	1.0 cup
4750	125714	222	1.0 
4751	125714	1085	1.0 cup
4752	125714	928	1.0 
4753	215865	1	4.0 servings
4754	215865	517	1.0 tbsp
4755	215865	468	50.0 g
4756	215865	252	6.0 
4757	215865	354	200.0 g
4758	510801	1085	4.0 cups
4759	510801	4	2.0 cups
4760	510801	1129	0.5 tsp
4761	510801	252	2.0 
4762	510801	447	1.0 tbsp
4763	527244	27	0.5 tsp
4764	527244	252	2.0 
4765	527244	226	0.5 cup
4766	527244	515	0.5 cup
4767	527244	1130	2.0 
4768	175000	16	0.333333333333 cup
4769	175000	222	1.0 
4770	175000	1131	1.0 teaspoon
4771	175000	243	6.0 pounds
4772	84947	1075	4.0 tablespoons
4773	84947	407	1.0 tablespoon
4774	84947	415	1.0 
4775	84947	252	2.0 
4776	84947	1076	2.0 
4777	84947	1077	24.0 ounce
4778	84947	15	4.0 servings
4779	617434	461	3.0 cups
4780	617434	913	2.0 drops
4781	617434	252	8.0 
4782	617434	190	3.25 cups
4789	44030	9	6.0 Tbsps
4790	44030	25	0.888888888889 
4791	44030	250	1.0 bunch
4792	44030	252	2.0 
4793	44030	37	2.0 kg
4794	216185	1	200.0 g
4795	216185	350	200.0 g
4796	216185	1134	200.0 g
4797	216185	121	4.0 
4798	216185	222	9.0 servings
4799	216185	1135	200.0 g
4800	322694	222	0.5 ounce
4801	322694	1114	16.0 ounces
4802	322694	21	1.0 serving
4803	322694	515	1.0 serving
4804	322694	1136	16.0 ounces
4805	126142	1137	0.5 cup
4806	126142	428	0.333333333333 cup
4807	126142	1138	4.0 servings
4808	126142	252	4.0 
4809	388326	1061	1.0 cubes
4810	388326	222	12.0 servings
4811	388326	514	3.0 cups
4812	388326	1065	6.0 cups
4813	388326	226	1.0 cups
4814	593156	1078	3.0 dashes
4815	593156	222	1.0 slice
4816	593156	570	2.0 tablespoons
4817	593156	1136	2.0 ounces
4818	593156	244	1.0 teaspoon
4819	159020	909	1.0 tablespoon
4820	159020	515	4.0 servings
4821	159020	1139	4.0 cups
4822	159020	222	1.0 
4823	159020	1062	1.0 cup
4824	159020	506	4.0 
4825	396602	222	2.0 slices
4826	396602	1140	0.333333333333 cup
4827	396602	464	2.0 
4828	396602	1141	2.0 cups
4829	396602	244	2.0 teaspoons
4830	544075	222	0.666666666667 cup
4831	544075	1142	0.333333333333 cup
4832	544075	641	1.0 
4833	544075	417	1.0 bag
4834	281947	9	4.0 servings
4835	281947	57	0.25 teaspoon
4836	281947	227	0.5 
4837	281947	403	15.0 ounce
4838	281947	33	4.0 servings
4839	281947	222	1.0 
4840	281947	6	0.5 teaspoon
4841	281947	356	0.5 teaspoon
4842	527715	222	1.0 
4843	527715	388	2.0 cups
4844	527715	406	2.0 
4845	527715	515	1.0 cup
4846	527715	1143	1.0 Tbsp
4852	44517	9	3.0 Tb
4853	44517	1025	8.0 
4854	44517	21	1.0 
4855	44517	33	6.0 servings
4856	44517	709	1.0 
4857	44517	222	1.0 
4858	437739	222	1.0 
4859	437739	455	16.0 ounces
4860	437739	1055	3.0 ounces
4861	437739	417	2.0 cups
4862	437739	244	3.0 cups
4863	249351	226	0.333333333333 Cup
4864	249351	252	4.0 
4865	249351	406	2.0 
4866	249351	405	1.0 Teaspoon
4867	249351	96	2.0 Tablespoons
4868	626236	21	1.0 
4869	626236	156	4.0 
4870	626236	252	2.0 
4871	626236	4	1.0 cup
4872	626236	515	2.0 cups
4873	626236	644	2.0 inch
4874	249441	16	4.0 tablespoons
4875	249441	222	1.5 cups
4876	249441	1061	4.0 cups
4877	249441	1146	1.0 cup
4878	249441	897	1.0 teaspoon
4879	3714	222	1.0 slice
4880	3714	1113	1.5 oz
4881	3714	1147	1.0 oz
4882	3714	4	1.0 oz
4883	3714	1101	0.75 oz
4884	667304	1148	4.0 tbsp
4885	667304	222	2.0 
4886	667304	483	1.75 cup
4887	667304	897	1.0 tsp
4888	224936	855	4.0 
4889	224936	835	2.0 
4890	224936	862	1.0 tbsp
4891	224936	252	4.0 
4892	503510	244	0.5 cup
4893	503510	417	2.0 bags
4894	503510	584	1.0 
4895	503510	252	2.0 
4896	503510	1149	6.0 oz
4897	126760	222	2.0 dashes
4898	126760	805	2.5 ounces
4899	126760	1150	1.0 slice
4900	126760	1069	0.5 ounce
4901	126760	515	1.0 serving
4902	233262	222	1.0 
4903	233262	833	15.0 ounce
4904	233262	218	750.0 milliliter
4905	233262	1151	24.0 ounces
4906	233262	1104	1.0 liter
4907	126773	226	1.0 teaspoon
4908	126773	816	6.0 tablespoons
4909	126773	1056	0.5 cup
4910	126773	914	2.0 teaspoons
4911	126773	222	1.0 
4912	126773	1104	0.666666666667 cup
4913	511572	1135	1.0 serving
4914	511572	928	1.0 serving
4915	511572	989	1.0 serving
4916	544360	4	2.0 tablespoons
4917	544360	1152	0.5 teaspoon
4918	544360	928	0.5 
4919	544360	1153	3.0 tablespoons
4920	167540	433	6.0 oz
4921	167540	406	4.0 
4922	167540	1153	3.0 cups
4923	282237	244	2.0 tablespoons
4924	282237	455	1.0 cup
4925	282237	406	2.0 
4926	282237	187	2.0 
4927	249481	928	1.0 
4928	249481	442	0.25 Cup
4929	249481	1154	1.0 
4930	544410	1155	1.0 tablespoon
4931	544410	928	0.333333333333 
4932	544410	733	2.0 piece
4933	249496	205	3.0 drops
4934	249496	1156	75.0 g
4935	249496	558	3.0 tablespoons
4936	249496	406	4.0 
4937	249496	96	75.0 g
4938	446178	1092	1.0 inch
4939	446178	1146	1.0 cup
4940	446178	515	3.0 handfuls
4941	446178	406	2.0 
4942	511860	874	12.0 ounces
4943	511860	1157	1.0 cup
4944	511860	614	16.0 
4945	511860	406	4.0 
4946	544638	618	1.0 
4947	544638	928	1.0 
4948	544638	466	1.0 
4949	610209	1158	0.75 cup
4950	610209	1061	4.0 
4951	610209	1159	1.0 Tbsp
4952	610209	928	1.0 
4953	200715	214	1.0 cup
4954	200715	928	0.5 
4955	200715	442	1.0 tablespoon
4956	102457	868	1.0 serving
4957	102457	415	0.5 
4958	102457	406	2.0 
4959	282712	1160	8.0 
4960	282712	928	1.0 
4961	282712	1161	2.0 Tbsp
4962	529010	244	1.0 cup
4963	529010	151	1.0 
4964	529010	406	2.0 
4965	529010	1162	1.0 cup
4966	414401	406	1.0 
4967	414401	2	1.0 cups
4968	414401	58	0.333333333333 cup
4969	414401	1126	9.0 servings
4970	414401	4	0.5 cup
4971	414401	96	1.0 cup
4972	414401	586	1.0 teaspoon
4973	414401	897	0.5 teaspoon
4974	627406	1163	2.0 
4975	627406	1146	1.0 C
4976	627406	928	1.0 
4977	529156	406	2.0 
4978	529156	930	0.5 tsp
4979	529156	244	0.25 cup
4980	529156	1164	4.0 
4981	529156	83	1.0 
4982	529156	6	1.0 Dash
4983	250761	16	2.0 teaspoons
4984	250761	1165	1.5 cups
4985	250761	928	1.0 
4986	250761	515	0.5 cup
4987	54208	1166	0.5 tsp
4988	54208	99	0.5 cup
4989	54208	406	2.0 
4990	54208	2	2.0 cups
4991	54208	586	0.25 tsp
4992	54208	244	1.0 cup
4993	54208	4	3.0 TBSP
4994	578594	895	1.0 tablespoon
4995	578594	894	1.0 cup
4996	578594	928	1.0 
4997	611447	16	8.0 cups
4998	611447	887	8.0 cups
4999	611447	1167	5.0 tablespoons
5000	611447	928	1.0 
5001	529558	1162	1.5 tablespoons
5002	529558	508	1.0 tablespoon
5003	529558	406	2.0 
5004	529558	1168	0.25 cup
5005	349428	1169	0.25 cup
5006	349428	4	0.75 cup
5007	349428	1170	1.0 cup
5008	349428	1110	1.0 teaspoons
5009	349428	928	1.0 
5010	267575	1171	3.0 oz
5011	267575	406	2.0 
5012	267575	1172	24.0 
5013	267575	96	0.25 cup
5014	578977	388	2.0 cups
5015	578977	483	1.0 cup
5016	578977	406	3.0 
5017	267748	147	2.0 cups
5018	267748	406	2.0 
5019	267748	1161	0.75 cup
5020	759354	238	1.0 sheet
5021	759354	406	3.0 
5022	759354	1173	0.5 cup
5023	759354	244	0.333333333333 cup
5028	579424	895	1.0 tablespoon
5029	579424	894	1.0 cup
5030	579424	928	1.0 
5031	579441	455	2.0 cups
5032	579441	928	1.0 
5033	579441	1175	12.0 oz
5034	169959	895	2.0 tablespoons
5035	169959	928	1.0 
5036	169959	1176	2.0 cups
5037	186429	1107	0.5 cup
5038	186429	104	0.5 
5039	186429	406	4.0 
5040	186429	210	1.0 
5041	268380	895	2.0 Tbsp
5042	268380	928	0.5 
5043	268380	1177	2.0 slices
5044	219247	1056	4.0 servings
5045	219247	406	4.0 
5046	219247	454	64.0 g
5047	596146	423	2.0 cups
5048	596146	406	1.0 
5049	596146	447	0.5 
5050	596192	835	1.0 
5051	596192	406	2.0 
5052	596192	411	4.0 
5053	596249	1178	0.5 bunch
5054	596249	222	1.0 
5055	596249	4	1.0 cup
5056	596249	928	1.0 
5057	203161	508	3.0 tablespoons
5058	203161	468	1.5 cups
5059	203161	406	6.0 
5060	203161	1179	12.0 ounces
5061	580034	433	1.0 cup
5062	580034	1061	2.0 servings
5063	580034	1180	0.125 tsp
5064	580034	406	2.0 
5065	580034	1181	0.5 cup
5066	285205	426	8.0 
5067	285205	406	8.0 
5068	285205	1161	1.0 cup
5069	350764	1182	2.0 9-inch
5070	350764	532	2.0 tablespoons
5071	350764	406	3.0 cups
5072	350764	19	1.0 teaspoon
5073	72327	895	1.0 Tbsp
5074	72327	894	0.78 oz
5075	72327	928	1.0 
5080	646426	508	2.0 tsp
5081	646426	928	1.0 
5082	646426	442	1.0 tbsp
5083	646426	1168	2.0 tbsp
5084	269782	226	2.0 cups
5085	269782	455	1.0 cup
5086	269782	406	2.0 
5087	269782	1104	1.0 liter
5088	171590	121	3.0 
5089	171590	99	0.333333333333 cup
5090	171590	406	1.5 cups
5091	171590	1122	1.0 box
5092	515692	455	10.0 ounces
5093	515692	928	0.5 cup
5094	515692	7	0.5 cup
5095	483059	9	10.0 servings
5096	483059	1184	10.0 servings
5097	483059	928	1.0 
5098	483059	442	10.0 servings
5099	483059	1168	0.5 cup
5100	483082	86	5.0 servings
5101	483082	1185	4.0 
5102	483082	1186	4.0 tablespoons
5103	483082	928	1.0 
5104	155425	205	0.5 tablespoon
5105	155425	290	0.5 cup
5106	155425	406	2.0 
5107	155425	244	1.0 tablespoon
5108	597847	86	3.0 tablespoons
5109	597847	244	0.333333333333 cup
5110	597847	151	1.0 
5111	597847	406	3.0 
5112	597847	1187	2.0 cups
5113	515973	86	2.0 Tablespoons
5114	515973	942	2.0 cups
5115	515973	555	8.0 servings
5116	515973	406	4.0 
5117	515973	1188	8.0 
5118	630732	349	0.25 teaspoon
5119	630732	121	4.0 
5120	630732	406	2.0 
5121	483336	1189	0.5 cup
5122	483336	1079	0.25 cup
5123	483336	406	6.0 
5124	483336	96	0.25 cup
5125	549020	909	1.0 tbsp
5126	549020	415	0.5 
5127	549020	928	0.5 
5128	549020	7	0.5 cup
5129	549115	151	1.0 
5130	549115	406	0.666666666667 Cup
5131	549115	1190	1.0 Box
5132	762137	1158	1.0 cup
5133	762137	928	1.0 
5134	762137	1162	2.0 Tb
5135	123348	226	0.5 cup
5136	123348	928	1.0 
5137	123348	841	1.0 cup
5138	565730	930	1.0 teaspoon
5139	565730	151	1.0 
5140	565730	406	2.0 
5141	549368	9	6.0 servings
5142	549368	406	2.0 
5143	549368	1191	6.0 servings
5144	549368	121	2.0 
5145	549368	2	0.5 Cup
5146	549368	325	0.75 Cup
5147	549368	6	1.0 pinch
5148	483917	121	2.0 
5149	483917	508	1.0 teaspoon
5150	483917	1192	1.0 oz
5151	483917	406	2.0 
5152	270968	1193	7.0 oz
5153	270968	406	6.0 
5154	270968	1194	2.0 cups
5155	189174	1155	3.0 tablespoons
5156	189174	406	1.0 
5157	189174	142	2.0 slices
5165	598996	406	3.0 
5166	598996	58	3.0 cups
5167	598996	244	1.0 teaspoon
5168	598996	16	2.0 tablespoons
5169	598996	668	5.0 cups
5170	598996	6	4.0 teaspoons
5171	484460	1195	2.0 
5172	484460	508	2.0 teaspoons
5173	484460	1192	2.0 teaspoons
5174	484460	1196	2.0 oz
5175	304363	1197	30.0 g
5176	304363	928	6.0 ounces
5177	304363	747	1.0 serving
5178	304363	244	172.0 g
5179	566721	1198	1.0 Tbsp
5180	566721	842	0.5 cup
5181	566721	406	2.0 
5182	566721	515	2.0 cups
5183	550536	589	0.75 cup
5184	550536	1112	0.5 cup
5185	550536	406	1.0 cup
5186	665469	406	1.0 
5187	665469	442	1.0 tbsp
5188	665469	454	1.0 
5189	387100	222	1.0 
5190	387100	4	180.0 ml
5191	387100	414	80.0 g
5192	387100	928	1.0 
5193	124985	930	1.0 teaspoon
5194	124985	244	0.25 cup
5195	124985	928	0.75 cup
5196	124985	7	1.0 cup
5197	124996	406	3.0 
5198	124996	2	2.0 cups
5199	124996	586	1.0 teaspoon
5200	124996	244	1.0 cup
5201	124996	1189	0.5 cup
5202	124996	6	1.0 teaspoon
5203	125011	1195	2.0 
5204	125011	894	2.0 servings
5205	125011	7	0.5 cup
5206	125011	515	2.0 cups
5207	125011	244	2.0 tablespoons
5208	485471	1169	4.0 
5209	485471	406	2.0 
5210	125018	53	4.0 tablespoons
5211	125018	1199	4.0 slices
5212	125018	406	2.0 
5213	125033	349	2.0 teaspoons
5214	125033	2	2.0 cups
5215	125033	1200	2.0 tablespoons
5216	125033	96	0.25 cup
5217	125033	1195	4.0 
5218	125041	433	1.0 cup
5219	125041	1201	0.5 cup
5220	125041	928	1.0 
5221	125064	461	3.0 ounces
5222	125064	1202	1.0 dash
5223	125064	928	1.0 slices
5224	125090	4	0.75 cup
5225	125090	455	2.0 cups
5226	125090	1203	0.5 cup
5227	125090	406	2.0 
5228	125103	406	2.0 
5229	125103	252	2.0 
5230	125103	210	1.0 
5231	125145	2	2.0 cups
5232	125145	586	1.0 teaspoon
5233	125145	244	1.0 cup
5234	125145	406	4.0 
5235	125145	269	1.0 cup
5236	125175	1204	1.0 cup
5237	125175	414	1.0 cup
5238	125175	928	1.0 
5239	125187	1061	6.0 
5240	125187	570	1.0 
5241	125187	558	2.0 ounces
5242	125187	928	1.0 
5243	125187	496	1.0 cup
5244	125209	214	1.5 cups
5245	125209	406	2.0 
5246	125209	2	1.0 cup
5247	125209	349	2.5 teaspoons
5248	125209	1205	0.666666666667 cup
5249	125209	914	2.0 teaspoons
5250	125209	6	0.25 teaspoon
5251	125234	1128	0.5 cup
5252	125234	433	6.0 ounces
5253	125234	928	1.0 
5254	125297	1177	1.0 slice
5255	125297	928	0.5 
5256	125297	733	0.125 teaspoon
5257	125310	16	1.0 tablespoon
5258	125310	480	2.0 tablespoons
5259	125310	406	4.0 
5260	125325	1206	0.333333333333 cup
5261	125325	214	2.0 cups
5262	125325	1159	85.0 g
5263	125325	928	1.0 
5264	125349	4	2.0 cups
5265	125349	406	2.0 
5266	125349	1207	14.0 ounce
5267	125349	244	0.5 cup
5268	125349	1208	0.25 cup
5269	125349	6	0.5 teaspoon
5270	125384	928	0.5 
5271	125384	1209	1.0 
5272	125384	1173	2.0 tablespoons
5273	125403	856	1.0 cup
5274	125403	406	2.0 
5275	125403	226	0.666666666667 cup
5276	125436	86	0.5 cup
5277	125436	406	2.0 
5278	125436	1210	2.5 tablespoons
5279	125436	1211	3.0 cups
5280	125436	4	0.333333333333 cup
5281	125436	96	0.5 cup
5282	125436	1212	3.0 cups
5283	125436	6	1.0 tablespoon
5284	125436	1213	1.0 cup
5289	157418	478	4.0 servings
5290	157418	408	4.0 servings
5291	157418	40	4.0 servings
5292	157418	989	4.0 servings
5293	157418	248	4.0 servings
5294	157418	97	1.0 clove
5295	485135	443	4.0 servings
5296	485135	1215	4.0 servings
5297	485135	371	4.0 servings
5298	485135	1216	4.0 servings
5299	485135	408	4.0 servings
5300	247611	99	2.0 tablespoons
5301	247611	408	10.0 ounces
5302	247611	2	0.5 
5303	247611	33	2.0 servings
5304	247611	633	1.0 handful
5305	247611	635	0.25 cup
5306	247611	151	1.0 
5307	247611	29	2.0 
5308	510004	408	2.0 cups
5309	510004	143	0.25 tsp
5310	510004	33	4.0 servings
5311	510004	263	2.0 oz
5312	510004	334	3.0 
5313	510004	7	0.25 cup
5314	329850	361	8.0 ounces
5315	329850	1217	1.0 
5316	329850	33	8.0 servings
5317	329850	165	4.0 
5318	329850	1218	6.0 ounces
5319	329850	1219	6.0 ounces
5320	542863	408	4.0 cups
5321	542863	989	0.25 cup
5322	542863	455	1.0 cup
5323	542863	212	0.25 cup
5324	542863	65	2.0 teaspoons
5325	542863	1120	2.0 teaspoons
5326	100668	9	0.25 cup
5327	100668	25	4.0 
5328	100668	408	1.5 lbs
5329	100668	785	19.0 ounce
5330	100668	416	2.5 ounces
5331	100668	1220	1.0 lb
5332	100668	50	4.0 servings
5333	624990	9	1.0 tbsp
5334	624990	307	2.0 ounces
5335	624990	361	4.0 
5336	624990	6	0.25 teaspoon
5337	624990	415	0.5 
5338	624990	41	0.5 teaspoon
5339	624990	413	2.0 
5340	624990	447	0.5 
5341	362866	1221	19.0 ounce
5342	362866	25	2.0 
5343	362866	57	0.25 teaspoon
5344	362866	6	0.25 teaspoon
5345	362866	361	8.0 cups
5346	362866	9	2.0 tablespoons
5347	362866	1219	2.0 ounces
5348	362866	1222	4.0 cups
5349	584084	1223	4.0 teaspoons
5350	584084	909	0.125 teaspoon
5351	584084	408	2.0 bunches
5352	584084	381	1.0 tablespoon
5353	584084	1224	1.0 handful
5354	584084	292	1.0 teaspoon
5355	584084	695	1.0 tablespoon
5356	584084	135	0.125 teaspoon
5357	158169	9	1.0 tablespoon
5358	158169	361	3.0 ounces
5359	158169	137	20.0 ounce
5360	158169	227	0.5 
5361	158169	41	4.0 servings
5362	158169	221	1.0 Dash
5363	158169	212	1.5 ounces
5364	158169	15	4.0 servings
5365	543214	1225	1.0 cup
5366	543214	99	1.0 tablespoon
5367	543214	408	1.0 cup
5368	543214	6	0.5 teaspoon
5369	543214	586	0.5 teaspoon
5370	543214	244	1.0 tablespoon
5371	543214	349	1.0 teaspoon
5372	543214	5	1.0 cup
5373	543214	151	1.0 
5374	223755	399	200.0 g
5375	223755	1226	500.0 g
5376	223755	32	400.0 ml
5377	223755	408	200.0 g
5378	223755	119	1.0 tbsp
5379	584240	518	2.0 slices
5380	584240	408	2.0 tablespoons
5381	584240	1227	1.0 slice
5382	584240	40	1.0 serving
5383	584240	425	2.0 slices
5384	584240	1228	2.0 
5385	27230	1229	1.0 serving
5386	27230	408	1.0 serving
5387	27230	1230	1.0 serving
5388	27230	154	1.0 serving
5389	27230	1231	1.0 serving
5390	289432	9	4.0 tablespoons
5391	289432	47	1.5 pounds
5392	289432	408	6.0 cups
5393	289432	33	4.0 servings
5394	289432	1232	4.0 
5395	289432	85	3.0 teaspoons
5396	289432	659	0.25 cup
5397	166559	9	1.0 tablespoon
5398	166559	378	4.0 teaspoons
5399	166559	408	1.0 cup
5400	166559	33	8.0 servings
5401	166559	458	2.0 
5402	166559	1233	13.2 oz
5403	166559	234	2.0 oz
5404	19220	660	1.0 
5405	19220	405	1.0 tsp
5406	19220	408	10.0 oz
5407	19220	509	1.0 tsp
5408	19220	33	1.0 serving
5409	19220	263	4.0 oz
5416	322387	1234	1.25 cups
5417	322387	408	1.0 pound
5418	322387	33	4.0 servings
5419	322387	205	2.0 teaspoons
5420	322387	814	1.0 pound
5421	322387	18	2.0 tablespoons
5422	609110	1235	2.0 tablespoons
5423	609110	121	6.0 
5424	609110	1236	0.5 cup
5425	609110	361	0.666666666667 cup
5426	609110	212	3.5 ounce
5427	19299	25	2.0 
5428	19299	1237	5.0 ounces
5429	19299	408	20.0 ounce
5430	19299	848	8.0 
5431	19299	4	6.0 cups
5432	19299	205	2.0 tablespoons
5433	19299	41	0.25 teaspoon
5434	19299	135	0.5 teaspoon
5435	617473	9	2.0 tbsp
5436	617473	499	0.25 cup
5437	617473	540	0.25 cup
5438	617473	408	1.0 Box
5439	617473	561	0.25 cup
5440	617473	428	0.25 cup
5441	617473	914	1.0 tbsp
5442	601088	9	2.0 teaspoons
5443	601088	171	1.0 
5444	601088	1238	0.5 cup
5445	601088	408	1.0 handful
5446	601088	263	0.5 cup
5447	601088	248	4.0 slices
5448	19486	9	1.0 Tbsp
5449	19486	1239	12.0 oz
5450	19486	408	6.0 ozs
5451	19486	1240	0.5 cup
5452	19486	33	4.0 servings
5453	19486	104	1.0 
5454	19486	7	0.25 cup
5455	478242	483	2.0 c
5456	478242	111	2.0 tbsps
5457	478242	79	1.0 
5458	478242	408	1.0 bag
5459	478242	33	2.0 servings
5460	478242	287	0.5 c
5461	478242	66	1.0 tbsp
5462	248872	473	1.0 tablespoon
5463	248872	132	2.0 8-inch
5464	248872	369	1.0 
5465	248872	635	2.0 tablespoons
5466	248872	408	0.5 cup
5467	568359	660	1.0 
5468	568359	86	1.0 tablespoon
5469	568359	79	1.0 
5470	568359	408	1.0 bunch
5471	568359	1241	2.0 cups
5472	568359	538	2.0 tablespoons
5473	568359	4	6.0 cups
5474	568359	66	2.0 cloves
5475	568359	1242	1.0 cup
5476	568359	6	1.0 teaspoon
5477	101432	9	1.0 tablespoon
5478	101432	25	5.0 
5479	101432	57	0.25 teaspoon
5480	101432	408	0.5 lb
5481	101432	1243	6.0 
5482	101432	69	0.75 cup
5483	101432	1244	0.5 cup
5484	101432	6	0.25 teaspoon
5485	27706	9	1.0 tsp
5486	27706	1245	1.0 
5487	27706	408	1.0 cup
5488	27706	1246	1.5 tbsp
5489	27706	1247	1.0 
5490	27706	151	1.0 
5491	617553	71	0.5 lb
5492	617553	74	2.0 cups
5493	617553	67	12.0 oz
5494	617553	79	1.0 
5495	617553	408	3.0 cups
5496	101464	1248	6.0 
5497	101464	86	2.0 tablespoons
5498	101464	408	10.0 ounce
5499	101464	1249	1.5 cups
5500	101464	122	3.0 slices
5501	101464	139	3.0 cups
5502	19549	9	0.25 
5503	19549	1250	2.0 tbsp
5504	19549	453	1.0 
5505	19549	1067	1.0 cup
5506	19549	408	4.0 cups
5507	19549	33	3.0 servings
5508	19549	409	3.0 servings
5509	19582	9	2.0 tablespoons
5510	19582	408	8.0 cups
5511	19582	39	0.25 cup
5512	19582	1243	2.0 pounds
5513	19582	68	4.0 
5514	19582	302	0.25 cup
5515	19582	15	4.0 servings
5516	19584	9	1.0 tablespoon
5517	19584	275	1.0 
5518	19584	79	1.0 
5519	19584	408	4.0 cups
5520	19584	1251	1.0 pound
5521	19584	377	12.0 
5522	19584	15	4.0 servings
5523	576665	408	1.0 handful
5524	576665	1061	6.0 
5525	576665	1146	1.0 cup
5526	576665	867	2.0 tablespoons
5527	576665	928	1.0 
5528	576665	442	1.0 tablespoon
5529	19693	152	1.0 Handful
5530	19693	1252	1.0 Handful
5531	19693	408	50.0 gr
5532	19693	69	1.0 
5533	19693	418	100.0 gr
5534	19693	50	1.0 serving
5535	216328	1253	4.0 
5536	216328	9	1.0 tbsp
5537	216328	31	2.0 tbsp
5538	216328	408	140.0 g
5539	216328	1254	4.0 
5540	216328	252	2.0 
5541	19729	9	3.0 tablespoons
5542	19729	57	8.0 servings
5543	19729	278	1.0 pound
5544	19729	361	8.0 ounces
5545	19729	989	0.5 cup
5546	19729	455	8.0 ounces
5547	19729	65	2.0 tablespoons
5548	19729	6	0.25 teaspoon
5549	380187	9	1.0 tablespoon
5550	380187	4	1.0 cup
5551	380187	57	0.25 teaspoon
5552	380187	227	1.0 
5553	380187	361	1.0 pounds
5554	380187	785	30.0 ounces
5555	380187	16	1.0 teaspoon
5556	380187	622	0.25 cup
5557	380187	6	0.5 teaspoon
5558	265576	660	1.0 
5559	265576	1255	2.0 
5560	265576	361	0.666666666667 cup
5561	265576	831	0.5 cup
5562	265576	1256	2.0 
5563	19830	660	1.0 
5564	19830	36	0.333333333333 cup
5565	19830	831	0.25 cup
5566	19830	344	6.0 slices
5567	19830	408	6.0 cups
5575	175502	408	1.0 cup
5576	175502	1257	2.0 
5577	175502	762	15.5 oz
5578	175502	4	3.5 cups
5579	175502	1258	9.0 oz
5580	175502	101	14.5 oz
5581	19883	86	2.0 Tb
5582	19883	408	2.0 bunches
5583	19883	1019	1.0 cup
5584	19883	121	6.0 
5585	19883	4	2.0 Tb
5586	19883	1259	0.75 lb
5587	19883	29	4.0 
5588	306613	9	0.5 cup
5589	306613	1245	2.0 ounces
5590	306613	1250	0.25 cup
5591	306613	408	1.0 package
5592	306613	86	2.0 tablespoons
5593	306613	244	3.0 pinches
5594	306613	68	2.0 
5595	306613	1010	3.0 handfuls
5596	306613	6	3.0 pinches
5597	306613	15	4.0 servings
5598	19896	9	3.0 Tbsps
5599	19896	408	2.0 ozs
5600	19896	263	1.0 cup
5601	19896	65	3.0 Tbsps
5602	19896	206	4.0 servings
5603	19896	337	2.0 
5604	19896	1256	4.0 
5605	527829	36	4.0 servings
5606	527829	408	2.0 cups
5607	527829	32	3.0 cups
5608	527829	1260	38.0 oz
5609	527829	33	4.0 servings
5610	527829	420	2.0 Tbsp
5611	757327	1261	1.0 lb
5612	757327	730	15.0 sheets
5613	757327	79	2.0 cups
5614	757327	1236	15.0 
5615	757327	408	10.0 oz
5616	609905	1262	2.0 tablespoons
5617	609905	1033	2.0 
5618	609905	408	0.5 cup
5619	609905	420	4.0 tablespoons
5620	609905	338	4.0 slices
5621	609970	9	1.0 tbsp
5622	609970	79	1.0 
5623	609970	408	100.0 g
5624	609970	575	100.0 g
5625	609970	66	2.0 cloves
5626	609970	477	2.0 heads
5627	609970	50	4.0 servings
5628	364310	1263	1.0 pound
5629	364310	1264	16.0 ounces
5630	364310	408	3.0 cups
5631	364310	58	1.0 tablespoons
5632	364310	33	32.0 servings
5633	364310	409	0.5 cup
5634	364310	1265	1.0 pieces
5635	593797	36	1.0 Tablespoon
5636	593797	408	2.0 Tablespoons
5637	593797	520	0.333333333333 cup
5638	593797	580	0.25 teaspoon
5639	593797	696	1.0 Tablespoon
5640	593797	1266	8.0 ounces
5641	626595	520	0.25 cup
5642	626595	416	3.0 ounces
5643	626595	408	1.0 cup
5644	626595	151	1.0 
5645	626595	238	1.0 sheet
5646	577563	1	2.0 tablespoons
5647	577563	408	2.0 handfuls
5648	577563	2	0.75 cup
5649	577563	348	2.0 teaspoons
5650	577563	6	1.0 pinch
5651	577563	4	1.5 tablespoons
5652	577563	66	1.0 clove
5653	577563	151	1.0 
5654	28795	408	9.0 oz
5655	28795	41	4.0 servings
5656	28795	154	14.0 oz
5657	28795	1267	8.0 ozs
5658	28795	409	1.0 oz
5659	28795	1268	8.0 ozs
5660	553104	9	2.0 tbs
5661	553104	1269	2.0 tbs
5662	553104	518	8.0 slices
5663	553104	408	4.0 oz
5664	553104	1235	4.0 tbsp
5665	553104	1231	8.0 slices
5666	512190	1	2.0 Tablespoons
5667	512190	31	2.0 Tablespoons
5668	512190	408	5.0 ounces
5669	512190	66	3.0 cloves
5670	512190	197	0.25 cup
5671	512190	50	3.0 servings
5672	553160	408	6.0 oz
5673	553160	455	8.0 oz
5674	553160	1270	0.25 cup
5675	553160	1146	4.0 cups
5676	553160	406	1.0 
5677	4390	408	1.0 bunch
5678	4390	1271	0.333333333333 cup
5679	4390	4	1.5 cups
5680	4390	1272	3.0 
5681	4390	867	0.25 cup
5682	4390	283	0.5 cup
5683	487712	9	0.5 T
5684	487712	408	3.0 c
5685	487712	262	4.0 tsp
5686	487712	263	2.0 oz
5687	487712	41	0.5 tsp
5688	487712	65	1.0 T
5689	487712	768	3.0 
5690	487712	6	0.25 tsp
5691	553297	36	0.25 cup
5692	553297	408	7.0 oz
5693	553297	1273	13.0 oz
5694	553297	1235	0.5 cup
5695	553297	1274	1.0 package
5696	553297	197	0.25 cup
5697	553297	6	6.0 servings
5698	471420	9	1.0 teaspoon
5699	471420	408	2.0 cups
5700	471420	205	1.0 tablespoon
5701	471420	66	1.0 clove
5702	471420	635	0.25 cup
5703	471420	1275	8.0 ounce
5704	176512	275	0.5 cup
5705	176512	361	2.0 cups
5706	176512	1276	0.25 cup
5707	176512	1277	2.0 cups
5708	176512	1009	0.25 teaspoon
5709	78273	1	1.0 tablespoon
5710	78273	57	0.125 teaspoon
5711	78273	408	1.0 cup
5712	78273	121	2.0 
5713	78273	122	1.5 oz
5714	78273	6	0.125 teaspoon
5715	78273	43	0.333333333333 cup
5716	78355	9	4.0 servings
5717	78355	31	1.0 Tbsp
5718	78355	408	2.0 packages
5719	78355	2	0.333333333333 cup
5720	78355	121	8.0 
5721	78355	575	6.0 ozs
5722	78355	206	4.0 servings
5723	78355	7	1.0 cup
5724	668224	195	1.0 
5725	668224	79	0.5 
5726	668224	408	1.0 Cup
5727	668224	508	7.0 servings
5728	668224	66	1.0 Cloves
5729	668224	135	7.0 servings
5730	668224	1278	7.0 servings
5731	668224	1279	2.0 
5732	275055	1280	3.0 
5733	275055	1281	1.0 cup
5734	275055	408	10.0 cups
5735	275055	212	4.0 oz
5736	275055	260	0.5 cup
5737	266886	661	0.25 cup
5738	266886	428	2.0 Tbsp
5739	266886	156	0.5 cup
5740	266886	831	0.25 cup
5741	266886	408	10.0 oz
5742	78584	36	1.0 serving
5743	78584	79	1.0 serving
5744	78584	408	1.0 serving
5745	78584	121	1.0 serving
5746	78584	807	1.0 serving
5747	78584	50	1.0 serving
5748	512812	1282	4.0 
5749	512812	582	0.5 cup
5750	512812	1283	1.0 tablespoon
5751	512812	67	8.0 slices
5752	512812	408	4.0 cups
5753	521029	9	1.0 tbsps
5754	521029	901	12.0 
5755	521029	79	1.0 
5756	521029	408	3.0 c
5757	521029	6	2.0 servings
5758	521029	57	2.0 servings
5759	521029	66	2.0 servings
5760	521029	104	2.0 
5761	95073	1	4.0 tablespoons
5762	95073	408	18.0 ounces
5763	95073	157	2.5 ounces
5764	95073	69	4.0 ounces
5765	95073	510	6.0 ounces
5766	95073	6	8.0 servings
5767	619685	307	3.0 oz
5768	619685	1284	1.0 tbsp
5769	619685	361	7.0 
5770	619685	1285	1.0 
5771	619685	1286	2.0 tbsp
5772	521394	9	4.0 tbsps
5773	521394	1287	4.0 servings
5774	521394	408	1.0 bunch
5775	521394	33	4.0 servings
5776	521394	66	1.5 tbsps
5777	521394	71	4.0 servings
5778	521394	1288	2.0 
5779	627928	919	3.0 servings
5780	627928	87	3.0 servings
5781	627928	408	1.0 bunch
5782	627928	4	3.0 
5783	627928	921	1.0 handful
5784	627928	66	2.0 cloves
5785	627928	1289	1.0 handful
5786	619744	1	1.0 teaspoon
5787	619744	660	1.0 serving
5788	619744	216	1.0 serving
5789	619744	408	1.0 
5790	619744	33	1.0 serving
5791	619744	151	1.0 
5792	267539	76	1.0 cup
5793	267539	1290	0.25 cup
5794	267539	227	0.25 cupslices
5795	267539	361	4.0 cups
5796	267539	1118	0.25 cup
5797	529745	36	2.0 tablespoons
5798	529745	987	1.0 tablespoon
5799	529745	1291	2.0 slices
5800	529745	151	1.0 
5801	529745	408	0.5 cup
5802	562597	81	2.0 
5803	562597	408	2.0 cups
5804	562597	415	1.0 
5805	562597	469	0.5 cup
5806	562597	723	0.25 cup
5807	489029	408	20.0 oz
5808	489029	32	1.0 can
5809	489029	1260	1.0 can
5810	489029	440	1.0 lb
5811	489029	66	3.0 cloves
5812	489029	40	4.0 servings
5813	489033	408	2.0 cups
5814	489033	1292	1.0 cup
5815	489033	33	6.0 servings
5816	489033	4	5.5 cups
5817	489033	38	3.0 cups
5818	489033	65	2.0 tsp
5819	489033	43	2.0 
5820	530108	121	4.0 
5821	530108	43	4.0 
5822	530108	262	2.0 tablespoons
5823	530108	635	4.0 tablespoons
5824	530108	408	1.0 pound
5825	661259	9	1.0 tsp
5826	661259	1217	1.5 pounds
5827	661259	453	1.0 
5828	661259	408	0.5 pound
5829	661259	33	4.0 servings
5830	661259	1218	0.25 pound
5831	661259	1293	0.75 cup
5832	587539	79	0.25 cup
5833	587539	408	2.0 cups
5834	587539	121	4.0 
5835	587539	67	4.0 slices
5836	587539	482	1.0 
5837	587539	50	2.0 servings
5838	423876	408	1.0 cup
5839	423876	147	0.75 cup
5840	423876	1061	1.0 cup
5841	423876	205	2.0 tablespoons
5842	423876	1294	12.0 ounces
5843	423876	928	1.0 
5844	14335	57	4.0 servings
5845	14335	408	6.0 cups
5846	14335	453	1.0 
5847	14335	103	4.0 servings
5848	14335	263	2.0 ozs
5849	14335	197	0.25 cup
5850	227365	9	1.0 tablespoon
5851	227365	601	3.0 
5852	227365	408	1.0 cup
5853	227365	121	5.0 
5854	227365	472	3.0 ounces
5855	227365	1295	4.0 ounces
5856	227365	41	0.25 teaspoon
5857	202812	9	3.0 tablespoons
5858	202812	1217	1.5 pound
5859	202812	453	1.0 
5860	202812	408	1.0 pound
5861	202812	33	6.0 servings
5862	202812	1218	0.5 pound
5863	202812	1293	1.0 cup
5864	219209	361	2.0 cups
5865	219209	1296	1.0 cup
5866	219209	74	29.0 oz
5867	219209	432	16.0 
5868	219209	4	1.0 cup
5869	219209	1297	1.0 cup
5870	301215	408	10.0 oz
5871	301215	67	0.5 pound
5872	301215	121	10.0 
5873	301215	575	2.0 oz
5874	301215	33	4.0 servings
5875	301215	7	2.0 tablespoons
5876	497879	561	0.5 tablespoon
5877	497879	361	200.0 g
5878	497879	79	1.0 
5879	497879	95	1.5 tablespoon
5880	497879	292	0.5 tablespoon
5881	497879	66	2.0 cloves
5882	497879	135	1.0 teaspoon
5883	31003	379	3.0 Tbsps
5884	31003	76	4.0 
5885	31003	1298	2.0 bunches
5886	31003	408	2.0 handfuls
5887	579984	1	1.0 tablespoon
5888	579984	216	0.75 cup
5889	579984	408	2.0 cups
5890	579984	121	4.0 
5891	579984	4	3.0 cups
5892	579984	1299	1.0 cup
5893	579984	6	0.5 teaspoon
5894	506269	9	1.0 tsp
5895	506269	361	1.0 Handful
5896	506269	227	1.0 slice
5897	506269	1300	1.0 
5898	506269	383	1.0 slice
5899	506269	1301	1.0 
5900	506269	15	1.0 serving
5901	506288	414	100.0 g
5902	506288	1159	2.0 tbsp
5903	506288	1146	4.0 oz
5904	506288	1302	1.0 scoop
5905	506288	408	44.0 g
5906	620981	1303	14.0 g
5907	620981	408	120.0 g
5908	620981	334	2.0 
5909	620981	417	53.0 g
5910	620981	395	12.0 oz
5911	620981	6	1.0 g
5912	506316	1304	1.0 
5913	506316	361	1.0 Handful
5914	506316	618	0.5 
5915	506316	1305	4.0 oz
5916	506316	627	1.0 
5917	758032	414	1.25 cups
5918	758032	296	0.5 cup
5919	758032	880	2.0 Tb
5920	758032	1306	2.0 tsp
5921	758032	1307	4.0 cups
5922	758032	1176	0.5 cup
5923	80201	1308	0.666666666667 cup
5924	80201	296	14.0 ounces
5925	80201	95	1.5 teaspoons
5926	80201	940	1.0 sheet
5927	80201	29	2.0 
5928	80201	1309	2.0 cups
5929	350565	660	2.0 ounces
5930	350565	99	4.0 servings
5931	350565	1310	1.0 ounce
5932	350565	296	1.0 pound
5933	350565	392	4.0 servings
5934	350565	475	2.0 ounces
5935	350565	1311	1.0 ounce
5936	207201	379	3.0 tablespoons
5937	207201	292	1.0 teaspoon
5938	207201	296	1.0 pound
5939	207201	86	3.0 servings
5940	207201	27	2.0 teaspoons
5941	207201	392	3.0 servings
5942	207201	38	3.0 tablespoons
5943	207201	135	0.5 teaspoon
5944	207201	369	3.0 tablespoons
5945	207206	86	1.0 tablespoon
5946	207206	561	1.0 tablespoon
5947	207206	1312	1.0 teaspoon
5948	207206	296	18.0 ounce
5949	207206	95	2.0 tablespoons
5950	207206	292	1.0 tablespoon
5951	207206	66	2.0 cloves
5952	207206	29	2.0 
5953	760162	379	1.2 oz
5954	760162	296	2.0 oz
5955	760162	27	2.0 slices
5956	760162	1266	0.25 cup
5957	760162	1307	20.0 
5958	760162	1313	1.0 cup
5959	18863	1252	1.0 handful
5960	18863	830	1.0 serving
5961	18863	296	100.0 gr
5962	18863	1314	50.0 gr
5963	18863	672	50.0 gr
5964	18863	428	1.0 handful
5965	18863	1024	100.0 gr
5966	424378	9	1.0 tablespoon
5967	424378	1315	8.0 ounces
5968	424378	79	1.0 
5969	424378	296	16.0 ounces
5970	424378	139	2.0 cups
5971	424378	54	1.0 
5972	424378	469	1.0 
5973	602619	9	4.0 servings
5974	602619	1316	0.5 pound
5975	602619	195	0.5 head
5976	602619	156	3.0 
5977	602619	296	1.0 package
5978	602619	1050	3.0 
5979	602619	135	4.0 servings
5980	602619	477	0.5 head
5981	37402	296	7.0 ozs
5982	37402	1317	2.0 Tbsps
5983	37402	1159	0.333333333333 cup
5984	37402	1318	0.5 cup
5985	37402	1319	2.0 
5986	143910	292	0.5 teaspoon
5987	143910	244	0.25 cup
5988	143910	296	14.0 ounce
5989	143910	1320	1.0 tablespoon
5990	143910	95	0.5 cup
5991	143910	27	2.0 teaspoons
5992	143910	66	3.0 cloves
5993	143910	165	2.0 tablespoons
5994	522811	380	0.75 c
5995	522811	87	2.0 tbsps
5996	522811	381	2.0 tbsps
5997	522811	296	1.0 
5998	522811	88	1.0 tsp
5999	522811	165	2.0 servings
6000	522811	1321	2.0 c
6001	522811	244	1.0 tbsp
6002	522811	111	2.0 c
6003	143954	561	2.0 teaspoons
6004	143954	244	0.5 teaspoon
6005	143954	296	14.0 ounce
6006	143954	95	3.0 tablespoons
6007	143954	292	1.0 tablespoon
6008	143954	66	1.0 teaspoon
6009	143954	89	0.25 cup
6010	143954	78	1.0 teaspoon
6011	516710	561	1.0 can
6012	516710	1322	4.0 servings
6013	516710	229	2.0 Packages
6014	516710	296	1.0 Package
6015	516710	26	4.0 servings
6016	37483	9	1.0 Tbsp
6017	37483	25	2.0 
6018	37483	1323	0.25 cup
6019	37483	296	14.0 ozs
6020	37483	95	2.0 Tbsps
6021	37483	76	4.0 
6022	37483	1324	0.5 tsp
6023	37483	4	8.0 cups
6024	37483	244	1.0 Tbsp
6025	37483	469	1.0 
6026	287348	1325	1.0 tablespoon
6027	287348	95	2.0 teaspoons
6028	287348	296	4.0 ounces
6029	287348	1326	3.0 
6030	287348	165	0.25 cup
6031	582299	405	0.25 teaspoon
6032	582299	143	0.5 teaspoon
6033	582299	296	1.0 pound
6034	582299	509	0.5 teaspoon
6035	582299	95	1.0 teaspoon
6036	582299	96	2.0 teaspoons
6037	582299	622	1.0 tablespoon
6038	582299	6	0.5 teaspoon
6039	60102	57	0.125 teaspoon
6040	60102	296	1.0 pound
6041	60102	95	3.0 tablespoons
6042	60102	27	1.0 tablespoon
6043	60102	66	1.0 clove
6044	60102	68	0.25 cup
6045	60102	244	3.0 tablespoons
6046	60102	29	2.0 tablespoons
6047	150237	86	2.0 tablespoons
6048	150237	292	2.0 teaspoons
6049	150237	156	2.0 cups
6050	150237	296	8.0 ounces
6051	150237	244	0.5 teaspoon
6052	150237	157	2.0 cups
6053	150237	90	1.0 tablespoon
6054	150237	721	1.25 ounces
6055	150237	84	0.25 teaspoon
6056	150237	6	0.5 teaspoon
6057	500511	316	0.5 cup
6058	500511	296	0.75 
6059	500511	199	1.5 Tbsp
6060	500511	1327	15.0 
6061	500511	1328	1.5 cups
6062	500511	383	0.5 
6063	500511	135	4.0 servings
6064	514870	380	1.0 tbsp
6065	514870	296	1.0 pkg
6066	514870	165	2.0 servings
6067	514870	266	2.0 
6068	514870	6	3.0 cups
6069	514870	573	1.5 cup
6070	56231	9	0.5 tablespoon
6071	56231	79	1.0 
6072	56231	1329	4.0 
6073	56231	981	1.0 tablespoon
6074	56231	1330	0.25 cup
6075	56231	41	0.5 teaspoon
6076	56231	1331	0.25 cup
6077	56231	1094	0.5 cup
6078	56231	135	1.5 teaspoons
6079	478124	87	2.0 tbsps
6080	478124	381	2.0 tbsps
6081	478124	296	1.0 c
6082	478124	88	0.25 tsp
6083	478124	561	1.0 tsp
6084	478124	1332	2.0 tbsps
6085	478124	679	2.0 c
6086	478137	1333	2.0 c
6087	478137	110	2.0 tbsps
6088	478137	173	2.0 tbsps
6089	478137	296	0.75 c
6090	478137	88	2.0 
6091	478137	1334	2.0 
6092	478137	66	4.0 cloves
6093	478137	244	1.0 tbsp
6094	478137	201	4.0 
6095	478199	380	0.75 c
6096	478199	87	2.0 tbsps
6097	478199	381	2.0 tbsps
6098	478199	296	1.0 
6099	478199	88	1.0 tsp
6100	478199	165	2.0 servings
6101	478199	1321	2.0 c
6102	478199	244	1.0 tbsp
6103	478199	111	2.0 c
6104	189475	561	2.0 teaspoons
6105	189475	244	0.5 teaspoon
6106	189475	296	14.0 ounces
6107	189475	95	3.0 tablespoons
6108	189475	292	1.0 tablespoon
6109	189475	66	1.0 teaspoon
6110	189475	89	0.25 cup
6111	189475	78	1.0 teaspoon
6112	451692	9	1.0 tablespoon
6113	451692	480	0.25 cup
6114	451692	405	2.0 teaspoons
6115	451692	296	14.0 ounce
6116	451692	33	4.0 servings
6117	451692	534	0.25 teaspoon
6118	451692	333	5.0 tablespoons
6119	451692	66	2.0 cloves
6120	21626	480	0.25 cup
6121	21626	611	1.0 teaspoon
6122	21626	226	0.5 cup
6123	21626	1329	2.0 
6124	21626	999	2.0 
6125	21626	1106	8.0 ounces
6126	21626	6	0.25 teaspoon
6127	543882	561	2.0 tablespoons
6128	543882	296	1.0 cup
6129	543882	95	2.0 tablespoons
6130	543882	292	2.0 teaspoons
6131	543882	165	0.5 cup
6132	543882	1335	9.5 ounce
6133	543882	1311	1.5 cups
6134	486541	9	2.0 Tbsp
6135	486541	152	10.0 
6136	486541	79	1.0 
6137	486541	296	1.0 container
6138	486541	33	2.0 servings
6139	486541	1024	10.0 
6140	486541	714	0.5 tsp
6141	486541	20	1.0 tsp
6142	478414	111	2.0 tbsps
6143	478414	79	1.0 tbsp
6144	478414	1336	1.0 
6145	478414	296	1.0 
6146	478414	188	0.25 tsp
6147	478414	244	0.75 tsp
6148	478414	66	0.75 tbsp
6149	478414	6	0.5 tsp
6150	478414	246	1.0 
6151	478410	86	1.0 c
6152	478410	87	0.25 c
6153	478410	381	0.25 c
6154	478410	296	1.0 
6155	478410	489	0.25 tsp
6156	478410	165	2.0 servings
6157	478410	27	1.0 tsp
6158	478410	1332	0.25 c
6159	478410	244	2.0 tbsps
6160	478410	6	1.0 tsp
6161	478410	1311	6.0 
6162	310553	244	1.0 pinch
6163	310553	296	12.0 ounce
6164	310553	95	3.0 tablespoons
6165	310553	490	4.0 tablespoons
6166	310553	169	11.0 ounce
6167	310553	165	1.0 bunch
6168	310553	1335	8.0 ounce
6169	310553	15	4.0 servings
6170	310553	78	1.0 pinch
6171	540001	4	3.0 cups
6172	540001	87	2.0 teaspoons
6173	540001	578	0.5 cup
6174	540001	1337	4.0 
6175	540001	296	0.25 box
6176	540001	292	2.0 teaspoons
6177	540001	297	1.0 tablespoon
6178	540001	940	1.0 piece
6179	540001	6	2.0 teaspoons
6180	540001	477	1.0 
6181	13864	40	2.0 Tbsps
6182	13864	296	7.0 oz
6183	13864	33	2.0 servings
6184	13864	570	1.0 
6185	13864	66	4.0 cloves
6186	13864	510	1.0 
6187	13864	714	1.0 Tbsp
6188	13864	228	1.0 bunch
6189	470619	86	0.25 cup
6190	470619	501	1.0 teaspoon
6191	470619	226	0.5 cup
6192	470619	156	2.0 
6193	470619	296	16.0 ounce
6194	470619	244	1.0 tablespoon
6195	470619	4	0.25 cup
6196	470619	392	0.25 cup
6197	470619	95	2.0 tablespoons
6198	11909	86	2.0 Tbsps
6199	11909	292	2.0 tsps
6200	11909	156	2.0 cups
6201	11909	296	8.0 ozs
6202	11909	244	0.5 tsp
6203	11909	157	2.0 cups
6204	11909	90	1.0 Tbsp
6205	11909	721	1.25 ozs
6206	11909	84	0.25 tsp
6207	11909	6	0.5 tsp
6208	9912	86	2.0 tablespoons
6209	9912	296	14.0 oz
6210	9912	291	1.0 lb
6211	9912	1338	1.0 tablespoon
6212	9912	292	1.0 tablespoon
6213	9912	26	2.0 tablespoons
6214	9912	617	1.0 cup
6215	9912	29	4.0 
6216	32463	9	2.0 servings
6217	32463	1339	2.0 servings
6218	32463	1340	2.0 servings
6219	32463	75	2.0 servings
6220	32463	33	2.0 servings
6221	32463	97	1.0 clove
6222	32463	647	2.0 servings
6223	521985	9	1.0 serving
6224	521985	1341	1.0 serving
6225	521985	882	2.0 
6226	521985	79	1.0 
6227	521985	1342	1.0 serving
6228	521985	296	125.0 g
6229	521985	211	2.0 pinches
6230	521985	33	1.0 serving
6231	521985	66	1.0 tsp
6232	521985	43	2.0 
6233	112479	9	2.0 tablespoons
6234	112479	28	1.0 teaspoon
6235	112479	1343	0.5 teaspoon
6236	112479	296	14.0 ounce
6237	112479	95	1.0 teaspoon
6238	112479	624	1.0 tablespoon
6239	112479	66	2.0 tablespoons
6240	112479	1344	1.0 
6241	112479	369	1.0 
6242	522135	111	2.0 tbsps
6243	522135	79	1.0 tbsp
6244	522135	1336	1.0 
6245	522135	296	1.0 
6246	522135	188	0.25 tsp
6247	522135	244	0.75 tsp
6248	522135	66	0.75 tbsp
6249	522135	6	0.5 tsp
6250	522135	246	1.0 
6251	38843	9	0.5 cup
6252	38843	499	2.0 tsps
6253	38843	339	1.0 head
6254	38843	22	2.0 sprigs
6255	38843	296	1.0 box
6256	38843	57	3.0 servings
6257	38843	101	28.0 oz
6258	38843	15	3.0 servings
6259	38843	78	3.0 servings
6260	143339	9	1.0 tablespoon
6261	143339	296	0.75 cup
6262	143339	1345	0.125 teaspoon
6263	143339	116	0.125 teaspoon
6264	143339	205	1.5 tablespoons
6265	143339	6	0.5 teaspoon
6266	143339	1176	0.25 cup
6267	143339	20	0.125 teaspoon
6268	143435	1223	0.25 cup
6269	143435	79	0.75 cup
6270	143435	1346	0.5 teaspoon
6271	143435	296	32.0 ounce
6272	143435	944	1.5 teaspoons
6273	143435	1347	0.5 teaspoon
6274	143435	220	0.5 teaspoon
6275	761951	131	0.333333333333 
6276	761951	1348	2.0 tsp
6277	761951	278	1.0 lb
6278	761951	296	13.0 oz
6279	761951	1349	6.0 oz
6280	761951	292	1.5 Tb
6281	761951	1350	1.0 
6282	761951	955	1.0 serving
6283	370822	9	2.0 cups
6284	370822	218	2.0 cups
6285	370822	171	1.0 
6286	370822	227	1.0 
6287	370822	296	1.0 
6288	370822	1351	1.0 
6289	370822	1311	0.5 
6290	370822	1352	1.0 cup
6291	762000	9	1.0 Tb
6292	762000	101	14.5 oz
6293	762000	79	1.0 
6294	762000	6	0.75 tsp
6295	762000	240	6.0 1-inch
6296	762000	296	1.0 lb
6297	762000	1353	0.75 cup
6298	762000	802	4.5 oz
6299	762000	356	1.0 tsp
6300	659604	660	1.0 
6301	659604	79	0.5 
6302	659604	992	1.0 Handful
6303	659604	508	1.0 tsp
6304	659604	296	150.0 gm
6305	659604	33	1.0 serving
6306	659604	630	0.5 tsp
6307	659604	643	1.0 
6308	659604	20	0.25 tsp
6309	37023	548	4.0 ozs
6310	37023	611	2.0 Tbsps
6311	37023	296	14.0 ozs
6312	37023	156	3.0 
6313	37023	1354	2.0 Tbsps
6314	37023	1162	3.0 Tbsps
6315	37023	95	2.0 Tbsps
6316	37023	206	4.0 servings
6317	37023	1355	8.0 ozs
6318	118962	1356	1.0 tablespoon
6319	118962	1310	0.5 cup
6320	118962	296	0.5 cup
6321	118962	1357	0.25 cup
6322	118962	811	4.0 cups
6323	118962	614	0.5 cup
6324	118962	1358	2.0 tablespoons
6325	96473	9	3.0 tablespoons
6326	96473	25	6.0 
6327	96473	228	1.0 bunch
6328	96473	79	1.0 
6329	96473	296	14.0 ounce
6330	96473	4	1.0 cup
6331	96473	1359	1.0 
6332	96473	714	2.0 tablespoons
6333	96473	84	0.5 teaspoon
6334	96473	135	0.25 teaspoon
6335	16601	9	2.0 teaspoons
6336	16601	405	0.25 teaspoon
6337	16601	646	2.0 
6338	16601	296	1.0 package
6339	16601	95	0.25 cup
6340	16601	1360	6.0 servings
6341	16601	65	1.0 teaspoon
6342	16601	999	2.0 
6343	762068	9	2.0 Tb
6344	762068	57	0.5 tsp
6345	762068	1111	1.0 serving
6346	762068	296	13.0 oz
6347	762068	66	3.0 cloves
6348	762068	196	3.0 Tb
6349	762068	61	0.25 cup
6350	762068	101	4.0 
6351	618722	9	0.25 cup
6352	618722	499	3.0 tablespoon
6353	618722	414	0.25 cup
6354	618722	1332	1.0 tablespoon
6355	618722	1033	4.0 cups
6356	618722	296	12.0 ounce
6357	618722	453	1.0 
6358	618722	783	1.0 tablespoon
6359	618722	135	1.0 pinch
6360	22798	547	1.0 handful
6361	22798	1356	1.0 serving
6362	22798	296	100.0 gr
6363	22798	566	1.0 handful
6364	22798	672	2.0 
6365	22798	475	100.0 gr
6366	22798	38	100.0 gr
6367	80157	460	3.0 cups
6368	80157	1361	0.5 teaspoon
6369	80157	611	3.0 tablespoons
6370	80157	296	1.5 cups
6371	80157	88	1.0 tablespoon
6372	80157	292	1.5 tablespoons
6373	80157	26	1.0 tablespoon
6374	80157	1298	8.0 ounces
6375	110961	25	2.0 
6376	110961	1362	3.0 tablespoons
6377	110961	296	1.0 lb
6378	110961	95	6.0 tablespoons
6379	110961	28	2.0 tablespoons
6380	110961	1107	2.0 tablespoons
6381	110961	71	1.0 lb
6382	110961	1363	1.0 tablespoon
6383	110961	477	1.0 lb
6384	110961	78	1.0 teaspoon
6385	760214	1364	2.25 cups
6386	760214	588	1.0 cup
6387	760214	2	1.5 cups
6388	760214	586	1.5 tsp
6389	760214	296	1.0 cup
6390	760214	349	1.5 tsp
6391	760214	1365	1.5 cups
6392	760214	6	0.125 tsp
6393	760214	1176	0.75 cup
6394	760214	897	2.0 tsp
6395	102853	379	2.0 tablespoons
6396	102853	296	6.0 servings
6397	102853	1366	6.0 servings
6398	102853	89	6.0 servings
6399	102853	4	6.0 cups
6400	102853	475	6.0 servings
6401	102853	1367	6.0 slices
6402	102853	301	6.0 servings
6403	137692	9	3.0 tablespoons
6404	137692	57	0.5 teaspoon
6405	137692	348	0.5 teaspoon
6406	137692	296	1.0 lb
6407	137692	4	1.5 cups
6408	137692	1368	0.5 teaspoon
6409	137692	300	0.5 teaspoon
6410	137692	597	0.5 teaspoon
6411	137692	97	1.0 
6412	137692	6	0.5 teaspoon
6413	137692	1369	1.5 teaspoons
6414	205281	561	0.5 teaspoon
6415	205281	565	0.25 teaspoon
6416	205281	226	2.0 tablespoons
6417	205281	26	2.0 tablespoons
6418	205281	296	12.0 ounceslices
6419	205281	1370	3.0 tablespoons
6420	205281	28	1.0 teaspoon
6421	205281	96	1.0 tablespoon
6422	205281	201	2.0 tablespoons
6423	14824	86	0.5 cup
6424	14824	1371	1.0 Tbsps
6425	14824	381	1.0 Tbsp
6426	14824	2	0.25 cup
6427	14824	296	14.0 oz
6428	14824	95	2.0 Tbsps
6429	14824	392	1.0 tsp
6430	14824	66	2.0 tsps
6431	14824	6	3.0 servings
6432	14824	477	1.0 bunch
6433	481770	9	3.0 T
6434	481770	1372	8.0 sheets
6435	481770	513	1.0 tsp
6436	481770	296	1.0 
6437	481770	606	1.0 tsp
6438	481770	161	2.5 Cups
6439	481770	367	1.0 cup
6440	481770	126	1.0 
6441	481770	15	0.25 tsp
6442	10778	4	3.0 cups
6443	10778	296	5.0 oz
6444	10778	1325	1.0 tsp
6445	10778	758	1.0 
6446	10778	76	1.0 cup
6447	10778	854	1.0 cups
6448	10778	1373	1.0 
6449	10778	506	2.0 servings
6450	170527	86	2.0 teaspoons
6451	170527	31	1.0 tablespoon
6452	170527	453	2.0 tablespoons
6453	170527	296	8.0 oz
6454	170527	956	1.0 tablespoon
6455	170527	957	1.0 lb
6456	170527	205	2.0 tablespoons
6457	170527	66	1.0 clove
6458	170527	6	0.5 teaspoon
6459	119382	86	1.5 cups
6460	119382	296	1.0 cup
6461	119382	2	2.0 cups
6462	119382	586	1.0 teaspoon
6463	119382	156	3.0 cups
6464	119382	468	0.5 cup
6465	119382	244	1.0 cup
6466	119382	349	3.0 teaspoons
6467	119382	96	1.0 cup
6468	119382	6	1.0 teaspoon
6469	119382	930	2.0 teaspoons
6470	119382	733	1.0 teaspoon
6471	660067	86	2.0 teaspoons
6472	660067	168	10.0 gm
6473	660067	296	80.0 gm
6474	660067	88	30.0 gm
6475	660067	1357	30.0 gm
6476	660067	292	2.0 teaspoons
6477	660067	381	1.0 teaspoon
6478	660067	297	1.0 
6479	660067	66	1.0 teaspoon
6480	660067	244	1.0 teaspoon
6481	660067	6	0.25 teaspoon
6492	27284	9	0.25 cup
6493	27284	1250	4.0 tsps
6494	27284	262	1.0 Tbsp
6495	27284	296	14.0 ozs
6496	27284	561	2.0 tsps
6497	27284	26	2.0 tsps
6498	27284	43	2.0 lbs
6499	27284	206	6.0 servings
6500	27284	747	1.0 Tbsp
6501	14999	86	4.0 Tbsps
6502	14999	480	2.0 Tbsps
6503	14999	1374	1.0 
6504	14999	411	8.0 cups
6505	14999	79	0.5 cup
6506	14999	986	0.5 cup
6507	14999	296	14.0 oz
6508	14999	27	1.0 Tbsp
6509	424601	25	2.0 
6510	424601	79	1.0 
6511	424601	391	6.0 ounces
6512	424601	1325	0.25 cup
6513	424601	1375	1.0 teaspoon
6514	424601	29	5.0 servings
6515	424601	4	4.0 cups
6516	424601	296	16.0 ounces
6517	424601	58	1.0 tablespoon
6518	250533	86	2.0 servings
6519	250533	561	1.0 teaspoon
6520	250533	488	2.0 servings
6521	250533	244	1.0 tablespoon
6522	250533	296	1.0 container
6523	250533	89	1.0 
6524	250533	292	0.5 tablespoon
6525	250533	97	1.0 
6526	250533	95	2.5 tablespoons
6527	250533	78	1.0 tablespoon
6528	262853	1376	1.0 tsp
6529	262853	73	1.0 dash
6530	262853	1377	1.0 tbsp
6531	262853	115	1.0 dash
6532	262853	296	6.0 
6533	262853	116	0.25 tsp
6534	262853	349	1.0 tsp
6535	262853	41	0.25 tsp
6536	262853	6	0.5 tsp
6537	262853	1378	0.25 tsp
6538	543463	378	1.0 teaspoon
6539	543463	296	0.333333333333 
6540	543463	157	0.5 cup
6541	543463	205	0.5 teaspoon
6542	543463	1379	8.0 
6543	543463	1380	1.0 tablespoon
6544	543463	20	0.125 teaspoons
6545	35597	1381	0.5 cup
6546	35597	1159	0.5 cup
6547	35597	897	1.0 tsp
6548	35597	2	1.0 cup
6549	35597	586	0.75 tsp
6550	35597	296	0.25 cup
6551	35597	733	0.75 tsp
6552	35597	6	0.5 tsp
6553	35597	682	1.0 cup
6554	35597	442	0.5 cup
6555	21453	660	1.25 cups
6556	21453	25	2.0 
6557	21453	296	12.3 ounce
6558	21453	1020	7.0 ounce
6559	21453	227	0.5 cup
6560	21453	415	1.0 
6561	21453	205	2.0 tablespoons
6562	21453	6	0.5 teaspoon
6563	121843	86	2.0 servings
6564	121843	1356	3.0 tablespoons
6565	121843	1357	1.0 
6566	121843	976	2.0 servings
6567	121843	551	2.0 tablespoons
6568	121843	296	2.0 pieces
6569	121843	244	2.0 tablespoons
6570	121843	341	1.0 
6571	121843	573	2.0 tablespoons
6572	15357	86	4.0 tablespoons
6573	15357	480	2.0 tablespoons
6574	15357	1374	1.0 
6575	15357	411	8.0 cups
6576	15357	79	0.5 
6577	15357	986	0.5 cup
6578	15357	296	14.0 ounce
6579	15357	27	1.0 tablespoon
6580	478291	86	1.0 tbsp
6581	478291	1341	0.5 tsp
6582	478291	343	1.0 leaf
6583	478291	384	1.0 tablespoon
6584	478291	296	150.0 g
6585	478291	188	0.5 tsp
6586	478291	95	1.0 tbsp
6587	478291	663	1.0 bunch
6588	478291	66	1.0 tsp
6589	760933	959	0.333333333333 cup
6590	760933	58	2.0 Tb
6591	760933	296	8.0 oz
6592	760933	95	1.0 tsp
6593	760933	292	1.0 Tb
6594	760933	205	1.5 Tb
6595	760933	69	1.0 cup
6596	760933	1382	0.5 cup
6597	760933	616	6.0 cups
6598	478330	131	2.0 servings
6599	478330	79	1.0 
6600	478330	173	2.0 c
6601	478330	1336	1.0 
6602	478330	296	300.0 gram
6603	478330	188	0.5 tsp
6604	478330	244	2.0 tbsps
6605	478330	110	1.5 tbsps
6606	478330	66	2.0 cloves
6607	478330	43	2.0 
6608	478370	171	1.0 
6609	478370	380	1.0 tsp
6610	478370	111	1.5 c
6611	478370	296	1.0 
6612	478370	41	4.0 servings
6613	478370	244	1.0 pinch
6614	478370	593	2.0 
6615	478370	38	1.0 tbsp
6616	478370	489	4.0 servings
6617	478370	66	4.0 cloves
6618	478370	366	1.0 tablespoon
6627	17773	1366	1.0 
6628	17773	296	1.0 
6629	17773	76	6.0 
6630	17773	616	0.5 
6631	17773	792	2.0 
6632	17773	1384	6.0 tbsp
6633	478584	1385	2.0 c
6634	478584	111	2.0 c
6635	478584	244	0.333333333333 c
6636	478584	296	300.0 g
6637	478584	110	1.0 tbsps
6638	478584	88	1.0 tbsp
6639	478584	688	12.0 
6640	478584	1362	0.333333333333 c
6641	478584	366	2.0 tbsps
6642	478584	285	12.0 
6643	105880	73	0.25 teaspoon
6644	105880	79	1.0 
6645	105880	556	1.0 
6646	105880	2	3.0 tablespoons
6647	105880	508	3.0 tablespoons
6648	105880	296	0.75 cup
6649	105880	84	0.25 teaspoon
6650	105880	469	4.0 cups
6651	105880	6	0.25 teaspoon
6652	105880	1386	2.0 tablespoons
6653	761301	296	6.0 oz
6654	761301	66	1.0 tsp
6655	761301	1311	0.5 lb
6656	761301	412	1.0 head
6657	761301	830	2.5 Tb
6658	761301	811	2.0 cups
6659	761301	825	1.0 cup
6660	761301	792	1.0 
6661	114160	86	3.0 tablespoons
6662	114160	488	5.0 cups
6663	114160	115	1.0 teaspoon
6664	114160	296	1.0 lb
6665	114160	244	1.0 teaspoon
6666	114160	1052	3.0 tablespoons
6667	114160	1387	0.5 cup
6668	114160	768	3.0 
6669	114160	6	0.5 teaspoon
6670	114160	20	0.125 teaspoon
6671	624139	87	1.0 tsp
6672	624139	79	0.5 
6673	624139	1357	2.0 servings
6674	624139	296	240.0 gm
6675	624139	244	1.0 tsp
6676	624139	90	1.0 tsp
6677	624139	66	1.0 tsp
6678	624139	643	1.0 
6679	624139	6	0.25 tsp
6680	624139	1388	2.0 servings
6681	222803	357	1.0 
6682	222803	1389	1.0 tbsp
6683	222803	296	250.0 g
6684	222803	95	2.0 tbsp
6685	222803	49	1.0 tsp
6686	222803	1390	2.0 sheets
6687	222803	644	2.0 servings
6688	222803	447	1.0 
6699	620332	381	1.0 Tbsp
6700	620332	296	250.0 gm
6701	620332	88	1.0 tsp
6702	620332	95	1.5 Tbsp
6703	620332	1357	2.0 servings
6704	620332	479	1.0 Tbsp
6705	620332	244	1.0 Tbsp
6706	620332	1388	2.0 servings
6707	495516	296	14.0 oz
6708	495516	88	1.0 inch
6709	495516	1266	8.0 oz
6710	495516	96	2.0 tsp
6711	495516	1391	3.0 tbsp
6712	495516	1392	1.0 
6713	495516	29	6.0 servings
6714	495516	617	6.0 c
6715	14265	131	1.0 handful
6716	14265	1325	2.0 tbsp
6717	14265	296	2.0 oz
6718	14265	1298	3.0 oz
6719	14265	228	1.0 handful
6720	14265	29	2.0 
6721	14265	78	1.0 pinch
6722	92091	86	0.5 cup
6723	92091	25	6.0 
6724	92091	1393	1.0 head
6725	92091	296	14.0 ounces
6726	92091	552	0.25 cup
6727	92091	27	1.0 tablespoon
6728	92091	392	0.5 cup
6729	92091	95	3.0 tablespoons
6730	18383	86	1.0 tsp
6731	18383	561	1.0 Tbsp
6732	18383	296	14.0 oz
6733	18383	1008	4.0 ozs
6734	18383	165	2.0 
6735	18383	292	1.5 tsps
6736	18383	26	1.5 Tbsps
6737	18383	66	1.0 clove
6738	18383	206	4.0 servings
6739	18383	1394	0.5 tsp
6740	18383	78	0.5 tsp
6741	200703	959	0.25 cup
6742	200703	87	2.0 tablespoons
6743	200703	1395	3.0 tablespoons
6744	200703	1396	3.0 tablespoons
6745	200703	6	1.0 teaspoon
6746	200703	156	2.0 
6747	200703	296	1.0 pound
6748	200703	165	3.0 
6749	200703	292	2.0 teaspoons
6750	200703	559	10.0 ounces
6751	200703	539	2.0 tablespoons
6752	200703	244	1.0 tablespoon
6753	653322	292	1.0 teaspoon
6754	653322	408	2.0 cups
6755	653322	296	1.0 package
6756	653322	95	1.0 teaspoon
6757	653322	27	1.0 inch
6758	653322	617	6.0 cups
6759	653322	1397	1.0 package
6760	653322	29	2.0 
6761	641057	47	3.0 lbs
6762	641057	1398	2.0 tsp
6763	641057	584	2.0 oz
6764	641057	195	3.5 oz
6765	641057	296	0.125 
6766	641057	4	1.0 cup
6767	641057	91	0.25 tsp
6768	641057	714	1.0 tablespoon
6769	641057	603	0.125 tsp
6770	552202	226	0.75 cup
6771	552202	1307	1.25 cups
6772	552202	411	1.25 cup
6773	552202	515	1.0 cup
6774	552202	210	1.0 cup
6775	15628	1221	15.0 ounce
6776	15628	411	3.0 cups
6777	15628	79	1.0 cup
6778	15628	1399	3.0 slices
6779	15628	74	14.5 ounce
6780	15628	4	2.25 cups
6781	15628	41	0.25 teaspoon
6782	507177	1221	15.0 ounce
6783	507177	9	3.0 tablespoons
6784	507177	411	8.0 ounce
6785	507177	4	0.5 cup
6786	507177	41	0.75 teaspoon
6787	507177	66	0.25 cup
6788	507177	6	0.5 teaspoon
6789	507177	1400	8.0 ounces
6790	560600	157	2.0 stalks
6791	560600	448	6.0 
6792	560600	411	3.0 cups
6793	560600	747	2.0 tbsp
6794	286168	9	3.0 tablespoons
6795	286168	499	2.0 tablespoons
6796	286168	411	1.5 pounds
6797	286168	33	4.0 servings
6798	286168	811	0.5 cup
6799	286168	66	2.0 cloves
6800	527883	156	455.0 g
6801	527883	411	1.0 bunch
6802	527883	88	0.5 inch
6803	527883	447	0.5 
6804	618083	411	1.0 handful
6805	618083	1061	1.0 scoop
6806	618083	4	100.0 ml
6807	618083	475	10.0 
6808	618083	915	3.0 
6809	618083	590	300.0 ml
6810	609907	9	3.0 tbsp
6811	609907	411	6.0 c
6812	609907	667	1.0 tbsp
6813	609907	41	0.25 tsp
6814	609907	428	0.25 c
6815	609907	83	1.0 
6816	609907	15	0.25 tsp
6817	573057	9	2.0 Tablespoons
6818	573057	47	1.0 
6819	573057	675	1.0 cup
6820	573057	394	1.0 tablespoon
6821	573057	15	4.0 servings
6822	573057	411	10.0 cups
6823	544388	9	1.0 tablespoon
6824	544388	411	2.0 cups
6825	544388	197	0.25 cup
6826	544388	999	2.0 
6827	544388	104	1.0 
6828	544388	15	0.25 teaspoon
6829	609926	131	0.5 bunch
6830	609926	475	0.5 
6831	609926	1401	1.0 
6832	609926	411	4.0 
6833	524038	9	3.0 tablespoons
6834	524038	275	1.0 
6835	524038	411	16.0 cups
6836	524038	428	0.25 cup
6837	524038	66	1.0 clove
6838	524038	6	0.5 teaspoon
6839	544620	210	1.5 cups
6840	544620	411	1.0 cup
6841	544620	928	1.0 
6842	544620	1402	1.0 cup
6843	626641	9	1.0 tbsp
6844	626641	350	300.0 g
6845	626641	411	1.0 handful
6846	626641	79	1.0 
6847	626641	4	150.0 ml
6848	626641	41	4.0 servings
6849	626641	66	3.0 cloves
6850	626641	61	4.0 tbsp
6851	626641	6	4.0 servings
6852	524262	9	1.0 tablespoon
6853	524262	411	8.0 cups
6854	524262	79	1.0 
6855	524262	4	2.0 tablespoons
6856	524262	65	4.0 teaspoons
6857	524262	6	0.25 teaspoon
6858	524262	659	0.25 cup
6859	524326	1359	1.0 
6860	524326	644	1.0 
6861	524326	156	1.0 pound
6862	524326	411	1.0 bunch
6863	524326	478	1.0 pound
6864	626747	1403	0.5 cup
6865	626747	21	0.25 
6866	626747	411	1.0 cup
6867	626747	1404	4.0 ounces
6868	626747	928	1.0 
6869	626747	447	0.25 
6870	573683	47	2.0 cups
6871	573683	99	1.0 Tbsp
6872	573683	411	3.0 
6873	573683	79	1.0 
6874	573683	33	4.0 servings
6875	573683	791	0.5 cup
6876	573683	721	6.0 cups
6877	573713	677	4.0 
6878	573713	411	2.0 cups
6879	573713	448	2.0 
6880	573713	4	1.0 cup
6881	573713	417	1.0 cup
6882	573713	1232	2.0 
6883	573713	515	1.0 cup
6884	557362	483	13.5 
6885	557362	414	1.0 cup
6886	557362	411	1.0 cup
6887	557362	1405	3.0 
6888	557362	4	1.0 cup
6889	557362	475	0.25 cup
6890	758114	1406	2.0 Tb
6891	758114	680	0.25 cup
6892	758114	1407	1.0 pkg
6893	758114	66	2.0 tsp
6894	758114	411	12.0 oz
6895	500244	411	2.0 cups
6896	500244	1085	0.666666666667 cup
6897	500244	1408	1.0 Tbsp
6898	500244	1128	0.5 cup
6899	500244	1404	0.75 cups
6900	500244	928	1.0 
6901	721437	222	1.0 
6902	721437	835	1.0 serving
6903	721437	411	2.0 cups
6904	721437	989	0.5 cup
6905	721437	1118	0.5 cup
6906	762412	9	1.0 Tb
6907	762412	411	1.0 lb
6908	762412	11	1.0 cup
6909	762412	33	1.0 serving
6910	762412	4	0.25 cup
6911	762412	66	2.0 cloves
6912	762412	68	2.0 
6913	762412	1002	1.0 cup
6914	373375	895	2.0 teaspoons
6915	373375	1409	1.0 
6916	373375	661	2.0 tablespoons
6917	373375	411	2.0 
6918	373375	272	5.0 
6919	660108	9	3.0 tbsp
6920	660108	411	1.0 bunch
6921	660108	6	6.0 servings
6922	660108	227	1.0 
6923	660108	415	1.0 
6924	660108	104	1.0 
6925	660108	193	1.0 
6926	205460	1410	4.0 ounces
6927	205460	447	1.0 slicesslices
6928	205460	411	4.0 ounces
6929	205460	1402	0.5 cup
6930	205460	590	4.0 ounces
6931	512669	9	2.0 teaspoons
6932	512669	411	6.0 cups
6933	512669	415	1.0 
6934	512669	33	2.0 servings
6935	512669	1235	2.0 tablespoons
6936	512669	482	2.0 cups
6937	512669	369	1.0 stalk
6938	537238	104	1.0 
6939	537238	411	1.0 bunch
6940	537238	2	1.0 Cup
6941	537238	785	15.0 ounce
6942	537238	4	1.0 Cup
6943	537238	1205	2.25 Cups
6944	537238	66	2.0 cloves
6945	537238	33	1.0 pinch
6946	537238	6	1.0 Teaspoon
6947	537238	469	1.0 
6948	516844	9	1.0 tablespoon
6949	516844	411	6.0 oz
6950	516844	148	2.0 tablespoons
6951	516844	11	5.0 
6952	516844	4	8.0 cups
6953	516844	41	0.25 teaspoon
6954	516844	510	3.0 cups
6955	516844	6	0.75 teaspoon
6956	516844	29	0.25 cup
6957	533222	9	3.0 tbsp
6958	533222	411	10.0 oz
6959	533222	205	3.0 tbsp
6960	533222	1411	0.333333333333 cup
6961	533222	1412	1.0 
6962	533222	1413	0.333333333333 cup
6963	533222	6	0.25 tsp
6964	758513	9	3.0 Tb
6965	758513	411	9.0 cups
6966	758513	79	1.33333333333 cups
6967	758513	156	1.5 cups
6968	758513	66	3.0 cloves
6969	758513	78	0.5 tsp
6970	627519	411	2.0 Handfuls
6971	627519	4	1.0 serving
6972	627519	205	2.0 Tablespoons
6973	627519	475	0.5 
6974	627519	210	0.5 Cup
6975	627519	464	0.25 Cup
6976	602969	205	1.0 Tablespoon
6977	602969	455	0.5 cup
6978	602969	928	0.5 
6979	602969	1408	1.0 Tablespoon
6980	602969	411	2.0 cups
6981	13196	9	2.0 Tbsps
6982	13196	21	0.5 
6983	13196	411	2.0 bunches
6984	13196	1260	1.0 can
6985	13196	1345	1.0 dash
6986	13196	66	6.0 cloves
6987	13196	6	0.5 tsp
6988	95138	157	2.0 rib
6989	95138	174	0.333333333333 cup
6990	95138	156	3.0 
6991	95138	584	1.0 
6992	95138	411	2.0 
6993	304127	73	1.0 tablespoon
6994	304127	1414	2.0 tablespoons
6995	304127	411	1.0 bunch
6996	304127	116	0.25 cup
6997	304127	96	2.0 tablespoons
6998	304127	6	1.0 tablespoon
6999	304127	1378	0.5 teaspoon
7000	619542	171	1.0 
7001	619542	411	1.0 bunch
7002	619542	1387	1.0 cup
7003	619542	1406	0.5 cup
7004	619542	135	1.0 teaspoon
7005	619542	104	2.0 
7006	628033	156	1.0 lb
7007	628033	411	1.0 bunches
7008	628033	227	1.0 
7009	628033	33	8.0 servings
7010	628033	617	0.5 cup
7011	628033	808	1.0 lb
7012	619940	9	2.0 Tablespoons
7013	619940	411	2.0 cups
7014	619940	453	1.0 
7015	619940	75	0.5 cup
7016	619940	1415	2.0 cups
7017	619940	397	0.5 Tablespoon
7018	611773	9	0.25 cup
7019	611773	57	0.25 tsp
7020	611773	411	2.0 cups
7021	611773	478	2.0 
7022	611773	1416	0.25 cup
7023	611773	285	3.0 cup
7024	611773	66	1.0 clove
7025	611773	135	0.5 tsp
7026	398788	1403	1.0 cup
7027	398788	411	70.0 g
7028	398788	1061	480.0 ml
7029	398788	4	120.0 ml
7030	398788	1412	0.5 
7031	398788	222	1.0 
7032	398788	928	1.0 
7033	615902	9	1.0 tablespoon
7034	615902	1252	0.25 cup
7035	615902	411	1.0 bunch
7036	615902	497	2.0 tablespoons
7037	615902	157	1.0 stalk
7038	615902	41	0.25 teaspoon
7039	615902	1289	0.25 cup
7040	615902	6	1.0 teaspoon
7041	521800	411	2.0 
7042	521800	1280	2.0 
7043	521800	40	1.0 tbsp
7044	521800	333	0.25 cup
7045	521800	1417	2.0 tbsp
7046	521800	205	2.0 tbsp
7047	521800	15	0.5 tsp
7048	149107	480	0.75 ounce
7049	149107	411	0.5 ounce
7050	149107	1418	1.5 ounces
7051	149107	4	1.0 cup
7052	149107	88	0.75 ounce
7053	149107	244	1.0 cup
7054	149107	27	0.5 cup
7055	149117	220	1.0 slice
7056	149117	1419	1.5 ounces
7057	149117	210	0.5 cup
7058	149117	411	0.25 ounce
7059	149117	285	8.0 
7060	497294	9	2.0 tsp
7061	497294	411	3.0 cups
7062	497294	4	2.0 tbsp
7063	497294	66	2.0 cloves
7064	497294	197	2.0 tbsp
7065	497294	367	0.25 
7066	497294	135	4.0 servings
7067	497294	1420	2.0 tbsp
7068	157343	9	8.0 servings
7069	157343	1039	1.0 
7070	157343	411	2.0 bunches
7071	157343	405	0.5 teaspoon
7072	157343	79	0.5 
7073	157343	33	8.0 servings
7074	157343	65	1.0 teaspoon
7075	251657	411	3.0 bunches
7076	251657	585	0.5 teaspoon
7077	251657	1325	1.0 cup
7078	251657	1421	2.0 tablespoons
7079	251657	66	2.0 cloves
7080	251657	1406	1.0 cup
7081	251657	40	2.0 tablespoons
7082	522029	411	3.0 
7083	522029	311	1.0 cup
7084	522029	236	0.5 
7085	522029	27	1.0 teaspoon
7086	522029	1404	0.5 cup
7087	522029	210	0.5 cup
7088	522029	928	1.0 
7089	473051	9	1.0 tablespoon
7090	473051	411	1.0 bunch
7091	473051	222	1.0 
7092	473051	227	1.0 tablespoon
7093	473051	236	1.0 
7094	473051	1422	0.25 teaspoon
7095	473051	65	1.0 teaspoon
7096	559063	9	1.0 teaspoon
7097	559063	561	1.0 Tablespoon
7098	559063	57	4.0 servings
7099	559063	411	1.0 lb
7100	559063	608	0.125 teaspoon
7101	559063	4	0.25 cup
7102	559063	292	1.0 Tablespoon
7103	559063	1362	2.0 Tablespoons
7104	559063	66	2.0 cloves
7105	559063	6	4.0 servings
7106	759851	9	2.0 Tb
7107	759851	411	1.0 lb
7108	759851	1423	1.0 cup
7109	759851	66	1.0 Tbs
7110	759851	1424	1.0 lb
7111	759851	1311	3.0 cups
7112	604203	9	4.0 servings
7113	604203	411	1.0 cup
7114	604203	785	15.0 ounce
7115	604203	4	3.0 tablespoons
7116	604203	205	0.25 cup
7117	604203	66	7.0 cloves
7118	604203	680	0.25 cup
7119	604203	15	0.5 teaspoon
7120	608417	21	1.0 
7121	608417	644	1.0 inch
7122	608417	1425	4.0 
7123	608417	411	10.0 
7124	608417	408	4.0 cups
7125	760020	9	2.0 Tb
7126	760020	411	12.0 cups
7127	760020	79	1.5 cups
7128	760020	428	0.333333333333 cup
7129	760020	66	1.0 Tbs
7130	760020	65	3.0 Tb
7131	555476	396	4.0 
7132	555476	21	0.5 
7133	555476	475	1.0 
7134	555476	411	1.0 bunch
7135	555476	88	1.0 inch
7136	506377	411	67.0 g
7137	506377	4	0.25 cup
7138	506377	1387	14.0 g
7139	506377	1426	15.0 oz
7140	506377	65	2.0 tsp
7141	506377	659	20.0 g
7142	14869	9	2.0 Tbsps
7143	14869	1041	6.0 servings
7144	14869	411	1.0 bunch
7145	14869	661	0.333333333333 cup
7146	14869	205	6.0 servings
7147	14869	197	0.333333333333 cup
7148	14874	1066	0.5 cup
7149	14874	411	2.0 bunches
7150	14874	508	2.0 tbsp
7151	14874	227	1.0 
7152	14874	1005	1.0 tsp
7153	14874	1427	1.0 cup
7154	14889	1428	2.0 tablespoons
7155	14889	648	12.0 
7156	14889	411	2.0 bunches
7157	14889	9	2.0 tablespoons
7158	14889	244	2.0 teaspoons
7159	14889	66	2.0 cloves
7160	14889	781	4.0 ounce
7161	14889	6	1.0 teaspoon
7162	14892	9	1.0 dash
7163	14892	411	1.0 bunch
7164	14892	1429	5.0 
7165	14892	205	3.0 Tbsp
7166	14892	41	1.0 serving
7167	14892	1005	3.0 Tbsp
7168	14892	135	1.0 tsp
7169	14929	9	2.0 Tbsp
7170	14929	582	1.0 Tbsp
7171	14929	21	0.5 
7172	14929	411	1.0 bunch
7173	14929	561	0.25 cup
7174	14929	1052	1.0 tsp
7175	14929	6	1.0 tsp
7176	14942	9	0.333333333333 cup
7177	14942	411	5.0 cups
7178	14942	95	2.0 Tbsps
7179	14942	292	1.0 tsp
7180	14942	1430	1.0 cup
7181	14942	1431	1.0 cup
7182	14942	603	0.5 tsp
7183	14991	107	0.5 cup
7184	14991	936	1.0 cup
7185	14991	928	1.0 
7186	14991	1432	1.0 tsp
7187	14991	411	4.0 
7188	14996	9	2.0 Tbsps
7189	14996	411	2.0 bunches
7190	14996	125	1.0 
7191	14996	4	0.5 cup
7192	14996	41	4.0 servings
7193	14996	221	0.25 tsp
7194	14996	66	3.0 cloves
7195	14996	135	4.0 servings
7196	14996	78	1.0 pinch
7197	15006	9	8.0 Tbsps
7198	15006	411	8.0 cups
7199	15006	102	5.0 sprigs
7200	15006	1433	1.5 cups
7201	15006	205	1.0 Tbsp
7202	15006	41	6.0 servings
7203	15006	201	2.0 
7204	15006	15	1.0 Tbsp
7205	15010	9	4.0 servings
7206	15010	651	1.0 slices
7207	15010	57	4.0 servings
7208	15010	411	1.0 head
7209	15010	499	4.0 servings
7210	15010	66	4.0 cloves
7211	15010	206	4.0 servings
7212	15010	78	1.0 pinch
7213	15011	9	3.0 Tbsps
7214	15011	1434	0.25 tsp
7215	15011	411	1.0 bunch
7216	15011	1039	1.0 
7217	15011	66	3.0 cloves
7218	15011	419	1.5 cups
7219	15011	135	4.0 servings
7220	15030	1261	1.0 
7221	15030	99	1.0 Tb
7222	15030	411	1.0 
7223	15030	244	2.0 tsp
7224	15030	1052	2.0 Tb
7225	15030	91	0.25 
7226	15030	389	0.5 tsp
7227	96955	9	0.5 cup
7228	96955	25	2.0 
7229	96955	411	1.0 bunch
7230	96955	408	1.0 bunch
7231	96955	197	3.0 tablespoons
7232	96955	65	4.0 teaspoons
7233	608948	9	6.0 servings
7234	608948	1435	0.25 cup
7235	608948	411	1.0 cup
7236	608948	6	0.5 teaspoon
7237	608948	1436	1.0 
7238	608948	4	2.0 tablespoons
7239	608948	66	7.0 cloves
7240	608948	104	2.0 
7241	608950	9	1.0 tablespoon
7242	608950	411	1.0 bunch
7243	608950	1437	0.5 teaspoon
7244	608950	580	0.25 teaspoon
7245	608950	20	0.25 teaspoon
7246	608950	135	4.0 servings
7247	608950	544	0.5 cup
7248	608950	119	0.5 teaspoon
7249	96958	1425	2.0 
7250	96958	448	2.0 
7251	96958	1438	1.0 bunch
7252	96958	411	1.0 bunch
7253	96958	88	1.0 piece
7254	621273	4	1.0 serving
7255	621273	584	0.5 
7256	621273	27	1.0 tablespoon
7257	621273	475	1.25 inch
7258	621273	104	1.0 
7259	621273	411	1.0 handful
7260	502480	411	3.0 
7261	502480	79	0.5 
7262	502480	508	4.0 servings
7263	502480	1439	2.5 cups
7264	502480	66	3.0 cloves
7265	502480	1024	0.5 cup
7266	15076	411	0.75 cup
7267	15076	515	0.5 cup
7268	15076	157	1.0 stalk
7269	15076	205	1.0 Tbsp
7270	15076	928	0.5 
7271	15076	590	0.5 cup
7272	506620	73	0.5 teaspoon
7273	506620	411	8.0 cups
7274	506620	115	2.0 teaspoons
7275	506620	4	2.0 tablespoons
7276	506620	1387	0.25 cup
7277	506620	1005	1.0 tablespoon
7278	506620	135	0.75 teaspoon
7279	15155	582	2.0 tsps
7280	15155	57	9.0 servings
7281	15155	411	2.0 bunches
7282	15155	226	2.0 Tbsps
7283	15155	453	2.0 tsps
7284	15155	205	2.0 Tbsps
7285	15155	1440	6.0 Tbsps
7286	15155	135	0.5 tsp
7287	576331	617	4.0 cups
7288	576331	1325	3.0 tablespoons
7289	576331	296	2.0 cups
7290	576331	29	3.0 
7291	576331	411	2.0 cups
7292	15194	27	1.0 inch
7293	15194	21	0.5 
7294	15194	458	5.0 
7295	15194	515	1.0 serving
7296	15194	411	2.0 cups
7297	15206	414	1.0 handful
7298	15206	1183	1.0 cup
7299	15206	411	2.0 
7300	15206	928	1.0 
7301	15206	1441	1.0 Tbsp
7302	666496	1158	0.5 cup
7303	666496	1442	1.0 tablespoon
7304	666496	582	1.0 teaspoon
7305	666496	928	1.0 
7306	666496	411	2.0 cups
7307	666514	1401	0.5 
7308	666514	408	0.5 cup
7309	666514	856	1.0 cup
7310	666514	928	0.5 
7311	666514	411	0.5 cup
7312	15266	9	8.0 servings
7313	15266	1252	0.5 cup
7314	15266	411	1.0 bunch
7315	15266	205	2.0 Tbsps
7316	15266	1443	0.5 cup
7317	15266	659	0.666666666667 cup
7318	15279	25	2.0 
7319	15279	411	1.0 cup
7320	15279	40	2.0 Tbsps
7321	15279	33	4.0 servings
7322	15279	1444	4.0 cups
7323	15279	1024	2.0 cups
7324	15279	262	2.0 Tbsps
7325	15395	803	1.0 
7326	15395	411	1.0 bunch
7327	15395	40	0.25 cup
7328	15395	868	0.666666666667 cup
7329	15395	1445	0.25 tsp
7330	15395	66	1.0 Clove
7331	15395	1400	8.0 oz
7332	253015	411	4.0 cup
7333	253015	960	0.5 cup
7334	253015	1446	2.0 teaspoon
7335	253015	188	1.0 pinch
7336	253015	65	0.25 cup
7337	253015	15	1.0 pinch
7338	539733	411	2.0 handfuls
7339	539733	408	2.0 handfuls
7340	539733	618	1.0 
7341	539733	688	10.0 
7342	539733	1404	0.5 cup
7343	539733	61	1.0 handful
7344	15497	174	4.0 sprigs
7345	15497	414	1.0 handful
7346	15497	411	2.0 
7347	15497	928	1.0 
7348	15497	1441	1.0 Tbsp
7349	552084	4	1.0 dash
7350	552084	21	0.25 
7351	552084	411	5.0 stalks
7352	552084	415	1.0 
7353	552084	27	0.5 inch
7354	552084	458	1.0 
7355	552084	1422	1.0 pinch
7356	584906	9	0.5 cup
7357	584906	411	4.0 cups
7358	584906	1447	0.5 cup
7359	584906	4	0.25 cup
7360	584906	205	0.25 cup
7361	584906	66	3.0 cloves
7362	584906	155	1.0 cup
7363	584906	6	1.0 teaspoon
7364	584906	50	5.0 servings
7365	56655	1448	0.5 
7366	56655	1163	2.0 
7367	56655	928	1.0 
7368	56655	226	1.5 cups
7369	56655	411	0.5 cup
7370	552277	9	2.0 tablespoons
7371	552277	1449	1.0 head
7372	552277	227	1.0 tablespoons
7373	552277	415	1.0 
7374	552277	1450	1.0 
7375	552277	41	1.0 serving
7376	552277	1451	3.0 ounces
7377	552277	411	1.0 handful
7378	245088	9	4.0 servings
7379	245088	411	1.0 bunch
7380	245088	290	0.5 cup
7381	245088	205	1.0 Tbsp
7382	245088	510	0.5 
7383	245088	6	4.0 servings
7384	245088	78	0.5 teaspoon
7385	482698	4	2.0 tbs
7386	482698	411	2.0 c
7387	482698	466	1.0 
7388	482698	618	1.0 
7389	482698	27	2.0 tbs
7390	482698	205	2.0 tbs
7391	482698	1452	2.0 c
7392	609705	833	1.0 cup
7393	609705	388	0.5 cup
7394	609705	1402	1.25 cups
7395	609705	1408	1.0 tbsp
7396	609705	411	1.0 leaf
7397	573147	86	1.0 tbsp
7398	573147	1453	2.0 cups
7399	573147	411	225.0 g
7400	573147	95	1.0 Tbsp
7401	573147	66	2.0 cloves
7402	573147	165	3.0 
7403	8973	1178	1.0 serving
7404	8973	76	100.0 gr
7405	8973	50	1.0 serving
7406	8973	992	100.0 gr
7407	8973	556	1.0 
7408	25435	9	3.0 Tbsps
7409	25435	227	0.5 
7410	25435	1266	0.25 lb
7411	25435	1454	1.0 lb
7412	25435	15	0.5 tsp
7413	25435	469	2.0 slices
7414	222072	9	2.0 tbsp
7415	222072	1455	2.0 
7416	222072	76	6.0 
7417	222072	1456	200.0 g
7418	222072	337	2.0 
7419	222072	43	4.0 
7420	582561	456	2.5 cups
7421	582561	66	1.0 clove
7422	582561	703	0.5 cup
7423	582561	79	0.25 cup
7424	9363	1253	1.0 
7425	9363	672	50.0 gr
7426	9363	830	1.0 serving
7427	9363	38	50.0 gr
7428	9363	1266	100.0 gr
7429	272024	76	8.0 oz
7430	272024	1457	2.0 pkg
7431	272024	479	0.75 cup
7432	272024	260	0.25 cup
7433	91868	9	1.0 tablespoon
7434	91868	25	2.0 
7435	91868	57	0.125 teaspoon
7436	91868	578	0.5 cup
7437	91868	74	0.25 cup
7438	91868	291	1.0 lb
7439	173946	76	3.0 
7440	173946	1290	2.0 tablespoons
7441	173946	1024	5.0 
7442	173946	361	1.0 cup
7443	206726	9	8.0 servings
7444	206726	99	8.0 servings
7445	206726	1458	1.0 cup
7446	206726	33	8.0 servings
7447	206726	456	2.0 cups
7448	206726	201	2.0 
7449	206726	356	1.0 tablespoon
7450	26746	482	0.5 
7451	26746	456	100.0 gr
7452	26746	419	100.0 gr
7453	26746	43	2.0 
7454	26746	50	1.0 serving
7455	666056	4	1.75 cups
7456	666056	444	2.0 tbsps
7457	666056	99	4.0 servings
7458	666056	6	1.0 pinch
7459	666056	1459	1.5 cup
7460	666056	1460	0.75 cup
7461	666056	456	1.25 cup
7462	666056	1180	0.25 tsp
7463	76451	1461	2.0 Tbsps
7464	76451	232	8.0 
7465	76451	333	4.0 servings
7466	76451	1371	8.0 ozs
7467	76451	76	1.0 lb
7468	109300	9	2.0 teaspoons
7469	109300	25	2.0 
7470	109300	1462	2.0 cups
7471	109300	477	4.0 cups
7472	109300	85	1.0 tablespoon
7473	109300	50	8.0 servings
7474	11187	86	2.0 tbs
7475	11187	4	3.0 tbs
7476	11187	74	1.0 cup
7477	11187	76	2.0 cups
7478	11187	392	1.0 tbs
7479	11187	1463	3.0 tbs
7480	11187	616	0.5 head
7481	11187	6	1.0 
7482	11309	1264	1.0 serving
7483	11309	228	50.0 gr
7484	11309	415	1.0 
7485	11309	1464	1.0 serving
7486	109786	9	2.0 teaspoons
7487	109786	1462	2.0 cups
7488	109786	66	2.0 cloves
7489	109786	477	4.0 cups
7490	109786	85	1.0 tablespoon
7491	109786	50	6.0 servings
7492	77127	220	3.0 
7493	77127	1465	8.0 ozs
7494	77127	99	1.0 Tbsp
7495	77127	101	14.5 ozs
7496	77127	76	8.0 ozs
7497	421678	9	1.0 tablespoon
7498	421678	223	0.5 pound
7499	421678	262	1.0 tablespoon
7500	421678	748	1.0 teaspoon
7501	421678	57	0.125 teaspoon
7502	421678	244	0.25 teaspoon
7503	421678	14	1.0 pounds
7504	421678	6	0.25 teaspoon
7505	487282	149	0.5 cup
7506	487282	4	18.0 servings
7507	487282	1466	0.25 tsp
7508	487282	1467	18.0 servings
7509	487282	456	0.25 cup
7510	487282	6	18.0 servings
7511	143686	76	2.0 cups
7512	143686	26	1.0 tablespoon
7513	143686	74	1.33333333333 cups
7514	143686	1468	0.666666666667 cup
7515	209453	9	1.0 tablespoon
7516	209453	223	10.0 ounces
7517	209453	66	2.0 cloves
7518	209453	205	1.0 teaspoon
7519	209453	174	1.0 Handful
7520	111196	9	0.333333333333 cup
7521	111196	195	4.0 cups
7522	111196	33	4.0 servings
7523	111196	76	2.0 cups
7524	111196	66	2.0 tablespoons
7525	111196	477	4.0 cups
7526	668417	483	400.0 ml
7527	668417	1469	8.0 tsp
7528	668417	244	3.0 Tb
7529	668417	4	0.5 cup
7530	668417	570	250.0 gr
7531	668417	456	0.5 cup
7532	668417	6	0.125 tsp
7533	46032	76	10.0 
7534	46032	156	1.0 cup
7535	46032	296	0.75 lb
7536	46032	1470	0.5 cup
7537	406548	9	2.0 tablespoons
7538	406548	25	3.0 
7539	406548	223	1.0 pound
7540	406548	57	4.0 servings
7541	406548	205	0.25 cup
7542	406548	61	3.0 tablespoons
7543	423044	223	1.0 pound
7544	423044	1131	1.0 teaspoon
7545	423044	79	1.0 
7546	423044	58	0.333333333333 cup
7547	423044	397	0.333333333333 cup
7548	423044	6	1.0 teaspoon
7549	488605	1471	15.0 servings
7550	488605	1466	7.0 
7551	488605	456	0.25 cup
7552	488605	4	15.0 servings
7553	488605	1460	0.5 cup
7554	111874	223	2.0 cups
7555	111874	79	1.0 
7556	111874	1472	1.0 tablespoon
7557	111874	1473	5.0 cups
7558	111874	84	0.125 teaspoon
7559	111874	6	0.25 teaspoon
7560	570630	278	4.0 servings
7561	570630	76	4.0 servings
7562	570630	1474	4.0 servings
7563	570630	1475	1.0 jar
7564	636292	223	1.0 cup
7565	636292	79	1.0 
7566	636292	1322	1.0 cup
7567	636292	4	1.5 cups
7568	636292	49	1.0 tbsp
7569	636292	84	0.333333333333 tsp
7570	636292	135	4.0 servings
7571	30979	4	3.0 cups
7572	30979	1476	0.5 cup
7573	30979	1306	1.0 Tbsp
7574	30979	1003	2.0 Tbsps
7575	30979	456	1.0 cup
7576	30979	6	1.0 pinch
7577	96535	76	1.5 lbs
7578	96535	6	6.0 servings
7579	96535	228	6.0 servings
7580	96535	464	1.0 leaf
7581	96535	88	1.0 tablespoon
7582	522589	9	4.0 tbsps
7583	522589	79	1.0 
7584	522589	1462	5.0 
7585	522589	33	2.0 servings
7586	522589	66	1.0 tbsp
7587	522589	477	1.0 head
7588	14873	456	200.0 gr
7589	14873	1477	250.0 gr
7590	14873	66	1.0 clove
7591	14873	411	200.0 gr
7592	604744	350	100.0 g
7593	604744	143	0.5 tsp
7594	604744	99	2.0 servings
7595	604744	76	200.0 g
7596	604744	13	100.0 ml
7597	604744	41	2.0 servings
7598	604744	6	2.0 servings
7599	604744	892	0.25 tsp
7600	227950	57	4.0 servings
7601	227950	1478	60.0 g
7602	227950	408	125.0 g
7603	227950	76	4.0 
7604	227950	1387	1.0 handful
7605	227950	999	2.0 
7606	96904	4	2.0 cups
7607	96904	99	2.0 tablespoons
7608	96904	79	0.25 cup
7609	96904	1229	3.0 tablespoons
7610	96904	76	0.5 cup
7611	96904	66	0.5 teaspoon
7612	96904	6	0.5 teaspoon
7613	523011	79	0.25 c
7614	523011	173	2.0 tbsps
7615	523011	33	3.0 servings
7616	523011	1479	0.5 
7617	523011	66	1.0 tbsp
7618	523011	389	1.0 pinch
7619	523011	456	4.0 c
7620	113765	1472	0.333333333333 cup
7621	113765	156	2.0 
7622	113765	244	1.5 teaspoons
7623	113765	4	1.5 cups
7624	113765	205	2.0 
7625	113765	456	2.0 tablespoons
7626	113765	6	4.0 servings
7627	113765	337	2.0 lbs
7628	392324	223	1.0 pound
7629	392324	81	2.0 
7630	392324	499	0.5 cup
7631	392324	244	2.0 tablespoons
7632	392324	4	0.5 cup
7633	392324	97	1.0 
7634	392324	6	1.0 teaspoons
7635	588931	824	2.0 
7636	588931	244	200.0 gr
7637	588931	4	500.0 ml
7638	588931	19	4.0 servings
7639	588931	456	1.0 cup
7640	588931	6	0.25 tsp
7641	588931	1480	1.0 
7642	588931	659	0.5 cup
7643	425703	73	0.25 teaspoon
7644	425703	9	2.0 tablespoons
7645	425703	223	1.0 pound
7646	425703	57	0.25 teaspoon
7647	425703	61	4.0 servings
7648	425703	1386	0.25 cup
7649	540657	1481	1.0 serving
7650	540657	1457	1.0 serving
7651	540657	1482	1.0 serving
7652	540657	672	1.0 serving
7653	540657	1483	1.0 serving
7654	540657	456	1.0 serving
7655	540716	9	1.0 tsp
7656	540716	381	2.0 Tbsp
7657	540716	844	4.0 servings
7658	540716	95	1.0 Tbsp
7659	540716	367	0.5 
7660	540716	456	2.0 cups
7661	98352	128	0.5 cups
7662	98352	1484	2.0 cups
7663	98352	223	1.0 cups
7664	98352	152	2.25 ounce
7665	98352	1485	6.5 ounce
7666	114860	9	2.0 tablespoons
7667	114860	131	4.0 tablespoons
7668	114860	278	1.0 lb
7669	114860	76	2.0 cups
7670	114860	68	2.0 tablespoons
7671	114860	84	4.0 servings
7672	114860	6	0.5 teaspoon
7673	115048	278	1.0 lb
7674	115048	128	0.25 cup
7675	115048	205	1.0 teaspoon
7676	115048	428	2.0 tablespoons
7677	115048	76	4.0 ounces
7678	82590	1486	1.0 oz
7679	82590	453	0.5 cup
7680	82590	397	0.25 cup
7681	82590	41	1.0 serving
7682	82590	66	1.0 clove
7683	82590	1266	1.5 lbs
7684	82590	6	1.0 Tbsp
7685	607160	444	0.5 cup
7686	607160	99	28.0 servings
7687	607160	1487	2.0 Cups
7688	607160	6	1.0 pinch
7689	607160	1460	0.5 cup
7690	607160	456	1.0 cup
7691	607160	1180	0.5 tsp
7692	394275	169	2.0 cups
7693	394275	223	0.333333333333 cup
7694	394275	54	1.0 
7695	394275	469	0.5 
7696	394275	479	0.25 cup
7697	377980	1488	0.25 cup
7698	377980	223	20.0 
7699	377980	1489	3.0 
7700	377980	57	0.25 teaspoon
7701	377980	54	1.0 
7702	377980	6	0.25 teaspoon
7703	377980	469	1.0 
7704	230537	9	2.0 tablespoons
7705	230537	578	0.5 cup
7706	230537	141	2.0 tablespoons
7707	230537	408	2.0 cups
7708	230537	33	2.0 servings
7709	230537	1229	2.0 tablespoons
7710	230537	65	2.0 tablespoons
7711	411053	9	2.0 teaspoons
7712	411053	223	0.5 pound
7713	411053	79	1.0 
7714	411053	1490	0.25 teaspoon
7715	411053	420	3.0 tablespoons
7716	411053	469	2.0 
7717	18001	25	3.0 
7718	18001	171	0.5 
7719	18001	4	100.0 ml
7720	18001	95	3.0 servings
7721	18001	76	5.0 
7722	18001	580	3.0 servings
7723	18001	548	250.0 g
7724	18245	81	1.0 leaves
7725	18245	75	50.0 gr
7726	18245	297	2.0 
7727	18245	830	1.0 serving
7728	18245	1266	100.0 gr
7729	18245	197	1.0 handful
7730	591790	9	0.25 cup
7731	591790	21	1.0 
7732	591790	102	5.0 sprigs
7733	591790	1462	1.0 lb
7734	591790	66	2.0 cloves
7735	591790	343	1.0 
7736	591790	50	0.05 
7737	83997	73	2.0 servings
7738	83997	9	2.0 servings
7739	83997	223	2.0 servings
7740	83997	724	1.0 package
7741	83997	649	2.0 servings
7742	83997	65	2.0 servings
7743	83997	50	2.0 servings
7744	591894	86	3.0 Tbsp
7745	591894	4	2.0 cups
7746	591894	102	3.0 sprigs
7747	591894	1491	2.0 cubes
7748	591894	250	1.0 tsp
7749	591894	76	8.0 oz
7750	591894	527	3.0 Tbsp
7751	591894	66	2.0 cloves
7752	591894	50	0.05 
7753	199061	328	2.0 teaspoons
7754	199061	40	1.0 tablespoon
7755	199061	1462	10.0 ounces
7756	199061	41	3.0 servings
7757	199061	69	0.5 cup
7758	199061	68	0.25 cup
7759	199061	101	14.4 ounce
7760	199061	15	3.0 servings
7761	18852	76	250.0 gr
7762	18852	102	5.0 gr
7763	18852	1314	150.0 gr
7764	18852	868	15.0 gr
7765	18852	1492	300.0 gr
7766	18852	6	1.0 pinch
7767	248562	79	1.0 
7768	248562	1493	1.0 cup
7769	248562	2	5.0 tablespoons
7770	248562	74	2.0 cups
7771	248562	1156	5.0 tablespoons
7772	248562	33	3.0 servings
7773	248562	76	8.0 ounce
7774	215792	235	1.0 bunch
7775	215792	9	1.0 jar
7776	215792	977	1.0 tbsp
7777	215792	236	1.0 
7778	215792	456	200.0 g
7779	215792	1494	4.0 oz
7780	19207	989	1.0 serving
7781	19207	1178	1.0 serving
7782	19207	830	1.0 serving
7783	19207	419	100.0 gr
7784	19207	1266	50.0 gr
7785	19207	169	50.0 gr
7786	379806	223	0.5 cup
7787	379806	548	0.5 cup
7788	379806	58	2.0 teaspoons
7789	379806	227	0.333333333333 cup
7790	379806	1007	0.333333333333 cup
7791	379806	54	0.333333333333 cup
7792	379806	6	0.25 teaspoon
7793	379877	9	2.0 tablespoons
7794	379877	223	2.0 cups
7795	379877	611	3.0 tablespoons
7796	379877	1012	0.5 teaspoon
7797	379877	1495	0.25 teaspoon
7798	379877	981	0.5 teaspoon
7799	379877	300	0.5 teaspoon
7800	314362	613	0.5 cup
7801	314362	568	2.0 tablespoons
7802	314362	403	14.0 ounce
7803	314362	33	4.0 servings
7804	314362	185	0.5 cup
7805	314362	456	1.0 cup
7806	625680	9	2.0 servings
7807	625680	1332	2.0 servings
7808	625680	1496	2.0 servings
7809	625680	1497	2.0 servings
7810	625680	811	0.5 cup
7811	625680	456	1.0 cups
7812	625680	6	2.0 servings
7813	379983	9	2.0 tablespoons
7814	379983	223	2.0 cups
7815	379983	807	2.0 tablespoons
7816	379983	57	0.125 teaspoon
7817	379983	580	0.125 teaspoon
7818	379983	54	0.5 
7819	379983	1313	2.0 cups
7820	379983	469	2.0 cups
7821	495013	343	1.0 
7822	495013	578	2.0 c
7823	495013	174	3.0 sprigs
7824	495013	4	8.0 c
7825	495013	721	2.0 c
7826	495013	97	1.0 
7827	544252	1155	0.5 cup
7828	544252	456	1.0 cup
7829	544252	1498	1.5 cups
7830	544252	1499	0.5 cup
7831	544252	659	0.25 cup
7832	511507	4	4.0 quarts
7833	511507	79	1.0 
7834	511507	37	3.0 
7835	511507	81	4.0 
7836	511507	76	1.0 pound
7837	511507	69	1.0 
7838	511507	1500	1.0 tablespoon
7839	511507	50	6.0 servings
7840	757276	725	1.0 cup
7841	757276	1501	6.0 cups
7842	757276	1290	3.0 Tb
7843	757276	456	2.0 cups
7844	757276	66	1.0 
7845	36510	74	1.0 cups
7846	36510	59	0.25 cups
7847	36510	1502	0.25 cups
7848	36510	428	2.0 tablespoons
7849	36510	578	4.0 ounce
7850	397061	73	1.0 Dash
7851	397061	86	0.25 cup
7852	397061	223	1.0 pound
7853	397061	384	3.0 tablespoons
7854	397061	57	1.0 Dash
7855	397061	731	1.0 
7856	397061	54	1.0 
7857	397061	6	0.5 teaspoon
7858	757545	9	1.0 Tb
7859	757545	47	0.75 cup
7860	757545	1462	6.0 
7861	757545	218	0.25 cup
7862	757545	170	4.0 
7863	757545	420	0.25 cup
7864	757545	6	0.25 tsp
7865	36780	1116	0.5 cup
7866	36780	76	0.5 cup
7867	36780	1008	0.5 lb
7868	36780	561	2.0 tsp
7869	36780	545	0.5 cup
7870	479202	9	1.0 tablespoon
7871	479202	547	2.0 tablespoons
7872	479202	1025	1.0 bunch
7873	479202	156	0.5 pound
7874	479202	1362	0.25 cup
7875	479202	456	1.0 cup
7876	479202	6	1.0 teaspoon
7877	37120	548	2.0 cups
7878	37120	95	1.0 tbsp
7879	37120	76	4.0 oz
7880	37120	1362	1.0 tbsp
7881	37120	490	1.0 tbsp
7882	37120	603	4.0 servings
7883	200971	9	3.0 tablespoons
7884	200971	261	1.0 pound
7885	200971	33	4.0 servings
7886	200971	76	10.0 ounces
7887	200971	66	3.0 cloves
7888	200971	61	1.0 handful
7889	200971	101	14.0 ounce
7890	250182	9	1.5 tsp
7891	250182	1462	0.5 lb
7892	250182	66	2.0 tsp
7893	250182	617	0.333333333333 cup
7894	250182	1503	6.5 inch
7895	250182	369	1.0 
7896	250182	1504	2.0 tbsp
7897	250263	292	0.25 cup
7898	250263	1332	0.5 cup
7899	250263	1325	0.333333333333 cup
7900	250263	4	1.0 cup
7901	250263	165	6.0 
7902	250263	76	1.5 pounds
7903	250263	1505	1.0 tablespoon
7904	381761	128	8.0 ounces
7905	381761	223	1.0 pound
7906	381761	61	2.0 tablespoons
7907	381761	29	0.5 cup
7908	381761	54	0.25 cup
7909	611350	86	3.0 servings
7910	611350	483	1.0 cup
7911	611350	1460	3.0 tbsp
7912	611350	244	0.5 tbsp
7913	611350	1466	0.25 tsp
7914	611350	1506	0.5 tsp
7915	611350	456	1.0 cup
7916	611350	1507	2.0 pinches
7917	382038	86	0.5 cup
7918	382038	25	2.0 
7919	382038	57	1.0 Dash
7920	382038	79	1.0 
7921	382038	4	2.0 tablespoons
7922	382038	76	1.0 pound
7923	382038	980	1.0 Dash
7924	382038	397	0.666666666667 cup
7925	382038	6	1.0 teaspoon
7926	103519	355	6.0 ounces
7927	103519	4	4.0 cups
7928	103519	270	1.0 cup
7929	103519	76	8.0 ounces
7930	103519	781	4.0 ounces
7931	103519	469	1.0 lb
7932	398580	9	1.0 tablespoon
7933	398580	223	1.0 cup
7934	398580	79	1.0 
7935	398580	14	1.0 pound
7936	398580	428	0.25 cup
7937	398580	54	1.0 
7938	612102	439	2.0 cups
7939	612102	1460	1.0 cup
7940	612102	4	5.0 servings
7941	612102	1466	2.0 tbsp
7942	612102	456	1.0 cup
7943	612102	6	0.25 tsp
7944	120922	9	2.0 tablespoons
7945	120922	79	1.0 
7946	120922	74	14.5 ounces
7947	120922	1462	20.0 ounces
7948	120922	997	1.0 
7949	120922	206	6.0 servings
7950	120922	205	1.0 teaspoons
7951	39436	76	0.833333333333 
7952	39436	792	2.0 
7953	39436	1356	2.0 servings
7954	39436	1508	200.0 gr
7955	39436	733	2.0 servings
7956	465516	86	0.25 cup
7957	465516	223	1.0 cups
7958	465516	540	3.0 tablespoons
7959	465516	1065	0.25 cup
7960	465516	1509	8.0 cups
7961	465516	1137	0.25 cup
7962	465516	57	0.25 teaspoon
7963	465516	6	0.25 teaspoon
7964	171020	9	2.0 tablespoons
7965	171020	1510	0.5 teaspoon
7966	171020	171	1.0 
7967	171020	79	1.0 
7968	171020	130	0.5 teaspoon
7969	171020	76	8.0 
7970	171020	731	1.0 
7971	597035	9	3.0 tablespoons
7972	597035	76	1.0 pound
7973	597035	597	0.5 teaspoon
7974	597035	41	0.25 teaspoon
7975	597035	1508	1.0 cup
7976	597035	65	2.0 tablespoons
7977	597035	1511	4.0 
7978	597035	82	2.0 
7979	597035	6	0.5 teaspoon
7980	106312	99	4.0 tablespoons
7981	106312	578	1.0 lb
7982	106312	178	0.25 teaspoon
7983	106312	1444	8.0 inch
7984	106312	4	0.5 cup
7985	106312	66	2.0 tablespoons
7986	106312	33	2.0 servings
7987	106312	469	8.0 inch
7988	417737	9	1.0 tablespoon
7989	417737	223	1.0 cups
7990	417737	79	1.0 
7991	417737	262	1.0 tablespoon
7992	417737	57	0.125 teaspoon
7993	417737	97	1.0 
7994	417737	54	1.0 
7995	417737	6	0.25 teaspoon
7996	761991	9	2.0 tsp
7997	761991	79	1.0 
7998	761991	578	9.0 oz
7999	761991	1512	5.0 cups
8000	761991	617	7.0 cups
8001	761991	1311	6.0 
8002	582106	9	1.0 Tbsp
8003	582106	25	5.0 
8004	582106	361	4.0 handfuls
8005	582106	87	1.0 Tbsp
8006	582106	4	1.0 Tbsp
8007	582106	1462	1.0 pound
8008	582106	95	3.0 Tbsp
8009	582106	292	1.0 Tbsp
8010	582106	559	10.0 oz
8011	582106	15	4.0 servings
8012	8918	547	1.0 serving
8013	8918	992	50.0 gr
8014	8918	415	1.0 
8015	8918	989	1.0 serving
8016	8918	76	100.0 gr
8017	8918	830	1.0 serving
8018	19241	99	1.0 Tbsp
8019	19241	408	7.0 ozs
8020	19241	453	1.0 
8021	19241	33	1.0 serving
8022	19241	464	1.0 Tbsp
8023	19241	354	1.0 Tbsp
8024	19850	361	1.0 leaves
8025	19850	1237	3.0 cup
8026	19850	121	3.0 
8027	19850	33	1.0 serving
8028	19850	4	1.0 Tb
8029	19850	631	2.0 tsp
8030	19850	18	1.0 tsp
8031	649827	1	4.0 servings
8032	649827	9	4.0 servings
8033	649827	102	1.0 bunch
8034	649827	103	6.0 
8035	649827	3	1.0 kilogram
8036	649827	33	4.0 servings
8037	649827	104	1.0 
8038	601217	2	2.0 cups
8039	601217	117	2.0 tablespoons
8040	601217	33	6.0 servings
8041	601217	116	0.25 teaspoon
8042	601217	13	2.0 cups
8043	601217	17	1.0 
8044	601217	118	0.25 teaspoon
8045	601217	119	0.25 teaspoon
8046	535745	9	2.0 tbsp
8047	535745	120	4.0 slices
8048	535745	2	4.0 servings
8049	535745	121	1.0 
8050	535745	33	4.0 servings
8051	535745	122	4.0 slices
8052	535745	123	4.0 servings
8053	535745	17	1.0 lb
8054	481242	33	4.0 servings
8055	481242	218	4.0 servings
8056	481242	219	4.0 servings
8057	481242	220	1.0 pieces
8058	481242	17	1.0 
8059	481242	43	0.5 lb
8060	481250	9	4.0 servings
8061	481250	2	4.0 servings
8062	481250	121	3.0 
8063	481250	3	1.0 
8064	481250	33	4.0 servings
8065	481250	66	1.0 cloves
8066	481250	221	4.0 servings
8067	481250	104	1.0 
8068	556315	36	2.0 tablespoons
8069	556315	247	1.0 serving
8070	556315	248	8.0 slices
8071	556315	42	0.75 cup
8072	556315	17	1.0 cup
8073	556315	249	1.0 
8074	164135	274	8.0 oz
8075	164135	275	1.5 cups
8076	164135	276	15.0 oz
8077	164135	58	1.0 tablespoon
8078	164135	277	2.0 tablespoons
8079	164135	17	1.5 cups
8080	164135	101	14.5 oz
\.


--
-- Name: recipe_ingredients_recipe_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('recipe_ingredients_recipe_ingredient_id_seq', 8080, true);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: kathyma
--

COPY recipes (recipe_id, title, prep_time, ready_in, yield_amt, image, instructions) FROM stdin;
475433	Chicken and Dumplings	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-Dumplings-475433.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Boil chicken on low heat until very tender, approximately 2 hours.</li>\n<li>Remove chicken from broth and pull into strips, returning to broth.</li>\n<li>Add salt to broth.</li>\n<li>Mix flour, Crisco, buttermilk, and water together to form dough.</li>\n<li>Roll out thin on lightly floured paper towels.</li>\n<li>Cut into 1 inch strips and pinch off 1½ inch pieces.Drop dough pieces into boiling broth. Cook enough to turn over in broth.</li>\n<li>Add butter and milk and allow to gently boil for 3-5 more minutes.</li>\n<li>Remove from heat and serve.</li>\n</ol>\n</div>
33119	Grill-roasted Chicken With Potatoes & Green Beans	\N	\N	\N	https://spoonacular.com/recipeImages/grill-roasted-chicken-with-potatoes-green-beans-2-33119.jpg	http://www.williams-sonoma.com/recipe/grill-roasted-chicken-potatoes.html
156006	Moroccan-Style Roast Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/moroccan-style-roast-chicken-156006.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Position rack in bottom third of oven; preheat to 400°F. </li>\n<li>Whisk butter, honey, cinnamon, and turmeric in small bowl. Season with salt and pepper. </li>\n<li>Transfer 1/4 cup honey butter to small bowl; reserve.</li>\n\n<li>Place chicken on rack in roasting pan. </li>\n<li>Brush with some of remaining honey butter; sprinkle with salt and pepper. Roast chicken until thermometer inserted into thickest part of thigh registers 165°F to 170°F, brushing occasionally with honey butter and covering loosely with foil if browning too quickly, about 1 hour 10 minutes. </li>\n<li>Transfer to platter. </li>\n<li>Serve with reserved honey butter.</li>\n</ol>\n</div>
197005	Dinner Tonight: Roast Chicken with Saffron and Lemons	\N	\N	\N	https://spoonacular.com/recipeImages/Dinner-Tonight--Roast-Chicken-with-Saffron-and-Lemons-197005.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Preheat the oven to 400°F.</li>\n<li>2</li>\n\n<li>Place the saffron on a non-stick skillet set over medium heat.  Toast for 1 minute.  </li>\n<li>Remove and mix with the salt and black peppercorns.  Grind in a mortar and pestle or a spice grinder.</li>\n<li>3</li>\n<li>4</li>\n\n<li>Place the chicken in a roasting pan and set in the oven.  Cook for 1 hour.</li>\n</ol>\n</div>
213397	Asian Roasted Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Asian-Roasted-Chicken-213397.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Remove and discard giblets and neck from chicken. Rinse chicken with cold water; pat dry. Trim excess fat. Starting at neck cavity, loosen skin from breast and drumsticks by inserting fingers, gently pushing between skin and meat.</li>\n<li>Combine soy sauce, ginger, garlic, and broth in a large heavy-duty zip-top plastic bag. </li>\n<li>Add chicken; seal and marinate in refrigerator 4 to 8 hours, turning bag occasionally. </li>\n<li>Remove chicken from bag, reserving 1/2 cup marinade.Preheat oven to 375°.</li>\n<li>Place chicken, breast side up, on the rack of a broiler pan or roasting pan. Insert meat thermometer into meaty part of thigh, making sure not to touch bone. </li>\n<li>Bake at 375° for 1 hour and 10 minutes or until thermometer registers 180°. Cover chicken loosely with foil; let stand 10 minutes for chicken to reabsorb juices. Discard skin.</li>\n<li>Add 1/2 cup reserved marinade to drippings in pan (you'll have about 1/4 cup drippings), scraping pan to loosen browned bits. </li>\n<li>Pour marinade mixture into a small saucepan; bring to a boil, and cook 5 minutes. Stir in sesame oil. </li>\n<li>Cut chicken into quarters. </li>\n<li>Drizzle with sesame mixture. Sprinkle with onions.</li>\n</ol>\n</div>
74166	Baked Chicken With Cheese And Cream Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/baked_chicken_with_cheese_and_cream_sauce-74166.jpg	http://www.saveur.com/article/Recipes/Baked-Chicken-with-Cheese-and-Cream-Sauce
164332	Chicken-Parmesan Potatoes	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-Parmesan-Potatoes-164332.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat Potatoes, Sauce </li>\n<li>Mix and remaining ingredients except cheese to boiling in 10-inch skillet over high heat, stirring occasionally.</li>\n<li>2</li>\n<li>Reduce heat; cover and simmer about 25 minutes, stirring occasionally, until potatoes are tender.</li>\n<li>3</li>\n<li>Stir in cheese. </li>\n<li>Let stand 5 minutes.</li>\n</ol>\n</div>
74225	Chicken With Tomatoes And Olives Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/chicken-with-tomatoes-and-olives-recipe-2-74225.jpg	http://www.foodrepublic.com/2011/03/11/chicken-tomatoes-and-olives-recipe
74407	Chicken with Slow-Roasted Tomatoes and Cheesy Grits	\N	\N	\N	https://spoonacular.com/recipeImages/chicken_with_slow-roasted_tomatoes_and_cheesy_grits-74407.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 350°. On a rimmed baking sheet, toss the tomatoes with 2 tablespoons of the oil and season with salt and pepper. Turn the tomatoes cut side down and scatter the rosemary around; bake on the bottom shelf of the oven for 1 hour and 15 minutes, or until very soft and starting to brown. </li>\n<li>Let cool, then discard the skins.Meanwhile, in a roasting pan, rub the chicken all over with 1 tablespoon of the oil and season with salt and pepper. Scatter the onion wedges around the chicken, drizzle with the remaining 1 tablespoon of oil and season with salt and pepper. Roast the chicken and onions in the upper third of the oven for 1 hour and 10 minutes.Increase the oven temperature to 450°. </li>\n<li>Add the wine to the pan and roast the chicken for about 20 minutes longer, until the onions are well browned and the chicken is golden and the cavity juices run clear. </li>\n<li>Pour the cavity juices into the pan. </li>\n<li>Transfer the chicken and onions to a platter; let the chicken rest for 10 minutes.Set the roasting pan over moderately high heat and add 4 of the tomato halves and 1/2 cup of water. Simmer, scraping up any browned bits and mashing the tomatoes, until reduced by one-third. Strain the jus into a saucepan and season with salt and pepper. Carve the chicken and serve with the tomatoes, onions, tomato jus and Creamy Cheese Grits.</li>\n</ol>\n</div>
25369	Sunday Roast With Butternut Squash Anna	\N	\N	\N	https://spoonacular.com/recipeImages/sunday-roast-with-butternut-squash-anna-2-25369.jpg	http://www.britishlarder.co.uk/one-10-chicken-three-meals-part-one/#axzz1SWgy9QlH
189301	Dijon and Tarragon Grilled Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Dijon-and-Tarragon-Grilled-Chicken-189301.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine first 5 ingredients in processor. Process until smooth. </li>\n<li>Place chicken pieces in 15x10x2-inch glass baking dish. Sprinkle chicken with salt and pepper. </li>\n<li>Pour tarragon-mustard mixture over chicken; toss to coat. </li>\n<li>Let stand at room temperature 1 hour or refrigerate 2 to 4 hours, turning occasionally.</li>\n<li>Prepare barbecue (medium heat). </li>\n<li>Place chicken on barbecue. Cover and grill until chicken is almost cooked through, turning every 5 minutes and basting with marinade, about 30 minutes. Grill without basting until chicken is cooked through, about 7 minutes longer. </li>\n<li>Serve chicken hot, warm, or at room temperature.</li>\n</ol>\n</div>
125529	Ugandan Plantains With Chicken Stew	\N	\N	\N	https://spoonacular.com/recipeImages/ugandan-plantains-with-chicken-stew-2-125529.jpg	http://www.food.com/recipe/ugandan-plantains-with-chicken-stew-235859
549859	Thai Chili Tuna and Pepper Spread	\N	\N	\N	https://spoonacular.com/recipeImages/Thai-Chili-Tuna-and-Pepper-Spread-549859.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix the tuna, mayo, sriachi, jelly and peppers until blended well.  </li>\n<li>Add more mayo if needed to obtain desired consistency.   </li>\n<li>Serve with crackers or crostini - anything with a crunch :)</li>\n</ol>\n</div>
418827	Chicken and Rice Dinner	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-Rice-Dinner-418827.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Dredge chicken in flour. In a large skillet, brown chicken in oil on all sides over medium heat.</li>\n<li>In a large bowl, combine the water, rice, milk, salt, poultry seasoning and pepper. </li>\n<li>Pour into a greased 13-in. x 9-in. baking dish. Top with chicken.</li>\n<li>Cover and bake at 350° for 55 minutes or until chicken juices run clear. </li>\n<li>Garnish with parsley.</li>\n</ol>\n</div>
164950	Quick Chicken and Dumplings	\N	\N	\N	https://spoonacular.com/recipeImages/Quick-Chicken-and-Dumplings-164950.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat 1 1/2 cups milk, the peas and carrots, chicken and soup to boiling in 3-quart saucepan, stirring frequently.</li>\n<li>2</li>\n<li>Stir Bisquick mix and 1/3 cup milk until soft dough forms. Drop dough by 8 spoonfuls onto chicken mixture (do not drop directly into liquid). Sprinkle with paprika.</li>\n<li>3</li>\n<li>Cook uncovered over low heat 10 minutes. Cover and cook 10 minutes longer.</li>\n</ol>\n</div>
115813	Braised Chicken with Shallots, Garlic, and Balsamic Vinegar	\N	\N	\N	https://spoonacular.com/recipeImages/braised-chicken-with-shallots-garlic-and-balsamic-vinegar-2-115813.png	http://www.epicurious.com/recipes/food/views/Braised-Chicken-with-Shallots-Garlic-and-Balsamic-Vinegar-105589
107667	Chicken And Pepper Pasta	\N	\N	\N	https://spoonacular.com/recipeImages/chicken-and-pepper-pasta-2-107667.jpg	http://www.food.com/recipe/chicken-and-pepper-pasta-12548
484691	Crock-Pot Easy Chicken With Mushrooms and Peas	\N	\N	\N	https://spoonacular.com/recipeImages/Crock-Pot-Easy-Chicken-With-Mushrooms-and-Peas-484691.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse off chicken and pat dry.</li>\n<li>Place in bottom of your crock-pot, breast side up.</li>\n<li>Pour in broth.</li>\n<li>Add mushrooms, pepper and garlic powder.Cover and cook on low for 8-10 hours.</li>\n<li>Add frozen peas in last hour of cooking.Push the peas down into the liquid around the chicken.Carefully remove chicken from the crock when done.Spoon out vegetables and serve with broth.NOTE: To make part two of this meal, Crock-Pot Italian Chicken Noodle Casserole, keep one whole breast aside (more if desired).</li>\n</ol>\n</div>
116208	Oven Roasted Chicken With Lemon, Garlic and Rosemary	\N	\N	\N	https://spoonacular.com/recipeImages/oven-roasted-chicken-with-lemon-garlic-and-rosemary-2-116208.jpg	http://www.food.com/recipe/oven-roasted-chicken-with-lemon-garlic-and-rosemary-168124
108340	Colombian Chicken Stew with Potatoes, Tomato, and Onion	\N	\N	\N	https://spoonacular.com/recipeImages/colombian_chicken_stew_with_potatoes_tomato_and_onion-108340.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Combine potatoes, onion, tomato, chicken pieces, bay leaves, and a large pinch of salt in a pressure cooker. Toss with hands to combine. Seal lid and cook under high pressure for 25 minutes. Release pressure, remove lid, season to taste, and serve.</li>\n</ol>\n</div>
517989	Butter Roasted Chicken with Orange and Rosemary	\N	\N	\N	https://spoonacular.com/recipeImages/Butter-Roasted-Chicken-with-Orange-and-Rosemary-517989.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Pre-heat the oven to  Make sure to remove any little pouches of weirdness that may be lurking inside the bird. Pat it dry with paper towels as well as you can. Trim the tips off the wings. Work your fingers under the skin of the bird, lifting it away from the meat as much as you can being careful not to tear the skin if you can help it.Work the orange zest into the butter until it’s evenly combined and then massage the butter into the chicken, under the skin.Once you’ve rubbed/stuffed all the orange butter into the breasts, legs, thighs, etc, you’ll have orange butter all over your hands. Rub the outside of the skin on all sides.Drop the quartered orange inside the chicken.Situate the chicken in a roasting pan. I like to do mine breast side down (for me it keeps the white meat moister). Sprinkle half of the rosemary INSIDE the cavity with the orange slices and the rest across the top. Sprinkle the top with the kosher salt & coarse ground black pepper.Roast the chicken for about 20 minutes per pound and then add another 20 minutes onto that to account for the 375 oven temp.</li>\n<li>Let it rest for a few minutes before carving.</li>\n</ol>\n</div>
526278	Steamed Chicken with Sand Ginger Powder	\N	\N	\N	https://spoonacular.com/recipeImages/Steamed-Chicken-with-Sand-Ginger-Powder-526278.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse chicken and wipe dry with paper towels. Season with salt, pepper and wine on skin and inside. Leave it for a while, then rub sand ginger powder evenly on chicken on all sides.</li>\n</ol>\n</div>
526548	Chicken and Rice Casserole	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-Rice-Casserole-526548.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350F.</li>\n<li>Mix all the ingredients together in a 9 x 13 casserole dish placing the chicken on top to sink into the liquid.</li>\n<li>Bake covered with aluminum foil until chicken is done and the rice is tender. About 1½ to 2 hours. (Optional) Just before the casserole is finished cooking remove the aluminum foil; move the chicken pieces to the top, and brown them a little bit.</li>\n<li>Let the casserole rest for about 15 minutes before serving.</li>\n</ol>\n</div>
477720	Roast Chicken with Lemon and Rosemary	\N	\N	\N	https://spoonacular.com/recipeImages/Roast-Chicken-with-Lemon-and-Rosemary-477720.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 425 degrees with the skillet inside the oven. When the skillet and oven have preheated, remove the skillet from the oven and place the chicken inside of the skillet.</li>\n<li>Place lemon quarters, rosemary sprigs, and garlic in the cavity of the chicken. Tie legs using kitchen twin if you so choose.Coat the chicken well with olive oil or softened butter and then sprinkle with salt and pepper.Roast chicken for 15-20 minutes per pound or until an internal probe registers 165 degrees when inserted into the breast of the chicken.</li>\n<li>Remove from the oven and allow to rest for about 5-10 minutes to allow the juices to return to the meat.Use pan juices to baste the chicken, if desired.</li>\n<li>Garnish with lemon quarters and rosemary sprigs, optional.</li>\n</ol>\n</div>
395808	Slow-Cooked Asian Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Slow-Cooked-Asian-Chicken-395808.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large skillet over medium heat, brown the chicken in oil on all sides. </li>\n<li>Transfer to a 5-qt. slow cooker. </li>\n<li>Combine the soy sauce, brown sugar, water, garlic and ginger; pour over chicken.</li>\n<li>Cover and cook on low for 5-6 hours or until chicken juices run clear. </li>\n<li>Remove chicken to a serving platter sprinkle with almonds.</li>\n</ol>\n</div>
84694	Tomato-and-Garlic-Stuffed Chicken Cutlets	\N	\N	\N	https://spoonacular.com/recipeImages/tomato-and-garlic-stuffed-chicken-cutlets-2-84694.png	http://www.epicurious.com/recipes/food/views/Tomato-and-Garlic-Stuffed-Chicken-Cutlets-239250
510892	Creamy Chicken Parmesan Pasta	\N	\N	\N	https://spoonacular.com/recipeImages/Creamy-Chicken-Parmesan-Pasta-510892.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook pasta according to directions.Meanwhile in a Skillet add chicken broth and chicken. Cook until chicken is no longer pink. Stir in Progresso Recipe Starter in Creamy Parmesan. Cook and stir until thick and bubbly. Stir in mozzarella cheese.Evenly divide pasta between four plates and evenly divide pasta sauce over the top of the spaghetti. </li>\n<li>Garnish with shredded Parmesan cheese and fresh basil.</li>\n</ol>\n</div>
478222	Tinolang manok (ginger-flavored chicken soup with green papaya and chili leaves)	\N	\N	\N	https://spoonacular.com/recipeImages/Tinolang-manok-(ginger-flavored-chicken-soup-with-green-papaya-and-chili-leaves)-478222.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the chicken into 12 to 16 pieces.Crush, peel and mince the garlic. Peel and finely slice the onion and ginger.</li>\n<li>Heat the cooking oil in a pot. </li>\n<li>Saute the garlic and ginger until they start to brown. </li>\n<li>Add the onion and cook for a few minutes or until the onion starts to turn soft. </li>\n<li>Add the chicken pieces, excluding the liver, and cook in the hot oil until they change color. </li>\n<li>Pour in enough water to cover. Season with patis. Bring to the boil, lower the heat, cover and simmer for about 20 minutes.Meanwhile, prepare the green papaya and chili leaves.</li>\n<li>Cut the green papayas in half lengthwise and scoop out the seeds with a spoon. </li>\n<li>Cut off the skin, discard and cut the pale green flesh into wedges.Pick the chili leaves and discard the stalks.When the chicken has simmered for about 20 minutes, add the green papaya, bring to boil once more, then lower the heat, cover and simmer for 10 minutes. </li>\n<li>Add the chicken liver and continue cooking for another 10 minutes until both the papaya and the chicken liver are done. Do not overcook the papaya. Pierce with a fork after 15 minutes of simmering and, if the fork goes through, it’s done. Season with more patis if necessary.Turn off the heat. Drop the chili leaves, cover and leave for about five minutes. Don’t boil the chili leaves because they will turn bitter.While waiting for the chili leaves to wilt, make the sauce.Scoop out the liver from the pot, place in a saucer with a few tablespoonfuls of patis.Mash the liver with the back of a fork and mix into the patis. </li>\n<li>Serve on the side as a dipping sauce for the chicken tinola.</li>\n</ol>\n</div>
167036	Grilled Herb Chicken on a Can	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-Herb-Chicken-on-a-Can-167036.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>If using charcoal grill, place drip pan directly under grilling area, and arrange coals around edge of firebox. </li>\n<li>Heat coals or gas grill for indirect heat. In small bowl, mix paprika, salt, garlic powder, onion powder and pepper.</li>\n<li>2</li>\n<li>Fold wings of chicken across back with tips touching. Sprinkle paprika mixture inside cavity and over outside of chicken; rub with fingers.</li>\n<li>3</li>\n\n<li>Pour 1/2 cup of beer from can. Hold chicken upright, with opening of body cavity down; insert beer can into cavity. Insert barbecue meat thermometer so tip is in thickest part of inside thigh muscle and does not touch bone.</li>\n<li>4</li>\n<li>Cover and grill chicken upright over drip pan or over unheated side of gas grill over medium heat 1 hour 15 minutes to 1 hour 30 minutes or until thermometer reads 180°F and juice is no longer pink when center of thigh is cut.</li>\n<li>5</li>\n<li>Using tongs, carefully lift chicken and place in 13x9-inch pan, holding large metal spatula under beer can for support. </li>\n<li>Let stand 15 minutes before carving. </li>\n<li>Remove beer can; discard.</li>\n</ol>\n</div>
136838	Roasted Chicken With Rosemary, Lemon and Garlic	\N	\N	\N	https://spoonacular.com/recipeImages/roasted-chicken-with-rosemary-lemon-and-garlic-2-136838.jpg	http://italian.food.com/recipe/roasted-chicken-with-rosemary-lemon-and-garlic-172790
120580	Roasted Chicken Oreganato	\N	\N	\N	https://spoonacular.com/recipeImages/roasted-chicken-oreganato-2-120580.png	http://www.marthastewart.com/318708/roasted-chicken-oreganato
95138	Kale Carrot and Apple Calcium Booster Juice for Juicer	\N	\N	\N	https://spoonacular.com/recipeImages/kale-carrot-and-apple-calcium-booster-juice-for-juicer-2-95138.jpg	http://www.food.com/recipe/kale-carrot-and-apple-calcium-booster-juice-for-juicer-459269
304127	BBQ Kale Chips	\N	\N	\N	https://spoonacular.com/recipeImages/BBQ-Kale-Chips-304127.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven 275 degrees F. Line a baking sheet with parchment paper.</li>\n<li>Remove the thick stem from the kale and discard. Tear the kale leaves into bite-size pieces. Lay the kale onto the prepared baking sheet and spray evenly with cooking spray. </li>\n<li>Bake until crispy and browned on the edges, tossing the kale halfway through, 18 to 20 minutes. Sprinkle the kale with BBQ Seasoning and serve.</li>\n</ol>\n<div class="subRecipeInstructionTitle">BBQ Seasoning:</div>\n<ol>\n\n<li>Mix the paprika, ancho chile, sugar, garlic powder, salt and dry mustard in a small bowl.</li>\n</ol>\n</div>
619542	Cheesy Kale Chips	\N	\N	\N	https://spoonacular.com/recipeImages/Cheesy-Kale-Chips-619542.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Alternatively (if you dont have a dehydrator), spread kale pieces on parchment paper on baking trays, and bake at 200 degrees until crispy, about 45 minutes (but again, all that matters is that they MUST be crunchy).Once youve tried the basic recipe, feel free to spice things up  literally! Sprinkle some cayenne into the coating mixture for a nice kick, or add some garlic or onion powder, cumin, or dill!About these ads</li>\n</ol>\n</div>
628033	Andouille Sausage, Kale, and Root Vegetable Bake	\N	\N	\N	https://spoonacular.com/recipeImages/Andouille-Sausage--Kale--and-Root-Vegetable-Bake-628033.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 400 degrees.</li>\n<li>Add the vegetables to a baking dish and nestle the sausages on top. </li>\n<li>Add the broth to the baking dish.</li>\n<li>Bake for 30-35 minutes until vegetables are tender.</li>\n</ol>\n</div>
619940	Sautéed Fava Bean Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Sauted-Fava-Bean-Salad-619940.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>If using dried fava beans, soak them in a bowl with water overnight  at least 12 hours. Shell the beans and set them aside.Prepare other ingredients. Thaw the peas, chop the kale into bite-sized pieces, and thinly slice the shallot.</li>\n<li>Heat 2 tablespoons of olive oil in a skillet on medium heat.</li>\n<li>Add shallots and saut for 3-5 minutes until they become translucent and start to soften.</li>\n<li>Add kale and white wine vinegar and saut for 5 minutes. Kale will soften and become wilted.</li>\n<li>Add peas and toss with the sauted mixture until warmed.</li>\n<li>Serve and enjoy.</li>\n</ol>\n</div>
290013	Grilled Chicken with Dijon and Meyer Lemon	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-Chicken-with-Dijon-and-Meyer-Lemon-290013.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine the lemon juice, zest, mustard, rosemary and crushed red pepper in a small bowl. </li>\n<li>Add 1 to 2 tablespoons of olive oil to the mustard mixture to loosen it.  Paint this mixture generously all over the chicken and let sit for up to 2 hours at room temperature or overnight in the refrigerator.  If you have any of the mustard mixture left over, save it for repainting while the chicken is cooking.Preheat the grill to medium (you want the chicken to cook on the grill as long as possible without burning to develop lovely crispy, tasty, tangy skin). </li>\n<li>Place the chicken on the grill skin side down and cook for 5 to 6 minutes. If the chicken flares up, move it to a cooler part of the grill; you don't want sooty film on the chicken (it won't taste good).Once the chicken has started to brown and crisp, it's a good idea to close the grill to allow the heat to cook the chicken from all directions. You want to cook the chicken skin side down for a total of 10 to 12 minutes, then turn it over and cook it for another 10 to 12 minutes. If you're using a grill pan, you can transfer the chicken to a 375 degree F oven when it's ready to flip so it can finish cooking. If there is leftover mustard mixture, use it to paint the skin of the chicken on the second side. The chicken is done when an instant-read thermometer registers 165 degrees F.When the chicken is nearly done, place the lemon halves on the grill cut side down and leave them alone until brown and caramelized, 5 to 6 minutes. (These will smell great while they're grilling!)</li>\n<li>Remove the chicken from the heat and serve with the grilled lemon for extra lemony goodness.Cook's Note: During the cooking time it is a great idea to close the grill to allow the heat to cook from all directions. If grilling indoors, the chicken can be transferred to a preheated 375 degree F oven to finish cooking once the grill marks have been established.</li>\n</ol>\n</div>
511195	Balsamic Glazed Chicken and Roasted Potatoes	\N	\N	\N	https://spoonacular.com/recipeImages/Balsamic-Glazed-Chicken-and-Roasted-Potatoes-511195.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a ziplock bag add chicken and potatoes; set aside.In a small bowl, add olive oil, balsamic vinegar, dijon mustard and Italian seasoning. </li>\n<li>Whisk together until combined. </li>\n<li>Add to chicken and potatoes and marinate for at least 30 minutes or up to 4 hours, depending on how strong of a balsamic taste you like. I marinated for one hour.Preheat oven to 375 degrees</li>\n<li>Spray a 9 x 13 baking dish with cooking spray and add chicken and potato mixture, along with marinade.</li>\n<li>Spread the potatoes along sides of the chicken.Cover and bake in the oven for 15 minutes. </li>\n<li>Mix the potatoes, uncover and bake for 20- 25 minutes longer or until chicken is no longer pink and potatoes are fork tender.</li>\n<li>Serve immediately</li>\n</ol>\n</div>
478432	How to cook: Sinampalukang manok (sour soup with chicken and tamarind leaves)	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-cook--Sinampalukang-manok-(sour-soup-with-chicken-and-tamarind-leaves)-478432.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the vegetable oil. </li>\n<li>Saute the onion, garlic and tomatoes.</li>\n<li>Pour in four to five cups of water and add the tamarind leaves. Bring to the boil (watch the tamarind leaves change color), add the chicken, bring to the boil once more, season with patis (fish sauce) and simmer for about 40 minutes.Taste the broth. If it isn’t sour enough for you, add some tamarind juice or tamarind paste. When the broth tastes perfect, simmer for five minutes longer then turn off the heat.Ladle the chicken and soup into individual bowls, making sure that each bowl gets a nice piece of chicken and a generous amount of tamarind leaves.</li>\n<li>Serve hot.</li>\n</ol>\n</div>
445704	Chicken and Potato Bake	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-Potato-Bake-445704.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place chicken in a greased 13-in. x 9-in. baking dish. Arrange potatoes around chicken. </li>\n<li>Drizzle with dressing; sprinkle with Italian seasoning and Parmesan cheese.</li>\n<li>Cover and bake at 400° for 20 minutes. Uncover; bake 20-30 minutes longer or until potatoes are tender and chicken juices run clear.</li>\n</ol>\n</div>
519514	Cilantro Mesquite BBQ Chicken Taquitos	\N	\N	\N	https://spoonacular.com/recipeImages/Cilantro-Mesquite-BBQ-Chicken-Taquitos-519514.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 425 degrees. </li>\n<li>Mix the chicken, BBQ sauce, cheese, seasoned salt and cilantro in a bowl. </li>\n<li>Place tortillas on plate, cover with plastic wrap and warm in microwave 30 seconds so they are easy to roll.</li>\n<li>Spread 1/10 of chicken mixture in center of tortilla. </li>\n<li>Roll up and place seam side down in 9x13 in. glass baking dish. Repeat until all the tortillas are filled. Spray the top of the tortillas with non-stick baking spray. Sprinkle sea salt over the top of the tortillas.</li>\n<li>Bake 20-25 minutes or until edges of shells are golden brown.</li>\n</ol>\n</div>
273991	Hot Italian Chicken Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/Hot-Italian-Chicken-Sandwiches-273991.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>PREHEAT oven to 400Â°F.  Coat chicken in coating mix as directed on package.  </li>\n<li>Place on foil-covered baking sheet. BAKE 20 min. or until cooked through.  Top with sauce and cheese.  </li>\n<li>Bake an additional 5 min. or until cheese melts. FILL buns with chicken.</li>\n</ol>\n</div>
257899	Rosemary Garlic Roast Chicken With Pecan Cranberry Chutney	\N	\N	\N	https://spoonacular.com/recipeImages/Rosemary-Garlic-Roast-Chicken-With-Pecan-Cranberry-Chutney-257899.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 375°. Rinse chickens with cold water; pat dry with paper towels. </li>\n<li>Place chickens, breast sides up, on a rack in a large shallow foil-lined roasting pan or broiler pan. Starting at neck cavity of chicken, loosen skin from breast and drumsticks by inserting fingers between skin and meat and pushing gently. </li>\n<li>Combine the mustard, garlic, and rosemary; rub evenly under loosened skin, and rub over breast and drumsticks of each chicken. </li>\n<li>Bake at 375° for 1 hour and 20 minutes or until internal temperature of thigh is 175°. </li>\n<li>Transfer chickens to a carving board; let stand 5-10 minutes (temperature will rise to 180°). </li>\n<li>Combine chutney and pecans in a small bowl. Carve the chickens; transfer to serving plates. </li>\n<li>Serve with chutney mixture.</li>\n</ol>\n</div>
20418	Rainbow Chard And Ricotta Stuffed Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/rainbow_chard_and_ricotta_stuffed_chicken-20418.jpg	http://cookalmostanything.blogspot.com/2007/07/more-rainbow-chard.html
159714	Easy Chicken and Dumplings	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Chicken-and-Dumplings-159714.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In 3-quart saucepan, heat 1 1/2 cups milk, the frozen peas and carrots, chicken and soup to boiling.</li>\n<li>2</li>\n<li>In small bowl, stir together Bisquick® mix and 1/3 cup milk until soft dough forms. Drop dough by 8 spoonfuls onto chicken mixture (do not drop directly into liquid). Sprinkle with paprika.</li>\n<li>3</li>\n<li>Cook uncovered over low heat 10 minutes. Cover and cook 10 minutes longer.</li>\n</ol>\n</div>
489236	Sweet BBQ Chicken Kabobs and Our Menu Plan	\N	\N	\N	https://spoonacular.com/recipeImages/Sweet-BBQ-Chicken-Kabobs-and-Our-Menu-Plan-489236.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Soak wooden skewers in water about 15-20 minutes. Thread chicken, peppers and pineapple onto skewers. </li>\n<li>Mix barbecue sauce and orange juice concentrate in a small bowl and set aside. </li>\n<li>Heat the grill to medium-high. </li>\n<li>Brush half of the sauce onto the skewers. Grill 8-10 minutes or until chicken is done, turning occasionally. </li>\n<li>Brush on remainder of sauce while skewers are cooking.</li>\n</ol>\n</div>
643114	Flour And Water Crust Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Flour-And-Water-Crust-Chicken-643114.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>MAKING THE CRUST:</li>\n<li>Mix all-purpose flour with water a bit by a bit. You may not need the whole 2 Cups. If you get a stretchy and sticky dough, you can stop adding the water already. I used about 1 1/2 Cups of water. Cover the dough and set it aside</li>\n<li>Prepare the marinade for chicken by bashing the lemon slices, sage, thyme and garlic with mortal and pestle</li>\n<li>Rub the chicken with the marinade and tuck in the lemon slices that you set aside earlier</li>\n<li>Divide the dough into 4 pieces and roll each out to 1/4" thick</li>\n\n<li>Place the chicken in the middle of the dough and wrap the dough around the chicken. This will create an air-tight compartment for your chicken. Leave it for 5 minutes</li>\n<li>Preheat the oven to 425 F and bake for one hour. The crust will be brown and charred a bit, but that's okay, we are not going to eat the crust. The crust is there to maintain the juiciness and tenderness of the chicken</li>\n\n<li>Let them cool for about 15 minutes before cracking them open</li>\n\n<li>Serve with potatoes and salad and watch your guests or loved ones be impressed</li>\n</ol>\n</div>
200784	Sunday Supper: Beer Can Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Sunday-Supper--Beer-Can-Chicken-200784.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Preheat oven to 425 [°].  </li>\n<li>Cut each potato into pieces 6 pieces and place in 9X13 inch baking dish.  </li>\n<li>Add 6 cloves garlic and sprigs of thyme, drizzle with olive oil and toss with salt and pepper.</li>\n<li>2</li>\n<li>Rinse and dry chicken.  Open beer and drink half, add extra garlic clove and a few sprigs of thyme to beer.  Push potatoes to each end of baking dish and place open beer in center.  Chop 1 teaspoon worth of thyme leaves.  </li>\n<li>Drizzle chicken with olive oil and sprinkle with chopped thyme, salt and pepper.  Carefully ease beer can into chicken cavity and sit in center of baking dish surrounded by potatoes.</li>\n<li>3</li>\n<li>Roast chicken until internal temperature reaches 160[°], about 90 minutes.  Allow chicken to rest 10 minutes before carving and serve with potatoes and more beer.</li>\n</ol>\n</div>
274643	Oven-Fried Crunchy Parmesan Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Oven-Fried-Crunchy-Parmesan-Chicken-274643.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>PREHEAT oven to 375Â°F.  </li>\n<li>Mix flour and seasonings in shallow dish.  </li>\n<li>Add chicken; toss to coat.  Beat egg and water in separate shallow dish.  </li>\n<li>Mix cheese and corn flakes in third shallow dish. DIP chicken in egg mixture, then in cheese mixture, turning over to evenly coat both sides.  </li>\n<li>Place in 13x9-inch baking dish; drizzle with butter. BAKE 1 hour or until chicken is cooked through (180Â°F).</li>\n</ol>\n</div>
28891	Chicken Halves with Artichokes and Garlic	\N	\N	\N	https://spoonacular.com/recipeImages/chicken_halves_with_artichokes_and_garlic-28891.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 375°. </li>\n<li>Heat oil in a large dutch oven over medium-high heat. Sprinkle chicken all over with salt and lay in hot oil, skin side down. Cook until browned, about 5 minutes. Turn chicken over and add 1 cup water, the garlic, and artichokes. Roast chicken in oven, uncovered, until cooked through, about 1 hour. </li>\n<li>Add olives and parsley.Prep hearts: Snap off thick green outer leaves down to yellowish core. Halve artichokes crosswise; discard thorny tips. Trim stem to about 1/2 in. and peel tough outer skin from remaining stem. Halve artichoke lengthwise; scoop out and discard fuzzy, red-tipped choke. Put hearts in cold water with a little lemon juice and set aside until you're ready to cook.Note: Nutritional analysis is per serving.</li>\n</ol>\n</div>
471483	BBQ Ranch Chicken Salad	\N	\N	\N	https://spoonacular.com/recipeImages/BBQ-Ranch-Chicken-Salad-471483.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine chicken, Marzetti Classic Ranch Dressing, barbecue sauce, celery and carrots in medium bowl. Season, if desired, with salt and black pepper. </li>\n<li>Serve on your favorite rolls.</li>\n</ol>\n</div>
45703	Roasted Chicken, Potatoes, And Fennel Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/roasted_chicken_potatoes_and_fennel_recipe-45703.jpg	http://www.realsimple.com/food-recipes/browse-all-recipes/roasted-chicken-potatoes-fennel-00000000054249/index.html
299722	Indonesian Ginger Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Indonesian-Ginger-Chicken-299722.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook the honey, soy sauce, garlic, and ginger root in a small saucepan over low heat until the honey is melted. Arrange the chicken in 1 layer in a shallow baking pan, skin side down, and pour on the sauce. Cover the pan tightly with aluminum foil. Marinate overnight in the refrigerator.Preheat the oven to 350 degrees F.</li>\n<li>Place the baking pan in the oven and bake for 30 minutes. Uncover the pan, turn the chicken skin side up, and raise the temperature to 375 degrees F. Continue baking for 30 minutes or until the juices run clear when you cut between a leg and thigh and the sauce is a rich, dark brown.</li>\n</ol>\n</div>
496462	Smoked Chicken and Apple Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Smoked-Chicken-and-Apple-Salad-496462.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients except romaine in in a large bowl.  Toss gently to dress.</li>\n<li>Place 2 or 3 romaine tips on a serving plate. Mound 1/4 of the salad on the lettuce, arrange a few apple slices nicely on top.</li>\n<li>Serve immediately.What I would have done differently had I thought of it at the time:In the photo shown above, I use a golden delicious apple, not a Granny Smith as directed in the recipe.  The golden delicious, while good, simply wasn’t tart enough to compliment as well as it should.Also, the next time I make this (and there will be many more next times) I’m going to add some walnuts for a bit of added crunch.  I’ll also use a bit less chicken so that the apples really shine.</li>\n</ol>\n</div>
611209	Skillet-Roasted Whole Chicken with Lemon and Potatoes	\N	\N	\N	https://spoonacular.com/recipeImages/Skillet-Roasted-Whole-Chicken-with-Lemon-and-Potatoes-611209.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat oven to 425F.</li>\n<li>2</li>\n\n<li>Cut potatoes into halves, or into quarters if larger; place cut side down in 10-inch cast iron skillet. Sprinkle potatoes with dash salt. Layer about 5 lemon slices over top.</li>\n<li>3</li>\n<li>Pat chicken dry with paper towels; remove any giblets. Stuff cavity of chicken with any remaining lemon slices. In small bowl, stir together sage, garlic, 1 teaspoon salt, the pepper and olive oil. Rub sage-garlic mixture beneath breast skin of chicken and all over outside of chicken skin. </li>\n<li>Place chicken on bed of potatoes and lemon.</li>\n<li>4</li>\n<li>Roast about 1 hour 30 minutes or until instant-read thermometer inserted into thickest part of thigh reads 165F. </li>\n<li>Let chicken rest about 15 minutes before carving.</li>\n</ol>\n</div>
10049	Shanghai Stir Fry Pork With Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/shanghai_stir_fry_pork_with_tofu-10049.jpg	http://refinedchef.com/recipes_details.php?cat_id=53&rec_id=1317
15011	Spaghetti Squash With Kale And Chickpeas	\N	\N	\N	https://spoonacular.com/recipeImages/spaghetti_squash_with_kale_and_chickpeas-15011.jpg	http://pamelasalzman.com/spaghetti-squash-with-kale-and-chickpeas/
521148	Chicken and asparagus eggdrop soup	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-asparagus-eggdrop-soup-521148.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Boil the chicken with the half onion and garlic cloves in about eight cups of water for about 30 minutes.Scoop out the chicken, cool, pick the meat and discard the bones.Strain the broth to remove any impurities (you can leave the garlic and onion though).Beat the egg.Reheat the broth and bring to the boil. </li>\n<li>Add the chicken meat. Season with patis. </li>\n<li>Add the asparagus. Cook for a minute. Turn off the heat. </li>\n<li>Pour the beaten egg in a thin stream. Do not stir for about ten seconds to allow the egg to set partially. Then, stir. Season with freshly ground black pepper. </li>\n<li>Serve hot.</li>\n</ol>\n</div>
619512	Chicken Pita Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-Pita-Sandwich-619512.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine spinach, chicken, bell pepper, and vinaigrette in a bowl; toss gently. </li>\n<li>Serve in pita halves.Watch the video: Fat-Burning Recipe: Chicken and Veggie Pita</li>\n</ol>\n</div>
5116	Pineapple-mango Grilled Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/pineapple-mango_grilled_salmon-5116.jpg	http://whatscookingwithkids.com/2010/07/05/whats-cooking-with-your-kids-food-for-my-family/
521279	Sinampalukang manok (sour soup with chicken and tamarind leaves)	\N	\N	\N	https://spoonacular.com/recipeImages/Sinampalukang-manok-(sour-soup-with-chicken-and-tamarind-leaves)-521279.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the vegetable oil. </li>\n<li>Saute the onion, garlic and tomatoes.</li>\n<li>Pour in four to five cups of water and add the tamarind leaves. Bring to the boil (watch the tamarind leaves change color), add the chicken, bring to the boil once more, season with patis (fish sauce) and simmer for about 40 minutes.Taste the broth. If it isn’t sour enough for you, add some tamarind juice or tamarind paste. When the broth tastes perfect, simmer for five minutes longer then turn off the heat.Ladle the chicken and soup into individual bowls, making sure that each bowl gets a nice piece of chicken and a generous amount of tamarind leaves.</li>\n<li>Serve hot.</li>\n</ol>\n</div>
537708	Queso Fresco & Chipotle Chicken and Veggie Wraps	\N	\N	\N	https://spoonacular.com/recipeImages/Queso-Fresco---Chipotle-Chicken-and-Veggie-Wraps-537708.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>On one side of the tortilla wrap, spread both of the wedges of The Laughing Cow Light Queso Fresco & Chipotle. Arrange your preferred filling ingredients, making sure not to fill the tortilla too full. Starting at one end, tightly roll the tortilla up like a pinwheel. Slice into 2 - 3 inch sections. Hold together with a toothpick if needed. </li>\n<li>Serve with salsa.</li>\n</ol>\n</div>
275627	Jan's Roasted Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Jans-Roasted-Chicken-275627.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rub chicken and cavities with 2 tablespoons olive oil, garlic cloves, salt, and pepper.Tuck chicken wings under; tie legs together with string, if desired. </li>\n<li>Pour remaining 1 tablespoon oil into a large cast-iron skillet; place chicken, breast side up, in skillet.</li>\n<li>Place 1 rosemary sprig and 2 lemon quarters into neck cavity of chicken; repeat in lower cavity. </li>\n<li>Place remaining rosemary sprig underneath skin.</li>\n<li>Bake at 450° for 30 minutes; reduce heat to 350°, and bake 1 hour. </li>\n<li>Serve with Jan's Roasted Potatoes.</li>\n</ol>\n</div>
619703	Crumbed and deep-fried Cauliflower	\N	\N	\N	https://spoonacular.com/recipeImages/Crumbed-and-deep-fried-Cauliflower-619703.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oil in a medium saucepan.</li>\n<li>Place the flour, eggs and crumb coating in three separate bowls.Coat the cauliflower florets first in the flour, then in the egg and finally in the crumb coating.When the oil is hot, fry the cauliflower until golden brown and crisp.</li>\n<li>Remove from the oil and allow to drain on kitchen paper.To make the caper mayonnaise, combine the mayonnaise and the capers.</li>\n<li>Serve the crispy cauliflower hot, with the caper mayonnaise.</li>\n</ol>\n</div>
365791	White Pizza with Chicken, Pesto and Pine Nuts	\N	\N	\N	https://spoonacular.com/recipeImages/White-Pizza-with-Chicken--Pesto-and-Pine-Nuts-365791.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 450 degrees F.</li>\n<li>Place pizza crust on a large baking sheet and top with pesto, chicken, cheese and pine nuts. </li>\n<li>Bake 8 to 10 minutes, until cheese melts and crust is golden brown.</li>\n</ol>\n</div>
292273	Braised Chicken with Onions, Garlic, and Balsamic Vinegar	\N	\N	\N	https://spoonacular.com/recipeImages/Braised-Chicken-with-Onions--Garlic--and-Balsamic-Vinegar-292273.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook bacon in a deep, 12-inch, heavy skillet over moderately low heat, turning twice, until crisp, about 8 minutes. </li>\n<li>Transfer with a slotted spoon to paper towels to drain and reserve bacon fat in skillet.While bacon is cooking, pat chicken dry and season with salt and pepper. Brown in bacon fat, beginning with skin side down, in 2 batches, over moderately high heat, turning, about 8 minutes. </li>\n<li>Transfer browned chicken with tongs to a plate, and pour off all but 2 tablespoons fat from skillet.Lower heat, add onions to skillet and cook, covered, stirring occasionally, until soft and pale golden, about 10 minutes.</li>\n<li>Remove lid and cook onions, stirring, until deep golden, about 10 minutes more. </li>\n<li>Add garlic and 1 cup water to skillet and boil, stirring, 1 minute.Return chicken to skillet, turning pieces to coat, then arrange them skin sides up and gently simmer, covered, until chicken is cooked through and garlic is tender, about 30 minutes.</li>\n<li>Transfer chicken with tongs to a serving dish. </li>\n<li>Add vinegar to sauce and boil, uncovered, mashing garlic with back of a spoon or a potato masher, until slightly thickened. Season sauce with salt and pepper and pour over chicken, then sprinkle with bacon.</li>\n</ol>\n</div>
382457	Jamaican Jerk Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Jamaican-Jerk-Chicken-382457.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Smash the allspice as fine as possible using a mortar and pestle. Put in a food processor and add the seasoning salt, peppers, green onions, thyme and 1/2 cup water. Blend to the consistency of lumpy oatmeal and pour into a bowl.Rub the chicken with the jerk seasoning and stuff the jerk seasoning between the skin and the meat. </li>\n<li>Place the chicken pieces into a storage pan and let marinade overnight (at least 12 hours).</li>\n<li>Remove the excess seasoning from the chicken. </li>\n<li>Heat the grill to high heat (about 350 degrees F) and then place the chicken meat-side down first as to not let the chicken burn too quickly. Flip the chicken every 5 to 7 minutes until the skin has a nice brown color with grill marks, and then every 7 to 10 minutes on lower heat until cooked, around 40 minutes total or until the internal temperature of the chicken reaches 165 degrees F.Chop each quarter into 4 to 5 pieces to get the real Jamaican jerk experience.This recipe was provided by professional chefs and has been scaled down from a bulk recipe provided by a restaurant. The Food Network Kitchens chefs have not tested this recipe, in the proportions indicated, and therefore, we cannot make any representation as to the results.</li>\n</ol>\n</div>
530277	Chicken with Lemon, Oregano and Feta Cheese	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-with-Lemon--Oregano-and-Feta-Cheese-530277.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oven to 375 degrees. Coat the chicken with the oil; arrange the pieces, skin-side up, in a large roasting pan. Sprinkle the chicken with the oregano, lemon juice, salt and pepper, Top each piece of chicken with a piece of butter.Cook the chicken until the breasts are just done, about 30 minutes. </li>\n<li>Remove the breasts and continue to cook the legs until done, about 5 minutes longer. </li>\n<li>Remove the roasting pan from the oven; return the breasts to the pan. Top the chicken pieces with the feta cheese. Press any cheese that rolls off into the pan back onto the chicken. Baste the chicken with the pan juices.</li>\n<li>Heat the broiler. Broil chicken until the cheese is melted and golden brown, about 2 minutes. </li>\n<li>Serve with the pan juices.</li>\n</ol>\n</div>
38830	Chicken With Onions And Garlic	\N	\N	\N	https://spoonacular.com/recipeImages/chicken-with-onions-and-garlic-2-38830.jpg	http://www.marthastewart.com/314948/chicken-with-onions-and-garlic
38840	Paprika Chickens With Garlic And Potatoes	\N	\N	\N	https://spoonacular.com/recipeImages/paprika_chickens_with_garlic_and_potatoes-38840.jpg	http://college.biggirlssmallkitchen.com/2011/03/why-did-the-chicken-cross-the-kitchen%E2%80%A6and-now-what-do-i-do-with-it.html
137151	Weight Watchers Chicken and Cheese Casserole	\N	\N	\N	https://spoonacular.com/recipeImages/weight-watchers-chicken-and-cheese-casserole-2-137151.jpg	http://www.food.com/recipe/weight-watchers-chicken-and-cheese-casserole-158634
38847	Roast Chicken With Garlic And Thyme	\N	\N	\N	https://spoonacular.com/recipeImages/roast-chicken-with-garlic-and-thyme-2-38847.jpg	http://www.marthastewart.com/314123/roast-chicken-with-garlic-and-thyme
137203	My Orange Roast Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/my-orange-roast-chicken-2-137203.jpg	http://www.food.com/recipe/my-orange-roast-chicken-211526
481267	Pollo al vino bianco con funghi (Chicken Braised in White Wine with Mushrooms)	\N	\N	\N	https://spoonacular.com/recipeImages/Pollo-al-vino-bianco-con-funghi-(Chicken-Braised-in-White-Wine-with-Mushrooms)-481267.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large sauté pan or braiser large enough to hold your chicken pieces in a single layer, sauté the garlic and rosemary gently in the olive oil until the garlic is lightly browned. </li>\n<li>Remove both garlic and rosemary from the pan.Pat the chicken pieces dry with paper towels, dust them ever so lightly in flour and add them to the oil, raising the heat a bit. Brown the pieces on all sides, turning them from time to time for even cooking. Season generously with salt and pepper.</li>\n<li>Add a generous amount of white wine, enough to come up about 1 cm (1/4 inch) up the pan. Turn the chicken pieces in the wine for a minute or two so they are covered well, then lower the heat and cover. </li>\n<li>Let the chicken simmer gently until it is cooked through and tender. For a young chicken, this should take about 30 minutes. For older or larger chicken the cooking time may be upwards of 45 minutes to an hour.About halfway through the cooking time add your mushrooms. If you are using reconstituted dried mushrooms or very tender fresh ones, you can simply cut them up roughly and add them raw (see Notes). (If using dried mushrooms, add their water, too, as it has lots of flavor.) Then re-cover the pan and continue simmering until the chicken is done through.When the chicken is done, uncover and remove the chicken pieces to a warm serving platter. Check the consistency of the sauce. If it is a bit watery, raise the heat and let it reduce a bit. Taste and adjust for seasoning. Then nap your chicken with the mushrooms and sauce. Top with a bit of minced parsley, if you like, for color</li>\n\n<li>Serve immediately, while still hot, with some nice, crusty bread and a crisp white wine. (Giusti-Lanham and Dodi recommend a Durello or Pinot Grigio.)</li>\n</ol>\n</div>
137287	Parmesan Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/parmesan-chicken-2-137287.jpg	http://www.food.com/recipe/parmesan-chicken-264409
292972	Pan Roast Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Pan-Roast-Chicken-292972.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 400 degrees F.Season the chicken on both sides with the salt and white pepper. Set a 12-inch cast iron skillet over high heat and add the olive oil to the pan. Swirl the pan to evenly coat and lay the seasoned chicken halves, skin side down in the pan. Sear until golden, about 3 minutes and place the pan in the oven. Cook until the chicken is fully cooked through, about 17 to 18 minutes.While the chicken roasts, combine the butter, garlic and thyme in a small bowl and use a fork to combine. When the chicken is removed from the oven, turn over with a spatula and place on a platter. </li>\n<li>Spread the herbed butter over the skin of the chicken halves and serve immediately.</li>\n</ol>\n</div>
96394	Quick Roasted Chicken with Potatoes, Onions, and Watercress	\N	\N	\N	https://spoonacular.com/recipeImages/quick-roasted-chicken-with-potatoes-onions-and-watercress-2-96394.png	http://www.marthastewart.com/340387/quick-roasted-chicken-with-potatoes-onio
15030	Tofu Kale Stir-fry	\N	\N	\N	https://spoonacular.com/recipeImages/tofu_kale_stir-fry-15030.jpg	http://veganyumyum.com/2007/07/tofu-kale-stir-fry-and-green-bean-salad/
96955	Garlicky Kale and Spinach Dip	\N	\N	\N	https://spoonacular.com/recipeImages/garlicky_kale_and_spinach_dip_recipe-96955.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring a large pot of salted water to a boil. Prepare an ice water bath by filling a bowl halfway with ice and water; set aside.</li>\n<li>Add kale and spinach to the boiling water and cook until wilted, about 2 minutes. </li>\n<li>Remove from the boiling water and plunge into the ice bath. Once the greens are cool, remove them from the ice bath, shake off any excess water, and place in the bowl of a food processor.</li>\n<li>Add garlic, pine nuts, and vinegar and, while puréeing, slowly pour in the olive oil. Continue puréeing, stopping to scrape down the sides of the bowl with a rubber spatula as necessary, until all of the oil is incorporated and the mixture is smooth, about 4 minutes. Season with salt and serve.Beverage pairing: Pewsey Vale Eden Valley Riesling, Australia. Not particularly known for its white wines, Australia can surprise with the quality of its dry Rieslings, which tend to work wonderfully with sharply flavored, savory foods. This one, loaded with forward floral and citrus flavors, will provide a stimulating counterpart to the garlic pinprick and creamy greens of the dip.</li>\n</ol>\n</div>
608948	Roasted Garlic Kale Hummus	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Garlic-Kale-Hummus-608948.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 400 degrees F.Wrap the garlic cloves {with the skin on} in aluminum foil and place in the oven to roast for 20 minutes. Allow garlic to cool before peeling the skin off.</li>\n<li>Add all ingredients to a food processor and blend until smooth. </li>\n<li>Serve hummus with olive oil drizzled on top and with pita bread or fresh vegetables.</li>\n</ol>\n</div>
584906	Kale + Parsley Pesto	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-+-Parsley-Pesto-584906.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine the pistachios, garlic, lemon juice, and 1 teaspoon salt in a food processor. Pulse until the mixture is well mixed and looks a little like wet sand. </li>\n<li>Add the kale and parsley to the processor bowl and pulse until just finely chopped, about ten 1 second pulses. With the processor running, slowly stream the olive oil into the processor, followed by the water. Taste the pesto and season with salt and pepper, pulsing a couple of times to combine. Store in an airtight container for 1-2 weeks.</li>\n</ol>\n</div>
56655	Energy Shake	\N	\N	\N	https://spoonacular.com/recipeImages/energy-shake-2-56655.jpg	http://www.bonappetit.com/recipes/2011/01/energy_shake
506548	Slow Cooker Lemon, Garlic and Rosemary Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Slow-Cooker-Lemon--Garlic-and-Rosemary-Chicken-506548.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse chicken, then remove skin and pat dry.  Rub salt and pepper in and outside of chicken.  </li>\n<li>Place chicken in a 4-5 quart slow cooker. </li>\n<li>Place half of the peeled cloves into the cavity of the chicken.  </li>\n<li>Place half the lemon slices inside the chicken. </li>\n<li>Place the remaining garlic and lemon slices on top of the chicken. </li>\n<li>Place baby potatoes around the sides of the chicken. </li>\n<li>Place rosemary over top of chicken and potatoes. Cook on low for 4 to 5 hours. When finished cooking, remove lemon slices and rosemary, and discard.  </li>\n<li>Cut up chicken and serve.</li>\n</ol>\n</div>
580342	Easy Hand-Held Pot Pies	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Hand-Held-Pot-Pies-580342.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350º. Spray cookie sheet with cooking spray, set aside.Spray a skillet with cooking spray and cooked diced onion until soft. </li>\n<li>Add remaining ingredients and heat through.Open package of biscuits and flatten each circle out with your fingertips. </li>\n<li>Place chicken filling on one half of the circle and bring the other half over. Press edges with a fork to seal closed. Carefully place on the cookie sheet.Finish each mini pot pie and then bake for about 30-35 minutes or until the outside is golden and the middle is cooked. </li>\n<li>Serve immediately and enjoy!</li>\n</ol>\n</div>
170862	Chicken and Squash Quesadillas	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-Squash-Quesadillas-170862.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In medium bowl, mix cheese, chicken, 1/3 cup salsa and the squash purée.</li>\n<li>2</li>\n<li>Spray 1 side of 1 tortilla with cooking spray; place sprayed side down in 10-inch skillet. </li>\n<li>Spread with one-fourth of the chicken mixture. Top with another tortilla; spray top of tortilla with cooking spray.</li>\n<li>3</li>\n<li>Cook over medium heat about 2 minutes or until golden brown. Carefully turn quesadilla over; cook 1 to 2 minutes or until golden brown. Repeat with remaining tortillas and chicken mixture. To serve, cut quesadillas into wedges. </li>\n<li>Serve with sour cream and additional salsa.</li>\n</ol>\n</div>
220041	Lime & coriander chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Lime---coriander-chicken-220041.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>First, spatchcockthe chicken so thatit will sit flat on thebarbecue. All thismeans is usinga pair of kitchenscissors or a sharpkitchen knife to cutdown either side ofthe parson’s nose tocompletely removethe backbone.Then, place the chicken, breast side up, on achopping board and push down hard to flattenwith your hands. Use a sharp knife to make lotsof deep slashes in the chicken, about three ineach breast and two in each leg.In a mortar and pestle, crush the garlic andpeppercorns together to a grey, mushy paste.Stir the lime juice into the paste, then thechopped coriander. </li>\n<li>Put the chicken in a dishand massage the marinade into the chicken.Cover with cling film and refrigerate for atleast 2 hours, but preferably overnight.To cook the chicken, fire up the barbecue.When the flames die down and the coalsare hot and glowing, lay the chicken on thebarbecue, skin side up, and sprinkle with salt.You will be tempted to keep prodding it andlifting it up, but leave it alone. After 25 mins,the chicken will look like it’s cooked through,but flip it over and give the skin side 10 minsto brown. Lift the chicken onto a choppingboard and leave to rest for a few minutes.You can now carve conventionally but I liketo get a cleaver and chop it straight downinto thick slices. Pile it up on a platter and servescattered with fresh coriander and lime wedges.</li>\n</ol>\n</div>
187337	Chicken, Ham, and Tarragon Pie	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken--Ham--and-Tarragon-Pie-187337.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Roll out the pastry on a floured counter and, using your pie dish as a template, cut out a piece to generously fit the top. From the trimmings, cut a 3/4-inch wide strip (it can be in pieces) to fit around the rim of the dish. Dampen the edges and stick the strips in place around the rim.</li>\n\n<li>Mix the ham and tarragon into the chicken filling, then spoon this into the dish. Dampen the top of the pastry strip and place the pastry round on top.Trim the edges and press down gently. Decorate the top if you wish with pastry shapes made from the trimmings, then brush with the beaten egg and make a small slit in the top for a steam hole. Either freeze or cook within 4 hours (keep the pie in the fridge).</li>\n<li>(F) Cover the pie dish, label, and freeze.(D) </li>\n<li>Let stand overnight in the fridge.(C) </li>\n<li>Remove the pie from the fridge 20 minutes before cooking. Preheat the oven to 375°F. </li>\n<li>Bake the pie for 30 to 35 minutes, or until piping hot and deep golden.</li>\n<li>From The Foolproof Freezer Cookbook: Prepare-ahead meals, Stress-free entertaining, Making the Most of Excess Fruits and Vegetables, Feeding the Family the Modern Way by Ghillie James. Text © 2011 Ghillie James; photographs © 2011 Tara Fisher. Published in 2012 by Kyle Books.</li>\n</ol>\n</div>
39977	Roast Chicken and Onion Tacos	\N	\N	\N	https://spoonacular.com/recipeImages/roast_chicken_and_onion_tacos-39977.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Peel onions and cut lengthwise into 1/2-inch-thick wedges. </li>\n<li>Place in a 12- by 17-inch roasting pan with 2-inch-tall sides. In a small bowl, mix oregano, 1 teaspoon salt, and pepper. </li>\n<li>Add half the oregano mixture and 1 tablespoon olive oil to onions; mix well. Set one or two wire racks (overlap, if necessary) over onions, extending beyond pan sides so racks are not resting directly on onions. </li>\n<li>Remove giblets from chicken; discard or reserve for other uses. With poultry shears or sturdy scissors, cut along one side of the backbone of chicken. Pull bird open and lay, skin side up, on a flat surface; push down to crack bones slightly so bird lies reasonably flat. Pull off and discard lumps of fat. Rinse bird well on both sides; pat dry. Rub remaining 1 tablespoon oil and oregano mixture all over chicken. Set, skin side up, on racks over onions. Roast in a 425° oven until a thermometer reaches 170° when inserted through thickest part of chicken breast to bone and 180° when inserted through thickest part of thigh at joint, 50 to 60 minutes. Set chicken on a board or rimmed platter and let rest 5 to 10 minutes. </li>\n<li>Remove racks from pan. If onions are not browned, stir and continue roasting until browned, 5 to 10 minutes longer. Scrape browned bits off pan bottom and stir into onions; spoon onions into a bowl. Wrap tortillas in plastic wrap and heat in a microwave oven on full power (100%) just until hot and steamy, 45 seconds to 1 minute. </li>\n<li>Serve chicken with onions, tortillas, and salsa. To eat, cut chicken off bone in chunks or slices and let guests wrap chicken in tortillas with onions, green salsa, and salt to taste.</li>\n</ol>\n</div>
130140	Beer-Can Roasted Chicken with Fig-Jam Pan Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/beer-can-roasted-chicken-with-fig-jam-pan-sauce-2-130140.png	http://www.marthastewart.com/326626/beer-can-roasted-chicken-with-fig-jam-pa
171114	Crispy Parmesan Chicken a la Cordon Bleu	\N	\N	\N	https://spoonacular.com/recipeImages/Crispy-Parmesan-Chicken-a-la-Cordon-Bleu-171114.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In 2-quart nonstick saucepan, stir hot water, 1 1/2 cups milk, 2 tablespoons butter, and the sauce mix and uncooked pasta (from Chicken Helper box). </li>\n<li>Heat just to boiling, stirring frequently. Reduce heat. Simmer uncovered about 12 minutes, stirring frequently, until pasta is tender. </li>\n<li>Remove from heat; stir in ham. Cover to keep warm. Sauce will thicken as it stands.</li>\n<li>2</li>\n<li>Meanwhile, cut each chicken breast into 3 to 5 slices, holding knife at an angle. Slices should be about 1/2 inch thick. Reserve 2 tablespoons seasoned crumbs (from Chicken Helper box).</li>\n<li>3</li>\n\n<li>Place chicken in medium bowl. </li>\n<li>Add 1 tablespoon milk to moisten. </li>\n<li>Add remaining crumbs to coat chicken.</li>\n<li>4</li>\n<li>In 10-inch nonstick skillet, heat 2 tablespoons butter and the oil over medium heat until butter is melted. Carefully add chicken to hot butter mixture; cook 4 to 6 minutes or until golden brown. Reduce heat to medium-low. Turn chicken; cook 4 to 6 minutes longer or until golden brown and centers are no longer pink.</li>\n<li>5</li>\n<li>Meanwhile, in 7-inch skillet, melt 1 tablespoon butter; stir in reserved 2 tablespoons crumbs. Cook over medium heat, stirring frequently, just until crumbs are brown. </li>\n<li>Remove from heat.</li>\n<li>6</li>\n\n<li>Place pasta in serving dish; top with chicken and sprinkle with buttered crumbs and cheese.</li>\n</ol>\n</div>
138490	Supatra's Thai Chicken (gai Yang)	\N	\N	\N	https://spoonacular.com/recipeImages/supatras-thai-chicken-2-138490.jpg	http://www.food.com/recipe/supatras-thai-chicken-gai-yang-113365
32104	Sage And Chilli Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/sage-and-chilli-chicken-2-32104.jpg	http://www.donnahay.com.au/recipes/mains/poultry/sage-and-chilli-chicken
163179	Orange Grilled Beer-Can Chickens	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-Grilled-Beer-Can-Chickens-163179.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat gas or charcoal grill for indirect grilling. Rub chickens with oil. Sprinkle seasoned salt over each chicken and inside cavities.</li>\n<li>2</li>\n<li>Discard half of beer in each can, leaving remaining half in each can. </li>\n<li>Place 2 garlic cloves in each can. </li>\n<li>Place each chicken over top of beer can by holding chicken up and pressing can into cavity. </li>\n<li>Place 1 quarter of orange in top cavity of each chicken. Insert ovenproof meat thermometer in each chicken so tip of thermometer is in thickest part of inside thigh muscle and does not touch bone.</li>\n<li>3</li>\n<li>Balance chickens on beer cans; place on grill over indirect medium heat. Cover grill; cook about 1 hour 30 minutes or until thermometers read at least 165°F and legs move easily when lifted or twisted.</li>\n<li>4</li>\n\n<li>Place orange halves and remaining quarters, flesh side down, directly on grill; cover and cook 3 to 5 minutes.</li>\n<li>5</li>\n\n<li>Remove chickens and oranges from grill; let chickens rest on beer cans 10 to 15 minutes before attempting to remove cans and carve chickens. Before serving, squeeze 2 of the orange halves over tops of chickens; serve others on the side.</li>\n</ol>\n</div>
122256	Easy Homestyle Low fat Chicken and Noodles	\N	\N	\N	https://spoonacular.com/recipeImages/easy-homestyle-low-fat-chicken-and-noodles-2-122256.jpg	http://www.food.com/recipe/easy-homestyle-low-fat-chicken-and-noodles-24501
32316	Roast Chicken With Fava Beans	\N	\N	\N	https://spoonacular.com/recipeImages/roast-chicken-with-fava-beans-2-32316.jpg	http://www.wholeliving.com/176730/roast-chicken-fava-beans
303132	One-Pan Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/One-Pan-Chicken-303132.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 425 degrees F.Get 2 baking dishes and pour in some olive oil to coat. Arrange the pieces of chicken, the potatoes, onions, garlic cloves, and peppers on them. (If you want to use 3 dishes and have got the room, do; the less packed everything is, the crispier the potatoes will be.) Then drizzle some more oil over, making sure everything's glossy and well slicked (but not dripping), sprinkle with the salt, and bake for about 45 minutes.When done (and test all the component parts), strew over the parsley and - I always do this - serve straight from the baking dishes.</li>\n</ol>\n</div>
139296	Speedy Spaghetti with Chicken and Fresh Tomato	\N	\N	\N	https://spoonacular.com/recipeImages/speedy-spaghetti-with-chicken-and-fresh-tomato-2-139296.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring a large pot of salted water to a boil, add spaghetti and cook according to package directions, stirring often, until al dente. Reserve 1 1/2 cups cooking liquid from pasta. </li>\n<li>Drain spaghetti in a colander and reserve.</li>\n<li>Heat oil over medium heat in same pot. </li>\n<li>Add onion and cook, stirring, until softened, about 5 minutes. Return pasta to pot along with tomato, chicken and pasta liquid. Toss well and season with salt and pepper to taste.</li>\n<li>Transfer pasta to plates. Sprinkle with basil, dot with crumbled goat cheese and serve immediately.</li>\n</ol>\n</div>
286759	Roasted Garlic and Orange Roast Chicken	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Garlic-and-Orange-Roast-Chicken-286759.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 400 degrees F. </li>\n<li>Cut the top 1/4-inch from the garlic head, then drizzle with oil, and sprinkle with a pinch of salt. Wrap the garlic in foil, then place in the oven and roast until golden, about 40 minutes. </li>\n<li>Let cool, then peel and smash the cloves into a paste.  </li>\n<li>Mix half the chopped tarragon with the garlic, season with salt and pepper, then place the paste between the flesh and skin of the chicken. Slice the skin on the thighs, then coat with the paste. Sprinkle the chicken cavity with the remaining chopped tarragon, salt, and pepper. Squeeze the orange over the chicken and put the orange in the cavity. Loosely tie the legs together, drizzle with 1 tablespoon oil, and sprinkle all over with salt and pepper.  </li>\n<li>Cut the squash into 1/2-inch slices. Toss the squash and mushrooms in a roasting pan with the remaining 3 tablespoons oil, salt, and pepper. </li>\n<li>Place the chicken over the vegetables. Roast the chicken until a thermometer registers 160 degrees F in the thigh, not touching the bone, 50 to 60 minutes. </li>\n<li>Let stand 10 minutes before carving. </li>\n<li>Garnish with a tarragon sprig.</li>\n</ol>\n</div>
172081	Chicken and Bacon Flatbreads	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-Bacon-Flatbreads-172081.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat oven to 400°F. </li>\n<li>Place tortillas on 2 ungreased large cookie sheets. </li>\n<li>Bake 5 minutes.</li>\n<li>2</li>\n\n<li>Mix cooking sauce and 1 cup of the cheese. </li>\n<li>Spread slightly less than 1/4 cup sauce mixture evenly over each tortilla. Top each with 1/4 cup chicken and remaining cheese.</li>\n<li>3</li>\n\n<li>Bake 5 to 7 minutes or until heated through and cheese is melted. Sprinkle with desired toppings. </li>\n<li>Cut into wedges.</li>\n</ol>\n</div>
499805	Chicken Salad Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-Salad-Sandwiches-499805.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Put cooked meat in food processor and shred.</li>\n<li>Pour into mixing bowl.</li>\n<li>Mix with red pepper, onion, celery, relish, salt and pepper and sugar.Stir in Miracle Whip – start with about ½ cup and add until mixed well.Don’t put too much or it won’t stick together well.</li>\n<li>Spread on sandwich bread and top with salad pepper rings for a delicious sandwich.Also good stuffed in pita pockets or croissants with salad pepper rings.</li>\n</ol>\n</div>
164057	Chicken Parmesan	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-Parmesan-164057.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In 2-quart nonstick saucepan, stir hot water, 1 1/2 cups milk, 2 tablespoons butter, and the sauce mix and uncooked pasta (from Chicken Helper box). </li>\n<li>Heat just to boiling, stirring frequently. Reduce heat. Simmer uncovered about 12 minutes, stirring frequently, until pasta is tender. </li>\n<li>Remove from heat. Sauce will thicken as it stands.</li>\n<li>2</li>\n<li>Meanwhile, cut each chicken breast into 3 to 5 slices, holding knife at an angle. Slices should be about 1/2 inch thick.</li>\n<li>3</li>\n\n<li>Place chicken in medium bowl. </li>\n<li>Add 1 tablespoon milk to moisten. </li>\n<li>Add seasoned crumbs (from Chicken Helper box) to coat chicken.</li>\n<li>4</li>\n<li>In 10-inch nonstick skillet, heat 2 tablespoons butter and the oil over medium heat until butter is melted. Carefully add chicken to hot butter mixture; cook 4 to 6 minutes or until golden brown. Reduce heat to medium-low. Turn chicken, cook 4 to 6 minutes longer or until golden brown and centers are no longer pink.</li>\n<li>5</li>\n<li>In 2-cup microwavable measuring cup, microwave pasta sauce uncovered on High 1 to 2 minutes or until hot. To serve, place chicken on individual plates. Spoon pasta sauce over chicken; sprinkle with cheese. </li>\n<li>Serve with pasta.</li>\n</ol>\n</div>
172277	Chicken Pasta Salad with Grapes and Poppy Seed Dressing	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-Pasta-Salad-with-Grapes-and-Poppy-Seed-Dressing-172277.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Empty Pasta mix into 3-quart saucepan 2/3 full of boiling water. Gently boil uncovered 12 minutes, stirring occasionally.</li>\n<li>2</li>\n\n<li>Drain pasta; rinse with cold water. Shake to drain well.</li>\n<li>3</li>\n<li>In large bowl, stir together seasoning mix and dressing. </li>\n<li>Add pasta and remaining ingredients; toss to combine. </li>\n<li>Serve immediately, or refrigerate.</li>\n</ol>\n</div>
115016	Roast Chicken With Potatoes, Lemon, and Asparagus	\N	\N	\N	https://spoonacular.com/recipeImages/roast-chicken-with-potatoes-lemon-and-asparagus-2-115016.jpg	http://www.food.com/recipe/roast-chicken-with-potatoes-lemon-and-asparagus-222931
434643	Chicken and Rice Soup Mix	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-Rice-Soup-Mix-434643.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, combine the first six ingredients. </li>\n<li>Transfer to a small spice jar. Store in a cool dry place for up to 6 months.</li>\n</ol>\n</div>
478622	How to cook: Stewed monggo (mung beans) with coconut cream	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-cook--Stewed-monggo-(mung-beans)-with-coconut-cream-478622.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Boil the mung beans in about two cups of water for 10 minutes. </li>\n<li>Pour the mung beans and water into a blender and process as finely or as coarsely as you like.</li>\n<li>Heat about three tablespoonfuls of cooking oil in a pan and saute the garlic, onion and tomato, stirring often, until the vegetables start to soften.</li>\n<li>Add the pork to the pan and cook until no longer pink.Scrape the pureed mung beans off the blender and add to the pan. </li>\n<li>Pour in about six cups of water. Stir well.</li>\n<li>Add the chilis. Season with patis (fish sauce) and with freshly ground black pepper. Bring to the boil and simmer for about an hour or until the pork is tender. You will need to stir the stew every 15 minutes or so, scraping the bottom of the pan, to make sure that the pureed mung beans do not settle and stick to the bottom.When the pork is done, add the leafy vegetables. Simmer for another five minutes.Ladle the stew into bowls. </li>\n<li>Drizzle with coconut cream. Top with snipped purple basil and cilantro. </li>\n<li>Serve hot.</li>\n</ol>\n</div>
204207	Beer Braised Pork Shanks	\N	\N	\N	https://spoonacular.com/recipeImages/Beer-Braised-Pork-Shanks-204207.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Preheat oven to 300°F.  Season pork shanks with salt and pepper.  </li>\n<li>Place braising dish over medium high heat and add vegetable oil.  Once oil is shimmering, brown shanks on all sides, then remove from pan and reserve.</li>\n<li>2</li>\n\n<li>Add butter to pan; once melted, add onion and celery and cook until soft and beginning to brown, about 6 minutes.  </li>\n<li>Add thyme to vegetables and place shanks on top.  </li>\n<li>Pour over beer, then add chicken stock until shanks are almost covered.  Bring to a simmer, then place lid on braising dish and place in the oven; cook until shanks are tender, about 2 hours depending on size of shanks.</li>\n<li>3</li>\n<li>Once shanks are tender, remove from braising liquid and cover with foil.  Strain braising liquid through a fine mesh strainer, pressing on vegetables to squeeze out all the liquid.  </li>\n<li>Place braising liquid in a clean saucepan and simmer until reduced by about a third, then season to taste with salt and pepper.  </li>\n<li>Pour sauce over shanks before serving and pass alongside; garnish with sautéed leeks and parsnips.</li>\n</ol>\n</div>
91665	Pytt I Panna - Swedish Fried Hash With Pickled Beetroot	\N	\N	\N	https://spoonacular.com/recipeImages/pytt-i-panna-swedish-fried-hash-with-pickled-beetroot-2-91665.jpg	http://www.food.com/recipe/pytt-i-panna-swedish-fried-hash-with-pickled-beetroot-235035
10015	Pork, Black Bean And Cashew Stir-fry	\N	\N	\N	https://spoonacular.com/recipeImages/pork-black-bean-and-cashew-stir-fry-2-10015.jpg	http://www.donnahay.com.au/recipes/mains/meat/pork-black-bean-and-cashew-stir-fry
401266	Top Rated Hungarian Goulash	\N	\N	\N	https://spoonacular.com/recipeImages/Top-Rated-Hungarian-Goulash-401266.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large skillet, brown beef, pork and onions in oil over medium heat; drain. </li>\n<li>Add the water, paprika, salt and marjoram; bring to a boil. Reduce heat; cover and simmer for 1-1/2 hours or until meat is tender.</li>\n<li>Just before serving, combine flour and sour cream until smooth; stir into meat mixture. Bring to a boil over medium heat; cook and stir for 1-2 minutes or until thickened and bubbly. </li>\n<li>Serve over noodles.</li>\n</ol>\n</div>
3962	Crusted Mahi-mahi And Quinoa With Vegetables	\N	\N	\N	https://spoonacular.com/recipeImages/crusted-mahi-mahi-and-quinoa-with-vegetables-2-3962.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 375 degrees.</li>\n\n<li>Combine all ingredients (after the fish) in a bowl and mix well.</li>\n<li>Gently towel off the fish so that it was not too moist. Apply the mixture and press firmly onto the fish.</li>\n\n<li>Bake for 25 minutes. If your fish is thinner than ours (it was about an inch thick), you should only need about 18-20 minutes.</li>\n</ol>\n</div>
298934	Bean, Cauliflower and Cheese Burritos	\N	\N	\N	https://spoonacular.com/recipeImages/Bean--Cauliflower-and-Cheese-Burritos-298934.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oil in a large heavy saute pan over medium-high heat. </li>\n<li>Add the onions and cook until translucent, about 3 minutes. </li>\n<li>Add the cauliflower and saute until tender, about 5 minutes. Season with salt and pepper. </li>\n<li>Add the oregano. Turn the heat off and reserve.</li>\n<li>Heat a large heavy griddle. Working in batches, heat the tortillas one at a time until they are soft and pliable, about 1 minute per side. </li>\n<li>Add 2 tablespoons of warm Chorizo Refried Beans to the center of the tortilla, spreading outward to the sides. </li>\n<li>Add 1 tablespoon of the sauteed cauliflower mixture. </li>\n<li>Add 1 tablespoon of cheese. Fold in the edges and roll to form a burrito. Return to the griddle just for the cheese to melt, about 10 seconds. </li>\n<li>Serve warm.</li>\n</ol>\n<div class="subRecipeInstructionTitle">Chorizo  Refried Beans:</div>\n<ol>\n\n<li>Heat a medium saute pan on medium heat. </li>\n<li>Add the chorizo and cook until golden in color, about 6 minutes. </li>\n<li>Remove the chorizo to a drain on a plate lined with some paper towels. </li>\n<li>Add the onions to the pan with the chorizo fat. </li>\n<li>Saute until the onions are translucent, about 4 minutes. Return the chorizo to the pan. </li>\n<li>Add the refried beans to the mixture. Continue cooking for about 5 minutes. Turn the heat off and reserve for tostadas and burritos.</li>\n</ol>\n</div>
417788	Hungry Man's Baked Potatoes	\N	\N	\N	https://spoonacular.com/recipeImages/Hungry-Mans-Baked-Potatoes-417788.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Scrub and pierce potatoes; place on a microwave-safe plate. Microwave, uncovered, on high for 12-15 minutes or until tender, turning once.</li>\n<li>In a large skillet, cook bacon over medium heat until crisp. </li>\n<li>Remove to paper towels with a slotted spoon; drain, reserving 1 tablespoon drippings. </li>\n<li>Saute corn and onion in drippings until tender.</li>\n<li>With a sharp knife, cut an "X" in each potato; fluff pulp with a fork. </li>\n<li>Place pork in a microwave-safe bowl. Microwave, uncovered, for 1-2 minutes or until heated through. Top potatoes with pork, corn mixture, bacon, goat cheese and cilantro.</li>\n</ol>\n</div>
116737	North Croatian Beef Cutlet	\N	\N	\N	https://spoonacular.com/recipeImages/north-croatian-beef-cutlet-2-116737.jpg	http://www.food.com/recipe/north-croatian-beef-cutlet-284674
602196	Chinese Daikon and Carrot Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Chinese-Daikon-and-Carrot-Soup-602196.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring a large soup pot filled with water to a rolling boil. </li>\n<li>Add pork and bones and let boil rapidly for 10 minutes. </li>\n<li>Remove pork and set aside. </li>\n<li>Drain and discard the water, clean the pot if needed. Fill the pot with new water to make the broth (approximately 4 quarts) and add in the pork, bones, shrimp, scallops, ginger, garlic. Bring to a simmer and then turn the heat to medium-low, or hot enough to just produce a gentle simmer for 30-40 minutes.Occassionally, skim the soup of any fats or particles and discard. </li>\n<li>Add radish, carrots and tomatoes to the soup and simmer for another 15-20 minutes. Season with salt (or fish sauce) to taste.</li>\n</ol>\n</div>
290906	Cowboy Beans	\N	\N	\N	https://spoonacular.com/recipeImages/Cowboy-Beans-290906.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large saucepan, bring the soaked beans, ham hock, bay leaf, garlic, jalapeno, and 5 cups of water to a boil over high heat. Cover the pan, reduce the heat to medium and simmer for 2 hours or until beans are tender. If the beans absorb too much water, add 1 cup of water after 1 hour and continue cooking (Beans mixture should remain soupy while cooking). Turn off the heat.Cook the bacon in a large saute pan over medium-high heat until almost crisp, about 10 minutes. </li>\n<li>Add onion and cook for about 3 minutes or until translucent. </li>\n<li>Transfer bacon and onion mixture to the pot with the beans. Wipe pan clean. In same pan cook chorizo over medium heat until crisp, about 1 minutes. Using a  slotted spoon,  remove the chorizo and drain on paper towels. </li>\n<li>Add to the beans. Season lightly with salt, if necessary. Stir the  beans over medium-high heat until heated through. </li>\n<li>Remove the bay leaf and ham hock and discard. Ladle into bowls and serve.Cook's Note: In place of soaking the beans, you can use 3 (15-ounce) cans rinsed and drained pinto beans. Proceed as above but reduce the cooking time to 1 hour.</li>\n</ol>\n</div>
608393	Pork and herbed dumplings stew	\N	\N	\N	https://spoonacular.com/recipeImages/Pork-and-herbed-dumplings-stew-608393.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the butter. </li>\n<li>Add the pork, sprinkle with salt and pepper. Cook over medium-high heat, turning once in a while, until lightly browned.Throw in the chopped onion and continue cooking until softened.</li>\n<li>Add the rosemary and tarragon. </li>\n<li>Pour in two cups of broth. Bring to the boil. Lower the heat, cover and simmer for 40 to 50 minutes or until the pork is tender. Taste the sauce once in a while and add more salt and pepper, as needed.Meanwhile, prepare the dumplings. Rub together the flour, baking powder and butter until the texture resembles oatmeal. </li>\n<li>Add about ¼ tsp. of salt, a little pepper and the parsley. </li>\n<li>Pour in enough ice cold water, one tablespoonful at a time, to bind the dough into a ball. Wrap in cling film and leave in the fridge for about 20 minutes.When the pork is almost done, take out the dough and form into balls about an inch and a half in diameter.Drop the balls of dough into the stew. Cover the pan and let the dumplings cook for 10 to 15 minutes.Note that the flour in the dumplings will thicken the sauce of the stew so check the liquid 10 minutes after dropping in the balls of dough. If the mixture appears too thick or dry, add more broth.Taste the sauce. Adjust the seasonings, if needed, before serving.</li>\n</ol>\n</div>
85505	Cajun Blackened Salmon With Pureed Peas and Door Stop Fries	\N	\N	\N	https://spoonacular.com/recipeImages/cajun-blackened-salmon-with-pureed-peas-and-door-stop-fries-2-85505.jpg	http://www.food.com/recipe/cajun-blackened-salmon-with-pureed-peas-and-door-stop-fries-269619
82263	Pepper And Cumin Spiced Pork	\N	\N	\N	https://spoonacular.com/recipeImages/pepper-and-cumin-spiced-pork-2-82263.jpg	http://www.donnahay.com.au/recipes/mains/meat/pepper-and-cumin-spiced-pork
82262	Sticky Asian Pork Neck	\N	\N	\N	https://spoonacular.com/recipeImages/sticky-asian-pork-neck-2-82262.jpg	http://www.donnahay.com.au/recipes/mains/meat/sticky-asian-pork-neck
522587	Pork, chayote, squash and spinach soup	\N	\N	\N	https://spoonacular.com/recipeImages/Pork--chayote--squash-and-spinach-soup-522587.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Melt the butter in a pot. </li>\n<li>Add the pork and cook until nicely browned. Trust me, the browning process will add so much flavor and texture to the cooked dish so don’t skip this step.When the meat is nicely browned, add the chopped onion and continue cooking, with occasional stirring, until the onion bits start to soften.</li>\n<li>Pour in five cups of broth. Stir and remember to scrape whatever bits may be stuck in the bottom of the pot. Taste. </li>\n<li>Add salt and pepper, as needed. Bring to the boil.</li>\n<li>Add the chayote. Bring to the boil once more then lower the heat, cover and simmer for about 10 minutes.Dissolve the soup mix in the remaining broth. </li>\n<li>Pour into the pot. Taste. </li>\n<li>Add more salt and pepper, if needed.</li>\n<li>Add the squash. Bring to the boil, lower the heat and simmer for another 10 minutes or until the squash is done and the soup leaves no flour-y sensation in the mouth.Stir in the spinach leaves. Cook for another minute.</li>\n<li>Serve the soup hot with buttered bread.</li>\n</ol>\n</div>
598373	Pulled Pork Tacos with Habanero Salsa	\N	\N	\N	https://spoonacular.com/recipeImages/Pulled-Pork-Tacos-with-Habanero-Salsa-598373.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Make the habanero salsa Char the pepper by holding it with tongs over the flame of a gas burner, turning as needed, until it’s spotted black and blistered all over. (If you don’t have a gas stove, broil the habanero a few inches from the broiler element, turning as needed, until charred all over.) </li>\n<li>Let cool. </li>\n<li>Remove the loose outer layers of papery skin from the garlic clove but leave the tight inner peel intact. Char the garlic clove over the gas burner, using the same technique as you did for the habanero, until it’s completely blackened. Carefully stem the habanero, scrape out the seeds, and coarsely chop the pepper, preferably wearing plastic gloves to protect your fingers. (And by all means, whatever you do, resist the urge to rub your eyes.) Peel the garlic clove, coarsely chop it, and add it to the bowl of a food processor (preferably a mini one) along with about half the habanero. </li>\n<li>Add the cilantro, scallion, lime juice, oil, and salt to taste and process until a loose salsa forms. Taste. If you want the salsa to be spicier, add more of the habanero and adjust the amout of lime juice and/or salt if need be. Set aside for just a few minutes. (You can cover and refrigerate the habanero salsa for up to 2 weeks.)Make the pulled pork tacos </li>\n<li>Heat the pork in a small saucepan over medium heat, stirring occasionally, until warmed through, 4 to 5 minutes. Warm the tortillas in a dry skillet over a medium-low flame, then wrap in aluminum foil to keep warm. Lay the tortillas out on a plate. Divide the pork among the tortillas and top with just a little bit of the salsa (be judicious until you know how much you can handle). Any remaining salsa can be covered and refrigerated for up to a week or so to be spooned onto more tacos or eggs or baked potatoes or just about anything at will.</li>\n</ol>\n</div>
215410	Pork Milanese with spaghetti	\N	\N	\N	https://spoonacular.com/recipeImages/Pork-Milanese-with-spaghetti-215410.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oil in a pan, then frythe garlic for a few secs. </li>\n<li>Add thechopped tomatoes and balsamicvinegar and bubble for about15-20 mins until the sauce isthick.Meanwhile, lay the porkmedallions between two layers ofcling film and bash with a rolling pinuntil they are about 1cm thick. </li>\n<li>Mixthe flour with some seasoning inone bowl, put the egg in anotherand the breadcrumbs in a third.Dip the pork in the flour, then theegg, then the breadcrumbs. </li>\n<li>Heata grill to hot, then cook the pork for3 mins on each side, until goldenand cooked through. Keep warm.Cook the pasta following packinstructions. Stir through thetomato sauce and the choppedbasil, divide the pasta between4 plates, put the crispy pork ontop and eat immediately.</li>\n</ol>\n</div>
526709	Asian Pork Stir Fry	\N	\N	\N	https://spoonacular.com/recipeImages/Asian-Pork-Stir-Fry-526709.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oil in a large skillet or wok over medium-high heat. Fry ginger in hot oil until fragrant, then add pork, soy sauce, onion, sweet pepper, mushrooms, salt, and sugar.Cook, stirring occasionally, for 10 minutes.Stir in the sesame oil, green onion, and rice wine. Simmer until the pork is tender.</li>\n<li>Serve over hot rice</li>\n</ol>\n</div>
35219	Slow-cooked Hoisin And Ginger Pork Wraps With Peanut Slaw	\N	\N	\N	https://spoonacular.com/recipeImages/slow-cooked_hoisin_and_ginger_pork_wraps_with_peanut_slaw-35219.jpg	http://www.thekitchn.com/dinner-for-a-crowd-recipe-slow-79670
133555	Authentic South Florida Cuban Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/authentic-south-florida-cuban-sandwiches-2-133555.jpg	http://www.food.com/recipe/authentic-south-florida-cuban-sandwiches-284773
541207	Ginger Pork Rolls with Eggplant	\N	\N	\N	https://spoonacular.com/recipeImages/Ginger-Pork-Rolls-with-Eggplant-541207.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Peel the eggplant and chop the skin into small pieces, then soak it in water. </li>\n<li>Cut the eggplant into 1 ½ inch sticks (see picture below) and also soak in water for 5 minutes.Wrap 2 eggplant sticks with a piece of sliced pork.Sprinkle half of corn starch on the pork rolls and spread over the meat. Then turn the pork rolls and spread the remaining of corn starch on the pork rolls. </li>\n<li>Remove excess.In a large non-stick frying pan, heat sesame oil on medium heat. Cook the pork rolls until all the sides are golden browned.Cook covered for 3 minutes on medium-low heat. Poke the eggplant to see if it’s cooked through. Then add seasonings.Coat the meat well by rotating the pork rolls, for 2-3 more minutes. Then transfer only pork rolls onto a platter.In the same pan, cook the eggplant skins on medium heat. When they are soft, add miso and mix well. Cook covered on medium-low heat for a minute.</li>\n<li>Put the eggplant skins over the pork rolls and garnish Shiso leaves. If you like it spicy, dip in Yuzu Kosho to eat.</li>\n</ol>\n</div>
7422	Smoked Fish with Fennel and Arugula Salad	\N	\N	\N	https://spoonacular.com/recipeImages/smoked-fish-with-fennel-and-arugula-salad-2-7422.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Overlap fish on one side of platter. </li>\n<li>Whisk oil and lemon juice in bowl. Season dressing with salt and pepper. Toss half with fennel and half with arugula. Mound both alongside fish. Sprinkle with chives.</li>\n</ol>\n</div>
520797	Dinuguan (pork and blood stew)	\N	\N	\N	https://spoonacular.com/recipeImages/Dinuguan-(pork-and-blood-stew)-520797.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking oil in a pan.</li>\n<li>Add the pork and cook over high heat, stirring often, until the meat is no longer pink.</li>\n<li>Pour in the vinegar. Stir. Cook, uncovered, until the vinegar has been absorbed by the pork.Cook the pork in the oil and rendered fat for a few minutes.</li>\n<li>Add the garlic, shallots (or onion), ginger and chilis. Season with salt and pepper. Stir. Cook until the vegetables soften.</li>\n<li>Pour in the blood. Note that if there are solid masses, you can press them through a strainer before adding to the pork. I don’t mind the solid masses although I mash them with my hands to make sure that there are no too large pieces.Stir. Wait for the mixture to boil.The blood will turn from red to brown as it cooks. When the mixture boils, lower the heat, cover and simmer for an hour or until the pork is done. The sauce will reduce and thicken as it cooks, don’t be tempted to add water unless you want a soupy dinuguan.Taste the stew from time to time and adjust the seasonings, as needed.When the pork is tender, add the liver. Stir. Simmer for another ten minutes.</li>\n<li>Garnish the dinuguan with slices of chili and scallions before serving.</li>\n</ol>\n</div>
520803	Broiled pork with pineapple chunks and sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Broiled-pork-with-pineapple-chunks-and-sauce-520803.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking oil in a frying pan or wok. </li>\n<li>Add the pork. Cook, stirring often, just until heated through.</li>\n<li>Add the onion, garlic and chili flakes. Stir fry for about 30 seconds.</li>\n<li>Pour in the fish sauce. Stir and allow most of the liquid to boil off.Disperse the starch in the pineapple syrup. </li>\n<li>Pour into the pan.</li>\n<li>Add the pineapple chunks.Cook over high heat for about three minutes or until the sauce is thick and clear.Sprinkle with onion leaves and serve on top of very hot rice.</li>\n</ol>\n</div>
246381	Japanese Tofu with Enoki Mushroom and Minced Pork	\N	\N	\N	https://spoonacular.com/recipeImages/Japanese-Tofu-with-Enoki-Mushroom-and-Minced-Pork-246381.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Marinate pork in all ingredients for marinade for at least 30 mins.</li>\n</ol>\n</div>
367226	Chicken and Truffle Terrine	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-and-Truffle-Terrine-367226.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Line a 2 pound loaf pan with bacon, overlapping the entire area.  Put chicken in a chilled food processor and blend until minced.  </li>\n<li>Add pork, shallots and garlic and pulse until mixed.  Season with salt and pepper and fold in parsley and truffles.   </li>\n<li>Mix in eggs by hand until incorporated. Chill mixture for 1 hour and preheat oven to 325 degrees.  </li>\n<li>Place mixture in loaf pan and place in water bath going half way up loaf pan.  </li>\n<li>Bake for 45 minutes or until firm.  Allow to chill before removing from pan.  Slice 1/4-inch thick and serve with 1 tablespoon of grain mustard.</li>\n</ol>\n</div>
17057	Pork Chops with Granny Smith Apples	\N	\N	\N	https://spoonacular.com/recipeImages/pork_chops_with_granny_smith_apples-17057.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix together the flour, cumin, salt, and pepper on a large plate. Lightly coat each piece of pork with the flour mixture; set aside. </li>\n<li>Heat the vegetable oil and butter in a large skillet over medium-high heat. Sprinkle the apple halves with a pinch of salt and pepper. Cook the apples cut-side down about 5 minutes or until golden brown. </li>\n<li>Remove from the skillet, cover, and set aside. </li>\n<li>Place the pork in the skillet, sprinkle with the parsley, and cook until the meat is golden brown and crispy, 4 to 5 minutes per side. While the pork is cooking, whisk together the broth and vinegar. </li>\n<li>Remove the pork from the skillet and set aside. </li>\n<li>Pour the broth mixture into the skillet, stirring and scraping up any browned bits. Bring to a boil and cook until slightly thickened. Divide the pork among 4 plates and pour some pan sauce over each. Before serving, place an apple half and a dab of mustard on each plate.</li>\n</ol>\n</div>
213670	Jerk pork & pineapple skewers with black beans & rice	\N	\N	\N	https://spoonacular.com/recipeImages/Jerk-pork---pineapple-skewers-with-black-beans---rice-213670.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix together the pork, jerk seasoning,allspice, chilli sauce, if using, limezest and juice, and some seasoning.Thread the pork and pineapple ontometal skewers (or pre-soaked woodenskewers) and brush with the oil.Cook rice following pack instructions.</li>\n<li>Drain well, then put back in the saucepanwith the beans, stir and keep warm.Meanwhile, heat a griddle pan until veryhot. Cook the skewers for 3 mins on eachside until nicely charred and the pork iscooked through. </li>\n<li>Serve skewers with thebeans and rice, extra chilli sauce, if youlike, and lime wedges for squeezing over.</li>\n</ol>\n</div>
522969	Stir-fried paprika-chili pork with pineapple and bananas	\N	\N	\N	https://spoonacular.com/recipeImages/Stir-fried-paprika-chili-pork-with-pineapple-and-bananas-522969.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Thinly slice the pork. </li>\n<li>Place in a bowl and mix with the paprika, chili powder, garlic and salt. Set aside.</li>\n<li>Brush a heated non-stick pan very lightly with oil.Arrange the saba banana slices, cut side down, and cook over medium-high heat until nicely browned. Flip to brown the opposite side. Scoop out the bananas and transfer to a plate.</li>\n<li>Add the pineapple wedges to the hot pan (no need to add more oil) and brown them as well. </li>\n<li>Remove the pineapple wedges to a plate.</li>\n<li>Heat a wok. </li>\n<li>Pour in the two tablespoonfuls of vegetable oil and allow to reach smoking point.Stir fry the pork in hot oil for two to three minutes or until done.</li>\n<li>Add the sliced onion to the pork. Stir fry for another 30 seconds.Throw in the bananas and pineapple wedges. Sprinkle with salt. Toss. </li>\n<li>Drizzle in a few tablespoonfuls of water (so that nothing burns while waiting for the fruits to get heated through). Cook, stirring and tossing gently, until the mixture is steamy and everything is hot.Tip the contents of the wok onto a platter. Sprinkle with cilantro and the sliced chili.</li>\n</ol>\n</div>
509280	Pork and Plantain Cuban Breakfast Hash	\N	\N	\N	https://spoonacular.com/recipeImages/Pork-and-Plantain-Cuban-Breakfast-Hash-509280.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>First you need to caramelize your plantains.</li>\n<li>Add them to a large skillet over medium heat with a tablespoon of coconut oil. Cook on both sides for about 2-3 minutes, being sure not to burn them.Once they are cooked through, add your plantains to a large bowl and small with a fork. Then add your minced garlic clove, onion, jalapeno, lime, seasonings and leftover pork. Mash thoroughly together.Form a large ball then press down into a thin patty.</li>\n<li>Heat skillet back up and place another tablespoon of coconut oil in your skillet.</li>\n<li>Add your hash to the pan and press down to make it as flat as possible.Cook on both sides for 4-5 minutes or until each side is crispy.Cook up your egg(s) however you’d like. I cooked mine over easy.Top hash with egg. This would also be great with guacamole and/or salsa.</li>\n</ol>\n</div>
322325	Spinach and Mint-Basil Pesto-Stuffed Pork Loin	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach-and-Mint-Basil-Pesto-Stuffed-Pork-Loin-322325.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>For the pesto: In a food processor fitted with a steel blade, pulse the basil and mint 3 to 4 times or until chopped, then add the pine nuts and salt and pulse an additional 2 to 3 times. </li>\n<li>Add the garlic and cheese, pulse 2 times. With the food processor running, slowly add the oil to blend, this should take 1 minute. Don't over-pulse or puree; this will result in a brown liquid sauce, not a bright herb pesto.For the pork: To butterfly the pork, place each loin on a cutting board and slice lengthwise through the center, about 3 inches deep, but not cutting all the way through, until it opens to form a 10 by 10-inch square.Preheat the oven to 350 degrees F.Season the inside of both loins with salt and pepper and evenly spread the pesto, leaving a 2-inch border on all sides. Sprinkle with feta and top with spinach. </li>\n<li>Roll tightly lengthwise. With butchers twine, tie several knots around the stuffed loins, 4 to 5 times, to ensure even cooking.</li>\n<li>Heat the oil in a heavy bottomed saute pan over high heat, season the outside of the loins with salt and pepper, and sear on all sides, 2 to 3 minutes per side. </li>\n<li>Remove from the pan and place the loins on a baking sheet lined with aluminum foil and bake for 20 to 25 minutes, or until the internal temperature reaches 165 degrees F. Allow to rest for 5 to 10 minutes before slicing and serving.</li>\n</ol>\n</div>
4928	Penne And Salmon With Vodka Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/penne_and_salmon_with_vodka_sauce-4928.jpg	http://cookingwithmichele.com/2010/09/penne-and-salmon-with-vodka-sauce/
484216	Crock-Pot Mexican Stew	\N	\N	\N	https://spoonacular.com/recipeImages/Crock-Pot-Mexican-Stew-484216.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place pork in a 5-quart slow cooker.</li>\n<li>Add broth, onion, green chiles, tomatoes, cumin, salt and pepper; stir well.Cover and cook on LOW setting for 3 hours.</li>\n<li>Add Sweet Potato around 3 hours or 4 hours cooking.Cook a total of 6-7 hours on Low.</li>\n<li>Add lime juice and stir well. Top with cilantro.</li>\n</ol>\n</div>
478098	How to cook: Sigarillas (winged bean), patani (lima bean) and squash in coconut milk	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-cook--Sigarillas-(winged-bean)--patani-(lima-bean)-and-squash-in-coconut-milk-478098.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse the sigarillas and patani. </li>\n<li>Drain.</li>\n<li>Cut off and discard both tips of each piece of sigarillas. </li>\n<li>Cut the sigarillas into one-inch pieces.Skin the squash then cut into cubes (half-inch to three-quarters should ensure fast cooking).</li>\n<li>Heat the vegetable oil in a wok or frying pan. </li>\n<li>Add the pork and cook, stirring, until lightly browned.</li>\n<li>Add the onion, garlic, ginger and chilies. Season with pepper and a little patis. Cook just until fragrant, about a minute.</li>\n<li>Add the sigarillas, patani and squash to the pork.</li>\n<li>Pour in the broth and coconut milk. Taste. </li>\n<li>Add more patis, if needed (you won’t need to add much if the broth is already seasoned). Bring to the boil, cover and simmer for about ten minutes or just until the vegetables are done.</li>\n<li>Pour in the coconut cream. Cook just until simmering. Turn off the heat. Taste one last time, adjust the seasonings, if needed, and serve hot.</li>\n</ol>\n</div>
478159	How to cook: Yang Chow (Yeung Chow, Yang Zhou) fried rice	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-cook--Yang-Chow-(Yeung-Chow--Yang-Zhou)-fried-rice-478159.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
521187	Sinigang na baboy (pork and vegetables in tamarind broth)	\N	\N	\N	https://spoonacular.com/recipeImages/Sinigang-na-baboy-(pork-and-vegetables-in-tamarind-broth)-521187.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking oil in a pot. </li>\n<li>Saute the garlic, onion and tomatoes until they start to soften.</li>\n<li>Add the pork cubes. Cook, stirring, until the meat changes color.</li>\n<li>Pour in enough water (or rice washing) to cover. </li>\n<li>Add the finger chilis. Season with patis. Bring to the boil, cover and simmer for an hour to an hour and a half, or until the pork is tender.About 20 minutes before the pork is done, add the taro wedges.Meanwhile, place a fine sieve over a bowl. </li>\n<li>Pour in the tamarind with the boiling water. Press the boiled tamarinds through a fine sieve to get the juice and as much of the pulp as you can. For a more detailed tutorial (and more illustrative photos), click here to view how to extract tamarind juice.About ten minutes after adding the taro (gabi) to the pot, add the eggplant wedges.When the eggplants are almost done, add the kangkong to the pot, pressing them down gently into the broth. </li>\n<li>Let boil for five minutes. Taste the broth and add more patis if necessary.</li>\n<li>Serve the soup hot.</li>\n</ol>\n</div>
478227	How to cook: Sinigang na baboy (pork and vegetables in tamarind broth)	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-cook--Sinigang-na-baboy-(pork-and-vegetables-in-tamarind-broth)-478227.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking oil in a pot. </li>\n<li>Saute the garlic, onion and tomatoes until they start to soften.</li>\n<li>Add the pork cubes. Cook, stirring, until the meat changes color.</li>\n<li>Pour in enough water (or rice washing) to cover. </li>\n<li>Add the finger chilis. Season with patis. Bring to the boil, cover and simmer for an hour to an hour and a half, or until the pork is tender.About 20 minutes before the pork is done, add the taro wedges.Meanwhile, place a fine sieve over a bowl. </li>\n<li>Pour in the tamarind with the boiling water. Press the boiled tamarinds through a fine sieve to get the juice and as much of the pulp as you can. For a more detailed tutorial (and more illustrative photos), click here to view how to extract tamarind juice.About ten minutes after adding the taro (gabi) to the pot, add the eggplant wedges.When the eggplants are almost done, add the kangkong to the pot, pressing them down gently into the broth. </li>\n<li>Let boil for five minutes. Taste the broth and add more patis if necessary.</li>\n<li>Serve the soup hot.</li>\n</ol>\n</div>
616391	Hawaiian pulled pork BBQ enchilada stacks ($100 Target gift card giveaway)	\N	\N	\N	https://spoonacular.com/recipeImages/Hawaiian-pulled-pork-BBQ-enchilada-stacks-(-100-Target-gift-card-giveaway)-616391.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place pork and slow cooker sauce in a slow cooker. Cover and cook on low for 7 hours.</li>\n<li>Remove pork and shred using two forks. Return pork to the slow cooker and toss in the sauce. Set aside.</li>\n<li>Place water, butter and rice in a small sauce pot, bring to a boil. Once boiling, reduce to low, cover and cook until all the liquid is absorbed.Once rice is cooked, add the chopped pineapple and green onion and mix to combine.</li>\n<li>Heat enough oil in a large skillet to coat the bottom of the pan over medium-high.Once hot, add 1 of the flour tortillas and cook for about 1 minute on each side until browned and crispy. </li>\n<li>Transfer to a paper towel lined plate to drain and repeat with remaining tortillas.</li>\n<li>Brush the top of a tortilla with BBQ sauce, spread rice on top, then pork, top with another tortilla and repeat the process to make stacks of 2 or </li>\n</ol>\n</div>
187487	Santiago de Cuba's Roast Pork Marinated in a Garlicky Allspice-Cumin Adobo (Cerdo Brujo)	\N	\N	\N	https://spoonacular.com/recipeImages/Santiago-de-Cubas-Roast-Pork-Marinated-in-a-Garlicky-Allspice-Cumin-Adobo-(Cerdo-Brujo)-187487.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Making the Adobo</li>\n\n<li>Place the garlic, salt, peppercorns, cumin, and allspice in a large mortar and pound to a paste with a pestle. Stir in the bitter orange juice. (You can also puree these ingredients in a blender or food processor.) Set aside.</li>\n<li>Preparing the Pork</li>\n<li>Trim the skin from the inner part of the leg only. Wipe the meat clean with a damp cloth. Make several deep incisions all over the skinned portion and rub with the salt. </li>\n<li>Let rest for a few minutes. Rub the marinade all over the pork, pushing it into the gashes and between the meat and the skin. Cover with plastic wrap and refrigerate for 2 to 3 hours or a maximum of 12 hours. Wipe the marinade from the skin with a clean cloth.</li>\n<li>Roasting the Pork</li>\n<li>Preheat the oven to 400°F. </li>\n<li>Place the pork in a roasting pan and bake uncovered, skin side up, for 3 to 4 hours. Check the roast often. As the pan juices evaporate, replenish them with a little of the diluted sweet orange juice. The pork is done when the skin is crackling and the juices run clear when the meat is pierced at the thickest part of the leg (about 160°F on a meat thermometer).</li>\n<li>Finishing the Dish</li>\n\n<li>Remove the pork from the oven and lift it onto a cutting board, holding the bone with a cloth. With a sharp knife, remove the crisp skin and cut it into small serving pieces. </li>\n<li>Place them on a cookie sheet and set in the turned-off oven, uncovered (if you cover the crackling, it steams and gets soggy).</li>\n<li>To deglaze the pan juices, place the roasting pan on the stove over medium heat and add the sherry, scraping up the browned bits with a wooden spoon.</li>\n<li>Carve the pork and return to the roasting pan with the pan juices to keep the meat moist and flavorful. Pork dries out easily, so if you must hold it for more than 30 minutes, cover the pan with aluminum foil and return it to a warm oven.</li>\n<li>What to Drink: Luca Pinot Noir from Mendoza, Argentina, or Robledo Family Pinot Noir from Los Carneros, California</li>\n<li>Serving: Be sure to include some of the crisp skin and deglazed juices with each serving. </li>\n<li>Serve with rice.</li>\n<li>Reprinted with permission from Gran Cocina Latina: The Food of Latin America by Maricel Presilla, © 2012 Norton</li>\n</ol>\n</div>
523370	Pork asado with stir-fried kangkong	\N	\N	\N	https://spoonacular.com/recipeImages/Pork-asado-with-stir-fried-kangkong-523370.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Prick the meat with a fork in several places.</li>\n<li>Heat the cooking oil in a large heavy pan. Lightly brown the pork, rolling it in hot oil to brown all sides evenly. </li>\n<li>Pour enough water to reach about half the height of the pork. </li>\n<li>Pour in the soy sauce and add the rest of the ingredients. What you’re looking for is an agreeable balance between the saltiness of the soy sauce and the sweetness of the sugar. So, use more or less of either ingredient to suit your taste. Bring to the boil, lower the heat, cover and simmer the pork, fat side up, for an hour to an hour and a half, depending on its thickness. Flip the pork halfway through the cooking time.Lift the pork out of the liquid, place on a plate and cool to room temperature, </li>\n<li>Cut into 1/4 inch slices and arrange on a serving platter.Strain the braising liquid. Reheat. Dissolve the starch in 1/8 cup of water. </li>\n<li>Pour into the braising liquid and cook, stirring, until thickened. Stir in the hoisin sauce and sesame seed oil, and stir well to blend.</li>\n<li>Pour the sauce over the sliced pork and serve.</li>\n</ol>\n</div>
107643	River Road Cookbook Sweet and Sour Pork	\N	\N	\N	https://spoonacular.com/recipeImages/river-road-cookbook-sweet-and-sour-pork-2-107643.jpg	http://chinese.food.com/recipe/river-road-cookbook-sweet-and-sour-pork-263410
478349	How to cook: Dinuguan (pork and blood stew)	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-cook--Dinuguan-(pork-and-blood-stew)-478349.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking oil in a pan.</li>\n<li>Add the pork and cook over high heat, stirring often, until the meat is no longer pink.</li>\n<li>Pour in the vinegar. Stir. Cook, uncovered, until the vinegar has been absorbed by the pork.Cook the pork in the oil and rendered fat for a few minutes.</li>\n<li>Add the garlic, shallots (or onion), ginger and chilis. Season with salt and pepper. Stir. Cook until the vegetables soften.</li>\n<li>Pour in the blood. Note that if there are solid masses, you can press them through a strainer before adding to the pork. I don’t mind the solid masses although I mash them with my hands to make sure that there are no too large pieces.Stir. Wait for the mixture to boil.The blood will turn from red to brown as it cooks. When the mixture boils, lower the heat, cover and simmer for an hour or until the pork is done. The sauce will reduce and thicken as it cooks, don’t be tempted to add water unless you want a soupy dinuguan.Taste the stew from time to time and adjust the seasonings, as needed.When the pork is tender, add the liver. Stir. Simmer for another ten minutes.</li>\n<li>Garnish the dinuguan with slices of chili and scallions before serving.</li>\n</ol>\n</div>
203978	Very Crispy Tongue with Chili Bean Paste and Sichuan Peppercorns	\N	\N	\N	https://spoonacular.com/recipeImages/Very-Crispy-Tongue-with-Chili-Bean-Paste-and-Sichuan-Peppercorns-203978.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Place the tongue(s) in a pot and cover with water or stock.  Bring to a boil, reduce to a simmer, then cover and cook until tender, about three hours, adding extra liquid as needed.  </li>\n<li>Let the tongue cool, then remove the tongue from the stock and set the stock aside for another use.</li>\n<li>2</li>\n<li>When tongue is cool enough to handle, peel the outer membrane off the tongue and discard.  </li>\n<li>Cut the tongue into slices slightly thicker than 1/4-inch.</li>\n<li>3</li>\n\n<li>Add a 1/4 cup oil to the skillet and place over medium heat until shimmering. Working in batches, add the slices of tongue and cook until brown and crisp on one side, about 3 minutes. Flip and brown on the other side, another 3 minutes. (Reduce heat if tongue or oil is smoking excessively).  As slices of tongue brown, transfer to a plate lined with paper towels.</li>\n<li>4</li>\n\n<li>Heat remaining tablespoon oil in a wok set over medium low heat until shimmering. </li>\n<li>Add the chilis, scallions, and Sichuan peppercorns, and stir-fry until aromatic, 20 to 30 seconds.</li>\n<li>5</li>\n\n<li>Add the slices of tongue to the wok.  </li>\n<li>Add the chili bean paste and stir-fry vigorously to coat the tongue, about 20 seconds longer.  </li>\n<li>Add the rice wine and soy sauce. </li>\n<li>Add salt to taste, about 1/2 teaspoon.  Keep stirring the tongue around in the wok to evenly distribute the seasonings.   </li>\n<li>Remove from the heat, stir in the oil(s), and serve immediately.</li>\n</ol>\n</div>
11501	Pork Sandwiches With Coleslaw	\N	\N	\N	https://spoonacular.com/recipeImages/pork_sandwiches_with_coleslaw-11501.jpg	http://www.myrecipes.com/recipe/pork-sandwiches-with-coleslaw-10000000524324/
11563	Thyme Pork With Cabbage-and-ham Mash	\N	\N	\N	https://spoonacular.com/recipeImages/thyme-pork-with-cabbage-and-ham-mash-2-11563.jpg	http://www.donnahay.com.au/recipes/mains/meat/thyme-pork-with-cabbage-and-ham-mash
520701	Orange pork with Szechuan pepper	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-pork-with-Szechuan-pepper-520701.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Measure the soy sauce and rice wine. Stir together.</li>\n<li>Place the pork in a pan. </li>\n<li>Pour in the soy sauce and rice vinegar. </li>\n<li>Add enough water to cover. Throw in the orange peel. Bring to the boil.In another pan, saute the onion, garlic, Szechuan peppercorns and star anise in a little oil.Cook until the onion slices start to turn translucent.</li>\n<li>Add the sauteed ingredients to the pork. Cover, lower the heat and simmer for an hour to an hour and a half or until the sauce is thick and clear.</li>\n<li>Serve hot with rice or manthao (steamed sweet buns).</li>\n</ol>\n</div>
583101	Ukrainian Aspic (Kholodets)	\N	\N	\N	https://spoonacular.com/recipeImages/Ukrainian-Aspic-(Kholodets)-583101.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Make sure you soak the pork legs in cold wate (3 hours to overnight - it's also a good way to thaw the pork)In a large pot, add pork legs, and chicken drum sticks. </li>\n<li>Add enough water to cover all of the meat. Set over high heat, cover and bring to a boil. As soon as it starts boiling, remove from heat and drain off the water. Rinse the meat, refill with fresh water (enough water to cover all of the meat, plus an extra ½-inch over the meat); Don't add too much water or it won't be "gelatiney" enough later. Cover and bring to a boil again. Reduce heat to a light boil/simmer and set a timer for 5 hours.After cooking for 5 hours, </li>\n<li>Add 1 large carrot, 2 medium onions (both ends removed), 1 celery stick, 2 bay leaves, 5-8 peppercorns and 2 tsp salt into the pot and continue boiling on low heat 1 more hour. It should look like a nice chicken broth. Now it's important that you do not discard the broth and do not add more water to the pot!</li>\n<li>Remove the drumsticks and carrot from the broth and let them cool. Discard pork legs, onion and bay leaves. Use a fine mesh sieve with 3 bounty paper towels over the sieve and filter the broth through the paper towels. You will be left with a clean broth.Peel and press 4 garlic cloves into the broth and do a taste test to see if more salt is needed.Once the meat has cooled, use a fork to separate meat from the bones. Keep the good meat; discard the bones. Thinly slice the carrot. You can make one big holodets in a rectangular pyrex dish or you can make smaller serving bowls.Start by placing carrots on the bottom and top with some dill if you wish. Next add the meat in an even layer and pour broth over the meat; enough to cover the meat and a little extra over the top. Refrigerate 3 hours to overnight, or until firm. </li>\n<li>Serve with red horseradish/hren (recipe on Natashas</li>\n<li>Kitchen.com) or Russian mustard. Once it's set, set the bowl in hot water for a few seconds, then use a slim spatula to release the gelatin from the dish. Or you can just serve it out of the dish and save yourself a step.</li>\n</ol>\n</div>
212453	Mojo pork skewers with Cuban coolers	\N	\N	\N	https://spoonacular.com/recipeImages/Mojo-pork-skewers-with-Cuban-coolers-212453.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>To make the skewers, pour the oil intoa large heavy-based pan, add the garlicand cook over a low heat until cooked andstarting to toast – take care not to burn.Tip in the cumin, stir briefly, then addthe citrus juices, thyme and someseasoning. Allow to boil for several minsto concentrate and make a sauce. Cool.Put your pork into a bowl, and stir inthree-quarters of the cooled marinade.Leave to marinate for 1 hr at roomtemperature or overnight in the fridge.When ready to serve, thread the porkonto 18 pre-soaked wooden skewers.Griddle for 2 mins on each side or untilcooked. Arrange on a platter, pour overthe remaining sauce and serve garnishedwith orange wedges.To make the coolers, put a handful ofcrushed ice into each of 6 tall glasses.Stir the lime juice and sugar togetheruntil the sugar dissolves, then tip into theglasses. Divide the lager, then the gingerale between the glasses, top with limeslices and serve with the pork skewers.</li>\n</ol>\n</div>
556537	Jalapeno Popper Pork Panini	\N	\N	\N	https://spoonacular.com/recipeImages/Jalapeno-Popper-Pork-Panini-556537.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>For the Jalapeno Cream Cheese: </li>\n<li>Mix all ingredients and season to taste.For the Sandwich: </li>\n<li>Heat a saute pan or electric skillet over medium heat. Butter the outside of each bread slice. </li>\n<li>Place 1 slice butter-side down on the skillet, then top with pork. Sprinkle cheese on top. </li>\n<li>Spread cream cheese on non-buttered side of the other slice of bread, then top the sandwich with the butter-side up. Cook 3-4 minutes, or until golden brown on one side. Then flip and cook until cheese is melty and bread is crispy and golden brown. </li>\n<li>Serve immediately!</li>\n</ol>\n</div>
97791	Pork or Lamb Goulash A' Blanc	\N	\N	\N	https://spoonacular.com/recipeImages/pork-or-lamb-goulash-a-blanc-2-97791.jpg	http://www.food.com/recipe/pork-or-lamb-goulash-a-blanc-70307
226838	Regios o Bollitos de Carne (Colombian-Style Pork and Beef Rolls)	\N	\N	\N	https://spoonacular.com/recipeImages/Regios-o-Bollitos-de-Carne-(Colombian-Style-Pork-and-Beef-Rolls)-226838.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Season the meat with, cumin, salt and pepper. </li>\n<li>Spread a thin layer of hogao down the center of each pork slice. Top with a slice of beef.</li>\n<li>Roll tightly and tie with kitchen string. Set a steamer basket in a medium pot filled with the beef stock. Arrange the beef rolls in the steamer. Bring the stock to a boil over medium-high heat, cover and steam for about 40 minutes.In a small bowl combine the batter ingredients, except the oil. </li>\n<li>Mix well.In a large frying pan, heat vegetable oil to 375 degrees F. Dip cooked beef rolls in the batterand immediately place into hot oil.Cook until golden and skim any loose pieces of batter from the oil. </li>\n<li>Drain on paper towels. </li>\n<li>Place on a large platter, season with salt and pepper. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
26215	Tomatillo Bread Pudding With Chorizo And Spinach	\N	\N	\N	https://spoonacular.com/recipeImages/tomatillo_bread_pudding_with_chorizo_and_spinach-26215.jpg	http://www.fronterafiesta.com/cook/starters-snacks-a-light-meals/415-tomatillo-bread-pudding-with-chorizo-and-spinach.html
521938	Yang Chow (Yeung Chow, Yang Zhou) fried rice	\N	\N	\N	https://spoonacular.com/recipeImages/Yang-Chow-(Yeung-Chow--Yang-Zhou)-fried-rice-521938.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
347907	Sweet and Spicy Shredded Pork	\N	\N	\N	https://spoonacular.com/recipeImages/Sweet-and-Spicy-Shredded-Pork-347907.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 350 degrees F. Rinse and dry the pork shoulder.</li>\n<li>Mix together the brown sugar, garlic, cumin, salt, and cayenne. Rub the mixture generously and evenly over the pork shoulder.In a large roasting pan or Dutch oven, add the chopped onions, broth, and cola. </li>\n<li>Place the seasoned pork in the Dutch oven and roast for 4 to 6 hours, checking the pork every hour for tenderness and liquid level.When the pork is tender enough that it is falling apart, shred it with a fork. Reserve the juices and pour them over the shredded pork before serving.*Cook's Note: This recipe is so versatile for entertaining because it can be served in so many different ways. It's comfort food that is easy to serve and pleases the masses.Shredded Pork Serving Variations:Shredded Pork Salads (my favorite): </li>\n<li>Serve the shredded pork over toasted corn tortillas with romaine lettuce, fresh cilantro, pico de gallo, pinto beans, lime wedges, and dressed with a creamy tomatillo dressing, recipe follows. </li>\n<li>Serve with a quick coleslaw on the side as well, recipe follows.Shredded Pork Sandwiches: </li>\n<li>Serve the shredded pork on toasted potato buns.Shredded Pork Tacos: Set up a taco bar featuring guacamole, sour cream, pico de gallo, cilantro, lime wedges, cotija cheese, etc. Works well for a casual party atmosphere.</li>\n</ol>\n</div>
210792	Pork, green bean & oyster stir-fry	\N	\N	\N	https://spoonacular.com/recipeImages/Pork--green-bean---oyster-stir-fry-210792.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, mix together the lime juice, chilli bean paste, oyster sauce and half the soy sauce. Set aside. </li>\n<li>Heat a large wok with 1 tbsp of the oil. Season the pork and toss with the remaining soy sauce. Sear the meat quickly, then remove from the pan.</li>\n<li>Add the remaining oil and stir-fry the garlic, onion and beans for 2 mins. Return the meat to the pan with the sauce and stir-fry for another 3 mins, until the sauce has thickened. </li>\n<li>Serve with steamed rice or noodles.</li>\n</ol>\n</div>
97768	Moroccan Lamb With Tomato & Couscous	\N	\N	\N	https://spoonacular.com/recipeImages/moroccan-lamb-with-tomato-couscous-2-97768.jpg	http://www.food.com/recipe/moroccan-lamb-with-tomato-couscous-125639
522193	Ginger pork with spinach and baby corn	\N	\N	\N	https://spoonacular.com/recipeImages/Ginger-pork-with-spinach-and-baby-corn-522193.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the pork into thin, thin slices — less than a quarter inch, ideally. </li>\n<li>Place in a bowl, add the ginger, black pepper, fish sauce and sesame seed oil. </li>\n<li>Mix thoroughly.Rinse the spinach and drain. If you’re using the stems, roughly chop so that you get bite size pieces.</li>\n<li>Cut the baby corn into halves or thirds. Finely slice the chilies.</li>\n<li>Heat the cooking oil in a pan. When smoking hot, add the pork and cook, stirring, until the meat changes color.</li>\n<li>Pour in some soy sauce (a tablespoon at this point should be enough) and continue stir frying until the mixture is almost dry.</li>\n<li>Add the onion slices and the chilies, stir fry for another 30 seconds, then add the spinach and baby corn. Stir fry just until the spinach wilts and the baby corn pieces are heated through.Taste the dish, add more fish sauce or soy sauce, if needed.</li>\n</ol>\n</div>
565284	Ginger and Scallions Pork	\N	\N	\N	https://spoonacular.com/recipeImages/Ginger-and-Scallions-Pork-565284.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Marinate the pork slices in (A) for at least 10 minutes.</li>\n<li>Heat oil in wok, stir fry ginger for 20 seconds. Then add garlic and chilli. Stir fry for another 30 seconds.</li>\n<li>Add pork slices, stir fry until you see that they are fully cooked on the surface.</li>\n<li>Add water and spring onions. At the first sight of the spring onions withering, drizzle Chinese cooking wine along the side of the wok and let the alcohol evaporate in a few seconds. Turn off the flame. This dish is best served with steamed rice.</li>\n</ol>\n</div>
106561	Sweet and Sour Pork	\N	\N	\N	https://spoonacular.com/recipeImages/sweet-and-sour-pork-2-106561.jpg	http://www.food.com/recipe/sweet-and-sour-pork-161705
22616	Ultimate Hawaiian Pizza	\N	\N	\N	https://spoonacular.com/recipeImages/ultimate_hawaiian_pizza-22616.jpg	http://www.cheekykitchen.com/2011/05/the-ultimate-hawaiian-pizza.html
36997	Pan-fried Pork With Snow Pea Slaw	\N	\N	\N	https://spoonacular.com/recipeImages/pan-fried-pork-with-snow-pea-slaw-2-36997.jpg	http://www.donnahay.com.au/recipes/mains/meat/pan-fried-pork-with-snow-pea-slaw
106665	Sticky Pork and Hokkein Noodle Stir Fry	\N	\N	\N	https://spoonacular.com/recipeImages/sticky-pork-and-hokkein-noodle-stir-fry-2-106665.jpg	http://www.food.com/recipe/sticky-pork-and-hokkein-noodle-stir-fry-136224
567461	Korean Black Bean Sauce Noodles (Jajangmyeon)	\N	\N	\N	https://spoonacular.com/recipeImages/Korean-Black-Bean-Sauce-Noodles-(Jajangmyeon)-567461.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse the pork in cold water.</li>\n<li>Add the pork marinade sauce onto the pork. </li>\n<li>Mix them well.</li>\n<li>Cut the onion, potato, zucchini and carrot into small cubes.</li>\n<li>Cut the cabbage into medium size pieces.Pre heat the wok.</li>\n<li>Add some cooking oil and the pork and stir until the pork is half cooked.</li>\n<li>Add the carrots and potatoes, stir for 3-5 mins.</li>\n<li>Add the zucchini, onions, and cabbages, stir until all are cooked.Pre heat the frying pan and add the olive oil and black bean paste. Stir it on medium heat for 1 minute.Scoop out the black bean paste without the oil. </li>\n<li>Add it to the wok (from the step )</li>\n<li>Mix the vegetables with the black bean paste.</li>\n<li>Add the cooking syrup, sugar, and rice wine into the wok. Stir it for 1 min.</li>\n<li>Add the water and boil it for 3 to 5 mins.</li>\n<li>Add the starch water into the wok. Stir it. (It is the final stage of making sauce.)Boil some water in a pot and add the noodles when it starts to boil. Boil them until the noodles are cooked.Rinse them in cold water and put them into a bowl.</li>\n<li>Add the black bean sauce (from the step on top of the noodles.You can serve it itself or decorate it with some cucumber slice, egg or green beans. In my case I used some radish sprouts and the egg.</li>\n<li>Mix the sauce and the noodles well with chopsticks.Dig in. (It is ideal to have them with yellow pickled radish. Apparently it helps digestion. Also dig it up quickly before the noodles get swollen.)</li>\n</ol>\n</div>
37069	Pork And Noodle Salad	\N	\N	\N	https://spoonacular.com/recipeImages/pork-and-noodle-salad-2-37069.jpg	http://www.donnahay.com.au/recipes/mains/meat/pork-and-noodle-salad
145647	Orange Pork Stroganoff	\N	\N	\N	https://spoonacular.com/recipeImages/orange-pork-stroganoff-2-145647.jpg	http://www.food.com/recipe/orange-pork-stroganoff-203779
143626	Crystal Pork in Orange Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/crystal-pork-in-orange-sauce-2-143626.jpg	http://www.food.com/recipe/crystal-pork-in-orange-sauce-235383
16665	Pork & Mango Lettuce Wraps	\N	\N	\N	https://spoonacular.com/recipeImages/pork-mango-lettuce-wraps-2-16665.jpg	http://www.williams-sonoma.com/recipe/pork-and-mango-lettuce-wraps.html
203052	Sichuan Braised Pork Cheeks	\N	\N	\N	https://spoonacular.com/recipeImages/Sichuan-Braised-Pork-Cheeks-203052.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In the skillet, heat the oil over medium heat. Make sure the pork cheeks are dry and sprinkle them with salt and pepper. </li>\n<li>Add them to the pan, taking care not to crowd the meat. Cook until the surface is browned on both sides, about 4 minutes per side, flipping only once or twice so as not to disturb browning. </li>\n<li>Remove with tongs as cheeks are browned; set aside.</li>\n<li>2</li>\n<li>In the sauté pan, heat a few more tablespoons of oil over medium heat. </li>\n<li>Add the chili bean paste and stir-fry for 30 seconds until the paste starts to smell fragrant. </li>\n<li>Add the stock, wine, ginger, scallions, soy sauce, and spices. Bring the liquid to a boil; then turn the heat down and add the pork cheeks.</li>\n<li>3</li>\n<li>In the meantime, preheat the oven to 300°F. Cover the pan with the pork cheeks, either with a lid or foil, and braise in the oven for at least 5 to 3 hours, until cheeks are very tender. Allow meat to cool and settle in the liquid, refrigerating the liquid overnight. The next day, scrape off the fat and reheat gently. </li>\n<li>Garnish with chopped cilantro. </li>\n<li>Serve with rice and vegetables.</li>\n</ol>\n</div>
45392	Sweet Potato And Sausage Stuffing	\N	\N	\N	https://spoonacular.com/recipeImages/sweet_potato_and_sausage_stuffing-45392.jpg	http://www.cinnamonspiceandeverythingnice.com/2011/01/sweet-potato-and-sausage-stuffing.html
113032	Pork and Green Chili Casserole	\N	\N	\N	https://spoonacular.com/recipeImages/pork-and-green-chili-casserole-2-113032.jpg	http://www.food.com/recipe/pork-and-green-chili-casserole-175644
143778	Pork and Vegetable/fruit Kabobs	\N	\N	\N	https://spoonacular.com/recipeImages/pork-and-vegetable_fruit-kabobs-2-143778.jpg	http://www.food.com/recipe/pork-and-vegetable-fruit-kabobs-99884
647656	Hungarian Goulash Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Hungarian-Goulash-Soup-647656.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat butter in large pan and fry onion until golden brown.  </li>\n<li>Add meat and fry 5 more minutes.</li>\n<li>Add carrot, green pepper, tomatoes, paprika, salt, pepper, and garlic salt. Stir well. </li>\n<li>Add 3/4 pint water, cover and simmer for 1 hour, adding more water, if necessary.Before serving, add cream. For variation, add a pinch of cumin and 2 cubed, peeled potatoes for the last 30 minutes of cooking.</li>\n</ol>\n</div>
551453	Crispy Pulled Pork and Caramelized Apples Pancake Stack	\N	\N	\N	https://spoonacular.com/recipeImages/Crispy-Pulled-Pork-and-Caramelized-Apples-Pancake-Stack-551453.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine all ingredients for the pancakes in a small food processor and blend until very well combined.</li>\n<li>Let the batter sit for a few minutes to give the coconut flour a chance to thicken.Meawhile, add some coconut oil to a large skillet and heat over medium-high heat.When pan is hot enough, slowly pour about ¼ of a cup of batter per pancake. </li>\n<li>Spread slightly, lower heat to medium-low and cook all the way through, until tops become sort of matte and dull looking and edges are nice and golden.Very, VERY delicately flip the pancakes and continue cooking until golden on both sides.If you have to work in several batches, place the cooked pancakes in a very low temp oven to keep them warm while you cook the remaining pancakes.While your pancakes are cooking, heat some coconut oil in a separate skillet over medium-high heat. When pan is hot enough, add the apple slices and cook until nice and caramelized on both sides. </li>\n<li>Remove from pan and reserve. In the same pan, add the pork and cook until nice and crispy; reserve. To assemble the pancakes, place one or two pancakes in a small plate, top with a few slices of apple, a pinch of crispy pork followed by another pancake or two. Continue building layers until you run out of ingredients. For a prettier look, finish with a few slices of apples and a few pieces of crispy pork. </li>\n<li>Drizzle with maple syrup to taste.</li>\n</ol>\n</div>
522816	Braised country style pork ribs, roasted vegetables and gravy	\N	\N	\N	https://spoonacular.com/recipeImages/Braised-country-style-pork-ribs--roasted-vegetables-and-gravy-522816.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 325F.</li>\n<li>Heat a non-stick frying pan. Brown the pork ribs on both sides to sear. Note that if you’re not using a non-stick pan, you may have to use a little oil. Brown the pork in batches, if necessary. As each piece browns, transfer to a wide baking dish which can hold all the pork pieces in one layer. </li>\n<li>Add the celery, leeks and carrot. </li>\n<li>Pour in the broth. Sprinkle some salt and pepper. Cover the baking dish tightly with foil and bake in a preheated 325F oven, at the center of the middle rack, for 45 minutes.When the pork has been in the oven for 30 minutes, prepare the roasted vegetables. Dice the potatoes, carrots and eggplants. </li>\n<li>Place in a bowl. </li>\n<li>Pour in the olive oil. </li>\n<li>Add the parsley, salt and pepper. Toss to coast each piece of vegetable with oil and to distribute the seasonings evenly. </li>\n<li>Spread on a pan (line it with baking paper to make sure that nothing sticks during cooking) in a single layer.Take the pork out of the oven and peel off the foil. Return the pork to the oven but position it on a lower rack. </li>\n<li>Place the tray with the vegetables on an upper rack. Turn up the heat to 350F and cook everything for 20 to 30 minutes or until the vegetables are done.Lift the pork to a plate and keep warm. Tip the roasted vegetables to a bowl and keep warm.Strain the pork juices. If you have less than a cup, add more broth to make about two cups. </li>\n<li>Pour about a quarter cup into a small bowl. </li>\n<li>Heat the rest in a pan. Dissolve the flour in the broth in the bowl. </li>\n<li>Add to the pan, stirring. </li>\n<li>Add more salt or pepper, or both, if needed. When the mixture boils, turn down the heat to medium and boil gently for about five minutes to completely cook the flour (otherwise, the gravy will leave a powdery sensation in the mouth). Turn off the heat. Stir in the butter.To serve, place a piece of pork on a plate. </li>\n<li>Add the vegetables on one side. </li>\n<li>Drizzle with gravy.</li>\n</ol>\n</div>
492226	Sweet Potato and Sausage Stuffing	\N	\N	\N	https://spoonacular.com/recipeImages/Sweet-Potato-and-Sausage-Stuffing-492226.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large skillet saute celery, onion, thyme, a pinch or two of salt and pepper together in a couple of tablespoons olive oil over medium-low heat until tender. </li>\n<li>Add sausage and brown, breaking it apart as it cooks.When the sausage is cooked mash up one of the potatoes and combine with the sausage mixture. </li>\n<li>Add 3/4 of the bread stuffing and then begin mixing with the chicken broth a little at a time starting with one cup. Keep adding chicken broth until all of the croutons are soaked but not soggy. If the mixture seems soggy mix in more stuffing mix. </li>\n<li>Mix well incorporating the sausage throughout, taste and season with salt and pepper. Preheat oven to 400 degrees F. Grease a 9x13 pan. Thinly slice the remaining sweet potato and cover bottom of pan, add stuffing. Dot a tablespoon or two (or more) of butter over top and sprinkle with crumbs. </li>\n<li>Bake for 20-25 minutes or until top is browned.</li>\n</ol>\n</div>
246503	Lemongrass and Honey Pork Stir-Fry	\N	\N	\N	https://spoonacular.com/recipeImages/Lemongrass-and-Honey-Pork-Stir-Fry-246503.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all marinade ingredients in a food processor. Blend until a paste is formed.</li>\n</ol>\n</div>
146280	Pork and Potato Hash	\N	\N	\N	https://spoonacular.com/recipeImages/pork-and-potato-hash-2-146280.jpg	http://www.food.com/recipe/pork-and-potato-hash-140508
437120	Pork and Winter Squash Stew	\N	\N	\N	https://spoonacular.com/recipeImages/Pork-and-Winter-Squash-Stew-437120.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a Dutch oven or saucepan, brown pork in 1 tablespoon of oil. </li>\n<li>Remove from pan; drain. </li>\n<li>Heat remaining oil in the same pan over medium heat. </li>\n<li>Saute onion and garlic for 3 minutes.</li>\n<li>Return pork to pan. </li>\n<li>Add the mushrooms, carrots, tomatoes and seasonings; bring to a boil. Reduce heat; cover and simmer for 1 hour.</li>\n\n<li>Add squash; simmer, uncovered for 30 minutes or until meat and vegetables are tender. </li>\n<li>Serve with noodles if desired.</li>\n</ol>\n</div>
220036	Pork & pineapple skewers with ancho glaze & salsa	\N	\N	\N	https://spoonacular.com/recipeImages/Pork---pineapple-skewers-with-ancho-glaze---salsa-220036.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>To make the glaze, soak the ancho chillies in boiling water for 15 mins. While they’re soaking, heat a large frying pan (no oil is needed). </li>\n<li>Add the onion slices and garlic. Season and let blacken on a medium-low heat for about 15 mins. Turn everything so all sides blacken. When the garlic is blackened, peel it. </li>\n<li>Add it to a food processor or blender with the charred onion, ancho chillies, coriander stems, cider vinegar, sugar and a good measure of salt. Blend until smooth, then scrape into a bowl.Slice the pork and pineapple into 4cm pieces. Thread them onto the soaked skewers and brush liberally with the glaze. You won’t use all of it, but save the rest as a sauce for serving.In a small bowl, mix the chopped onion, lime juice and coriander leaves. </li>\n<li>Mix together.</li>\n<li>Heat a grill to high. Grill the skewers for 2-5 mins each side until chargrilled. </li>\n<li>Let them rest for 5 mins under foil, then serve with the fresh onion salsa and remaining glaze.</li>\n</ol>\n</div>
146318	Pork and Sauerkraut a La Budapest	\N	\N	\N	https://spoonacular.com/recipeImages/pork-and-sauerkraut-a-la-budapest-2-146318.jpg	http://www.food.com/recipe/pork-and-sauerkraut-a-la-budapest-221620
447384	Sweet and Sour Pork Kabobs	\N	\N	\N	https://spoonacular.com/recipeImages/Sweet-and-Sour-Pork-Kabobs-447384.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small saucepan, bring 1 in. of water to a boil; add carrots. Cover and cook for 10-12 minutes or until almost tender; drain well. </li>\n<li>Drain pineapple, reserving 1/4 cup juice. Set pineapple aside.</li>\n<li>In a small bowl, combine the vinegar, oil, soy sauce, sugar, garlic and reserved pineapple juice. </li>\n<li>Pour over cubed pork; let stand for 30 minutes.</li>\n<li>On four metal or soaked wooden skewers, alternate the pork, carrots, peppers and reserved pineapple. Grill over medium-hot heat for 5-6 minutes or until meat is tender, basting with reserved marinade. </li>\n<li>Serve with rice.</li>\n</ol>\n</div>
588717	Kalua Pork Eggs Benedict With Sriracha Hollandaise Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Kalua-Pork-Eggs-Benedict-With-Sriracha-Hollandaise-Sauce-588717.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Make the hollandaise:Fill a pan less than halfway with water, set it over medium heat until simmering.In a medium bowl, that fits the pan with water but wont touch the water when placed on it, whisk the egg yolks and lemon juice briskly until thickened. You can use a hand mixer for this to speed up the process. Set the bowl over the pan of simmering water while continuing to whisk the mixture and slowly add in the melted butter a little at a time. Once all the butter is combined and the mixture has thickened back up, turn off the heat. </li>\n<li>Add in the salt, pepper and 1 tsp of the sriracha. </li>\n<li>Whisk again well. Taste and add more sriracha if desired for more heat. The mixture will be thick. If not using immediately keep warm and when ready to use whisk again and add water, 1 teaspoon at a time until you reach desired consistency. Spoon over benedict when ready to serve.Make the poached eggs:Set a deep saucepan, at least 3” deep with water and bring to a simmer. </li>\n<li>Add in 1 tsp vinegar. Crack one egg into a very shallow bowl and slowly set it into the simmering water. Using a spoon gently fold any stray egg white to keep the egg as compact as possible. </li>\n<li>Add 1-2 more eggs this way. You don’t want to over crowd the pan. Simmer 2-3 min for runny yolks, 5-6 min for well done. </li>\n<li>Remove using a slotted spoon. Gently transfer to a paper towel to get rid of excess water and then place on top of the muffins when ready.For the Bok Choy:Slice off the bottom of the baby bok choy and separate all the leaves. Rinse well and pat dry. </li>\n<li>Heat a small sauté pan with 1 tsp coconut oil over medium heat. </li>\n<li>Add the chopped baby bok choy and sauté about 4-5 minutes until softened. This can be done while the eggs are poaching.For assembly:Toast the English muffin and place two halves on a plate. Top with each with 2 ounces of the kalua pork, then ¼ cup of the baby bok choy. Top with the poached egg and spoon some of the hollandaise on top. </li>\n<li>Serve immediately!</li>\n</ol>\n</div>
478122	How to cook: Gising-gising (spicy pork and green beans with coconut milk)	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-cook--Gising-gising-(spicy-pork-and-green-beans-with-coconut-milk)-478122.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oil in a wok or frying pan.</li>\n<li>Add the chopped pork. Cook over high heat, stirring occasionally, until browned.</li>\n<li>Add the onion, garlic, ginger, tomatoes and chilis. Season with patis. </li>\n<li>Saute just until the vegetables start to soften.</li>\n<li>Add the green beans. </li>\n<li>Pour in the coconut milk. Taste and add more patis.Boil over medium heat, uncovered (to avoid curdling) and with occasional stirring, for about five minutes or until the green beans are done and the mixture is almost dry.</li>\n<li>Pour in the coconut cream. Adjust the seasoning once more. Boil gently, still uncovered, for about two minutes.</li>\n</ol>\n</div>
119823	Pork Curry With Coriander	\N	\N	\N	https://spoonacular.com/recipeImages/pork-curry-with-coriander-2-119823.jpg	http://www.food.com/recipe/pork-curry-with-coriander-190592
599085	Homemade Italian Sausage	\N	\N	\N	https://spoonacular.com/recipeImages/Homemade-Italian-Sausage-599085.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Chop pork butt into pieces that are 1 to 2 inches large.  </li>\n<li>Add to a bowl.  In the bowl add dry red wine, salt, cayenne pepper, fennel seed, paprika, crushed red pepper, garlic, chopped parsley, and cracked black pepper.   Stir mixture to combine, and coat the meat evenly.  If desired covered with plastic and allow meat to marinade for a few hours before grinding.Pass the meat with a meat grinder fitted with the medium sized die.  Or place meat into a food processor in small batches and process until finely ground.   You can test the seasoning by cooking a small portion of the sausage, if desired adjust for seasoning.   Sausage should be used within 48 hours, or can be frozen for use later.</li>\n</ol>\n</div>
146476	Jamaican Jerk Pork	\N	\N	\N	https://spoonacular.com/recipeImages/jamaican-jerk-pork-2-146476.jpg	http://www.food.com/recipe/jamaican-jerk-pork-373129
640050	Coriander Pork With Baby Bok Choy	\N	\N	\N	https://spoonacular.com/recipeImages/Coriander-Pork-With-Baby-Bok-Choy-640050.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oil in a wok. </li>\n<li>Add the onion and garlic, cook. </li>\n<li>Add the pork and cook well. Sprinkle with pepper and pour in the wine, soy sauce, vinegar and sugar and stir. </li>\n<li>Add a little water too to lighted the sauce.</li>\n<li>Add in the carrots and stir. </li>\n<li>Add the baby bok choy and stir until cooked.</li>\n<li>Add the coriander last and cook lightly. </li>\n<li>Serve with rice.</li>\n</ol>\n</div>
144528	Pork Mixed Bean Chili	\N	\N	\N	https://spoonacular.com/recipeImages/pork-mixed-bean-chili-2-144528.jpg	http://www.food.com/recipe/pork-mixed-bean-chili-199107
17619	Stir Fried Chinese Sticky Rice Cakes (nian Gao) Recipe (??? Ch?	\N	\N	\N	https://spoonacular.com/recipeImages/Stir-Fried-Chinese-Sticky-Rice-Cakes-(nian-Gao)-Recipe-(-Ch-17619.jpg	http://steamykitchen.com/15288-chinese-stirfried-sticky-rice-cakes-nian-gao.html
249076	Daeji Bulgogi (Korean Spicy BBQ Pork)	\N	\N	\N	https://spoonacular.com/recipeImages/Daeji-Bulgogi-(Korean-Spicy-BBQ-Pork)-249076.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix everything in a freezer bag and marinate over night.Cook the meat on a barbecue or in a pan on the stove.</li>\n</ol>\n</div>
568618	Slow Cooker Pork and Beans	\N	\N	\N	https://spoonacular.com/recipeImages/Slow-Cooker-Pork-and-Beans-568618.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add all the ingredients into the slow cooker from the beans to the bay leaf in the list above. For the chicken stock, use as little or as much as you will need to cover the beans so they cook evenly.Cook on High for 4 hours. You may want to stir everything together once or twice just to make sure the all the beans are cooking properly.After 4 hours, if the beans are tender, add the tomato paste, canned tomatoes, and crushed red pepper. Season with salt and pepper, as needed. I like to add a little fish sauce for an extra savory flavor but you may omit.Turn the power down to Low and cook for another hour.</li>\n<li>Serve with rice or with country bread</li>\n</ol>\n</div>
243067	Down-South Banh Mi	\N	\N	\N	https://spoonacular.com/recipeImages/Down-South-Banh-Mi-243067.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350°. </li>\n<li>Bake baguette on an ungreased baking sheet 10 minutes or until warm. Meanwhile, stir together mayonnaise and sriracha in a small bowl. Stir together carrots and fish sauce in a separate bowl. Split baguette horizontally. </li>\n<li>Cut each half into 3 (6-inch-long) pieces. </li>\n<li>Spread cut sides of bread with mayonnaise mixture. Layer bottom halves with Slow-cooker Mustard Barbecued Pork, Pickled Peppers and Onions, serrano pepper slices, carrot mixture, and cilantro to taste. Top with remaining bread slices. </li>\n<li>Serve immediately.* 1/2 small jalapeño pepper may be substituted.</li>\n</ol>\n</div>
615855	Crock Pot Mexican Breakfast Casserole {Low Carb & Gluten Free}	\N	\N	\N	https://spoonacular.com/recipeImages/Crock-Pot-Mexican-Breakfast-Casserole-{Low-Carb---Gluten-Free}-615855.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large skillet over medium heat, cook the pork sausage until no longer pink.</li>\n<li>Add seasonings and salsa. Set aside to cool slightly.In a another bowl whisk the eggs and milk.</li>\n<li>Add the pork to the eggs, then add the cheese and stir to combine.Grease the bottom of the crock pot and pour in mixture.Cover and cook on high 2 hours or low 5 hours.Enjoy with optional toppings.</li>\n</ol>\n</div>
157207	Cumin-Rubbed Cuban Porchetta	\N	\N	\N	https://spoonacular.com/recipeImages/cumin-rubbed-cuban-porchetta-157207.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bone the pork middle.Lay the middle on a cutting board and rub the garlic into the meat, making sure to get into the grooves where the ribs were removed and into the pocket where the shoulder blade was removed. </li>\n<li>Spread the orange zest over the meat, then liberally season with fine sea salt followed by the pepper, allspice, cumin, pimentón, oregano and parsley.Although you can tie the roast alone, it is easier to tie it if you can enlist an extra set of hands. </li>\n<li>Roll the loin toward the bottom of the belly, pressing it tightly as you go. Tie the roast perpendicular to the light score marks, using double lengths of twine at 2-inch intervals.Refrigerate the roast uncovered or loosely covered with a tea towel for at least 1 day or for up to 3 days to allow the flavors of the seasonings to penetrate the meat. Do not wrap in plastic wrap, as moisture trapped between the plastic and the skin can prevent the skin from crisping in the oven. </li>\n<li>Remove the roast from the refrigerator and allow it to temper for 1 to 2 hours. Preheat the oven to 375 degrees F. Outfit a roasting pan with a rack.</li>\n<li>Place the roast on the rack. Rub it on all sides with the olive oil, then sprinkle it evenly with the coarse salt. </li>\n<li>Transfer to the oven and roast for 30 to 40 minutes, until the skin is golden brown and crispy. Turn down the oven temperature to 300 degrees F and continue to cook until a thermometer inserted into the thickest part of the loin registers 140 degrees F. This can take from 2 1/2 to 4 hours, depending on the thickness of the roast.</li>\n<li>Remove from the oven and let rest for at least 30 minutes before carving. </li>\n<li>Cut into slices to serve, using a serrated knife to cut through the crunchy exterior of the skin.</li>\n</ol>\n</div>
93848	Transylvanian Cabbage Gulyas	\N	\N	\N	https://spoonacular.com/recipeImages/transylvanian-cabbage-gulyas-2-93848.jpg	http://www.food.com/recipe/transylvanian-cabbage-gulyas-119135
304822	Steamed Clams with Chorizo and Tequila	\N	\N	\N	https://spoonacular.com/recipeImages/Steamed-Clams-with-Chorizo-and-Tequila-304822.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat a heavy, medium pot over medium heat. </li>\n<li>Add the chorizo, breaking up the large pieces with a wooden spoon. </li>\n<li>Saute until almost crisp, about 6 minutes. Using a slotted spoon, transfer the chorizo to paper towels to drain.</li>\n<li>Add the butter and onions and cook over medium-high heat until the onions are soft, about 5 minutes. </li>\n<li>Add the garlic and saute until fragrant, about 3 minutes longer. </li>\n<li>Add the tequila and clam juice and bring to a boil over medium-high heat, scraping up the browned bits at the bottom of the pan. </li>\n<li>Add the clams to the pot, cover and reduce the heat to medium. Cook until the clams open wide, 10 to 12 minutes (discard any clams that remain unopened). Return the chorizo to the pot and stir to combine. Divide between 2 bowls, sprinkle with the chopped cilantro and serve with the loaf of sourdough.</li>\n</ol>\n</div>
212766	Asian aubergine & pork hotpot	\N	\N	\N	https://spoonacular.com/recipeImages/Asian-aubergine---pork-hotpot-212766.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oven to 200C/fan 180C/gas  </li>\n<li>Heat 2 tbsp of the oil in an ovenproof sauté pan and brown the meat well (you may have to do this in batches), then scoop out of the pan. </li>\n<li>Add the rest of the oil and the aubergine, brown on all sides, scoop out and add to the pork. Tip the sugar into the pan and leave to caramelise slightly, then return the pork and aubergine to the pan with the star anise and cinnamon, then coat in the sticky caramel.</li>\n<li>Add the onions, ginger and half the chilli, and cook for a few mins with the pork. </li>\n<li>Add the coriander stalks and splash in the fish sauce and enough water to come about a third of the way up. Cover and place the dish, undisturbed, in the oven for 1 hr, then remove from the oven and add the lime juice and more fish sauce to taste. Stir through half the coriander leaves and the remaining chilli, and scatter over the rest of the coriander. You should have a hotpot of tender meat with soft aubergines all in a punchy little sauce.</li>\n</ol>\n</div>
40736	Bean Curd Rolls	\N	\N	\N	https://spoonacular.com/recipeImages/bean-curd-rolls-2-40736.jpg	http://userealbutter.com/2010/04/16/bean-curd-rolls-recipe/
97660	Barbecue Lamb on Mediterranean Salad	\N	\N	\N	https://spoonacular.com/recipeImages/barbecue-lamb-on-mediterranean-salad-2-97660.jpg	http://www.food.com/recipe/barbecue-lamb-on-mediterranean-salad-287541
381354	Moroccan Spiced Lamb with Harissa	\N	\N	\N	https://spoonacular.com/recipeImages/Moroccan-Spiced-Lamb-with-Harissa-381354.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 350 degrees F.Coat lamb racks generously with the spice mix, salt, and pepper. Be cautious with the pepper since there is pepper in the spice mix. There should be an even coat of spices around the lamb. </li>\n<li>Heat a couple tablespoons olive oil in a very large skillet over high heat. When oil is hot, add lamb racks and sear over high heat to form a crust on both sides. </li>\n<li>Remove from the pan, transfer to a baking dish and finish in the oven for 8 minutes or until medium rare. </li>\n<li>Remove from the oven and allow to rest at room temperature for at least 5 minutes before slicing.Assembly:Slice the lamb into 1/4-inch thick slices as close to the bone as possible. </li>\n<li>Place a piece of lamb on top of a baguette slice. </li>\n<li>Add a drop of the harissa (remember it is spicy), and then finish with a thin julienne of dried apricot and a sprig of chervil. For additional seasoning, add a sprinkle of salt and a drop of extra-virgin olive oil.</li>\n</ol>\n<div class="subRecipeInstructionTitle">Moroccan Spice </li>\n<li>Mix:</div>\n<ol>\n<li>1 tablespoon cumin seeds1 tablespoon cardamom seeds1 tablespoon coriander seeds1 tablespoon paprika1/2 tablespoon black peppercorns1 cinnamon stick1/2 tablespoon ground nutmeg1/2 tablespoon whole cloves</li>\n<li>In a shallow saute pan, toast all of the spices over a medium heat. Allow to cool and then grind in a coffee grinder to a fine powder.</li>\n</ol>\n</div>
15803	Lamb With Couscous Pilaf And Green Salad	\N	\N	\N	https://spoonacular.com/recipeImages/lamb_with_couscous_pilaf_and_green_salad-15803.jpg	http://www.realsimple.com/food-recipes/browse-all-recipes/lamb-couscous-pilaf-00100000079761/index.html
22997	Afghan Ruz Bukhari	\N	\N	\N	https://spoonacular.com/recipeImages/afghan_ruz_bukhari-22997.jpg	http://www.indiansimmer.com/2011/03/afghan-ruz-bukhari-and-giveaway-winners.html
15840	Spring Breast Of Lamb Recipe With Lemon And Rosemary	\N	\N	\N	https://spoonacular.com/recipeImages/spring_breast_of_lamb_recipe_with_lemon_and_rosemary-15840.jpg	http://www.mostlyeating.com/a-spring-breast-of-lamb-recipe-with-lemon-and-rosemary
95712	Corn, Cranberry Bean, and Fried-Okra Salad	\N	\N	\N	https://spoonacular.com/recipeImages/corn-cranberry-bean-and-fried-okra-salad-2-95712.png	http://www.marthastewart.com/339734/corn-cranberry-bean-and-fried-okra-salad
220681	Crispy Mongolian lamb	\N	\N	\N	https://spoonacular.com/recipeImages/Crispy-Mongolian-lamb-220681.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oven to 180C/160C fan/gas </li>\n<li>Put the lamb in a casserole dish witha lid. </li>\n<li>Add remaining ingredients plusenough water to just cover. Cook withthe lid on for 3 hrs until the meatis tender and the bones pull out easily.Allow to cool still covered in the cookingliquid with the lid on. You can do this1-2 days in advance and let the lambcool completely in the fridge. This willmake the next step easier.When cold, lift the lamb out of theliquid and transfer to a baking tray. Skimfat from the sauce. Reserve half thesauce for the noodles (in 'Try' section, below)and bubble the rest, still in the pan, untilthick and syrupy. </li>\n<li>Pour into a smallserving bowl. </li>\n<li>Heat grill to medium andgrill lamb until crisp and hot through,but not too dark.Shred the lamb, discarding most ofthe fat and all the bones, but keep thenice, crisp skin. You can cut the skin offfirst and leave it in a hot oven while youshred the rest of the meat. To serve, takeeverything to the table and eat the lambrolled up in the lettuce leaves with thecucumber, spring onions and sauce, plusthe noodles on the side.</li>\n</ol>\n</div>
97889	Lamb Chops With Apricot and Herb Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/lamb-chops-with-apricot-and-herb-sauce-2-97889.jpg	http://www.food.com/recipe/lamb-chops-with-apricot-and-herb-sauce-124839
56929	Roasted Shoulder Of Lamb With Couscous And Date Stuffing	\N	\N	\N	https://spoonacular.com/recipeImages/roasted-shoulder-of-lamb-with-couscous-and-date-stuffing-2-56929.jpg	http://www.cookstr.com/recipes/roasted-shoulder-of-lamb-with-couscous-and-date-stuffing
311906	Lamb with Spinach and Garlicky Tahini Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Lamb-with-Spinach-and-Garlicky-Tahini-Sauce-311906.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>For the lamb: </li>\n<li>Put the onion into 1 large shallow dish in which the noisettes will fit into one layer, or divide the onion into 2 medium-to-large freezer bags. </li>\n<li>Add the oil, lemon zest, and cumin (dividing equally if you are using bags). Give a good stir and then add the lamb. Cover the dish or tie up the bags and leave, turning or squishing respectively at half time, as long as you've got; frankly, though, it should be for at least 10 minutes and preferably not in the refrigerator. Preheat the oven to 425 degrees F. Put a non-stick or cast-iron pan on the stove. </li>\n<li>Remove the noisettes from the marinade; you don't need to wipe then dry, just brush off the bits of onion. Sear each side for 1 to 2 minutes, then transfer to a baking pan and then to the preheated oven for 10 minutes. The meat should be right for pink, but not bloody, you may need a bit longer if the meat started off very cold. You will need to check for yourself and when cooked as you want, remove to a warmed plate. For the sauce, put the tahini in a bowl and add the garlic and salt. Stir with a wooden spoon, adding the lemon juice as you do; it will seize up here, but don't worry because it will loosen later. Slowly add some water ( I find I can use about 1/2 cup), pouring from the measuring cup so that only a little goes in at a time, and keep stirring. When you have a smooth mixture the consistency of heavy cream, stop adding water. Put into a bowl with a spoon and sprinkle with the additional ground cumin. For the spinach: Thaw it in the microwave according to the package's directions and then cook briefly to warm, about 1 minute more. </li>\n<li>Remove from the microwave and place onto a clean plate. </li>\n<li>Drizzle with the olive oil and then top with the toasted sesame seeds.</li>\n<li>Serve the lamb noisettes with the spinach and the garlicky tahini on the side.</li>\n</ol>\n</div>
91849	Lamb and Vegetable Curry	\N	\N	\N	https://spoonacular.com/recipeImages/lamb-and-vegetable-curry-2-91849.jpg	http://www.food.com/recipe/lamb-and-vegetable-curry-466164
98037	Bob's Sweet-and-Sour Grilled Jumbuck Ribs	\N	\N	\N	https://spoonacular.com/recipeImages/bobs-sweet-and-sour-grilled-jumbuck-ribs-2-98037.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat a cooker to medium to medium-high. Rub the ribs all over with the olive oil, then season with salt and pepper.</li>\n<li>To make the glaze, combine the pineapple juice, vinegar, and soy sauce in a small saucepan over medium heat. Cook until reduced by half, about 3 to 5 minutes. </li>\n<li>Add the ketchup, brown sugar, and ginger and simmer for 5 minutes. Stir in the lime juice, cilantro, and mint. </li>\n<li>Remove from the heat and set aside.</li>\n<li>Oil the grate and place the ribs on it bone side down over direct heat. Cook for 5 to 7 minutes, then turn and cook for 5 to 7 minutes more. Repeat the process for 40 to 45 minutes, or until the ribs are pull-apart tender. Move the ribs away from direct heat and glaze the bone side with sauce, then turn and glaze the meat side. Cook for 10 minutes. Repeat one or two more times, ifdesired.</li>\n\n<li>Transfer the ribs to a cutting board and let them rest, covered loosely with aluminum foil, for 10 to 15 minutes. </li>\n<li>Cut the ribs into individual pieces and serve.</li>\n<li>Reprinted with permission from America's Best Ribs Recipes by Ardie A. Davis and Chef Paul Kirk, © 2012 Andrews McMeel Publishing</li>\n</ol>\n</div>
98079	Spicy Orange Lamb and Noodle Stir-Fry	\N	\N	\N	https://spoonacular.com/recipeImages/spicy-orange-lamb-and-noodle-stir-fry-2-98079.jpg	http://www.food.com/recipe/spicy-orange-lamb-and-noodle-stir-fry-321466
98094	Turkish Lamb and Quince Stew (Avya Yahnisi)	\N	\N	\N	https://spoonacular.com/recipeImages/turkish-lamb-and-quince-stew-2-98094.jpg	http://www.food.com/recipe/turkish-lamb-and-quince-stew-avya-yahnisi-464778
98114	Moroccan Lamb	\N	\N	\N	https://spoonacular.com/recipeImages/moroccan-lamb-2-98114.jpg	http://www.food.com/recipe/moroccan-lamb-99655
213830	Fragrant lamb flatbreads	\N	\N	\N	https://spoonacular.com/recipeImages/Fragrant-lamb-flatbreads-213830.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oven to 220C/fan 200C/gas  Makethe bread mix following pack instructions,then divide into two and roll out into largeovals. </li>\n<li>Transfer to a large, floured baking sheet.In a bowl, combine the onion, lamb, garlic,spices and yogurt, and season. Crumble overthe dough almost to the edges, then scatterover the pine nuts. </li>\n<li>Bake for 15-18 mins untilthe bread is golden and crisp and the meatis browned. Sprinkle over the mint, thenserve with a green leaf and tomato salad.FOR THE DOUGH: </li>\n<li>Mix together the flour, salt, sugar and yeast. </li>\n<li>Add the water and mix to a soft dough. Knead for 2 minson a lightly floured surface, then roll out. </li>\n<li>Add the topping as above. Leave in a warm place to rise for 15 mins before serving.</li>\n</ol>\n</div>
34656	Corn, Cranberry Bean, And Fried-okra Salad	\N	\N	\N	https://spoonacular.com/recipeImages/corn-cranberry-bean-and-fried-okra-salad-2-34656.jpg	http://thebittenword.typepad.com/thebittenword/2009/08/corn-cranberry-bean-and-friedokra-salad.html
92065	Mongolian Lamb Chops	\N	\N	\N	https://spoonacular.com/recipeImages/mongolian-lamb-chops-2-92065.png	http://www.marthastewart.com/343411/mongolian-lamb-chops
97215	Spinning Grillers- Beef and Lamb Shawarma	\N	\N	\N	https://spoonacular.com/recipeImages/spinning-grillers-beef-and-lamb-shawarma-2-97215.jpg	http://www.food.com/recipe/spinning-grillers-beef-and-lamb-shawarma-457611
97109	Saag Gosh (Indian Lamb Stew)	\N	\N	\N	https://spoonacular.com/recipeImages/saag-gosh-2-97109.png	http://indian.food.com/recipe/saag-gosh-indian-lamb-stew-326201
16229	Mechoui Lamb With Carrot And Orange Salad	\N	\N	\N	https://spoonacular.com/recipeImages/mechoui_lamb_with_carrot_and_orange_salad-16229.jpg	http://www.jamieoliver.com/recipes/lamb-recipes/mechoui-lamb-with-carrot-orange-sala
98173	Lamb Kebabs With Coriander Yogurt Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/lamb-kebabs-with-coriander-yogurt-sauce-2-98173.jpg	http://www.food.com/recipe/lamb-kebabs-with-coriander-yogurt-sauce-233341
337917	Boxty with Seared Lamb Loin and Whole-Grain Mustard Aioli	\N	\N	\N	https://spoonacular.com/recipeImages/Boxty-with-Seared-Lamb-Loin-and-Whole-Grain-Mustard-Aioli-337917.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>For the boxty pancakes: Preheat the oven to 200 degrees F. Grate 5 of the potatoes on the largest holes of a box grater. Toss with the vinegar and squeeze out the excess water between paper towels.</li>\n<li>Cut the remaining 3 potatoes into 6 pieces each. </li>\n<li>Place them in a saucepan with the garlic and cover with water by about 1 inch, sprinkling generously with salt. Bring to a boil, reduce to a simmer and cook until the potatoes are fork tender, 10 to 12 minutes. </li>\n<li>Drain. While still hot, pass the potatoes through a food mill or mash with a potato masher.</li>\n<li>Combine the grated potatoes with the mashed potatoes. Beat the eggs and add into the potatoes. Sprinkle with salt.Coat a large saute or cast-iron pan with olive oil over medium-high heat. Make a 1 1/2-inch patty and cook until brown and crispy, 3 to 4 minutes per side. Eat the first pancake to make sure the potato mixture is seasoned perfectly. Season again, if needed.Working in batches, make and cook all the pancakes, blotting on paper towels and seasoning with salt. Hold the pancakes on a sheet tray in the oven to keep warm until serving.For the lamb loin with whole-grain mustard aioli: Sprinkle the lamb with salt and brush with whole-grain mustard. Coat a large saute pan with oil over medium-high heat. When the oil starts to shimmer, add the lamb and sear on all sides, being careful not to burn the brown bits on the bottom of the pan. Cook until a thermometer reads 135 degrees F when inserted into the thickest part of the loins. </li>\n<li>Transfer to a small sheet tray and tent with aluminum foil. Allow to rest at least 10 minutes.</li>\n<li>Combine the mustard, mayonnaise, chives and parsley in a medium glass mixing bowl.Thinly slice the lamb. </li>\n<li>Place a dollop of the aioli on top of the boxty, and top with a slice of lamb and another dollop of the aioli.</li>\n</ol>\n</div>
97310	Lamb Stew with Spinach and Garbanzo Beans	\N	\N	\N	https://spoonacular.com/recipeImages/lamb-stew-with-spinach-and-garbanzo-beans-2-97310.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Sprinkle lamb with salt, pepper, and garlic powder. </li>\n<li>Heat oil in heavy large pot over medium-high heat. </li>\n<li>Add lamb and sauté until brown, about 10 minutes. </li>\n<li>Add onion and carrots and sauté until beginning to brown, about 5 minutes. </li>\n<li>Add garbanzo beans, broth, tomato sauce, and lemon juice and bring to simmer. Reduce heat to medium-low, cover pot and simmer gently until lamb is tender, about 1 hour.</li>\n\n<li>Add spinach to stew. Cover and cook until spinach wilts, stirring often, about 8 minutes. Season stew with salt and pepper.  </li>\n<li>Serve with lemon wedges.</li>\n</ol>\n</div>
97339	Glens of Antrim Irish Stew	\N	\N	\N	https://spoonacular.com/recipeImages/glens-of-antrim-irish-stew-2-97339.jpg	http://www.food.com/recipe/glens-of-antrim-irish-stew-156664
16459	Spiced Braised Lamb with Carrots and Spinach	\N	\N	\N	https://spoonacular.com/recipeImages/spiced-braised-lamb-with-carrots-and-spinach-2-16459.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350°F.</li>\n<li>Pat lamb dry and sprinkle with pepper and 1 teaspoon salt. </li>\n<li>Heat 1 tablespoon oil in a 10-inch heavy skillet (preferably cast-iron) over moderately high heat until hot but not smoking, then brown lamb in 5 batches, turning occasionally, about 4 minutes per batch, adding more oil as needed. </li>\n<li>Transfer as browned to an ovenproof 6- to 7-quart wide heavy pot.</li>\n\n<li>Pour off all but 1 tablespoon fat from skillet, then cook onion and celery in remaining fat over moderate heat, stirring occasionally, until golden, about 3 minutes. </li>\n<li>Add garlic, cumin, and coriander and cook, stirring, 1 minute. </li>\n<li>Add 1 cup water and deglaze skillet by boiling, stirring and scraping up any brown bits, 1 minute, then pour mixture over lamb in pot.</li>\n\n<li>Pour juice from can of tomatoes into stew, then coarsely chop tomatoes and add to stew along with remaining cup water and remaining 1/2 teaspoon salt and bring to a boil (liquid should almost cover meat).</li>\n<li>Cover pot and braise lamb in middle of oven 1 1/2 hours. Stir in carrots and continue to braise until carrots and lamb are tender, 20 to 30 minutes. </li>\n<li>Transfer pot to top of stove and, working over moderately high heat, stir in spinach by handfuls to soften it. Cook, uncovered, stirring occasionally, until spinach is tender, 5 to 8 minutes. Season with salt and pepper.</li>\n</ol>\n<div class="subRecipeInstructionTitle">Cooks' note:</div>\n<ol>\n<li>• Braised lamb improves in flavor when made 1 day ahead. Prepare without spinach and cool, uncovered, then chill, covered. </li>\n<li>Remove any solidified fat before reheating and add spinach once stew is hot.</li>\n</ol>\n</div>
200786	Cook the Book: Lamb Korma in an Almond-Saffron Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Cook-the-Book--Lamb-Korma-in-an-Almond-Saffron-Sauce-200786.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Soak the almonds in 1/2 cup boiling water for 2 hours. </li>\n<li>Put the almonds, their soaking liquid, the ginger, and garlic into a blender and blend until smooth. </li>\n<li>2</li>\n\n<li>Pour the oil into a medium pan and set over medium-high heat. When hot, add the cinnamon, cardamom, cloves, and bay leaves and stir-fry them for 5 seconds. Put in half the meat and brown on all sides. </li>\n<li>Remove the meat with tongs and put in a bowl. Brown the remaining meat the same way. Now return the first batch of browned meat to the pan. </li>\n<li>Pour in the paste from the blender. </li>\n<li>Add the cayenne, salt, and saffron. Stir and bring to a simmer. Cover, turn heat to low, and simmer gently for 60 to 75 minutes or until the meat is tender. </li>\n<li>Add the cream and cook on medium-high heat for a few minutes so the sauce thickens.</li>\n</ol>\n</div>
541891	Moroccan Lamb Tagine with Fennel and Dates with Le Creuset	\N	\N	\N	https://spoonacular.com/recipeImages/Moroccan-Lamb-Tagine-with-Fennel-and-Dates-with-Le-Creuset-541891.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Trim coarse stalks from fennel, halve the bulb and remove any tough core. Thinly slice each half (a mandoline does this best).</li>\n<li>Heat 1 tablespoon of the oil in the tagine base. </li>\n<li>Add the onion, fennel slices and garlic and cook until all are just beginning to brown. </li>\n<li>Transfer to a plate and reserve.</li>\n<li>Add the remaining oil to the base and brown a few pieces of the lamb at a time, using tongs to turn the meat. Do this in batches, removing each batch to a plate when browned. When all of the meat is browned return the meat to the tagine base.</li>\n<li>Combine all of the spices and salt in a small bowl. Sprinkle over the meat and stir well. Continue to cook for 1 minute over medium heat.Return the vegetables, together with the dates and half of the water (1 cup), to the tagine base and stir well. Cover with conical lid and cook very gently over medium-low heat, stirring occasionally, for 2 to 2½ hours. The spices will thicken the liquid as the dish cooks. </li>\n<li>Add the remaining 1 cup of water little by little as necessary during the cooking process.Note: For maximum flavor, before cooking add ½ tablespoon of cumin seeds to the tagine base placed over low heat. Toss for about 2 minutes or until seeds darken slightly and become aromatic. </li>\n<li>Add them to a spice mill or mortar and pestle and grind them, then use in the recipe.</li>\n</ol>\n</div>
97539	Moroccan-Style Lamb	\N	\N	\N	https://spoonacular.com/recipeImages/moroccan-style-lamb-2-97539.jpg	http://www.food.com/recipe/moroccan-style-lamb-427228
97614	Bus Station Kefta With Egg and Tomato	\N	\N	\N	https://spoonacular.com/recipeImages/bus-station-kefta-with-egg-and-tomato-2-97614.png	http://www.food.com/recipe/bus-station-kefta-with-egg-and-tomato-211955
15725	Indian Braised Lamb	\N	\N	\N	https://spoonacular.com/recipeImages/indian-braised-lamb-2-15725.jpg	http://www.williams-sonoma.com/recipe/indian-braised-lamb.html
525822	Guiness Braised Lamb Shanks	\N	\N	\N	https://spoonacular.com/recipeImages/Guiness-Braised-Lamb-Shanks-525822.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Over high heat, add the oil to a large dutch oven.Salt and pepper the lamb shanks and set in the pot to sear for 2-3 minutes per side.</li>\n<li>Remove the lamb and add in the onions, carrots, celery and garlic.  Cook for 2-3 minutes until onions are translucent.</li>\n<li>Add in the flour and coat the vegetables.  </li>\n<li>Let cook for a 2-3 minutes more to toast the flour, stirring occasionally.</li>\n<li>Pour in the beer to deglaze the pot.</li>\n<li>Add in the red wine.  </li>\n<li>Add in beef broth until the liquid level is high enough to cover the meat about halfway.Drop in your tied herb bundle or chopped herbs.</li>\n<li>Place the meat back into the pot and cover tightly.Slide into a 325 degree oven for about 2 to 5 hours.  Meat is done when it is falling off the bone.</li>\n<li>Remove the lamb from the dutch oven and, if you used a tied herb bundle, pull it out at this time.Smooth out the sauce with an emulsifier.</li>\n<li>Add in the vinegar and season with salt and pepper to taste.</li>\n<li>Serve the gravy over the lamb with mashers, boxty, colcannon or the like.</li>\n</ol>\n</div>
97849	Aussie Lamb Sandwich / Souvlaki	\N	\N	\N	https://spoonacular.com/recipeImages/aussie-lamb-sandwich-_-souvlaki-2-97849.jpg	http://www.food.com/recipe/aussie-lamb-sandwich-souvlaki-207121
97852	Smoked Paprika Lamb With Eggplant Aioli	\N	\N	\N	https://spoonacular.com/recipeImages/smoked-paprika-lamb-with-eggplant-aioli-2-97852.jpg	http://www.food.com/recipe/smoked-paprika-lamb-with-eggplant-aioli-367131
97874	Skewered Coriander Lamb	\N	\N	\N	https://spoonacular.com/recipeImages/skewered-coriander-lamb-2-97874.jpg	http://www.food.com/recipe/skewered-coriander-lamb-232789
97908	Lamb and Pea Tagine	\N	\N	\N	https://spoonacular.com/recipeImages/lamb-and-pea-tagine-2-97908.jpg	http://www.food.com/recipe/lamb-and-pea-tagine-304008
97920	Moroccan Lamb Stew	\N	\N	\N	https://spoonacular.com/recipeImages/moroccan-lamb-stew-2-97920.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>•Season the lamb with the cinnamon, cloves and black pepper.•</li>\n<li>Heat the oil in an 6-quart saucepot over medium-high heat. </li>\n<li>Add the lamb in batches and cook until well browned, stirring often.  </li>\n<li>Remove the lamb from the saucepot.•Reduce the heat to medium. </li>\n<li>Add the onion to the saucepot and cook until tender-crisp, stirring occasionally. Return the lamb to the saucepot. Stir in the broth and heat to a boil.  Reduce the heat to low.  Cover and cook for 1 hour.•Stir in the lentils and potatoes. Cook for 20 minutes or until the lamb is cooked through and the lentils and potatoes are tender. </li>\n<li>Serve the lamb mixture over the couscous, if desired, and sprinkle with the cilantro.</li>\n</ol>\n</div>
16028	Braised Lamb Shoulder With Horseradish Jus And Minted Peas	\N	\N	\N	https://spoonacular.com/recipeImages/braised-lamb-shoulder-with-horseradish-jus-and-minted-peas-2-16028.jpg	http://www.food52.com/recipes/10830_braised_lamb_shoulder_with_horseradish_jus_and_minted_peas
220839	Lamb, coconut & mango pilau	\N	\N	\N	https://spoonacular.com/recipeImages/Lamb--coconut---mango-pilau-220839.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oven to 180C/fan 160C/gas  </li>\n<li>Heat the oil in a large, shallow ovenproof pan, tip in the lamb, then fry on a high heat for 5 mins until browned all over. Take out of the pan and set aside. Fry the onions in what’s left of the oil for 5 mins, until starting to soften and turn golden at the edges. Tip in the garlic and curry powder and fry for 1 min more until toasty and aromatic.Stir the lamb back in to the pan along with the chilli, coconut milk and stock, then bring to the boil. Cover the pan and place in the oven for 1 hr, until the lamb is completely tender. Alternatively, you can simmer the pan on a low heat for 1 hr on the hob.Season to taste, stir in the rice, re-cover pan, then return to the oven or hob for 30 mins until all the liquid has been absorbed. Take off the heat, leave to stand, covered, for 10 mins, then fluff the rice with a fork. Sprinkle with the mango, coriander and almonds, if using, then serve straight from the pan.</li>\n</ol>\n</div>
247521	Lamb Exohiko (Lamb, Spinach and Cheese Stuffed Phyllo Parcels)	\N	\N	\N	https://spoonacular.com/recipeImages/Lamb-Exohiko-(Lamb--Spinach-and-Cheese-Stuffed-Phyllo-Parcels)-247521.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oil in a pan over medium heat, add the spinach and garlic and cook until the spinach is wilted and most of the liquid has cooked off, about 3-5 minutes.</li>\n<li>Remove from heat, mix in the feta, green onions and dill, season with pepper and set aside.Return the pan to the heat, add the oil, onions and green pepper and saute until just tender, about 3-5 minutes and set aside.</li>\n<li>Brush a sheet of phyllo dough with butter followed by a second sheet and more butter.  </li>\n<li>Place 1/4 of each of the lamb, spinach, onions and peppers, tomato and cheese onto the phyllo dough, fold the dough up wrapping to cover and brush the top with more butter. Repeat three more times.</li>\n<li>Place the parcels on a baking sheet and bake in a preheated 350F oven until lightly golden brown on top, about 20-25 minutes.</li>\n</ol>\n</div>
96999	Algerian Lamb and Lentil Soup	\N	\N	\N	https://spoonacular.com/recipeImages/algerian-lamb-and-lentil-soup-2-96999.jpg	http://www.food.com/recipe/algerian-lamb-and-lentil-soup-233157
36615	A Glut Of Beans And A Cold Summers Evening, Comfort Food	\N	\N	\N	https://spoonacular.com/recipeImages/a-glut-of-beans-and-a-cold-summers-evening-comfort-food-2-36615.jpg	http://www.britishlarder.co.uk/a-glut-of-beans-and-a-cold-summers-evening-comfort-food/#axzz1SMG0fFUc
98084	Moroccan Lamb Fillet (Backstrap)	\N	\N	\N	https://spoonacular.com/recipeImages/moroccan-lamb-fillet-2-98084.jpg	http://www.food.com/recipe/moroccan-lamb-fillet-backstrap-378666
98110	Peas and Lamb, "bisila Bil La7ma Fil Forn"	\N	\N	\N	https://spoonacular.com/recipeImages/peas-and-lamb-bisila-bil-la7ma-fil-forn-2-98110.jpg	http://www.food.com/recipe/peas-and-lamb-bisila-bil-la7ma-fil-forn-207048
98123	Kashmiri Rogan Josh (Indian Mutton/ Lamb Curry)	\N	\N	\N	https://spoonacular.com/recipeImages/kashmiri_rogan_josh-98123.jpg	http://indian.food.com/recipe/kashmiri-rogan-josh-indian-mutton-lamb-curry-289652
207782	Lamb Stew with Lemon and Thyme	\N	\N	\N	https://spoonacular.com/recipeImages/Lamb-Stew-with-Lemon-and-Thyme-207782.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Dry lamb with paper towels. Toss lamb cubes with flour in medium-sized bowl. Shake off excess flour and set aside on a wire rack.</li>\n<li>2</li>\n\n<li>Pour oil into dutch oven set over medium-high heat. When oil is shimmering, add lamb. Cook lamb until browned on each side, about eight minutes total. </li>\n<li>Remove cubes and set aside.</li>\n<li>3</li>\n\n<li>Add shallots, leeks, garlic, and thyme to dutch oven. Cook, stirring often, until leeks are lightly browned, about four minutes.</li>\n<li>4</li>\n\n<li>Pour in stock, white wine, lemon juice, and lemon peels. Scrap any browned bits off bottom of Dutch oven with wooden spoon. Season with pinch of salt and pepper, and return lamb to dutch oven.</li>\n<li>5</li>\n<li>Turn heat to high and bring to boil. Reduce heat to low, and partially cover. Cook, stirring every five minutes or so, until lamb is very tender, 45 minutes to an hour.</li>\n<li>6</li>\n\n<li>Serve with chopped parsley. Season to taste with salt and pepper.</li>\n</ol>\n</div>
16359	Barbecued Pomegranate And Coriander Lamb Kebabs	\N	\N	\N	https://spoonacular.com/recipeImages/barbecued-pomegranate-and-coriander-lamb-kebabs-2-16359.jpg	http://www.britishlarder.co.uk/barbecued-pomegranate-and-coriander-lamb-kebabs/#axzz1SMG0fFUc
649184	Lamb and Apricot Tagine	\N	\N	\N	https://spoonacular.com/recipeImages/Lamb-and-Apricot-Tagine-649184.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Pour sufficient boiling water over the apricots to just cover them and leave to soak. </li>\n<li>Place the meat in a large heavy casserole or better still a tagine if you have one. Sprinkle over the spices, the grated onion and the butter cut into small pieces. </li>\n<li>Place the casserole over a low heat and cook for 5 minutes, stirring regularly, until the butter melts and the spices give off their scent - the meat should not brown. Tie the herbs together in a bunch and add them to the pot. </li>\n<li>Pour in just enough water to barely cover the meat. Bring to the boil then turn down the heat and leave to 2Now add the apricots to the tagine, together with their liquid and salt to taste. Cook for a further 30 minutes, until the apricots are plumped up.Now add the apricots to the tagine, together with their liquid and salt to taste. Cook for a further 30 minutes, until the apricots are plumped up.Taste to check the seasoning, remove the bunches of herbs and serve with flat bread.</li>\n</ol>\n</div>
517174	Slow Cooker Lamb Stroganoff	\N	\N	\N	https://spoonacular.com/recipeImages/Slow-Cooker-Lamb-Stroganoff-517174.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Trim fat from the meat.  In a large skillet, brown the lamb in hot oil over medium-high heat.  </li>\n<li>Drain off the fat.  In the insert of a slow cooker, combine the browned lamb, broth, mushrooms, onions, mustard, garlic, bay leaf, salt and pepper.  Cover and cook on low-heat setting for 6 to 8 hours or on high-heat setting for 3 to 4 hours.  In a medium bowl, whisk together the sour cream, flour and sherry until smooth.  Sir about 1/2 cup of the hot liquid into the sour cream mixture.  Return all to the slow cooker; stir to combine.  Cover and cook on high-heat setting for 30 minutes or until thickened and bubbly.  </li>\n<li>Remove and discard bay leaf.  Stir in parsley.  </li>\n<li>Serve over hot noodles.</li>\n</ol>\n</div>
97334	Dolma (Algerian Stuffed Vegetables)	\N	\N	\N	https://spoonacular.com/recipeImages/dolma-97334.jpg	http://www.food.com/recipe/dolma-algerian-stuffed-vegetables-183749
97349	Shorba Libiya - Libyan Lamb & Chickpea Soup	\N	\N	\N	https://spoonacular.com/recipeImages/shorba-libiya-libyan-lamb-amp-chickpea-soup-2-97349.jpg	http://www.food.com/recipe/shorba-libiya-libyan-lamb-chickpea-soup-385870
97385	Afghanistan: Kofta Challow	\N	\N	\N	https://spoonacular.com/recipeImages/afghanistan-kofta-challow-2-97385.jpg	http://www.food.com/recipe/afghanistan-kofta-challow-463812
97435	Persian Stew - Gormeh Sabzi	\N	\N	\N	https://spoonacular.com/recipeImages/persian-stew-gormeh-sabzi-2-97435.jpg	http://www.food.com/recipe/persian-stew-gormeh-sabzi-425696
144563	Sweet and Sour Kheema (mince)	\N	\N	\N	https://spoonacular.com/recipeImages/sweet-and-sour-kheema-2-144563.png	http://www.food.com/recipe/sweet-and-sour-kheema-mince-89792
203969	Stir-fried Tripe with Chili Bean Paste	\N	\N	\N	https://spoonacular.com/recipeImages/Stir-fried-Tripe-with-Chili-Bean-Paste-203969.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Combine tripe, onion, garlic, bay leaf, and wine in a large stockpot. Cover with cold water. Bring to a boil over high heat. Reduce to a simmer and cook uncovered until tripe is very tender, about three hours. </li>\n<li>Remove from heat and allow tripe to cool in liquid until cool enough to handle. </li>\n<li>Remove trip, dry carefully, and cut into strips 1/4-inch wide and 2-inches long.</li>\n<li>2</li>\n\n<li>Heat oil over medium-high heat in a wok until shimmering. </li>\n<li>Add 1/3 of tripe and cook, stirring frequently until browned and crispy around the edges, 5 to 7 minutes. </li>\n<li>Transfer tripe with tongs or slotted spoon to a paper towel-lined plate. Repeat with remaining two batches.</li>\n<li>3</li>\n\n<li>Pour off all but 1 tablespoon oil. Return wok to medium high heat until shimmering. </li>\n<li>Add chili bean paste and black beans and stir-fry until fragrant, about 20 seconds. </li>\n<li>Add scallions and cook, stirring constantly until fragrant, about 30 seconds longer.</li>\n<li>4</li>\n\n<li>Add sichuan peppercorns and chilis (if using), then add tripe. Toss to mix ingredients, then immediately add soy sauce and the wine to the wok and stir-fry for 10 seconds longer.   </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
97490	Lamb, Artichoke and Tomato Stew	\N	\N	\N	https://spoonacular.com/recipeImages/lamb-artichoke-and-tomato-stew-2-97490.jpg	http://www.food.com/recipe/lamb-artichoke-and-tomato-stew-47356
498917	Seared Lamb with Garlic and Black Pepper	\N	\N	\N	https://spoonacular.com/recipeImages/Seared-Lamb-with-Garlic-and-Black-Pepper-498917.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
22811	Rare Roast Lamb And Lebanese Cucumber Delights	\N	\N	\N	https://spoonacular.com/recipeImages/rare-roast-lamb-and-lebanese-cucumber-delights-2-22811.jpg	http://www.britishlarder.co.uk/rare-roast-lamb-and-lebanese-cucumber-delights/#axzz1SMG0fFUc
97598	Rice With Lentils and Dates	\N	\N	\N	https://spoonacular.com/recipeImages/rice-with-lentils-and-dates-2-97598.jpg	http://www.food.com/recipe/rice-with-lentils-and-dates-232781
155969	Moroccan Lamb with Tabbouleh and Crispy Garlic	\N	\N	\N	https://spoonacular.com/recipeImages/moroccan-lamb-with-tabbouleh-and-crispy-garlic-155969.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add the bulgur to a large pot of lightly salted boiling water. Reduce the heat and simmer the bulgur for 10 to 12 minutes or until just tender. </li>\n<li>Drain the bulgur in a colander. Allow to cool and then transfer to a small shallow bowl.</li>\n\n<li>Add the lemon juice, parsley, tomato, and 1 tablespoon of the olive oil and toss until all the grains are coated with the dressing. Season to taste with salt and pepper. Cover and refrigerate.</li>\n<li>Preheat the oven to 350°F.</li>\n\n<li>Heat the remaining 1 tablespoon olive oil in a medium-sized, heavy-bottomed casserole or Dutch oven over medium-high heat. When the oil is almost smoking, add the lamb and sear for 8 to 12minutes or until nicely browned on all sides.</li>\n<li>While the lamb is browning, add the onions, carrots, and celery to the pan along with the thyme. Stir the vegetables occasionally.</li>\n\n<li>Add the red wine and cook until reduced to a few tablespoons. </li>\n<li>Add enough water to cover the lamb and bring to a boil, stirring the bottom of the pan with a wooden spoon to dissolve any browned solids into the liquid.</li>\n\n<li>Remove from the heat and cover the casserole with a tight-fitting lid. </li>\n<li>Place in the center of the oven and cook for 1 hour or until the meat is tender and almost falling off the bone. Set aside and allow to cool. When cool, refrigerate the lamb until serving. Discard the vegetables and herbs.</li>\n\n<li>Pour the vegetable oil into a small, deep saucepan to a depth of 1H inches. </li>\n<li>Heat over medium heat until a deep-frying thermometer registers 325°F.</li>\n<li>Fry the garlic slices in the oil for 1 to 2 minutes or until they turn golden. Watch carefully because they fry very quickly. </li>\n<li>Remove from the oil with a slotted spoon to a paper towel to drain. </li>\n<li>Transfer to a flat plate, season with salt, and allow to cool completely. As they cool, the fried garlic slices will become very crispy.</li>\n<li>To serve, pull or cut the meat from the bone and cut into small pieces. </li>\n<li>Place some of the tabbouleh on each of 6 small plates along with some of the lamb. Top each serving with crispy garlic.</li>\n<li>Per serving: 0 calories, 0 calories from fat, 0g total fat, 5g saturated fat, 0mg cholesterol, 0mg sodium, 0g total carbs, 0g dietary fiber, 0g sugars, 0g protein</li>\n<li>Nutritional analysis provided by</li>\n<li>Taste</li>\n<li>Book, using the USDA Nutrition Database</li>\n<li>add notes    my notes</li>\n<li>edit my notes</li>\n<li>done</li>\n<li>Reviews</li>\n<li>write your own review</li>\n<li>Can you believe no one has reviewed this recipe yet? Insightful and well-informed reviews by our members are part of what makes Epicurious the best food site on the planet. Sign in to be the first to review this recipe, and make your opinion heard.</li>\n<li>by {{= reviewer</li>\n<li>Info }} on {{= date }}</li>\n<li>recipe at a glance</li>\n</ol>\n<div class="subRecipeInstructionTitle">main ingredients:</div>\n<ol>\n<li>Bulgur,</li>\n<li>Lamb Shank,</li>\n<li>Garlic</li>\n</ol>\n<div class="subRecipeInstructionTitle">cuisine:</div>\n<ol>\n<li>Moroccan</li>\n</ol>\n<div class="subRecipeInstructionTitle">holiday/celebration:</div>\n<ol>\n<li>Winter</li>\n<li>{{ _.each(items, function(item) { }}</li>\n<li>{{= item.title }}</li>\n<li>{{ }); }}</li>\n<li>More Recipes from Bon Appétit</li>\n<li>related recipes</li>\n<li>toggle</li>\n<li>previous</li>\n<li>Chicken Breasts with Sun-Dried Tomato and Garlic Crust</li>\n<li>saved</li>\n<li>Oven-Roasted Turkey Roulade</li>\n<li>saved</li>\n<li>Herb and Garlic-Crusted Beef Tenderloin with Red and Yellow Pepper Relish</li>\n<li>saved</li>\n<li>Moroccan Chicken with Preserved Meyer Lemons and Green Olives</li>\n<li>saved</li>\n<li>Tomato and Mozzarella Lasagne</li>\n<li>saved</li>\n<li>Broiled Red Snapper with Tamarind Sauce</li>\n<li>saved</li>\n<li>Grilled Charmoula Lamb Chops</li>\n<li>saved</li>\n<li>Coriander Pork Tenderloin with Carrot-Ginger Sauce</li>\n<li>saved</li>\n<li>Roast Cornish Game Hen with Spicy Fruit Salsa</li>\n<li>saved</li>\n<li>Coriander-and-Chile-Rubbed Lamb Chops</li>\n<li>saved</li>\n<li>next</li>\n<li>go to my recipe box</li>\n</ol>\n</div>
48754	Slow-cooker Lamb, Apricot, And Olive Tagine	\N	\N	\N	https://spoonacular.com/recipeImages/slow-cooker_lamb_apricot_and_olive_tagine-48754.jpg	http://www.realsimple.com/food-recipes/browse-all-recipes/lamb-tagine-recipe-00100000074132/index.html
97959	Lamb and Vegetable Casserole	\N	\N	\N	https://spoonacular.com/recipeImages/lamb-and-vegetable-casserole-2-97959.jpg	http://www.food.com/recipe/lamb-and-vegetable-casserole-13028
35604	Chocolate & Peanut Butter Dipped Apples	\N	\N	\N	https://spoonacular.com/recipeImages/chocolate-peanut-butter-dipped-apples-2-35604.jpg	http://www.hersheys.com/recipes/3382/Chocolate-%26-Peanut-Butter-Dipped-Apples.aspx
322946	Spicy Lamb and Mint Sausage	\N	\N	\N	https://spoonacular.com/recipeImages/Spicy-Lamb-and-Mint-Sausage-322946.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine the lamb, pork fatback, mint, chipotles, chives, black pepper, orange zest and 2 tablespoons salt in a bowl. </li>\n<li>Transfer to a large plastic zip-top bag and refrigerate overnight.At least 30 minutes before grinding the meat, place all of your tools (including the meat grinder parts, stand mixer bowl, stand mixer paddle attachment and sausage stuffer parts) in the freezer to chill.Using your meat grinder, grind the marinated meat mixture through the small die plate into the chilled bowl of the stand mixer. Refrigerate at least 30 minutes, then return the mixture to the mixer. </li>\n<li>Add the milk and wine and beat on medium speed using the chilled paddle attachment until combined. Refrigerate until ready to use.Stuff the sausages and, for best results, refrigerate overnight.Before cooking, pierce each sausage several times with a pin. Grill over medium heat until the center registers 160 degrees F, 10 to 12 minutes. (You can also pan-fry or broil the sausages.) Slice the sausages lengthwise and serve on a split toasted baguette with crumbled feta and roasted peppers.Photograph by Kat Teutsch</li>\n</ol>\n</div>
97694	Mediterranean Lamb on Chickpea and Tomato Salad	\N	\N	\N	https://spoonacular.com/recipeImages/mediterranean-lamb-on-chickpea-and-tomato-salad-2-97694.jpg	http://www.food.com/recipe/mediterranean-lamb-on-chickpea-and-tomato-salad-122875
93673	Granny Glen's Scotch Broth	\N	\N	\N	https://spoonacular.com/recipeImages/granny-glens-scotch-broth-2-93673.jpg	http://www.food.com/recipe/granny-glens-scotch-broth-429476
582163	Bell Peppers Stuffed with Freekeh and Lamb	\N	\N	\N	https://spoonacular.com/recipeImages/Bell-Peppers-Stuffed-with-Freekeh-and-Lamb-582163.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat 4 tbsp olive oil in a pot and saute onion in it.</li>\n<li>Add in chopped lamb and cover the pot. Cook it over medium low heat until lamb pieces release juice.</li>\n<li>Add in washed spelt and chopped tomato, stir. </li>\n<li>Pour ¼ cup hot water and cook until all water is absorbed. It will not be completely cooked, just a little tender.</li>\n<li>Add in chopped greens and spices and take it from stove.Stuff peppers with spelt mixture and place them in a large pot. </li>\n<li>Drizzle 1 tbsp olive oil over them.</li>\n<li>Pour 1 cup hot water in the pot and cook over medium low heat for about 30 minutes.Preheat oven at 200C.</li>\n<li>Transfer stuffed peppers into a baking dish and cook them until their tops are a little burned.</li>\n</ol>\n</div>
520854	Braised lamb with chilies, crushed pineapple, lemongrass and ginger	\N	\N	\N	https://spoonacular.com/recipeImages/Braised-lamb-with-chilies--crushed-pineapple--lemongrass-and-ginger-520854.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking oil in a pot.</li>\n<li>Saute the lemongrass, ginger and chilies just until fragrant.</li>\n<li>Add the lamb cubes. Cook over high heat, stirring occasionally, until nicely seared on all sides.</li>\n<li>Add the crushed pineapple, tomatoes and pineapple syrup.Season with salt, pepper and sugar.Bring to the boil, lower the heat, cover and simmer for 45 minutes to an hour, or until the lamb is tender. If the liquid dries up before the lamb is done, add water, no more than a quarter cup at a time.When the lamb is done, uncover the pot, turn up the heat and cook the mixture until almost dry.Scoop the lamb mixture onto a platter. Top with the fried onion slices, onion leaves, sliced chili and cilantro. </li>\n<li>Serve hot.</li>\n</ol>\n</div>
206488	Warm Lamb Salad with Pomegranate	\N	\N	\N	https://spoonacular.com/recipeImages/Warm-Lamb-Salad-with-Pomegranate-206488.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Preheat the oven to 325°F.</li>\n<li>2</li>\n\n<li>Heat a large ovenproof pot over medium heat. </li>\n<li>Add the lamb and brown ion all sides, 6 to 8 minutes total. </li>\n<li>Transfer the lamb to a platter. </li>\n<li>Add the shallots and garlic to the pot and cook, stirring, until they are soft and golden brown, about 4 minutes. </li>\n<li>Add a pinch of salt to the pot, then pour in the stock and bring the mixture to a boil. Return the lamb to the pot, cover, and transfer to the oven.</li>\n<li>3</li>\n<li>Roast the lamb for about 5 hours, until the lamb is literally falling apart. Take the lamb out of the oven and let it cool in the pot. </li>\n<li>4</li>\n<li>About an hour before you want to eat, take the lamb out of the pot. </li>\n<li>Cut and remove the twine. </li>\n<li>Remove as much of the fat as possible and shred the meat into uniform pieces with two forks.</li>\n<li>5</li>\n\n<li>Put the arugula on a platter and put the shredded lamb on top. Sprinkle with sea salt and the chopped mint. </li>\n<li>Cut the pomegranate in half. Hold one pomegranate half above the plate and hit the back of it with a wooden spoon to knock out the seeds.</li>\n<li>6</li>\n<li>Take the other half of the pomegranate and squeeze its juice over the salad. If you want a juicier, stronger, fruitier salad, add a couple of tablespoons of pomegranate molasses. Scatter the toasted pine nuts and feta cheese over the top, if desired. </li>\n<li>7</li>\n\n<li>Serve the salad while the lamb is still warm (cold lamb fat congeals unappetizingly), with warmed pita on the side.</li>\n</ol>\n</div>
92860	Croatian Lamb/Mutton Chowder (Ajngemahtes)	\N	\N	\N	https://spoonacular.com/recipeImages/croatian-lamb_mutton-chowder-2-92860.jpg	http://www.food.com/recipe/croatian-lamb-mutton-chowder-ajngemahtes-252630
97004	Grecian Lamb With Vegetables	\N	\N	\N	https://spoonacular.com/recipeImages/grecian-lamb-with-vegetables-2-97004.jpg	http://www.food.com/recipe/grecian-lamb-with-vegetables-89997
71493	Lamb Pot Pies With Peas And Mint	\N	\N	\N	https://spoonacular.com/recipeImages/lamb-pot-pies-with-peas-and-mint-2-71493.jpg	http://souvlakiforthesoul.com/lamb-pot-pies-with-peas-and-mint
188240	Slow-Cooked Lamb with Sage and Pearl Barley	\N	\N	\N	https://spoonacular.com/recipeImages/Slow-Cooked-Lamb-with-Sage-and-Pearl-Barley-188240.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Trim the fat from 1 shoulder of young lamb. Peel, wash, and thinly slice 4 carrots and 2 stalks of celery. Peel 4 red onions and cut into small wedges.</li>\n<li>Cook the shoulder of lamb</li>\n<li>Preheat the oven to 300°F. </li>\n<li>Heat a flameproof casserole dish with a splash of olive oil and brown the shoulder on all sides. Take it out, throw away the cooking fat, wipe the casserole dish clean, and put it back on the heat with an additional splash of olive oil.</li>\n<li>Put in half the vegetables and sweat for 2 to 3 minutes, stirring. </li>\n<li>Add 3 squashed garlic cloves, 12 sage leaves, and 8 peppercorns, mix well, and return the shoulder of lamb to the casserole dish.</li>\n\n<li>Pour in 1 1/4 cups of red wine and reduce by half. Then add 1 1/4 cups of chicken stock, cover the casserole dish with a lid, and put in the oven for 2 1/2 hours, basting the shoulder from time to time.</li>\n<li>Take out the casserole dish. </li>\n<li>Remove the shoulder, wrap it in aluminium foil, and keep warm. Keep the casserole dish on hand.</li>\n<li>Prepare the pearl barley</li>\n<li>Shortly before the end of cooking the lamb, put 3/4 cup of pearl barley to soak for 10 minutes.</li>\n\n<li>Heat another casserole dish with a splash of olive oil, put in the rest of the vegetables, and cook for 2 minutes, stirring. </li>\n<li>Drain the pearl barley and add to the vegetables. Stir, season with salt, and cook for 1 to 2 minutes.</li>\n<li>Take a ladleful of the cooking liquid from the lamb casserole dish and pour it into the barley casserole dish. </li>\n<li>Let it swell with the liquid and cook for 15 to 18 minutes, adding more of the liquid as and when it is absorbed.</li>\n<li>Peel 12 fresh almonds and add them at the end of cooking with a splash of olive oil. Stir and check the seasoning.</li>\n<li>To finish your dish</li>\n\n<li>Cut the shoulder into large pieces and return them to their casserole dish. </li>\n<li>Add the contents of the other casserole dish and a generous twist of freshly ground black pepper and serve in the casserole dish.</li>\n<li>Reprinted with permission from Nature: Simple, Healthy, and Good by Alain Ducasse, © 2009 Rizzoli International Publications, Inc.</li>\n</ol>\n</div>
321361	Indian Style Lamb Curry	\N	\N	\N	https://spoonacular.com/recipeImages/Indian-Style-Lamb-Curry-321361.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Chef's Note: You can replace the turmeric and masala powder with curry powder</li>\n<li>In a large cooking pot, heat the oil and add the chopped onions, frying until golden brown. Stir in the turmeric and masala powder (or curry powder), garlic and chiles, mix well and cook for a couple of minutes to integrate flavors. </li>\n<li>Add the lamb and sear on all sides. Sprinkle the flour over the meat using a sifting motion, spoon in tomato paste, then gradually add the stock (or water) stirring constantly while doing so. Reduce the heat, cover and simmer over low heat until meat is tender, about 1 hour. Check the pot often and stir so the curry doesn't burn. If the sauce is thickening too fast during this cooking time, add water to retain the consistency and to prevent burning. (If you prefer, once you have added the stock or water and the sauce is a good smooth consistency, you may transfer to a covered roasting pan and finish in the oven at 350 degrees F until the meat is tender.) In the last 30 minutes of cooking time, stir in the potatoes.While the lamb curry is in its last 1/2 hour, bring 5 cups of water to a boil, add rice and salt, reduce heat, cover and cook until tender, about 20 minutes. </li>\n<li>Remove from heat and let sit 5 minutes.Spoon rice onto serving plate, top with lamb curry and garnish with fresh cilantro.</li>\n</ol>\n</div>
98159	Afghanistan: Kabuli Pulao	\N	\N	\N	https://spoonacular.com/recipeImages/afghanistan-kabuli-pulao-2-98159.jpg	http://www.food.com/recipe/afghanistan-kabuli-pulao-463813
205788	Sunday Supper: Lancashire Hotpot	\N	\N	\N	https://spoonacular.com/recipeImages/Sunday-Supper--Lancashire-Hotpot-205788.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Dust kidneys with flour.  Melt butter in large skillet, then fry kidneys until browned, about 2 minutes per side.  Once kidneys are brown, remove from pan and add a large swirl of vegetable oil; sear stewing meat in batches until brown on all sides and reserve.  </li>\n<li>Add garlic, carrot, celery, onion and thyme to the pan, and cook until vegetables begin soften, scarping brown bits from bottom of the pan, about 6 minutes.  </li>\n<li>Add beef stock and bring to a simmer, then turn to low while you prepare baking dish.</li>\n<li>2</li>\n<li>Preheat oven to 350°F.  </li>\n<li>Place half the potatoes in an overlapping pattern on the bottom of a large ovenproof baking dish with a tight fitting lid.  </li>\n<li>Pour stew over the potatoes, and top with the rest of the sliced potatoes in an overlapping pattern.  Cover with lid and place in the oven until potatoes are soft, about 1 hour.  </li>\n<li>Remove from oven and dot with bits of butter.  Turn oven to broil and brown potatoes until deep golden; allow to rest for 10 minutes before serving.  </li>\n<li>Garnish with chopped parsley and serve with a large glass of brown ale.</li>\n</ol>\n</div>
97270	Lamb Pie and Mustard Thatch	\N	\N	\N	https://spoonacular.com/recipeImages/lamb-pie-and-mustard-thatch-2-97270.jpg	http://www.food.com/recipe/lamb-pie-and-mustard-thatch-447183
51195	Crispy Stuffed Lamb Belly With Blood Orange Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/crispy_stuffed_lamb_belly_with_blood_orange_sauce-51195.jpg	http://www.food52.com/recipes/3526_crispy_stuffed_lamb_belly_with_blood_orange_sauce
8269	Grilled Lamb Chops With Meyer Lemon Risotto And Arugula	\N	\N	\N	https://spoonacular.com/recipeImages/grilled_lamb_chops_with_meyer_lemon_risotto_and_arugula-8269.jpg	http://www.pipandebby.com/pip-ebby/2012/3/19/grilled-lamb-chops-with-meyer-lemon-risotto-and-arugulaand-a.html
185480	Lamb and Broccoli Stew	\N	\N	\N	https://spoonacular.com/recipeImages/Lamb-and-Broccoli-Stew-185480.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n\n<div class="subRecipeInstructionTitle">For lamb:</div>\n<ol>\n\n<li>Whisk sugar, 3/4 cup salt, and 10 cupswater in a large bowl until salt and sugardissolve. </li>\n<li>Add lamb, cover, and chill for atleast 12 hours and up to 2 days.</li>\n\n<li>Heat oil in a large heavy pot over medium-highheat. </li>\n<li>Add onions, garlic, rosemarysprig, thyme sprig, and bay leaf. Cook,stirring often, until onions are golden brownand soft, 10-15 minutes. </li>\n<li>Remove pot fromheat and add wine, stirring and scrapingup any browned bits from bottom of pan.Return pot to heat and simmer until wineis reduced by half, about 3 minutes.</li>\n\n<li>Remove lamb shoulder from brine; add topot, along with broth. Bring to a boil. Reduceheat; simmer gently, partially covered andskimming fat occasionally, until lamb is fork-tender,5-6 hours.</li>\n\n<li>Transfer lamb to a platter and removebones. </li>\n<li>Cut or shred meat into bite-sizepieces. If needed, boil cooking liquid in potuntil reduced to 6 cups, 15-30 minutes.Season sauce with salt, if needed. Returnlamb to pot. DO AHEAD: Lamb can beprepared 3 days ahead. </li>\n<li>Let cool slightly,then chill until cold. Cover and keep chilled.Discard fat and reheat before serving.</li>\n</ol>\n<div class="subRecipeInstructionTitle">For garlic emulsion and garnish:</div>\n<ol>\n\n<li>Place eggs in a small saucepan and add water tocover by 1". Bring to a boil and remove fromheat. Cover and let sit for 3 minutes.</li>\n<li>Transfer eggs to a bowl of ice water andlet cool completely. Peel.</li>\n\n<li>Combine eggs, garlic, 3 tablespoons lemonjuice, and 1/2 teaspoons salt in a blender. With themotor running, gradually add oil, blendinguntil a creamy sauce forms. Season garlicemulsion with salt and more lemon juice, ifdesired.</li>\n<li>Cook broccoli in a large pot of boilingsalted water until crisp-tender, about4 minutes. </li>\n<li>Drain; rinse under cold water.</li>\n<li>Divide stew among bowls and garnishwith broccoli, parsley, tarragon, and garlicemulsion.</li>\n</ol>\n</div>
149673	Moroccan Lamb Tagine with Raisins, Almonds, and Honey	\N	\N	\N	https://spoonacular.com/recipeImages/moroccan-lamb-tagine-with-raisins--almonds--and-honey-149673.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Whisk together ras-el-hanout, salt, pepper, ginger, saffron, and 1 cup water in a 5-quart heavy pot. Stir in lamb, remaining 2 cups water, onion, garlic, cinnamon sticks, and butter and simmer, covered, until lamb is just tender, about 1 1/2 hours.</li>\n<li>Stir in raisins, almonds, honey, and ground cinnamon and simmer, covered, until meat is very tender, about 30 minutes more.</li>\n<li>Uncover pot and cook over moderately high heat, stirring occasionally, until stew is slightly thickened, about 15 minutes more.</li>\n</ol>\n<div class="subRecipeInstructionTitle">Cooks' note:</div>\n<ol>\n<li>•Tagine can be made 1 day ahead and cooled, uncovered, then chilled, covered.*Available at specialty foods shops and Kalustyan's (800-352-.</li>\n</ol>\n</div>
649403	Lebanese Kibbeh	\N	\N	\N	https://spoonacular.com/recipeImages/Lebanese-Kibbeh-649403.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 375F degrees. Rinse the bulgur wheat in a sieve and squeeze out the excess moisture. </li>\n<li>Mix the lamb, onion and seasoning, kneading the mixture to make a thick paste. </li>\n<li>Add the bulgur wheat and blend together. To make the filling, heat the oil in a frying pan and fry the onion until golden. </li>\n<li>Add the lamb or veal and cook, stirring, until evenly browned and then add the pine nuts, allspice and salt and pepper. Oil a large baking dish and spread half of the meat and bulgur wheat mixture over the bottom. Spoon over the filling and top with a second layer of meat and bulgur wheat, pressing down firmly with the back of a spoon. </li>\n<li>Pour the melted butter over the top and then bake on the oven for 40-45 minutes until browned on top. Meanwhile make the yogurt dip: Blend together the yogurt and garlic, spoon into a serving bowl and sprinkle with the chopped mint. </li>\n<li>Cut the cooked kibbeh into squares or rectangles and serve garnished with mint and accompanied by rice and the yogurt dip. NOTES The national dish of Syria and the Lebanon in Kibbeh, as kind of meatball made from minced lamp and bulgur wheat. Raw kibbeh is the most widely eaten type, but this version is very popular too.</li>\n</ol>\n</div>
618731	Shredded Lamb Tacos with Orange Salsa	\N	\N	\N	https://spoonacular.com/recipeImages/Shredded-Lamb-Tacos-with-Orange-Salsa-618731.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a crock pot set to high.</li>\n<li>Mix together the softened Butter with all the spices from Salt, Pepper, Garlic, Paprika, Rosemary, Thyme, Cumin and Coriander. Blend until smooth.Rub the boneless Lamb shoulder with Butter blend and coat well.In the bottom of the crock pot, add the water and sliced onions then place the Butter coated Lamb on top. Cover with lid and cook on high for 4 - 6 hours or until the meat is tender and pulls apart easily with a fork.Once tender, remove meat form crock pot (reserving liquid) and place meat on chopping board and shred with a fork. </li>\n<li>Remove the onions from liquid and mix back into shredded lamb with a tablespoon or two of the liquid.Warm the flatbread or tortilla shells and add the shredded Lamb and onion mixture, Yogurt, Orange Salsa and Pomogranate Seeds.</li>\n</ol>\n</div>
97508	Grilled Cumin-Lamb Pitas with Couscous and Yogurt	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-cumin-lamb-pitas-with-couscous-and-yogurt-2-97508.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Set strainer over large bowl. Line strainer with 2 layers of cheesecloth (do not let strainer touch bottom of bowl). Spoon yogurt into strainer. </li>\n<li>Let stand at room temperature 1 hour (liquid will drain out and yogurt will thicken; discard liquid). </li>\n<li>Mix yogurt, garlic and lemon juice in small bowl. Season to taste with salt.</li>\n<li>Rub cumin and coriander over lamb pieces. Thread lamb onto 6 metal skewers. (Yogurt and lamb can be prepared 4 hours ahead. Cover separately and chill.)</li>\n\n<li>Combine 1 cup water and 1/4 teaspoon salt in medium saucepan. Bring to boil. </li>\n<li>Add couscous. </li>\n<li>Remove from heat. Cover; let stand until liquid is absorbed, about 5 minutes. </li>\n<li>Transfer couscous to large bowl; fluff with fork. Cool to room temperature. Stir in chopped cucumber, tomato, onion, olive oil and fresh dill. Season with salt and pepper.</li>\n<li>Prepare barbecue (medium-high heat). Grill lamb to desired doneness, turning frequently, about 10 minutes for medium-rare. </li>\n<li>Transfer to platter. Sprinkle with salt. Grill pitas until heated through and lightly toasted, about 1 minute per side.</li>\n\n<li>Place 1 pita on each of 6 plates. </li>\n<li>Spread yogurt mixture evenly over pitas. Spoon couscous down center of pitas. Slide lamb off skewers onto couscous.</li>\n</ol>\n</div>
97561	Lamb and Chickpea Stew	\N	\N	\N	https://spoonacular.com/recipeImages/lamb-and-chickpea-stew-2-97561.jpg	http://www.food.com/recipe/lamb-and-chickpea-stew-74686
97576	Lamb Tagine with Prunes and Cinnamon	\N	\N	\N	https://spoonacular.com/recipeImages/lamb-tagine-with-prunes-and-cinnamon-2-97576.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Toss together lamb, onion, 3 tablespoons oil, spices (except saffron), 1 teaspoon salt, and 1/2 teaspoon pepper in a 5- to 6-quart heavy pot.</li>\n<li>Lightly toast saffron in a dry small skillet (not nonstick) over medium heat until just fragrant, 15 to 30 seconds. Crumble into wine and let stand 1 minute. </li>\n<li>Add wine to pot, then add enough water to just cover lamb. Gently simmer, partially covered, stirring occasionally, 1 1/2 hours.</li>\n<li>Stir in prunes and honey and simmer until meat is tender and sauce has thickened, 15 to 20 minutes. Season with salt.</li>\n<li>Toast sesame seeds in dry small skillet over medium heat, stirring, until pale golden, then transfer to a small bowl.</li>\n\n<li>Heat remaining 1/4 cup oil in same skillet over medium-high heat until it shimmers, then fry almonds until golden. </li>\n<li>Drain on paper towels. </li>\n<li>Serve tagine sprinkled with sesame seeds and almonds.</li>\n</ol>\n<div class="subRecipeInstructionTitle">Cooks' note:</div>\n<ol>\n<li>Tagine can be cooked 1 day ahead and chilled (covered once cool). Reheat gently, thinning with water if needed.</li>\n</ol>\n</div>
97632	Mongolian Lamb Casserole With Couscous	\N	\N	\N	https://spoonacular.com/recipeImages/mongolian-lamb-casserole-with-couscous-2-97632.jpg	http://www.food.com/recipe/mongolian-lamb-casserole-with-couscous-268106
30052	Kokkari Restaurant, San Francisco Grilled Lamb Chops And Roaste	\N	\N	\N	https://spoonacular.com/recipeImages/kokkari-restaurant-san-francisco-grilled-lamb-chops-and-roaste-2-30052.jpg	http://cristinaferrarecooks.com/2011/11/kokkari-restaurant-san-francisco-grilled-lamb-chops-and-roasted-potatoes/
97686	Moroccan Tagine Berber	\N	\N	\N	https://spoonacular.com/recipeImages/moroccan_tagine_berber-97686.jpg	http://www.food.com/recipe/moroccan-tagine-berber-169960
97728	Paprika Spiced Lamb (New Zealand)	\N	\N	\N	https://spoonacular.com/recipeImages/paprika-spiced-lamb-2-97728.png	http://www.food.com/recipe/paprika-spiced-lamb-new-zealand-170486
97742	Lamb Curry With Fragrant Rice and Raita	\N	\N	\N	https://spoonacular.com/recipeImages/lamb-curry-with-fragrant-rice-and-raita-2-97742.jpg	http://www.food.com/recipe/lamb-curry-with-fragrant-rice-and-raita-264436
3586	Pan Seared Fish With Chermoula Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/pan_seared_fish_with_chermoula_sauce-3586.jpg	http://bijouxs.com/2012/09/09/pan-seared-fish-with-chermoula-sauce/
207390	Cook the Book: Maharashtran Lamb Curry	\N	\N	\N	https://spoonacular.com/recipeImages/Cook-the-Book--Maharashtran-Lamb-Curry-207390.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Using a blender, make a smooth paste of the ginger and garlic with a little water.</li>\n<li>2</li>\n\n<li>Heat the oil in a nonstick saucepan, add the onion and cook until golden. </li>\n<li>Remove half and reserve. </li>\n<li>Add the poppy seeds and unsweetened dried coconut flakes to the pan and continue cooking until golden. </li>\n<li>Scrape into a blender and blend to a fine paste, adding a little water to help, then set aside.</li>\n<li>3</li>\n<li>Spoon the reserved onions back into the pan, reheat and add the ginger and garlic paste. Cook until golden brown, around 2–3 minutes. </li>\n<li>Add the lamb and brown evenly, stirring often, around 4 minutes. Stir in the salt and spices and cook for 1 minute, stirring constantly.</li>\n<li>4</li>\n\n<li>Add the coconut milk, tamarind paste and the onion and poppy seed paste along with a good splash of water. Bring to the boil, then cover and simmer for 5 minutes. The gravy should be creamy, not too thick or thin. Taste and adjust the seasoning, stir in the cilantro and serve.</li>\n</ol>\n</div>
222818	Moroccan lamb with apricots, almonds & mint	\N	\N	\N	https://spoonacular.com/recipeImages/Moroccan-lamb-with-apricots--almonds---mint-222818.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oil in a largeflameproof casserole. </li>\n<li>Addthe lamb and cook over amedium-high heat for 3-4minutes until evenlybrowned, stirring often.</li>\n<li>Remove the lamb to a plate,using a slotted spoon.Stir the onion and garlicinto the casserole and cookgently for 5 minutes untilsoftened. Return the lamb tothe pot. </li>\n<li>Add the stock, zestand juice, cinnamon, honeyand salt and pepper. Bringto the boil then reduce theheat, cover and cook gentlyfor 1 hour.</li>\n<li>Add the apricots andtwo-thirds of the mint andcook for 30 minutes untilthe lambis tender. Stir in the groundalmonds to thicken thesauce. </li>\n<li>Serve with theremainingmint and toasted almonds scattered over the top.</li>\n</ol>\n</div>
97902	Indian Lamb Wraps	\N	\N	\N	https://spoonacular.com/recipeImages/indian-lamb-wraps-2-97902.png	http://indian.food.com/recipe/indian-lamb-wraps-54620
224086	Fairy Princess Wands	\N	\N	\N	https://spoonacular.com/recipeImages/Fairy-Princess-Wands-224086.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1 </li>\n<li>Pour cereal into a big bowl, and set aside. </li>\n<li>Combine white chocolate morsels, corn syrup, and butter in a medium-size microwave-safe bowl. Microwave at HIGH 2 minutes; stir until smooth. </li>\n<li>Drizzle white chocolate mixture over cereal, stirring to coat. Spoon mixture into a lightly greased 15- x 10-inch jelly-roll pan. Spray your hands with cooking spray, and press the mixture into an even layer. </li>\n<li>Let stand 15 minutes.2 </li>\n<li>Cut cereal mixture into stars with a 4-inch cookie cutter. </li>\n<li>Place stars on a wax paper-lined baking sheet. Cover and chill in the refrigerator 1 hour or until firm. (Store excess cereal mixture in an airtight container for snacking.)3 Assemble the wands: Have a grown-up insert a lollipop stick into each star. </li>\n<li>Place 1/3 cup white chocolate morsels in a zip-top freezer bag. Partially seal bag, and set upright in a small microwave-safe measuring cup. Microwave at HIGH 20 to 30 seconds or just until chips melt. Snip a tiny hole in 1 corner of bag to create a small opening. </li>\n<li>Drizzle melted chocolate over stars, and sprinkle with sugar sprinkles, if you'd like. </li>\n<li>Let stand until firm. Store wands in an airtight container up to 1 week.Tip: You'll find lollipop sticks at an arts and crafts store.</li>\n</ol>\n</div>
543678	Minnie and Mickey Mouse Oreo Cookie Pops	\N	\N	\N	https://spoonacular.com/recipeImages/Minnie-and-Mickey-Mouse-Oreo-Cookie-Pops-543678.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Using a knife, split mini oreos and remove cream center so you know have 24 mini Oreo pieces.  </li>\n<li>Pour pink sprinkles into a small bowl.  Melt almond bark in a microwave safe bowl in 20 second intervals, stirring after each interval until melted and smooth.  Dip the bottom tip of a conversation heart in the almond bark, scrapping off excess then insert into top center of the oreo with the "converstion" facing the backside (you may have to carefully open the oreo a bit to get it to fit inside), then take 2 of the mini oreos and dip the bottom tip in the melted almond bark then insert each one next to the conversation heart.  Dip bottom half of the Double Stuf Oreo into the melted almond bark, allow excess to drip off then scrape excess from the back and bottom edge.  Dip almond bark coated cookie into pink sprinkles and coat evenly.  If making pops, dip about 1" of the sucker stick into almond bark then scrap of excess and insert stick through center of oreo before coating hardens.  Lay cookie on wax paper and allow coating to harden.  Spoon some of the melted almond bark into a small ziploc bag, snip a tiny tip off of one corner of the ziploc bag and pipe polka dots over pink sprinkles and one oval in the center of the conversation heart bow.  Allow to harden.Follow directions listed above, omitting conversation heart and using red sprinkles in place of pink.  Pipe two small buttons with melted almond bark rather than polka dots.</li>\n</ol>\n</div>
150558	Steamed Whole Fish with Ginger, Scallions, and Soy	\N	\N	\N	https://spoonacular.com/recipeImages/steamed-whole-fish-with-ginger--scallions--and-soy-150558.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse the fish in cold water and pat dry with paper towels. Season the fish inside and out with salt and pepper. </li>\n<li>Place the fish on a heatproof plate that is both large enough to accommodate it (a glass pie plate works well) and will also fit inside your steamer, bending the fish slightly if it is too long. Stuff half of the ginger inside the cavity of the fish and spread the remaining ginger on top of the fish.</li>\n\n<li>Pour water into a wok or stockpot and set a steamer in the wok or on the rim of the stockpot. Make sure the water does not touch the bottom of the steamer. Bring the water to a boil over high heat.</li>\n\n<li>Place the plate holding the fish in the steamer, cover, and steam for about 8 minutes, until the fish flakes easily when tested with the tip of a knife.</li>\n<li>While the fish is steaming, in a small bowl, stir together the soy sauce, wine, and 1 tablespoon of water. Set aside.</li>\n<li>When the fish is ready, carefully remove the plate from the steamer and pour off any accumulated liquid. Lay the scallion and cilantro along the top of the fish. In a small sauté pan, heat the oil over high heat until it is hot but not smoking. </li>\n<li>Remove the oil from the heat and pour it directly over the scallion and cilantro to "cook" them. </li>\n<li>Drizzle the soy mixture over the fish and serve immediately.</li>\n<li>How to Prepare a Whole Fish</li>\n<li>Most markets sell fish that have already been scaled and gutted. If a fish has not been cleaned, you can ask the fishmonger to clean it for you. When we serve a whole fish at the restaurants, we also trim off the fins because the fish is easier to serve without them. With a pair of scissors, cut off the fins from both sides of the fish, from the belly, and then the dorsal fins (the ones running along the back). Finally, trim the tail by cutting it into a V shape and score the fish.</li>\n</ol>\n</div>
7227	Pan-fried Trout with Smoked Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/pan-fried_trout_with_smoked_salmon-7227.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 150°. Sprinkle inside of each trout with salt (use about 1/2 tsp. total). Stuff each with a single layer of smoked salmon, dividing evenly. In a large, shallow dish, combine cornmeal and remaining 1/2 tsp. salt. Turn fish in cornmeal to coat evenly. </li>\n<li>Pour 2 tbsp. oil into each of two 12-in. frying pans, preferably nonstick, and warm them over medium heat. (Or warm a large griddle over 2 burners.) Put 3 fish in each pan and sauté, turning once, until golden brown outside and no longer translucent in the center, 8 to 9 minutes total; reduce heat if fish start to get too brown. </li>\n<li>Transfer fish to 1 or 2 large platters and keep warm in oven. Repeat cooking in 1 pan with 1 to 2 more tbsp. oil and remaining fish. </li>\n<li>Pour 1 more tbsp. oil into 1 pan (or onto griddle) if it's dry, then set over medium-high heat. Quickly sauté peppers until they're softened and lightly browned, about 5 minutes. Sprinkle with salt to taste and scatter on top of fish. </li>\n<li>Serve with lime wedges.*Use soft, cold-smoked salmon, also called Nova or lox.Note: Nutritional analysis is per serving.</li>\n</ol>\n</div>
171180	Stop-and-Go Cookie Pops	\N	\N	\N	https://spoonacular.com/recipeImages/Stop-and-Go-Cookie-Pops-171180.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat oven to 375°F. In medium bowl, stir cookie mix, butter, egg and flour until soft dough forms.</li>\n<li>2</li>\n<li>On floured surface, roll dough about 1/4 inch thick. </li>\n<li>Cut dough into 3x1-inch rectangles, using pastry wheel or knife. Insert 1 inch of wooden stick into a 1-inch side of each cookie. On ungreased cookie sheets, place cookies 2 inches apart.</li>\n<li>3</li>\n\n<li>Bake 7 to 9 minutes or until edges are light borwn. Immediately press red, yellow and green candies into each cookie. Cool 2 minutes; remove from cookie sheets to cooking racks. Cool completely, about 30 minutes.</li>\n</ol>\n</div>
269549	Candy Sushi Rolls	\N	\N	\N	https://spoonacular.com/recipeImages/Candy-Sushi-Rolls-269549.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>MICROWAVE butter in large microwaveable bowl on HIGH 45 sec. or until melted.  </li>\n<li>Add marshmallows; toss to coat. Microwave 1 min. 30 sec. or until marshmallows puff, stirring every 45 sec. until marshmallows are completely melted and mixture is well blended.  Stir in cereal. UNROLL fruit snack sheets.  Press 3 Tbsp. cereal mixture onto each sheet to within 1/2 inch of edge.  </li>\n<li>Place 4 fish down center of each sheet; roll up tightly. CUT each roll-up into 4 pieces.</li>\n</ol>\n</div>
7409	Crispy Trout Amandine	\N	\N	\N	https://spoonacular.com/recipeImages/crispy-trout-amandine-2-7409.jpg	http://recipes.menshealth.com/Recipe/crispy-trout-amandine.aspx
494926	How to make Nethili Karuvadu Varuval / Spicy Anchovies Dry fish fry	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-make-Nethili-Karuvadu-Varuval---Spicy-Anchovies-Dry-fish-fry-494926.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wash the dried anchovies and soak it 20 min in hot water. </li>\n<li>Drain the water and remove its head. Leave it in a plate and let it dry for another 10 to 15 min. </li>\n<li>Add in the coriander powder, chilli powder, turmeric powder. </li>\n<li>Mix well and let it rest for another 10 min. In a vessel, add 1 tsp oil, and when hot, add the dried anchovies and start frying in batches. </li>\n<li>Let it become golden brown in colour. Now add in the curry leaves in the final batch of the anchovies. Fry along with the dried fish. </li>\n<li>Mix all the prepared anchovies together with the curry leaves. </li>\n<li>Serve with hot rice or eat just as a snack. Tastes great in both the cases.</li>\n</ol>\n</div>
425376	Peanutty Pops	\N	\N	\N	https://spoonacular.com/recipeImages/Peanutty-Pops-425376.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small saucepan, sprinkle gelatin over cold water; let stand for 1 minute. Stir in sugar. Cook and stir over medium heat until gelatin and sugar are dissolved. </li>\n<li>Transfer to a large bowl; beat in peanut butter and milk until smooth. </li>\n<li>Pour into cups.</li>\n<li>Cover each cup with heavy-duty foil; insert sticks through foil.  </li>\n<li>Place in a 9-in. square pan. Freeze until firm. </li>\n<li>Remove foil and cups before serving.</li>\n</ol>\n</div>
511402	Egg Sprats Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/Egg-Sprats-Sandwich-511402.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Grate broiled eggs. </li>\n<li>Combine eggs together with mayonnaise, salt and pepper. </li>\n<li>Spread about 1/2 tablespoon of egg mixture per bread slice. </li>\n<li>Place one sprat and a slice of pickle on top of the eggs.</li>\n</ol>\n</div>
85458	Baked Fish With Orange	\N	\N	\N	https://spoonacular.com/recipeImages/baked-fish-with-orange-2-85458.jpg	http://www.food.com/recipe/baked-fish-with-orange-2712
429543	Orange Cream Pops	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-Cream-Pops-429543.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large bowl, dissolve gelatin in boiling water. Cool to room temperature. Stir in the yogurt, milk and vanilla. </li>\n<li>Pour 1/4 cup into each cup or mold; insert Popsicle sticks. Freeze until firm.</li>\n</ol>\n</div>
85611	Tuna Macaroni and Cheese Meal	\N	\N	\N	https://spoonacular.com/recipeImages/tuna-macaroni-and-cheese-meal-2-85611.png	http://www.food.com/recipe/tuna-macaroni-and-cheese-meal-43644
511608	Panko Fish	\N	\N	\N	https://spoonacular.com/recipeImages/Panko-Fish-511608.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a flat dish, combine parmesan, flour, panko crumbs and season it with salt and pepper.In a separate bowl, whisk egg together with milk. Slice fish into serving size portions. Dip fish fillets into egg mixture and then into panko crumbs mixture. Preheat skillet to a medium high, with a bit of oil. Fry fish a few minutes on each side until golden brown. Fry it for about 5 minutes, depending on the thickness of the fish. Clean off extra crumbs between each fish fillets.</li>\n<li>Serve hot. Fish goes great with some rice and salsa.</li>\n</ol>\n</div>
298642	Frankenstein's Frighteningly Decorated Caramel-Dipped Apples	\N	\N	\N	https://spoonacular.com/recipeImages/Frankensteins-Frighteningly-Decorated-Caramel-Dipped-Apples-298642.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>See Sara's secrets to perfect caramel apples</li>\n<li>Arrange the sprinkles or candy corns on separate plates and set aside.</li>\n<li>Heat the caramels and heavy cream in a medium saucepan over medium heat, stirring occasionally, until melted. Turn the heat down to low.Skewer the apples with the popsicle sticks. Working in batches, dip the apples into the caramel, coating them completely and letting any excess caramel drop back into the saucepan. Dip or roll the apples in the sprinkles or candy corns and stand them up on a wax paper-lined baking sheet to cool. </li>\n<li>Serve with a cackle.</li>\n</ol>\n</div>
478994	On the Job: Chocolate-Covered Frozen Banana Pops with Peanuts	\N	\N	\N	https://spoonacular.com/recipeImages/On-the-Job--Chocolate-Covered-Frozen-Banana-Pops-with-Peanuts-478994.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut each of the bananas into three equal pieces. Gently slide the popsicle sticks through the center.  </li>\n<li>Place the bananas on a parchment-lined sheet pan and stick them in the freezer until very cold, about 30 minutes. In the meantime, Pulse the peanuts in the food processor until finely chopped. Alternatively, you can chop by hand. </li>\n<li>Place them in a shallow dish. Melt the chocolate in a microwave safe bowl in 30 second intervals. </li>\n<li>Add the peanut butter and stir to combine. </li>\n<li>Transfer the chocolate mixture to a tall glass.  </li>\n<li>Remove the bananas from the freezer and one by one dip in the chocolate, allowing the mixture to move up the sides of the glass. </li>\n<li>Roll the top half of the banana in the peanuts and return the finished bananas to the parchment-lined sheet pan. Repeat with the remaining bananas and return to the freezer for 2 hours or overnight.</li>\n</ol>\n</div>
122675	Parmesan Fish in the oven	\N	\N	\N	https://spoonacular.com/recipeImages/parmesan-fish-in-the-oven-2-122675.jpg	http://www.food.com/recipe/parmesan-fish-in-the-oven-23891
360252	Coconut-Coated Candied Apples	\N	\N	\N	https://spoonacular.com/recipeImages/Coconut-Coated-Candied-Apples-360252.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wash and dry the apples, being sure that they are firm and do not have any bruised spots. </li>\n<li>Remove the stems from the apples and insert the wooden sticks into the core of the apple to form a handle. </li>\n<li>Place a silpat on a small baking sheet or cover the baking sheet with aluminum foil and brush with vegetable oil. In a 1-quart saucepan, place the sugar, syrup and water. </li>\n<li>Heat over medium-high heat until the sugar is dissolved. Cook the sugar mixture, without stirring, until a candy thermometer registers 290 degrees F. </li>\n<li>Remove the pan from the heat. Swirl the allspice and cinnamon into the syrup and, working quickly, dip the apples into the syrup, twirling the apple and tilting the pan as necessary to fully coat the apple. Working quickly, sprinkle 1/2-cup of the toasted coconut onto the apple while the candied coating is still hot, twirling to evenly coat. Be sure to get the tops of the apple as well, and place on the sheet pan to cool. Continue with the other 3 apples being sure to coat each 1 quickly by hand. Allow the apples to cool completely before serving.</li>\n</ol>\n</div>
470849	Quick and Easy Fish Tacos	\N	\N	\N	https://spoonacular.com/recipeImages/Quick-and-Easy-Fish-Tacos-470849.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 400 degrees F (200 degrees C).</li>\n<li>Arrange fish sticks in a single layer on a baking sheet, and bake 20 minutes in the preheated oven, or until crisp and golden brown. </li>\n<li>Remove from heat and cut into thirds.</li>\n\n<li>Heat the vegetable oil in a skillet over medium-high heat. Fry the tortillas until soft. </li>\n<li>Drain on paper towels.</li>\n<li>Fill the heated tortillas with fish stick portions, cabbage, tartar sauce, and salsa to serve.</li>\n<li>Kitchen-Friendly View</li>\n</ol>\n</div>
516047	Candy Apples	\N	\N	\N	https://spoonacular.com/recipeImages/Candy-Apples-516047.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wash and thoroughly dry the apples (See Kelly's Notes below). Insert the lollipop sticks or popsicle sticks so that they are firmly positioned in the apples. Set the apples aside on a cookie sheet lined with wax paper and coated with cooking spray.</li>\n<li>Combine the sugar, corn syrup and water in a heavy-bottomed saucepan over medium heat. Bring it to a boil and cook the mixture until a candy thermometer reaches 300ºF (the hard crack stage).</li>\n<li>Remove the candy mixture from the heat and carefully stir in the red food coloring (it may splash, so stand back). You may have to add more than the designated ½ teaspoon, depending on the quality and strength of your food coloring. One by one, carefully dip the apples into the candy mixture, swirling to coat them thoroughly and allowing any excess to drip back into the pan. </li>\n<li>Transfer the coated apples to the prepared cookie sheet and allow them to cool until the candy has fully hardened.Kelly's Notes:Apples often come with a waxy coating, which will prevent the candy from sticking to the surface. To remove the wax, simply boil 6 cups water with 1 tablespoon white vinegar. Quickly dip the apples in the boiling mixture for 5 seconds then thoroughly dry them. The candy will stick in an instant!If the candy mixture gets too hard during the dipping process, simply re-heat it over medium heat and continue coating the apples. Serving the apples in colorful cupcake wrappers is a fun way to jazz up your Halloween party spread.</li>\n</ol>\n</div>
85980	Catfish (Or Any White Fish) Au Lait	\N	\N	\N	https://spoonacular.com/recipeImages/catfish-au-lait-2-85980.jpg	http://www.food.com/recipe/catfish-or-any-white-fish-au-lait-208092
90097	Cebiche Peruano	\N	\N	\N	https://spoonacular.com/recipeImages/cebiche-peruano-2-90097.png	http://www.food.com/recipe/cebiche-peruano-357872
90096	Yummy and Easy Crumbed Fish	\N	\N	\N	https://spoonacular.com/recipeImages/yummy-and-easy-crumbed-fish-2-90096.jpg	http://www.food.com/recipe/yummy-and-easy-crumbed-fish-220321
90122	Chinese Fish and Lettuce Soup	\N	\N	\N	https://spoonacular.com/recipeImages/chinese-fish-and-lettuce-soup-2-90122.jpg	http://www.food.com/recipe/chinese-fish-and-lettuce-soup-281753
438371	Fish Stick Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/Fish-Stick-Sandwiches-438371.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a shallow bowl, combine butter and lemon juice. Dip fish sticks in butter mixture. </li>\n<li>Place in a single layer in an ungreased baking pan.</li>\n\n<li>Bake at 400° for 15-18 minutes or until crispy. </li>\n<li>Spread mayonnaise on bottom of buns; add fish sticks. Top with lettuce, onion and tomato if desired. Replace bun tops.</li>\n</ol>\n</div>
224	Fish Cake Soup (odeng Tang)	\N	\N	\N	https://spoonacular.com/recipeImages/fish_cake_soup-224.jpg	http://bapstory.blogspot.com/2011/10/fish-cake-soup-odeng-tang.html
430322	Fish Sandwich Loaf	\N	\N	\N	https://spoonacular.com/recipeImages/Fish-Sandwich-Loaf-430322.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the top half off the loaf of bread; carefully hollow out top and bottom, leaving a 1/2-in. shell (save removed bread for another use).</li>\n<li>Microwave fish fillets according to package directions. Meanwhile, combine butter and garlic; spread over cut sides of bread. In bread bottom, layer fish, red peppers and cheese. Replace bread top.</li>\n<li>Wrap loaf in foil. </li>\n<li>Bake at 350° for 15-20 minutes or until cheese is melted. Slice and serve immediately.</li>\n</ol>\n</div>
49408	Banana Fudge Pops	\N	\N	\N	https://spoonacular.com/recipeImages/banana-fudge-pops-2-49408.jpg	http://www.hersheys.com/recipes/3974/Banana-Fudge-Pops.aspx
618816	Vegan Caramel Candy Apples	\N	\N	\N	https://spoonacular.com/recipeImages/Vegan-Caramel-Candy-Apples-618816.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wash and completely dry apples, then insert popsicle stick into the stem end of each apple.In a small saucepan, combine the coconut oil, coconut sugar, maple syrup and lemon juice over medium heat until it reaches a light boil. Then slowly stir in coconut milk, sea salt and vanilla. Bring to a boil and let cook about 3 minutes, lower temperature slightly and let simmer until mixture becomes thick and dark. Stir occasionally to avoid burning. </li>\n<li>Remove from heat and let cool down completely to room temperature.Once cool, dip apple into caramel, then roll into coating of choice (chopped nuts, shredded coconut or mini chocolate chips), then arrange standing up on parchment lined baking sheet. Cool in refrigerator at least 2 hours before serving.</li>\n</ol>\n</div>
213356	Halibut with Smoky Orange Vinaigrette	\N	\N	\N	https://spoonacular.com/recipeImages/Halibut-with-Smoky-Orange-Vinaigrette-213356.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine first 5 ingredients, 1/8 teaspoon salt, and 1/4 teaspoon paprika in a medium bowl. Set aside. </li>\n<li>Brush fish on both sides with olive oil, and sprinkle with pepper and remaining salt and paprika. </li>\n<li>Heat nonstick or cast iron skillet over medium-high heat; add fish, and cook 4 minutes on each side or until fish flakes easily with a fork. </li>\n<li>Drizzle reserved vinaigrette over cooked fish.</li>\n</ol>\n</div>
45474	Paleta De Papaya Y Coco (papaya And Coconut Popsicle)	\N	\N	\N	https://spoonacular.com/recipeImages/paleta_de_papaya_y_coco-45474.jpg	http://www.muybuenocookbook.com/2011/06/paleta-de-papaya-y-coco-papaya-and-coconut-popsicle/
49592	Berry-Banana Freezer Pops	\N	\N	\N	https://spoonacular.com/recipeImages/berry-banana_freezer_pops-49592.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring berries and honey to a boil. Reduce heat; simmer 5 minutes. Strain mixture into a bowl, using a spoon to squeeze out juice and pulp. Discard solids. Cover and chill 30 minutes. Process yogurt and banana in a blender; pour into pop molds, alternating with berry mixture. Top with lid, and insert craft sticks. Freeze.</li>\n</ol>\n</div>
541196	Temaki Sushi (Hand Roll)	\N	\N	\N	https://spoonacular.com/recipeImages/Temaki-Sushi-(Hand-Roll)-541196.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>If your raw fish comes as a block, slice the raw fish into long sticks. Or you can ask a fish monger at a Japanese grocery store to cut the raw fish for Temaki Sushi. They will cut fish into long sticks, instead of sashimi-style cut.</li>\n<li>Cut nori in half.Before you start, make sure your hands are dry in order to keep nori dry and crispy. </li>\n<li>Place the seaweed on the palm of your hand (shiny side down) and put a thin layer of rice on left third of nori.</li>\n<li>Place fillings (shiso leaf, cucumber, raw fish and daikon radish sprouts) vertically across middle of middle of the rice.Fold the bottom left corner of nori over and begin folding into cone shape.Keep rolling until cone is formed. Put a piece of rice at the bottom right corner to use as glue and close tightly. Continue with the other half of the nori.</li>\n<li>Serve with pickled ginger, wasabi, and soy sauce as condiments.</li>\n</ol>\n</div>
553160	Spinach and strawberry smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach-and-strawberry-smoothie-553160.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients except frozen strawberries into the blender and blend until smooth. </li>\n<li>Add frozen fruit and blend for another 30 seconds. </li>\n<li>Serve.</li>\n</ol>\n</div>
197226	Tangled Web Rice Pops	\N	\N	\N	https://spoonacular.com/recipeImages/Tangled-Web-Rice-Pops-197226.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Melt butter in a large saucepan over low heat. </li>\n<li>Add marshmallows; cook and stir until melted. </li>\n<li>Remove from heat; stir in cereal until well coated. Press evenly into a lightly greased 13"x9" baking pan. Cool slightly; cut into 12 bars. Insert a stick in each; set on wax paper to cool. Dip in melted chocolate to coat; let cool. Dip in melted chocolate to coat; let cool slightly and drizzle with melted white chocolate. Immediately sprinkle with mini chips, if desired. Makes one dozen. </li>\n</ol>\n</div>
524936	Easy Baked Fish with Lemon and Herbs	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Baked-Fish-with-Lemon-and-Herbs-524936.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350 degrees.Spray a baking dish with nonstick cooking spray.</li>\n<li>Add fish fillets to the prepared dish in one layer.Squeeze the juice from half the lemon over the fish.Sprinkle fish with dill, basil, all-purpose seasoning and parsley.Slice other lemon half into 4 thin slices and place one on top of each fillet.Cover with foil.</li>\n<li>Bake 10 to 15 minutes until fish flakes easily with fork. (Don't overcook of fish will be dry. The thinner the fillets, the quicker they'll cook.)</li>\n</ol>\n</div>
4970	Salmon With Mustard Creme Fraiche And Tomato Coulis	\N	\N	\N	https://spoonacular.com/recipeImages/salmon_with_mustard_creme_fraiche_and_tomato_coulis-4970.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place salmon in a baking dish sprayed with cooking spray. Stir together creme fraiche and mustard and spread evenly over the 4 pieces of salmon. Refrigerate for 20 minutes. </li>\n<li>Bake salmon at 350 degrees until cooked through, about 20 minutes. </li>\n<li>Heat olive oil in a small pan over medium heat and add shallot and garlic; sweat for 10 minutes, then add tomatoes and simmer on low until somewhat creamy, about 15 minutes. Season with salt and pepper. To serve, spoon tomato coulis on a plate and top with a salmon filet.</li>\n<li>Facebook</li>\n<li>Twitter</li>\n<li>Google</li>\n<li>Pinterest</li>\n<li>Pocket</li>\n<li>Email</li>\n<li>3 Comments  Comments Feed</li>\n<li>Name (required)</li>\n<li>Mail (will not be published) (required)</li>\n<li>Website</li>\n<li>Previous</li>\n<li>Next</li>\n</ol>\n</div>
949	Grilled Striped Bass with Orange-Saffron Butter	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-striped-bass-with-orange-saffron-butter-2-949.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Whisk butter, juice concentrate, vinegar, and saffron in small saucepan to blend. Season butter to taste with coarse salt and pepper. DO AHEAD Can be made 2 days ahead. Cover and chill.</li>\n<li>Using small sharp knife, cut diagonal slits on both sides of fish at 1-inch intervals. Arrange fish on rimmed baking sheet. Sprinkle fresh orange juice and salt into slits and cavities of fish. Fill cavities with orange slices (about 3 per fish). Cover loosely and let stand at room temperature at least 30 minutes and up to 1 hour.</li>\n<li>Spray grill racks and fish generously with nonstick spray. Prepare barbecue (medium-high heat). </li>\n<li>Place saucepan with orange-saffron butter at edge of grill to warm through, stirring occasionally. Arrange fish on barbecue. Grill until just opaque in center, about 5 minutes per side. </li>\n<li>Transfer to plates. </li>\n<li>Serve with warm seasoned butter.</li>\n</ol>\n</div>
242821	Shiny Red Candy Apples	\N	\N	\N	https://spoonacular.com/recipeImages/Shiny-Red-Candy-Apples-242821.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine sugar, butter, vinegar, boiling water and food coloring in a large heavy metal saucepan.Cook over low heat until sugar dissolves. Increase heat to medium-high; boil without stirring about 10 minutes, until mixture reaches the hard-crack stage, or 290° to 310° on a candy thermometer. </li>\n<li>Remove from heat; stir in cinnamon candies and let stand until bubbles subside.Insert sticks into apples. Dip apples into mixture; swirl to coat and dip into ice water to harden candy coating. </li>\n<li>Place on a lightly buttered baking pan until set. Store in a cool, dry place.  </li>\n</ol>\n</div>
1162	Fish With Olives, Pine Nuts, Basil And Wine	\N	\N	\N	https://spoonacular.com/recipeImages/fish-with-olives-pine-nuts-basil-and-wine-2-1162.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat an oven to 350F.</li>\n<li>Spread the pine nuts on a baking sheet and toast in the oven until they take on color and are fragrant, 5 to 8 minutes. </li>\n<li>Remove from the oven and set aside. Increase the oven temperature to 400F.Season the fish fillets with salt and pepper. </li>\n<li>Place in a baking dish in which they fit in a single layer. In a small bowl, stir together 3 Tbs. of the olive oil and the wine. </li>\n<li>Pour over the fish fillets. Top with half of the garlic and half of the basil, and then distribute the olives around the fillets. Cover with aluminum foil.</li>\n<li>Bake until the fish is opaque throughout when pierced with a knife, 10 to 15 minutes. The timing will depend upon the thickness of the fillets. Using a slotted spatula, transfer the fillets to warmed individual plates.</li>\n<li>Pour the pan juices, olives and reserved pine nuts into a small saut pan and set over medium heat. Swirl in the remaining 1 Tbs. olive oil and the remaining garlic and basil. When warm and fragrant, spoon over the fish. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
99568	Fish steamed in Banana leaves	\N	\N	\N	https://spoonacular.com/recipeImages/fish-steamed-in-banana-leaves-2-99568.jpg	http://www.food.com/recipe/fish-steamed-in-banana-leaves-84710
120056	Pan-Fried Fish on Potato, Horseradish and Lime Salad	\N	\N	\N	https://spoonacular.com/recipeImages/pan-fried-fish-on-potato-horseradish-and-lime-salad-2-120056.jpg	http://www.food.com/recipe/pan-fried-fish-on-potato-horseradish-and-lime-salad-200264
144792	Caribbean Fish in a Packet	\N	\N	\N	https://spoonacular.com/recipeImages/caribbean-fish-in-a-packet-2-144792.jpg	http://www.food.com/recipe/caribbean-fish-in-a-packet-50237
401676	Salmon with Tangy Raspberry Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Salmon-with-Tangy-Raspberry-Sauce-401676.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine the paprika, salt and pepper; sprinkle over salmon. </li>\n<li>Drizzle with oil. Moisten a paper towel with cooking oil; using long-handled tongs, lightly coat the grill rack. </li>\n<li>Place salmon skin side down on grill rack.</li>\n<li>Grill, covered, over medium heat or broil 4 in. from the heat for 10-12 minutes or until fish flakes easily with a fork. In a small bowl, whisk the preserves, vinegar and honey; spoon over fillets.</li>\n</ol>\n</div>
181790	Fish and Collard Greens	\N	\N	\N	https://spoonacular.com/recipeImages/Fish-and-Collard-Greens-181790.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Wash collard green leaves. </li>\n<li>Cut off long stem at the base of each leaf; carefully shave the remaining thick stem. Chop leaves. In 2-quart saucepan, heat 1 cup water to boiling. </li>\n<li>Add chopped collard greens. Boil 15 to 18 minutes or until softened; drain. Pat dry with paper towels.</li>\n<li>2</li>\n<li>In 4-quart Dutch oven, melt butter over medium-high heat. Cook collard greens, onions, bell pepper, 2 tablespoons water and 1 teaspoon salt in butter 4 to 6 minutes, stirring occasionally, until onion is crisp-tender.</li>\n<li>3</li>\n\n<li>Cut fish into 3x3/4-inch strips; add to vegetables. Sprinkle with 1/2 teaspoon salt, the paprika and pepper. Cover and simmer 6 to 8 minutes or until fish flakes easily with fork. </li>\n<li>Serve in large pasta bowls.</li>\n</ol>\n</div>
542301	White Fish with Mango Lime Salsa	\N	\N	\N	https://spoonacular.com/recipeImages/White-Fish-with-Mango-Lime-Salsa-542301.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 380F. Line a baking sheet with parchment paper and lightly spray with olive oil. Arrange fish fillets, season with salt and pepper and lightly spray with olive oil. </li>\n<li>Bake for 10 minutes (or until fish is cooked through).  While fish is cooking, prepare salsa. In a bowl, combine mango, the juice of 1/2 lime, red onion, red pepper flakes, fresh cilantro and a little salt.  Top fish fillets with salsa, drizzle with the juice of 1/2 lime and serve.</li>\n</ol>\n</div>
1624	Whole Baked Fish With Lemon Salt And Aioli	\N	\N	\N	https://spoonacular.com/recipeImages/whole-baked-fish-with-lemon-salt-and-aioli-2-1624.jpg	http://www.donnahay.com.au/recipes/mains/seafood/whole-baked-fish-with-lemon-salt-and-aioli
484978	Pan Seared Fish with Asian Dressing	\N	\N	\N	https://spoonacular.com/recipeImages/Pan-Seared-Fish-with-Asian-Dressing-484978.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine flour and spices in a flat dish.   Dredge fish in flour mixture, on both sides. ("Dredge" means just coat it in the flour mixture.) </li>\n<li>Heat oil and butter in large skillet.   Put fish into pan and cook for about 2 minutes on each side or until cooked. </li>\n<li>Remove once golden brown. </li>\n<li>Serve with a side salad and spoon dressing over fish and serve.</li>\n</ol>\n</div>
1678	Fish Fillets In Parchment With Asparagus And Orange	\N	\N	\N	https://spoonacular.com/recipeImages/fish_fillets_in_parchment_with_asparagus_and_orange-1678.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 400F. </li>\n<li>Place parchment squares on work surface. Generously butter half of each parchment square; top buttered half of each with 1 fish fillet. Sprinkle fish with salt and pepper; top each fillet with 3 tarragon leaves, then 1 piece of butter. Arrange asparagus around each fish fillet; pour 1 tablespoon orange juice over each. Fold parchment over fish and asparagus, folding and crimping edges tightly to seal and enclose filling completely. </li>\n<li>Place on 2 rimmed baking sheets, spacing apart. DO AHEAD Can be made 4 hours ahead. Chill.</li>\n<li>Bake fish packets 17 minutes. Slide packets onto plates and serve.</li>\n</ol>\n</div>
202583	Steamed Walleye with Tatsoi, Ginger, and Scallions	\N	\N	\N	https://spoonacular.com/recipeImages/Steamed-Walleye-with-Tatsoi--Ginger--and-Scallions-202583.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In a medium-sized bowl, whisk together the soy sauce, rice wine, sesame oil, minced ginger, and 1/2 of the minced scallions.</li>\n<li>2</li>\n<li>Arrange the tatsoi leaves on a 10 1/2-inch heat-proof serving plate, along with the sliced ginger and 1-inch pieces of scallions. On top, add the walleye fillets. Spoon a couple tablespoons of the sauce on top of the fish.</li>\n<li>3</li>\n\n<li>Add 1 inch of water to the bottom of a 14-inch flat-bottomed wok, bring to a boil over high heat, and then reduce the heat to maintain a strong simmer. Meanwhile, roll a 1- by 3-foot sheet of heavy duty aluminum foil into a 1-foot long rope-like piece, then form it into a ring, while keeping the sides about two inches tall. </li>\n<li>Place in the wok, then carefully add the plate on top. There should be space around the edge of the plate for the steam to come up. (If not, carefully remove the plate, remove foil with tongs, and reshape until it supports the plate above the liquid.</li>\n<li>4</li>\n<li>Cover the wok, and let the fish steam until it is fully cooked and flakes easily with a fork, 8 to 10 minutes. The water shouldn't run out, but if it does, add some more in. When done, carefully remove the plate, divide the contents between two plates. </li>\n<li>Serve with white rice and more of the sauce.</li>\n</ol>\n</div>
173956	Peanut Butter Candy Apples	\N	\N	\N	https://spoonacular.com/recipeImages/Peanut-Butter-Candy-Apples-173956.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Line cookie sheet with waxed paper; spray waxed paper with cooking spray. Wash and dry apples; remove stem and blossom ends. Insert craft stick into stem end of each apple.</li>\n<li>2</li>\n<li>In 2-quart saucepan, mix sugar, water and 1/4 cup of the corn syrup. </li>\n<li>Heat to boiling over medium-high heat. Cook about 8 minutes, without stirring, to 300°F on candy thermometer or until small amount of mixture dropped into cup of very cold water separates into hard, brittle threads. (Watch carefully so mixture does not burn.) Immediately remove from heat.</li>\n<li>3</li>\n<li>Working quickly, dip each apple in sugar mixture. </li>\n<li>Place on cookie sheet; let stand 4 minutes.</li>\n<li>4</li>\n<li>Meanwhile, in top of double boiler, mix remaining 3/4 cup corn syrup, the peanut butter and shortening. Cook over simmering water about 4 minutes, stirring constantly until smooth. Dip coated apples almost completely in peanut butter mixture; roll apples in chopped peanuts, using hands to help adhere if necessary. Return to cookie sheet; refrigerate 15 minutes or until set. Store covered at room temperature.</li>\n</ol>\n</div>
600042	Baked Fish with Almonds, Lemon, and Bread Crumbs	\N	\N	\N	https://spoonacular.com/recipeImages/Baked-Fish-with-Almonds--Lemon--and-Bread-Crumbs-600042.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 450°F (230°C). Lightly coat a rimmed baking sheet or large roasting pan with olive oil. </li>\n<li>Place the fish on the baking sheet with the slightly curved side of the fillet facing up. </li>\n<li>Brush with olive oil and squeeze the juice from the lemon halves over the fish. Season with salt and pepper, then spread the mustard lightly over the fillets. Tear the bread into 1-inch pieces. </li>\n<li>Place in a food processor and grind to fine crumbs. You should have 1/2 cup bread crumbs. </li>\n<li>Transfer to a small bowl. Grind the almonds coarsely in the processor and add to the bowl with the crumbs. </li>\n<li>Mix in the scallions, lemon zest (you should have about 4 loosely packed teaspoons), and 1 tablespoon oil. Season to taste with salt and pepper. Just before baking, divide the bread crumb mixture among the fillets, pressing the mixture onto the top of each fillet. </li>\n<li>Bake until the fish is just springy to the touch and the bread crumbs begin to brown, about 10 minutes per inch of thickness (or less if your fish is thinner). </li>\n<li>Transfer the baked fish to plates and serve right away.</li>\n</ol>\n</div>
4390	Spinach And Rice With Fermented Locust Beans	\N	\N	\N	https://spoonacular.com/recipeImages/spinach_and_rice_with_fermented_locust_beans-4390.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Clean and trim 1 bunch spinach.</li>\n<li>You want to break off the root end (see right hand), leaving just the leaves and as much stem as you tolerate (see left hand). You can save the root end for stock or compost</li>\n<li>In a food processor, puree together peanuts, dried sardines, and soumbala.</li>\n<li>Peanut pieces are much cheaper than whole peanuts, so I buy them in bulk for cooking.</li>\n<li>I couldnt find dried sardines, so I used smoked anchovies.</li>\n<li>You cant tell from the picture, but I was telling Keith to hurry up and take it already.</li>\n<li>He took his sweet time, relishing the sight of me squirming about with the fishies.</li>\n<li>I shouldnt have been so squeamish. Ive filleted fish. Ive boned a lamb shank (all at the Culinary Institute of America). But dried fish are on a whole other level.</li>\n<li>I guess thats what this Adventure is for.</li>\n<li>Hello little guys. </li>\n<li>Lets get acquainted!</li>\n<li>Heres the soumbala. It was frozen and I put it in the food processor that way with no problems. I really enjoyed this, despite the strong odor. But, then again, I love anything fermented  stinky cheese, wine, bread,</li>\n<li>Puree until the mixture looks like coarse sand. Or fine gravel.</li>\n\n<li>Add 1/2 cup white rice and process another 20 seconds.</li>\n<li>Some of the rice will break into smaller pieces which will contribute to the the characteristicgelatinoustexture of the final dish.</li>\n\n<li>Add all ingredients (including spinach) to large pot with water. Simmer, covered.</li>\n<li>After about 15 minutes, give everything a stir to mix the spinach in.</li>\n<li>Doesnt look too hot yet. Dont worry.</li>\n<li>Simmer another 15 minutes.</li>\n<li>The rice will have absorbed all the water, making for a pasty mass of spinach and rice.</li>\n\n<li>Serve immediately, with a confident smile.</li>\n<li>This recipe was fascinating! Thank you Burkina Faso</li>\n<li>Special Thanks to Jeannette M. who helped clarify my rusty translation from the French. Without her, I very well might have thought this was a beverage. Ok. Not really. But thank you Jeannette for suggesting what greens to use. Your time and cheerful assistance made my adaptation a success !</li>\n<li>Votes: 0</li>\n<li>Rating: 0</li>\n</ol>\n<div class="subRecipeInstructionTitle">You:</div>\n<ol>\n<li>Rate this recipe!</li>\n<li>Print Recipe</li>\n<li>Babenda</li>\n<li>Course</li>\n<li>Main Dish</li>\n<li>Lifestyle5-ingredients or less</li>\n<li>Food Type</li>\n<li>Legumes, Rice, Seafood, Vegetables</li>\n</ol>\n<div class="subRecipeInstructionTitle">Source:</div>\n<ol>\n<li>Recipe Copyright Sasha Martin, Global Table Adventure. For personal or educational use only.</li>\n</ol>\n</div>
161761	Frankenstein Brownie Pops	\N	\N	\N	https://spoonacular.com/recipeImages/Frankenstein-Brownie-Pops-161761.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat oven to 350°F. Line 13x9-inch pan with foil, leaving 1 inch of foil overhanging at 2 opposite sides of pan; spray foil with cooking spray. Make and bake brownie mix as directed on box, using water, oil and eggs. Cool completely, about 1 hour. Refrigerate 1 hour or freeze 30 minutes. Use foil to lift brownies out of pan. </li>\n<li>Cut into 6 rows by 3 rows. Insert craft stick halfway into 1 end of each brownie.</li>\n<li>2</li>\n<li>Line cookie sheet with waxed paper. In medium microwavable bowl, microwave candy melts uncovered on High 1 to 2 minutes; stir until smooth. Stir in oil until blended. Dip flat back side of each brownie pop in candy; place dipped side up on cookie sheet. Refrigerate 10 minutes or until set.</li>\n<li>3</li>\n<li>Spoon candy coating over remaining sides of brownie to cover completely; let excess drip off. Smooth coating with knife. Immediately attach candy eyes. </li>\n<li>Place 1 licorice piece on opposite sides of each pop to look like neck bolts; refrigerate until set.</li>\n<li>4</li>\n<li>Pipe purple icing on pops to look like hair using small plain tip. Pipe black icing to look like scars and mouth. </li>\n<li>Let stand until set.</li>\n</ol>\n</div>
51177	Salt Crusted Whole Fish With Blood Oranges	\N	\N	\N	https://spoonacular.com/recipeImages/salt_crusted_whole_fish_with_blood_oranges-51177.jpg	http://www.food52.com/recipes/2478_salt_crusted_whole_fish_with_blood_oranges
649262	Larang (Parrot Fish in Tausi)	\N	\N	\N	https://spoonacular.com/recipeImages/Larang-(Parrot-Fish-in-Tausi)-649262.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Season both sides of fish with seasoned salt.</li>\n<li>Heat oil in pan over medium heat.  When ready (oil is hot but no smoking hot), fry fish with both sides lightly browned.  Set aside.Using the same pan, saut garlic until lightly browned using the oil previously used to fry the fish.</li>\n<li>Add in onions and tomatoes.  </li>\n<li>Sautee until onions are translucent.</li>\n<li>Add in fish and coconut milk.  </li>\n<li>Let cook until coconut milk boils.  Season with seasoned salt only if you so desire.</li>\n<li>Serve over warm over steamed rice.</li>\n</ol>\n</div>
411811	Spanish Corn with Fish Sticks	\N	\N	\N	https://spoonacular.com/recipeImages/Spanish-Corn-with-Fish-Sticks-411811.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large skillet, saute onion and green pepper in butter until tender. Stir in the flour, salt, pepper and sugar until blended. </li>\n<li>Add tomatoes; bring to a boil. Cook and stir for 2 minutes or until thickened. Reduce heat; simmer, uncovered, for 3-5 minutes or heated through, stirring occasionally. Stir in corn.</li>\n\n<li>Transfer to two greased 11-in. x 7-in. baking dishes. Cover and bake at 350° for 25 minutes. Uncover; arrange fish sticks over the top. </li>\n<li>Bake 15 minutes longer or until fish sticks are heated through.</li>\n</ol>\n</div>
157957	Mustard-Crusted Branzino	\N	\N	\N	https://spoonacular.com/recipeImages/Mustard-Crusted-Branzino-157957.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 450°F. </li>\n<li>Whisk oil, mustard, garlic, and thyme in a small bowl. Using your fingertips or a rubber spatula, mix in breadcrumbs, squeezing or pressing to saturate bread, until evenly coated; season with salt and pepper.</li>\n<li>Open up fish and place, skin side down, in a large ovenproof pan or on a rimmed baking sheet; season with salt and pepper. Top with breadcrumb mixture, pressing to adhere. Roast until breadcrumbs are golden brown and fish is cooked through, 10–15 minutes.</li>\n\n<li>Serve fish with lemon wedges.</li>\n<li>Per serving: 490 calories, 27 g fat, 1 g fiber</li>\n<li>Nutritional analysis provided by</li>\n<li>Bon Appétit</li>\n</ol>\n</div>
403725	Ocean Cake	\N	\N	\N	https://spoonacular.com/recipeImages/Ocean-Cake-403725.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Prepare and bake cake according to package directions, using two greased 9-in. round baking pans. Cool for 10 minutes before removing from pans to wire racks to cool completely.</li>\n\n<li>Spread 1-2/3 cups frosting between layers and over top and sides of cake. Using the back of a spoon, make waves on the top of cake with remaining frosting.</li>\n\n<li>Cut wave shapes out of fruit roll-ups; gently press along bottom of cake. Arrange additional wave shapes and fish candies on top of cake as desired. Tie licorice on one end of candy stick to create a fishing pole.</li>\n</ol>\n</div>
276766	Favorite Fish Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/Favorite-Fish-Sandwiches-276766.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>BAKE fish as directed on pkg., topping each with 1 Singles for the last min. of the baking time. SPREAD cut sides of buns with dressing. PLACE lettuce leaf and tomato slice on bottom half of each bun; cover with fish patty and top of bun.</li>\n</ol>\n</div>
423933	Salmon with Honey Pecan Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Salmon-with-Honey-Pecan-Sauce-423933.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place salmon skin side down on a broiler pan; sprinkle with seasoned salt and pepper. Broil 3-4 in. from the heat for 7-9 minutes or until fish flakes easily with a fork.</li>\n<li>Meanwhile, in a small saucepan, cook the pecans, honey and butter over medium heat for 8-10 minutes or until bubbly. </li>\n<li>Serve with salmon.</li>\n</ol>\n</div>
88073	Delicious and Simple Baked Salmon With &quot;fancy&quot; Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/delicious-and-simple-baked-salmon-with-quot-fancy-quot-sauce-2-88073.jpg	http://www.food.com/recipe/delicious-and-simple-baked-salmon-with-fancy-sauce-327390
88186	Asian Style Gravlax	\N	\N	\N	https://spoonacular.com/recipeImages/asian-style-gravlax-2-88186.jpg	http://www.food.com/recipe/asian-style-gravlax-118192
88243	Orange-Glazed Salmon Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/orange-glazed-salmon-recipe-2-88243.png	http://www.tasteofhome.com/Recipes/Orange-Glazed-Salmon-2
88269	Asian Grilled Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/asian-grilled-salmon-2-88269.jpg	http://www.food.com/recipe/asian-grilled-salmon-74640
88361	Slow Roasted Brown Sugar and Dill Cured Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/slow-roasted-brown-sugar-and-dill-cured-salmon-2-88361.jpg	http://www.food.com/recipe/slow-roasted-brown-sugar-and-dill-cured-salmon-426077
522581	Salmon with Mustard and Brown Sugar Glaze	\N	\N	\N	https://spoonacular.com/recipeImages/Salmon-with-Mustard-and-Brown-Sugar-Glaze-522581.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350°F.    Boil wine, butter, and Old Bay seasoning in small saucepan 3 minutes.    Sprinkle salmon on both sides with salt and pepper. </li>\n<li>Place fish on heavy rimmed baking sheet. </li>\n<li>Pour wine mixture over.    </li>\n<li>Bake until fish is opaque in center, about 8-10 minutes. </li>\n<li>Remove from oven.    Preheat broiler. </li>\n<li>Mix mustard and sugar in small bowl to blend; spread over salmon to cover. Broil salmon until topping is brown and bubbling, about 3 minutes.    </li>\n<li>Transfer salmon to platter and serve.</li>\n</ol>\n</div>
629215	Broiled Salmon with Avocado and Grapefruit	\N	\N	\N	https://spoonacular.com/recipeImages/Broiled-Salmon-with-Avocado-and-Grapefruit-629215.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Turn the oven to broil.</li>\n<li>Place the salmon skin side down on a greased baking pan and drizzle olive oil over the top. Sprinkle the top with salt and then with chili powder. </li>\n<li>Place on the middle rack and broil for 6 minutes or until salmon is flaky.</li>\n<li>Remove and top with grapefruit and avocado.</li>\n</ol>\n</div>
629492	Smoked Salmon Sushi and SushiQuik Review	\N	\N	\N	https://spoonacular.com/recipeImages/Smoked-Salmon-Sushi-and-SushiQuik-Review-629492.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>For the sushi rice: </li>\n<li>Place 1 cup sushi rice in a fine mesh strainer and rinse well (until the water runs clear. </li>\n<li>Drain well, then place the rice in a medium pot with a tight fitting lid. </li>\n<li>Add 1 cup cold water, bring to a boil, reduce heat to low, cover and cook for 20 minutes. </li>\n<li>Remove from the heat, let stand, covered, for 10 minutes. </li>\n<li>Mix together  cup seasoned rice vinegar and 1 teaspoon sugar until the sugar is dissolved, stir mixture into the rice. Cover the rice with a damp paper towel until ready to use.</li>\n<li>Place the nori on the Sushi</li>\n<li>Quik or other rolling mat with the shiny side down, cover evenly with a thin layer of prepared sushi rice, leaving a  inch piece gap at the top of the nori without rice. . If you prefer the rice on the outside of the sushi roll, carefully flip the rice covered nori sheet over. </li>\n<li>Place a line of smoked salmon strips a quarter of the way away from you, then top with a line of sliced avocado and sprinkle with sliced scallion. Wet the uncovered end of the nori with a water from your fingertip. Lift the sushi mat at the end closest to you and begin to roll, pressing down slightly and pulling out on the mat when it reaches the rice. Continue to roll, pressing down slightly, until you have a round, sealed roll. </li>\n<li>Remove to a cutting board, and slice with a sharp, damp knife, rinsing the knife every few slices.</li>\n<li>Serve cold with soy sauce, prepared wasabi, and thin slices of ginger. Use within 24 hours of preparation. Keep refrigerated until ready to serve.</li>\n</ol>\n</div>
367482	Island Spiced Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Island-Spiced-Salmon-367482.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, combine the first five ingredients; mix well. Rub over flesh side of fillet; refrigerate for 30 minutes. </li>\n<li>Place skin side down in a 13-in. x 9-in. baking dish coated with cooking spray. </li>\n<li>Bake at 375° for 20-25 minutes or until fish flakes easily with a fork.</li>\n</ol>\n</div>
162735	Broiled Salmon with Orange-Mustard Glaze	\N	\N	\N	https://spoonacular.com/recipeImages/Broiled-Salmon-with-Orange-Mustard-Glaze-162735.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Set oven control to broil. Spray broiler pan rack with cooking spray. </li>\n<li>Place salmon, skin side down, on rack in broiler pan. Broil with tops 4 inches from heat 10 to 15 minutes or until fish flakes easily with fork.</li>\n<li>2</li>\n<li>Meanwhile, in small bowl, mix remaining ingredients. </li>\n<li>Spread on salmon during last 5 minutes of broiling.</li>\n</ol>\n</div>
23639	Grilled Brined Salmon and Eggplant with Fennel Cucumber Relish	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-brined-salmon-and-eggplant-with-fennel-cucumber-relish-2-23639.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring water, brown sugar, salt, and 6 tablespoons granulated sugar to a boil in a 5-quart pot, stirring until sugar is dissolved. </li>\n<li>Transfer 6 cups brine to a 13- by 9-inch glass or ceramic baking dish, then stir in dill and cool. </li>\n<li>Transfer remaining 4 cups brine to a large bowl and add remaining 4 tablespoons granulated sugar, stirring until dissolved, then cool completely.</li>\n<li>Marinate salmon, skin sides up, in brine in baking dish, chilled, 1 hour. (Do not turn salmon.) Put eggplant in brine in bowl, then invert a small plate over eggplant and weight it with soup can (to keep eggplant immersed). Marinate eggplant at room temperature 30 minutes. (Do not brine salmon or eggplant longer than indicated or they will be too salty.)</li>\n<li>Prepare charcoal or gas grill for cooking.</li>\n\n<li>Remove salmon from brine and pat dry, discarding brine. </li>\n<li>Remove eggplant from brine, then rinse and pat dry, discarding brine. Toss eggplant with oil and pepper to taste in a bowl.</li>\n<li>When fire is moderate (you can hold your hand 5 inches above rack for 3 to 4 seconds), grill eggplant on lightly oiled grill rack, turning once, until golden, about 4 minutes total. </li>\n<li>Transfer to a platter with tongs and keep warm, covered.</li>\n<li>When fire is moderately low (you can hold your hand 5 inches above rack for 5 to 6 seconds), grill salmon, starting with skin sides up and turning once, until just cooked through and skin is crisp, about 8 minutes total.</li>\n\n<li>Serve salmon over eggplant.</li>\n</ol>\n<div class="subRecipeInstructionTitle">Cooks' note:</div>\n<ol>\n<li>·Brine (without dill) can be made 1 day ahead and kept, covered, at room temperature.</li>\n</ol>\n</div>
654435	Pan Seared Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Pan-Seared-Salmon-654435.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a bowl combine 1 tbsp olive oil, salt, pepper, garlic, lemon jiuce and dill and add salmon fillets. </li>\n<li>Let them marinate for 15 minutes at room temperature.Preheat a large skillet on medium heat for 2 minutes. </li>\n<li>Add 1 tsp olive oil and then add salmon. Cook for 5 minutes per side. Salmon should be done, when it flakes easily with a fork.</li>\n<li>Transfer to plates. </li>\n<li>Serve with lemon wedges.</li>\n</ol>\n</div>
33059	Crockpot Salmon And Green Beans Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/crockpot_salmon_and_green_beans_recipe-33059.jpg	http://crockpot365.blogspot.com/2008/01/crockpot-salmon-and-green-beans-recipe.html
450	Pan-roasted Salmon With Purple Sprouting Broccoli And Anchovy-r	\N	\N	\N	https://spoonacular.com/recipeImages/pan-roasted_salmon_with_purple_sprouting_broccoli_and_anchovy-r-450.jpg	http://www.jamieoliver.com/recipes/fish-recipes/pan-roasted-salmon-with-purple-sprouting
25110	Salmon And Zucchini With Shallot Vinaigrette	\N	\N	\N	https://spoonacular.com/recipeImages/salmon_and_zucchini_with_shallot_vinaigrette-25110.jpg	http://www.realsimple.com/food-recipes/browse-all-recipes/salmon-zucchini-shallot-vinaigrette-00000000040174/index.html
580860	Barefoot Contessa Asian Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Barefoot-Contessa-Asian-Salmon-580860.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>While your grill is heating, place the salmon skin side down on a cutting board and cut it crosswise into four equal pieces.</li>\n<li>Mix together the mustard, soy sauce, olive oil and garlic in a small bowl.</li>\n<li>Drizzle half of the marinade onto the salmon and let it sit for 10 minutes.</li>\n<li>Put the salmon skin side down on the heated grill and discard the marinade the fish was sitting in. Grill for around five minutes. (Will depend on how thick the fish is)Turn with a wide spatula and grill for another five minutes or so.</li>\n<li>Transfer salmon to a flat plate, skin side down and spoon the reserved marinade on top.Permit the fish to rest for 10 minutes.</li>\n<li>Remove the skin and serve warm, at room temperature, or chilled.</li>\n</ol>\n</div>
7665	Salmon And Tuna Nigiri	\N	\N	\N	https://spoonacular.com/recipeImages/salmon-and-tuna-nigiri-2-7665.jpg	http://www.donalskehan.com/2011/03/salmon-and-tuna-nigiri/
302602	Cucumber Canoes of Salmon Mousse	\N	\N	\N	https://spoonacular.com/recipeImages/Cucumber-Canoes-of-Salmon-Mousse-302602.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In food processor, chop up salmon into a paste. </li>\n<li>Add cream cheese, salt and pepper, and creme fraiche to make a mixture loose enough to pipe out into cucumber boats. Peel cucumbers and halve lengthwise. Slice cucumbers into 2-inch lengths. Use melon baller to scoop out the cucumber to make into small canoe-shapes. Spoon salmon mixture into pastry bag fitted with a with star tip, and pipe mixture into each cucumber "canoe." Top with a small amount of pineapple.</li>\n</ol>\n</div>
499271	Pan-Seared Lemongrass Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Pan-Seared-Lemongrass-Salmon-499271.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
589379	Persian Cucumber Bites with Lox + Dill Cream Cheese	\N	\N	\N	https://spoonacular.com/recipeImages/Persian-Cucumber-Bites-with-Lox-+-Dill-Cream-Cheese-589379.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Clean cucumbers, trim ends and evenly cut into ¾" rounds.</li>\n<li>Cut the smoked salmon into evenly sized pieces so that they will fit on top of the cucumber rounds. </li>\n<li>Place the cucumber rounds on a serving tray and top with the salmon pieces. Use up all the salmon. I put about two pieces per cucumber round.</li>\n<li>Combine the cream cheese, dill leaves, salt and pepper in the body of a food processor or blender. Process until well combined and softened.Use a piping bag (I used Wilton Tip #to evenly distribute the Dill Cream Cheese onto the rounds. (See NOTES if you do not have a piping bag).Finish by placing a small sprig of fresh dill on top of each round and refrigerate until ready to use. </li>\n<li>Serve and Enjoy!</li>\n</ol>\n</div>
228971	Planked Salmon with Maple-Mustard Glaze	\N	\N	\N	https://spoonacular.com/recipeImages/Planked-Salmon-with-Maple-Mustard-Glaze-228971.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Soak plank in water 1 hour; drain. Preheat grill to medium heat. </li>\n<li>Combine syrup and mustard; stir well, and divide between 2 small bowls. </li>\n<li>Place plank on grill rack; grill 10 minutes or until lightly charred. Turn plank over; place fish, skin side down, on charred side. Sprinkle fish with salt and pepper; brush with half of syrup mixture. Cover and grill 35 minutes or until desired degree of doneness. </li>\n<li>Remove from grill; spread remaining syrup mixture over fish. </li>\n<li>Cut fillet into 4 equal portions.</li>\n</ol>\n</div>
212768	Mediterranean salmon fillet	\N	\N	\N	https://spoonacular.com/recipeImages/Mediterranean-salmon-fillet-212768.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oven to 200C/fan 180C/gas  Lay the salmon on a board and, using an apple corer, make 18 holes in rows of hree in the salmon fillet, just going down to the skin, but not cutting all the way through. Take a piece of sun-dried tomato and an olive and, using a basil leaf as a wrapper, roll up into a tight little parcel. Each parcel should be just big enough to plug into one of the holes.As you roll each parcel, stuff them into the holes until they are all filled.</li>\n<li>Place the salmon fillet on a piece of greased foil on a baking tray, then season with salt and pepper and drizzle with the olive oil. Roast in the oven for 20 mins until just cooked. </li>\n<li>Remove from the oven and leave to cool until just warm, then carefully lift the salmon onto a serving dish and serve, or leave to cool completely (see Gordon’s tips, below).</li>\n</ol>\n</div>
196	Salmon With Anchovy Olive Tapenade	\N	\N	\N	https://spoonacular.com/recipeImages/Salmon-With-Anchovy-Olive-Tapenade-196.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse salmon fillets, place in a 7 x 11 inch baking dish and drizzle with lemon juice</li>\n<li>In a food processor, place anchovies, rosemary, olives, garlic and olive oil; pulse until mixture turns into a coarse paste</li>\n\n<li>Spread paste over fillets and marinate 2- 6 hours; if short on time, skip marinating time</li>\n\n<li>Bake at 350 for 15-20 minutes</li>\n\n<li>Serve</li>\n</ol>\n</div>
598233	Cream Cheese, Fig, and Walnut Spread with Smoked Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Cream-Cheese--Fig--and-Walnut-Spread-with-Smoked-Salmon-598233.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Finely chop the figs in a food processor. </li>\n<li>Add the cream cheese and process until combined. </li>\n<li>Add the salmon, walnuts, and salt; pulse just to blend. </li>\n<li>Scrape into a bowl. </li>\n<li>Add the scallions, if desired. </li>\n<li>Serve the spread on crisped endive leaves, celery boats, crackers, apple or pear slices, or toast, or use it as a sandwich spread.</li>\n</ol>\n</div>
17085	Smoked Salmon with Mustard and Dill	\N	\N	\N	https://spoonacular.com/recipeImages/smoked_salmon_with_mustard_and_dill-17085.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Soak wood chips in water 30 minutes; drain.</li>\n<li>Combine dill, juice, mustard, and salt, stirring well. </li>\n<li>Place salmon, skin side down, in a shallow baking dish; brush mustard mixture over salmon. Cover and refrigerate 20 minutes.Prepare the grill for indirect grilling, heating one side to low and leaving one side with no heat. Maintain temperature at 200° to 225°.</li>\n<li>Place wood chips on hot coals. </li>\n<li>Place a disposable aluminum foil pan on unheated side of grill. </li>\n<li>Pour 2 cups water in pan. Coat grill rack with cooking spray; place on grill. </li>\n<li>Place salmon, skin side down, on grill rack over foil pan on unheated side. Close lid; cook 35 minutes or until fish flakes easily when tested with a fork or until desired degree of doneness.</li>\n</ol>\n</div>
8915	Salmon, New Potatoes And Black Olives	\N	\N	\N	https://spoonacular.com/recipeImages/salmon-new-potatoes-and-black-olives-2-8915.jpg	http://saladpride.blogspot.com/2011/05/salmon-new-potatoes-and-black-olives.html
8931	Smoked Salmon, Caviar And Croutons	\N	\N	\N	https://spoonacular.com/recipeImages/smoked_salmon_caviar_and_croutons-8931.jpg	http://saladpride.blogspot.com/2011/10/salmon-caviar-and-croutons.html
599196	Pan Fried Salmon with Cream Cheese Pesto	\N	\N	\N	https://spoonacular.com/recipeImages/Pan-Fried-Salmon-with-Cream-Cheese-Pesto-599196.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring salmon to room temperature about 15 minutes before cooking.  </li>\n<li>Heat a large skillet with oil over medium-low heat.  Season fish with salt and pepper, and place salmon skin side up in the pan.  Cook until golden brown on one side, and flip over on the other side, this should take about 3 to 4 minutes on each side.In a small pot add half and half, pesto, and cream cheese, stir together well over low heat until the cream cheese sauce is combined well.Spoon about two tablespoons of the pesto cream cheese sauce over the salmon.  You may want to serve with a lemon slice along with the fish.</li>\n</ol>\n</div>
214240	Pan-fried salmon with watercress, polenta croutons & capers	\N	\N	\N	https://spoonacular.com/recipeImages/Pan-fried-salmon-with-watercress--polenta-croutons---capers-214240.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the polenta into approximately 5cmcubes, toss in flour and fry in a little oiluntil slightly coloured. Keep warm.</li>\n<li>Heat oven to 190C/170C fan/gas </li>\n<li>Heat the remaining oil in a non-stick panand fry the salmon portions for 1 min oneach side until lightly golden, thentransfer to a non-stick baking tray andcook in the oven for 8-10 mins. Test thefish to see if it is cooked by pushing acocktail stick into the top of it. If the fishoffers resistance, then it is not fullycooked and will need further cooking.When cooked, remove from the ovenand set to one side.Dress the watercress with a little oliveoil and a few drops of lemon juice.Scatter the polenta croutons and capersover each salmon fillet and serve withthe watercress.</li>\n</ol>\n</div>
591129	Pecan Crusted Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Pecan-Crusted-Salmon-591129.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350°F (180°C).In a small bowl, combine pecans, parsley, garlic and lemon zest with olive oil.Season the salmon filets liberally with salt and pepper.</li>\n<li>Spread the topping evenly over the salmon filets.</li>\n<li>Bake salmon on a parchment lined baking sheet for 20 minutes or until fish is fully cooked.</li>\n</ol>\n</div>
304491	Gaufrette Potatoes with Gravlax, Sour Cream and Osetra Caviar	\N	\N	\N	https://spoonacular.com/recipeImages/Gaufrette-Potatoes-with-Gravlax--Sour-Cream-and-Osetra-Caviar-304491.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>To make the gaufrette potatoes, adjust the mandoline so that the ridged blade is exposed by about 1/8 of an inch. </li>\n<li>Remove the potato from the water and pat dry with a paper towel. Hold the potato at an angle of 45 degrees, and run the potato over the ridged blade of the mandoline. (The first slice will not be usable, so discard it.) Turn the potato sideways 45 degrees in the opposite direction, this will make your first waffle-cut potato slice. Repeat the process, turning the potato after each pass over the blade to maintain the waffle-cut. </li>\n<li>Place the potato slices in cold water to keep them from oxidizing.    </li>\n<li>Heat the oil to 350 degrees F in a 1-gallon pot. Working in batches, add the potato slices a few at a time to the hot oil. Turn occasionally to ensure even browning, and cook until golden brown and crispy, about 3 to 4 minutes. Using a slotted spoon or strainer, remove the chips from the oil and place on a paper-lined plate and sprinkle with the salt.    To assemble the dish, cut the gravlax slices into small 1 to 2-inch length pieces and arrange 1 piece of gravlax on top of each potato chip. Top each chip with a small dollop of sour cream, and place 1/4 teaspoon or more of caviar on top of the sour cream. </li>\n<li>Garnish with a small sprig of fresh dill, and serve.</li>\n</ol>\n</div>
550306	Salmon Baked in Cream with Sweet Bay, Thyme and Dill; The Nourished Kitchen and a Giveaway	\N	\N	\N	https://spoonacular.com/recipeImages/Salmon-Baked-in-Cream-with-Sweet-Bay--Thyme-and-Dill--The-Nourished-Kitchen-and-a-Giveaway-550306.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 400°F.</li>\n<li>Place the salmon fillets in a single layer in a small baking dish or gratin dish. Top each fillet with a bay leaf. </li>\n<li>Pour the heavy cream over the salmon and sprinkle with the thyme and dill. </li>\n<li>Bake until the fish flakes easily when pierced with a fork and the cream thickens, about 15 minutes.Discard the bay leaves and serve, spooning warm cream and herbs over the fish.Reprinted with permission from The Nourished Kitchen written and photographed by Jennifer McGruther (Ten Speed Press, © .</li>\n</ol>\n</div>
1454	Salmon With Brown Butter And Almonds Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/salmon_with_brown_butter_and_almonds_recipe-1454.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat 1 tablespoon of the butter in a large nonstick skillet over medium heat. Season the salmon with  teaspoon salt and  teaspoon pepper.Cook the fish until opaque throughout, 3 to 5 minutes per side. </li>\n<li>Transfer to individual plates.Meanwhile, fill a second skillet with  inch of water, bring to a boil, and add  teaspoon salt.</li>\n<li>Add the green beans to the second skillet, cover, and steam until just tender, 4 to 5 minutes. </li>\n<li>Drain and transfer to plates.Wipe out the green bean skillet and heat the remaining 3 tablespoons of butter over medium heat.</li>\n<li>Add the almonds and cook, stirring frequently, until almonds and butter are golden brown (but not burned), 2 to 3 minutes. Stir in the capers. Spoon over fish and beans.</li>\n</ol>\n</div>
494005	Grilled Asian Salmon Packets	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-Asian-Salmon-Packets-494005.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place each salmon fillet on a double thickness of heavy-duty foil (about 12 in. square). </li>\n<li>Combine sugar snap peas and peppers; spoon over salmon. </li>\n<li>Drizzle with salad dressing. Fold foil around mixture and seal tightly.</li>\n<li>Grill, covered, over medium heat for 15-20 minutes or until fish flakes easily with a fork. Open foil carefully to allow steam to escape.</li>\n</ol>\n</div>
157206	Roast Salmon and Broccoli with Chile-Caper Vinaigrette	\N	\N	\N	https://spoonacular.com/recipeImages/roast-salmon-and-broccoli-with-chile-caper-vinaigrette-157206.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 400°F. Toss broccoli and2 tablespoons oil on a large rimmed baking sheet;season with salt and pepper. Roast broccoli,tossing occasionally, until crisp-tender,12–15 minutes.</li>\n<li>Rub salmon with 1 tablespoon oil; season withsalt and pepper. Push broccoli to edges ofbaking sheet and place salmon in the center.Roast until salmon is opaque throughoutand broccoli is tender, 10–15 minutes.</li>\n<li>Meanwhile, combine jalapeño, vinegar,and a pinch of salt in small bowl and let situntil jalapeño is slightly softened, about10 minutes. </li>\n<li>Mix in capers and remaining1 tablespoon oil; season with salt and pepper.</li>\n\n<li>Serve salmon and broccoli drizzled withchile-caper vinaigrette.</li>\n<li>Per serving: 410 calories, 25 g fat, 5 g fiber</li>\n<li>Nutritional analysis provided by</li>\n<li>Bon Appétit</li>\n</ol>\n</div>
247371	Baked Salmon with Avocado Mango Salsa	\N	\N	\N	https://spoonacular.com/recipeImages/Baked-Salmon-with-Avocado-Mango-Salsa-247371.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1 Preheat oven to 400°F. While the oven is preheating, prep the mangos.  Either peel and then cut away the mango flesh from the core seed, and then cut the mango into 1/3-inch cubes, or follow the instructions here on How to </li>\n<li>Cut a Mango. Set the cut mango aside in a medium bowl. 2 Line a roasting pan with aluminum foil. </li>\n<li>Spread some olive oil on top of the foil. Coat the salmon fillets with olive oil and lay, skin side down, on the foil lined roasting pan.  Sprinkle with salt. </li>\n<li>Place in the 400°F oven and cook for 10 minutes.3 While the salmon is cooking, prep the other ingredients. </li>\n<li>Cut the avocados in half. </li>\n<li>Remove the seeds. Score the inside of the avocados with a small knife in a cross hatch pattern. Scoop out the avocado pieces and add them to the bowl with the cut mango pieces. (See How to </li>\n<li>Cut and Peel and Avocado.) </li>\n<li>Add the minced red onion, serrano chile, and lime juice to the bowl. Sprinkle with a little salt. Gently fold the ingredients together.</li>\n<li>Serve the salmon fillets with a generous portion of avocado mango salsa.</li>\n</ol>\n</div>
575123	Real Men Cook: Porto-BOOM Panini	\N	\N	\N	https://spoonacular.com/recipeImages/Real-Men-Cook--Porto-BOOM-Panini-575123.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat grill to medium high heat. Season both sides of portobello mushrooms with olive oil, salt, and pepper.Grill mushrooms for 8-10 minutes per side. (will have slight grill marks)Bring Mushrooms in to cool, once cool, slice mushrooms into 1" slices. Set aside to use for assembly.</li>\n<li>Cut mini ciabatta's in half. Put 1 T. of pesto on one side and 1 oz. of crumbled goat cheese on the other side.Arrange 3 slices of portobello on the goat cheese side along with ½ cup of grilled vegetables.</li>\n<li>Place the pesto side on top of the grilled vegetable side and place on panini press. (or on a grill pan)Cook panini for about 4-5 minutes. (cheese will be gooey and you will have a nice crust on your bread) Slice in half and eat! :)</li>\n</ol>\n</div>
599862	Quick and Easy Salmon Patties	\N	\N	\N	https://spoonacular.com/recipeImages/Quick-and-Easy-Salmon-Patties-599862.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Drain salmon, set aside 2 tablespoons of the juice. In a mixing bowl mix together the salmon, egg, and onion until sticky. Stir in flour. </li>\n<li>Add baking powder to the salmon juice, and stir this into the salmon mixture. Form into patties and fry in Crisco until golden brown.</li>\n</ol>\n</div>
313370	Planked Salmon on the Grill	\N	\N	\N	https://spoonacular.com/recipeImages/Planked-Salmon-on-the-Grill-313370.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine all ingredients except salmon and blend to make marinade. Marinate the fish in the refrigerator for 30 minutes to one hour.    Soak the cedar plank in water for a minimum of one hour prior to grilling.    </li>\n<li>Place the marinated fillet skin side down onto the soaked cedar plank. </li>\n<li>Place the planked fish on a hot grill and close the lid. The plank will begin to smoke.    Cooked to desired doneness (usually 10–20 minutes depending on the thickness of the fish).    </li>\n<li>Remove and serve straight from the plank to create a unique presentation.</li>\n</ol>\n</div>
559309	Penne with Cream and Smoked Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Penne-with-Cream-and-Smoked-Salmon-559309.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook the pasta in a saucepan with salted boiling water according to the instructions on the package.Meanwhile, slice the smoked salmon or chop it up into thin strips. Strip the leaves from the thyme sprigs.Melt the butter in a large saucepan. Stir in the cream with about a quarter of the salmon and thyme leaves, then season with pepper. </li>\n<li>Heat gently for 3 to 4 minutes, stirring all the time. Do not allow to boil. Taste the sauce for seasoning.</li>\n<li>Drain the pasta and toss it in the cream and salmon sauce. Divide among four warmed bowls and top with the remaining salmon and thyme leaves. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
149766	Sweet and Spicy Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/sweet-and-spicy-salmon-149766	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place chiles and water in a skillet and simmer until soft, about 2 minutes. </li>\n<li>Add sesame oil and garlic; cook until fragrant, 1 to 2 minutes. Stir in blueberries, apple cider vinegar, sugar and salt. Bring to a boil and cook, mashing berries with a wooden spoon until a thick sauce forms, 5 minutes. </li>\n<li>Remove from heat. Divide sauce over salmon fillets.</li>\n<li>Per serving: 319 calories, 4 g, fat 9 g saturated, 5 g carbohydrates, 5 g fiber, 3 g protein</li>\n<li>Nutritional analysis provided by</li>\n<li>Self</li>\n</ol>\n</div>
379151	Roasted Salmon & White Bean Spinach Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Salmon---White-Bean-Spinach-Salad-379151.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place salmon on a greased 15-in. x 10-in. x 1-in. baking pan; sprinkle with salt and pepper. </li>\n<li>Bake at 400° for 11-13 minutes or until fish flakes easily with a fork. Cool slightly.</li>\n<li>Meanwhile, in a large bowl, toss beans with vinaigrette; set aside.</li>\n<li>Just before serving, add spinach and onion to bean mixture; toss to combine. Divide among four plates. Top with salmon.</li>\n</ol>\n</div>
493889	Salmon Baked In Cream With Sweet Bay, Thyme And Dill	\N	\N	\N	https://spoonacular.com/recipeImages/Salmon-Baked-In-Cream-With-Sweet-Bay--Thyme-And-Dill-493889.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 400°F.</li>\n<li>Place the salmon fillets in a single layer in a small baking dish or gratin dish.Top each fillet with a bay leaf.</li>\n<li>Pour the heavy cream over the salmon and sprinkle with the thyme and dill.</li>\n<li>Bake until the fish flakes easily when pierced with a fork and the cream thickens, about 15 minutes.Discard the bay leaves and serve, spooning warm cream and herbs over the fish.Find more salmon recipes on Food Republic:Citrus-Poached Salmon With Dijon Mustard Sauce Recipe</li>\n<li>Cedar-Plank Sockeye Salmon With Hazelnut Vinaigrette Recipe</li>\n<li>Proscuitto-Wrapped Salmon Recipe</li>\n</ol>\n</div>
346939	Pecan-and-Dill-Crusted Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Pecan-and-Dill-Crusted-Salmon-346939.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 400°. Pulse first 4 ingredients in a food processor 5 or 6 times or until mixture resembles coarse crumbs. Sprinkle salmon with salt and pepper; place on a parchment paper-lined baking sheet. </li>\n<li>Spread pecan mixture over salmon. </li>\n<li>Bake 18 to 20 minutes or just until salmon flakes with a fork.</li>\n</ol>\n</div>
19307	Grilled Salmon and Spinach Salad with Peach Dressing	\N	\N	\N	https://spoonacular.com/recipeImages/grilled_salmon_and_spinach_salad_with_peach_dressing-19307.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine first 5 ingredients in a shallow bowl.Rub salmon with brown sugar mixture. </li>\n<li>Place fillets, skin-side down, on grill rack coated with cooking spray. Grill over medium-high heat (350° to 400°) 12 minutes or until desired degree of doneness. </li>\n<li>Remove skin and discard.Toss spinach with 1/3 cup Peach Dressing. Arrange spinach on individual serving plates, top with salmon, and drizzle with remaining dressing.</li>\n</ol>\n</div>
273352	BBQ Salmon Bacon Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/BBQ-Salmon-Bacon-Sandwich-273352.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>PREHEAT greased grill to medium-high heat.  </li>\n<li>Brush salmon fillets with 1/4 cup of the barbecue sauce. GRILL 10 to 12 min. or until fish flakes easily with fork, turning once. SPREAD bottom of rolls with remaining 1/4 cup barbecue sauce.   Top each with salmon fillet, bacon slice, lettuce leaf and top half of roll.</li>\n</ol>\n</div>
44046	Salmon, Pea And Mint Puree And New Potatoes	\N	\N	\N	https://spoonacular.com/recipeImages/salmon_pea_and_mint_puree_and_new_potatoes-44046.jpg	http://www.ifyoucanmakethatyoucanmakethis.com/archives/1249
658483	Roasted Alaskan Salmon with Cherries	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Alaskan-Salmon-with-Cherries-658483.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 350F.In a large bowl, toss together cherries, lemon juice, honey and thyme. Arrange salmon skin-side down on a large parchment or foil-lined baking sheet, sprinkle with a pinch of sea salt and black pepper. Scatter cherry mixture over and around salmon and bake 12-15 minutes. Switch oven to broil and cook an additional 3 minutes until salmon is just cooked through and cherries are juicy and caramelized, (you want the thickest part of the fish to reach an internal temperature of 131 degrees F on an instant-read thermometer). </li>\n<li>Remove the salmon from the oven and allow to rest, uncovered, for 5 minutes.</li>\n</ol>\n</div>
576717	Parmesan Pecan Crusted Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Parmesan-Pecan-Crusted-Salmon-576717.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 425 degrees F.In a small bowl mix together the pecans, parmesan cheese, basil, salt and pepper.  Set aside.</li>\n<li>Place the melted butter in a medium sized bowl and coat each piece of salmon with the butter, then dredge in the parmesan pecan mixture.  </li>\n<li>Place on a baking sheet.  </li>\n<li>Bake for 12-15 minutes or until fish flakes easily with a fork.</li>\n</ol>\n</div>
593095	Parmesan-Baked Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Parmesan-Baked-Salmon-593095.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 400 degrees F. Line a baking sheet with foil.Leave skin on the salmon and cut into four equal portions. </li>\n<li>Place salmon on baking prepared baking sheet, skin side down.In a small bowl, whisk together mayonnaise, cayenne, and Parmesan cheese.Squeeze lemon juice evenly over salmon fillets. </li>\n<li>Spread ¼ of mayonnaise mixture over each filet. Top each filet with crushed crackers to form a crust.</li>\n<li>Bake for 12 to 15 minutes, until salmon is med well to well done and crackers are golden brown.Carefully slide a spatula between the skin and meat of the salmon. The skin will stick to the foil, and the meat will slide off for plating. You’ll be left with skin stuck on the foil; wad up the foil and toss. Easy cleaning.</li>\n</ol>\n</div>
85230	Salsa and Mango-Pepper Crusted Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/salsa-and-mango-pepper-crusted-salmon-2-85230.jpg	http://www.food.com/recipe/salsa-and-mango-pepper-crusted-salmon-454466
85241	Sweet and Spicy Salmon Fillets	\N	\N	\N	https://spoonacular.com/recipeImages/sweet-and-spicy-salmon-fillets-2-85241.jpg	http://www.food.com/recipe/sweet-and-spicy-salmon-fillets-392793
290093	Napa Valley Wine Planked Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Napa-Valley-Wine-Planked-Salmon-290093.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large zip-top bag, combine salmon, Champagne vinaigrette, and mustard. Squeeze out air and seal bag. Gently massage bag so that everything is thoroughly combined. Marinate in refrigerator for 30 minutes.Set up grill for direct cooking over medium-high heat. </li>\n<li>Remove salmon from marinade and discard marinade. </li>\n<li>Place on wine-soaked plank, season with salt and pepper and coverwith herbs. </li>\n<li>Place planked salmon on grill. Cover grill and cook for 8 to 12 minutes or until done. </li>\n<li>Remove from grill and serve hot.INDOOR: Marinate and prepare salmon as directed. Preheat oven to 450 degrees F. </li>\n<li>Remove salmon fillets from marinade and place on a baking sheet lined with foil. Season with salt and pepper and cover with herbs. Roast for 8 to 10 minutes, remove from oven and let stand tented with foil for 5 minutes. </li>\n<li>Serve hot.</li>\n</ol>\n</div>
85405	Salmon and Leeks Baked in Parchment	\N	\N	\N	https://spoonacular.com/recipeImages/salmon-and-leeks-baked-in-parchment-2-85405.png	http://www.marthastewart.com/318725/salmon-and-leeks-baked-in-parchment
85442	Grilled Salmon and Asparagus With Balsamic Butter	\N	\N	\N	https://spoonacular.com/recipeImages/grilled-salmon-and-asparagus-with-balsamic-butter-2-85442.jpg	http://www.food.com/recipe/grilled-salmon-and-asparagus-with-balsamic-butter-385534
683484	Pan Seared Salmon with Sage Brown Butter Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Pan-Seared-Salmon-with-Sage-Brown-Butter-Sauce-683484.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring a large skillet to medium high heat.Pat the salmon dry and season the flesh side of the salmon using 1 teaspoon of sea salt.</li>\n<li>Add the olive oil to the hot skillet and immediately add the salmon to the pan flesh side down. </li>\n<li>Saute the salmon for 4-5 minutes until browned.Gently flip the salmon to saute on the skin side for another 4-6 minutes. (it may take longer depending on thickness of your salmon. </li>\n<li>Remove from pan and let sit to cool.In the meantime, bring a small skillet to medium heat.</li>\n<li>Add butter and  teaspoon of sea salt to the pan and melt.Once the butter is melted, add the honey, sage, and nutmeg. Stir and let the butter begin to brown, for about 5 minutes. Be sure to stir throughout cooking process so the butter does not burn. </li>\n<li>Remove from heat.</li>\n<li>Serve salmon with drizzle of sage brown butter sauce. (i used about 1 tablespoon for each salmon filet)</li>\n</ol>\n</div>
85464	Lemon and Butter Herb Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/lemon-and-butter-herb-salmon-2-85464.jpg	http://www.food.com/recipe/lemon-and-butter-herb-salmon-446273
667231	Baked Salmon with Garlic and Dijon	\N	\N	\N	https://spoonacular.com/recipeImages/Baked-Salmon-with-Garlic-and-Dijon-667231.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, mix together: 2 Tbsp chopped parsley, 2-3 pressed cloves garlic,  Tbsp Dijon mustard,  tsp salt,  tsp of pepper,  cup of olive oil and 2 Tbsp of lemon juice.Slice salmon into even portions. Lay them onto a lined baking dish with the skin-side-down.Generously brush all sides of salmon with sauce and top with fresh slices of lemon.</li>\n<li>Bake at 450F for 12-15 min or until just cooked through and flaky. Don't over-cook or it will be dry. There you have it! An easy, excellent dish.</li>\n</ol>\n</div>
487020	Cilantro Lime Salmon Taquitos	\N	\N	\N	https://spoonacular.com/recipeImages/Cilantro-Lime-Salmon-Taquitos-487020.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix the salmon, salsa, cheese and cilantro.Working one at a time, warm the tortillas in a damp paper towel in the microwave for 20 seconds to soften, place 2 tablespoons of the mixture in the centre, roll the tortilla up and pin it closed with a toothpick.</li>\n<li>Heat the oil in a large skillet, working in batches add the rolls and cook until golden brown and crispy on all sides, about 4-6 minutes, and set aside on paper towels.Enjoy while warm with salsa verde, sour cream and guacamole for dipping or make a meal out of it and serve them on a bed of lettuce topped with guacamole, pico de gallo, crumbled queso fresco and hot sauce!</li>\n</ol>\n</div>
85822	Herb and Citrus Salmon Pockets	\N	\N	\N	https://spoonacular.com/recipeImages/herb-and-citrus-salmon-pockets-2-85822.jpg	http://www.food.com/recipe/herb-and-citrus-salmon-pockets-28318
593806	Phyllo Wrapped Salmon with Pesto and Cheese	\N	\N	\N	https://spoonacular.com/recipeImages/Phyllo-Wrapped-Salmon-with-Pesto-and-Cheese-593806.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat over to 350 degrees.Gather all of your ingredients and utensils.</li>\n<li>Place 1 sheet of phyllo dough on a work surface.Sprinkle 1 Tablespoon Parmesan cheese over the phyllo dough.</li>\n<li>Place a second sheet of phyllo dough over the first piece and spray lightly with cooking spray.</li>\n<li>Place one salmon fillet about 2 inches from the left hand side of the prepared phyllo dough.Season with salt and pepper.Top with 1 Tablespoon pesto and 1/4 cup of mozzarella cheese.Fold the long sides up over the salmon and then roll up so that the pesto and cheese are on the top (not the bottom.) Tuck extra phyllo dough underneath.Lightly spray the top of the wrap with cooking spray.Repeat for each salmon fillet.</li>\n<li>Bake uncovered for 20 to 25 minutes or until the internal temperature reaches 145 degrees. If the phyllo doughs begins to brown too much, then tent it with aluminum foil.Enjoy!</li>\n</ol>\n</div>
716674	Cilantro Lime Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/cilantro-lime-salmon-716674.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 450 degrees. Generously season salmon with salt and pepper, add a dash of cumin and half of the lime zest. Arrange salmon in a shallow baking  pan. Roast until salmon is flaky, about 10 to 13 minutes. Use a flat spatula to remove  fillets.</li>\n<li>In a small bowl, whisk together lime juice, soy sauce, and  sugar; fold in cilantro and lime zest. Spoon sauce over fish. I served mine with a roasted sesame asparagus - I'll share that recipe here soon.Please let me know if you give this recipe a try, it's a new staple in our house! Recipe adapted from Martha Stewart Food*</li>\n</ol>\n</div>
602041	Ginger Cilantro Salmon Cakes	\N	\N	\N	https://spoonacular.com/recipeImages/Ginger-Cilantro-Salmon-Cakes-602041.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add all ingredients except for the lard to a large mixing bowl and combine evenly using your hands.</li>\n<li>Transfer mixture to a food processor and pulse until salmon is broken down somewhat. Do not overdo this or you will have a salmon slurry. You still want your salmon somewhat chunky</li>\n<li>Melt lard in a 12 inch cast iron skillet over medium heat.While skillet is heating, form salmon mixture into patties.Fry salmon patties in cast iron skillet for 3-4 minutes per side.</li>\n<li>Serve with Crispy Salmon Skins and enjoy.</li>\n</ol>\n</div>
4165	Red Mullet With Cherry Tomatoes And Garlic Crumbs	\N	\N	\N	https://spoonacular.com/recipeImages/red-mullet-with-cherry-tomatoes-and-garlic-crumbs-2-4165.jpg	http://www.donnahay.com.au/recipes/mains/seafood/red-mullet-with-cherry-tomatoes-and-garlic-crumbs
176439	Grilled Dilled Salmon and Vegetable Packs	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-Dilled-Salmon-and-Vegetable-Packs-176439.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat gas or charcoal grill. </li>\n<li>Cut salmon fillet into 4 serving pieces.</li>\n<li>2</li>\n<li>In small bowl, mix oil, dill weed, parsley and garlic salt. In heavy-duty foil bag, place salmon, tomatoes, squash and pea pods. </li>\n<li>Brush oil mixture over salmon and vegetables. Double-fold open end of bag.</li>\n<li>3</li>\n\n<li>Place bag on grill. Cover grill; cook over medium heat 15 to 20 minutes or until salmon flakes easily with fork. </li>\n<li>Place bag on serving plate; unfold.</li>\n</ol>\n</div>
4429	Grilled Cedar-Plank Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/grilled_cedar-plank_salmon-4429.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat grill to medium. Season the salmon with 1/2 teaspoon salt and 1/4 teaspoon pepper; arrange on the plank. </li>\n<li>Place the plank on the grill and cook, covered, until the salmon is opaque and flakes easily, 12 to 15 minutes. In a bowl, combine the cucumber, jalapeño, lemon juice, oil, and 1/2 teaspoon salt. </li>\n<li>Serve with the salmon.</li>\n</ol>\n</div>
4672	Salmon with Maple Syrup and Toasted Almonds	\N	\N	\N	https://spoonacular.com/recipeImages/salmon_with_maple_syrup_and_toasted_almonds-4672.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 425°.</li>\n<li>Place fillets in a 13 x 9-inch baking dish coated with cooking spray. </li>\n<li>Combine sugar, syrup, soy sauce, mustard, and black pepper; pour sugar mixture over fillets. Cover with foil; bake at 425° for 10 minutes. </li>\n<li>Remove foil; sprinkle the fillets with almonds. </li>\n<li>Bake an additional 10 minutes or until fish flakes easily when tested with a fork. </li>\n<li>Serve with sugar mixture.</li>\n</ol>\n</div>
4448	Roast Salmon With Miso Glaze And Sugar Snap Peas	\N	\N	\N	https://spoonacular.com/recipeImages/roast_salmon_with_miso_glaze_and_sugar_snap_peas-4448.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Arrange racks in upper and lower thirds of oven and preheat to  </li>\n<li>Brush 2 large rimmed baking sheets with oil. Pure teriyaki sauce, miso, and white parts of scallions in a blender on low speed until smooth. Arrange salmon fillets on a prepared baking sheet. </li>\n<li>Spread miso mixture over salmon, dividing evenly. Roast salmon on top rack until almost cooked through, about 7 minutes.</li>\n<li>Meanwhile, toss 1 Tbsp. oil and sugar snap peas on remaining baking sheet and season with salt. Roast peas on bottom rack until crisp-tender, about 3 minutes. </li>\n<li>Transfer salmon to plates and sprinkle with green parts of scallions. Divide peas among plates.</li>\n</ol>\n</div>
4507	Salmon With Peas, Pea Tendrils, And Dill-cucumber Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/salmon_with_peas_pea_tendrils_and_dill-cucumber_sauce-4507.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Brush small rimmed baking sheet with 1 tablespoon oil. </li>\n<li>Place salmon on prepared baking sheet. </li>\n<li>Mix orange juice and lemon juice in small bowl; pour over salmon. </li>\n<li>Drizzle remaining 1 tablespoon oil over salmon; sprinkle with coarse kosher salt and pepper. </li>\n<li>Let stand 15 minutes.</li>\n<li>Preheat broiler. Broil salmon, without turning fish over, until just opaque in center, watching closely and turning baking sheet once for even broiling, about 12 minutes. Using 2 wide spatulas, transfer salmon to platter. Surround with Peas and Pea Tendrils with Lemon Dressing. </li>\n<li>Serve with Dill-Cucumber Sauce.</li>\n</ol>\n</div>
4514	Salmon With Honey-coriander Glaze	\N	\N	\N	https://spoonacular.com/recipeImages/salmon-with-honey-coriander-glaze-2-4514.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Lightly brush the top of each salmon fillet with glaze; reserve remainder. </li>\n<li>Heat oil in the nonstick skillet over medium heat until hot but not smoking. Cook salmon fillets, glazed sides down, 1 minute; reduce heat to medium-low, and cook 2 minutes more. Turn fillets over, and cook 3 minutes for medium-rare (salmon will be slightly pink in the middle), or longer if desired. </li>\n<li>Transfer to a plate; loosely cover with foil to keep warm.</li>\n</ol>\n</div>
4519	Broiled Salmon With Spinach-and-feta Saute	\N	\N	\N	https://spoonacular.com/recipeImages/broiled-salmon-with-spinach-and-feta-saute-2-4519.jpg	http://www.marthastewart.com/316859/broiled-salmon-with-spinach-and-feta-sau
4534	Salmon With Corn And Tomato Relish	\N	\N	\N	https://spoonacular.com/recipeImages/salmon_with_corn_and_tomato_relish-4534.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>This is what I had.  Leftover grilled corn.  Some heirloom tomatoes from my garden and olive oil, balsamic vinegar, salt, and pepper.  I ended up using some fresh basil from my garden also, but it was an afterthought so it did not make its way into the picture.</li>\n<li>I took the corn of the cob, sliced up the tomatoes, drizzled a little olive oil and vinegar over it and seasoned it with salt and pepper.  Done.  Set it aside.</li>\n<li>I put the salmon  in a screaming hot pan with a little olive oil and just seasoned with salt and pepper.  I roasted some fingerling potatoes the same way, olive oil, salt and pepper.  I had some rosemary so I threw that into the pan as well.  Steamed some asparagus and dinner was ready.  Right before I served, I added some chopped basil to my corn mixture.</li>\n</ol>\n</div>
4584	Blackened Salmon With Hash Browns and Green Onions	\N	\N	\N	https://spoonacular.com/recipeImages/blackened_salmon_with_hash_browns_and_green_onions-4584.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Remove and discard root ends and 1 inch of top green portions of green onions, and set green onions aside.Toss together hash browns, dill, and salt in a large bowl.</li>\n<li>Heat 2 tablespoons oil in a large nonstick skillet over medium heat. </li>\n<li>Add hash brown mixture in an even layer, and cook 5 minutes or until lightly browned. (Do not stir.) </li>\n<li>Place a lightly greased baking sheet, greased side down, onto skillet; invert hash browns onto baking sheet. </li>\n<li>Place skillet back on heat. Slide hash browns back into skillet, cooked side up, and cook 5 more minutes or until golden brown.Press hash browns down with a spatula to flatten. </li>\n<li>Remove from skillet onto same lightly greased baking sheet, and keep warm in oven at 300°. Sprinkle blackened seasoning evenly over fillets.Cook salmon in 1 tablespoon hot oil in same nonstick skillet over medium heat 4 to 6 minutes on each side or just until fish begins to flake with a fork. </li>\n<li>Remove from pan onto serving plates.Sauté green onions in remaining 1 tablespoon hot oil in same nonstick skillet over medium heat 4 minutes or until tender; remove from pan, and serve with salmon and hash browns.Note: For testing purposes only, we used Old Bay Blackened Seasoning. Use a skillet with flared sides so the cooked hash browns slide out of the pan easily.</li>\n</ol>\n</div>
4627	Cedar-Planked Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/cedar-planked_salmon-4627.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Soak cedar plank in water at least 30 minutes. </li>\n<li>Remove pin bones from salmon, if necessary, and coat fish evenly with rub. Cover with plastic wrap or foil, and chill until ready to grill. </li>\n<li>Drain plank, and grill over medium-high heat (350° to 400°) for 3 minutes or until grill marks appear. </li>\n<li>Remove from grill. </li>\n<li>Place salmon, skin side down, on heated side of plank. Top with lemon slices. </li>\n<li>Place planked salmon on grill, cover, and grill 20 minutes or until desired degree of doneness. (Check occasionally to make sure edges of plank don't ignite.) </li>\n<li>Garnish, if desired.</li>\n</ol>\n</div>
4654	Smoke-grilled Salmon With Fennel And Tarragon	\N	\N	\N	https://spoonacular.com/recipeImages/smoke-grilled-salmon-with-fennel-and-tarragon-2-4654.jpg	http://www.williams-sonoma.com/recipe/smoke-grilled-salmon-with-fennel-and-tarragon.html
233262	Peach Sangria	\N	\N	\N	https://spoonacular.com/recipeImages/Peach-Sangria-233262.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix 24 oz. peach nectar, 1 (750 ml) bottle white wine, 1 sliced orange and peach wedges from 1 (15 oz.) can (drained) in pitcher; chill for 1 hour. When ready to serve, add 1 liter club soda and ice cubes to pitcher and stir well. </li>\n<li>Garnish with more orange slices and peach wedges, if desired.</li>\n</ol>\n</div>
324170	Grapefruit and Honey Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/Grapefruit-and-Honey-Salmon-324170.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Juice 1 grapefruit into a bowl. </li>\n<li>Cut the peel and pith from the other grapefruit. </li>\n<li>Remove the flesh from the membranes with a sharp knife, adding any juice to the juice in the bowl. Reserve the grapefruit segments.Boil the reserved juice, honey and 1/4 teaspoon each salt and pepper in a small saucepan until reduced by half and slightly syrupy, 4 to 6 minutes.Toss the grapefruit segments with the shallots, oil, parsley, 1/2 teaspoon salt and 1/4 teaspoon pepper.Bring a large, straight-sided skillet with 4 cups of well-salted water to a simmer; the water should cover the salmon. </li>\n<li>Add the salmon to the skillet and remove from the heat. </li>\n<li>Let the salmon cook in the hot water until just cooked through, 5 to 7 minutes.</li>\n<li>Transfer the salmon to paper towels and pat dry. </li>\n<li>Place on serving plates. </li>\n<li>Drizzle the salmon with the sauce and top with the grapefruit salad.</li>\n</ol>\n</div>
4705	Grilled Wild Salmon with Roasted Beets and Arugula	\N	\N	\N	https://spoonacular.com/recipeImages/grilled_wild_salmon_with_roasted_beets_and_arugula-4705.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Scrub beets thoroughly; remove greens and save for another use. </li>\n<li>Drizzle lightly with olive oil, and place in a roasting pan. </li>\n<li>Bake, covered with foil, at 400° for 30 minutes or until tender. Rub the skins off beets with a towel, and slice.</li>\n<li>Remove any bones from the salmon. </li>\n<li>Brush with olive oil, and season lightly with salt and pepper. Grill salmon over medium-hot coals on both sides until medium rare (translucent in the center). </li>\n<li>Drizzle plates with Balsamic Reduction. Top with beet slices and arugula. </li>\n<li>Cut salmon into serving pieces, and place on plates.</li>\n</ol>\n</div>
4713	Orange-Spiced Salmon with Spaghetti Squash	\N	\N	\N	https://spoonacular.com/recipeImages/orange-spiced_salmon_with_spaghetti_squash-4713.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 450°.</li>\n<li>Combine first 5 ingredients in a bowl. </li>\n<li>Combine 2 tablespoons sugar mixture and squash; toss gently. Arrange squash in an 11 x 7-inch baking dish coated with cooking spray. Arrange salmon on top of squash; brush with mustard. Sprinkle fish with remaining sugar mixture. </li>\n<li>Bake at 450° for 15 minutes or until fish flakes easily when tested with a fork. </li>\n<li>Garnish with parsley sprigs, if desired.</li>\n</ol>\n</div>
4720	Salmon with Orange-Fennel Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/salmon_with_orange-fennel_sauce-4720.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine first 4 ingredients in a large zip-top plastic bag; add fish. Seal and marinate in refrigerator 20 minutes, turning once.Prepare broiler.</li>\n<li>Remove fish from bag, reserving marinade. </li>\n<li>Place fish, skin sides down, on a broiler pan coated with cooking spray; sprinkle with salt and pepper. Broil 10 minutes or until fish flakes easily when tested with a fork.Bring reserved marinade to a boil in a small saucepan. Reduce heat, and simmer 3 minutes. </li>\n<li>Serve sauce with fish.</li>\n</ol>\n</div>
4728	Broiled Salmon with Honey and Vermouth	\N	\N	\N	https://spoonacular.com/recipeImages/broiled_salmon_with_honey_and_vermouth-4728.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat broiler.</li>\n<li>Combine first 6 ingredients in a small bowl; stir with a whisk. </li>\n<li>Place salmon on a broiler pan coated with cooking spray; brush with half of honey mixture. Broil 8 minutes or until fish flakes easily when tested with a fork, basting frequently with remaining honey mixture.</li>\n</ol>\n</div>
4729	Apple and Horseradish-Glazed Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/apple_and_horseradish-glazed_salmon-4729.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350°.</li>\n<li>Combine apple jelly, chives, horseradish, vinegar, and 1/4 teaspoon salt, stirring well with a whisk.Sprinkle salmon with 1/4 teaspoon salt and pepper. </li>\n<li>Heat oil in a large nonstick skillet over medium heat. </li>\n<li>Add salmon, and cook 3 minutes. Turn salmon over; brush with half of apple mixture. Wrap handle of skillet with foil; bake at 350° for 5 minutes or until fish flakes easily when tested with a fork. </li>\n<li>Brush with remaining apple mixture.</li>\n</ol>\n</div>
4747	Grilled Salmon with Garlic, Lemon, and Basil	\N	\N	\N	https://spoonacular.com/recipeImages/grilled_salmon_with_garlic_lemon_and_basil-4747.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>To prepare sauce, combine first 5 ingredients in a small bowl; set aside.To prepare fish, heat a nonstick grill pan over medium-high heat. Coat pan with cooking spray. Sprinkle fish evenly with salt and pepper; add fish to pan. Cover and grill 4 minutes on each side or until fish flakes easily when tested with a fork or until desired degree of doneness. </li>\n<li>Serve with sauce.</li>\n</ol>\n</div>
4753	Red Curry Salmon With Bok Choy And Pineapple Slaw	\N	\N	\N	https://spoonacular.com/recipeImages/red_curry_salmon_with_bok_choy_and_pineapple_slaw-4753.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a medium bowl, toss the bok choy and pineapple with the cilantro, 3 tablespoons of the oil,  teaspoon salt, and  teaspoon pepper. </li>\n<li>Let sit for 15 minutes before serving.Meanwhile, heat broiler. In a small bowl, mix together the curry paste, sugar, the remaining tablespoon of oil,  teaspoon salt, and  teaspoon pepper.</li>\n<li>Place the salmon on a foil-lined broilerproof baking sheet and, dividing evenly, brush with the curry paste mixture. Broil until the salmon is opaque throughout, 5 to 7 minutes. </li>\n<li>Serve with the slaw.</li>\n</ol>\n</div>
4775	Salmon with Sweet-and-Sour Pan Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/salmon_with_sweet-and-sour_pan_sauce-4775.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oil in a large nonstick skillet over low heat.</li>\n<li>Combine broth and next 5 ingredients (broth through garlic).Increase heat to medium-high, and heat 3 minutes.While pan heats, sprinkle fillets with salt and pepper. </li>\n<li>Add fillets to pan; cook 4 minutes on each side or until fish flakes easily when tested with a fork. </li>\n<li>Remove fillets from pan.</li>\n<li>Drain fat from pan, and discard fat. </li>\n<li>Add broth mixture to pan, scraping to loosen browned bits. Bring to a boil; cook 30 seconds. </li>\n<li>Remove from heat. </li>\n<li>Serve sauce over fish.</li>\n</ol>\n</div>
86715	Fast Asian Fish	\N	\N	\N	https://spoonacular.com/recipeImages/fast-asian-fish-2-86715.jpg	http://www.food.com/recipe/fast-asian-fish-306248
165624	Minted Cranberry Relish	\N	\N	\N	https://spoonacular.com/recipeImages/Minted-Cranberry-Relish-165624.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In food processor bowl with metal blade, place orange pieces. Cover; process, using quick on-and-off motions, about 15 seconds or until finely chopped. </li>\n<li>Add cranberries; process until finely chopped.</li>\n<li>2</li>\n<li>In nonmetal container, combine cranberry mixture, sugar, walnuts and mint. Stir in liqueur. </li>\n<li>Let stand at least 3 hours before serving to blend flavors. Store in refrigerator up to 1 week.</li>\n</ol>\n</div>
126773	Orange Ice Cream Soda	\N	\N	\N	https://spoonacular.com/recipeImages/orange-ice-cream-soda-2-126773.jpg	http://www.food.com/recipe/orange-ice-cream-soda-218910
594615	Baked Salmon with Honey Dijon and Garlic	\N	\N	\N	https://spoonacular.com/recipeImages/Baked-Salmon-with-Honey-Dijon-and-Garlic-594615.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 425 degrees and line a large baking sheet with foil. </li>\n<li>Place salmon pieces on top of the foil and set aside.In a medium bowl, whisk together garlic, parsley, honey Dijon, lemon juice, salt, and olive oil. </li>\n<li>Whisk well until well-combined then using a pastry brush, brush on the sauce onto the salmon pieces.</li>\n<li>Bake uncovered for 15-20 minutes (or depending on how thick your slices of salmon are, you may need to reduce the time by 2-3 minutes or increase it by 2-3 minutes - just keep an eye on it!)</li>\n<li>Serve with your favorite sides (we served it with a side of Israeli couscous).</li>\n</ol>\n</div>
4809	Roasted Salmon With Lime And Cilantro	\N	\N	\N	https://spoonacular.com/recipeImages/roasted-salmon-with-lime-and-cilantro-2-4809.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 450 degrees. Arrange salmon in a shallow baking pan. Season with salt and pepper. Roast until no longer pink in the middle and flaky, 10 to 13 minutes. Using a flat spatula, remove fillets, leaving skin on the baking sheet.</li>\n</ol>\n</div>
4825	Roasted Salmon With Parsnips And Ginger	\N	\N	\N	https://spoonacular.com/recipeImages/roasted-salmon-with-parsnips-and-ginger-2-4825.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 425 degrees. </li>\n<li>Place parsnips on a rimmed baking sheet and toss with 2 tablespoons safflower oil. </li>\n<li>Spread in a single layer on the pan and roast until beginning to brown around the edges, about 15 minutes. Meanwhile, combine ginger, rosemary, tamari, orange juice, and remaining safflower oil in a small bowl.</li>\n</ol>\n</div>
86760	Parmesan Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/parmesan-salmon-2-86760.jpg	http://www.food.com/recipe/parmesan-salmon-74438
4845	Tomato, Basil, And Balsamic Salmon	\N	\N	\N	https://spoonacular.com/recipeImages/tomato_basil_and_balsamic_salmon-4845.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Bake at 400 for 12-14 minutes depending on the thickness of the fish filets and how many parchment packets you are baking at a time. I also prefer my salmon on the medium-rare side versus overcooked and dry. Open the parchment packet and make sure the salmon is cooked to your desired doneness by cutting into it with a fork and knife. </li>\n<li>Serve with rice, couscous or red potatoes for a great meal.</li>\n<li>Pin It</li>\n</ol>\n</div>
761087	Tomato Marmalade with Blood Oranges	\N	\N	\N	https://spoonacular.com/recipeImages/tomato-marmalade-with-blood-oranges-761087.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Dip tomatoes in boiling water long enough to loosen skins, about 1 minute. </li>\n<li>Drain in colander, and remove skins. Chop tomatoes, and place in large preserving pan. Peel lemon and oranges, and reserve rinds. Slice fruit, and remove seeds. Chop fruit, and add to tomatoes. Shred reserved rinds in food processor,  or cut into thin shreds with sharp knife.  </li>\n<li>Add to tomatoes. Preheat oven to 375F.Bring tomato mixture to a rolling boil over high heat, and cook 8 minutes. Meanwhile, place sugar in pan, and set pan in oven 8 minutes. </li>\n<li>Remove sugar from oven, and pour into tomatoes, stirring constantly until shredded rinds become  transparent, about 15 minutes. </li>\n<li>Pour marmalade into hot, sanitized preserve jars, and seal with screw-on lids by turning jars upside down 5 minutes before setting upright. </li>\n<li>Let marmalade stand two weeks before using.</li>\n</ol>\n</div>
400681	Orange Blueberry Freezer Jam	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-Blueberry-Freezer-Jam-400681.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse four clean 1-cup plastic containers with lids with boiling water. Dry thoroughly.</li>\n<li>Preheat oven to 250°. </li>\n<li>Place sugar in a shallow baking dish; bake 15 minutes. Meanwhile, finely grate 1 tablespoon peel from orange. Peel and chop orange.</li>\n<li>In a large bowl, combine blueberries, warm sugar, grated peel and chopped orange; let stand 10 minutes, stirring occasionally. </li>\n<li>Add pectin; stir constantly for 3 minutes to evenly distribute pectin.</li>\n<li>Immediately fill all containers to within 1/2 in. of tops. Wipe off top edges of containers; immediately cover with lids. </li>\n<li>Let stand at room temperature 24 hours.</li>\n<li>Jam is now ready to use. Refrigerate up to 3 weeks or freeze up to 12 months. Thaw frozen jam in refrigerator before serving.</li>\n</ol>\n</div>
204260	Quick Pickled Fennel with Orange	\N	\N	\N	https://spoonacular.com/recipeImages/Quick-Pickled-Fennel-with-Orange-204260.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Wash fennel bulbs and remove stems. Slice in half and cut out the hard core.</li>\n<li>2</li>\n<li>Slice paper-thin on a mandoline.</li>\n<li>3</li>\n<li>Sprinkle kosher salt over shaved fennel and toss to combine. </li>\n<li>Let fennel sit for at least an hour.</li>\n<li>4</li>\n<li>When time is up, pour fennel into a colander and squeeze to remove the liquid that was produced while it sat with the salt.</li>\n<li>5</li>\n<li>Return fennel to the bowl and toss with orange slices and black pepper.</li>\n<li>6</li>\n<li>Pack fennel and orange into a quart jar and top with the apple cider vinegar.</li>\n<li>7</li>\n<li>Use a chopstick or the end of a wooden spoon to work the vinegar down into the fennel.</li>\n<li>8</li>\n<li>Stash jar in the fridge and let sit for at least 24 hours before eating.</li>\n<li>9</li>\n<li>This quick pickle will keep at least 2-3 weeks in the refrigerator.</li>\n</ol>\n</div>
409081	Orange Creme Sodas	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-Creme-Sodas-409081.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place two scoops ice cream in each of four chilled 16-oz. glasses. In a large pitcher, combine the soda and extract. </li>\n<li>Pour over ice cream.</li>\n</ol>\n</div>
581314	The Famous Orange Julius	\N	\N	\N	https://spoonacular.com/recipeImages/The-Famous-Orange-Julius-581314.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients in the jar in order listed</li>\n<li>Blendtec: Press the WHOLE JUICE button</li>\n<li>Vitamix: Select VARIABLE, speed # Turn on machine and quickly increase speed to #10; then to HIGH. Run for 1 minute or until smooth.</li>\n</ol>\n</div>
524051	cranberry sauce with apple and orange	\N	\N	\N	https://spoonacular.com/recipeImages/cranberry-sauce-with-apple-and-orange-524051.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Stir together cranberries, apples, brown sugar, orange juice, allspice and salt in a large saucepan.  </li>\n<li>Place over medium heat and bring to a simmer, stirring often.  Continue cooking, stirring often until the cranberries have popped and the mixture thickens, about 5 minutes.  </li>\n<li>Remove from heat. Meanwhile, zest orange. To supreme the orange: </li>\n<li>Cut skin and white pith off the orange.  </li>\n<li>Cut between membranes to remove individual segments, working all the way around the orange.  Gently stir the zest and orange segments into the compote.  Discard orange membrane and peel.  Cool compote completely, about 2 hours.</li>\n</ol>\n</div>
147323	Canelazo Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/canelazo_recipe-147323.jpg	http://www.chow.com/recipes/11168-canelazo
524156	Cranberry Compote with Apple and Orange	\N	\N	\N	https://spoonacular.com/recipeImages/Cranberry-Compote-with-Apple-and-Orange-524156.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Stir together cranberries, apples, brown sugar, orange juice, allspice and salt in a large saucepan.  </li>\n<li>Place over medium heat and bring to a simmer, stirring often.  Continue cooking, stirring often until the cranberries have popped and the mixture thickens, about 5 minutes.  </li>\n<li>Remove from heat. Meanwhile, zest orange. To supreme the orange: </li>\n<li>Cut skin and white pith off the orange.  </li>\n<li>Cut between membranes to remove individual segments, working all the way around the orange.  Gently stir the zest and orange segments into the compote.  Discard orange membrane and peel.  Cool compote completely, about 2 hours.</li>\n</ol>\n</div>
368584	Orange Cream Slush	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-Cream-Slush-368584.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Pour orange juice into 2-qt. freezer container; cover and freeze for 2 hours or until slushy, stirring twice.</li>\n<li>To serve, pour slush into eight glasses. </li>\n<li>Add a scoop of ice cream to each glass. </li>\n<li>Garnish with orange slices if desired.</li>\n</ol>\n</div>
508029	White Sangria	\N	\N	\N	https://spoonacular.com/recipeImages/White-Sangria-508029.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add orange and lemon slices and sugar to a large pitcher; mash gently with a wooden spoon until the sugar dissolves and the fruit releases some juice but is not completely crushed, about 1 minute. Stir in orange juice, liquor and wine. Refrigerate at least 2 hours (up to 8 hours). Before serving, add ice cubes and stir briskly to redistribute settled fruit and pulp; serve immediately.</li>\n</ol>\n</div>
172186	Black Beans in Boo Bowls	\N	\N	\N	https://spoonacular.com/recipeImages/Black-Beans-in-Boo-Bowls-172186.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Using small paring knife, make zigzag cut around center of each orange, cutting orange in half; pull halves apart. Using grapefruit spoon or small paring knife, remove orange segments; place in resealable food-storage plastic bag, and save for another use.</li>\n<li>2</li>\n<li>In 1-quart saucepan, heat beans and salsa over medium-high heat, stirring constantly, until hot. Spoon bean mixture into orange shells.</li>\n<li>3</li>\n<li>Spoon about 1 tablespoon cheese on top of each. </li>\n<li>Place on microwaveable plate; microwave on High 1 to 2 minutes or until cheese starts to melt.</li>\n</ol>\n</div>
278737	Cranberry-Champagne Cocktail	\N	\N	\N	https://spoonacular.com/recipeImages/Cranberry-Champagne-Cocktail-278737.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Fill a martini shaker halfway with crushed ice. </li>\n<li>Add Grand Marnier and cranberry juice; shake well to chill. Strain into 8 glass flutes. </li>\n<li>Add 5 tablespoons Champagne per glass.</li>\n<li>Garnish each glass with an orange wedge and serve immediately.</li>\n</ol>\n</div>
246022	Orange Beurre Blanc Sauce for Seafood	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-Beurre-Blanc-Sauce-for-Seafood-246022.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1  Zest half of one orange (about 2 teaspoons) and juice the two oranges (about 3/4 cup).  </li>\n<li>Put the juice, zest, wine and shallots in a sauce pan on medium high heat.  Cook until it is syrupy and almost gone.2 On low heat, whisk in the butter continuously and vigorously, 1 tablespoon at a time.  Butter is the only emulsifier for this sauce, and if you slowly add it, continuously stirring, the sauce will achieve a silky smooth texture.  Do not let the sauce boil.3 </li>\n<li>Add salt and pepper to taste.</li>\n</ol>\n</div>
41221	Carrot-Orange Marmalade	\N	\N	\N	https://spoonacular.com/recipeImages/carrot-orange_marmalade-41221.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring all ingredients to a full rolling boil over medium heat in a Dutch oven, stirring occasionally, until sugar is dissolved and syrup thickens. Reduce heat, and simmer, stirring occasionally, 15 to 20 minutes. </li>\n<li>Remove from heat; skim off any foam.</li>\n<li>Pour hot marmalade immediately into hot, sterilized jars, filling to 1/4 inch from top. </li>\n<li>Remove air bubbles; wipe jar rims. Cover at once with metal lids, and screw on bands.Process in boiling-water bath 10 minutes.</li>\n</ol>\n</div>
41275	Carrot Pineapple Orange Juice	\N	\N	\N	https://spoonacular.com/recipeImages/carrot-pineapple-orange-juice-2-41275.jpg	http://www.williams-sonoma.com/recipe/carrot-pineapple-orange-juice.html
41340	Honeyed Carrots And Oranges	\N	\N	\N	https://spoonacular.com/recipeImages/honeyed_carrots_and_oranges-41340.jpg	http://www.realsimple.com/food-recipes/browse-all-recipes/honeyed-carrots-oranges-00000000044522/index.html
483797	Orange, Fennel and Red Onion Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Orange--Fennel-and-Red-Onion-Salad-483797.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Remove the frawns from fennel bulb and reserve for garnish.</li>\n<li>Cut the fennel bulb in quarters and thinly slice.</li>\n<li>Add fennel slices, orange segments and onion to a medium bowl and dress with lemon juice, olive oil and salt/pepper to taste.Toss well and serve.</li>\n</ol>\n</div>
287186	Mulled Apple Cider with Ginger and Orange	\N	\N	\N	https://spoonacular.com/recipeImages/Mulled-Apple-Cider-with-Ginger-and-Orange-287186.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine the ingredients in a medium saucepan and simmer over a low flame for 20 minutes. Strain and serve.Nutritional Analysis (Per Serving)Calories: 130Total fat: 0gSaturated fat: 0gMonounsaturated fat: 0gPolyunsaturated fat: 0gCholesterol: 0mgSodium: 25mgCarbohydrates: 32gProtein: 0gFiber: 0g</li>\n</ol>\n</div>
207005	Time for a Drink: The Vancouver	\N	\N	\N	https://spoonacular.com/recipeImages/Time-for-a-Drink--The-Vancouver-207005.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Combine ingredients in mixing glass and fill with ice. Stir well until chilled, about 30 seconds. Strain into chilled cocktail glass. Twist lemon peel over drink and use as garnish.</li>\n</ol>\n</div>
532984	Orange and Rosemary Roasted Pork Tenderloin	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-and-Rosemary-Roasted-Pork-Tenderloin-532984.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Salt and pepper tenderloin to taste. Lay 6-7 pieces of cooking twine 1" apart over a baking sheet - you should have enough twine to wrap the entire length of the tenderloin.Layer half of the orange slices across twine. Top with 1 clove of sliced garlic and 2 of the rosemary sprigs.</li>\n<li>Place the pork tenderloin fatty side down on top of the first orange-garlic-rosemary layer. Top the tenderloin with remaining garlic, then rosemary, then orange slices. Tie twine tightly around tenderloin, making sure to keep all orange slices, rosemary, and garlic in place. </li>\n<li>Bake at 375 for 45-55 minutes, until pork reaches an internal temperature of 160-165 degrees F. </li>\n<li>Let pork rest for 10-15 minutes. When pork has rested, cut twine and remove oranges and rosemary sprigs. Slice pork and serve immediately. Top with a drizzle of balsamic vinegar if you'd like to add a colorful touch to the pork, but it's just as great without it!</li>\n</ol>\n</div>
197176	Fresh-Cranberry Mimosas	\N	\N	\N	https://spoonacular.com/recipeImages/Fresh-Cranberry-Mimosas-197176.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Fill a chilled Champagne flute halfway or slightly more with chilled Champagne or sparkling wine. Top with 1/4 cup orange juice and 1/4 cup cranberry juice. Float a cranberry or two in each glass, and place orange slices on the rims of or inside the glasses. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
205606	Sparkling Strawberry Sangria	\N	\N	\N	https://spoonacular.com/recipeImages/Sparkling-Strawberry-Sangria-205606.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>For the Syrup: </li>\n<li>Combine strawberries, water, and sugar in a small saucepan. </li>\n<li>Heat over high heat until boiling, stirring to dissolve sugar. Reduce to a simmer and continue to cook until for about 10 minutes—the syrup should be pink and the berries soft. </li>\n<li>Remove from heat and let cool. Strain through a fine mesh strainer. Reserve the strawberries for the sangria. Strawberry syrup will keep for one week in a sealed container in the refrigerator.</li>\n<li>2</li>\n<li>For the Sangria: </li>\n<li>Add 1 sliced lemon, 1 sliced orange, and the reserved strawberries from the syrup to the bottom of the pitcher. </li>\n<li>Add the strawberry syrup and Cointreau and muddle. </li>\n<li>Add the cava and stir. </li>\n<li>Serve immediately, pouring into glasses garnished with a slice of lemon, a slice of orange, sliced strawberries, and ice.</li>\n</ol>\n</div>
107321	Sweet Potato Puree in Orange Shells	\N	\N	\N	https://spoonacular.com/recipeImages/sweet-potato-puree-in-orange-shells-2-107321.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place sweet potatoes in a large pan, cover with cold water and bring to boil over high heat. Reduce heat to low and simmer until potatoes are tender, about 45 minutes. </li>\n<li>Drain. While potatoes are cooking, cut 4 oranges in half and carefully remove pulp and juice. </li>\n<li>Place orange halves in a large muffin pan to stand them up, or arrange in a large baking dish; set aside. Preheat oven to 350ºF. Puree potatoes in a food processor until smooth. </li>\n<li>Add butter, chipotle and zest and juice of remaining orange; puree. Season with salt and pepper. Pipe or spoon puree into orange shells and bake for 30 minutes.</li>\n</ol>\n</div>
615246	Whisky Orange Clove Coffee	\N	\N	\N	https://spoonacular.com/recipeImages/Whisky-Orange-Clove-Coffee-615246.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a mug, combine sugar, whisky, and bitters.With a knife, slice a 1-inch wide by 3-inches long orange peel, being careful not to include the pith. </li>\n<li>Roll the orange peel and secure it by piercing it with cloves. </li>\n<li>Add to the whisky.Fill a Keurig with 6 ounces of water and place a K-Cup (we're using Grand Selezione) in the K-Cup container. Follow the Keurig instructions.Once the coffee is finished brewing, stir, and serve.</li>\n</ol>\n</div>
870	Pan-roasted Sea Bass With Citrus And Avocado Oil	\N	\N	\N	https://spoonacular.com/recipeImages/pan-roasted_sea_bass_with_citrus_and_avocado_oil-870.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to  Using a small sharp knife, cut off all peel and white pith from fruit. Working over a medium bowl, cut between membranes to release segments into bowl. Squeeze in juices from membranes; discard membranes. </li>\n<li>Drain fruit, reserving 1/2 cup juices. Return segments and juices to bowl. Season with salt and pepper. Pat fish dry. Season with salt and pepper. </li>\n<li>Heat a large heavy ovenproof skillet over high heat. </li>\n<li>Add grapeseed oil. </li>\n<li>Add fish; cook without moving, occasionally pressing fish gently with a spatula to keep all of surface in contact with pan, until fish is golden brown and releases easily from pan, 45 minutes. Turn fish, transfer to oven, and roast until just opaque in the center, 35 minutes. </li>\n<li>Place fruit and avocado on plates.  Top with fillets. Spoon 2 Tbsp. citrus juices over fruit on each plate. </li>\n<li>Drizzle 1 Tbsp. avocado oil over fish and fruit.</li>\n</ol>\n</div>
148421	Aranciata Cocktail	\N	\N	\N	https://spoonacular.com/recipeImages/aranciata-cocktail-2-148421.png	http://www.marthastewart.com/317131/aranciata-cocktail
623598	Cranberry Creamsicle Cooler	\N	\N	\N	https://spoonacular.com/recipeImages/Cranberry-Creamsicle-Cooler-623598.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine cranberry juice, orange juice and cream soda in a carafe. Stir well to combine. </li>\n<li>Serve over ice in glasses garnished with orange slices.</li>\n</ol>\n</div>
140297	Marge's Brandy Old Fashioned Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/marges-brandy-old-fashioned-recipe-2-140297.png	http://www.chow.com/recipes/28429-marges-brandy-old-fashioned
123924	Cranberry Orange Relish	\N	\N	\N	https://spoonacular.com/recipeImages/cranberry-orange-relish-2-123924.jpg	http://www.food.com/recipe/cranberry-orange-relish-150666
541736	Vibrant Life Cleanse Program & Cookbook	\N	\N	\N	https://spoonacular.com/recipeImages/Vibrant-Life-Cleanse-Program---Cookbook-541736.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Using your juicer, juice ingredients in the order they are listed.</li>\n<li>Transfer to a glass and serve immediately.To store:pour into a glass container and keep in the fridge for 1-2 days. Alternatively, pour into a plastic container and freeze for up to 1 month.</li>\n</ol>\n</div>
215283	Orange & mint salad	\N	\N	\N	https://spoonacular.com/recipeImages/Orange---mint-salad-215283.jpg	http://www.bbcgoodfood.com/recipes/1076644/orange-and-mint-salad
174323	Berry Orange Smoothies	\N	\N	\N	https://spoonacular.com/recipeImages/Berry-Orange-Smoothies-174323.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In blender, place all ingredients. Cover; blend on high speed 1 minute to 1 minute 30 seconds, stopping to scrape sides as necessary, until smooth.</li>\n<li>2</li>\n\n<li>Pour into 2 glasses. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
215291	Orange, walnut & Stilton salad	\N	\N	\N	https://spoonacular.com/recipeImages/Orange--walnut---Stilton-salad-215291.jpg	http://www.bbcgoodfood.com/recipes/1897690/orange-walnut-and-stilton-salad
140357	Tequila Sunrise Marmalade with Orange and Pomegranate	\N	\N	\N	https://spoonacular.com/recipeImages/tequila-sunrise-marmalade-with-orange-and-pomegranate-2-140357.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Place a small plate in the freezer so you can test the jam for proper thickness later. Make sure your jars and lids are sterilized and ready to go.</li>\n<li>2</li>\n<li>Use a zester to remove the zest from the oranges. </li>\n<li>Add the zest to a large, deep, heavy-bottomed pot. </li>\n<li>Remove the remaining peels from the oranges. Wrap the peels in cheesecloth, secure with butcher's twine, and add to pot.</li>\n<li>3</li>\n<li>Use a sharp knife to cut the oranges in between the pith into clean segments, making sure to work over a bowl to catch any escaping juice. Squeeze remaining pith and discard. (See video instructions here). Pulse the oranges in a food to chop the segments into coarse chunks that are about 1/2-inch across, 2 to 3 short pulses. </li>\n<li>Add the oranges to the pot with the zest and peels. Strain the juice you saved while segmenting the oranges and add it to the pot, along with the pomegranate juice.</li>\n<li>4</li>\n\n<li>Add 1 1/2 cups of water to the pot and bring to a boil over medium heat. Once boiling, lower heat to low and simmer for 20 minutes. </li>\n<li>Remove from heat and allow to cool. Once cool, remove the bag of peels from the pot and gently squeeze the juice from the bag. Do not wring it completely, which will make the marmalade bitter—-just release any loose, excess juice absorbed by the peels and then discard the bag.</li>\n<li>5</li>\n\n<li>Add tequila, sugar, butter, and salt to the pot, stirring well to combine. Cook over medium heat, stirring frequently, until the fruit begins to bubble and spit. Cook for 30 minutes longer, stirring frequently to keep the fruit from burning.</li>\n<li>6</li>\n<li>Begin testing the marmalade for doneness: </li>\n<li>Spread 1/2 teaspoon of cooked fruit on the cold plate and place it back in the freezer. Wait 30 seconds, then run your finger through the fruit. It should be thick enough to maintain a path when you run your finger through it. If you’d like thicker marmalade, place the plate back in the freezer and cook the fruit for another 4 minutes and test again. Repeat until desired thickness is achieved, but be careful about cooking too long or you will alter the taste of your marmalade.</li>\n<li>7</li>\n\n<li>Remove pot from heat and use a spoon to skim any foam from the surface of the fruit. Ladle marmalade into sterilized jars and process them in a hot water bath for 10 minutes. Unopened jars will keep at room temperature for up to 6 months. Opened marmalade should be refrigerated.</li>\n</ol>\n</div>
189529	Red Leaf Salad with Oranges	\N	\N	\N	https://spoonacular.com/recipeImages/Red-Leaf-Salad-with-Oranges-189529.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Using small sharp knife, cut off peel and white pith from oranges. </li>\n<li>Cut oranges crosswise into round slices, then cut slices in half. Toss red leaf lettuce, orange slices, and red onion slices in large bowl. </li>\n<li>Add oil and vinegar and toss to coat; season salad to taste with salt and pepper.</li>\n</ol>\n</div>
492696	The Man-Mosa Cocktail	\N	\N	\N	https://spoonacular.com/recipeImages/The-Man-Mosa-Cocktail-492696.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Shake all ingredients briefly with plenty of ice.Strain into a glass and garnish with orange twist.  </li>\n</ol>\n</div>
369858	Harvey Wallbanger	\N	\N	\N	https://spoonacular.com/recipeImages/Harvey-Wallbanger-369858.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a glass with ice, add Smirnoff No.21 Vodka and orange juice. Stir and float liqueur on top. </li>\n<li>Garnish with orange slice.</li>\n</ol>\n</div>
58572	Mango Spritz	\N	\N	\N	https://spoonacular.com/recipeImages/mango-spritz-2-58572.jpg	http://www.marthastewart.com/338859/mango-spritz
402718	Carrot, Orange, and Apple Juice	\N	\N	\N	https://spoonacular.com/recipeImages/Carrot--Orange--and-Apple-Juice-402718.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients into the Vitamix container in the order listed and secure lid.Select Variable Turn machine on and slowly increase speed to Variable 10, then to High.Blend for 1 minute or until smooth. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
75056	Roast Potatoes With Sage And Orange	\N	\N	\N	https://spoonacular.com/recipeImages/roast-potatoes-with-sage-and-orange-2-75056.jpg	http://www.cookstr.com/recipes/roast-potatoes-with-sage-and-orange
83295	Seville Orange And Vanilla Bean Marmalade	\N	\N	\N	https://spoonacular.com/recipeImages/seville-orange-and-vanilla-bean-marmalade-2-83295.jpg	http://www.britishlarder.co.uk/seville-orange-and-vanilla-bean-marmalade/#axzz1Sj8i6a00
1456	Whole Mackerel With Orange Butter	\N	\N	\N	https://spoonacular.com/recipeImages/whole_mackerel_with_orange_butter-1456.jpg	http://www.cooksister.com/2007/11/wholly-mackerel.html
493059	East Indian Negroni Cocktail	\N	\N	\N	https://spoonacular.com/recipeImages/East-Indian-Negroni-Cocktail-493059.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add all the ingredients to a mixing glass, add ice.Stir and then strain into a rocks glass filled with one large ice cube.</li>\n<li>Garnish with orange twist.</li>\n</ol>\n</div>
419336	Rhubarb-Orange Marmalade	\N	\N	\N	https://spoonacular.com/recipeImages/Rhubarb-Orange-Marmalade-419336.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large bowl, combine rhubarb and 4 cups sugar; cover and refrigerate overnight.</li>\n<li>Peel rind from oranges; cut into very thin strips, about 1-in. long. </li>\n<li>Place strips in a small bowl; cover with boiling water. </li>\n<li>Let stand for 30 minutes; drain. Trim white pith from oranges; discard pith. </li>\n<li>Cut oranges into 1/2-in. chunks, reserving juices. Discard membranes and seeds.</li>\n<li>In a Dutch oven, combine rhubarb mixture, orange peel, orange chunks with juices, walnuts, raisins and remaining sugar. Bring to a boil. Reduce heat; simmer, uncovered, 1 to 1-1/2 hours or until thickened.</li>\n\n<li>Remove from heat; skim off foam. Carefully ladle hot mixture into seven hot sterilized half-pint jars, leaving 1/4-in. headspace. </li>\n<li>Remove air bubbles and adjust headspace, if necessary, by adding hot mixture. Wipe rims. Center lids on jars; screw on bands until fingertip tight.</li>\n\n<li>Place jars into canner, ensuring that they are completely covered with water. Bring to a boil; process for 10 minutes. </li>\n<li>Remove jars and cool.</li>\n</ol>\n</div>
353842	Orange and Fennel Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-and-Fennel-Salad-353842.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine salad, oranges, fennel and olives in large bowl. Toss with Fresh Orange Dressing, to coat, as desired. Refrigerate any remaining vinaigrette.</li>\n\n<li>Whisk together 1/4 cup orange or blood orange juice, 1/4 cup vegetable oil, 2 tablespoons lemon juice, 2 tablespoons rice vinegar, 2 teaspoons sugar, 1 teaspoon Dijon-style mustard, salt and ground black pepper, to taste until blended. Makes about 3/4 cup.</li>\n</ol>\n</div>
337469	Orange Old Fashioned	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-Old-Fashioned-337469.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a pitcher combine the orange slices, sugar, and cherry syrup.  Muddle with a wooden spoon or a muddler, until the sugar is dissolved and the juice is extracted from the oranges. </li>\n<li>Add the bourbon, and bitters and mix well.  </li>\n<li>Pour into 4 low-ball glasses filled with ice, and top each with sparkling water.  </li>\n<li>Garnish with an orange slice and serve.</li>\n</ol>\n</div>
91709	Beets in Orange/apricot Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/beets-in-orange_apricot-sauce-2-91709.jpg	http://www.food.com/recipe/beets-in-orange-apricot-sauce-121162
518510	Cranberry Mimosas	\N	\N	\N	https://spoonacular.com/recipeImages/Cranberry-Mimosas-518510.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Fill twelve 12-ounce glasses with ice; pour 1/3 cup cranberry juice into each glass. Top each serving with 1/3 cup orange juice and about 1/2 cup Champagne. </li>\n<li>Garnish with orange slices, if desired.</li>\n</ol>\n</div>
141130	Bi-Rite Creamery's Cara Cara Orange Cardamom Ice Cream	\N	\N	\N	https://spoonacular.com/recipeImages/bi-rite_creamerys_cara_cara_orange_cardamom_ice_cream-141130.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Infuse the milk/cream: </li>\n<li>Put the cardamom pods in a small skillet and put the pan over medium heat. Toast, stirring frequently, until aromatic, 2 to 3 minutes. </li>\n<li>Remove from the heat, let cool for a minute, then use a sharp knife to coarsely chop the pods.Tip: Cardamom pods have a tendency to fly all over the place when you chop them. To minimize this, use a large cutting board, a sharp knife, and slow, deliberate motions as you chop. Or you can crush the pods by rocking them back and forth over them on a cutting board.</li>\n<li>2</li>\n<li>In a medium heavy saucepan, stir together the cardamom, cream, milk, half of the sugar (1/4 cup), and the salt.</li>\n<li>3</li>\n\n<li>Put the pan over medium-high heat. When the mixture just begins to bubble around the edges, remove from the heat and cover the pan. </li>\n<li>Let steep for about 30 minutes, or until the cream mixture has a distinct cardamom flavor. (Taste it to monitor the progress; the mixture will become bitter if oversteeped.)</li>\n<li>4</li>\n<li>For the base: In a medium heatproof bowl, whisk the yolks just to break them up, then whisk in the remaining sugar (1/4 cup). Set aside.</li>\n<li>5</li>\n<li>Uncover the cream mixture and put the pan over medium-high heat. When the mixture approaches a bare simmer, reduce the heat to medium.</li>\n<li>6</li>\n<li>Carefully scoop out about 1/2 cup of the hot cream mixture and, whisking the eggs constantly, add the cream to the bowl with the yolks. Repeat, adding another 1/2 cup of the hot cream to the bowl with the yolks. Returning to the pan of cream on the stove, use a heatproof spatula to stir the cream as you slowly pour the egg and cream mixture from the bowl back into the pan.</li>\n<li>7</li>\n<li>Continue to cook the mixture carefully over medium heat, stirring constantly, until the mixture is thickened, coats the back of a spatula, and leaves a clear mark when you run your finger across it, 1 to 2 minutes longer.</li>\n<li>8</li>\n<li>Strain the base through a fine-mesh strainer and into a clean container. Working directly over the container, use a fine grater to grate the orange zest into the ice cream base. Set the container into an ice bath, wash your spatula, and use it to stir the base occasionally until it is cool. Then cover with plastic wrap and refrigerate the base for at least 2 hours or overnight.</li>\n<li>9</li>\n<li>To Freeze: </li>\n<li>Add the vanilla to the base and stir until blended. Freeze in your ice cream machine according to the manufacturer's instructions. While the ice cream is churning, put the container you'll use to store the ice cream into the freezer. Enjoy right away or, for a firmer ice cream, freeze for at least four hours.</li>\n</ol>\n</div>
141144	Great Gatsby from Highlands Bar and Grill	\N	\N	\N	https://spoonacular.com/recipeImages/great-gatsby-from-highlands-bar-and-grill-2-141144.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Fill mixing glass halfway with ice. </li>\n<li>Add vodka, Lillet Blanc, and grapefruit juice. Stir until cold. Strain into ice-filled glass. </li>\n<li>Garnish with orange slice.</li>\n</ol>\n</div>
173932	Mock Sparkling Sangria	\N	\N	\N	https://spoonacular.com/recipeImages/Mock-Sparkling-Sangria-173932.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In large nonmetal pitcher or bowl, combine cranberry juice concentrate, water, orange juice and lemon juice; blend well. Refrigerate 1 hour or until thoroughly chilled.</li>\n<li>2</li>\n<li>To serve, gently stir in club soda and orange slices.</li>\n</ol>\n</div>
26507	Orange-tomatillo Salsa	\N	\N	\N	https://spoonacular.com/recipeImages/orange-tomatillo-salsa-2-26507.jpg	http://www.marthastewart.com/350011/orange-tomatillo-salsa
42931	Jicama And Orange Salad With Citrus-cumin Vinaigrette	\N	\N	\N	https://spoonacular.com/recipeImages/jicama-and-orange-salad-with-citrus-cumin-vinaigrette-2-42931.jpg	http://www.wholeliving.com/133445/jicama-and-orange-salad-citrus-cumin-vinaigrette
51124	Bourbon and Blood Orange Blast	\N	\N	\N	https://spoonacular.com/recipeImages/bourbon_and_blood_orange_blast-51124.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a shaker, mix together the bourbon, blood orange juice, and mint leaves. </li>\n<li>Serve over ice in a low glass and garnish with a sprig of mint. Rub the rim of the glass with the orange wedge, then dip the edge in a dish of turbinado sugar (also called sugar in the raw).</li>\n</ol>\n</div>
18423	Seared Scallops With Snow Peas And Orange Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/seared_scallops_with_snow_peas_and_orange_recipe-18423.jpg	http://www.realsimple.com/food-recipes/browse-all-recipes/seared-scallops-snow-peas-orange-recipe-00000000029768/index.html
206875	Elegant Citrus Tart	\N	\N	\N	https://spoonacular.com/recipeImages/Elegant-Citrus-Tart-206875.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350°. </li>\n<li>Bake coconut in a single layer in a shallow pan 4 to 5 minutes or until toasted and fragrant, stirring halfway through; cool completely (about 15 minutes). Pulse coconut, flour, and powdered sugar in a food processor 3 to 4 times or until combined. </li>\n<li>Add butter and coconut extract, and pulse 5 to 6 times or until crumbly. With processor running, gradually add 3 Tbsp. water, and process until dough forms a ball and leaves sides of bowl. </li>\n<li>Roll dough into a 12 1/2- x 8-inch rectangle (about 1/4 inch thick) on a lightly floured surface; press on bottom and up sides of a 12- x 9-inch tart pan with removable bottom. Trim excess dough, and discard. </li>\n<li>Bake at 350° for 30 minutes. Cool completely on a wire rack (about 40 minutes). </li>\n<li>Spread Buttery Orange Curd over crust. Top with citrus sections.Note: To make a round tart, roll dough into a 10-inch circle (about 1/4 inch thick) on a lightly floured surface; press on bottom and up sides of a 9-inch round tart pan with removable bottom. Trim excess dough, and discard. </li>\n<li>Bake as directed.</li>\n</ol>\n</div>
206895	Frozen Sangria	\N	\N	\N	https://spoonacular.com/recipeImages/Frozen-Sangria-206895.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Combine all ingredients in a blender and blend until smooth. </li>\n<li>Pour into glasses and garnish with an orange slice. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
624777	Citrus Salad with Fried Rosemary and Olives	\N	\N	\N	https://spoonacular.com/recipeImages/Citrus-Salad-with-Fried-Rosemary-and-Olives-624777.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Pour vegetable oil into a small heavysaucepan to a depth of 1". Prop deep-frythermometer in oil so bulb is submerged;heat oil over medium heat to 350F. </li>\n<li>Addfour 3" rosemary sprigs to oil and fryuntil crisp and bright green, 10-15 seconds.</li>\n<li>Transfer to a paper towellined plate;season lightly with kosher salt. </li>\n<li>Add10 pitted oil-cured black olives to oil;fry until bubbling stops, about 4 minutes.</li>\n<li>Place on plate with rosemary. Strip rosemaryleaves from sprigs; mince. Chop olives. Using a small, sharp knife, cut peeland white pith from 6 blood oranges and6 Cara Cara oranges. </li>\n<li>Cut crosswise into1/2" rounds; arrange on a platter. DO AHEAD:Oranges, rosemary, and olives can beprepared 6 hours ahead. Cover and chillorange slices. Separately store rosemaryand olives airtight at room temperature.</li>\n<li>Season oranges lightly with salt andfreshly ground black pepper; drizzle with2 tablespoons extra-virgin olive oil. Sprinklechopped rosemary and olives over oranges.</li>\n</ol>\n</div>
542867	Orange Almond Cake	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-Almond-Cake-542867.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Halve oranges place in saucepan. Cover with water and bring to a boil. Turn to simmer and simmer for 2 – 3 hours, or until orange rinds are tender and translucent when cut into.  </li>\n<li>Add water as needed during cooking process.</li>\n<li>Heat oven to 350 °.  </li>\n<li>Remove oranges from water and be sure to remove every seed. </li>\n<li>Add oranges to food processor and pulse until a thick pulp forms. </li>\n<li>Add orange pulp plus all other ingredients to a large bowl and mix well. Spray a 10 inch round baking pan or 10 inch skillet with </li>\n<li>Bakers Joy non-stick baking spray. </li>\n<li>Pour batter into baking pan. </li>\n<li>Bake in preheated oven for 45 minutes – 1 hour or until cake is set and toothpick is clean when inserted into the middle of the cake. *To make almond flour, add sliced almonds to food processor and turn on for 2 – 3 minutes, or until almonds are ground fine.</li>\n</ol>\n</div>
420245	Lion and Lamb Cupcakes	\N	\N	\N	https://spoonacular.com/recipeImages/Lion-and-Lamb-Cupcakes-420245.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Prepare and bake cake mix according to package directions for cupcakes; cool completely. Tint desired amounts of frosting orange, blue and pink.</li>\n<li>For lambs, frost cupcakes white and attach a Mounds candy bar for face. Pipe additional frosting over top of candy bar for tuft of hair between the ears. Attach jelly beans for ears, sprinkle body with coconut and pipe frosting for eyes and nose.</li>\n<li>For lions, frost cupcakes with orange frosting. Sprinkle edges with jimmies and attach pieces of licorice for mane. Attach jelly beans for ears. Pipe faces with frosting.</li>\n</ol>\n</div>
600466	Cranberry Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Cranberry-Salad-600466.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Put cranberries and orange through food chopper and add celery and sugar. </li>\n<li>Mix hot water and gelatin and refrigerate until syrupy. </li>\n<li>Add cranberry mixture to gelatin and refrigerate until set.</li>\n</ol>\n</div>
207263	Time for a Drink: the Chancellor Cocktail	\N	\N	\N	https://spoonacular.com/recipeImages/Time-for-a-Drink--the-Chancellor-Cocktail-207263.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Combine ingredients in a mixing glass and fill with ice. Stir well until chilled, about 30 seconds. Strain into chilled cocktail glass.</li>\n</ol>\n</div>
264663	Fruity Sangria Punch	\N	\N	\N	https://spoonacular.com/recipeImages/Fruity-Sangria-Punch-264663.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>PLACE drink mix and water in large plastic or glass pitcher; stir until drink mix is completely dissolved. REFRIGERATE until ready to serve. STIR in ginger ale and add fruit just before serving.</li>\n</ol>\n</div>
485916	Quick Orange Rolls}Love Stitched	\N	\N	\N	https://spoonacular.com/recipeImages/Quick-Orange-Rolls}Love-Stitched-485916.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place biscuits standing up around the center of a bundt pan    In a small saucepan melt butter and sugar together on low until sugar is dissolved    Then add in the orange flavoring and zest - mix well    </li>\n<li>Pour sugar mixture over the top of the biscuits    Plane in a preheated 350 degree oven    bake for 22-25 min until center is done and lightly brown on top    let rest 5 minutes then turn out on serving dish</li>\n</ol>\n</div>
436881	Orange Appeal	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-Appeal-436881.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Peel oranges, removing as much white membrane as possible. </li>\n<li>Cut into 1/4-in. slices or section as pictured. Arrange half of the orange slices or sections overlapping on large platter or in a round glass bowl.</li>\n<li>Sprinkle with concentrate/liqueur, coconut, almonds and one-half of confectioners' sugar. Top with remaining oranges. Sprinkle with remaining sugar. Chill until serving time. </li>\n<li>Serve chilled on glass plates with tea cookies and coffee.</li>\n</ol>\n</div>
584396	Orange Cantaloupe Sorbet	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-Cantaloupe-Sorbet-584396.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Prepare the cantaloupe by removing the seeds and either slicing or scooping all the flesh from the rind.In a blender, combine all the cantalopue flesh with the orange juice the sugar and the Cointreau. Here, decide whether you want to add more (1/2 cup) or less (1/3 cup) sugar based on your taste preferences and the sweetness of your melon and orange juice.Blend the fruits and juice until as smooth as possible, it should be a smooth liquid.</li>\n<li>Transfer the liquid to the bowl of an ice cream maker, and process according to manufacturer’s instructions. Freeze for an additional 2 hours before serving. Or, if you don’t have an ice cream maker, transfer the liquid to an air-tight container and freeze, stirring often to make the sorbet smooth.For serving, scoop the orange cantaloupe sorbet into small bowls and garnish with extra orange slices. Or, serve the sorbet in orange rind bowls or a cantaloupe bowl.To make the fruit bowls, see the photos above.</li>\n</ol>\n</div>
125714	Pom-Berry-Banana Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/pom-berry-banana-smoothie-2-125714.png	http://www.marthastewart.com/335201/pom-berry-banana-smoothie
215865	Nutty orange platter	\N	\N	\N	https://spoonacular.com/recipeImages/Nutty-orange-platter-215865.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the butter in a large frying pan. </li>\n<li>Add the pistachio nuts and cook for a few mins until toasted, turning and shaking the pan frequently to prevent them from burning. Sprinkle over the sugar and stir until the sugar has completely dissolved. Turn out on to a plate and leave to cool (about 5 mins), then roughly chop.Using a sharp knife, cut the bottom off each orange, then carefully cut away the skin and pith, following the curve of the fruit. </li>\n<li>Cut into slices. Arrange on a plate with any juices. </li>\n<li>Serve with the nuts scattered over and the yogurt or crème fraîche to dollop on top.</li>\n</ol>\n</div>
510801	Pomegranate Citrus Juice	\N	\N	\N	https://spoonacular.com/recipeImages/Pomegranate-Citrus-Juice-510801.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large pitcher add pomegranate juice, water, lime juice and stevia. </li>\n<li>Mix until combined.</li>\n<li>Add oranges to pitcher. Refrigerate for 4 hours or until ready to use.</li>\n</ol>\n</div>
527244	Orange Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-Smoothie-527244.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine all ingredients in a blender and mix until smooth and well-combined.</li>\n</ol>\n</div>
175000	Honey-Orange Ham	\N	\N	\N	https://spoonacular.com/recipeImages/Honey-Orange-Ham-175000.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Grate 1 tablespoon peel from orange; squeeze juice. </li>\n<li>Mix peel and juice with honey and mustard in small bowl. Pierce surface of ham at 2-inch intervals with metal skewer; place in 2-gallon resealable plastic food-storage bag. </li>\n<li>Pour honeymixture over ham; seal bag. Refrigerate 2 hours.</li>\n<li>2</li>\n\n<li>Heat oven to 325°. </li>\n<li>Place ham, fat side up, on rack in shallow roasting pan. Discard marinade. Insert cloves in ham. Insert meat thermometer so tip is in thickest part of ham and does not touch bone or rest in fat.</li>\n<li>3</li>\n\n<li>Bake uncovered 1 hour. Cover loosely with aluminum foil so ham does not overbrown. </li>\n<li>Bake 1 hour to 1 hour 30 minutes longer or until thermometer reads 135° to 140°. </li>\n<li>Let ham stand loosely covered 10 to 15 minutes for easier carving.</li>\n</ol>\n</div>
667304	Homemade Orange Creamsicle Ice Cream	\N	\N	\N	https://spoonacular.com/recipeImages/Homemade-Orange-Creamsicle-Ice-Cream-667304.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Peel and section oranges. Lay flat on a tray and freeze until hardened.In a blender, add coconut milk and half of the frozen orange sections.Blend until smooth. </li>\n<li>Add the remaining oranges and continue blending.</li>\n<li>Add the sweetener of your choice (honey, powdered sugar, maple syrup) and vanilla extract.Blend.</li>\n<li>Pour into a freezer safe container and freeze until solid.When ready to serve, let it sit out for a few minutes to make it easier to scoop. Enjoy!</li>\n</ol>\n</div>
84947	Pan-Roasted Sea Bass with Citrus and Avocado Oil	\N	\N	\N	https://spoonacular.com/recipeImages/pan-roasted-sea-bass-with-citrus-and-avocado-oil-2-84947.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 450°F. Using a small sharpknife, cut off all peel and white pithfrom fruit. Working over a medium bowl,cut between membranes to releasesegments into bowl. Squeeze in juicesfrom membranes; discard membranes.</li>\n<li>Drain fruit, reserving 1/2 cup juices. Returnsegments and juices to bowl. Season withsalt and pepper.</li>\n<li>Pat fish dry. Season with salt and pepper.</li>\n<li>Heat a large heavy ovenproof skillet overhigh heat. </li>\n<li>Add grapeseed oil. </li>\n<li>Add fish; cookwithout moving, occasionally pressing fishgently with a spatula to keep all of surface incontact with pan, until fish is golden brownand releases easily from pan, 4–5 minutes.</li>\n<li>Turn fish, transfer to oven, and roast untiljust opaque in the center, 3–5 minutes.</li>\n\n<li>Place fruit and avocado on plates.Top with fillets. Spoon 2 tablespoons citrus juicesover fruit on each plate. </li>\n<li>Drizzle 1 tablespoonavocado oil over fish and fruit.</li>\n<li>Per serving: 415 calories, 25 g fat, 13 g carbohydrates</li>\n<li>Nutritional analysis provided by</li>\n<li>Bon Appétit</li>\n</ol>\n</div>
617434	Orangecello Liqueur	\N	\N	\N	https://spoonacular.com/recipeImages/Orangecello-Liqueur-617434.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place peels in a pitcher.</li>\n<li>Pour in enough vodka to cover orange peels and allow to restfor a minimum of 4 days, 6 weeks is ideal. Stir at least once a week if allowing it to age.Once the mixture ages, remove the peels, strain it, and set aside.Make the simple syrup and allow to cool to room temperature.</li>\n<li>Pour the simple syrup into the orange peel and vodka mixture, stir, and refrigerate in sealed bottles until chilled.</li>\n<li>Serve in a chilled glass or over ice. As stated earlier, you may add wine or champagne, as well.</li>\n</ol>\n</div>
44030	Roast Potato Recipe (with Sage & Orange)	\N	\N	\N	https://spoonacular.com/recipeImages/roast_potato_recipe-44030.jpg	http://www.jamieoliver.com/recipes/vegetarian-recipes/roast-potatoes-with-sage-orange
216185	Chocolate fondant	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-fondant-216185.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>First get your moulds ready. Using upward strokes, heavily brush the meltedbutter all over the inside of the pudding mould.</li>\n<li>Place the mould in the fridge or freezer. </li>\n<li>Brush more melted butter over the chilledbutter, then add a good spoonful of cocoapowder into the mould. Tip the mould so the powder completely coatsthe butter. Tap any excess cocoa back into the jar,then repeat with 1 the next mould.</li>\n<li>Place a bowl over a pan ofbarely simmering water, then slowly melt thechocolate and butter together. </li>\n<li>Remove bowlfrom the heat and stir until smooth. Leave tocool for about 10 mins.In a separate bowl whisk the eggsand yolks together with the sugar untilthick and pale and the whisk leavesa trail; use an electric whisk if you want. Siftthe flour into the eggs, then beat together.</li>\n<li>Pour the melted chocolate into the eggmixture in thirds, beating well betweeneach addition, until all the chocolateis added and the mixture is completelycombined to a loose cake batter.Tip the fondant batter into a jug, thenevenly divide between the moulds.The fondants can now be frozen forup to a month and cooked from frozen. Chillfor at least 20 mins or up to the night before. To bake from frozen, simply carry on as stated, adding 5 mins more to thecooking time.</li>\n<li>Heat oven to 200C/fan 180C/gas </li>\n<li>Place the fondants on a baking tray,then cook for 10-12 mins until thetops have formed a crust and they arestarting to come away from the sides of theirmoulds. </li>\n<li>Remove from the oven, then leaveto sit for 1 min before turning out.Loosen the fondants by moving thetops very gently so they come awayfrom the sides, easing them out of themoulds. Tip each fondant slightly onto yourhand so you know it has come away, thentip back into the mould ready to plate up.Starting from the middle of each plate, squeezea spiral of caramel sauce – do all the plates youneed before you go on to the next stage.Sit a fondant in the middle of each plate.Using a large spoon dipped in hot water, scoopa ‘quenelle’ of ice cream.Carefully place the ice cream on top of thefondant, then serve immediately. Repeat withthe rest of the fondants.</li>\n</ol>\n</div>
322694	Aged White Manhattan	\N	\N	\N	https://spoonacular.com/recipeImages/Aged-White-Manhattan-322694.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>If the barrel is new and dry inside, fill it with water and let stand until watertight, about 24 hours. </li>\n<li>Drain.Using a funnel, fill the barrel with all of the liquid ingredients. </li>\n<li>Let age, tasting a sample once a week, until the cocktail has taken on a rounded but not overly oaky flavor, about 1 month.Strain the cocktail through a coffee filter–lined funnel into a glass container and store indefinitely.To serve, pour 3 ounces into an ice-filled cocktail shaker and stir until chilled. Strain the drink into a chilled cocktail glass. </li>\n<li>Garnish with a twist.</li>\n</ol>\n</div>
126142	Chilled Oranges With Curacao	\N	\N	\N	https://spoonacular.com/recipeImages/chilled-oranges-with-curacao-2-126142.jpg	http://www.food.com/recipe/chilled-oranges-with-curacao-218224
388326	Sparkling Cranberry Kiss	\N	\N	\N	https://spoonacular.com/recipeImages/Sparkling-Cranberry-Kiss-388326.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a pitcher, combine cranberry and orange juices. Just before serving, stir in ginger ale; serve over ice. If desired, serve with orange slices.</li>\n</ol>\n</div>
593156	Mango Old Fashioned	\N	\N	\N	https://spoonacular.com/recipeImages/Mango-Old-Fashioned-593156.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add orange slice, mango, and sugar to a rocks glass. Muddled until mango is completely broken down. </li>\n<li>Pour in whiskey and bitters. Stir to combine.Fill an old fashioned (or rocks) glass to the top with ice. Strain cocktail over ice. Rub the glass between your hands a few times to melt the ice a little. Enjoy!</li>\n</ol>\n</div>
224936	Grapefruit, orange & apricot salad	\N	\N	\N	https://spoonacular.com/recipeImages/Grapefruit--orange---apricot-salad-224936.jpg	http://www.bbcgoodfood.com/recipes/2220663/grapefruit-orange-and-apricot-salad
503510	cranberry relish	\N	\N	\N	https://spoonacular.com/recipeImages/cranberry-relish-503510.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
159020	Grand Marnier Tea Cooler	\N	\N	\N	https://spoonacular.com/recipeImages/Grand-Marnier-Tea-Cooler-159020.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Using a zester, cut as many long strips of zest from the orange as you can and set them aside. </li>\n<li>Cut off and discard the remaining white pith, and cut the orange into 8 pieces.</li>\n<li>Place the orange pieces in a small bowl and sprinkle the sugar over them. Muddle until no large chunks remain. Divide the orange mixture among 4 iced tea glasses. </li>\n<li>Add 1/4 cup of Grand Marnier to each glass and stir well.Fill each glass halfway with ice. Divide the reserved zest among the glasses, then fill the rest of the way with ice. Fill the glasses with iced tea and serve with a lemon wedge.</li>\n</ol>\n</div>
396602	Orange Mint Coffee	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-Mint-Coffee-396602.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In two coffee cups, place a mint sprig and an orange slice. </li>\n<li>Pour hot coffee into cups. In a small bowl, beat cream until soft peaks form. Gradually add sugar, beating until stiff peaks form. </li>\n<li>Serve with the coffee.</li>\n</ol>\n</div>
544075	Cranberry Orange Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Cranberry-Orange-Sauce-544075.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all the ingredients in a saucepan and bring to a boil. When they reach a boil, turn the heat to a simmer and cook for10-15 minutes or until the berries start to pop. Turn off heat and cool. </li>\n<li>Remove the cinnamon stick. </li>\n<li>Serve warm or chilled.*Allow to cool, place in appropriate container or ziploc bag, label and freeze.</li>\n</ol>\n</div>
281947	Warm Black Bean and Orange Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Warm-Black-Bean-and-Orange-Salad-281947.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat 2 tablespoons extra-virgin olive oil in a skillet over medium-high heat. </li>\n<li>Add red onion slices, and season with salt and pepper, to taste. Reduce the heat to medium-low, and cook the red onion for about 7 minutes or until caramelized. Stir in cumin, and cook the red onion slices for another minute. Deglaze the skillet with the zest and juice of 1 orange, then add rinsed and drained black beans. Cook the black bean-and-red onion mixture for 2-3 minutes or until heated through. Toss in the segments of 1 orange, and season with 1/2 teaspoon salt and 1/4 teaspoon pepper. </li>\n<li>Serve the salad with a drizzle of extra-virgin olive oil.</li>\n</ol>\n</div>
527715	Pineapple, Orange & Banana Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Pineapple--Orange---Banana-Smoothie-527715.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a blender, combine all ingredients. Blend until smooth, then serve immediately. (If your blender has trouble getting going, you may need to add in a few tablespoons of water or juice to get it started.)</li>\n</ol>\n</div>
44517	Shaved Fennel And Radish Salad	\N	\N	\N	https://spoonacular.com/recipeImages/shaved-fennel-and-radish-salad-2-44517.jpg	http://www.williams-sonoma.com/recipe/shaved-fennel-and-radish-salad.html
437739	Holiday Cranberry Jam	\N	\N	\N	https://spoonacular.com/recipeImages/Holiday-Cranberry-Jam-437739.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a food processor, coarsely process cranberries and orange sections. </li>\n<li>Place in a Dutch oven with strawberries and sugar. Bring to a full rolling boil over high heat, stirring constantly. Boil for 1 minute.</li>\n\n<li>Remove from the heat and stir in the pectin. Skim off the foam. Carefully ladle into hot half-pint jars, leaving 1/4-in. headspace. </li>\n<li>Remove air bubbles; wipe rims and adjust lids. Process for 10 minutes in a boiling-water canner.</li>\n</ol>\n</div>
249351	Orange and Banana Ole	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-and-Banana-Ole-249351.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a serving bowl, arrange the orange slices.In a dish, combine the juice, sugar, and chili powder, whisking until well combined.</li>\n<li>Pour the juice mixture over the oranges, cover and chill for ten minutes.Gently stir in banana slices before serving.</li>\n</ol>\n</div>
626236	Carrot Orange Ginger Juice {Hydration Challenge}	\N	\N	\N	https://spoonacular.com/recipeImages/Carrot-Orange-Ginger-Juice-{Hydration-Challenge}-626236.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients in the Blendtec blender and press the "whole juice" function. </li>\n<li>Add more or less ice to taste.</li>\n<li>Pour into two glasses to serve.</li>\n</ol>\n</div>
249441	Honey and Orange Creamsicle Slushy	\N	\N	\N	https://spoonacular.com/recipeImages/Honey-and-Orange-Creamsicle-Slushy-249441.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place Simply Orange with Banana Juice into blender along with almond milk, honey, vanilla and ice cubes. Blend for about 15 seconds or until ice is blended into small pieces.</li>\n<li>Pour slushy into individual glasses and serve cold.</li>\n</ol>\n</div>
3714	For Valentine's Day:  The His & Hers Gin And Tonics	\N	\N	\N	https://spoonacular.com/recipeImages/for_valentines_day_the_his_hers_gin_and_tonics-3714.jpg	http://www.thekitchn.com/for-valentines-day-the-his-and-hers-gin-and-tonics-165844
126760	Dutch Courage from Highlands Bar and Grill	\N	\N	\N	https://spoonacular.com/recipeImages/dutch-courage-from-highlands-bar-and-grill-2-126760.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Fill a cocktail shaker with ice. </li>\n<li>Add genever, Cointreau, Satsuma juice, and orange bitters. Shake well and strain into an ice filled rocks glass.</li>\n</ol>\n</div>
511572	Chocolate Dipped Banana	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-Dipped-Banana-511572.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Peel banana, cut it into several pieces. Melt chocolate on water bath or in microwave. When you microwave chocolate be sure to mix it every few seconds otherwise it will burn.Dip lollipop sticks into chocolate and stick them into banana. Freeze banana for about 10 minutes, until the chocolate is all set. Dip bananas into chocolate, let excess drip of and dip it into chopped walnuts. Freeze them until you serve them.</li>\n</ol>\n</div>
544360	Banana Molasses Oatmeal Mash	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Molasses-Oatmeal-Mash-544360.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all the ingredients in a bowl and mash with a fork tocombine. </li>\n<li>Serve.</li>\n</ol>\n</div>
167540	Frozen Yogonana Bites	\N	\N	\N	https://spoonacular.com/recipeImages/Frozen-Yogonana-Bites-167540.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Line cookie sheet with foil. Spoon yogurt into shallow dish. </li>\n<li>Pour cereal into another shallow dish. Peel bananas; cut each into 6 pieces.</li>\n<li>2</li>\n\n<li>Roll each banana piece in yogurt, then in cereal to coat. </li>\n<li>Place coated banana pieces on cookie sheet. Freeze uncovered about 1 hour or until firm. (The bites are best when eaten the same day they're made.)</li>\n</ol>\n</div>
282237	Banana-Strawberry-Lime Sorbet	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Strawberry-Lime-Sorbet-282237.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients in bowl of a food processor. Blend until mixture has the consistency of ice cream. Divide among 4 bowls and serve, topped with extra strawberries or whipped cream, if desired.</li>\n</ol>\n</div>
249481	Fat Elvis Vegan Pudding Pops	\N	\N	\N	https://spoonacular.com/recipeImages/Fat-Elvis-Vegan-Pudding-Pops-249481.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Put all ingredients into a blender or food processor and blend until smooth.</li>\n<li>Pour into popsicle molds and freeze until solid.</li>\n</ol>\n</div>
544410	Elvis Paninis	\N	\N	\N	https://spoonacular.com/recipeImages/Elvis-Paninis-544410.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Spread almond butter on one side of bread and cover with 3 slices of banana. Top with the second slice of bread and place in a panini press on medium/high heat. Cook for 3-4 minutes or until sandwich is pressed and golden. Cool thoroughly and cut into 4 squares and serve.</li>\n</ol>\n</div>
249496	Bananas with Caramel Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Bananas-with-Caramel-Sauce-249496.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Peel the bananas and place each onto a dessert plate.</li>\n<li>Put the margarine, sugar and syrup into a saucepan and heat gently until melted.Bring to the boil, then reduce the temperature and simmer for 2 minutes or until it starts to thicken.</li>\n<li>Remove from the heat, stir in the lemon juice and immediately pour the sauce over the bananas.</li>\n<li>Serve with dairy-free ice cream.</li>\n</ol>\n</div>
446178	matcha vanilla smoothies	\N	\N	\N	https://spoonacular.com/recipeImages/matcha-vanilla-smoothies-446178.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Blend everything together. Taste & adjust to your liking. </li>\n<li>Add some sweetener if you wish.</li>\n</ol>\n</div>
511860	Frozen Chocolate Banana Bites	\N	\N	\N	https://spoonacular.com/recipeImages/Frozen-Chocolate-Banana-Bites-511860.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Insert a skewer into the end of each banana. </li>\n<li>Place on a parchment-lined baking pan and place in freezer at least 4 hours or up to overnight. </li>\n<li>Place each topping in its own shallow bowl or plate. Melt the chocolate chips in a double boiler over medium-low heat, stirring frequently. </li>\n<li>Pour some melted chocolate into a short glass or cup. One at a time, dip frozen bananas into chocolate, turning to coat and letting excess chocolate drip off. Immediately sprinkle with toppings, lightly pressing to adhere if necessary. Refill glass with more melted chocolate as needed. </li>\n<li>Place bananas back on baking pan, and re-freeze for at least 1 hour. Store in freezer for up to 4 days.</li>\n</ol>\n</div>
544638	Banana Pear Peach Puree	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Pear-Peach-Puree-544638.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Put all ingredients in a food processor. Puree until smooth. </li>\n<li>Serve.To Freeze: </li>\n<li>Place in Baby Cubes and freeze for up to 3 months.</li>\n</ol>\n</div>
610209	Chocolate Banana Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-Banana-Smoothie-610209.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Put banana, cocoa powder, ice cubes and chocolate soy milk in an electric blender/mixer or Nutri</li>\n<li>Bullet.Blend until all the ingredients are combined and smooth.</li>\n<li>Pour into a glass (or 2 small glasses). </li>\n<li>Add whipped cream and your choice of sprinkles, if desired.</li>\n</ol>\n</div>
200715	Peanut Butter Banana Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Peanut-Butter-Banana-Smoothie-200715.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Combine all ingredients in a blender. Blend until smooth. Enjoy this smoothie as a mid-morning snack or before you work out for a boost of protein, dietary fat, and fiber.</li>\n</ol>\n</div>
102457	Banana Pudding (Raw Recipe)	\N	\N	\N	https://spoonacular.com/recipeImages/banana-pudding-2-102457.jpg	http://www.food.com/recipe/banana-pudding-raw-recipe-338865
282712	Creamy Banana Whip & Sticks	\N	\N	\N	https://spoonacular.com/recipeImages/Creamy-Banana-Whip---Sticks-282712.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>MASH banana in small bowl with fork.  Gently stir in whipped topping. SERVE with the graham sticks for dipping.</li>\n</ol>\n</div>
529010	4 Ingredient Peanut Butter Banana Ice Cream Sandwiches	\N	\N	\N	https://spoonacular.com/recipeImages/4-Ingredient-Peanut-Butter-Banana-Ice-Cream-Sandwiches-529010.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350 degrees. In a bowl, whisk together egg and sugar until light and airy in color. </li>\n<li>Whisk in peanut butter until smooth. On a parchment or silicone mat lined baking sheet, drop tablespoon size dollops onto the cookie sheet. </li>\n<li>Bake for 10-12 minutes until they are golden brown around the edges. </li>\n<li>Remove from the oven and let them cool on the sheet until just warm. </li>\n<li>Remove them from sheet and place on a wire rack to completely cool. In a high powered blender or a food processor, add frozen banana pieces to the bowl, cover and blend until smooth. Uncover and scrape down the sides of the bowl as necessary. This may take a few scrapes to complete. Take a large spoonful of the banana "Ice cream" onto the flat side of one cookie and sandwich it between the flat side of another cookie. Eat immediately or place into the freezer to firm up until ready to serve. If they will be in the freezer for a prolonged amount of time - wrap the sandwiches or place in freezer baggies to prevent them from burn or staling.</li>\n</ol>\n</div>
414401	Banana Bread Snack Cakes	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Bread-Snack-Cakes-414401.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a bowl, combine flour and baking soda. In another bowl, whisk the brown sugar, water, banana, oil and vanilla. Stir into dry ingredients just until moistened. </li>\n<li>Transfer to a greased 8-in. square baking dish.</li>\n\n<li>Bake at 350° for 30-35 minutes or until a toothpick inserted near the center comes out clean. Cool on a wire rack. Dust with confectioners' sugar. </li>\n<li>Cut into squares.</li>\n</ol>\n</div>
627406	Healthy, 3 Ingredient Date Shake(Naturally Vegan and Grain/Gluten Free)	\N	\N	\N	https://spoonacular.com/recipeImages/Healthy--3-Ingredient-Date-Shake(Naturally-Vegan-and-Grain-Gluten-Free)-627406.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>If using harder dates, roughly chop, cover with almond milk and let sit 20-30 minutes before blending.</li>\n<li>Place all ingredients in a blender and blend until as smooth as possible(there will still be some small date pieces left).</li>\n<li>Serve immediately.</li>\n</ol>\n</div>
529156	Caramel Bananas and Doughnuts	\N	\N	\N	https://spoonacular.com/recipeImages/Caramel-Bananas-and-Doughnuts-529156.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Divide doughnuts into four dishes. If using full size doughnuts, crumble into chunks. In a skillet over medium heat, whisk together sugar, vanilla, orange zest, juice and dash of salt (if using) - and bring to a simmer. Allow the mixture to start to caramelize and thicken. </li>\n<li>Add in sliced bananas and toss to coat. Spoon over crumbled doughnuts and serve immediately.</li>\n</ol>\n</div>
250761	Banana Shake	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Shake-250761.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients in a blender; process until smooth.Variations: Banana Shake Plus: </li>\n<li>Add 2 teaspoons ground flaxseed. Banana-Cocoa Shake: </li>\n<li>Add 1 tablespoon unsweetened cocoa. Banana-Berry Shake: </li>\n<li>Add 1/4 cup berries (any variety).Carb Star: Bananas 7 to 5 grams of Resistant Starch per serving, depending on ripeness Bananas are your richest source of Resistant Starch, with ripe ones offering 7 grams of the fat flusher and less ripe (slightly green) bananas containing a whopping 5 grams. They are also rich in appetite-suppressing fiber (with 3 grams per 1 medium banana) and contain the amino acid tryptophan, which is converted into the calming brain chemical serotonin to relax and improve your mood.</li>\n</ol>\n</div>
54208	Coconut Kissed Banana Bread	\N	\N	\N	https://spoonacular.com/recipeImages/coconut_kissed_banana_bread-54208.jpg	http://magpiesrecipes.blogspot.com/2011/04/coconut-kissed-banana-bread-no-butter.html
578594	Peanut Butter Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Peanut-Butter-Smoothie-578594.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Blend the frozen banana, chocolate milk, and cream peanut butter for 30 seconds or until smooth.Use a single serve blending cup if possible. If not, use a mason jar and any standard blender base! Or simply use your normal blender and pitcher, but double the servings.</li>\n</ol>\n</div>
611447	Honey Nut Cheerios & Banana Marshmallow Cereal Treats	\N	\N	\N	https://spoonacular.com/recipeImages/Honey-Nut-Cheerios---Banana-Marshmallow-Cereal-Treats-611447.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Line a 9-inch square baking pan with foil and grease with non-stick cooking spray; set aside. In a large pot over low heat, melt the butter.  </li>\n<li>Add the marshmallows and mashed banana and stir constantly until the marshmallows have all melted.  </li>\n<li>Remove the pot from the stove and stir in the cereal until evenly coated with the marshmallow cream. Turn the mixture into the prepared pan and press it into a compact, even layer. Refrigerate until set, about 30 minutes. Store leftovers in an airtight container in the refrigerator for up to 4 days.</li>\n</ol>\n</div>
529558	Step By Step: Chocolate-Covered Banana & PB Bites (GF and Vegan!)	\N	\N	\N	https://spoonacular.com/recipeImages/Step-By-Step--Chocolate-Covered-Banana---PB-Bites-(GF-and-Vegan)-529558.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut bananas into ½ inch rounds, or smaller.</li>\n<li>Place ½ teaspoon of peanut butter on top of half the rounds and top each one with another banana round (to make little “sandwiches”).</li>\n<li>Place a toothpick in each sandwich and put in the freezer for 10 minutes.</li>\n<li>Heat a small saucepan at low heat and add coconut oil and chocolate chips. Stir constantly until melted into a smooth sauce, transfer to a bowl.Dip a banana ‘sandwich’ into the sauce and twirl to coat one at a time. </li>\n<li>Let air dry for about 10 seconds before setting down, the chocolate will harden very fast.Repeat for all banana bites. </li>\n<li>Place in the freezer for 10 minutes to set.Enjoy!Store in the fridge or freezer.</li>\n</ol>\n</div>
349428	Banana Pancake Snowmen	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Pancake-Snowmen-349428.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>COMBINE pancake mix, water and mashed banana. </li>\n<li>Mix just until large lumps disappear. HEAT skillet over medium-high heat or griddle to 375ºF. Spray with no-stick cooking spray. Using about 1/4 cup of batter for each snowman, pour 2 pancakes, one slightly smaller than the other, onto the hot pan or griddle with sides touching to resemble a snowman. Cook 1 to 1 1/2 minutes on each side or until golden brown. While cooking second side, place chocolate chips on surface to resemble eyes, nose, and buttons and a slice of banana for the mouth. </li>\n<li>Remove from griddle. Sprinkle lightly with powdered sugar.</li>\n</ol>\n</div>
267575	Easy Banana Creme Brulee	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Banana-Creme-Brulee-267575.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>SPREAD wafer pieces onto bottom of shallow 1-1/2-qt. casserole; top with bananas. COOK pudding with 2 cups milk as directed on package; pour over bananas. Refrigerate several hours or until firm. HEAT broiler when ready to serve dessert.  Sprinkle sugar over pudding.  Broil 3 to 5 min. or until sugar is melted and lightly browned.  </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
578977	Paleo Pina Colada: Frosty and Healthy	\N	\N	\N	https://spoonacular.com/recipeImages/Paleo-Pina-Colada--Frosty-and-Healthy-578977.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Buzz everything here together in a blender, helping it along, if needed, by pushing things down (with the blender turned off, of course).If it's still too thick, add up to 1/2 cup of water to get things going.</li>\n</ol>\n</div>
267748	Low-Fat Chocolate-Banana Parfaits	\N	\N	\N	https://spoonacular.com/recipeImages/Low-Fat-Chocolate-Banana-Parfaits-267748.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>BEAT pudding mix and milk with whisk 2 min. SPOON half the pudding evenly into 4 dessert glasses; cover with layers of bananas and half the COOL WHIP. Top with remaining pudding and COOL WHIP. REFRIGERATE 1 hour.</li>\n</ol>\n</div>
759354	Chocolate-Hazelnut Banana Rounds	\N	\N	\N	https://spoonacular.com/recipeImages/chocolate-hazelnut-banana-rounds-759354.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 375°F, and line 1 baking sheet with parchment paper. Sprinkle half of sugar on work surface and place puff pastry on top. Sprinkle remaining sugar over dough and use rolling pin to press in. </li>\n<li>Roll dough to 11-inch square and cut out rounds with 2-inch round cutter. Reroll scraps, and repeat until you have 34 rounds. </li>\n<li>Place rounds on prepared baking sheet. </li>\n<li>Place another piece of parchment on top of rounds, and top with another baking sheet. </li>\n<li>Bake 15 minutes, or until barely golden. </li>\n<li>Remove top baking sheet and parchment. </li>\n<li>Bake 5 minutes more, or until cookies are brown and crisp. Cool. To serve: </li>\n<li>Spread chocolate-hazelnut spread on each round, and top with banana slice.</li>\n</ol>\n</div>
579424	Jamba Juice Peanut Butter Moo'd Smoothie: Homemade and the Best	\N	\N	\N	https://spoonacular.com/recipeImages/Jamba-Juice-Peanut-Butter-Mood-Smoothie--Homemade-and-the-Best-579424.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Blend the frozen banana, chocolate milk, and cream peanut butter for 30 seconds or until smooth.Use a single serve blending cup if possible. If not, use a mason jar and any standard blender base! Or simply use your normal blender and pitcher, but double the servings.</li>\n</ol>\n</div>
579441	Strawberry Banana Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Strawberry-Banana-Smoothie-579441.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Blend all ingredients until smooth. </li>\n<li>Serve immediately or chill.</li>\n</ol>\n</div>
169959	Chocolate-Peanut Butter-Banana Smoothies	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-Peanut-Butter-Banana-Smoothies-169959.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Cut banana into 1-inch chunks. </li>\n<li>Place banana and remaining ingredients in blender or food processor. Cover; blend on high speed about 30 seconds or until smooth.</li>\n<li>2</li>\n\n<li>Pour into 2 glasses. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
186429	Grilled Pineapple and Bananas with Lemonade Glaze	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-Pineapple-and-Bananas-with-Lemonade-Glaze-186429.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Make a lengthwise slice on the skin of each unpeeled banana chunk to allow easy peeling after bananas are grilled. Thread the fruit onto skewers, alternating chunks of banana and pineapple.</li>\n<li>To make the glaze, put the sugar in a stainless-steel saucepan and cook over medium-high heat until it becomes liquid, about 3 minutes. Stir with a wooden spoon and add the lemon juice and zest. If using cane syrup, simply add the lemon juice with zest and stir, without heating. Set aside.</li>\n<li>Fill a charcoal chimney with hardwood lump charcoal, set the chimney on the bottom grill grate, and light. When the coals are ready, dump them into the bottom of the grill and spread evenly. For a gas grill, turn to medium-high.</li>\n\n<li>Brush the skewered fruits with the glaze. </li>\n<li>Place the skewers over direct heat. Grill 3 minutes on each side, until fruit is browned. </li>\n<li>Remove from grill and brush again with the glaze. </li>\n<li>Serve immediately.</li>\n<li>Excerpt from 25 Essentials: Techniques for Grilling, by Ardie A. Davis, ©  Photographs © 2009 by Joyce Oudkerk Pool. Used by permission of The Harvard Common Press.</li>\n</ol>\n</div>
268380	P. B. & Banana Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/P--B----Banana-Sandwich-268380.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>SPREAD each bread slice with 1 Tbsp. peanut butter. Top 1 of the bread slices with banana slices. Cover with second bread slice. CUT sandwich diagonally in half.</li>\n</ol>\n</div>
219247	Chocolate baked bananas	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-baked-bananas-219247.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oven to 200C/180C fan/gas 6 (ora BBQ). Make a slit through the skin ofthe bananas along one side – makingsure you don’t cut all the way through tothe other side. Poke in the chocolatebuttons along the cut. Put each bananaonto a sheet of foil and crimp the edgestogether to seal into a parcel. </li>\n<li>Transfer toa baking sheet and cook for 25 mins untilthe bananas have turned black (or popstraight into the BBQ embers for 15 mins).</li>\n<li>Serve with a scoop of ice cream andany melted chocolate that has escaped!</li>\n</ol>\n</div>
596146	Swiss Chard Green Smoothie with Lime and Banana	\N	\N	\N	https://spoonacular.com/recipeImages/Swiss-Chard-Green-Smoothie-with-Lime-and-Banana-596146.jpg	http://www.wishfulchef.com/swiss-chard-green-smoothie-with-lime-and-banana/
596192	Kale Green Smoothie with Grapefruit and Bananas	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-Green-Smoothie-with-Grapefruit-and-Bananas-596192.jpg	http://www.wishfulchef.com/kale-green-smoothie-with-grapefruit/
596249	Banana Orange and Curly Parsley Green Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Orange-and-Curly-Parsley-Green-Smoothie-596249.jpg	http://www.wishfulchef.com/orange-banana-green-smoothie/
203161	Chocolate Dipped Frozen Bananas	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-Dipped-Frozen-Bananas-203161.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Slice bananas in half and carefully mount on Popsicle sticks. </li>\n<li>Place bananas on a tray, plate or baking dish in the freezer for 2 hours or until firm. You can freeze up to overnight. Do not cover bananas as this will cause ice crystals to form.</li>\n<li>2</li>\n<li>In a medium bowl whisk together melted chocolate and coconut oil until thoroughly combined. </li>\n<li>Place nuts in a wide, shallow plate or pie plate (if using).</li>\n<li>3</li>\n\n<li>Remove bananas from freezer. If ice crystals have formed on the bananas use a paper towel to gently brush them off. Dip banana in chocolate and swirl to cover. Alternately you can use a spoon to help cover and ensure even chocolate distribution.</li>\n<li>4</li>\n\n<li>Roll bananas in chopped nuts. </li>\n<li>Let cool for 1 minute, Then place on a serving platter. If you don't plan on serving the bananas immediately, return them to the freezer for up to a few hours. If serving from freezer, place on plate and allow to thaw for 10 minutes before serving.</li>\n</ol>\n</div>
580034	Banana Lassi - How to make Banana Lassi - Indian Yogurt Drink	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Lassi---How-to-make-Banana-Lassi---Indian-Yogurt-Drink-580034.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Take the yogurt, chopped bananas, cardamom powder and sugar in a blender.Blend it well until smooth and creamy.</li>\n<li>Add water and blend until well combined.If you want a slightly thin consistency, add little more water to the lassi while blending.</li>\n<li>Pour it into glasses and add ice cubes.You can also chill the lassi in the refrigerator.</li>\n<li>Serve chilled.</li>\n</ol>\n</div>
285205	Grilled Banana Mini-Pies	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-Banana-Mini-Pies-285205.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>HEAT grill to medium heat. ARRANGE banana slices in single layer in centers of 8 sheets of heavy-duty foil sprayed with cooking spray. Top each with 1 Tbsp. cajeta and 1 cookie. BRING up foil sides. Double fold top and both ends to seal each packet, leaving room for heat circulation inside. GRILL 3 to 5 min. or until cajeta is melted.  Top each opened packet with COOL WHIP.</li>\n</ol>\n</div>
350764	Banana Empanadas	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Empanadas-350764.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 425 degrees F.  Coat a large baking sheet with cooking spray. In a large bowl, combine bananas, sugar and cinnamon.  </li>\n<li>Mix well and set aside. Unroll pie crusts onto a flat surface.  Using a ring mold, make circles in the dough. </li>\n<li>Put the banana mixture on the pie dough and place another round on top. Pinch around the edges of each section to seal. </li>\n<li>Transfer the empanadas to the prepared baking sheet and make slits in the top of each to allow steam to escape. </li>\n<li>Place the baking sheet into the preheated oven and bake until crust is golden brown, about 8 to 10 minutes. </li>\n<li>Remove the baking sheet from the oven and place the empanadas on a platter. </li>\n<li>Serve with ice cream or sprinkle with powdered sugar, if using.</li>\n</ol>\n</div>
72327	Chocolate Frozen Banana Bites	\N	\N	\N	https://spoonacular.com/recipeImages/chocolate-frozen-banana-bites-2-72327.jpg	http://www.kraftrecipes.com/recipes/chocolate-frozen-banana-bites-114519.aspx
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
549020	Avocado Banana Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Avocado-Banana-Smoothie-549020.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine all ingredients in a blender and process until creamy and smooth, adjusting sweetness to taste and adding more milk as necessary to reach desired consistency.</li>\n</ol>\n</div>
549115	Banana Coffee Cake	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Coffee-Cake-549115.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Follow the directions on the back of the box, heating the oven to 350 degrees. </li>\n<li>Mix together the cake, bananas, and egg. </li>\n<li>Place half in a greased 8x8 inch baking dish. Sprinkle 1/2 cup of the crumb topping and then add dolops of the remaining batter on top of the mixture. Use a knife to drag through the batter, swirling the mixture. Top with remaining crumb mixture and bake for 40 minutes. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
762137	Chocolate-Peanut Butter Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/chocolate-peanut-butter-smoothie-762137.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In blender, combine soy milk, banana and peanut butter. Blend until smooth and creamy. With blender running, add ice if using and blend until almost smooth. </li>\n<li>Serve right away.</li>\n</ol>\n</div>
123348	Banana & Grape Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/banana-grape-smoothie-2-123348.jpg	http://www.food.com/recipe/banana-grape-smoothie-166535
565730	Chocolate Chip Banana Bread made with Greek Yogurt	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-Chip-Banana-Bread-made-with-Greek-Yogurt-565730.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350 degrees. Grease a large loaf pan.</li>\n<li>Mix together bananas, egg, greek yogurt, vanilla, and sugar.Gradually stir in the pastry flour, baking powder, and salt. </li>\n<li>Add in the chocolate chips.Evenly pour the batter into the pan about 3/4 full. </li>\n<li>Bake for 45 minutes, or until toothpick comes out clean. Cool completely before removing and cutting.</li>\n</ol>\n</div>
549368	Tucanos Fried Bananas	\N	\N	\N	https://spoonacular.com/recipeImages/Tucanos-Fried-Bananas-549368.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the flour and salt in one bowl, eggs in another and bread crumbs in a third. Cinnamon sugar should go in another bowl if you choose to use it. Peel the bananas and cut it into thirds. </li>\n<li>Roll the banana in the flour, then the egg and finally the bread crumbs. </li>\n<li>Drizzle a little olive oil in a shallow dish and quickly roll the bananas in it. </li>\n<li>Place 4-5 pieces directly into the airfryer basket and push to close. Plug in the airfryer, set the temperature to 355 and the timer to 8 minutes. At 4 minutes take the basket out and give it a little shake to move the bananas. Continue frying and then remove and drop directly into cinnamon sugar or onto a serving plate. Allow to cool for 1 minute and eat!</li>\n</ol>\n</div>
483917	Three-Ingredient Banana Pancakes	\N	\N	\N	https://spoonacular.com/recipeImages/Three-Ingredient-Banana-Pancakes-483917.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a medium bowl, mash bananas well with a fork. </li>\n<li>Add the eggs and the coconut and use a hand whisk to whisk everything together until as smooth as possible.With your fingers, spread a thin layer of coconut oil (about ½ teaspoon) on the bottom of a large, 12-inch skillet. </li>\n<li>Heat over medium heat, about 4 minutes.Measuring ¼-cup per pancake, pour batter onto three spots on the skillet. Fry 3 minutes on the first side or until set and golden, then flip and fry 2 more minutes on the second side.</li>\n<li>Place ½ more teaspoon coconut oil in the skillet, brush to coat, and repeat with 3 more pancakes. </li>\n<li>Serve immediately, with or without berries and warm maple syrup.</li>\n</ol>\n</div>
270968	Frozen Banana Treats	\N	\N	\N	https://spoonacular.com/recipeImages/Frozen-Banana-Treats-270968.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>MELT chocolate as directed on package.  Meanwhile, insert a wooden pop stick into cut end of each banana piece. DIP bananas in chocolate, or brush chocolate onto banana pieces with pastry brush.  </li>\n<li>Roll bananas in cereal, completely coating all sides. FREEZE bananas 4 hours or until firm.  Store in airtight container in freezer.</li>\n</ol>\n</div>
189174	Almond Butter and Finger Bananas on Fruit Bread	\N	\N	\N	https://spoonacular.com/recipeImages/Almond-Butter-and-Finger-Bananas-on-Fruit-Bread-189174.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Spread a thick layer of the almond butter over each bread slice. Top with the banana slices and serve open-faced.</li>\n<li>Suggestions for the kids</li>\n<li>Use smaller slices or remove the crusts, and cut the bananas crosswise, not lengthwise.</li>\n</ol>\n</div>
598996	Banana Fritters	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Fritters-598996.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine the bananas, cornmeal, sugar, and salt in a bowl and mash with a fork until smooth. </li>\n<li>Heat 2 1/2 inches of oil in a deep pot to 350°F (175°C). Working in batches, add the banana mixture, a heaping tablespoon at a time, and fry until golden brown, about 2 to 3 minutes, turning once halfway through cooking. </li>\n<li>Remove from the oil with a skimmer or slotted spoon and drain on paper towels. Before serving, drizzle with the honey.</li>\n</ol>\n</div>
484460	Chocolate-Covered Banana Bites	\N	\N	\N	https://spoonacular.com/recipeImages/Chocolate-Covered-Banana-Bites-484460.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Line a baking sheet or a tray with wax paper. Slice bananas into ½-inch-thick pieces, about 8 pieces per banana.In a small pot over low heat, melt chocolate and coconut oil, stirring constantly. Turn off heat.Using two teaspoons, dip each banana piece into the melted chocolate. Swirl to coat. </li>\n<li>Remove from chocolate, allowing excess to drip back into pot. </li>\n<li>Place on wax paper. Sprinkle dipped banana pieces with coconut.</li>\n<li>Place the chocolate covered banana bites in fridge for about an hour, until chocolate is set, then serve.</li>\n</ol>\n</div>
304363	Fresh Banana Ice-cream with Coconut	\N	\N	\N	https://spoonacular.com/recipeImages/Fresh-Banana-Ice-cream-with-Coconut-304363.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the ice-cream into a container and fold in the banana and toasted coconut, and banana extract. </li>\n<li>Place in freezer until ready to serve. Divide the ice-cream between 4 dessert plates and garnish with mint.</li>\n</ol>\n</div>
566721	Banana Yogurt Oatmeal Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Yogurt-Oatmeal-Smoothie-566721.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Put bananas, yogurt, oatmeal and almonds blender. </li>\n<li>Add ice and blend on high until smoothie thickens, about 30 seconds.For chocolate banana smoothie add cocoa and pulse a few times.</li>\n</ol>\n</div>
550536	Banana Bread (Grain Free, Gluten Free, Paleo, Primal)	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Bread-(Grain-Free--Gluten-Free--Paleo--Primal)-550536.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350ºF and adjust rack to middle position. </li>\n<li>Place all ingredients in the bowl of a food processor and process until smooth. </li>\n<li>Pour into a buttered loaf pan (I always use a glass loaf pan to ensure even baking). </li>\n<li>Bake for 40-55 minutes until tester inserted in the middle comes out with a few moist crumbs attached. Cool for 10 minutes and then invert bread onto a cooling rack.*To make homemade grain-free baking powder combine 1 part baking soda, 1 part arrowroot powder and 2 parts cream of tartar. Store in an airtight container for up to 6 months.</li>\n</ol>\n</div>
665469	Xocai Healthy Chocolate Peanut Butter Bannana Dip	\N	\N	\N	https://spoonacular.com/recipeImages/Xocai-Healthy-Chocolate-Peanut-Butter-Bannana-Dip-665469.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place Nugget in a custard cup and microwave in 10 seconds increments until melted.Stir in the peanut butter and mix thoroughly. Swirl the banana in the dip.</li>\n</ol>\n</div>
387100	Banana Blueberry Orange Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Banana-Blueberry-Orange-Smoothie-387100.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients into the Vitamix container in the order listed and secure lid.Select Variable Turn machine on and slowly increase speed to Variable 10, then to High.Blend for 1 minute or until desired consistency is reached.</li>\n</ol>\n</div>
124985	Mexican Paletas	\N	\N	\N	https://spoonacular.com/recipeImages/mexican-paletas-2-124985.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Pour paletas mixture (choices follow) equally into 6 juice bar molds (see notes). Attach covers. Insert sticks, leaving 1 1/2 to 2 inches of each exposed. Freeze paletas upright until firm, at least 3 hours or up to 2 weeks. Hold each mold up to the rim under warm running water just until paletas are released from sides of molds, 5 to 15 seconds. </li>\n<li>Remove covers and pull out paletas.Banana paletas. In a 2-cup glass measure, combine 1 cup milk, 3/4 cup smoothly mashed ripe banana, 1 teaspoon vanilla, and 1/4 cup sugar; stir until sugar is dissolved (mixture is no longer grainy to taste).Per paleta: 85 cal., 16% (14 cal.) from fat; 6 g protein; 5 g fat (9 g sat.); 17 g carbo (5 g fiber); 20 mg sodium; 7 mg chol.Blackberry paletas. In a blender, whirl 2 1/2 cups rinsed, drained blackberries until smooth. Push through a strainer into a 2-cup glass measure; discard residue. </li>\n<li>Add 1 cup milk and 6 tablespoons sugar to berry purée; stir until sugar is dissolved.Per paleta: 104 cal., 13% (14 cal.) from fat; 8 g protein; 6 g fat (8 g sat.); 22 g carbo (0 g fiber); 20 mg sodium; 7 mg chol.Cucumber-chili paletas. In a blender, combine 3 cups 1-inch chunks peeled, seeded cucumber (1 1/2 lb.); 2/3 cup sugar; 1/3 cup lemon juice; and 1 rinsed, stemmed jalapeño chili (1 to 1 1/2 oz.; remove seeds and veins for less heat). Whirl until smooth. Push mixture through a fine strainer set over a 2-cup glass measure; discard residue.Per paleta: 100 cal., 9% (9 cal.) from fat; 5 g protein; 1 g fat (0 g sat.); 26 g carbo (4 g fiber); 5 mg sodium; 0 mg chol.Mango paletas. In a blender, combine 2 1/2 cups 1-inch chunks mangoes (from 1 1/2 lb. fruit), 1/4 cup sugar, and 3 tablespoons lime juice; whirl until smooth.Per paleta: 85 cal., 1% (8 cal.) from fat; 4 g protein; 2 g fat (1 g sat.); 22 g carbo (8 g fiber); 9 mg sodium; 0 mg chol.Piña colada paletas. In a blender, combine 1 cup milk, 1/2 cup 1-inch chunks fresh or canned pineapple, 1/3 cup sugar, 1 teaspoon vanilla, and 1/2 teaspoon coconut extract; whirl until smooth.Per paleta: 76 cal., 17% (13 cal.) from fat; 4 g protein; 4 g fat (8 g sat.); 15 g carbo (2 g fiber); 20 mg sodium; 7 mg chol.Sour orange paletas. In a 2-cup glass measure, combine 1 1/3 cups orange juice, 1/3 cup lime juice, and 1/4 cup sugar; stir until sugar is dissolved.Per paleta: 60 cal., 5% (9 cal.) from fat; 4 g protein; 1 g fat (0 g sat.); 15 g carbo (1 g fiber); 8 mg sodium; 0 mg chol.Strawberry paletas. In a blender, whirl 3 3/4 cups rinsed, hulled strawberries until smooth. Push through a fine strainer into a 2-cup glass measure; discard residue. </li>\n<li>Add 1/3 cup sugar and 1 tablespoon lemon juice to berry purée; stir until sugar is dissolved.Per paleta: 72 cal., 5% (6 cal.) from fat; 6 g protein; 4 g fat (0 g sat.); 18 g carbo (5 g fiber); 6 mg sodium; 0 mg chol.</li>\n</ol>\n</div>
124996	Delicious and Easy Banana Bread or Muffins	\N	\N	\N	https://spoonacular.com/recipeImages/delicious-and-easy-banana-bread-or-muffins-2-124996.jpg	http://www.food.com/recipe/delicious-and-easy-banana-bread-or-muffins-148231
125011	Chocolate Banana Shake	\N	\N	\N	https://spoonacular.com/recipeImages/chocolate-banana-shake-2-125011.jpg	http://www.food.com/recipe/chocolate-banana-shake-50472
485471	Boonanas Halloween Snack	\N	\N	\N	https://spoonacular.com/recipeImages/Boonanas-Halloween-Snack-485471.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Peel the bananas then slice them in half. Try standing them on the cut end and continue trimming until they are able to stand on their own.Press two mini chocolate chips into the banana pointy side first, about 1/2 inch down from the tip.Press one chocolate chip pointy side first into the banana, below the mini chocolate chips.</li>\n<li>Serve standing on a plate, use a little peanut butter to help them stay standing if needed.</li>\n</ol>\n</div>
125018	"say What?" Banana Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/say-what-banana-sandwich-2-125018.jpg	http://www.food.com/recipe/say-what-banana-sandwich-95926
125033	Aubby Gobby Nana Muffins	\N	\N	\N	https://spoonacular.com/recipeImages/aubby-gobby-nana-muffins-2-125033.jpg	http://www.food.com/recipe/aubby-gobby-nana-muffins-369629
125041	Frozen Ban-Ola!	\N	\N	\N	https://spoonacular.com/recipeImages/frozen-ban-ola-2-125041.jpg	http://www.food.com/recipe/frozen-ban-ola-310512
125064	Banana Nut Martini	\N	\N	\N	https://spoonacular.com/recipeImages/banana-nut-martini-2-125064.jpg	http://www.food.com/recipe/banana-nut-martini-271019
125090	Strawberry Banana Colada	\N	\N	\N	https://spoonacular.com/recipeImages/strawberry-banana-colada-2-125090.jpg	http://www.food.com/recipe/strawberry-banana-colada-309117
125103	Eleanor's Fresh Fruit Salad	\N	\N	\N	https://spoonacular.com/recipeImages/eleanors-fresh-fruit-salad-2-125103.jpg	http://www.food.com/recipe/eleanors-fresh-fruit-salad-313817
125145	Banana Muffins	\N	\N	\N	https://spoonacular.com/recipeImages/banana-muffins-2-125145.jpg	http://www.food.com/recipe/banana-muffins-232276
125175	Banana-Blueberry Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/banana-blueberry-smoothie-2-125175.png	http://www.marthastewart.com/336635/banana-blueberry-smoothie
125187	Bondi Rip, a Mango Shake	\N	\N	\N	https://spoonacular.com/recipeImages/bondi-rip-a-mango-shake-2-125187.jpg	http://www.food.com/recipe/bondi-rip-a-mango-shake-377976
125209	Banana Pancakes (Eggless)	\N	\N	\N	https://spoonacular.com/recipeImages/banana-pancakes-2-125209.jpg	http://www.food.com/recipe/banana-pancakes-eggless-14130
125234	Berry Banana Pina Colada Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/berry-banana-pina-colada-smoothie-2-125234.jpg	http://www.food.com/recipe/berry-banana-pina-colada-smoothie-321550
125297	3-Ingredient Cinnamon Banana Slice	\N	\N	\N	https://spoonacular.com/recipeImages/3-ingredient-cinnamon-banana-slice-2-125297.jpg	http://www.food.com/recipe/3-ingredient-cinnamon-banana-slice-18766
125310	Honey Lime BBQ Bananas	\N	\N	\N	https://spoonacular.com/recipeImages/honey-lime-bbq-bananas-2-125310.jpg	http://www.food.com/recipe/honey-lime-bbq-bananas-369792
125325	Banana and Chocolate Shake	\N	\N	\N	https://spoonacular.com/recipeImages/banana-and-chocolate-shake-2-125325.jpg	http://www.food.com/recipe/banana-and-chocolate-shake-380990
125349	Sweet Coconut Tapioca Soup with Bananas (Che Chuoi)	\N	\N	\N	https://spoonacular.com/recipeImages/sweet-coconut-tapioca-soup-with-bananas-2-125349.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring water and coconut milk to a boil in a medium saucepan. Stir in sugar, tapioca, and salt. Reduce heat to medium-low; cook 30 minutes, stirring frequently. Stir in bananas. </li>\n<li>Remove from heat; cover, and let stand 15 minutes. </li>\n<li>Serve warm, or chill 3 hours. Sprinkle with sesame seeds, if desired.</li>\n</ol>\n</div>
125384	Chocolate-Hazelnut and Banana Crepe	\N	\N	\N	https://spoonacular.com/recipeImages/chocolate-hazelnut-and-banana-crepe-2-125384.png	http://www.marthastewart.com/335093/chocolate-hazelnut-and-banana-crepe
125403	Frozen Banana Smoothies	\N	\N	\N	https://spoonacular.com/recipeImages/frozen-banana-smoothies-2-125403.png	http://www.marthastewart.com/342123/frozen-banana-smoothies
125436	Vegan Challah	\N	\N	\N	https://spoonacular.com/recipeImages/vegan-challah-2-125436.png	http://www.food.com/recipe/vegan-challah-221339
157418	Beet And Spinach Tartine Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/Beet-And-Spinach-Tartine-Recipe-157418.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Boil the beets in salted water until tender, about 20 minutes.Chop the beets in quarters and purée in a blender with the walnuts, 1/2 a garlic clove, 2 tablespoons of olive oil, and salt and pepper. Cover and refrigerate.Blanch the spinach  for 30 seconds. </li>\n<li>Place spinach, 1/2 garlic clove, half a cup of walnuts, the parsley, 2 tablespoons olive oil, and salt and pepper in the blender. Purée. Refrigerate. Allow both mixtures to chill for at least 20 minutes.</li>\n<li>Spread mixture onto a slice of sourdough, sprinkle with salt and pepper and serve.</li>\n</ol>\n</div>
485135	Pork and Spinach Quesadillas	\N	\N	\N	https://spoonacular.com/recipeImages/Pork-and-Spinach-Quesadillas-485135.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat a large non-stick pan over medium heat.  </li>\n<li>Spread one half of the tortilla with chutney or preserves. </li>\n<li>Add cheese, pork, and fresh spinach.  Fold over, in half.  </li>\n<li>Place into a pan coated lightly with cooking oil spray. Cook until warm or until cheese is melted on each side.  Allow to cool before cutting into thirds, and serve.</li>\n</ol>\n</div>
247611	Spinach and Feta Fritters	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach-and-Feta-Fritters-247611.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
510004	Goat Cheese and Spinach Mashed Sweet Potatoes	\N	\N	\N	https://spoonacular.com/recipeImages/Goat-Cheese-and-Spinach-Mashed-Sweet-Potatoes-510004.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Peel and chop potatoes into 1-inch pieces. </li>\n<li>Place in a microwave safe dish and add 1" water at the bottom of the dish. Cover with plastic wrap and microwave for 10 minutes.</li>\n<li>Drain water from potatoes and place in a medium sized bowl. </li>\n<li>Add remaining ingredients and mash together with a potato masher.Check seasoning and add salt and pepper if needed.</li>\n<li>Serve warm.</li>\n</ol>\n</div>
552277	for Endive, Kale, and Smoked Salmon Salad with Avocado and Pink Grapefruit	\N	\N	\N	https://spoonacular.com/recipeImages/for-Endive--Kale--and-Smoked-Salmon-Salad-with-Avocado-and-Pink-Grapefruit-552277.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a medium bowl, combine chopped endive, kale, grapefruit segments, grapefruit juice, avocado, smoked salmon, and red onion.  </li>\n<li>Drizzle avocado or olive oil over the salad and mix well. Grind fresh pepper over the salad before serving.</li>\n</ol>\n</div>
425703	Easy Baked Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Baked-Mushrooms-425703.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place mushrooms on a baking sheet. </li>\n<li>Drizzle with oil; toss to coat. In a small bowl, combine the bread crumbs, garlic powder and pepper; sprinkle over mushrooms.</li>\n\n<li>Bake, uncovered, at 425° for 18-20 minutes or until lightly browned. </li>\n<li>Garnish with parsley if desired.</li>\n</ol>\n</div>
329850	Flank Steak Pinwheels	\N	\N	\N	https://spoonacular.com/recipeImages/Flank-Steak-Pinwheels-329850.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat grill or grill pan to high.To butterfly the flank steak, start with the meat grain running up and down in front of you. With your knife, begin cutting the meat in half. Essentially, you want a thinner, larger flank steak. Continue cutting the flank steak in half until you reach about 1 inch from completely cutting through. Lay the cut flank steak open and even out the middle so there is not a thicker piece in the center. Or just ask the butcher!</li>\n<li>Spread the flank steak out so that the grain is running left to right. Begin layering the flank steak with salt and pepper, the Asiago, then the spinach, the Gorgonzola and scallions. Begin rolling the flank steak tightly and away from you. Evenly insert the skewers 1 to 2 inches along the seam of the pinwheel to hold it together on the grill. </li>\n<li>Cut in between each skewer but not against the skewer; you want the same amount of meat on either side of each skewer. Grill the pinwheels on each side for about 3 to 4 minutes or until your desired doneness.</li>\n</ol>\n</div>
542863	Spinach and Strawberry Salad with Feta	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach-and-Strawberry-Salad-with-Feta-542863.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Toast walnuts by placing them in a  single layer on a cookie sheet. </li>\n<li>Bake for 350° for  8 to 10 minutes, checking periodically so that they don't burn.Arrange spinach on plates. Top with sliced strawberries, walnuts and feta cheese.</li>\n<li>Drizzle salads with walnut oil and balsamic vinegar.</li>\n</ol>\n</div>
100668	Curly Pasta With Spinach and Chickpeas	\N	\N	\N	https://spoonacular.com/recipeImages/curly-pasta-with-spinach-and-chickpeas-2-100668.jpg	http://www.food.com/recipe/curly-pasta-with-spinach-and-chickpeas-300341
624990	Roasted Turkey and Avocado Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Turkey-and-Avocado-Sandwich-624990.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Mash the avocado with a fork. Squeeze lime on it, sprinkle salt and mix well until creamy. Taste and add more lime or salt if needed.Smear mashed avocado on toasted bread. </li>\n<li>Place baby spinach leaves.</li>\n<li>Heat olive oil in a pan and toss in leftover turkey. </li>\n<li>Saute for 5 minutes and season with black pepper.Layer turkey and pickles over avocado and spinach leaves on the bread. Close it up and enjoy!</li>\n</ol>\n</div>
362866	Cavatappi with Spinach, Beans, and Asiago Cheese	\N	\N	\N	https://spoonacular.com/recipeImages/Cavatappi-with-Spinach--Beans--and-Asiago-Cheese-362866.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine all ingredients in a large bowl, and toss well. Sprinkle with fresh ground black pepper, if desired.</li>\n</ol>\n</div>
584084	Weekend Gardening: Dandelions (Japanese Sesame Spinach Salad with Dandelion Greens, Goma-ae)	\N	\N	\N	https://spoonacular.com/recipeImages/Weekend-Gardening--Dandelions-(Japanese-Sesame-Spinach-Salad-with-Dandelion-Greens--Goma-ae)-584084.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Blanch the spinach leaves in boiling water for 3 minutes, and remove with a strainer. </li>\n<li>Drain thoroughly in a colander. In the spinach water, blanch the dandelion greens until the bitterness is gone, 3 minutes or more, and strain. </li>\n<li>Drain in the colander. Pile all of the greens on 2 layered paper towels, and roll the towel around the greens. Press and allow to rest about 5 minutes, then remove the greens and transfer to a bowl with a lid. Chill in the refrigerator for about 30 minutes. DRESSING: In a small bowl, whisk together the tamari, rice vinegar, mirin, sugar, sea salt, and sesame oil. Grind 2 tablespoons of the toasted sesame seeds with a mortar and pestle, then add to the dressing. Toss the spinach and dandelion greens with the dressing and transfer to a serving bowl. Sprinkle on the remaining whole sesame seeds, and serve.</li>\n</ol>\n</div>
158169	Chicken Stuffed with Spinach and Feta	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken-Stuffed-with-Spinach-and-Feta-158169.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oven to 350°F. </li>\n<li>Heat 2 teaspoons of the oil in a large frying pan over medium heat until shimmering. </li>\n<li>Add onion and sauté until soft, about 8 to 10 minutes. </li>\n<li>Add spinach and sauté until wilted and water evaporates, about 2 minutes. </li>\n<li>Add nutmeg and season with salt and freshly ground black pepper. </li>\n<li>Remove mixture from the pan and transfer to a bowl to cool. Wipe out the pan and set aside.</li>\n<li>Cut each chicken breast in half horizontally.  Using a mallet or the bottom of a pan, pound chicken pieces to an even thickness, about 1/4 inch thick. Season all over with salt and freshly ground black pepper.Stir feta into cooled spinach mixture. Lay chicken breasts on a cutting board so the narrowest ends face you. </li>\n<li>Place 1/4 of the spinach mixture halfway up each chicken piece. Fold the bottom of the chicken up over the filling to enclose it, then roll into a tight cylinder. Use toothpicks or butcher’s twine to secure the rolls. Repeat with remaining chicken and filling.Return the frying pan to medium-high heat and add remaining 1 tablespoon olive oil. Once oil is shimmering, place chicken breasts in the pan and cook undisturbed until golden brown, about 4 to 6 minutes. Turn breasts over and transfer the pan to the oven. </li>\n<li>Bake until the filling is hot and the interior of the chicken rolls is white but still juicy, about 8 minutes.Variations: Stir in 1/4 cup of either pine nuts, currants, or a combination when adding the feta to the spinach mixture.Beverage pairing: Markus Huber Grüner Veltliner “Hugo,” Austria. A white with sharpness, a hint of bitterness, and some tang is called for, and this Grüner Veltliner fits the bill, echoing the spinach and feta while resonating with the chicken.</li>\n</ol>\n</div>
543214	Spinach Pancakes	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach-Pancakes-543214.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a blender, combine the spinach, buttermilk, egg, and oil and blend until smooth. In a separate bowl, whisk together the remaining ingredients.  </li>\n<li>Whisk the wet ingredients into the dry ingredients until just combined.  </li>\n<li>Heat a large pan or griddle over medium heat and grease with butter or oil. </li>\n<li>Pour about 1 tablespoon of the pancake mixture onto the griddle, making as many pancakes as will fit and cook for 2 minutes. Flip the pancakes and cook for one minute longer and serve.*</li>\n<li>Mixture can also be used in a waffle iron following manufacturers directions.</li>\n</ol>\n</div>
223755	Quick lamb biryani	\N	\N	\N	https://spoonacular.com/recipeImages/Quick-lamb-biryani-223755.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat a large pan, fry the curry paste untilfragrant, add the lamb, then brown on allsides. </li>\n<li>Pour in the rice and stock, then stir well. Bring to the boil, cover with a lid,then cook for 15 mins on a medium heatuntil the rice is tender.Stir through the spinach, put the lid back on the pan and leave to steam, undisturbed, for 5 mins before serving.</li>\n</ol>\n</div>
512190	Garlic Dijon Spinach With Pine Nuts from The Slim Palate Paleo Cookbook and an Interview with the Author and Giveaway	\N	\N	\N	https://spoonacular.com/recipeImages/Garlic-Dijon-Spinach-With-Pine-Nuts-from-The-Slim-Palate-Paleo-Cookbook-and-an-Interview-with-the-Author-and-Giveaway-512190.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small pan over medium heat, toast the pine nuts for about 4 minutes or until lightly browned and fragrant, shaking the pan often to prevent burning.  </li>\n<li>Pour onto a plate to cool.</li>\n<li>Heat the butter or ghee in a medium sized pan over medium heat.  </li>\n<li>Add the garlic and saute for about 30 seconds, then stir in the spinach.  Cook for 3-4 minutes stirring occasionally until completely wilted, then stir in the mustard and season with salt and pepper.</li>\n<li>Serve spinach garnished with toasted pine nuts.</li>\n</ol>\n</div>
584240	Panini with Prosciutto, Fontina, Spinach and Slow-Roasted Tomatoes	\N	\N	\N	https://spoonacular.com/recipeImages/Panini-with-Prosciutto--Fontina--Spinach-and-Slow-Roasted-Tomatoes-584240.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat your panini grill or grill pan according to the manufacturer’s directions. Assemble the sandwich: 1 slice of bread, prosciutto, fontina, spinach, slow-roasted tomatoes, and the other slice of bread. </li>\n<li>Brush one side with olive oil. </li>\n<li>Place sandwich on the grill, oiled side down, and brush more olive oil on the top. Close the grill top and grill for 2 to 3 minutes, until the cheese sizzles. </li>\n<li>Remove and allow to cool for a minute or two before cutting. (If using a grill pan, grill the sandwich oiled side down and brush more olive oil on top. Grill for 2 to 3 minutes, then flip and grill another 2 to 3 minutes. You can also use press the sandwich with the bottom of a cast iron skillet or a sandwich/bacon press.)</li>\n</ol>\n</div>
27230	Grilled Artichoke Sun-dried Tomato Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/grilled_artichoke_sun-dried_tomato_sandwich-27230.jpg	http://www.pipandebby.com/pip-ebby/2011/1/3/grilled-artichoke-sun-dried-tomato-sandwich.html
289432	Roasted Butternut Squash Salad With Tangerine-Rosemary Vinaigrette	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Butternut-Squash-Salad-With-Tangerine-Rosemary-Vinaigrette-289432.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 400 degrees F.Toss the squash with 2 tablespoons olive oil on a baking sheet and spread in an even layer. Season with 2 teaspoons rosemary, and salt and pepper. Roast, stirring once halfway through, until the squash is just tender and golden, about 20 minutes. </li>\n<li>Remove from the oven and cool until just warm, about 15 minutes.While the squash is roasting, peel 3 tangerines and slice them crosswise into 1/2-inch-thick rounds, removing any seeds. Juice the remaining tangerine and whisk the juice together with the remaining 2 tablespoons olive oil and remaining 1 teaspoon rosemary. Season the dressing with salt and pepper.</li>\n<li>Combine the warm squash, the spinach, tangerine slices and cranberries with the dressing and toss gently to coat. Divide among salad plates.Photograph by Kana Okada</li>\n</ol>\n</div>
166559	Mini Apple and Spinach Pizzas	\N	\N	\N	https://spoonacular.com/recipeImages/Mini-Apple-and-Spinach-Pizzas-166559.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat oven to 425°F. Line 2 cookie sheets with foil or cooking parchment paper.</li>\n<li>2</li>\n\n<li>Cut dough into 8 equal pieces; shape each piece into 3-inch round. </li>\n<li>Place on cookie sheets.</li>\n<li>3</li>\n\n<li>Spread each dough round with 1/2 teaspoon mustard. Layer evenly with spinach, apples and cheese. Sprinkle with salt and pepper.</li>\n<li>4</li>\n\n<li>Bake 8 to 10 minutes or until crust is golden brown, cheese is melted and spinach is hot. </li>\n<li>Drizzle pizzas with oil. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
19220	Mexican Spinach	\N	\N	\N	https://spoonacular.com/recipeImages/mexican-spinach-2-19220.jpg	http://theprimitivefoodie.blogspot.com/2011/05/mexican-spinach.html
322387	Potatoes Stuffed with Spinach and Smoked Cheese	\N	\N	\N	https://spoonacular.com/recipeImages/Potatoes-Stuffed-with-Spinach-and-Smoked-Cheese-322387.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 425 degrees F. Scrub the potatoes, pat them dry. Prick the potatoes a few times with a fork and bake them in the middle of oven for 45 minutes to 1 hour. While the potatoes are baking, in a heavy saucepan cook the spinach in the water clinging to the leaves, covered, over moderately high heat, stirring occasionally, for 3 minutes, or until it is wilted. </li>\n<li>Drain the spinach in a colander set over a bowl, reserving the cooking liquid, and chop it coarse. In a bowl, combine the spinach and the butter. While the potatoes are warm, halve them lengthwise, scoop them out, leaving the shells as thin as possible, and chop the scooped-out potato coarsely. </li>\n<li>Add the chopped potato to the bowl with the spinach, combining the mixture well. </li>\n<li>Add the lemon juice and stir in 1 cup of the cheese and 1 tablespoon of the reserved cooking liquid, or enough to reach a smooth consistency, Season the mixture with salt and pepper, divide it among the potato shells, and top it with the remaining 1/4 cup cheese. </li>\n<li>Bake the potatoes in a baking dish in the middle of a preheated 425 degree oven for 10 minutes, or until they are heated through.</li>\n</ol>\n</div>
609110	Spinach, Sun Dried Tomato, and Feta Omelets with Pesto	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach--Sun-Dried-Tomato--and-Feta-Omelets-with-Pesto-609110.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a medium, non-stick skillet, heat half of the spinach leaves over medium heat. </li>\n<li>Pour half of the scrambled eggs over the spinach leaves and allow them to set for about a minute.Spoon 1 tablespoon pesto sauce onto one side of the omelet. Top the same side with half of the sun dried tomatoes and half of the feta cheese.When the eggs are fully set, gently fold the other half of the omelet on top of the filling ingredients.Repeat steps 1 - 3 to make a second omelet.</li>\n</ol>\n</div>
19299	Artichoke-and-Spinach Tian	\N	\N	\N	https://spoonacular.com/recipeImages/artichoke-and-spinach_tian-19299.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat a large nonstick skillet over medium heat. </li>\n<li>Add the spinach in batches, turning frequently until wilted (about 7 minutes). </li>\n<li>Drain spinach (it should be neither wet nor dry, but moist). </li>\n<li>Combine spinach and garlic in a medium bowl.</li>\n<li>Combine water and lemon juice. Working with 1 artichoke at a time, cut off stem to within 1 inch of base; peel stem. </li>\n<li>Remove the bottom leaves and tough outer leaves, leaving the tender heart and bottom. </li>\n<li>Cut artichoke in half lengthwise. </li>\n<li>Remove fuzzy thistle from bottom with a spoon. Thinly slice artichoke heart; place in lemon water. Repeat procedure with remaining artichokes. </li>\n<li>Drain. (You should have about 4 cups sliced artichokes.) Sprinkle artichokes with salt and pepper.Preheat oven to 375°.Arrange 3 cups artichoke in an 11 x 7-inch baking dish coated with cooking spray. Sprinkle with 1/2 cup cheese. Repeat layers with artichoke and spinach.Cover and bake at 375° for 15 minutes. Uncover and bake 30 minutes. Sprinkle with 3/4 cup cheese. </li>\n<li>Bake an additional 10 minutes or until artichokes are tender.</li>\n</ol>\n</div>
617473	Cranberry Crunch Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Cranberry-Crunch-Salad-617473.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wash and dry your spinach and place into large bowl.</li>\n<li>Add craisins to spinach bowl.In a small pan heat olive oil and add almonds and sesame seeds and stir constantly until toasted and not burnt (about a min or so),let cool and  then place on top of spinach.In small bowl whisk together the rest of ingredients and pour on top of salad and toss gently.</li>\n</ol>\n</div>
601088	Red Pepper & Goat Cheese Panini	\N	\N	\N	https://spoonacular.com/recipeImages/Red-Pepper---Goat-Cheese-Panini-601088.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>If using fresh peppers, cut the bell peppers in half, and then cut each half into thirds (cutting the long way). Toss them with olive oil, salt and pepper, and grill them in a skillet or on the griddle, high heat, until soft and slightly charred.(Optional: spread the outsides of the bread with butter.) </li>\n<li>Spread two slices of bread with olive tapenade (3-4 tablespoons each) and two slices of bread with goat cheese (3-4 tablespoons each). Top the tapenade pieces with the roasted peppers and a handful of spinach. </li>\n<li>Place the goat cheese slices on top.Grill on a panini press, high heat, for about 10 minutes, checking periodically to make sure it doesn’t burn. You can also grill in a skillet or on a griddle. Flatten the sandwiches with a heavy frying pan while in the skillet to get the panini effect.</li>\n</ol>\n</div>
19486	Orecchiette With Spinach And Gorgonzola Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/orecchiette_with_spinach_and_gorgonzola_sauce-19486.jpg	http://cookieandkate.com/2011/orecchiette-with-spinach-and-gorgonzola-sauce/
478242	Spinach puree and coconut milk paste	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach-puree-and-coconut-milk-paste-478242.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Check the spinach for touch stalks. If there are any, remove them.Boil water in a large pot. </li>\n<li>Add the spinach and blanch for a minute or two or until wilted (see how to blanch). This is a large bunch of spinach so one minute in hot water should be considered a minimum.</li>\n<li>Drain the spinach, dump in a bowl of iced water or rinse under the tap. Squeeze to remove excess water (read detailed instructions).Roughly chop the spinach.</li>\n<li>Pour the coconut milk into the blender. </li>\n<li>Add the spinach. Process until smooth.</li>\n<li>Heat the cooking oil in a wok or shallow pan. Sweat the onion and garlic. Medium-low heat with occasional stirring until the onion bit are translucent.</li>\n<li>Pour in the spinach mixture. Season with salt and pepper.Cook over medium heat, uncovered, until the liquid has reduced. </li>\n<li>Pour in the coconut cream. Taste, adjust the seasonings if needed, and continue cooking until the mixture turns into a paste.Cool and keep in a covered container in the fridge. I used my puree within 24 hours. I’m not sure at this point how long it will stay good even with refrigeration.</li>\n</ol>\n</div>
248872	Spinach and Feta Quesadillas	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach-and-Feta-Quesadillas-248872.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix the spinach, herbs, green onions and feta in a bowl.Melt a touch of butter in a pan.</li>\n<li>Place a tortilla into the pan, swirl it around in the butter and repeat with the second tortilla.Sprinkle half of the cheese on the tortilla followed by the filling, the remaining cheese and finally the other tortilla.Cook until the quesadilla is golden brown on both sides and the cheese is melted, about 2-4 minutes per side. (Tip: To easily flip the quesadilla place a plate onto the quesadilla in the pan and flip it from the pan to the plate and then slide it back into the pan.)</li>\n</ol>\n</div>
568359	Ginisang Munggo at Chicharon (Mung Bean Soup with Pork Crackling)	\N	\N	\N	https://spoonacular.com/recipeImages/Ginisang-Munggo-at-Chicharon-(Mung-Bean-Soup-with-Pork-Crackling)-568359.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a pot, bring dried beans, water and 1 teaspoon salt to a boil. Skim off froth that accumulates and beans that float on top. Lower heat and cook, covered, for about 1 hour or until beans are softened and skins have burst.In another pot, heat oil over medium high heat. </li>\n<li>Saute garlic and onions until tender and aromatic. </li>\n<li>Add tomatoes and cook for another 2 minutes, stirring frequently and mushing tomatoes with back of spoon. </li>\n<li>Add in fish sauce and  to allow to cook for about 1 to 2 minutes.</li>\n<li>Pour in cooked mung bean including cooking liquid. Bring to a gentle boil. Stir in pork cracklings and continue to cook for about 5 minutes or until pork is softened. Season with additional salt to taste. </li>\n<li>Add in spinach, turn off heat and cover pot for about 2 to 3 minutes or until spinach are wilted. </li>\n<li>Serve hot.</li>\n</ol>\n</div>
101432	Braised Garlic Chicken and Spinach	\N	\N	\N	https://spoonacular.com/recipeImages/braised-garlic-chicken-and-spinach-2-101432.jpg	http://www.food.com/recipe/braised-garlic-chicken-and-spinach-376143
27706	Eggs Florentine Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/eggs-florentine-sandwich-2-27706.jpg	http://www.self.com/challenge/2011/nutrition/recipe/breakfasts/eggs-florentine-sandwich
617553	Bacon and Spinach Pasta with Parmesan	\N	\N	\N	https://spoonacular.com/recipeImages/Bacon-and-Spinach-Pasta-with-Parmesan-617553.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the bacon across the strips into one-inch sections. Saut the bacon in a large skillet until it is brown and crispy (no extra fat needed). Carefully pour the fat off into a bowl, leaving about one tablespoon in the skillet.While the bacon cooks, dice the onion. Once the bacon fat is drained from the skillet, add the diced onions and saut until they are soft and transparent. Allow the moisture from the onions to dissolve some of the browned bits off of the bottom of the skillet.</li>\n<li>Add two cups of chicken broth to the skillet and dissolve off any remaining browned bits of bacon drippings from the bottom of the skillet.Finally, add the pasta to the skillet, place a lid on top, and let the skillet come to a boil over high heat. Once it reaches a boil, turn the heat down to low and let simmer for 15 minutes. Give the skillet a quick stir to loosen the pasta from the bottom every five minutes or so, replacing the lid quickly each time. After 15 minutes the pasta should be tender and most of the broth absorbed. There should be a little bit of thick, saucy broth remaining in the bottom of the skillet.</li>\n<li>Add the fresh spinach to the skillet and stir until it has wilted into the pasta. Turn off the heat, sprinkle the Parmesan over top, stir to combine, and then serve.</li>\n</ol>\n</div>
101464	Italian Stuffed Chicken Breast	\N	\N	\N	https://spoonacular.com/recipeImages/italian-stuffed-chicken-breast-2-101464.jpg	http://www.food.com/recipe/italian-stuffed-chicken-breast-227310
19549	Domestic Diva's Grilled Organic Pork Tenderloin & Spinach Salad	\N	\N	\N	https://spoonacular.com/recipeImages/domestic_divas_grilled_organic_pork_tenderloin_spinach_salad-19549.jpg	http://www.domesticdivasblog.com/2009/05/domestic-divas-grilled-organic-pork.html
19582	Chicken with Creamy Spinach and Shallots	\N	\N	\N	https://spoonacular.com/recipeImages/chicken_with_creamy_spinach_and_shallots-19582.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oil in a large skillet over medium-high heat. Season the chicken with 1/2 teaspoon salt and 1/4 teaspoon pepper and cook until browned and cooked through, 8 to 10 minutes per side. </li>\n<li>Transfer to plates. Spoon off and discard all but 1 tablespoon of the fat and return the skillet to medium heat. </li>\n<li>Add the shallots and cook, stirring, until they begin to soften, 2 to 3 minutes. Stir in the wine and sour cream. </li>\n<li>Add the spinach, 1/4 teaspoon salt, and 1/4 teaspoon pepper. Cook, tossing gently, until the spinach begins to wilt, 1 to 2 minutes. </li>\n<li>Serve with the chicken.</li>\n</ol>\n</div>
19584	Sausage Sliders with Spinach and Peppers	\N	\N	\N	https://spoonacular.com/recipeImages/sausage_sliders_with_spinach_and_peppers-19584.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat broiler. </li>\n<li>Heat the oil in a large skillet over medium heat. </li>\n<li>Add the onion, 1/2 teaspoon salt, and 1/4 teaspoon pepper and cook, stirring occasionally, until the onion begins to soften, 5 to 6 minutes. </li>\n<li>Add the bell pepper and cook, stirring occasionally, until softened, 5 to 6 minutes. </li>\n<li>Add the spinach and cook, tossing, until the spinach is just wilted, 1 to 2 minutes. Meanwhile, remove the sausages from their casings and form into twelve 1/2-inch-thick patties. </li>\n<li>Place them on a broilerproof rimmed baking sheet and broil until cooked through, 4 to 5 minutes per side. Form sandwiches with the rolls, sausage patties, and vegetable mixture. great for guests These bite-size sandwiches make easy hors d'oeuvres. Cook the vegetables and form the patties up to a day in advance; broil the patties, reheat the vegetables, and assemble the sliders just before guests arrive.</li>\n</ol>\n</div>
576665	Peanut Lovers Green Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Peanut-Lovers-Green-Smoothie-576665.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients in a blender or magic bullet and blend until smooth!</li>\n</ol>\n</div>
19693	Spinach, Carrots And Black Olives Couscous	\N	\N	\N	https://spoonacular.com/recipeImages/spinach-carrots-and-black-olives-couscous-2-19693.jpg	http://saladpride.blogspot.com/2011/03/spinach-carrots-and-black-olives.html
216328	Mustard griddled chicken, beetroot & orange salad	\N	\N	\N	https://spoonacular.com/recipeImages/Mustard-griddled-chicken--beetroot---orange-salad-216328.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Put the chicken between 2 sheets ofparchment paper or cling film and bashwith a rolling pin to flatten. Grate thezest from ½ orange and mix in a bowlwith the mustard, 2 tsp oil and plenty ofseasoning. </li>\n<li>Add the chicken and stir well.</li>\n<li>Heat a griddle or frying pan and cookthe chicken for 5-6 mins on each sideuntil cooked through. </li>\n<li>Place on a plateto rest while you assemble the salad.Tip the salad leaves into a bowl. Peeland slice the oranges on a plate to catchany juices. </li>\n<li>Pour the orange juice over theleaves, add the slices with 1tsp oil andtoss together. </li>\n<li>Add the beetroot, thenslice the chicken and add to the saladalong with any resting juices. Divideeverything between plates and serve.</li>\n</ol>\n</div>
19729	Spinach, Asparagus, and Strawberry Salad	\N	\N	\N	https://spoonacular.com/recipeImages/spinach_asparagus_and_strawberry_salad-19729.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Pour 1 tablespoon olive oil into a 12- by 15-inch baking pan; add asparagus, sprinkle with 1/4 teaspoon salt, and mix to coat. </li>\n<li>Spread in a single layer and bake in a 400° oven, stirring often, until tender when pierced, 15 to 20 minutes. </li>\n<li>Let cool, about 15 minutes. Meanwhile, in a large bowl, mix vinegar and remaining 2 tablespoons oil. </li>\n<li>Add spinach, strawberries, toasted walnuts, and cooled asparagus; mix to coat. </li>\n<li>Add more salt and pepper to taste.</li>\n</ol>\n</div>
380187	Warm Bean and Chard Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Warm-Bean-and-Chard-Salad-380187.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a Dutch oven or a large saucepan, saute onion in oil until tender. </li>\n<li>Add tomato paste and honey; cook for 1 minute. </li>\n<li>Add the beans and water; bring to a boil.</li>\n\n<li>Add chard, salt and pepper; return to a boil. Reduce heat; cover and simmer for 15-25 minutes or until the greens are wilted. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
265576	Grilled Portobello Mushroom Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-Portobello-Mushroom-Sandwich-265576.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>POUR 1/4 cup dressing over mushrooms in shallow dish.  Refrigerate 1 hour to marinate. HEAT grill to medium-high heat.  </li>\n<li>Remove mushrooms from marinade; discard marinade. Grill mushrooms 5 min. on each side or until tender. PLACE spinach and tomatoes on bottom halves of rolls; drizzle with remaining dressing.  Cover with mushrooms and tops of rolls.</li>\n</ol>\n</div>
19830	Parmesan-Bacon Spinach Salad	\N	\N	\N	https://spoonacular.com/recipeImages/parmesan-bacon-spinach-salad-2-19830.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>COOK bacon in small saucepan until crisp.  </li>\n<li>Remove bacon from saucepan, reserving 1 Tbsp. drippings in pan.  </li>\n<li>Drain bacon on paper towels.  Stir dressing into reserved drippings. TOSS spinach with bacon and tomatoes in large bowl. ADD dressing mixture and cheese; mix lightly.</li>\n</ol>\n</div>
175502	Tortellini and Bean Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Tortellini-and-Bean-Soup-175502.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In large saucepan, combine water, bouillon and tomatoes. Bring to a boil over medium-high heat.</li>\n<li>2</li>\n\n<li>Add spinach, beans and tortellini; return to a boil. Reduce heat; boil gently 5 minutes or until tortellini is tender and soup is thoroughly heated, stirring occasionally.</li>\n</ol>\n</div>
19883	Chorizo And Spinach Scramble	\N	\N	\N	https://spoonacular.com/recipeImages/chorizo-and-spinach-scramble-2-19883.jpg	http://www.williams-sonoma.com/recipe/chorizo-and-spinach-scramble.html
306613	Spinach Salad with Sweet Roasted Pecans and Gorgonzola with Sherry Shallot Vinaigrette	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach-Salad-with-Sweet-Roasted-Pecans-and-Gorgonzola-with-Sherry-Shallot-Vinaigrette-306613.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 400 degrees F.</li>\n<li>Place spinach in serving bowl.Toss pecans with vegetable oil, sugar and salt. Lay out on baking sheet. Roast until shade darker and aromatic, about 7 to 8 minutes. Set aside.Make dressing by combining olive oil, vinegar, shallots and salt and pepper in a bowl and whisking together or place in sealable container and shake.Toss spinach with dressing, Gorgonzola and pecans.</li>\n</ol>\n</div>
19896	Portobellos With Leeks And Spinach	\N	\N	\N	https://spoonacular.com/recipeImages/portobellos-with-leeks-and-spinach-2-19896.jpg	http://www.marthastewart.com/318902/portobellos-with-leeks-and-spinach
527829	White Bean, Spinach & Pesto Soup	\N	\N	\N	https://spoonacular.com/recipeImages/White-Bean--Spinach---Pesto-Soup-527829.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add chicken stock and white beans to a medium-sized saucepan, and bring to a boil over medium-high heat. Then reduce heat to low, and stir in the fresh spinach and pesto until the spinach has wilted. Season to taste with salt and pepper.Then ladle soup into bowls, and top generously with freshly-grated Parmesan cheese.</li>\n</ol>\n</div>
757327	Spinach and Sun-Dried Tomato Pie	\N	\N	\N	https://spoonacular.com/recipeImages/spinach-and-sun-dried-tomato-pie-757327.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1  Preheat oven to 350°F. Coat 9-inch round cake pan or springform pan with cooking spray.2 </li>\n<li>Heat 1 Tbs. reserved sun-dried-tomato oil in large non-stick skillet over medium heat. </li>\n<li>Add onion, and sauté 15 to 20 minutes, or until browned.3 Meanwhile, place tofu, spinach, and sun-dried tomatoes in large bowl. Rub together with hands until no large lumps of tofu remain. Stir tofu mixture into onion mixture, and cook 5 minutes. </li>\n<li>Remove from heat, season with salt and pepper, if desired, and cool.4 </li>\n<li>Place 1 sheet phyllo on work surface, and dab and brush with reserved sun-dried tomato oil. Top with second sheet phyllo. Repeat with 4 more phyllo sheets, brushing top of stack with oil as well. Line prepared cake pan with phyllo stack, letting edges drape over.5 Make second phyllo stack using reserved oil and 5 more phyllo sheets. Set in prepared cake pan perpendicular to first stack so pan is completely lined with phyllo crust.6 Fill crust with spinach filling, pressing down. Fold excess phyllo edges over center.7 Make third phyllo stack using 5 phyllo sheets and reserved sun-dried-tomato oil. </li>\n<li>Place over spinach filling, tucking in edges to seal pie.8 </li>\n<li>Bake 30 to 40 minutes, or until crust is golden brown. Cool 10 minutes, then unmold pie, and slice into wedges.</li>\n</ol>\n</div>
609905	Heirloom Tomato Pesto Panini	\N	\N	\N	https://spoonacular.com/recipeImages/Heirloom-Tomato-Pesto-Panini-609905.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat your panini press to medium-high.You'll use 2 tablespoons of pesto per sandwich, so spread that amount on 2 slices of bread and set aside.</li>\n<li>Cut tomatoes into ¼" thick slices and layer them on top of the pesto-covered slices of bread.Crumble and sprinkle about 1 tablespoon of goat cheese over the tomato'd, pesto'd slices.Layer spinach over the goat cheese and top with another slice of bread.Spray your panini press with olive oil and gently place sandwiches into the panini press.Cook for 8-10 minutes, or until the bread is crispy and browned. Every sandwich press will vary!Slice diagonally, or in half, or into quarters and enjoy!Don't have a panini press? A waffle maker will get the job done! Just spray with olive oil and cook until crisp and golden-brown. No waffle maker? Use a skillet! </li>\n<li>Heat about 1 tablespoon of olive oil over medium and toast both sides of the sandwich.</li>\n</ol>\n</div>
609970	Cheesey Broccoli and Spinach Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Cheesey-Broccoli-and-Spinach-Soup-609970.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oil in a large pan over medium heat and add the garlic and onion and saute for a few minutes until the onion is soft. </li>\n<li>Add the broccoli and spinach and cook gently for a few minutes. </li>\n<li>Add the stock, bring to the boil, then lower the heat to a gentle simmer and cover. Cook for 10 minutes, or until the broccoli is just tender. </li>\n<li>Pour the soup into a blender (in batches) and puree until smooth.5 Season and serve. Top with grated cheddar (optional)  Enjoy!</li>\n</ol>\n</div>
364310	Ketchikan Stuffed Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/Ketchikan-Stuffed-Mushrooms-364310.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat a small amount of canola oil in a saute pan over medium-high heat. </li>\n<li>Add the sausage meat and brown. </li>\n<li>Drain off any excess fat and add spinach. Cook together until flavors integrate and spinach softens, 3 to 5 minutes. </li>\n<li>Remove from heat and let cool.Preheat oven to 400 degrees F. Season mushroom caps with salt and pepper and toss with canola oil. Stuff mushroom caps with sausage/spinach mixture and sprinkle with Parmesan. Brown in oven and serve.</li>\n</ol>\n</div>
593797	Easy Stuffed Mushrooms with Cream Cheese and Spinach	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Stuffed-Mushrooms-with-Cream-Cheese-and-Spinach-593797.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350 degrees F.Pop out the stem of the mushroom, leaving the cap. Reserve stems for another use or discard.</li>\n<li>Brush off any dirt on the mushrooms with a damp paper towel.</li>\n<li>Mix cream cheese, Parmesan cheese, salt and chopped spinach in a bowl.Fill the opening in each mushroom with the cream cheese mixture.Lightly sprinkle Panko breadcrumbs on top of the cream cheese mixture.</li>\n<li>Place mushrooms on a baking sheet coated with cooking spray.</li>\n<li>Bake for about 15 minutes. Juices will begin to pool at the bottom of the mushrooms and the top will begin to lightly brown.</li>\n<li>Remove from oven and serve hot.</li>\n</ol>\n</div>
626595	Pancetta and Spinach Pinwheels	\N	\N	\N	https://spoonacular.com/recipeImages/Pancetta-and-Spinach-Pinwheels-626595.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 400 degrees F.Lay puff pastry out on a flat surface. </li>\n<li>Brush the top with egg wash and then lay pancetta on top. Then add the spinach and cream cheese. Starting at one end roll up the puff pastry. Slice into the dough creating 1/2 inch slices.</li>\n<li>Place slices onto a non-stick baking sheet and top each one with egg wash. </li>\n<li>Bake in the oven for 17-20 minutes or until golden brown.</li>\n</ol>\n</div>
577563	Spinach and Homemade WW Pasta with Garlic Butter Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach-and-Homemade-WW-Pasta-with-Garlic-Butter-Sauce-577563.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine whole wheat flour and salt on a clean surface. Make a well, add egg and water. Using a fork, whisk egg and slowly begin to incorporate flour.Continue to incorporate flour and a paste will soon form. Continue to mix (eventually ditching the fork for your hands) and knead dough into a smooth ball.</li>\n<li>Let sit for 20-30 minutes.</li>\n<li>Roll out dough to as thin as you can still handle. Using a knife or a pizza cutter (classy, I know), cut strips of pasta. You can also use a pasta roller/maker (which makes this easier.)Bring a pot of water to a boil. Toss pasta in and let cook for 3-4 minutes, pasta should rise to the top.Melt butter in sauce pan. </li>\n<li>Add in garlic and rosemary, cooking until garlic is fragrant. Toss with freshly cooked pasta and spinach. </li>\n<li>Let cook for a minute or two until spinach just begins to wilt. </li>\n<li>Serve with a bit of grated parmesan cheese.</li>\n</ol>\n</div>
28795	Cheesy Baked Pasta With Spinach And Artichokes Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/cheesy_baked_pasta_with_spinach_and_artichokes_recipe-28795.jpg	http://www.realsimple.com/food-recipes/browse-all-recipes/cheesy-baked-pasta-spinach-artichoke-00000000031335/index.html
553104	Grilled cheese and spinach sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-cheese-and-spinach-sandwich-553104.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat a large skillet over medium heat.Divide the olive oil over the outside of each slice of bread. </li>\n<li>Spread the pesto sauce over the inside of four slices of bread and the tabasco among the other four slices. </li>\n<li>Place one slice on the provolone cheese on four slices of bread followed by the spinach. </li>\n<li>Place the other cheese slice on top of the spinach and top with the other slice of bread.</li>\n<li>Add the sandwiches to the pan and grill until golden brown and the cheese has melted, about 2-4 minutes on each side. </li>\n<li>Serve them while still warm.</li>\n</ol>\n</div>
487712	Caramelized Onion, Goat Cheese, and Spinach Flatbread {Pizza}	\N	\N	\N	https://spoonacular.com/recipeImages/Caramelized-Onion--Goat-Cheese--and-Spinach-Flatbread-{Pizza}-487712.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven (and pizza stone if using) to 500ºF. If you are not using a pizza stone, grease a large baking sheet and set aside.</li>\n<li>Place sliced onions in a medium skillet on medium heat. Cover and let cook, stirring occasionally, until the onions are dry but not yet sticking to the pan, about 20 minutes. </li>\n<li>Add olive oil, then cover and reduce heat to low. Continue to cook, stirring infrequently, until onions turn a deep caramel brown, at least 20 minutes and up to 40 minutes more. Stir in balsamic vinegar, salt, and pepper. Turn off heat and add spinach, stirring gently until it begins to wilt. After dough has initially risen (through Step 4 if using 100% Whole Wheat Pizza Dough), place on a lightly floured surface and knead a few times. Shape into a ball, cover with a little flour, then let rest 20 minutes. </li>\n<li>Roll dough into a 12 in. circle (perfection is not a necessity here). Take your time. If the dough retreats (shrinks back to a smaller circle), just let it rest for a minute and then continue.Carefully place dough on preheated pizza stone or prepared baking sheet. Poke holes all over the surface to allow air to escape. Lightly brush or drizzle with olive oil. </li>\n<li>Bake for 6 minutes, then remove from oven. Top with caramelized onion mixture and dried basil. Crumble goat cheese over top. </li>\n<li>Bake an additional 5-6 minutes, until the crust is golden and the goat cheese has begun to brown. </li>\n<li>Remove pizza from stone or baking sheet. Slice and serve immediately.</li>\n</ol>\n</div>
553297	Whole Wheat Penne with Pesto and Spinach	\N	\N	\N	https://spoonacular.com/recipeImages/Whole-Wheat-Penne-with-Pesto-and-Spinach-553297.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook pasta to aldente stage, about 8-10 minutes. </li>\n<li>Transfer to a big bowl and add the other ingredients except spinach.</li>\n<li>Let the pasta cool for a couple of minutes before adding the spinach so it doesn't wilt too much. If you are using frozen peas cook them before adding to the pasta. </li>\n<li>Serve. It is that easy!!</li>\n</ol>\n</div>
471420	Mediterranean Stuffed Swordfish	\N	\N	\N	https://spoonacular.com/recipeImages/Mediterranean-Stuffed-Swordfish-471420.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat an outdoor grill for high heat, and lightly oil grate.</li>\n\n<li>Cut a slit in steak to create a pocket that is open on one side only. In a cup, mix together 1 tablespoon olive oil and lemon juice; brush over both sides of fish. Set aside.</li>\n<li>In a small skillet, heat 1 teaspoon olive oil and garlic over medium heat. Cook spinach in oil until wilted. </li>\n<li>Remove from heat, and stuff into pocket. </li>\n<li>Place feta in pocket over spinach.</li>\n<li>Arrange fish on grill, and cook for 8 minutes. Turn over, and continue cooking until cooked through.</li>\n<li>Kitchen-Friendly View</li>\n</ol>\n</div>
176512	Spinach and Cabbage Slaw	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach-and-Cabbage-Slaw-176512.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In large bowl, toss all salad ingredients. Refrigerate at least 15 minutes to blend flavors.</li>\n</ol>\n</div>
78273	Spinach-and-Cheese Omelet	\N	\N	\N	https://spoonacular.com/recipeImages/spinach-and-cheese_omelet-78273.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Blend and </li>\n<li>Pour. Process eggs and 2 Tbsp. water in a blender until blended. Melt butter in an 8-inch nonstick skillet over medium heat; add spinach and tomatoes, and saut´´ 1 minute or until spinach is wilted. </li>\n<li>Add salt and egg mixture to skillet. Lift and Tilt. As egg mixture starts to cook, gently lift edges of omelet with a spatula, and tilt pan so uncooked egg mixture flows underneath, cooking until almost set (about 1 minute). Cover skillet, and cook 1 minute. Fold and </li>\n<li>Serve. Sprinkle omelet with cheese and pepper. Fold omelet in half, allowing cheese to melt. Slide cooked omelet onto a serving plate, and season with salt to taste. </li>\n<li>Serve with buttered toast and fresh fruit.</li>\n</ol>\n</div>
78355	Family-style Rolled Omelet With Spinach And Cheddar	\N	\N	\N	https://spoonacular.com/recipeImages/family-style-rolled-omelet-with-spinach-and-cheddar-2-78355.jpg	http://www.marthastewart.com/335400/family-style-rolled-omelet-with-spinach
668224	Paleo Cauliflower and Spinach Breakfast Bread	\N	\N	\N	https://spoonacular.com/recipeImages/Paleo-Cauliflower-and-Spinach-Breakfast-Bread-668224.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a food processor, chop the cauliflower until it resembles breadcrumbs.In a skillet, melt coconut oil and heat the cauliflower, garlic and onion until it browns slightly, 10 mins.Beat eggs in a bowl and add cauliflower mix and the remaining ingredients. Stir.</li>\n<li>Place parchment paper on a baking tray and spoon mixture into rounds onto the tray. Use a cookie cutter for a perfectly round shape.</li>\n<li>Bake at 350F for 15 minutes until browned.</li>\n</ol>\n</div>
275055	Spinach and Orange Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach-and-Orange-Salad-275055.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>COMBINE first 4 ingredients in large bowl. ADD dressing just before serving; toss to coat.</li>\n</ol>\n</div>
266886	Sauteed Spinach with Carrots, Raisins and Almonds	\N	\N	\N	https://spoonacular.com/recipeImages/Sauteed-Spinach-with-Carrots--Raisins-and-Almonds-266886.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>BRING dressing and raisins to boil in large saucepan. ADD spinach; cover.  Cook on medium heat 1 min.   </li>\n<li>Add carrots.  Turn spinach with tongs so unwilted spinach is on bottom of pan; cook, covered, 1 min. or just until all spinach is wilted. SPOON into bowl; top with nuts.</li>\n</ol>\n</div>
78584	Spinach And Dill Omelet	\N	\N	\N	https://spoonacular.com/recipeImages/spinach_and_dill_omelet-78584.jpg	http://www.thesweetbeet.com/spinach-and-dill-omelet/
512812	Bacon Wrapped Maple Chicken Thighs and #SpicePanda Giveaway	\N	\N	\N	https://spoonacular.com/recipeImages/Bacon-Wrapped-Maple-Chicken-Thighs-and--SpicePanda-Giveaway-512812.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the chicken in a gallon size freezer bag. In a bowl or measuring cup combine the maple syrup and Vermont Maple Spice Blend, mix well with a fork. </li>\n<li>Pour the mixture over the chicken, seal the bag closed and refrigerate for at least 3 hours, turning occasionally.Preheat oven to 375 degrees F. Spray a large glass baking dish with cooking spray. </li>\n<li>Remove the chicken from the marinade, but do not discard the marinade. Wrap two pieces of bacon around each piece of chicken and place in the baking dish. </li>\n<li>Pour the marinade over the chicken. </li>\n<li>Bake in the preheated oven for 45-50 minutes, basting the chicken with the marinade every 15 minutes or so.</li>\n<li>Place one cup of freshly washed and dried torn spinach on each of four dinner plates. As soon as the chicken is done, place one piece of chicken on each plate and spoon a little of the marinade over the top. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
521029	Lemony spinach and mushrooms with toasted garlic bits	\N	\N	\N	https://spoonacular.com/recipeImages/Lemony-spinach-and-mushrooms-with-toasted-garlic-bits-521029.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>If you’re serving this as a side dish, you can use the excess oil in which fish or chicken or meat has been cooked. Trust me, the browned bits left at the bottom of the pan will flavor your spinach dish very, very well.If you’re serving it as a main dish, start with a couple of tablespoonfuls of olive oil. Or, if you don’t mind the extra fat, a mixture of olive oil and butter.</li>\n<li>Heat the oil and add the sliced onion. Cook gently until softened. </li>\n<li>Add the mushrooms. Cook, stirring, for about a minute.</li>\n<li>Add the spinach. Season with salt and pepper.Stir around just until everything is heated through. Turn off the heat. </li>\n<li>Pour the lemon juice over the cooked dish.</li>\n<li>Transfer to a serving bowl and sprinkle with toasted garlic bits.We had this with tilapia last night and dinner was so, so very delicious.</li>\n</ol>\n</div>
95073	Chez Panisse Spinach Soup	\N	\N	\N	https://spoonacular.com/recipeImages/chez-panisse-spinach-soup-2-95073.jpg	http://www.food.com/recipe/chez-panisse-spinach-soup-266826
619685	Turkey Cranberry Flatbread #SundaySupper	\N	\N	\N	https://spoonacular.com/recipeImages/Turkey-Cranberry-Flatbread--SundaySupper-619685.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Open the flat bread and on the bottom part of the sandwich, spread the garlic and herb cheese. </li>\n<li>Place spinach over top of the cheese, then turkey and top turkey with cranberry sauce. Close the the sandwich and enjoy.</li>\n</ol>\n</div>
521394	Pasta with sausage and spinach	\N	\N	\N	https://spoonacular.com/recipeImages/Pasta-with-sausage-and-spinach-521394.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Squeeze the spinach to remove as much water as you can.Chop the spinach, coarsely or finely, that’s up to you. Then, place between stacks of paper towels (or two kitchen towels) and press to remove more water.Roughly chop the sausage meat.</li>\n<li>Heat the olive oil in a pan. </li>\n<li>Add the sausage meat and cook until lightly browned.</li>\n<li>Add the garlic and cook for another 30 seconds.</li>\n<li>Add the spinach to the sausage meat. Toss.</li>\n<li>Add the cooked pasta. Toss to coat the noodles with oil and to distribute the greens and meat evenly. Taste, season with salt and pepper, as needed. Cook just until the pasta is heated through.Top with shredded cheese before serving.</li>\n</ol>\n</div>
627928	Chinese Spinach Soup With Wolfberries And Garlic	\N	\N	\N	https://spoonacular.com/recipeImages/Chinese-Spinach-Soup-With-Wolfberries-And-Garlic-627928.jpg	http://messywitchen.com/recipe/vegetable/chinese-spinach-soup-with-wolfberries-and-garlic/
619744	Open Faced Fried Egg and Spinach Sandwich	\N	\N	\N	https://spoonacular.com/recipeImages/Open-Faced-Fried-Egg-and-Spinach-Sandwich-619744.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Prepare the spinach pancake according to package directions.While the pancake is cooking, heat a small frying pan to medium heat. Melt 1 teaspoon of butter in pan and fry egg to desired degree of doneness.Layer tomato, cheese, ham and fried egg on warm pancake. Season to taste with salt and pepper.</li>\n</ol>\n</div>
267539	Spinach and Mushroom Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach-and-Mushroom-Salad-267539.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>TOSS spinach leaves with mushrooms and onions in large salad bowl; set aside. MIX dressing and walnuts in microwavable measuring cup.  Microwave on HIGH 30 seconds or until warmed; stir. POUR over spinach mixture; toss to coat.  </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
529745	Sundried Tomato, Spinach & Egg Grilled Parmesan (GF Option)	\N	\N	\N	https://spoonacular.com/recipeImages/Sundried-Tomato--Spinach---Egg-Grilled-Parmesan-(GF-Option)-529745.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat a small non-stick pan at medium heat and spray with cooking spray.Cook the egg to desired doneness, I like mine medium, still a tad runny yolk.While the egg is cooking, chop the sundried tomatoes and spread with a little of the olive oil from the jar over one slice of bread, then top with the cooked egg.Top the egg with the parmesan cheese while it is still hot, and then top the cheese with the spinach.</li>\n<li>Place the other slice of bread on top to make a sandwich and place the sandwich in the hot pan.Grill on each side for 1-2 minutes or until browned.Enjoy!</li>\n</ol>\n</div>
562597	Mediterranean Raw Wrap With Red Pepper and Bean Free Hummus	\N	\N	\N	https://spoonacular.com/recipeImages/Mediterranean-Raw-Wrap-With-Red-Pepper-and-Bean-Free-Hummus-562597.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the leaves away from the thick center stem of each collard leaf to make a total of four flat pieces.Top each collard section with spinach leaves.Spoon Red Pepper Hummus across the bottom edge of the shorter width of each leaf. Top with avocado, zucchini, and black olives.</li>\n<li>Roll up into a wrap and serve.</li>\n</ol>\n</div>
489029	White Beans and Shrimp	\N	\N	\N	https://spoonacular.com/recipeImages/White-Beans-and-Shrimp-489029.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large pan, mince garlic and saute in evoo for 30 seconds</li>\n\n<li>Add spinach to garlic and cook until wilted</li>\n\n<li>Add cooked shrimp, white beans and chicken stock to spinach mixture</li>\n<li>Stir until all ingredients are mixed well and heated through</li>\n\n<li>Serve in bowls with crusty bread for dipping</li>\n</ol>\n</div>
489033	White Bean Stew With Pasta	\N	\N	\N	https://spoonacular.com/recipeImages/White-Bean-Stew-With-Pasta-489033.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large saucepan bring the beans, tomatoes and water to boiling.</li>\n<li>Add pasta and simmer, uncovered according to pasta package directions, stirring frequently.</li>\n<li>Remove from heat.</li>\n<li>Add fresh spinach, vinegar, salt and pepper to taste.</li>\n<li>Serve topped with cheese if you wish.</li>\n</ol>\n</div>
530108	Tomatoes Stuffed with Spinach, Eggs and Feta	\N	\N	\N	https://spoonacular.com/recipeImages/Tomatoes-Stuffed-with-Spinach--Eggs-and-Feta-530108.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 425 degrees.</li>\n<li>Remove the tops of the tomatoes and run a paring knife around the inside edge of the tomato. Scoop out the inside and be sure to scoop out the seeds. Sprinkle the inside with salt and pepper and turn the tomatoes upside down on a paper towel to dry.Preheat nonstick skillet over medium heat and spray with cooking spray. </li>\n<li>Add spinach and saute 3 - 4 minutes until wilted. Stand the tomatoes right side up in a pan, and place 1/4 cup spinach into the bottom of each tomato. Press spinach into tomato to make as much room as possible for the egg and feta cheese.Break an egg inside each tomato shell. Sprinkle with salt and pepper and feta cheese. </li>\n<li>Place in the oven and bake for 20 to 25 minutes, until egg is just set.</li>\n</ol>\n</div>
661259	Spinach and Gorgonzola Stuffed Flank Steak	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach-and-Gorgonzola-Stuffed-Flank-Steak-661259.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to Butterfly the steak by using a long sharp knife holding it parallel to the work surface, cut through the long side of the steak, stopping about  inch from the opposite side. If the steak is already thin, just pound it with a mallet to  inch thick.In a large skillet over medium heat add 1 tablespoon olive oil and saut` the shallots until soft, 2 minutes. </li>\n<li>Add the spinach and cook until just wilted, about 2 to 3 minutes. </li>\n<li>Transfer to a colander.When cool enough to handle, squeeze out all the moisture from the spinach and transfer to a medium bowl. Stir in the bread crumbs and cheese. Season with salt and pepper.</li>\n<li>Place the steak on a sheet of plastic wrap. Smear the spinach mixture evenly over the steak, leaving about 1 inch border along the side edge. Beginning with the side near you and using the plastic wrap as an aid, rollup the steak, gently pressing on the filling.Tie the rolled steak with twine at 2-3 inch interval.Season the outside with salt and pepper.</li>\n<li>Heat the remaining 2 tablespoons olive oil in a large ovenproof skillet over medium high heat. Sear the roast on all sided, about 2 minutes per side.</li>\n<li>Place in the oven and roast for 20 to 25 minutes.</li>\n<li>Transfer to a cutting board, tend with aluminum foil and allow resting for 10 minutes.To serve, remove the twine from the roast and cut into  inch to 1 inch thick slices.</li>\n</ol>\n</div>
587539	Sweet Potato, Spinach, and Bacon Breakfast Hash	\N	\N	\N	https://spoonacular.com/recipeImages/Sweet-Potato--Spinach--and-Bacon-Breakfast-Hash-587539.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add bacon to a skillet greased with coconut oil over medium heat.After the bacon has cooked for a minute or two, add softened sweet potato, spinach, onion, salt, and pepper mixing frequently.When the bacon is almost cooked through, add your eggs and cook to your preference (Your preference should be runny yolk or you’re weird. Just kidding. But not really).Eat! Thank me later.</li>\n</ol>\n</div>
423876	Lean Green Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Lean-Green-Smoothie-423876.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a blender, combine all ingredients; cover and process for 30 seconds or until smooth. </li>\n<li>Pour into chilled glasses; serve immediately.</li>\n</ol>\n</div>
14335	Warm Dandelion Greens With Roasted Garlic Dressing	\N	\N	\N	https://spoonacular.com/recipeImages/warm_dandelion_greens_with_roasted_garlic_dressing-14335.jpg	http://www.eatingwell.com/recipes/warm_dandelion_greens_with_roasted_garlic_dressing.html
227365	Scrambled Eggs With Smoked Salmon, Spinach, and Chives	\N	\N	\N	https://spoonacular.com/recipeImages/Scrambled-Eggs-With-Smoked-Salmon--Spinach--and-Chives-227365.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oil in medium nonstick skillet over medium heat. </li>\n<li>Combine eggs and pepper in medium bowl; stir well with whisk. </li>\n<li>Pour egg mixture into skillet; cook 30 seconds or until mixture begins to thicken, stirring slowly with wooden spoon. Stir in salmon and cream cheese; cook 30 seconds, smashing cream cheese lumps with spoon. Stir in spinach; cook 2 minutes or until spinach wilts and eggs are cooked, stirring constantly. Top each muffin half with 1/2 cup egg mixture. </li>\n<li>Garnish with chives, if desired.Note: Nutritional analysis includes Sugars 3g.</li>\n</ol>\n</div>
202812	Bruce Aidells' Spinach and Gorgonzola-Stuffed Flank Steak	\N	\N	\N	https://spoonacular.com/recipeImages/Bruce-Aidells-Spinach-and-Gorgonzola-Stuffed-Flank-Steak-202812.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Preheat the oven to 375°F.</li>\n<li>2</li>\n<li>To butterfly the steak: Using a long sharp knife, holding it parallel to the work surface, cut through one long side of the steak, stopping about 1/2 inch from the opposite side. Open up the steak as you would a book. (Don’t worry if you made a hole or two in the meat, because it will be concealed when you roll up the steak.) Or, if the steak is already thin, don’t butterfly it; just pound it with a meat mallet to 1/4 to 1/2 inch thick. Set aside.</li>\n<li>3</li>\n\n<li>Heat a large skillet over medium heat and add 1 tablespoon of the olive oil. </li>\n<li>Add the shallot and sauté until soft, about 3 minutes. </li>\n<li>Add the spinach and cook until just wilted, about 3 minutes. </li>\n<li>Transfer to a strainer.</li>\n<li>4</li>\n<li>When it is cool enough to handle, squeeze out all of the moisture from the spinach. You should have about 1 cup of spinach. </li>\n<li>Transfer to a medium bowl and stir in the bread crumbs and cheese. Season to taste with salt and pepper.</li>\n<li>5</li>\n\n<li>Place the steak on a sheet of plastic wrap with a long side of the steak facing you. Smear the spinach mixture evenly over the steak, leaving a 1-inch border along the edge farthest from you. Beginning with the side nearest you and using the plastic wrap as an aid, roll up the steak, gently pressing on the filling, then tie the rolled steak with butcher’s twine at 2- to 3-inch intervals. Season the outside with salt and pepper to taste.</li>\n<li>6</li>\n\n<li>Heat the remaining 2 tablespoons olive oil in a large roasting pan or ovenproof skillet over medium-high heat. Sear the roast on all sides, about 3 minutes per side. </li>\n<li>Place in the oven and roast for 25 minutes, or until an instant-read thermometer inserted into the center of the roast reads 120°F to 125°F for medium-rare. </li>\n<li>Transfer to a cutting board, tent with aluminum foil, and allow to rest for 10 to 15 minutes.</li>\n<li>7</li>\n<li>To serve, remove the string from the steak and cut into 1/2- to 3/4-inch-thick slices.</li>\n</ol>\n</div>
219209	Easy Italian Wedding Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Italian-Wedding-Soup-219209.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring broth and one cup water to a boil in a large saucepan; add pasta and meatballs. Return to a boil; cook 7 to 9 minutes or until pasta is done. Do not drain.Reduce heat; stir in spinach and pizza sauce. Cook 1 to 2 minutes or until thoroughly heated.</li>\n</ol>\n</div>
301215	Iron-Man Frittata	\N	\N	\N	https://spoonacular.com/recipeImages/Iron-Man-Frittata-301215.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 400°F. In a large ovenproof, nonstick skillet, cook bacon over medium-high heat, stirring often, until crisp, about 10 minutes. </li>\n<li>Drain on paper towels.</li>\n<li>Pour off fat from skillet. </li>\n<li>Spread spinach in bottom of skillet.In a large bowl, combine eggs, milk and cheese; season with salt and pepper. Blend well and pour over spinach. Scatter bacon over mixture. Cook over medium heat, lifting sides of frittata with a spatula to let uncooked egg flow underneath, until lightly browned around edges, about 5 minutes.</li>\n<li>Transfer skillet to oven and bake, uncovered, until puffed and lightly browned on top, about 10 minutes. Gently shake pan to loosen. </li>\n<li>Cut frittata into wedges and serve with a salad and some bread.</li>\n</ol>\n</div>
497879	Korean Spinach Banchan (Sigeumchi Namul)	\N	\N	\N	https://spoonacular.com/recipeImages/Korean-Spinach-Banchan-(Sigeumchi-Namul)-497879.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix minced garlic, green onion, soy sauce and sesame oil in a large bowl.In a medium pot of boiling water, add 1 teaspoon of salt and blanch a bunch of spinach for 30 seconds. </li>\n<li>Drain the cooked spinach and rinse it in cold water 3 times, and squeeze it gently to get the water out.</li>\n<li>Cut the spinach a few times and place the spinach into the sauce bowl and mix by hand.</li>\n<li>Transfer the spinach onto a serving plate and sprinkle toasted sesame seeds.</li>\n</ol>\n</div>
31003	A Quick And Easy Soup {miso Soup With Soba Noodles Or Mung Bean	\N	\N	\N	https://spoonacular.com/recipeImages/a_quick_and_easy_soup_{miso_soup_with_soba_noodles_or_mung_bean-31003.jpg	http://jeanetteshealthyliving.com/2011/02/quick-and-easy-soup-miso-soup-with-soba.html
579984	Cheesy Grits and Eggs: Southern Comfort at Breakfast	\N	\N	\N	https://spoonacular.com/recipeImages/Cheesy-Grits-and-Eggs--Southern-Comfort-at-Breakfast-579984.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a medium saucepan over high heat, bring the water and salt to a boil. Gradually stir in the grits to prevent clumping. Once they are incorporated, reduce the heat to medium-low and simmer. Continue cooking until the grits are thick, stirring frequently about 20 minutes. While the grits are cooking, melt the butter over medium-high heat in a medium sauté pan. </li>\n<li>Add the spinach and cook until wilted. </li>\n<li>Remove from heat and set aside. Stir in the cheese 1/4 cup at a time, stirring until melted after each addition. </li>\n<li>Add the spinach and butter. Poach the eggs in a low saucepan of boiling water. Spoon the grits onto four plates. Top each with a poached egg. </li>\n</ol>\n</div>
506269	The French Onion Eggplant and Red Onion Cheese "Burger	\N	\N	\N	https://spoonacular.com/recipeImages/The-French-Onion-Eggplant-and-Red-Onion-Cheese-Burger-506269.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rub the olive oil on the eggplant and onion slice. Sprinkle both sides with a bit of kosher salt.Grill over a medium flame for about 4-5 minutes a side until the eggplant softens and grill marks form. I like my eggplant soft, you can adjust times to suite your taste, there’s no fear of rare meat with an eggplant burger.Once the eggplant is almost done to your liking, dollop the Wedge of The Laughing Cow Light French Onion cheese on top. I was only making one so I used the whole wedge, I can see sharing the wedge across 2 burgers but since I only had one, I also topped the onion.Close the grill and let the cheese warm up. It’s not going to melt since it’s more a cream cheese style cheese than a slice but it will still warm and get squishier.At this time I also toasted my “bun” on the grill.</li>\n<li>Remove the eggplant and onion and stack with some spinach leaves on the English muffin.I severed with a side of roasted Brussels sprouts. It was a super light veggie filled lunch!</li>\n</ol>\n</div>
506288	Dark Chocolate Blueberry Protein and Spinach Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Dark-Chocolate-Blueberry-Protein-and-Spinach-Smoothie-506288.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Put everything in the blender or bullet.Blend until smooth.The 7 year old said he didn’t like it because blueberries and chocolate don’t “go together only strawberries and chocolate do.” He’s welcome to his opinion of course, but I told him he was crazy. ;)</li>\n</ol>\n</div>
620981	Chicken & Cranberry Sweet Potato Skins	\N	\N	\N	https://spoonacular.com/recipeImages/Chicken---Cranberry-Sweet-Potato-Skins-620981.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 375F, and line a baking sheet with foil. Lightly coat the foil with nonstick cooking spray. </li>\n<li>Place the 4 sweet potato halves skin side up, and lightly coat with nonstick cooking spray. Sprinkle with the salt. </li>\n<li>Bake at 375F for 15 minutes.While the sweet potato skins bake, prepare the filling. Lightly coat a large pan with nonstick cooking spray, and briefly preheat over medium-low heat. </li>\n<li>Add the spinach, and saut until it has wilted. </li>\n<li>Add in the cranberries and chicken, and continue to saut until theyre warmed through.Flip over the sweet potato skins, and divide the filling between them. Top each with 1  teaspoons of mozzarella. </li>\n<li>Bake at 375F for 7-10 minutes, or until the cheese has melted. Cool on the pan for 1-2 minutes before serving.</li>\n</ol>\n</div>
506316	Sweet Cinnamon and Pear Chicken Wrap	\N	\N	\N	https://spoonacular.com/recipeImages/Sweet-Cinnamon-and-Pear-Chicken-Wrap-506316.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the chicken into chunks and brown in a small non-stick skillet with a bit of non-stick cooking spray.Once there is no more pink on the chicken add the pear and cook for a few minutes until it softens a bit and the chicken cooks through.Meanwhile smear the cheese on the tortilla.Top with the cooked chicken and pears.</li>\n<li>Add the spinach and roll.I served with some raw veggies on the side. It made a great lunch and I loved the sweet twist on a chicken wrap.Nutritional Infomration will vary based on your tortilla. I used an 80 calorie one.</li>\n</ol>\n</div>
758032	Blueberry-Spinach Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/blueberry-spinach-smoothie-758032.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Purée spinach leaves with soymilk in blender. </li>\n<li>Add blueberries, tofu, Manitoba Harvest Hemp Hearts, agave nectar (if using), and allspice (if using); blend until smooth.</li>\n</ol>\n</div>
80201	Miso Soup with Tofu and Nori	\N	\N	\N	https://spoonacular.com/recipeImages/miso_soup_with_tofu_and_nori-80201.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring 6 cups water to a boil in a medium saucepan. Reduce heat to a simmer and whisk in miso. </li>\n<li>Add edamame and cook 2 minutes. </li>\n<li>Remove from heat and add tofu and soy sauce. </li>\n<li>Let sit 3 minutes to warm through. Divide among bowls and top with a few sprinkles of nori strips and some green onions.*Find miso in a market's refrigerated foods section.Note: Nutritional analysis is per 2-cup serving.</li>\n</ol>\n</div>
350565	Tofu Poke	\N	\N	\N	https://spoonacular.com/recipeImages/Tofu-Poke-350565.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oil in either a large Dutch oven or deep-fryer to 375 degrees F.Dredge cubed tofu in cornstarch and deep-fry in preheated oil until golden brown. </li>\n<li>Drain on paper towels until ready to use. Toss fried tofu and vegetables in a mixing bowl with the Poke Sauce.</li>\n</ol>\n<div class="subRecipeInstructionTitle">Poke Sauce:</div>\n<ol>\n<li>2 1/2 cups sugar1 cup soy sauce1/2 cup sesame oil</li>\n\n<li>Combine ingredients in a mixing bowl and whisk until sugar has dissolved.</li>\n</ol>\n</div>
516710	Simple, Healthy Asian Stir Fry with Veggies and Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Simple--Healthy-Asian-Stir-Fry-with-Veggies-and-Tofu-516710.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Get your brown rice or quinoa cooking first – because that takes the longest to cook in this recipe. </li>\n<li>Cut your tofu into 1/2 inch cubes and set aside.</li>\n<li>Heat a large pan over medium to medium-high heat. Spray with cooking spray, and pour the frozen veggies into the pan. Stir fry 5-10 min until the veggies are cooked through, add soy sauce to taste towards the end of the cooking process (note – the Trader Joe’s Asian Veggies comes with a great soy flavored sauce – so I usually just add that instead of soy sauce. But if you get a different frozen veggies mixture, then soy sauce is a decent substitute).Spray another pan with cooking spray and heat over medium heat. </li>\n<li>Saute the tofu cubes until slightly crispy on the outside, add 1-2 Tbsp soy sauce towards the end of cooking for flavor. </li>\n<li>Add the tofu cubes to the veggies, and add 1/4 cup Thai Red Curry Sauce (or more to taste).Stir fry lightly just until the entire mixture is heated through. Sprinkle sesame seeds or cashews or almonds (or nothing at all) on top. </li>\n<li>Serve with brown rice or quinoa.</li>\n</ol>\n</div>
37483	David Chang And Doenjang Chigae (korean Bean Paste Stew)	\N	\N	\N	https://spoonacular.com/recipeImages/david_chang_and_doenjang_chigae-37483.jpg	http://jeanetteshealthyliving.com/2011/03/david-chang-and-doenjang-chigae-korean-bean-paste-stew.html
207201	Cook the Book: Miso Tofu Nuggets with Edamame	\N	\N	\N	https://spoonacular.com/recipeImages/Cook-the-Book--Miso-Tofu-Nuggets-with-Edamame-207201.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Sauté the green onion and ginger in the sesame oil for a couple of minutes, then remove from the heat. Boil the edamame in just enough water to cover for about 5 minutes, until tender yet still firm. Alternatively, put the edamame on a plate, cover with plastic wrap, and microwave on high for 30 seconds.</li>\n<li>2</li>\n<li>Crumble the tofu in a bowl. </li>\n<li>Add the sautéed green onion and ginger, miso, and salt. </li>\n<li>Mix together thoroughly using your impeccably clean hands. Alternatively, you can mix this in a food processor, pulsing to combine. When everything is combined to a smooth paste, mix in the edamame.</li>\n<li>3</li>\n<li>Divide the tofu mixture into nine portions and form round- or oval-shaped flattened nuggets. Coat in cornstarch. </li>\n<li>Heat 1 inch (5cm) of the oil in a large frying pan over medium-high heat. The oil is hot enough when a small piece of the cornstarch-coated tofu dropped into the oil turns brown in a few seconds. Fry the nuggets in batches, taking care not to overcrowd the pan, until browned on both sides. </li>\n<li>Drain well and cool before packing.</li>\n<li>4</li>\n<li>Note:These nuggets can be frozen quite successfully. The texture will change a little, but they will still be good. Cold nuggets can be pan-fried in a dry nonstick frying pan over medium heat until crispy on the outside and heated through, or gently poached in dashi stock for a softer texture. They are also good in soup. </li>\n</ol>\n</div>
207206	Cook the Book: Seasoned Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Cook-the-Book--Seasoned-Tofu-207206.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Remove the tofu from its package and let it drain in a colander or on its side in a bowl.</li>\n<li>2</li>\n\n<li>Combine the green onions and garlic in a small bowl. </li>\n<li>Add the soy sauce, sesame oil, sesame seeds, and chile powder and mix.</li>\n<li>3</li>\n\n<li>Cut the tofu cube lengthwise in half, then cut into 1/2-inch-thick slices.</li>\n<li>4</li>\n\n<li>Heat the vegetable oil in a large skillet over high heat. Carefully place the tofu slices in the skillet. Cook until the tofu is slightly browned on the bottom and getting a bit crispy on the edges, 4 to 5 minutes. Turn the slices over and brown the other side.</li>\n<li>5</li>\n<li>Reduce the heat and spoon the seasoning over the tofu, distributing it somewhat evenly. Cover and let steam for 2 to 3 minutes. </li>\n<li>Transfer to a plate and serve immediately.</li>\n</ol>\n</div>
760162	Steaming Miso Soup with Vegetables	\N	\N	\N	https://spoonacular.com/recipeImages/steaming-miso-soup-with-vegetables-760162.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine miso soup, 1½ cups water, broccoli, mushrooms, and ginger, if using, in medium-size microwave-safe bowl. </li>\n<li>Heat on high 3 minutes. </li>\n<li>Add spinach and tofu, and microwave 30 seconds more. Discard ginger slices before eating.</li>\n</ol>\n</div>
18863	Smoked Tofu, Tomatoes And Mixed Leaves	\N	\N	\N	https://spoonacular.com/recipeImages/smoked-tofu-tomatoes-and-mixed-leaves-2-18863.jpg	http://saladpride.blogspot.com/2011/11/smoked-tofu-tomaoes-and-mixed-leaves.html
424378	Saucy Vegetable Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Saucy-Vegetable-Tofu-424378.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook pasta according to package directions. Meanwhile, in a large skillet, saute the onion, pepper and zucchini in oil until crisp-tender.</li>\n<li>Stir in tofu and spaghetti sauce; heat through. </li>\n<li>Drain pasta; serve with tofu mixture.</li>\n</ol>\n</div>
602619	Roasted Tofu and Vegetables	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Tofu-and-Vegetables-602619.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 400F.</li>\n<li>Drain the tofu and pat very dry with a paper towel to absorb as much moisture as possible. </li>\n<li>Cut tofu into 1" cubes. </li>\n<li>Drizzle about 1 tablespoon olive oil on a baking sheet, carefully add in the tofu and shake the baking sheet a bit to coat the tofu. Go ahead and begin roasting the tofu while you work on the vegetables. If your oven does not fit 2 baking sheets side by side, place the tofu on the UPPER rack.</li>\n<li>Cut the vegetables (see headnote) and in the other baking sheet, toss vegetables with about 2 tablespoons of olive oil so that they are all evenly coated. If your oven does not fit 2 baking sheets side by side, place the vegetables on the LOWER rack.Set timer and roast for 30 minutes, then check the vegetables. The carrots & parsnip may need a little more time. </li>\n<li>Remove any vegetables that are cooked through. Take out the tofu pan and flip the tofu.Increase oven temperature to 450F to finish off the tofu (and the carrots & parsnips if they need more cooking). Roast for an additional 10-15 minutes. The tofu should be nicely browned on both sides. Season with sea salt and freshly ground black pepper.TO MAKE ROASTED VEGETABLE SOUP WITH LEFTOVERS:prep time: 2 minutescook time: 5 minutes</li>\n<li>Leftover roasted vegetables (reserve a few pieces for garnish)1 quart prepared stock (vegetable, beef or chicken)1/2 teaspoon cayenne peppersea salt and freshly ground black peppergood quality olive oil</li>\n\n<li>Place leftover vegetables and tofu into a blender or food processor with just half of the stock. Blend or process until smooth. </li>\n<li>Add in the remaining stock, cayenne pepper, and blend until desired consistency. </li>\n<li>Heat soup in pot. Taste and season with sea salt, freshly ground black pepper and additional cayenne pepper, if needed. Ladle into bowls, finish with a drizzle of olive oil. </li>\n<li>Garnish with roasted vegetables.</li>\n</ol>\n</div>
37402	Chocolate Tofu Shake	\N	\N	\N	https://spoonacular.com/recipeImages/chocolate_tofu_shake-37402.jpg	http://www.thismamacooks.com/2011/04/chocolate-tofu-shake-sweetened-with-stevia.html
143910	Cold Teriyaki Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/cold-teriyaki-tofu-2-143910.png	http://www.food.com/recipe/cold-teriyaki-tofu-93055
522811	Agedashi tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Agedashi-tofu-522811.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Make the sauce. </li>\n<li>Heat the dashi (or the water and dashi powder) just until it comes to a boil. Turn off the heat and stir in the light soy sauce, rice wine, sugar and ginger. Set aside.Press out the excess water from the tofu.To do this, place the tofu between two stacks of kitchen paper and press lightly. Invert, press lightly again. Change the kitchen paper two more times, repeating the process.</li>\n<li>Cut the tofu into two-inch squares (or cubes).</li>\n<li>Place the starch in a shallow bowl. </li>\n<li>Add the tofu and gently roll each to completely coat the outside. Depending on how wet the tofu still is at this point, you may have to do the rolling part two to three times more.</li>\n<li>Heat the oil until wisps of smoke start to appear.Fry the tofu, in batches of five or six, just until the coating turns crisp, about two minutes per batch. </li>\n<li>Drain on a stack of kitchen paper.</li>\n<li>Transfer the cooked tofu cubes on a shallow bowl. Spoon the dashi around them (you can keep in the excess in the fridge). Sprinkle with sliced scallions and serve at once.</li>\n</ol>\n</div>
143954	Warm Tofu With Spicy Garlic Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/warm-tofu-with-spicy-garlic-sauce-2-143954.jpg	http://www.food.com/recipe/warm-tofu-with-spicy-garlic-sauce-401771
478124	Tofu and spinach with teriyaki sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Tofu-and-spinach-with-teriyaki-sauce-478124.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix together the soy sauce, sake, mirin and ginger. </li>\n<li>Pour into a wok and heat until reduced by half.</li>\n<li>Add the fried tofu and spinach to the sauce. Toss and cook just until everything is heated through.</li>\n<li>Transfer everything to a plate. Sprinkle with toasted sesame seeds.Done. Delicious. Yeah, right, my story’s longer than my recipe.</li>\n</ol>\n</div>
287348	Miso Soup with Vegetable Stock and Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Miso-Soup-with-Vegetable-Stock-and-Tofu-287348.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>To make the "dashi" soup stock, in a large saucepan, combine the konbu and vegetable stock and heat over medium-low heat almost to the boiling point. </li>\n<li>Remove the konbu just before the mixture comes to a boil and discard. </li>\n<li>Remove from the heat and skim any foam that rises to the surface. </li>\n<li>Let stand for 2 minutes. Strain through a fine mesh strainer into a saucepan. Keep warm over low heat. </li>\n<li>Add the mushrooms and soy sauce to the dashi and steep until mushrooms are tender, about 10 minutes. </li>\n<li>Remove with a slotted spoon, and when cool enough to handle, slice thinly. Return to the liquid. </li>\n<li>Add the miso pastes and cook over low heat, stirring to dissolve. </li>\n<li>Add the scallions and tofu and cook until warmed through, about 3 minutes.</li>\n<li>Serve immediately.</li>\n</ol>\n</div>
582299	Tofu Jerky	\N	\N	\N	https://spoonacular.com/recipeImages/Tofu-Jerky-582299.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oven to 225°F. Line a baking sheet with parchment or a silicon mat. </li>\n<li>Cut block of tofu in half horizontally and blot dry. </li>\n<li>Cut each half the long way into slices a bit thicker than 1/8 inch (you should have about 28 slices total). Lay them on prepared baking sheet, preferably touching. </li>\n<li>Bake for 30 minutes. Stir together remaining ingredients with 1 Tbsp. water to make a basting sauce. Lightly brush tops of baked tofu slices with half of sauce and bake for another 15 minutes. Flip slices and cook for another 30 minutes, then lightly brush tops with sauce; bake for another 15 minutes. Tofu should be chewy (not crunchy) and still very pliable. </li>\n<li>Let jerky cool completely. (Slices will get a bit crisper as they cool.) </li>\n<li>Serve immediately, or refrigerate in a sealed container for up to 1 week.</li>\n</ol>\n</div>
60102	Braised Tofu in Caramel Sauce (Tau Hu Kho)	\N	\N	\N	https://spoonacular.com/recipeImages/braised_tofu_in_caramel_sauce-60102.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut tofu into 2- by 3-inch, 1/2-inch-thick slices and pat dry. </li>\n<li>Place sugar in a 10- to 12-inch frying pan over medium-high heat; shake pan often until sugar is melted and amber colored, 2 to 3 minutes. </li>\n<li>Add 1/2 cup hot water (mixture will bubble vigorously) and stir over medium heat until caramelized sugar is dissolved. Stir in soy sauce, shallots, ginger, and garlic; stir often over high heat until boiling. Lay tofu pieces in a single layer in sauce. Simmer, uncovered, over medium-low heat for about 5 minutes. With a wide spatula, turn pieces over; simmer until hot and coated with sauce, 3 to 4 minutes longer. </li>\n<li>Transfer tofu and sauce to a serving dish and sprinkle with green onions and pepper.</li>\n</ol>\n</div>
150237	Five-Spice Tofu Stir-Fry with Carrots and Celery	\N	\N	\N	https://spoonacular.com/recipeImages/five-spice-tofu-stir-fry-with-carrots-and-celery-150237.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat 14-inch-diameter flat-bottomed wok or heavy 12-inch-diameter skillet over high heat until drop of water added to wok evaporates on contact. </li>\n<li>Add 1 tablespoon peanut oil and swirl, then add tofu and stir-fry until tofu just begins to brown, about 1 minute. </li>\n<li>Transfer tofu to plate. </li>\n<li>Add remaining 1 tablespoon peanut oil to same wok (do not clean). </li>\n<li>Add carrots, celery, and Szechuan preserved vegetable and stir-fry until carrots are crisp-tender, about 3 minutes. Return tofu to wok; add rice wine, salt, sugar, and white pepper. Stir-fry to blend, about 1 minute. </li>\n<li>Remove pan from heat; stir in sesame oil and serve.</li>\n</ol>\n</div>
500511	Vegan Stuffed Shells with Roasted Eggplant	\N	\N	\N	https://spoonacular.com/recipeImages/Vegan-Stuffed-Shells-with-Roasted-Eggplant-500511.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>FOR THE EGGPLANT: Sprinkle eggplant rounds with sea salt and place in a collander over the sink to let drain. After 10 minutes rinse lightly and then pat dry. Slice into quarters, place on a cookie sheet and toss in olive oil and sea salt. Broil for 5-10 minutes or until slightly browned and softened, tossing once or twice to ensure even roasting. Set aside.Next, bring a pot of water to a boil and add shells and a pinch of sea salt. Stir once and cook according to package instructions. Also, preheat oven to While the shells are cooking, add tofu to a food processor and pulse a couple times to break it up. Then add pesto, a healthy pinch of sea salt, dairy-free mozzarella shreds and mix until just combined. Taste a little and see if you need more salt or pesto. Then stir in roasted eggplant.Once the shells are done, drain and let cool slightly. </li>\n<li>Pour 1/2 cup red sauce in the bottom of a 10-inch cast iron or 8x8 pan, then stuff shells with generous spoonfuls of filling.Arrange shells split side up in the pan and then top with remaining tomato sauce - they should be covered but not drowning. </li>\n<li>Bake for 35 minutes or until warm and bubbly. </li>\n<li>Serve immediately. These go great with Caesar salad, steamed broccoli and/or garlic bread.</li>\n</ol>\n</div>
514870	Easy Sichuan Mapo Tofu / Spicy Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Sichuan-Mapo-Tofu---Spicy-Tofu-514870.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the tofu into 1” x 1” cubes</li>\n<li>Soak the tofu in hot salt water for 5 minutes in order to reduce the pungent soy taste. </li>\n<li>Remove the tofu using a mesh drainer and set aside</li>\n<li>Mince the reconstituted shiitake mushroom In a frying pan or wok, heat 1 tbsp of oil. </li>\n<li>Add a pack of tofu seasoning and minced shiitake  and stir fry until aromatic. About 2 minutes</li>\n\n<li>Add 5 cups of stock or water. Bring to boil</li>\n\n<li>Add the tofu cubes to the sauce and bring to boil again. </li>\n<li>Let simmer for about 5 minutes in low heat. Gently use a specula to splash sauce over the tofu. Thicken the sauce with cornstarch. </li>\n<li>Garnish with chopped scallions and serve hot</li>\n</ol>\n</div>
56231	Fuyu Persimmon Relish	\N	\N	\N	https://spoonacular.com/recipeImages/fuyu-persimmon-relish-2-56231.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In heavy medium skillet over moderate heat, heat oil until hot but not smoking. </li>\n<li>Add onion and sauté until soft, about 5 minutes. </li>\n<li>Add mustard seed and sherry, then bring to boil and reduce until no liquid remains, 1 to 2 minutes. </li>\n<li>Add sherry vinegar, persimmons, and 1 cup water, then bring to boil and reduce by 3/4, about 8 minutes. </li>\n<li>Add currants and continue cooking until almost no liquid remains and currants are plumped, about 3 minutes. </li>\n<li>Remove from heat and stir in salt and pepper. </li>\n<li>Transfer 1/2 relish to food processor and pulse until smooth, about 30 seconds. Return processed relish to skillet and stir to combine. </li>\n<li>Transfer to airtight container and refrigerate at least 24 hours and up to 3 days.</li>\n</ol>\n</div>
417737	Three-Veggie Skillet	\N	\N	\N	https://spoonacular.com/recipeImages/Three-Veggie-Skillet-417737.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Coat grill-and-serve skillet with cooking spray; place on grill. Cook the onion, red pepper and mushrooms in oil over medium heat until crisp-tender, about 6-8 minutes. </li>\n<li>Add garlic; cook 1 minute longer. </li>\n<li>Remove skillet from grill. Stir in the basil, salt and pepper.</li>\n</ol>\n</div>
478137	How to cook: Spicy mung bean sprouts and tofu	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-cook--Spicy-mung-bean-sprouts-and-tofu-478137.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a blender or food processor, grind the shallots, garlic, ginger, chilis and patis until pasty. If the machine won’t run properly, add a few tablespoonfuls of water to help it along.</li>\n<li>Heat the cooking oil in a wok or frying pan.Over medium heat, saute the spice paste until the color deepens and the paste separates from the oil, about ten minutes.Taste the paste. Adjust the seasonings, if needed, adding more patis or sugar, or both.Turn up the heat to high. </li>\n<li>Add the mung bean sprouts and tofu. Stir fry just until heated through and the mung bean sprouts start to soften, about a minute.A sprinkle of finely sliced scallions before serving adds color and even more flavor to the dish.</li>\n</ol>\n</div>
478199	How to cook: Agedashi tofu	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-cook--Agedashi-tofu-478199.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Make the sauce. </li>\n<li>Heat the dashi (or the water and dashi powder) just until it comes to a boil. Turn off the heat and stir in the light soy sauce, rice wine, sugar and ginger. Set aside.Press out the excess water from the tofu.To do this, place the tofu between two stacks of kitchen paper and press lightly. Invert, press lightly again. Change the kitchen paper two more times, repeating the process.</li>\n<li>Cut the tofu into two-inch squares (or cubes).</li>\n<li>Place the starch in a shallow bowl. </li>\n<li>Add the tofu and gently roll each to completely coat the outside. Depending on how wet the tofu still is at this point, you may have to do the rolling part two to three times more.</li>\n<li>Heat the oil until wisps of smoke start to appear.Fry the tofu, in batches of five or six, just until the coating turns crisp, about two minutes per batch. </li>\n<li>Drain on a stack of kitchen paper.</li>\n<li>Transfer the cooked tofu cubes on a shallow bowl. Spoon the dashi around them (you can keep in the excess in the fridge). Sprinkle with sliced scallions and serve at once.</li>\n</ol>\n</div>
189475	Warm Tofu with Spicy Garlic Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Warm-Tofu-with-Spicy-Garlic-Sauce-189475.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Carefully rinse tofu, then cover with cold water in a medium saucepan. Bring to a simmer over medium-high heat, then keep warm, covered, over very low heat.</li>\n<li>Meanwhile, mince and mash garlic to a paste with a pinch of salt. Stir together with remaining ingredients (except tofu).</li>\n<li>Just before serving, carefully lift tofu from saucepan with a large spatula and drain on paper towels. Gently pat dry, then transfer to a small plate. Spoon some sauce over tofu and serve warm. </li>\n<li>Serve remaining sauce on the side.</li>\n</ol>\n<div class="subRecipeInstructionTitle">Cooks' notes:</div>\n<ol>\n<li>•Sauce can be made 1 day ahead and chilled. Bring to room temperature before using.•Tofu can be kept warm up to 4 hours.</li>\n</ol>\n</div>
451692	Cilantro Lime Grilled Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Cilantro-Lime-Grilled-Tofu-451692.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the block of tofu onto a plate and place another plate on top. Set a 3 to 5 pound weight on top (a container filled with water works well). Press the tofu for 20 to 30 minutes, then drain off and discard the accumulated liquid. Slice the tofu lengthwise into 4 thick slabs or cut into cubes and thread on skewers. </li>\n<li>Place tofu pieces or skewers on a plate.</li>\n\n<li>Whisk together the lime juice, olive oil, cilantro, garlic, chili powder, cayenne pepper, salt, and black pepper in a bowl. </li>\n<li>Brush the tofu with the marinade. Cover the plate with plastic wrap, and marinate tofu in the refrigerator for 2 hours  or overnight.</li>\n<li>Preheat an outdoor grill for medium heat, and lightly oil the grate. Grill the tofu until almost blackened in spots, brushing occasionally with the marinade, about 10 to 15 minutes.</li>\n<li>Kitchen-Friendly View</li>\n</ol>\n</div>
21626	Papaya and Avocado Salad with Sour Orange Dressing	\N	\N	\N	https://spoonacular.com/recipeImages/papaya_and_avocado_salad_with_sour_orange_dressing-21626.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Peel and seed papayas; cut lengthwise into 1/2-inch-thick slices. Peel and rinse jicama; cut into matchstick- size strips about 1/8 inch thick and 3 inches long. Pit and peel avocados; cut lengthwise into thin slices. In a small pitcher or bowl, mix orange juice, lime juice, rice vinegar, and salt. Arrange papaya and avocado slices on a rimmed platter. Top with jicama and drizzle with sour orange dressing.</li>\n</ol>\n</div>
543882	Sesame Udon Noodles	\N	\N	\N	https://spoonacular.com/recipeImages/Sesame-Udon-Noodles-543882.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook noodles according to package directions (about 4 minutes), add the mushrooms to the noodles for the last two minutes of cooking.* </li>\n<li>Drain the noodles. Toss with the remaining ingredients and serve. * You can cook the noodles in chicken or vegetable broth for even more flavor</li>\n</ol>\n</div>
486541	Good Morning Scrambled Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Good-Morning-Scrambled-Tofu-486541.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the tomatoes, onion and olives.In a large skillet sautee the onion in olive oil.In a bowl crush the tofu with your fingers, stir in the spices, salt and pepper and mix well to incorporate. </li>\n<li>Transfer the marinated tofu to the skillet with olive oil and cook for about 5 minutes. Don’t let it stick to the pan.</li>\n<li>Add remaining ingredients, more oil if needed, and cook, stirring frequently for another 5 minutes or so, until tofu is crispy. Sprinkle minced coriander over for color and asian flavor.</li>\n</ol>\n</div>
478414	How to cook: Lemongrass and chili stuffed tofu	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-cook--Lemongrass-and-chili-stuffed-tofu-478414.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse and drain the tofu. </li>\n<li>Cut into two-inch squares about an inch thick. For best results, lay on a stack of paper towels to remove the excess water.Meanwhile, prepare the herbs and seasonings. </li>\n<li>Mix together the lemongrass, chili, garlic, salt, sugar and pepper. Gently rub the mixture on all surfaces of the tofu squares, taking care not to break the delicate curd.Using a very sharp pointed knife, cut a cross on one side of the tofu, the cut deeper where the two slashes intersect. Push the remaining spice mixture into the the center of each tofu square.</li>\n<li>Heat the cooking oil in a non-stick frying pan. Fry the tofu squares until browned, flipping them over for even cooking.Arrange the fried tofu squares on a plate. </li>\n<li>Garnish with finely sliced onion leaves. </li>\n<li>Serve hot.</li>\n</ol>\n</div>
609907	Citrusy Kale Salad with Blake’s All Natural Meals	\N	\N	\N	https://spoonacular.com/recipeImages/Citrusy-Kale-Salad-with-Blakes-All-Natural-Meals-609907.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Grate zest from orange then squeeze about 2 tablespoons of juice into a large bowl. </li>\n<li>Whisk vinegar, salt, pepper and oil into the orange juice mixture, until combined well. </li>\n<li>Add kale and almonds to vinaigrette and toss to combine. Cover and chill for 15 minutes before serving to allow flavors to develop.</li>\n</ol>\n</div>
478410	Tofu and mushrooms teriyaki	\N	\N	\N	https://spoonacular.com/recipeImages/Tofu-and-mushrooms-teriyaki-478410.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat about four cups of water with the 1 tsp. of salt.Start heating the vegetable oil in a wok or frying pan.In a small pan, heat together the soy sauce, mirin, sake, sugar and ginger. Cook over medium heat for three to five minutes or just until slightly thickened.Meanwhile, while the sauce cooks and while waiting for the water to boil and the oil to heat up, cut the tofu into 1 and 1/2 inch cubes.</li>\n<li>Cut the mushroom caps into fairly think slices or you can just halve or quarter them, whatever suits your fancy.When the water boils, blanch the mushrooms for about two minutes. Scoop out and set aside.When the oil is hot, fry the tofu cubes until golden. Scoop out and drain on paper towels.Toss the mushrooms and tofu together.Stir the sesame oil into the teriyaki sauce.</li>\n<li>Pour the sauce over the tofu and mushrooms.</li>\n<li>Garnish with sliced scallions and serve right away.</li>\n</ol>\n</div>
310553	Udon with Tofu and Asian Greens	\N	\N	\N	https://spoonacular.com/recipeImages/Udon-with-Tofu-and-Asian-Greens-310553.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook the udon noodles as the label directs. (Don't overcook or they will get mushy.) </li>\n<li>Drain, reserving about 1/3 cup of the cooking water.Meanwhile, heat 2 tablespoons oil in a medium skillet over medium heat. Pat the tofu dry and season all over with salt and pepper. </li>\n<li>Add the tofu to the skillet and sear until golden brown, about 2 minutes per side. Set aside and keep warm.</li>\n<li>Add 1 tablespoon oil and the greens to the skillet. Cook, tossing, until just wilted. </li>\n<li>Add the scallions, red pepper flakes, the remaining 1 tablespoon oil, the soy sauce and sugar. </li>\n<li>Add the reserved cooking water; heat to create a broth. Divide the noodles and greens among 4 bowls and top with the tofu.</li>\n<li>Serve: 4Calories: 430Total Fat: 19 grams</li>\n<li>Saturated Fat: 3 grams</li>\n<li>Protein: 18 grams</li>\n<li>Total carbohydrates: 51 grams</li>\n<li>Sugar: 2 grams</li>\n<li>Fiber: 8 grams</li>\n<li>Cholesterol: 0 milligrams</li>\n<li>Sodium: 990 milligrams</li>\n<li>Photography by Antonis Achilleos</li>\n</ol>\n</div>
540001	Vegetarian Wonton Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Vegetarian-Wonton-Soup-540001.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Finely cut the mushrooms, crown broccoli and tofu into small pieces and place in a large bowl. </li>\n<li>Add olive oil firstly. </li>\n<li>Mix well and add salt. </li>\n<li>Mix well and set aside. Prepare wonton and wrap wonton one by one.In serving bowls, add chopped spring onions, salt, light soy sauce and sesame oil.Boil 3 cups of water in wok or pot; add wonton in to cook for around 3 minutes. Blend dried nori at the last 1 minute. Turn off the fire and scoop 2 tablespoons of soup from the pot to the serving bowls. And transfer the wonton to serving bowls. </li>\n<li>Serve hot!</li>\n</ol>\n</div>
13864	Tofu Caribbean Salad With Watercress	\N	\N	\N	https://spoonacular.com/recipeImages/tofu_caribbean_salad_with_watercress-13864.jpg	http://www.wholefoodsmarket.com/recipes/650
470619	Orange Beef-Style Tofu Stir-Fry	\N	\N	\N	https://spoonacular.com/recipeImages/Orange-Beef-Style-Tofu-Stir-Fry-470619.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat 1/4 cup oil in a wok over medium-high heat. </li>\n<li>Place the 1/4 cup cornstarch in a dish; press tofu slices in the cornstarch to coat on all sides. Stir-fry in the wok 5 minutes, or until golden brown on all sides. </li>\n<li>Drain tofu on paper towels. Allow wok to cool, and wipe clean.</li>\n<li>In a bowl, mix the soy sauce, orange juice, water, sugar, chili paste, and cornstarch until smooth.</li>\n\n<li>Heat the remaining 1 tablespoon oil in the wok, and stir-fry the carrots until tender. Form a well in the center of the carrots, and pour in the sauce. Bring sauce to a boil. </li>\n<li>Mix tofu into the wok, and continue cooking until coated with the sauce.</li>\n<li>Kitchen-Friendly View</li>\n</ol>\n</div>
11909	Five-spice Tofu Stir-fry With Carrots And Celery	\N	\N	\N	https://spoonacular.com/recipeImages/five-spice_tofu_stir-fry_with_carrots_and_celery-11909.jpg	http://www.bonappetit.com/recipes/2007/05/five_spice_tofu_stir_fry_with_carrots_and_celery
9912	Bok Choy and Tofu Noodle Bowl	\N	\N	\N	https://spoonacular.com/recipeImages/bok_choy_and_tofu_noodle_bowl-9912.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook noodles as package directs. </li>\n<li>Drain and divide among 4 bowls. Meanwhile, combine soy sauce, sesame oil, and broth and set aside. </li>\n<li>Cut tofu lengthwise into 3 pieces. </li>\n<li>Cut crosswise into 1/2-in. sticks and blot dry. </li>\n<li>Heat 1 tbsp. vegetable oil in a large frying pan over high heat. Brown tofu (don't stir), 4 minutes; brown on other side. Set on noodles. </li>\n<li>Add remaining 1 tbsp. vegetable oil to same pan over medium-high heat. Cook ginger and garlic until fragrant, 30 seconds. </li>\n<li>Add bok choy and cook until wilted, 5 minutes. </li>\n<li>Add reserved broth mixture and cook until hot, about 1 minute. Spoon mixture over noodles and tofu and sprinkle with onions.Note: Nutritional analysis is per serving.</li>\n</ol>\n</div>
32463	Broad Bean, Pea And Goat Cheese Bruschetta	\N	\N	\N	https://spoonacular.com/recipeImages/broad_bean_pea_and_goat_cheese_bruschetta-32463.jpg	http://cookalmostanything.blogspot.com/2007/09/weekend-herb-blogging-99.html
521985	Peperonata con tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Peperonata-con-tofu-521985.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Set a thick-bottomed pan on the stove over medium heat. </li>\n<li>Pour in the 4 tbsps. of olive oil. When hot, add the peppers and onion. Sprinkle with salt and pepper. Cook gently, stirring once or twice, for about a minute.</li>\n<li>Add the garlic and tomatoes to the peppers and onion. Sprinkle in the oregano, and a bit more salt and pepper. Stir. Lower the heat, cover the pan and let the vegetables cook in their own juices for about 30 minutes or until soft. Resist the urge to lift the cover and stir. Removing the cover will just release steam which you need to cook the vegetables. And they need no stirring if you keep the heat low so that they are nestled in a shallow pool of the their own juices for the duration of the cooking time.After the peperonata has been cooking for 20 minutes, prepare the tofu.Press the tofu slices between kitchen towels to remove excess water.Sprinkle both sides of the tofu slices with salt.</li>\n<li>Heat enough olive oil in a frying pan to reach a depth of about a quarter inch.Fry the tofu slices, in a single layer, until golden and crisp. Flip for even cooking.Arrange the tofu slices on a plate. Spoon the peperonata over them. Sprinkle with basil or parsley, or both, and serve.</li>\n</ol>\n</div>
112479	Spiced up Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/spiced-up-tofu-2-112479.jpg	http://www.food.com/recipe/spiced-up-tofu-91012
573057	Mustardy Kale and Butternut Squash	\N	\N	\N	https://spoonacular.com/recipeImages/Mustardy-Kale-and-Butternut-Squash-573057.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the oil in Dutch oven over medium heat. </li>\n<li>Add the squash and cook, tossing occasionally, until beginning to soften, 10 to 12 minutes.</li>\n<li>Add the kale, broth, mustard, ¾ teaspoon salt, and ¼ teaspoon pepper to the pan and cook, tossing occasionally, until the vegetables are tender, 8 to 10 minutes.</li>\n</ol>\n</div>
522135	Lemongrass and chili stuffed tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Lemongrass-and-chili-stuffed-tofu-522135.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse and drain the tofu. </li>\n<li>Cut into two-inch squares about an inch thick. For best results, lay on a stack of paper towels to remove the excess water.Meanwhile, prepare the herbs and seasonings. </li>\n<li>Mix together the lemongrass, chili, garlic, salt, sugar and pepper. Gently rub the mixture on all surfaces of the tofu squares, taking care not to break the delicate curd.Using a very sharp pointed knife, cut a cross on one side of the tofu, the cut deeper where the two slashes intersect. Push the remaining spice mixture into the the center of each tofu square.</li>\n<li>Heat the cooking oil in a non-stick frying pan. Fry the tofu squares until browned, flipping them over for even cooking.Arrange the fried tofu squares on a plate. </li>\n<li>Garnish with finely sliced onion leaves. </li>\n<li>Serve hot.</li>\n</ol>\n</div>
38843	Tofu Pizza With Garlic And Rosemary	\N	\N	\N	https://spoonacular.com/recipeImages/tofu_pizza_with_garlic_and_rosemary-38843.jpg	http://www.biggirlssmallkitchen.com/2011/01/cooking-for-others-meatless-monday-tofu.html
143339	Vegan Hollandaise Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/vegan-hollandaise-sauce-2-143339.jpg	http://www.food.com/recipe/vegan-hollandaise-sauce-150868
143435	Savory Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/savory_tofu-143435.jpg	http://www.food.com/recipe/savory-tofu-210938
761951	Sesame Noodle Salad with Asparagus and Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/sesame-noodle-salad-with-asparagus-and-tofu-761951.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring large pot of lightly salted water to a boil for vermicelli. Meanwhile, in large skillet, heat sesame oil over medium-high heat. Stir in asafetida if desired and tofu. Sprinkle with liquid aminos and cook, stirring often, until tofu is golden-brown, about 7 minutes.</li>\n<li>Add asparagus, sprinkle lightly with salt, cover and cook until crisp-tender, 3 to 4 minutes. Immediately remove from heat; set aside.</li>\n<li>Add vermicelli to boiling water; stir to prevent sticking. Cook until just tender, about 6 minutes. </li>\n<li>Drain, rinse under cold running water and drain well. </li>\n<li>Transfer noodles to large bowl; add half of the Sesame Dressing and season with salt and freshly ground pepper to taste. Toss well. Spoon asparagus-tofu mixture on top, sprinkle with cucumber and drizzle with some remaining Sesame Dressing. Sprinkle with cilantro and serve.</li>\n</ol>\n</div>
370822	Curried Tofu Vegetable Skewers	\N	\N	\N	https://spoonacular.com/recipeImages/Curried-Tofu-Vegetable-Skewers-370822.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix white wine and curry paste, while mixing slowly add oil to emulsify. Skewer the rest of the ingredients and marinate in curry marinade, let sit 1 hour to overnight.Grill until all vegetables are cooked.A viewer, who may not be a professional cook, provided this recipe. The FN chefs have not tested this recipe and therefore, we cannot make representation as to the results.</li>\n<li>Home Cook Recipe:A viewer or guest of the show, who may not be a professional cook, provided this recipe. The Food Network Kitchen have not tested this recipe and therefore cannot make representation as to the results.</li>\n</ol>\n</div>
762000	Southwestern Tofu and Tortilla Scramble	\N	\N	\N	https://spoonacular.com/recipeImages/southwestern-tofu-and-tortilla-scramble-762000.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>   Meal plan:  Microwave several sweet potatoes to serve on the side and prepare a simple salad of cherry tomatoes and arugula. Finish with a refreshing mixture of canned unsweetened pineapple chunks and peeled, diced papaya spooned over vanilla low-fat yogurt or soy yogurt if desired.</li>\n</ol>\n</div>
659604	Scrambled tofu with rocket	\N	\N	\N	https://spoonacular.com/recipeImages/Scrambled-tofu-with-rocket-659604.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the coconut oil in a pan, on medium heat. </li>\n<li>Add the cumin and let it sputter. </li>\n<li>Add in the chopped onion and green chilli and cook for 5 minutes. </li>\n<li>Add the tomatoes and cook for a further minute.</li>\n<li>Add the turmeric powder and salt to taste, and stir well. Lightly crumble the tofu and and mix gently. Cook for 5 minutes. Toss in the rocket, mix and cook for a couple of minutes. Season with some pepper.</li>\n<li>Serve the scrambled tofu with some grilled tomatoes, rocket leaves and vegan sausages.</li>\n</ol>\n</div>
37023	Whole-wheat Spaghetti With Vegetables And Peanut Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/whole-wheat-spaghetti-with-vegetables-and-peanut-sauce-2-37023.jpg	http://www.marthastewart.com/312553/whole-wheat-spaghetti-with-vegetables-an
118962	Clear Oriental Soup	\N	\N	\N	https://spoonacular.com/recipeImages/clear-oriental-soup-2-118962.jpg	http://www.food.com/recipe/clear-oriental-soup-89769
96473	Curried Tofu over Watercress	\N	\N	\N	https://spoonacular.com/recipeImages/curried-tofu-over-watercress-2-96473.jpg	http://www.food.com/recipe/curried-tofu-over-watercress-246838
16601	Vegetarian Lettuce Wraps	\N	\N	\N	https://spoonacular.com/recipeImages/vegetarian_lettuce_wraps-16601.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oil in a nonstick skillet over medium-high heat. Throw in the tofu, then break it up into very small pieces. Cook tofu for several minutes, until much of the liquid cooks off and tofu starts to turn golden.</li>\n<li>Cut kernels off the cobs of corn and throw it in with the tofu. Cook for a few minutes (corn can remain crunchy.) </li>\n<li>Add chili powder and soy sauce, then cook until most of the liquid has been absorbed. Turn off heat and stir in balsamic if using. Pile mixture into romaine hearts, then add sliced of avocado. Fold up and chow down!</li>\n</ol>\n</div>
762068	Tofu Ravioli with Tomatoes, Olives and Capers	\N	\N	\N	https://spoonacular.com/recipeImages/tofu-ravioli-with-tomatoes-olives-and-capers-762068.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring large pot of lightly salted water to a boil. </li>\n<li>Add ravioli; stir to prevent sticking. Cook ravioli until just tender, about 8 minutes for fresh; 15 minutes for frozen. Meanwhile, in large shallow serving bowl, combine tomatoes, parsley, chopped olives, garlic, capers, oil and pepper. </li>\n<li>Drain ravioli and add to tomato mixture. Toss well to combine. Adjust seasoning to taste, divide among plates and garnish with whole black olives if desired.</li>\n</ol>\n</div>
618722	Tomato Blueberry Tofu Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Tomato-Blueberry-Tofu-Salad-618722.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small mixing bowl, whisk together olive oil, vinegar, sake and sea salt.</li>\n<li>Pour dressing over tomato mixture.In a large bowl toss together tomatoes, shallots and blueberries. </li>\n<li>Pour dressing over and stir to combine.In a large serving bowl place tofu in center and then pour tomato, blueberry mixture over and around tofu.Top with chopped chives.</li>\n<li>Serve</li>\n</ol>\n</div>
22798	Tofu, Cucumber And Edamame Beans	\N	\N	\N	https://spoonacular.com/recipeImages/tofu_cucumber_and_edamame_beans-22798.jpg	http://saladpride.blogspot.com/2011/09/tofu-cucumber-and-edamame-beans.html
80157	Soba Noodle Salad	\N	\N	\N	https://spoonacular.com/recipeImages/soba_noodle_salad-80157.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a 5- to 6-quart pan over high heat, bring about 3 quarts water to a boil. </li>\n<li>Add noodles and cook until tender to bite, 3 to 6 minutes. </li>\n<li>Drain noodles and rinse gently under cold running water until cool.  Meanwhile, in a large bowl, mix rice vinegar, sesame oil. soy sauce, ginger, and wasabi, if using. </li>\n<li>Pour about half the dressing into a small container; cover and reserve. </li>\n<li>Add noodles to large bowl and mix to coat; cover and chill until cold, about 1 hour, or up to 1 day.  Just before serving, add protein, vegetables, and reserved dressing to noodles; mix to coat. Protien Options: Sliced tofu, shredded chicken, cooked shrimp</li>\n<li>Vegetable Options: Baby spinach leaves, sliced green onions, orange segments, slivered Napa cabbage, shredded carrots, snow peas, thinly sliced red or yellow bell peppers, sliced cucumbers, broccoli florets</li>\n</ol>\n</div>
110961	Asian Noodles and Broccoli	\N	\N	\N	https://spoonacular.com/recipeImages/asian-noodles-and-broccoli-2-110961.jpg	http://www.food.com/recipe/asian-noodles-and-broccoli-264485
760214	Everyday Chocolate Brownies	\N	\N	\N	https://spoonacular.com/recipeImages/everyday-chocolate-brownies-760214.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350F. Coat 9×13-inch baking dish with cooking spray. </li>\n<li>Combine sugar, flour, cocoa powder, baking powder, baking soda and salt in large bowl. </li>\n<li>Combine applesauce, tofu, soymilk and vanilla in food processor, and process until well blended. </li>\n<li>Add tofu mixture to dry ingredients, and mix well. Scrape batter into prepared pan. </li>\n<li>Bake until batter is set and top is dry, 45 to 50 minutes. Cool in pan; cut into bars and serve.</li>\n</ol>\n</div>
102853	Simple Miso Soup	\N	\N	\N	https://spoonacular.com/recipeImages/simple-miso-soup-2-102853.jpg	http://www.food.com/recipe/simple-miso-soup-23853
137692	Tofurkey (Tofu Turkey)	\N	\N	\N	https://spoonacular.com/recipeImages/tofurkey-2-137692.jpg	http://www.food.com/recipe/tofurkey-tofu-turkey-264097
205281	Soy-Glazed Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Soy-Glazed-Tofu-205281.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut each slice of tofu in half diagonally. </li>\n<li>Place tofu slices on several layers of paper towels, and cover tofu with additional paper towels; let stand 15 minutes, pressing down occasionally. </li>\n<li>Combine vinegar and next 4 ingredients (through rind) in a small saucepan; bring to a boil. Reduce heat and simmer, uncovered, 6 minutes or until thick and syrupy. </li>\n<li>Heat oil in a large nonstick skillet over medium-high heat. Arrange tofu slices in pan in a single layer; sauté 5 minutes on each side or until golden brown. </li>\n<li>Remove from heat; pour vinegar mixture over tofu to coat. Sprinkle with green onions and sesame seeds. </li>\n<li>Serve immediately.Wine note: Tofu works with just about every wine, but given the flavors of soy sauce, orange, and sesame, a refreshing white is in order. In particular, sesame and orange both work magnificently with unoaked chardonnay. My favorite: St. Supery Oak Free Chardonnay from Napa Valley, California. The 2008 is $ —Karen MacNeil</li>\n</ol>\n</div>
14824	Tofu & Chinese Broccoli	\N	\N	\N	https://spoonacular.com/recipeImages/tofu-chinese-broccoli-2-14824.jpg	http://www.sfgate.com/food/recipes/detail.html?rid=17378&sorig=qs
481770	Filo Package with Chive Ribbon	\N	\N	\N	https://spoonacular.com/recipeImages/Filo-Package-with-Chive-Ribbon-481770.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Roast Fennel and Onions</li>\n<li>Slice leek (or onion) and fennel into 1/2 inch strips, drizzle with 3 T olive oil, 1/4 tsp salt , cracked pepper and roast in 400 F oven until tender and golden 40-50 minutes. Chop, or pulse in food processor until finely chopped. Fold into ricotta mixture, adding crushed seeds for flavor. Tofu "Ricotta"2 Cloves garlic1/2 C Parsley ( or any tender herb) zest of 1 one lemon14 oz firm tofu1 T olive oil1 T Nutritional yeast1 tsp saltcracked pepper</li>\n\n<li>Place garlic, parsley and zest in a food processor, pulse till finely chopped.</li>\n<li>Add the rest of the ingredients ( 14 oz tofu, broken into pieces, 1 T olive oil, 1T nutritional yeast, 1 tsp salt, cracked pepper) Pulse repeatedly until granular like ricotta cheese. Set aside in med bowl.</li>\n<li>Place roasted fennel onion mixture in food processor, pulse until chopped. </li>\n<li>Mix together with “ricotta”. </li>\n<li>Add ground seeds. Or real herbed "Ricotta"2 Cloves garlic-minced1/2 C finely chopped Parsley ( or any tender herb)zest of 1 one lemon14 oz whole milk ricotta1 tsp saltcracked pepper</li>\n\n<li>Mix in a bowl. Make purses: Prepare a damp paper towel, olive oil bowl w/ brush, sheet pan with parchment paper.Carefully Unwrap thawed filo. Cover with damp paper towel. </li>\n<li>Place one filo sheet on your work table (remember to cover filo with damp paper towel). </li>\n<li>Brush with olive oil. </li>\n<li>Place another sheet over top, and brush with oil. </li>\n<li>Cut into 6 equal squares. Working quickly, fill with 1 T filling and bring corners together, pinching together at middle. Tie a chive ribbon around the neck and place on sheet pan.</li>\n<li>Bake 12-15 minutes at 375 until crispy and golden. </li>\n<li>Serve with Herb “cream” sauce</li>\n<li>Make Herb Sauce (fully customizable)In a blender or food processorplace 1/2 block silken tofu1/4 C olive oil1/4 C water or just enough to blendjuice from 1/2 a small lemon1/2 cup fresh tender herbs ( parsley, dill, tarragon,basil, mint, or a combination)3/4 tsp kosher salt1/2 clove garlic ( optional)blend until very green and smooth GENERAL FILLO DOUGH HANDLING DIRECTIONS Allow fillo dough to thaw in refrigerator overnight. Bring to room temperature before using. Carefully unroll fillo sheets onto a smooth, dry surface. Cover fillo completely with plastic wrap, then a damp towel. Keep fillo covered until needed. Do not leave uncovered for more than one minute to avoid drying out. Microwave butter until melted. This will give you a lighter and flakier pastry. </li>\n<li>Brush each layer of fillo with melted butter, margarine or oil. To prevent edges from cracking, brush edges first and then work into center. Be sure to brush the last layer of fillo with melted butter. Fillings should be chilled and not excessively moist. Fillo may be rolled and refrozen to store when not in use.</li>\n</ol>\n</div>
10778	Miso Soup	\N	\N	\N	https://spoonacular.com/recipeImages/miso_soup-10778.jpg	http://www.veggienumnum.com/2010/06/miso-soup/
170527	Steamed Asparagus with Tarragon Mayonnaise	\N	\N	\N	https://spoonacular.com/recipeImages/Steamed-Asparagus-with-Tarragon-Mayonnaise-170527.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>To make mayonnaise, in blender or food processor, place tofu, lemon juice, mustard, salt, shallot and garlic. Cover and blend on medium speed until smooth. With blender on, add oil by drops. </li>\n<li>Place in glass or plastic container; stir in tarragon. Cover and refrigerate at least 1 hour or until chilled.</li>\n<li>2</li>\n\n<li>Place steamer basket in 1/2 inch water in saucepan or skillet (water should not touch bottom of basket). </li>\n<li>Place asparagus in basket. Cover tightly and heat to boiling; reduce heat. Steam 6 to 8 minutes or until crisp-tender. </li>\n<li>Serve with mayonnaise.</li>\n</ol>\n</div>
119382	Vegan Carrot Cake	\N	\N	\N	https://spoonacular.com/recipeImages/vegan-carrot-cake-2-119382.jpg	http://www.food.com/recipe/vegan-carrot-cake-185092
660067	Silky Tofu In Ginger and Spring Onion Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Silky-Tofu-In-Ginger-and-Spring-Onion-Sauce-660067.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
27284	Tofu With Tomatoes, Basil, And Mint	\N	\N	\N	https://spoonacular.com/recipeImages/tofu-with-tomatoes-basil-and-mint-2-27284.jpg	http://www.wholeliving.com/183707/tofu-tomatoes-basil-and-mint
14999	Mustard-crusted Tofu With Kale And Sweet Potato	\N	\N	\N	https://spoonacular.com/recipeImages/mustard-crusted_tofu_with_kale_and_sweet_potato-14999.jpg	http://www.bonappetit.com/recipes/2007/09/mustard_crusted_tofu_with_kale_and_sweet_potato
424601	Miso Soup with Tofu and Enoki	\N	\N	\N	https://spoonacular.com/recipeImages/Miso-Soup-with-Tofu-and-Enoki-424601.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a Dutch oven, saute the mushrooms, onion, garlic and ginger in oil until tender. </li>\n<li>Add the water and miso paste. Bring to a boil. Reduce heat; simmer, uncovered, for 15 minutes. </li>\n<li>Add tofu; heat through. Ladle into bowls; garnish with green onions.</li>\n</ol>\n</div>
250533	Fried Tofu with Spicy Ginger-Sesame Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Fried-Tofu-with-Spicy-Ginger-Sesame-Sauce-250533.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, whisk the soy sauce with the sugar, red pepper, garlic, sesame oil, ginger and sesame seeds.Slice the tofu crosswise into 8 thin slabs. Dry the tofu with paper towels, pressing until no moisture remains.In a large skillet, heat 1/4 inch of oil until shimmering. </li>\n<li>Add the tofu and cook over moderate heat, turning once, until browned and crisp, about 8 minutes per side. </li>\n<li>Drain on paper towels. Spoon the sauce over the fried tofu and sprinkle with the scallion. </li>\n<li>Serve with steamed rice.</li>\n</ol>\n</div>
262853	Baked Vegan Corndogs	\N	\N	\N	https://spoonacular.com/recipeImages/Baked-Vegan-Corndogs-262853.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 450 F. Grease a cookie sheet or line with parchment paper and set aside. </li>\n<li>Mix cornmeal, flour, baking powder, salt, spices, pepper, ener-g-egg replacer, 1/3 cup non-dairy milk and sugar together in a medium bowl. Slowly add additional non-dairy milk until the mixture is wet and can be worked with. However, be careful it's not too soupy or dry and doughy. Stir gently for 30 seconds. For mini-corndogs, cut the tofu dogs into 3 equal pieces, or the size that fits your Twinkie pan. Dip each tofu dog into the cornmeal mixture, making sure its evenly coated. Then place on the prepared cookie sheet, moving the coating around as necessary to ensure it's evenly coated. If using a Twinkie pan, pour a little mixture to line the bottom of the insert, add the dog, then add more batter over top until it's covered. Repeat. </li>\n<li>Bake for 10-15 minutes until golden and a little crisp.Nutritional Information</li>\n</ol>\n<div class="subRecipeInstructionTitle">Serving Size: 1Servings Per Batch:</div>\n<ol>\n<li>6Amount Per Serving</li>\n<li>Calories</li>\n<li>215Fat</li>\n<li>1g</li>\n<li>Carbohydrate</li>\n<li>23gDietary Fiber4gSugars4gProtein11g</li>\n</ol>\n</div>
543463	Tofu Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Tofu-Salad-543463.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wrap tofu in a towel and put something heavy on it — like adictionary — for 10 minutes to remove as much water as possible. </li>\n<li>Place carrots in a steamer pot over boiling water for 3 minutes. </li>\n<li>Add the celery and continue to cook for 4 minutes or until thevegetables are fork tender.  When the vegetables are cool, place all of the ingredients in a food processor and pulse until everything is combined and little pieces remain. </li>\n<li>Serve</li>\n</ol>\n</div>
35597	Vegan Cookies With Chocolate, Peanut Butter, And Cinnamon	\N	\N	\N	https://spoonacular.com/recipeImages/vegan_cookies_with_chocolate_peanut_butter_and_cinnamon-35597.jpg	http://www.joythebaker.com/blog/2008/08/vegan-cookies-with-chocolate-peanut-butter-and-cinnamon/
21453	Chunky Tofu Guacamole	\N	\N	\N	https://spoonacular.com/recipeImages/chunky_tofu_guacamole-21453.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Slice avocado in half. Scoop pulp from 1 half of avocado; set remaining half aside.</li>\n<li>Place tofu, avocado pulp, salsa verde, and next 3 ingredients in a food processor; process until smooth, scraping down sides of bowl occasionally. </li>\n<li>Transfer to a medium bowl.Dice remaining avocado. </li>\n<li>Add diced avocado, tomato, and onion to tofu mixture, stirring well.</li>\n</ol>\n</div>
121843	Agedashi Dofu	\N	\N	\N	https://spoonacular.com/recipeImages/agedashi-dofu-2-121843.jpg	http://www.food.com/recipe/agedashi-dofu-316920
15357	Mustard-Crusted Tofu with Kale and Sweet Potato	\N	\N	\N	https://spoonacular.com/recipeImages/mustard-crusted-tofu-with-kale-and-sweet-potato-2-15357.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut tofu into eight 1/2-inch-thick slices. Arrange on paper towels; drain 10 minutes. </li>\n<li>Spread both sides of each slice with mustard.</li>\n\n<li>Heat 2 tablespoons oil in large nonstick skillet over medium-high heat. </li>\n<li>Add onion and ginger; sauté 1 minute. </li>\n<li>Add kale, sweet potato, and lime juice. Cover, reduce heat to low, and cook until potato is tender and kale is wilted, about 12 minutes.</li>\n<li>Meanwhile, heat remaining 2 tablespoons oil in another large nonstick skillet over medium heat. </li>\n<li>Add tofu; cover and cook until heated through and crisp, about 2 minutes per side (some mustard seeds may fall off tofu).</li>\n<li>Arrange kale and sweet potato mixture on plate. Overlap tofu slices atop vegetables and serve.</li>\n<li>Per serving: 418 calories, 24 g fat (2 g saturated), 0 mg cholesterol, 775 mg sodium, 31 g carbohydrate, 7 g fiber, 21 g protein</li>\n<li>Nutritional analysis provided by</li>\n<li>Nutrition Data</li>\n<li>See Nutrition Data's complete analysis of this recipe ›</li>\n</ol>\n</div>
478291	Tofu and string beans adobo	\N	\N	\N	https://spoonacular.com/recipeImages/Tofu-and-string-beans-adobo-478291.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse the tofu and press between kitchen towels to remove as much of the water as you can.Using your hands, crumble the tofu so that it resembles minced meat. Sprinkle lightly with Himalayan black salt.</li>\n<li>Heat the vegetable oil in a frying pan (non-stick works best). </li>\n<li>Add the seasoned tofu and cook over medium heat, uncovered and with occasional stirring, until quite dry, about 10 minutes.Stir in the cut string beans, garlic, pepper and bay leaf.</li>\n<li>Pour in the vinegar.Cover the pan and let everything cook until the string beans are tender (but not overly so) and the mixture is almost dry, about 10 minutes.</li>\n<li>Pour in the soy sauce. Cook, stirring, for another minute or so.Taste. Adjust the seasonings, if needed.</li>\n<li>Serve hot.</li>\n</ol>\n</div>
760933	Cabbage Salad with Baked Tofu and Lemon-Soy Vinaigrette	\N	\N	\N	https://spoonacular.com/recipeImages/cabbage-salad-with-baked-tofu-and-lemon-soy-vinaigrette-760933.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wine Suggestions</li>\n<li>The tangy soy, sesame oil and lemon juice dressing adds flavor for a pairing with a Gewurztraminer from Columbia Winery.</li>\n</ol>\n</div>
478330	How to cook: Crisp tofu in tomato chili sauce	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-cook--Crisp-tofu-in-tomato-chili-sauce-478330.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking oil in a wok or frying pan until fine wisps of smoke start to appear.</li>\n<li>Cut the tofu into cubes. How large or how small is entirely up to you. Fry in hot oil until golden brown.</li>\n<li>Pour off the oil except for a tablespoonful or so.</li>\n<li>Heat the tablespoonful or so of oil again. </li>\n<li>Saute the garlic, chili and onion or shallots until fragrant, about a minute.</li>\n<li>Add the tomatoes, fish sauce, sugar and black pepper. Cook over high heat, stirring, until the tomatoes start to soften.</li>\n<li>Pour in about a third of a cup of water. Once the liquid boils, reduce the heat to medium-low and cook, uncovered for about seven minutes or until the liquid is reduced. This step will allow the flavors to develop and, at the same time, concentrate the flavors.Turn up the heat. </li>\n<li>Add the tofu cubes. Toss. Cook for 30 seconds to reheat the tofu.Turn off the heat. Taste the sauce and add more fish sauce, sugar or pepper, as needed.Tip the tofu, vegetables and cooking liquid into a shallow bowl. </li>\n<li>Garnish with the cilantro. </li>\n<li>Serve hot.</li>\n</ol>\n</div>
544388	Kale Avocado Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-Avocado-Salad-544388.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the first 4 ingredients in a bowl and toss to combine. </li>\n<li>Add the remaining ingredients and using your hands (or a spoon), stir to combine (it’s fun getting your hands in there to mash the avocado into chunks). </li>\n<li>Serve.</li>\n</ol>\n</div>
609926	Pineapple Kale Cucumber Juice	\N	\N	\N	https://spoonacular.com/recipeImages/Pineapple-Kale-Cucumber-Juice-609926.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wash the fruit. Turn on the juicer. </li>\n<li>Cut the fruit and vegetables into pieced that will easily fit in your juicer. Juice the ingredients and then give them a shake or stir to combine. Enjoy over ice.</li>\n</ol>\n</div>
478370	Tofu and black beans stir fry	\N	\N	\N	https://spoonacular.com/recipeImages/Tofu-and-black-beans-stir-fry-478370.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the tofu into bite-size pieces.</li>\n<li>Heat the cooking oil in a wok or frying pan, and fry the tofu until golden brown (see tips). Scoop out the the tofu (a kitchen spider is useful) and drain off the excess oil by placing the tofu in a strainer or a stack of paper towels.</li>\n<li>Pour off the cooking oil from the pan, leaving only about a tablespoonful. </li>\n<li>Heat the oil, and saute the black beans and garlic until fragrant. </li>\n<li>Add the bell pepper and celery, and continue stir frying for about 30 seconds.</li>\n<li>Pour in the rice wine. Stir in the black pepper and sugar. Toss a few times then add the tofu.</li>\n<li>Pour in the starch solution. Adjust the seasonings. Stir and toss alternately over high heat. When the sauce is thick and clear, turn off the heat. </li>\n<li>Drizzle in the sesame seed oil and stir a few times.</li>\n<li>Transfer the tofu and black beans stir fry to a serving plate or bowl and serve hot.</li>\n</ol>\n</div>
17773	Yukimi Nabe (snowviewing Nabe)	\N	\N	\N	https://spoonacular.com/recipeImages/yukimi_nabe-17773.jpg	http://www.teaandcookiesblog.com/2006/04/the-cherry-blossoms-return.html
478584	Sweet and sour tofu with bean sprouts and fresh herbs	\N	\N	\N	https://spoonacular.com/recipeImages/Sweet-and-sour-tofu-with-bean-sprouts-and-fresh-herbs-478584.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all the sauce ingredients in a pan. Bring to a boil then lower the heat to medium. Boil gently, uncovered, until thickened and syrupy, about 10 minutes. Turn off the heat. Leave the sauce to infuse.Fry the tofu cubes until golden (see tips). </li>\n<li>Drain on paper towels and set aside.Boil a pot of water. Blanch the bean sprouts for about 15 seconds then drain and dump in iced water to refresh (that’s so they stay crunchy). </li>\n<li>Drain well.Finely slice the basil and mint leaves (see how to make basil chiffonade).Toss the tofu and sauce together.</li>\n<li>Add the bean sprouts, basil and mint to the tofu. Toss a few times and serve.</li>\n</ol>\n</div>
105880	Vegan Zucchini and Potato Latkes	\N	\N	\N	https://spoonacular.com/recipeImages/vegan-zucchini-and-potato-latkes-2-105880.jpg	http://www.food.com/recipe/vegan-zucchini-and-potato-latkes-396661
761301	Cracked Wheat Pilaf with Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/cracked-wheat-pilaf-with-mushrooms-761301.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wine Suggestions</li>\n<li>Depending on your ingredients, this pilaf could be full-bodied, so a fruit-driven Shiraz would be a good match. If your stock is light, consider a leaner, French-style Pinot Noir with some aging.</li>\n</ol>\n</div>
114160	Cashew Fried Rice	\N	\N	\N	https://spoonacular.com/recipeImages/cashew-fried-rice-2-114160.jpg	http://www.food.com/recipe/cashew-fried-rice-108112
624139	Salt and Pepper Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Salt-and-Pepper-Tofu-624139.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut tofu into smaller pieces. Blanch in salted water for 5 minutes. Carefully drain and wipe dry with kitchen towel.</li>\n</ol>\n</div>
222803	Asian-style tofu & cucumber noodles	\N	\N	\N	https://spoonacular.com/recipeImages/Asian-style-tofu---cucumber-noodles-222803.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Mix the soy sauce, ginger and lime juice in a dish, then add the tofu. Leave to marinate for 5 mins, turning once. Boil the noodles for 4 mins, or according to pack instructions, then drain and cool.Dry the tofu on kitchen paper. </li>\n<li>Heat the oil in a non-stick frying pan, then fry tofu for 3 mins on each side until golden. </li>\n<li>Cut into cubes.To serve, mix the noodles, chilli, cucumber, tofu and the marinade in a bowl. Toss, then serve with lime wedges and peanuts.</li>\n</ol>\n</div>
620332	Teriyaki Tofu	\N	\N	\N	https://spoonacular.com/recipeImages/Teriyaki-Tofu-620332.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wrap tofu with several pieces of kitchen towels to absorb the excess water. </li>\n<li>Cut into 3cm dices. Lightly coat the tofu with potato starch.</li>\n</ol>\n</div>
495516	Thai Red Curry Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Thai-Red-Curry-Soup-495516.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Bring broth and ginger to a boil over high heat. Once broth has come to a boil, use a slotted spoon to remove ginger. </li>\n<li>Add mushrooms and tofu and reduce heat to medium-low; cook about 5 minutes, or until mushrooms are softened.Stir in coconut milk, curry paste, and brown sugar. </li>\n<li>Remove from heat and ladle into bowls;  serve with green onions, cilantro, basil, and lime wedges.</li>\n</ol>\n</div>
14265	Miso Soup Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/miso_soup_recipe-14265.jpg	http://www.101cookbooks.com/archives/miso-soup-recipe.html
92091	Sweet Chili-Glazed Tofu With Bok Choy - America's Test Kitchen	\N	\N	\N	https://spoonacular.com/recipeImages/sweet-chili-glazed-tofu-with-bok-choy-americas-test-kitchen-2-92091.jpg	http://www.food.com/recipe/sweet-chili-glazed-tofu-with-bok-choy-americas-test-kitchen-424684
18383	Tofu With Snap Peas And Scallions	\N	\N	\N	https://spoonacular.com/recipeImages/tofu-with-snap-peas-and-scallions-2-18383.jpg	http://www.wholeliving.com/132709/tofu-snap-peas-and-scallions
524038	garlic almond kale chips	\N	\N	\N	https://spoonacular.com/recipeImages/garlic-almond-kale-chips-524038.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Arrange two oven racks evenly spaced in upper and lower third of oven. Preheat oven to 325 degrees F. Fit steel blade attachment in food processor and turn on. Drop garlic clove through feed tub and allow to process until finely chopped. Open and add pepper, almonds, oil and salt and process until a thick paste forms. Scrape pepper mixture into a very large bowl. </li>\n<li>Spread around surface of bowl. </li>\n<li>Add kale and toss to combine. Work pepper mixture by hand into the leaves of all the kale to make sure it is evenly coated. </li>\n<li>Spread over two large baking sheets. </li>\n<li>Transfer kale to oven, and bake 10 minutes. Rotate baking sheets top to bottom and front to back. Continue baking, rotating again until crisp, but not brown 5 to 10 minutes more. </li>\n<li>Let cool before eating.</li>\n</ol>\n</div>
544620	Green Ice Pops	\N	\N	\N	https://spoonacular.com/recipeImages/Green-Ice-Pops-544620.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine all the ingredients in a blender or food processor and puree. The kale will remain in tiny pieces -- that is okay.  </li>\n<li>Pour the mixture into ice pop molds and freeze for at least 6 hours and up to 4 months.  Unmold and serve. Note: This also makes a great smoothie if you have any puree leftover. Just pour in a glass and drink up!* Collard green, spinach or other leafy greens work as well</li>\n</ol>\n</div>
761991	Tortellini and Escarole Soup	\N	\N	\N	https://spoonacular.com/recipeImages/tortellini-and-escarole-soup-761991.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In large pot, heat oil over medium heat. </li>\n<li>Add onion and mushrooms and cook, stirring often, until softened, about 3 minutes.</li>\n<li>Add broth and bring to a simmer. </li>\n<li>Add escarole and cook 2 minutes. </li>\n<li>Add cooked tortellini and heat through. </li>\n<li>Serve hot, sprinkled with Parmesan if desired.</li>\n</ol>\n</div>
200703	Dinner Tonight: Spicy Noodles with Tofu (Dou Hua Mian)	\N	\N	\N	https://spoonacular.com/recipeImages/Dinner-Tonight--Spicy-Noodles-with-Tofu-(Dou-Hua-Mian)-200703.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>For the quick pickled carrots: Slice carrots in half lengthwise, and then thinly slice crosswise. </li>\n<li>Place in medium-sized bowl with salt and sugar. Toss well with fingers, and set aside for at least 10 minutes, stirring occasionally. When ready, drain away any liquid that has collected.</li>\n<li>2</li>\n<li>For the noodles: Fill medium-sized saucepan halfway up with water. Bring to simmer, add tofu. Cook until tofu is hot, about 5 minutes. Turn off the heat and drain tofu.</li>\n<li>3</li>\n<li>Bring large pot of water to boil. </li>\n<li>Add dried Chinese flat noodles and cook according to directions on packaging, usually about four minutes. </li>\n<li>Drain noodles when done.</li>\n<li>4</li>\n<li>Meanwhile, combine sesame paste (or tahini), chili oil, light soy sauce, dark soy sauce, and sesame oil in large bowl. </li>\n<li>Whisk until smooth.</li>\n<li>5</li>\n\n<li>Transfer noodles to large bowl with sauce. Toss well. </li>\n<li>Add carrots, tofu, peanuts, and scallions. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
653322	Nummy Noodle Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Nummy-Noodle-Soup-653322.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Grab a large pan and add in your broth, ginger, 2 tbsp of soy, 1 tsp of the sesame oil and the green onions. </li>\n<li>Heat up on medium heat.While the broth is heating up, grab another saute pan and heat up the other tsp of sesame oil and the tsp of soy sauce on medium high heat. When it's good and hot, throw in your cubed tofu. </li>\n<li>Let it cook up for a good 5 to 7 minutes, turning occassionally, until the tofu is golden brown on the outside.Back in your soup pan with the now hot broth, add in the noodles and give them about 5-7 minutes to soak into the soup and get soft.Once the noodles are soft, add in your spinach and give it a spin or two around the pan. Allow a couple minutes for it to wilt completely. Finally, add in your cooked tofu to the soup and give it a minute to heat it up.</li>\n</ol>\n</div>
641057	Curried Butternut Squash and Apple Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Curried-Butternut-Squash-and-Apple-Soup-641057.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Get ready two small saucepans.In one have together 1/2 of the squash and 1/2 of the apple  bring to a simmer, and simmer until just tender when pierced with a fork.In the other, add in the rest of the vegetables along with 1 cup of water  bring this to a rolling boil, reduce to a simmer, and simmer until very very tender. When very tender, remove the vegetables from the heat, and blend these vegetables together (without draining) with the Braggs, spices, sriracha and the additional 1/2 cup water.</li>\n<li>Mix the blended part of the soup with the simmered squash and apples. </li>\n<li>Mix in the cubed tofu, gently re-heat and serve.</li>\n</ol>\n</div>
552202	for Citrusy Green Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/for-Citrusy-Green-Smoothie-552202.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Put the orange juice, kale, spinach, pineapple, agave nectar, and oil in a blender. Puree for 2 to 3 minutes, until the greens are completely liquified. </li>\n<li>Add more juice or a little water if needed. </li>\n<li>Add the ice and process until finely chopped. </li>\n<li>Serve immediately.Variations: Substitute parsley for the spinach, or use a combination of all three greens, to total about 2 1/2 cups. If you like a creamy smoothie, and 1/4 cup coconut milk or a scoop of dairy-free coconut ice cream to the blender along with the greens.</li>\n</ol>\n</div>
15628	Greens, Beans, and Bacon Soup	\N	\N	\N	https://spoonacular.com/recipeImages/greens_beans_and_bacon_soup-15628.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook bacon in a large saucepan over medium-high heat 8 minutes or until crisp. Reserve 2 teaspoons drippings in pan; discard excess drippings. </li>\n<li>Add kale and next 5 ingredients to bacon and drippings in pan. Stir in hot sauce, if desired. Cover and bring to a boil over high heat. Reduce heat, and simmer 25 minutes. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
507177	Linguine with Garlicky Kale and White Beans	\N	\N	\N	https://spoonacular.com/recipeImages/Linguine-with-Garlicky-Kale-and-White-Beans-507177.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook pasta according to package directions, omitting salt and fat. </li>\n<li>Drain in a colander over a bowl, reserving 1/4 cup cooking liquid.</li>\n<li>Heat oil and garlic in a large skillet over medium heat. When garlic begins to sizzle, add 1/2 cup water and kale; cover and cook 5 minutes or until kale is tender, stirring occa­sionally. </li>\n<li>Add beans, 1/2 teaspoon pepper, and salt; cook 1 minute or until thoroughly heated, stirring occasionally. </li>\n<li>Add pasta and reserved 1/4 cup cooking liquid to pan; toss to coat. Sprinkle remaining 1/4 teaspoon pepper over pasta. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
560600	Celery Pear Healthy Green Juice	\N	\N	\N	https://spoonacular.com/recipeImages/Celery-Pear-Healthy-Green-Juice-560600.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Juice all of the ingredients together.Chill and serve.</li>\n</ol>\n</div>
286168	Sauteed Kale	\N	\N	\N	https://spoonacular.com/recipeImages/Sauteed-Kale-286168.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat olive oil in a large saucepan over medium-high heat. </li>\n<li>Add the garlic and cook until soft, but not colored. Raise heat to high, add the stock and kale and toss to combine. Cover and cook for 5 minutes. </li>\n<li>Remove cover and continue to cook, stirring until all the liquid has evaporated. Season with salt and pepper to taste and add vinegar.Per serving: Calories: 178; Total Fat: 11 grams; Saturated Fat: 5 grams; Protein:  6 grams; Total carbohydrates: 18 grams; Sugar: 0 grams Fiber: 5 grams; Cholesterol: 0 milligrams; Sodium: 336 milligrams</li>\n</ol>\n</div>
527883	Healthy Carrot Kale Juice	\N	\N	\N	https://spoonacular.com/recipeImages/Healthy-Carrot-Kale-Juice-527883.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>If you know the ratio you like best: process the carrots and kale through the juicer according to manufacturer instructions into the same container. If using, process the optional ginger and citrus in the juicer, as well.If you don't know your desired ratio, process each of the ingredients individually in the juicer according  to manufacturer instructions into separate containers. </li>\n<li>Mix them according to your preferred taste.Drink the juice immediately, or store in an airtight container with the juice reaching completely to the top so there is no air space (a couple of small canning jars or similar work great). Keep refrigerated until ready to consume. Best if drank within 2-3 days.</li>\n</ol>\n</div>
618083	Apple and Kale Green Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Apple-and-Kale-Green-Smoothie-618083.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add all the ingredients to a blender and whizz until smooth. If you don't have a power blender add the ice cubes to the final juice as you pour it or you may burn out your motor. Slurp and enjoy!</li>\n</ol>\n</div>
13196	Stewed Greens With White Beans	\N	\N	\N	https://spoonacular.com/recipeImages/stewed_greens_with_white_beans-13196.jpg	http://www.biggirlssmallkitchen.com/2009/05/recipe-flash-stewed-greens-with-white.html
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
627519	Pineapple Detox Blast	\N	\N	\N	https://spoonacular.com/recipeImages/Pineapple-Detox-Blast-627519.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add all solid ingredients into tall cup</li>\n<li>Fill to MAX line with liquids</li>\n<li>Blend until smooth, approximately 30 seconds</li>\n</ol>\n</div>
602969	Low Calorie Strawberry Banana Kale Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Low-Calorie-Strawberry-Banana-Kale-Smoothie-602969.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Add all of the ingredients to a high speed blender and blend until smooth! It's that easy. ;)</li>\n</ol>\n</div>
611773	Roasted Beet Noodles with Pesto and Baby Kale	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Beet-Noodles-with-Pesto-and-Baby-Kale-611773.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Set the oven to 425 degrees. On a baking sheet, spread out the beet noodles and coat with cooking spray and season with salt and pepper. </li>\n<li>Bake for 5-10 minutes or until beets are cooked to al dente or your preference in doneness.While the noodles cook, combine all of the ingredients for the pesto into a food processor and pulse until creamy. Taste and adjust, if needed.Once beets are cooked, toss with pesto and the kale. </li>\n<li>Serve.</li>\n</ol>\n</div>
398788	Kale and Pear Green Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-and-Pear-Green-Smoothie-398788.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients into the Vitamix container in the order listed and secure lid.Select Variable Turn machine on and slowly increase speed to Variable 10, then to High.Blend for 45 seconds or until desired consistency is reached.</li>\n</ol>\n</div>
615902	Kale Salad with Goji Berries	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-Salad-with-Goji-Berries-615902.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Tear away and discard kale stems. Rinse the leaves well and shake dry.</li>\n<li>Place leaves in a large bowl with salt and oil. Rub the salt into the leaves. Don't be shy. Just basically crush them until the leaves change to a darker green and wilt.</li>\n<li>Add remaining ingredients and stir with hands again.Refrigerate up to several days.</li>\n</ol>\n</div>
521800	Kale And Citrus Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-And-Citrus-Salad-521800.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Before you begin make sure that your kale is completely dry.  </li>\n<li>Place the kale into a large bowl and drizzle with olive oil and sprinkle with salt.  Gently massage the oil and salt into the kale.  Massage for about three minutes or until all the leaves are coated and seem to be softening up a bit.</li>\n<li>Add in cilantro and lemon juice and toss until well combined.  Gently stir in the oranges and top with pumpkin seeds right before serving.  Enjoy!Makes 4 servings (about 5 cups each)</li>\n</ol>\n</div>
149107	Kale Ginger Daiquiri	\N	\N	\N	https://spoonacular.com/recipeImages/kale-ginger-daiquiri-149107.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>For the Ginger Syrup: </li>\n<li>Combine the sugar, water, and chopped ginger in a small saucepan over high heat, stirring frequently. Bring to a boil then reduce heat to a simmer for 5 minutes. After 5 minutes, remove from heat and let cool to room temperature. Strain to remove the ginger and refrigerate until cool.</li>\n<li>2</li>\n<li>For the Kale Ginger Daiquiri: Fill a cocktail shaker with ice and add rum, lime juice, ginger simple syrup, and kale juice. Shake until well chilled, about 20 seconds. Strain into chilled coupe glass and serve immediately.</li>\n</ol>\n</div>
149117	Kale Pineapple Basil Smash	\N	\N	\N	https://spoonacular.com/recipeImages/kale-pineapple-basil-smash-149117.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Muddle pineapple and 5 basil leaves in cocktail shaker until you've made a pulpy puree. Fill the cocktail shaker with ice, add rye and kale juice. Shake until well chilled, about 20 seconds.</li>\n<li>2</li>\n\n<li>Place remaining 3 basil leaves in an old fashioned glass. Fill glass with ice, strain cocktail into glass, and garnish with basil sprig and pineapple slice. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
497294	Sautéed Garlicky Kale with Onions, Pine Nuts, and Craisins	\N	\N	\N	https://spoonacular.com/recipeImages/Sauted-Garlicky-Kale-with-Onions--Pine-Nuts--and-Craisins-497294.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Soak the craisins in the hot water until plump, about 10 minutes. Make sure to reserve the water in which the craisins are soaked.</li>\n<li>Heat a sauté pan over medium heat. </li>\n<li>Add the pine nuts and cook, stirring often, until the nuts are golden brown and fragrant.</li>\n<li>Add the olive oil to the sauté pan over medium heat. </li>\n<li>Add the onions and cook, stirring often, for 4-5 minutes or until softened and golden brown. </li>\n<li>Add the minced garlic and cook, stirring constantly, for 1 minute. </li>\n<li>Add the kale, plumped craisins, and reserved water  then cook, stirring often, for 3 minutes or until kale has wilted. Toss in the toasted pine nuts then season with sea salt and freshly cracked pepper, to taste. Enjoy.</li>\n</ol>\n</div>
157343	Roasted Spaghetti Squash and Kale	\N	\N	\N	https://spoonacular.com/recipeImages/roasted-spaghetti-squash-with-kale-157343.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 350 degrees. With a sharp knife, VERY CAREFULLY cut the spaghetti squash in half lengthwise. (Stick the knife into the center of the squash, then cut down. Again---be careful!) Scoop out the seeds and pulp in the center and discard. </li>\n<li>Place the squash, cut side up, on a large baking sheet. Rub a little olive oil over the cut surface, then place the pan in the oven for 1 hour or until a fork is easily inserted into the squash. While the squash is cooking, saute the kale: </li>\n<li>Heat 1 tablespoon olive oil in a large skillet over medium-high heat. </li>\n<li>Add the onion to the pan and cook for 3 to 4 minutes, or until starting to turn color. Throw in the kale, sprinkle in some salt and pepper, and stir to saute until the onions are golden about the kale is partly cooked, about 5 minutes. Set aside. When the squash is cooked, use a fork to scrape the stringy squash out of the shell. </li>\n<li>Add the squash to a bowl. </li>\n<li>Mix together 1 tablespoon olive oil with the balsamic vinegar. </li>\n<li>Drizzle it over the squash, sprinkle with salt and pepper, and add the chili powder. Toss to combine. </li>\n<li>Add the squash to individual bowls, then top with a good amount of sauteed kale. You will have squash left over! (Or, you can toss all the kale and half the squash together.)</li>\n</ol>\n</div>
251657	Cheesy Kale Chips with Miso, Garlic and Dulse	\N	\N	\N	https://spoonacular.com/recipeImages/Cheesy-Kale-Chips-with-Miso--Garlic-and-Dulse-251657.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine miso, garlic, salt, nutritional yeast, oil and dulse into a food processor, and process until it forms a smooth paste. Working in batches, place kale into a large mixing bowl.  Massage kale with the seasoned miso paste so that the paste adheres to the kale leaves.  Layer the kale onto a lined food dehydrator tray and dehydrate at 125 F until crispy - about 12 hours.</li>\n</ol>\n</div>
522029	The Cheeky Monkey Smoothie {Ginger, Banana, Leafy Greens}	\N	\N	\N	https://spoonacular.com/recipeImages/The-Cheeky-Monkey-Smoothie-{Ginger--Banana--Leafy-Greens}-522029.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place water in a blender followed by the other ingredients.  Blend until smooth.</li>\n</ol>\n</div>
473051	Raw Kale Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Raw-Kale-Salad-473051.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Chop the kale into thin ribbons (almost like a chiffonade)</li>\n<li>Drizzle the kale with olive oil and sprinkle with salt</li>\n<li>Massage the kale with your hands to soften it, then allow it to sit for 5-10 minutes</li>\n\n<li>Add the lime juice, vinegar, onion and orange</li>\n<li>Allow to marinate for 10 minutes</li>\n\n<li>Serve</li>\n</ol>\n</div>
559063	Sauteed Sesame Kale and Meal Planning	\N	\N	\N	https://spoonacular.com/recipeImages/Sauteed-Sesame-Kale-and-Meal-Planning-559063.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oil in a large pot on medium heat. </li>\n<li>Add minced garlic and saute for 1 minute. </li>\n<li>Add red pepper flakes and continue to cook for 30 more seconds.</li>\n<li>Add kale and water and cover for 5 minutes. </li>\n<li>Remove lid and cook for another minute or two until liquid has evaporated.Season with salt and pepper to taste, stir in vinegar. </li>\n<li>Remove from heat and transfer to a serving bowl. Toss with sesame seeds.</li>\n</ol>\n</div>
759851	Colcannon	\N	\N	\N	https://spoonacular.com/recipeImages/colcannon-759851.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place potatoes in large pot, and cover with water. Bring to a boil, reduce heat to medium, and simmer 15 to 20 minutes, or until very tender. </li>\n<li>Drain, and return to pot. </li>\n<li>Heat potatoes over medium heat 1 to 2 minutes to steam off excess water, and set aside. Meanwhile, bring large pot of salted water to a boil. </li>\n<li>Add kale, and cook 5 minutes. </li>\n<li>Drain, and set aside. </li>\n<li>Heat oil in large skillet over medium heat. </li>\n<li>Add mushrooms and garlic, and sauté 5 to 7 minutes, or until mushrooms are soft and all liquid has evaporated. Stir in kale, and cook 1 minute more, or until hot. Season with salt and pepper. Mash rice milk into potatoes until soft, but still chunky. Fold in kale mixture, and serve.</li>\n</ol>\n</div>
604203	Roasted Garlic Kale Hummus from Let Them Eat Kale	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Garlic-Kale-Hummus-from-Let-Them-Eat-Kale-604203.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 400°F.Wrap the cloves of garlic in foil and place in the oven until soft, 20 minutes. </li>\n<li>Remove from the oven and allow garlic to cool. Peel off the papery skin and add the cloves to a blender or food processor along with the remaining ingredients. Blend until smooth. Note: You can leave small bits of kale leaves in the hummus, if desired, or blend until completely smooth.</li>\n<li>Transfer to a serving bowl and drizzle with olive oil, if desired. </li>\n<li>Serve with veggies, crackers or pita bread, or smear it on your favorite sandwich or wrap.</li>\n</ol>\n</div>
608417	Lucky Leprechaun Juice	\N	\N	\N	https://spoonacular.com/recipeImages/Lucky-Leprechaun-Juice-608417.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse everything well. Juice all the ingredients. Stir or shake to blend. </li>\n<li>Serve over ice.</li>\n</ol>\n</div>
760020	Curly Kale with Caramelized Onions	\N	\N	\N	https://spoonacular.com/recipeImages/curly-kale-with-caramelized-onions-760020.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oil in large pot or Dutch oven over medium heat. </li>\n<li>Add onion, and cook 10 to 15 minutes, or until soft and beginning to brown. </li>\n<li>Add garlic, and cook 1 minute, or until fragrant. Stir in kale and 2 cups water. Cover, and cook 30 minutes, or until kale is tender. Season with salt and pepper. If making ahead, cool, and store in airtight container. Just before serving, reheat kale mixture, then drizzle with vinegar, and sprinkle with almonds.</li>\n</ol>\n</div>
555476	Refreshing Green Juice	\N	\N	\N	https://spoonacular.com/recipeImages/Refreshing-Green-Juice-555476.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Put the ingredients through the juicer according to the manufacturer's instructions.Divide between glass and serve immediately, or store in s sealed container in the refrigerator for up to 2 days.</li>\n</ol>\n</div>
506377	Warm White Bean and Kale Salad with Dried Cranberries and Cashews	\N	\N	\N	https://spoonacular.com/recipeImages/Warm-White-Bean-and-Kale-Salad-with-Dried-Cranberries-and-Cashews-506377.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat a non-stick skillet over medium-high heat. </li>\n<li>Add the kale and a 1/4 cup of water.The water should boil shortly. Toss the kale. It will begin to deepen in color and wilt a little. Once it does add the cranberries. There’s should still be moisture in the pan.Toss and cook for a minute or two until most of the water evaporates.</li>\n<li>Add the beans.Toss, add the vinegar and cook for 1-2 minutes allowing all the flavors to mix.</li>\n<li>Add the cashews and cook for one more minute.</li>\n<li>Remove and EAT!I’m going to be honest, I ate the whole batch for lunch. I couldn’t help myself! I ate half, uploaded the photos, and then ate the other half. I liked it that much! So simple and so tasty! I was planning on it being 2 servings and that’s how I’ll list it, as I think it makes a fabulous side dish. You can always double the nutritional info if you eat it all, like I did. :)Click here for my other ideas using kale</li>\n</ol>\n</div>
14869	Kale With Vermouth Raisins & Pine Nuts	\N	\N	\N	https://spoonacular.com/recipeImages/kale_with_vermouth_raisins_pine_nuts-14869.jpg	http://norecipes.com/blog/2011/01/26/kale-recipe/
14874	Cider-braised Kale With Sweet Cherries	\N	\N	\N	https://spoonacular.com/recipeImages/cider-braised-kale-with-sweet-cherries-2-14874.jpg	http://nourishedkitchen.com/cider-braised-kale-with-sweet-cherries/
14889	Kale with Roasted Peppers and Olives	\N	\N	\N	https://spoonacular.com/recipeImages/kale_with_roasted_peppers_and_olives-14889.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the kale into bite-size pieces, removing any tough stems. Rinse and shake dry.Warm the oil and garlic in a large stockpot over medium-high heat. </li>\n<li>Remove the garlic as soon as it browns (don't let it burn). </li>\n<li>Add the kale and stir-fry 5 minutes. </li>\n<li>Add 1/4 cup water, cover, and cook 8 to 10 minutes or until tender. Uncover and add the sugar, salt, olives, and peppers. Cook over medium-high heat until the liquid has evaporated. Spoon into a serving dish; scatter the garlic over the top. </li>\n<li>Drizzle with the balsamic vinegar. </li>\n<li>Serve warm or at room temperature.</li>\n</ol>\n</div>
14892	Tender Kale With Marinated Kumquats	\N	\N	\N	https://spoonacular.com/recipeImages/tender-kale-with-marinated-kumquats-2-14892.jpg	http://kblog.lunchboxbunch.com/2009/02/recipe-tender-kale-with-marinated.html
14929	Totally Addictive Kale Crisps	\N	\N	\N	https://spoonacular.com/recipeImages/totally_addictive_kale_crisps-14929.jpg	http://www.mynewroots.blogspot.com/2010/07/totally-addictive-kale-crisps.html
14942	Crunchy Kale And Coconut Bowl	\N	\N	\N	https://spoonacular.com/recipeImages/crunchy-kale-and-coconut-bowl-2-14942.jpg	http://www.joythebaker.com/blog/2012/01/crunchy-kale-and-coconut-bowl/
14991	Parsley, Kale, And Berry Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/parsley-kale-and-berry-smoothie-2-14991.jpg	http://www.bonappetit.com/recipes/2012/04/parsley-kale-and-berry-smoothie
14996	Simply Sautéed Kale	\N	\N	\N	https://spoonacular.com/recipeImages/simply_sauted_kale-14996.jpg	http://www.doctoroz.com/videos/simply-saut-ed-kale
15006	Wheat Berries With Charred Onions And Kale	\N	\N	\N	https://spoonacular.com/recipeImages/wheat_berries_with_charred_onions_and_kale-15006.jpg	http://www.bonappetit.com/recipes/2012/05/wheat-berries-with-charred-onions-and-kale
15010	Garlicky Kale Crostini	\N	\N	\N	https://spoonacular.com/recipeImages/garlicky-kale-crostini-2-15010.jpg	http://www.marthastewart.com/313958/garlicky-kale-crostini
608950	Crispy Baked Kale Chips + Quick Curry Ketchup	\N	\N	\N	https://spoonacular.com/recipeImages/Crispy-Baked-Kale-Chips-+-Quick-Curry-Ketchup-608950.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 325 degrees and line two rimmed sheet pans with parchment paper.Strip the leaves from the stems. Wash and dry the leaves thoroughly and tear into medium size pieces.</li>\n<li>Add the kale to a bowl along with the olive oil and rub the oil into the kale so each piece coated well. Arrange kale on the two sheet pans in an even layer, do not over crowd, and bake for 8 minutes. Rotate the pans and continue to bake for 6 to 8 minutes more. Watch carefully they can burn easily.</li>\n<li>Remove and let cool for a couple of minutes.FOR THE CURRY KETCHUP: In a small bowl combine the ketchup, curry, onion flakes, turmeric and garlic powder. Stir well and let sit while the kale chips are baking.</li>\n</ol>\n</div>
96958	Fruity Green Juice	\N	\N	\N	https://spoonacular.com/recipeImages/fruity-green-juice-2-96958.png	http://www.food.com/recipe/fruity-green-juice-359521
621273	Kale, Apple, and Ginger Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Kale--Apple--and-Ginger-Smoothie-621273.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Freeze the apple, cucumber, lemon, and ginger. </li>\n<li>Add the frozen mixture to a high-powered blender along with the kale and chia seeds (if using). </li>\n<li>Add enough water to get it moving and blend on high. </li>\n<li>Add additional water to reach desired consistency. </li>\n<li>Serve right away.</li>\n</ol>\n</div>
502480	Garlicky Kale, Tomato, and Onion Cauliflower “Hash”	\N	\N	\N	https://spoonacular.com/recipeImages/Garlicky-Kale--Tomato--and-Onion-Cauliflower-Hash-502480.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat coconut oil over medium high heat in a skillet. (cast iron is preferable)Once skillet is hot, add the kale greens and onion and saute for 2 minutes.</li>\n<li>Add the tomatoes and garlic and cook for another 2 minutes.  Pepper to taste.</li>\n<li>Remove vegetables from skillet and set aside.  </li>\n<li>Add a bit more coconut oil to the pan.</li>\n<li>Add the cauliflower rice and cook over medium high heat until browned and slightly charred.Divide between 4 plates and top with veggies.</li>\n</ol>\n</div>
15076	Kale-apple Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/kale-apple_smoothie-15076.jpg	http://www.realsimple.com/food-recipes/browse-all-recipes/kale-apple-smoothie-00000000050666/index.html
506620	Sour Cream and Onion Kale Chips	\N	\N	\N	https://spoonacular.com/recipeImages/Sour-Cream-and-Onion-Kale-Chips-506620.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>If using oven: preheat to 250°F. If using dehydrator: preheat to 115°F.</li>\n<li>Combine the soaked cashews, onion powder, garlic powder, salt, vinegar, and water in a mini food processor or blender and process until smooth, scraping down the sides or using the tamper as necessary.In a large bowl, use your hands to massage the cashew-mixture into the kale leaves until evenly coated.OVEN METHOD: Line a baking sheet with parchment paper, then spread the kale chips across. </li>\n<li>Bake 1½ to 2 hours, or until leaves are crisp but not burnt, tossing halfway between baking time. Enjoy immediately.DEHYDRATOR METHOD: </li>\n<li>Spread kale chips onto 4 mesh dehydrator sheets, and dehydrate for 10-12 hours or until crispy.</li>\n</ol>\n</div>
15155	Raw Kale Salad With Citrus Dressing	\N	\N	\N	https://spoonacular.com/recipeImages/raw_kale_salad_with_citrus_dressing-15155.jpg	http://pamelasalzman.com/raw-kale-salad-with-citrus-dressing/
576331	Easy Miso Soup Without Dashi	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Miso-Soup-Without-Dashi-576331.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Put the vegetable broth in a pot set to medium high heat and bring to a boil.  Reduce heat to low and bring to a simmer.  </li>\n<li>Add in the green onions and kale and cook for about 5 minutes.  </li>\n<li>Add in the tofu and continue to simmer for another 5 minutes.</li>\n<li>Remove pot from the heat.  Spoon the miso paste into a bowl and add a ladle of the soup (about 1/2 cup). </li>\n<li>Whisk to mix it and dissolve the miso paste.</li>\n<li>Add it into the pot and stir well.</li>\n<li>Add salt if desired.</li>\n</ol>\n</div>
15194	Kale, Apple & Lemon Juice	\N	\N	\N	https://spoonacular.com/recipeImages/kale_apple_lemon_juice-15194.jpg	http://www.greenkitchenstories.com/big-love-december/
15206	Blueberry Banana Kale Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/blueberry_banana_kale_smoothie-15206.jpg	http://ohsheglows.com/2009/01/28/blueberry-banana-kale-smoothie/
666496	Kale and Banana Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-and-Banana-Smoothie-666496.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the banana, kale, soy milk, flax seeds, and maple syrup into a blender. Cover, and puree until smooth. </li>\n<li>Serve over ice.Kitchen-Friendly View</li>\n</ol>\n</div>
666514	Dr. Oz's Vitamin Cocktail	\N	\N	\N	https://spoonacular.com/recipeImages/Dr--Ozs-Vitamin-Cocktail-666514.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
15266	Massaged Kale Salad Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/massaged_kale_salad_recipe-15266.jpg	http://www.foodrepublic.com/2011/12/05/massaged-kale-salad-recipe
15279	Pan-cooked Summer Squash With Tomatoes & Kale	\N	\N	\N	https://spoonacular.com/recipeImages/pan-cooked_summer_squash_with_tomatoes_kale-15279.jpg	http://www.domesticdivasblog.com/2011/08/meatless-monday-pan-cooked-summer.html
15395	Matchstick Pasta Recipe	\N	\N	\N	https://spoonacular.com/recipeImages/Matchstick-Pasta-Recipe-15395.jpg	http://www.101cookbooks.com/archives/matchstick-pasta-recipe.html
253015	Baby Kale Strawberry Salad with Rosemary Balsamic Vinaigrette	\N	\N	\N	https://spoonacular.com/recipeImages/Baby-Kale-Strawberry-Salad-with-Rosemary-Balsamic-Vinaigrette-253015.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Make the vinaigrette: </li>\n<li>Add the balsamic vinegar, shallot, rosemary, salt, and pepper to a small mixing bowl. While whisking vigorously, add enough of the olive oil in a slow drizzle until an well combined emulsion forms, about 15 seconds. You might not use all the oil.Make the salad: </li>\n<li>Add the baby kale, cucumber, strawberries, and almonds to a large salad bowl. Toss to combine.</li>\n<li>Serve with the freshly whisked vinaigrette on the side.</li>\n</ol>\n</div>
539733	Green Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Green-Smoothie-539733.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Put the apple or pear and 1/2 cup filtered water in the bottom of your blender or Vita-</li>\n<li>Mix.  Process until smooth and all traces of peel are gone.  </li>\n<li>Add spinach, kale, parsley, mint leaves, and process again.  </li>\n<li>Add more water if necessary to reach desired consistency.</li>\n</ol>\n</div>
15497	Blueberry Banana Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/blueberry_banana_smoothie-15497.jpg	http://ohsheglows.com/2009/01/29/green-power/
552084	Holly's Green Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Hollys-Green-Smoothie-552084.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Using a high speed blender (I love my Blendtec), blend until super smooth. Eat with a spoon.</li>\n</ol>\n</div>
245088	Sautéed Kale with Toasted Cashews	\N	\N	\N	https://spoonacular.com/recipeImages/Sauted-Kale-with-Toasted-Cashews-245088.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1 In a large, shallow sauté pan, heat on medium high.  </li>\n<li>Add the cashews and spread out in an even layer.  Toast, stirring occasionally until lightly browned here and there, and you smell the aroma of the toasted cashews.  </li>\n<li>Remove from the pan to a bowl.2 </li>\n<li>Add a couple tablespoons of olive oil to the pan.  </li>\n<li>Heat on medium.  </li>\n<li>Add the onions and cook until translucent, about 5 minutes.3 Increase the heat to high/medium high.  </li>\n<li>Add a couple tablespoons more of olive oil to the pan.  </li>\n<li>Add the red pepper flakes.  </li>\n<li>Add the roughly chopped kale. Use tongs to turn the kale leaves over so that they are all coated with olive oil. Cook just a couple minutes, turning the leaves over often, until they are just beginning to wilt.  Sprinkle on lemon juice and salt.  </li>\n<li>Remove from heat.  Stir in the cashews.Taste and add more salt and lemon juice to taste.</li>\n</ol>\n</div>
482698	Green Juice	\N	\N	\N	https://spoonacular.com/recipeImages/Green-Juice-482698.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients in a high quality blender and blend on high until juice forms.Feel free to add more/less water or ice depending on desired consistency.</li>\n</ol>\n</div>
609705	Peachy Pineapple Kale Smoothie	\N	\N	\N	https://spoonacular.com/recipeImages/Peachy-Pineapple-Kale-Smoothie-609705.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place all ingredients in a blender and blend until smooth.</li>\n</ol>\n</div>
573147	Kale Fried Rice	\N	\N	\N	https://spoonacular.com/recipeImages/Kale-Fried-Rice-573147.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Cut the kale leaves in half lengthwise and then cut crosswise into very thin ribbons (chiffonade). Steam the kale for 7 minutes. Meanwhile, heat the vegetable oil in a large saucepan over medium-low heat. </li>\n<li>Add the garlic and cook, stirring, for 2 minutes, being careful not to brown the garlic. Raise the heat to medium and add the steamed kale and scallions. Cook for 2 minutes and then add the rice and cook for another 2 minutes, stirring. </li>\n<li>Add the soy sauce and cook for 30 seconds more.</li>\n</ol>\n</div>
8973	Roasted Potatoes, Mushrooms And Rocket	\N	\N	\N	https://spoonacular.com/recipeImages/roasted-potatoes-mushrooms-and-rocket-2-8973.jpg	http://saladpride.blogspot.com/2011/02/roasted-potatoes-mushrooms-and-rocket.html
25435	Zucchini-mushroom Pizza	\N	\N	\N	https://spoonacular.com/recipeImages/zucchini-mushroom_pizza-25435.jpg	http://www.myrecipes.com/recipe/zucchini-mushroom-pizza-10000000524374/
222072	Macaroni cheese with mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/Macaroni-cheese-with-mushrooms-222072.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Fill a large sauté pan with boiling water. Tip in the macaroni and cook according to the pack instructions. (It may take slightly longer than suggested). Meanwhile, trim, wash and slice the leeks, quarter the mushrooms and roughly chop the tomatoes.</li>\n<li>Drain the pasta and keep warm. </li>\n<li>Heat the oil in the pan. </li>\n<li>Add the leeks and mushrooms and fry for 4-6 mins until the leeks are tender. Toss in the tomatoes at the last minute. Season with salt if you want to and black pepper. Stir in the macaroni and let it warm through, then crumble the cheese over.</li>\n</ol>\n</div>
582561	Oven Baked Spanish Rice	\N	\N	\N	https://spoonacular.com/recipeImages/Oven-Baked-Spanish-Rice-582561.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 350 degrees</li>\n<li>In a 9×13 pan combine all ingredients and stir so that everything is evenly distributed</li>\n<li>Cover tightly with foil</li>\n\n<li>Place carefully in oven and bake for 1 hour</li>\n\n<li>Remove from oven and leave covered until ready to serve</li>\n<li>Onions and garlic may settle on the top, Fluff with a fork to mix them evenly into rice</li>\n</ol>\n</div>
9363	White Mushrooms, Beetroots And Edamame Beans	\N	\N	\N	https://spoonacular.com/recipeImages/white-mushrooms-beetroots-and-edamame-beans-2-9363.jpg	http://saladpride.blogspot.com/2011/07/white-mushrooms-beetroots-and-edamame.html
272024	Easy Winter Vegetable Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Winter-Vegetable-Salad-272024.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>CUT Brussels sprouts in half; mix with remaining ingredients.  Cover. REFRIGERATE at least 3 hours or up to 24 hours.</li>\n</ol>\n</div>
91868	Baby Bok Choy Sauté With Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/baby-bok-choy-saut-eacute-with-mushrooms-2-91868.jpg	http://www.food.com/recipe/baby-bok-choy-saut-with-mushrooms-272131
173946	Mason Jar Salad Shakers	\N	\N	\N	https://spoonacular.com/recipeImages/Mason-Jar-Salad-Shakers-173946.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In 16-oz mason jar, layer ingredients in order listed. Cover with lid. Refrigerate until ready to eat, up to 4 days.</li>\n</ol>\n</div>
206726	Mejadra, Rice with Lentils	\N	\N	\N	https://spoonacular.com/recipeImages/Mejadra--Rice-with-Lentils-206726.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Cook the lentils in water until they soften, about 30 minutes. </li>\n<li>Drain and set aside.</li>\n<li>2</li>\n\n<li>Heat the olive oil in a saucepan and fry the onions until golden. </li>\n<li>Add the lentils and season with cumin, salt, and pepper. </li>\n<li>Add the rice and stir-fry for a minute or two until the rice grains turn opaque.</li>\n<li>3</li>\n\n<li>Add 3 cups boiling water, bring to a boil, lower the heat, cover and cook for 20 minutes. Turn off the heat, fluff with a fork, cover, and let rest for 10 minutes before serving.</li>\n<li>4</li>\n<li>Before serving, fry the onion rings in oil until brown and crisp and arrange over the mejadra.</li>\n</ol>\n</div>
26746	White Rice, Sweet Potato And Tomatoes	\N	\N	\N	https://spoonacular.com/recipeImages/white-rice-sweet-potato-and-tomatoes-2-26746.jpg	http://saladpride.blogspot.com/2011/03/white-rice-sweet-potato-and-tomaotes.html
588931	Back from Mexico and arroz con leche | Simone's KitchenSimone's Kitchen	\N	\N	\N	https://spoonacular.com/recipeImages/Back-from-Mexico-and-arroz-con-leche---Simones-KitchenSimones-Kitchen-588931.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a not too small pan you put the rice, the cinnamon, the star anis, salt and water and bring this slowly to the boil. Cover the pan with a lid and put the heat low. Leave to simmer gently until all fluids are absorped (about 15 mins)</li>\n<li>Pour the Alpro Almonddrink unsweetened and the Alpro soydrink on top and leave to heat until it begins to bubble. Stir through the sugar and add the dried cranberries. Leave to simmer uncovered for about a minute or 10-15 and stir occassionaly.Turn of the heat and leave to cool a little bit. To serve, sprinkle with some ground cinnamon.</li>\n<li>Serve warm or cold</li>\n</ol>\n</div>
666056	poornam boorelu , how to make poornalu / poornam boorelu (burelu)	\N	\N	\N	https://spoonacular.com/recipeImages/poornam-boorelu---how-to-make-poornalu---poornam-boorelu-(burelu)-666056.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Wash and Soak seperately urad dal and rice in water for 4 to 5 hours</li>\n<li>To a large bowl, add grated jaggery and 45 ml of water (about 3 tbsps). Melt jaggery by placing this bowl on a low flame or microwave for 5 minutes. keep this aside.Cook channa dal with water until just cooked. Do not overcook and make mushy. The dal must still hold shape and when mashed it must turn soft. </li>\n<li>Drain off the dal in a colander.Mash or blend the dal to smooth in a blender.If using sugar, add it to the mashed dal. If using jaggery , filter the prepared syrup to the mashed dal. Discard the debris. </li>\n<li>Mix them well. </li>\n<li>Add fresh coconut and cardamom powder.Cook till the water evaporates completely and the dal looks dry and comes together like a mass.When it cools down, make 14 to 16 equal sized balls</li>\n\n<li>Drain the rice in a colander. There must be no dripping water.</li>\n<li>Add urad dal, little salt and little water to a blender,blend till frothy or smooth. </li>\n<li>Adding too much water will make the batter runny, so use as needed only</li>\n\n<li>Add rice to the batter and repeat blending. Keep the batter slightly coarse , this helps the outer covering to turn crusty. The consistency should be like thick dosa batter</li>\n\n<li>Heat oil for deep frying till hot, drop one ball each time to the batter, take a tablespoon and coat it well and swipe off the excess drippings and drop it in the oil.Fry till golden.Fry them in batches till you finish off all the balls.Repeat frying for a min or two for extra crust.You can make punugulu with the left over batter.</li>\n</ol>\n</div>
76451	Farmers Market Mushroom Tacos	\N	\N	\N	https://spoonacular.com/recipeImages/farmers_market_mushroom_tacos-76451.jpg	http://www.fronterafiesta.com/cook/tacos-enchiladas-tamales-tostadas/549-farmers-market-mushroom-tacos.html
109300	Garlic-spiked Broccoli and Mushrooms With Rosemary	\N	\N	\N	https://spoonacular.com/recipeImages/garlic-spiked-broccoli-and-mushrooms-with-rosemary-2-109300.jpg	http://www.food.com/recipe/garlic-spiked-broccoli-and-mushrooms-with-rosemary-117562
11187	Braised Napa Cabbage With Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/braised-napa-cabbage-with-mushrooms-2-11187.jpg	http://userealbutter.com/2007/10/16/braised-napa-cabbage-recipe/
11309	White Cabbage, Watercress And Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/white-cabbage-watercress-and-mushrooms-2-11309.jpg	http://saladpride.blogspot.com/2011/05/white-cabbage-watercress-and-mushrooms.html
109786	Garlic-Spiked Broccoli and Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/garlic-spiked-broccoli-and-mushrooms-2-109786.jpg	http://www.food.com/recipe/garlic-spiked-broccoli-and-mushrooms-65861
77127	Basil & Garlic Tortellini	\N	\N	\N	https://spoonacular.com/recipeImages/basil-garlic-tortellini-2-77127.jpg	http://www.mccormick.com/Recipes/Main-Dish/Basil-Garlic-Tortellini.aspx
421678	Italian Style Green Beans	\N	\N	\N	https://spoonacular.com/recipeImages/Italian-Style-Green-Beans-421678.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place beans in a large saucepan and cover with water. Bring to a boil. Cook, uncovered, for 8-10 minutes or until crisp-tender; drain.</li>\n<li>In a large nonstick skillet, saute mushrooms in oil until crisp-tender; stir in the beans. Sprinkle with basil, lemon peel, sugar, salt and pepper. Cook and stir until combined.</li>\n</ol>\n</div>
487282	idli – how to make soft idlis (step by step idli )	\N	\N	\N	https://spoonacular.com/recipeImages/idli--how-to-make-soft-idlis-(step-by-step-idli-)-487282.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>pick and wash both the rice and urad dal.soak the rice and poha in water for 4-5 hours.soak the urad dal with methi seeds separately for 4-5 hours.drain the soaked urad dal. reserve the water.grind the urad dal, methi seed with some of the reserved water till you get a smooth and fluffy batter.grind the rice to make a smooth batter.mix both the batters together in a large bowl or pan. add salt and mix well.cover and let the batter ferment for 8-9 hours.after the fermentation process is over, the batter will become double in size and rise.gently mix the batter.grease the idli moulds.pour the batter in the moulds steam the idlis in a pressure cooker or steamer.if using pressure cooker remove the vent weight.whistle.steam for 10-12 mins or until the idlis are done.remaining batter can be stored in the refrigerator.serve the steaming hot idlis with coconut chutney and sambar.</li>\n</ol>\n</div>
143686	Quick Mushroom Barley Pilaf Ww	\N	\N	\N	https://spoonacular.com/recipeImages/quick-mushroom-barley-pilaf-ww-2-143686.png	http://www.food.com/recipe/quick-mushroom-barley-pilaf-ww-319886
209453	Dinner Tonight: Bucatini con Funghi	\N	\N	\N	https://spoonacular.com/recipeImages/Dinner-Tonight--Bucatini-con-Funghi-209453.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>Bring a large pot of salted water to boil.  </li>\n<li>Heat oil in a large skillet over low heat and add the garlic, cooking gently for a minute or so.</li>\n<li>2</li>\n\n<li>Add the mushrooms (wiped with a damp cloth first), season with salt and pepper, then cover and cook over low heat, 5-8 minutes until soft. They should give out enough moisture to cook themselves.</li>\n<li>3</li>\n<li>In the meantime, cook the bucatini until al dente.  When the mushrooms are finished, add lemon juice and parsley, then stir in the drained pasta.  </li>\n<li>Mix thoroughly and finish with a splash of olive oil.</li>\n</ol>\n</div>
111196	Sauteed Broccoli, Cauliflower and Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/sauteed-broccoli-cauliflower-and-mushrooms-2-111196.jpg	http://www.food.com/recipe/sauteed-broccoli-cauliflower-and-mushrooms-444307
668417	Slow Cooker Vegan Coconut Rice Pudding with Mangoes and Pistachio Nuts	\N	\N	\N	https://spoonacular.com/recipeImages/Slow-Cooker-Vegan-Coconut-Rice-Pudding-with-Mangoes-and-Pistachio-Nuts-668417.jpg	http://www.thefoodiecorner.gr/en/slow-cooker-en/slow-cooker-vegan-coconut-rice-pudding-mango-pistachio-recipe/
46032	Fragrant Vegetarian Dumplings	\N	\N	\N	https://spoonacular.com/recipeImages/fragrant-vegetarian-dumplings-2-46032.jpg	http://www.cookstr.com/recipes/fragrant-vegetarian-dumplings
406548	Lemon Garlic Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/Lemon-Garlic-Mushrooms-406548.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a small bowl, combine the first five ingredients; set aside. Grill mushrooms, covered, over medium-hot heat for 5 minutes. </li>\n<li>Brush generously with lemon mixture. Turn mushrooms; grill 5-8 minutes longer or until tender. </li>\n<li>Brush with remaining lemon mixture before serving.</li>\n</ol>\n</div>
423044	Mark's Marinated Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/Marks-Marinated-Mushrooms-423044.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large saucepan, combine all ingredients. Bring to a boil over medium-high heat. Cook, uncovered, for 6 minutes, stirring once. Cool to room temperature. </li>\n<li>Transfer to a large bowl; cover and refrigerate overnight.</li>\n</ol>\n</div>
488605	idli with idli rava, how to make idli with idli rava	\N	\N	\N	https://spoonacular.com/recipeImages/idli-with-idli-rava--how-to-make-idli-with-idli-rava-488605.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>soak the cream of rice in enough water for 4-5 hours.in another bowl or pan, soak the urad dal, poha, and methi seeds in enough water 4-5 hours.drain the water from the urad dal and keep it aside.we will use some of this water for grinding the idlis.drain the water from the idli rava and discard.in a wet grinder, add the idli rava, urad dal, methi seeds, poha.add some of the urad dal strained water and begun to grind.if the batter appears too thick, add some water.grind to a smooth batter.pour in a non reactive deep pan or pot to give room for fermentation & rising of the batter.add salt and stir well.cover with a lid and keep the batter in a warm place for 7-8 hours.the next day the batter would have fermented and risen.grease or brush the idli moulds with oil.keep a pan or steamer on the stove with some water.stir the batter gently.pour the batter in the idli moulds.by now the water must have begin boiling in the pan.place the idli stand in the pan.cover with a lid and steam the idlis.if using a pressure cooker, don't put the vent weight/whistle on the cooker's lid.steam for 10-12 minutes till a tooth pick inserted in the idli comes out clean.when the idlis are steaming, you can prepare the chutney.serve hot and steaming idlis with chutney or sambar accompanied with some indian chai or filter coffee</li>\n</ol>\n</div>
111874	Cauliflower With Mushrooms and Onions	\N	\N	\N	https://spoonacular.com/recipeImages/cauliflower-with-mushrooms-and-onions-2-111874.jpg	http://www.food.com/recipe/cauliflower-with-mushrooms-and-onions-110805
570630	Mike’s Asparagus Alfredo	\N	\N	\N	https://spoonacular.com/recipeImages/Mikes-Asparagus-Alfredo-570630.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Chop up your mushrooms and asparagus.Fry them in a little olive oil to get the moisture out of the mushrooms and to tender up the asparagus.</li>\n<li>Add to the sauce and heat a little more.Make your pasta.And serve!</li>\n</ol>\n</div>
636292	Brown Rice Mushroom Pilaf	\N	\N	\N	https://spoonacular.com/recipeImages/Brown-Rice-Mushroom-Pilaf-636292.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat oil in a large saucepan over medium heat. Saut chopped onion and sliced mushrooms for 5 minutes.</li>\n<li>Add brown rice and stir to coat in oil.</li>\n<li>Add water.Bring to a boil, then simmer for 30 minutes. </li>\n<li>Remove from heat and cover with a lid. </li>\n<li>Let it rest until all liquid is absorbed.</li>\n</ol>\n</div>
30979	Perfumed Adzuki Beans And Rice With Bourbon And Bacon	\N	\N	\N	https://spoonacular.com/recipeImages/perfumed_adzuki_beans_and_rice_with_bourbon_and_bacon-30979.jpg	http://www.food52.com/recipes/10619_perfumed_adzuki_beans_and_rice_with_bourbon_and_bacon
96535	Mushroom Salad	\N	\N	\N	https://spoonacular.com/recipeImages/mushroom-salad-2-96535.jpg	http://www.food.com/recipe/mushroom-salad-90440
522589	Garlic mushrooms and broccoli	\N	\N	\N	https://spoonacular.com/recipeImages/Garlic-mushrooms-and-broccoli-522589.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Blanch the broccoli florets. Dump in an ice bath and drain well (see What is blanching and how is it different from parboiling?).Thinly slice the mushrooms.</li>\n<li>Heat the olive oil in a wok or frying pan.</li>\n<li>Add the sliced onion and cook over medium heat for about two minutes until slightly softened.Turn up the heat. </li>\n<li>Add the garlic. Cook, stirring, just until fragrant.</li>\n<li>Add the mushrooms. Season with salt and pepper. Stir fry for about 30 seconds.</li>\n<li>Add the broccoli florets. Season with more salt and pepper. Continue stir frying just until the florets are heated through.</li>\n</ol>\n</div>
14873	Wild Rice, Chestnuts Mushrooms And Kale	\N	\N	\N	https://spoonacular.com/recipeImages/wild_rice_chestnuts_mushrooms_and_kale-14873.jpg	http://saladpride.blogspot.com/2010/11/wild-rice-chestnuts-mushrooms-and-kale.html
604744	Beer battered mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/Beer-battered-mushrooms-604744.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine the flour, beer, spices and seasonings in a large bowl, and whisk well until smooth.</li>\n<li>Heat between half an inch and one inch of oil over a medium heat in a large pan or wok. Drip a tiny amount of batter into the oil, and when it starts sizzling, you can add your mushrooms.You will probably need to cook your mushrooms in two batches to avoid overcrowding your pan. Dip a mushroom in the batter, making sure it is fully covered, and then carefully drop it into the oil. The oil should audibly sizzle. Repeat with the rest of the first batch of mushrooms.After a couple of minutes, use a slotted spoon to flip the mushrooms over. Continue cooking, turning as necessary, for around 5 minutes, until the batter is a deep golden colour. </li>\n<li>Remove the mushrooms from the oil, and transfer to a plate lined with kitchen paper.Repeat with the other batch of mushrooms.Finish the mushrooms with a bit more salt if they need it (mine did), and serve with your choice of dipping sauce.</li>\n</ol>\n</div>
227950	Avocado and Goats Cheese Stuffed Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/Avocado-and-Goats-Cheese-Stuffed-Mushrooms-227950.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat the oven to 230c / 210c fan / 450f / gas mark   Peel the mushrooms, season with black pepper and set aside. Wilt the spinach. Rinse it in a colander, then pour a kettleful of boiling water over it to wilt it. Finish with cold water to cool it, then squeeze as much water out as possible, then chop and spread over the mushrooms. Sprinkle some nuts over each mushroom, then top with slices of avocado and some goats cheese. Season with pepper and bake for 15 minutes until the mushroom is cooked. </li>\n<li>Serve with a green salad or vegetables. Enjoy!</li>\n</ol>\n</div>
96904	Saute Those Fiddlehead Ferns	\N	\N	\N	https://spoonacular.com/recipeImages/saute-those-fiddlehead-ferns-2-96904.jpg	http://www.food.com/recipe/saute-those-fiddlehead-ferns-124494
523011	Tinapa (smoked fish) fried rice	\N	\N	\N	https://spoonacular.com/recipeImages/Tinapa-(smoked-fish)-fried-rice-523011.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat the cooking in a wok or frying pan.</li>\n<li>Add the flaked tinapa and garlic; cook until lightly browned and crisp.</li>\n<li>Add the onion slices and the rice. Sprinkle with salt, pepper and chili flakes, if using. Cook, stirring often, until the rice is heated through.</li>\n<li>Serve hot on its own or with your favorite meat, seafood or vegetable dish. I enjoyed my tinapa rice with oysters with adobo sauce.</li>\n</ol>\n</div>
113765	Turkish Leeks	\N	\N	\N	https://spoonacular.com/recipeImages/turkish-leeks-2-113765.png	http://www.food.com/recipe/turkish-leeks-21443
392324	Tangy Marinated Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/Tangy-Marinated-Mushrooms-392324.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a saucepan over medium heat, combine the vinegar, water, bay leaves, sugar, salt and garlic. </li>\n<li>Add mushrooms. Bring to a boil; boil for 2 minutes. Cool slightly. </li>\n<li>Transfer to a bowl; cover and refrigerate for 8 hours or overnight. Discard bay leaves before serving.</li>\n</ol>\n</div>
540657	Gyudon Bento	\N	\N	\N	https://spoonacular.com/recipeImages/Gyudon-Bento-540657.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Fill up half of bento box with Japanese rice. </li>\n<li>Let it cool so that hot/warm rice will not warm up other cool food.Reheat leftover gyudon in a frying pan until it's warm thoroughly.Wash lettuce and pat dry. </li>\n<li>Place nicely in the bento box.Pack cooled gyudon on in a silicone cup and put in bento box.Put Tamagoyaki in the bento box.Put mixed vegetable in a silicone cup and microwave to defrost. Put it in bento box after cooled.Sprinkle furikake on top of rice.Cool down completely before closing the bento box.</li>\n</ol>\n</div>
540716	Sweet Onion Takikomi Gohan	\N	\N	\N	https://spoonacular.com/recipeImages/Sweet-Onion-Takikomi-Gohan-540716.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse rice until water is almost clear. </li>\n<li>Drain well in a fine mesh sieve and leave it for at least 30 minutes. </li>\n<li>Place rice in the rice cooker.Slice onion with a slicer and soak in cold water for 5 minutes.In a non-stick frying pan, heat oil over medium heat and sauté onion until they are soft.</li>\n<li>Add Seasonings and sauté more until the sauce gets a little thicken.</li>\n<li>Pour the onion and sauce over the rice in the rice cooker. Then add the water up to “2”, the specified level marked in the inner bowl. Switch on.When rice is cooked, wait 10 minutes before you open the rice cooker. </li>\n<li>Serve rice and garnish Kaiware Daikon.</li>\n</ol>\n</div>
98352	Artichoke Tossed Salad (Italian salad dressing)	\N	\N	\N	https://spoonacular.com/recipeImages/artichoke-tossed-salad-2-98352.png	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a salad bowl, combine the lettuce, artichokes, mushrooms and olives. </li>\n<li>Drizzle with salad dressing; toss to coat. </li>\n<li>Serve immediately.</li>\n</ol>\n</div>
114860	Asparagus and Mushroom Saute With Cilantro	\N	\N	\N	https://spoonacular.com/recipeImages/asparagus-and-mushroom-saute-with-cilantro-2-114860.jpg	http://www.food.com/recipe/asparagus-and-mushroom-saute-with-cilantro-120408
115048	Springtime Asparagus	\N	\N	\N	https://spoonacular.com/recipeImages/springtime-asparagus-2-115048.jpg	http://www.food.com/recipe/springtime-asparagus-89377
82590	Mushroom Ketchup	\N	\N	\N	https://spoonacular.com/recipeImages/mushroom-ketchup-2-82590.jpg	http://www.cookstr.com/recipes/mushroom-ketchup
607160	Poornam Boorelu - How to make Poornalu - Suzhiyam - Step by Step - Varalakshmi Vratham Naivedyam s	\N	\N	\N	https://spoonacular.com/recipeImages/Poornam-Boorelu---How-to-make-Poornalu---Suzhiyam---Step-by-Step---Varalakshmi-Vratham-Naivedyam-s-607160.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>>Wash and soak the urad dal and rice overnight or 4 - 6 hours.</li>\n<li>Drain the water and grind the urad dal and rice to a smooth paste by adding little water.It should be like a thick dosa batter.</li>\n<li>Add a pinch of salt to and mix well.Keep it aside.Wash and pressure cook the chana dal with just enough water to cover the dal. It should be cooked and hold shape. You can also cook the dal in a vessel.</li>\n<li>Drain all the water completely. Make sure that there is no water.</li>\n<li>Let it cool.Grind the dal into a powder and set aside.</li>\n<li>Combine the jaggery and little water in a pan and let the dissolves completely.</li>\n<li>Add the ground chana dal, cardamom powder and coconut to the melted jaggery.</li>\n<li>Mix everything until combined.Cool until the mixture thickens.When the mixture becomes like a dough, switch off the flame.</li>\n<li>Let the mixture cool completely.Divide the mixture into 28 - 30 round shape balls and set aside.</li>\n<li>Heat enough oil in a pan for deep frying.Then dip the each chana dal ball in the prepared urad dal batter and let it coat evenly.Drop them gently in the hot oil. Deep fry till golden brown color.</li>\n<li>Drain them on paper towels and serve.</li>\n</ol>\n</div>
394275	Roasted Pepper Spinach Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Roasted-Pepper-Spinach-Salad-394275.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Broil the red pepper 4 in. from the heat until skin blisters, about 2 minutes. With tongs, rotate pepper a quarter turn. Broil and rotate until all sides are blistered and blackened. Immediately place pepper in a bowl; cover and let stand for 15-20 minutes.</li>\n<li>Peel off and discard charred pepper skin. </li>\n<li>Remove stem and seeds. Finely slice pepper; place in a bowl. </li>\n<li>Add mushrooms, zucchini and vinaigrette; marinate for at least 10 minutes. </li>\n<li>Place spinach in a serving bowl; add vegetables and toss gently to coat.</li>\n</ol>\n</div>
377980	Grilled Corn Medley	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-Corn-Medley-377980.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large bowl, combine all ingredients; toss to coat. </li>\n<li>Transfer to a disposable foil pan. Grill, covered, over medium-hot heat for 5 minutes; stir. Grill 3-5 minutes longer or until vegetables are tender.</li>\n</ol>\n</div>
230537	Spinach Salad With Pecans and Sun-Dried Tomato	\N	\N	\N	https://spoonacular.com/recipeImages/Spinach-Salad-With-Pecans-and-Sun-Dried-Tomato-230537.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1 </li>\n<li>Saute the mushrooms, set aside and keep warm.2 </li>\n<li>Place spinach, pecans and chopped sun-dried tomatoes in a medium bowl, toss evenly.3 </li>\n<li>Add warm mushrooms, lightly toss again.4 </li>\n<li>Add vinegar/oil mixture, toss to coat.5 </li>\n<li>Serve immediately.6 The quantities of vinegar, raspberry olive oil, salt and pepper: </li>\n<li>Whisk small amount, taste, and adjust to your liking.</li>\n</ol>\n</div>
411053	Mushroom & Zucchini Pesto Saute	\N	\N	\N	https://spoonacular.com/recipeImages/Mushroom---Zucchini-Pesto-Saute-411053.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large skillet, heat oil over medium-high heat. </li>\n<li>Add mushrooms and onion; cook and stir for 2 minutes. </li>\n<li>Add zucchini; cook and stir until vegetables are tender. Stir in pesto and lemon-pepper seasoning.</li>\n</ol>\n</div>
18001	Snow Peas With Mushroom	\N	\N	\N	https://spoonacular.com/recipeImages/snow-peas-with-mushroom-2-18001.jpg	http://homecookingadventure.com/recipes/snow-peas-with-mushroom
18245	White Mushrooms, Peas And Mixed Leaves	\N	\N	\N	https://spoonacular.com/recipeImages/white-mushrooms-peas-and-mixed-leaves-2-18245.jpg	http://saladpride.blogspot.com/2011/06/white-mushrooms-peas-and-mixed-leaves.html
495013	How to Make Mushroom Stock from Kitchen Scraps	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-Make-Mushroom-Stock-from-Kitchen-Scraps-495013.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine all ingredients in large Dutch oven or stock pot. Bring to a boil, then reduce heat to low. Simmer partially covered for 45 minutes; remove lid and simmer uncovered for 30 minutes more. Allow stock to cool, then pour through a fine mesh strainer into a bowl. Press vegetable scraps against the strainer with a wooden spoon in order to extract as much stock as possible. Discard solids and store stock in a plastic container or freezer bag.</li>\n</ol>\n</div>
591790	marinated mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/marinated-mushrooms-591790.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse your mushrooms with cool water in a colander to remove any dirt and debris. </li>\n<li>Cut them in half or in quarters to make them all about equal size and set them aside. Peel and mince the two cloves of garlic and set them aside. Zest and juice the lemon and set it aside.In a large skillet, cook the mushrooms in half of the olive oil (2 Tbsp) until they are soft and have released most of their water (about 5 minutes). They will be smaller and a deep taupe color when they are done. There will still be juices in the pan, this is okay. See photos below</li>\n<li>Turn off the burner and add the lemon juice, zest, minced garlic, thyme leaves, bay leaves, 2 Tbsp olive oil, salt and pepper. To easily remove the thyme leaves from the sprigs, simply pinch the top of the sprig and pull backwards (from top to bottom) and all of the little leaves will pop right off.Stir the mixture well and allow to come to room temperature in a bowl. This will allow the flavors to mix and the mushrooms to marinate. Enjoy!</li>\n</ol>\n</div>
83997	Balsamic Braised Mushrooms And Couscous	\N	\N	\N	https://spoonacular.com/recipeImages/balsamic_braised_mushrooms_and_couscous-83997.jpg	http://www.loveandoliveoil.com/2007/04/balsamic-braised-mushrooms-and-couscous.html
591894	mushroom herb gravy	\N	\N	\N	https://spoonacular.com/recipeImages/mushroom-herb-gravy-591894.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Rinse the mushrooms clean and slice thinly. Prepare the bouillon with hot water so that it’s ready to go when needed (check the instructions for ratios, you want 2 cups of prepared broth).</li>\n<li>Heat a large skillet over medium heat with 3 Tbsp of olive oil. </li>\n<li>Add the garlic (finely minced) and cook for 1-2 minutes or just until soft. </li>\n<li>Add the sliced mushrooms and a pinch of salt. Cook the mushrooms until they are soft and all of the moisture they release has evaporated (5 minutes).Make sure that all of the moisture that comes out of the mushrooms has evaporated and just the oil remains in the pan. </li>\n<li>Add the 3 Tbsp of all-purpose flour and stir it to coat it in oil. It will form a paste like mixture all over the mushrooms. Continue to stir and cook this for about 2 minutes. This will slightly toast the flour and give the gravy better flavor.Slowly whisk in the vegetable broth. </li>\n<li>Whisk well to make sure that all of the flour has dissolved and no lumps remain. </li>\n<li>Whisk in the pepper, sage and thyme (you can leave the thyme on the stems and remove the bare stems later).Allow the mixture to come to a simmer. The gravy will begin to thicken as soon as it simmers. Lower the heat and allow it to simmer for about 10 minutes to infuse the flavor of the herbs. Stir occasionally with the whisk as it simmers. Taste the gravy and adjust salt and pepper to your liking.</li>\n</ol>\n</div>
199061	Healthy & Delicious: Mushroom 'Bolognese	\N	\N	\N	https://spoonacular.com/recipeImages/Healthy---Delicious--Mushroom-Bolognese-199061.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In a 10-inch heavy-bottomed skillet pan, heat oil over medium-high heat until shimmering. </li>\n<li>Add shallots, carrot, and mushrooms. Season to taste with salt and pepper. Cook, stirring occasionally, until mushrooms have reduced and their liquids have almost evaporated, about 12 minutes. </li>\n<li>Add tomatoes and oregano. Stir to combine. Cook, stirring occasionally, until sauce thickens to desired consistency. </li>\n<li>Serve with wide, flat pasta like pappardelle or tagliatelle or ridged pasta like rotini or rigatoni.</li>\n</ol>\n</div>
18852	Chestnuts Mushrooms, Courgettes And Red Cicory	\N	\N	\N	https://spoonacular.com/recipeImages/chestnuts_mushrooms_courgettes_and_red_cicory-18852.jpg	http://saladpride.blogspot.com/2010/08/chestnuts-mushrooms-courgettes-and-red.html
248562	Dairy-free Cream of Mushroom Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Dairy-free-Cream-of-Mushroom-Soup-248562.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Dice mushrooms and onions and sauté in margarine until the onions are translucent and the mushrooms have shrunk in size and turned dark.</li>\n<li>Whisk in the flour until well incorporated, then add broth and coconut milk beverage. Bring to boil, whisking constantly until the mixture is thickened.Season with salt and pepper and serve. Can be used as a standalone soup for a meal or in other dishes. Very tasty and easy!</li>\n</ol>\n</div>
215792	Speedy Tex-Mex rice	\N	\N	\N	https://spoonacular.com/recipeImages/Speedy-Tex-Mex-rice-215792.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Cook rice according topack instructions, then drain.</li>\n<li>Heat 1 tbsp oil in a frying pan.</li>\n<li>Add the sliced peppers andfajita seasoning, and cook for1 min until fragrant.Stir through the rice and beans, andheat until piping hot. </li>\n<li>Mix the remainingoil, lime juice, coriander and someseasoning into the pan and serve.</li>\n</ol>\n</div>
19207	Chickpeas, White Mushrooms And Spinach	\N	\N	\N	https://spoonacular.com/recipeImages/chickpeas-white-mushrooms-and-spinach-2-19207.jpg	http://saladpride.blogspot.com/2011/01/chickpeas-mushrooms-and-spinach.html
379806	Snow Pea Medley	\N	\N	\N	https://spoonacular.com/recipeImages/Snow-Pea-Medley-379806.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a nonstick skillet coated with cooking spray, saute onion in oil for 1-2 minutes. </li>\n<li>Add peppers; cook for 2 minutes.</li>\n<li>Stir in the peas and mushrooms; saute 3-4 minutes longer or until vegetables are crisp-tender. Sprinkle with salt.</li>\n</ol>\n</div>
379877	Marinated Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/Marinated-Mushrooms-379877.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the mushrooms in a bowl. In another bowl, whisk the remaining ingredients. </li>\n<li>Pour over mushrooms and toss to coat. Cover and refrigerate for 8 hours or overnight. </li>\n<li>Drain and discard marinade before serving.</li>\n</ol>\n</div>
314362	Salsa Rice with Black Beans and Corn	\N	\N	\N	https://spoonacular.com/recipeImages/Salsa-Rice-with-Black-Beans-and-Corn-314362.jpeg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a medium sauce pot, cook rice according to package instructions. When the rice is half way cooked, add black beans, salsa, and cook about 10 minutes for regular rice and 3 minutes for instant rice .Continue cooking rice. </li>\n<li>Remove the pot, using a spoon, stir in chopped cilantro and season, to taste, with salt and black pepper.</li>\n</ol>\n</div>
625680	Nanakusa Gayu	\N	\N	\N	https://spoonacular.com/recipeImages/Nanakusa-Gayu-625680.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n</ol>\n</div>
379983	Dilly Grilled Veggies	\N	\N	\N	https://spoonacular.com/recipeImages/Dilly-Grilled-Veggies-379983.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place vegetables on a double thickness of heavy-duty foil (about 18-in. square). </li>\n<li>Drizzle with oil; sprinkle with dill, garlic salt and pepper. Fold foil around vegetables and seal tightly.</li>\n<li>Grill, covered, over medium heat for 15 minutes or until vegetables are tender. Open foil carefully to allow steam to escape.</li>\n</ol>\n</div>
106312	Linda's Mushroom and Squash Medley	\N	\N	\N	https://spoonacular.com/recipeImages/lindas-mushroom-and-squash-medley-2-106312.jpg	http://www.food.com/recipe/lindas-mushroom-and-squash-medley-218827
544252	Chewy Granola Balls	\N	\N	\N	https://spoonacular.com/recipeImages/Chewy-Granola-Balls-544252.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the almond butter and rice syrup in a small saucepan over low to medium heat and warm for 2 minutes or until it becomes smooth and combined. </li>\n<li>Place the remaining ingredients in a bowl and stir to combine. </li>\n<li>Pour the warm almond butter mixture into the bowl with the granola mixture and stir to combine. </li>\n<li>Roll into 1 inch balls (I used a mini ice cream scooper to scoop out each portion, but you could also use a tablespoon) . </li>\n<li>Serve.</li>\n</ol>\n</div>
511507	Wild Mushroom Soup	\N	\N	\N	https://spoonacular.com/recipeImages/Wild-Mushroom-Soup-511507.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Clean and cut mushrooms into two inch pieces. Boil mushrooms in salted water for 15 minutes. Rinse them and set aside. Sautée onions with 2 tablespoons of cooking oil. Sautée until they're soft (7-10 minutes). </li>\n<li>Add mushrooms and carrots; cook until carrots are soften. </li>\n<li>Add water to the cooking ingredients, add potatoes and bay leaves. Season with "Better Than Bouillon", salt and pepper. Cook until potatoes are cooked, and it is ready to be served.</li>\n</ol>\n</div>
757276	Rice with Roasted Garlic, Lentils, and Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/rice-with-roasted-garlic-lentils-and-mushrooms-757276.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1 Preheat oven to 350˚F. Slice top off garlic bulb to expose cloves, and discard top. </li>\n<li>Place bulb on small square of foil and pour 1 Tbs. water over it. Fold up corners of foil to seal. Roast garlic in oven 45 to 50 minutes, or until soft when gently squeezed.2 Line large baking sheet with parchment paper. Toss sliced mushrooms with 1 Tbs. balsamic vinaigrette in large bowl, and season with salt and pepper if desired. </li>\n<li>Spread on prepared baking sheet in single layer. Roast mushrooms 20 to 30 minutes in oven with garlic, or until tender and browned, stirring halfway through.3 Meanwhile, bring lentils and 21⁄2 cups water to boil in small saucepan. Reduce heat to medium-low, and simmer 20 to 25 minutes for green lentils, 10 to 15 minutes for red lentils, or until tender. </li>\n<li>Drain, and transfer to medium bowl. Stir in 1 Tbs. balsamic vinaigrette. Cover and keep warm.4 Cool garlic until easy to handle. Squeeze out roasted garlic into small bowl and discard skins. Mash garlic with fork until smooth. Fold mashed roasted garlic into lentils. Stir in mushrooms, hot rice, and remaining 1 Tbs. balsamic vinaigrette. Season with salt and pepper, if desired.</li>\n</ol>\n</div>
36510	Baked Mushroom Rice Pilaf	\N	\N	\N	https://spoonacular.com/recipeImages/baked_mushroom_rice_pilaf-36510.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place the first four ingredients in a 3-cup baking dish coated with cooking spray. Cover and bake at 350° for 55-60 minutes or until liquid is absorbed and rice is tender. Just before serving, sprinkle with almonds.</li>\n</ol>\n</div>
397061	Pepper Salad	\N	\N	\N	https://spoonacular.com/recipeImages/Pepper-Salad-397061.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a bowl, toss peppers and mushrooms. </li>\n<li>Combine all remaining ingredients and toss with vegetables. Cover and refrigerate until serving.</li>\n</ol>\n</div>
757545	Pumpkin, Leek, and Mushroom Pitzas	\N	\N	\N	https://spoonacular.com/recipeImages/pumpkin-leek-and-mushroom-pitzas-757545.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 425°F. </li>\n<li>Heat oil in skillet over medium heat. </li>\n<li>Add leeks and salt, cover pan, and cook 5 minutes, or until softened. </li>\n<li>Add wine, and simmer uncovered 2 minutes, or until most of liquid has evaporated. Set aside. Stir together pumpkin purée and pesto in small bowl. </li>\n<li>Spread each pita with 1/4 cup pumpkin mixture. Top with 1/2 cup leeks, then mushroom slices. </li>\n<li>Place pitzas on ungreased baking sheet, and bake 8 minutes, or until crust is crisp and edges are browned.</li>\n</ol>\n</div>
36780	Sugar Snap Pea Salad With Sweet Ginger Soy Dressing	\N	\N	\N	https://spoonacular.com/recipeImages/sugar-snap-pea-salad-with-sweet-ginger-soy-dressing-2-36780.jpg	http://fortheloveofcooking-recipes.blogspot.com/2008/11/sugar-snap-pea-salad-with-sweet-ginger_04.html
479202	Meatless Monday: Forbidden Rice Salad With Pickled Vegetables	\N	\N	\N	https://spoonacular.com/recipeImages/Meatless-Monday--Forbidden-Rice-Salad-With-Pickled-Vegetables-479202.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a medium lidded saucepan, combine the rice with 1 1/2 cups water. Bring to boil, turn the heat down to low, and cover. Cook for 20 minutes, until the liquid is absorbed and the rice is al dente. </li>\n<li>Remove from the heat and let stand for 10 minutes. Fluff with a fork.Meanwhile, in a large mixing bowl, toss the carrots and radishes together with the vinegar and salt. </li>\n<li>Let sit in the mixture, stirring occasionally, until the rice is cooked, about 15 minutes.</li>\n<li>Add the rice to the vegetables along with the chives and olive oil. Toss to combine. </li>\n<li>Transfer to a serving dish and garnish with additional chives.</li>\n</ol>\n</div>
37120	Chicken Pot Stickers	\N	\N	\N	https://spoonacular.com/recipeImages/chicken-pot-stickers-2-37120.jpg	http://recipes.prevention.com/Recipe/chicken-pot-stickers.aspx
200971	Dinner Tonight: Spaghetti alla Boscaiola (Spaghetti with Tomato Sauce and Mushrooms)	\N	\N	\N	https://spoonacular.com/recipeImages/Dinner-Tonight--Spaghetti-alla-Boscaiola-(Spaghetti-with-Tomato-Sauce-and-Mushrooms)-200971.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Pour half of the oil into a large skillet over medium heat.  </li>\n<li>Add the garlic and cook until it fragrant, about a minute or two.  Dump in the can of tomatoes and turn the heat to medium-high.  Break up the tomatoes with a wooden spoon.  Cook until the sauce has thickened, about 15 minutes.</li>\n<li>2</li>\n<li>While the tomatoes are cooking, pour the rest of the oil into another skillet and add the sliced mushrooms.  Cook over medium heat until they begin to release water, about 5 minutes. Turn heat to low, season with salt, and sprinkle with the chopped parsley.</li>\n<li>3</li>\n<li>Meanwhile, bring a large pot of water to a boil.  </li>\n<li>Add the spaghetti and cook according to the directions on the box until al dente.  </li>\n<li>Transfer to the skillet with the tomato sauce, toss until coated.  </li>\n<li>Add the mushrooms, and toss.  </li>\n<li>Serve with a sprinkling of cheese, a drizzle of good olive oil, and season with salt and pepper to taste.</li>\n</ol>\n</div>
250182	Broiled Herbed Polenta with Wild Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/Broiled-Herbed-Polenta-with-Wild-Mushrooms-250182.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat broiler. </li>\n<li>Heat 1 tablespoon oil in heavy large skillet over medium heat.</li>\n<li>Add mushrooms and garlic and sauté until mushrooms soften, about 6 minutes. </li>\n<li>Add broth, Marcela and green onion and simmer about 5 minutes until liquid is reduced by half and you are scrapping up browned bits. Season to taste with salt and pepper.Meanwhile, arrange polenta on small baking sheet. </li>\n<li>Brush polenta on both sides with remaining ½ tablespoon oil. Broil polenta until golden and crisp, about 3 minutes per side. </li>\n<li>Transfer polenta to plates. Spoon mushroom and sauce over and serve.</li>\n</ol>\n</div>
250263	Steamed Tofu with Mushroom Sauce	\N	\N	\N	https://spoonacular.com/recipeImages/Steamed-Tofu-with-Mushroom-Sauce-250263.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Put the first set of ingredients in a wok or skillet large enough to accommodate your steamer, and bring to a boil.</li>\n<li>Place the tofu and mushrooms in the steamer, and place in the wok.Cover, reduce heat to medium high, and steam 10 minutes.Arrange the tofu and mushrooms in a platter, remove the steamer.Reduce the liquids in the skillet to about 2/3 a cup (this should only take 2-3 minutes), and stir in the miso and scallions.</li>\n<li>Pour over the dish.</li>\n<li>Serve hot.</li>\n</ol>\n</div>
381761	Easy Marinated Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Marinated-Mushrooms-381761.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a glass bowl, combine all ingredients and allow to marinate several hours or overnight.</li>\n</ol>\n</div>
611350	appam without yeast, how to make appam without yeast	\N	\N	\N	https://spoonacular.com/recipeImages/appam-without-yeast--how-to-make-appam-without-yeast-611350.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>take regular rice, urad dal and methi seeds in a bowl. here i used urad dal with their husks (out of stock with the husked urad dal) and i had to remove the skins after they had soaked well.rinse all three for a couple of times in water and then soak in enough water in the same bowl for 5 to 6 hours.drain and add the soaked rice, cooked rice, urad dal and methi seeds. also add coconut milk to a wet grinder jar.add coconut water in parts and grind everything to a smooth batter. a slight grainy texture of the rice, in the batter is fine. pour the appam batter in a large bowl or pan. add rock salt and sugar.stir and cover the batter. keep aside for fermentation overnight or for about 10 to 12 hours or more if required. the batter, will double up a bit and also increase in volume.the consistency of this batter is slightly thin than the dosa batter and of a pouring consistency. so if the batter appears thick, then you can add some coconut water or regular water to the batter and mix well.add baking soda to the batter. mix very well and keep aside the batter covered for 15 to 20 minutes. you will see bubbles in the batter after adding baking soda.you can also add eno fruit salt, instead of baking soda. just  tsp of eno salt would be enough.then take an appam pan or a small kadai with handles. if using an iron kadai, then smear oil on the kadai. for non stick kadai no need to smear any oil.with a large spoon or ladle, pour the appam batter. hold the kadai handles & swirl it, so that the appam batter spreads evenly in a round shape and you get a thin layer of batter at the edges.sprinkle coconut oil on the sides if required and cover the pan or kadai with a lid. cook till the appam gets cooked and the base is light golden.remove the lid or cover and gently lift the appam with a spatula. serve appam hot or warm with veg stew or coconut chutney or kadala curry.</li>\n</ol>\n</div>
382038	Pickled Mushrooms with Garlic	\N	\N	\N	https://spoonacular.com/recipeImages/Pickled-Mushrooms-with-Garlic-382038.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>In a large glass jar with a tight-fitting lid, combine the first six ingredients. </li>\n<li>Add the mushrooms, onion and garlic. Cover and shake gently to coat. Refrigerate for 8 hours or overnight. </li>\n<li>Drain before serving.</li>\n</ol>\n</div>
103519	Zucchini Pasta With Mushrooms, Eggplant and Roasted Peppers	\N	\N	\N	https://spoonacular.com/recipeImages/zucchini-pasta-with-mushrooms-eggplant-and-roasted-peppers-2-103519.jpg	http://www.food.com/recipe/zucchini-pasta-with-mushrooms-eggplant-and-roasted-peppers-319069
398580	Pretty Almond Green Beans	\N	\N	\N	https://spoonacular.com/recipeImages/Pretty-Almond-Green-Beans-398580.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Place beans in a large saucepan and cover with water. Bring to a boil. Cover and cook for 4-7 minutes or until crisp-tender.</li>\n<li>Meanwhile, in a large nonstick skillet, saute the pepper, mushrooms and onion in oil until tender. </li>\n<li>Drain beans; stir into vegetable mixture. Sprinkle with almonds.</li>\n</ol>\n</div>
612102	How to make Quinoa Idli	\N	\N	\N	https://spoonacular.com/recipeImages/How-to-make-Quinoa-Idli-612102.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Soak the rice and fenugreek seeds. This should be soaked for 5 to 6 hrs. Soak the quinoa and Urud dal 1 hr before grinding the rice. In the grinder, add the rice, fenugreek seeds and quinoa and add water little by little and start grinding. </li>\n<li>Add the Urud dal and flattened rice to the grinder and and grind to the smooth paste. </li>\n<li>Add water now and then. </li>\n<li>Add salt to it. The batter should not too thick or too watery. Once it has reached its medium consistency then remove from the grinder and transfer to the vessel. Allow to ferment overnight or 8 hrs atleast. After fermentation, the batter would have raised in volume. Give a mix slightly and now the batter is ready for preparing the idli. Now in the idli moulds, add the idli batter and steam cook for 7 to 8 min or till idli gets cooked. </li>\n<li>Serve the hot hot idlis with Sambar or chutney. I seved with normal sambar and peanut chutney.</li>\n</ol>\n</div>
120922	Pureed Mushroom Soup	\N	\N	\N	https://spoonacular.com/recipeImages/pureed-mushroom-soup-2-120922.png	http://www.marthastewart.com/356004/pureed-mushroom-soup
39436	Chestnut Mushrooms, Red Onions And Barley	\N	\N	\N	https://spoonacular.com/recipeImages/chestnut_mushrooms_red_onions_and_barley-39436.jpg	http://saladpride.blogspot.com/2010/09/chestnuts-mushrooms-red-onions-and.html
465516	Greens and Mushrooms with Raspberry Dressing	\N	\N	\N	https://spoonacular.com/recipeImages/Greens-and-Mushrooms-with-Raspberry-Dressing-465516.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>For dressing, in a jar with a tight-fitting lid, combine the first six ingredients; shake well. Cover and refrigerate for at least 1 hour.</li>\n<li>Just before serving, combine the salad greens and mushrooms in a large bowl. Shake dressing and pour over salad; toss to coat.</li>\n</ol>\n</div>
171020	Grilled Bell Peppers, Onion and Mushrooms	\N	\N	\N	https://spoonacular.com/recipeImages/Grilled-Bell-Peppers--Onion-and-Mushrooms-171020.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n\n<li>Heat grill. In large bowl, combine oil, peppered seasoned salt and basil; mix well. </li>\n<li>Add vegetables; toss to coat.</li>\n<li>2</li>\n<li>When ready to grill, place onion and bell peppers in grill basket or directly on gas grill over medium-low heat or on charcoal grill 4 to 6 inches from medium coals. Cook 6 minutes.</li>\n<li>3</li>\n\n<li>Add mushrooms to grill basket; cook 6 to 10 minutes or until vegetables are crisp-tender, turning occasionally.</li>\n</ol>\n</div>
597035	Veggie Burgers	\N	\N	\N	https://spoonacular.com/recipeImages/Veggie-Burgers-597035.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Steam or boil the potatoes until fork-tender, 20 to 30 minutes or so. </li>\n<li>Drain the potatoes. </li>\n<li>Transfer to a plate and mash half of them with a fork. Meanwhile, trim the stems from the mushrooms and discard. Scoop out the gills from the portobello and discard. </li>\n<li>Cut the cap into 1/2-inch chunks. Thinly slice the cremini and shiitake caps. Preheat the oven to 375°F (190°C).  </li>\n<li>Heat 1 tablespoon oil in a large skillet over medium heat. Cook the portobello and thyme for 6 to 8 minutes, until the mushroom begins to soften and throw off its liquid. </li>\n<li>Add the creminis and shiitakes and cook for 10 minutes, until they’ve thrown off their moisture and all the liquid has completely evaporated. </li>\n<li>Add the vinegar and cook, stirring, for 30 seconds or so. </li>\n<li>Transfer the mushroom mixture to a food processor and pulse until coarsely chopped or, if you prefer or you have no power, finely chop the mushroom mixture by hand. Dump the chopped mushroom mixture into a bowl and, using your hands, add half the mashed potato along with the barley, salt, and pepper. If the mixture isn’t sticking together properly, mash the remaining potato and add it to the mixture, a little at a time, until everything begins to cling together. (This is critical. In the words of author Lukas Volger, if the mixture is “too wet, it squeezes out the other side of the bun, and if it’s too dry, it crumbles.”) Shape the mixture into 4 to 6 burgers. In a large ovenproof skillet over medium-high heat, heat the remaining 2 tablespoons oil. </li>\n<li>Add the burgers, working in batches if necessary so as not to crowd the skillet, and cook until browned on each side, 6 to 10 minutes total. </li>\n<li>Transfer the skillet to the oven and bake for 12 to 15 minutes, until the burgers are firm and cooked through. </li>\n<li>Place on buns.</li>\n</ol>\n</div>
582106	Mushroom and Spinach Garlic Noodles	\N	\N	\N	https://spoonacular.com/recipeImages/Mushroom-and-Spinach-Garlic-Noodles-582106.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Mushrooms and Spinach:In a medium size skillet, heat olive oil. Once warm, add minced garlic and let cook for 30-45 seconds until fragrant and starting to color. </li>\n<li>Add sliced mushrooms and toss to combine. </li>\n<li>Add water and soy sauce and continue to cook on medium heat until mushrooms have started to shrink down. </li>\n<li>Add spinach in two additions. Cook on medium heat until mushrooms and spinach have cooked down and are tender. Season with salt and pepper to taste. </li>\n<li>Remove from heat and set aside.Noodles and Assembly:Cook and drain noodles according to package instructions.In a large skillet, heat olive oil. Once warm, add minced garlic cloves. Cook for 30-45 seconds until garlic is fragrant and starting color. Reduce heat and add soy sauce and sesame oil. </li>\n<li>Add prepared mushroom and spinach. </li>\n<li>Add cooked noodles. Toss to combine. Ensure that the mushroom and spinach are evenly distributed. Ensure that the noodles get coated in the sauce.</li>\n<li>Serve warm. </li>\n<li>Garnish with sesame seeds and red pepper flakes. Season with additional salt and pepper as needed.</li>\n</ol>\n</div>
8918	Avocado, Mushrooms And Rocket	\N	\N	\N	https://spoonacular.com/recipeImages/avocado-mushrooms-and-rocket-2-8918.jpg	http://saladpride.blogspot.com/2010/11/avocado-mushrooms-and-rocket.html
19241	Dinner Tonight: Spinach With Mint And Crème Fraîche	\N	\N	\N	https://spoonacular.com/recipeImages/dinner-tonight-spinach-with-mint-and-crme-frache-2-19241.jpg	http://www.seriouseats.com/recipes/2008/02/dinner-tonight-spinach-with-mint-and-creme-fr.html
19850	Spinach And Gruyère Omelette	\N	\N	\N	https://spoonacular.com/recipeImages/spinach-and-gruyre-omelette-2-19850.jpg	http://www.williams-sonoma.com/recipe/spinach-and-gruyere-omelette.html
649827	Lemon, Garlic and Thyme Roast Chicken – Quick and Easy Method	\N	\N	\N	https://spoonacular.com/recipeImages/Lemon--Garlic-and-Thyme-Roast-Chicken--Quick-and-Easy-Method-649827.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Heat your oven to 220 C (only for 10 minutes, before turning it down to 180 C)Take lemon zest,roasted garlic, butter and 1/2 the bunch of thyme and fill the underside of the chicken skin. This way all your flavours are seeping into your meat.Pat chicken dry with paper towel, rub the chicken all over with a 2tsp of salt, pepper and olive oil. Not only are you further flavouring the chicken, but the chicken skin will be crispier when roasted.Put chicken on to a roasting pan, pour lemon juice around it. Put lemon skins and remaining thyme underneath the chicken.Roast for 10 minutes on 220C, then lower the heat to 180 C and cook for a further 25- 35 mins depending on how large the chicken is.You can check if your chicken is ready by inserting a skewer/ fork into the thickest part ( thigh). If the juices run clear, your chicken is ready. If its still is pink, leave it in for a couple more minutes.Take chicken out, keep warm and rest the chicken while you make the sauce.Sauce on the side: Deglaze the roasting pan with a little white wine and chicken stock, bring to a simmer. </li>\n<li>Add a cornflour mixture (water and cornflour) till you are happy with the consistency of the sauce. Season to tasteYUM, its all the lemony, buttery, garlicky thyme goodness</li>\n</ol>\n</div>
601217	Fried Chicken with Beer – beer adds a very flavorful and earthly taste to so many things. Fried chicken with beer is fabulous	\N	\N	\N	https://spoonacular.com/recipeImages/Fried-Chicken-with-Beer--beer-adds-a-very-flavorful-and-earthly-taste-to-so-many-things--Fried-chicken-with-beer-is-fabulous-601217.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n\n<li>Combine and mix well all dry ingredients. Dip chicken into beer then in flour mixture. Cook in a deep fat fryer at 350 degrees. Turning over once, do not cover.</li>\n</ol>\n</div>
535745	Not My Grandmother’s Chicken Cordon Blue	\N	\N	\N	https://spoonacular.com/recipeImages/Not-My-Grandmothers-Chicken-Cordon-Blue-535745.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 375 degrees.Lay out the chicken slices. Season lightly with salt and pepper on both sides. Top each one with a slice of Virginia ham and a slice of Swiss cheese. </li>\n<li>Roll up and secure with toothpicks.Lay out three bowls for dredging and put flour in one, egg in the second and breadcrumbs in the third. Dredge each chicken roll first in flour, then in egg and finally in the breadcrumbs. Set aside.In a deep, oven-safe skillet, add the olive oil and heat over medium heat. Once it's hot, place the chicken in the pan and cook for 4-5 minutes per side until browned. </li>\n<li>Transfer the skillet to the oven and bake for about 20 minutes, or until cooked through.</li>\n</ol>\n</div>
481242	Pollo all’ischitana (Ischia-Style Chicken)	\N	\N	\N	https://spoonacular.com/recipeImages/Pollo-allischitana-(Ischia-Style-Chicken)-481242.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Melt a good dollop of lard in a sauté pan or braiser large enough to hold all the chicken pieces in one layer. When the lard is melted and hot, add the chicken pieces and brown them well on all sides. Season the chicken pieces well with salt and pepper on all sides, turning them as you go. Now add a good glug of white wine and the tomato.</li>\n<li>Let the chicken simmer uncovered in the wine and tomato over moderate heat, turning them from time to time, until the meat is quite tender, about 30-45 minutes, depending on the size and age of your chicken. By the time the chicken is cooked, the tomatoes will have melted and the wine will have reduced down to glossy sauce that should cling nicely to all the chicken pieces. Just a few minutes before the chicken is done, add the fresh basil and mix well.Adjust the seasoning and serve right away, napping the chicken with any sauce that is left in the pan.</li>\n</ol>\n</div>
481250	Pollo fritto per Chanukà (Hannukah Fried Chicken)	\N	\N	\N	https://spoonacular.com/recipeImages/Pollo-fritto-per-Chanuk-(Hannukah-Fried-Chicken)-481250.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>The day before, cut up your chicken into ten pieces (two wings, two drumsticks, two thighs, and the breast cut into four pieces, in half along the breastbone and then in half again across). </li>\n<li>Place in a large bowl and marinate with the juice of a whole freshly squeezed lemon, salt, pepper, a finely minced garlic clove or two, a generous grating of nutmeg and a good pour of olive oil. </li>\n<li>Let it marinate in the fridge overnight. </li>\n<li>Mix at least once during this period to ensure even marination.The next day, when you are ready to cook, let the chicken come back to room temperature by removing it from the fridge about an hour ahead of time. In a large, heavy skillet, heat enough olive oil to come at least 2cm (3/4 inch) up the sides until it is quite hot (but not smoking). Then take each piece of chicken (tongs are very useful here) and dredge it successively in flour and then in beaten egg, and then immediately into the hot oil. Fry over moderate heat until the chicken is golden brown on all sides. This should take about 15-20 minutes. If you are not ready to eat the chicken right away, you can keep the pieces warm, on a baking rack set over a cookie sheet in the oven.</li>\n<li>Serve hot, sprinkled with additional salt (preferably some fine sea salt) with some lemon wedges on the side, and accompanied by a nice green salad.</li>\n</ol>\n</div>
556315	Parmesan Crusted Grilled Chicken and Cheese	\N	\N	\N	https://spoonacular.com/recipeImages/Parmesan-Crusted-Grilled-Chicken-and-Cheese-556315.jpg	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>Preheat oven to 450 degrees.</li>\n<li>Combine chicken, shredded cheese, and olives in a medium bowl. Set aside.Butter one side of each of the 8 slices of bread with the buttery spread.Sprinkle 4 of the bread slices on the buttered side with some parmesan cheese, and place them butter side down on a baking sheet.Distribute filling across the 4 slices.Sprinkle remaining parmesan cheese on the buttered side of the last 4 slices of bread, and place them on top of the filling, buttered side up.</li>\n<li>Bake for 6-8 minutes, then flip the sandwiches and bake about 6 minutes more, until the sandwiches are golden brown and crispy. (Alternatively, you can grill them on the stove top on a griddle or in a skillet).</li>\n</ol>\n</div>
164135	Easy Chicken and Bean Stew	\N	\N	\N	https://spoonacular.com/recipeImages/Easy-Chicken-and-Bean-Stew-164135.ashx	<div class="recipeInstructions" itemprop="recipeInstructions">\n<ol>\n<li>1</li>\n<li>In 12-inch nonstick skillet, heat oil over medium-high heat. </li>\n<li>Add stir-fry vegetables; cook 2 to 4 minutes, stirring frequently, until crisp-tender.</li>\n<li>2</li>\n<li>Stir in turkey, tomatoes, tomato sauce and beans. </li>\n<li>Heat to boiling. Reduce heat to medium; simmer uncovered 5 to 10 minutes, stirring occasionally and breaking up tomatoes, until thoroughly heated. Sprinkle with basil.</li>\n</ol>\n</div>
\.


--
-- Name: recipes_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kathyma
--

SELECT pg_catalog.setval('recipes_recipe_id_seq', 1, true);


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

