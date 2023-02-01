--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

ALTER TABLE ONLY public.star DROP CONSTRAINT star_galaxy_id_fkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_constellation_id_fkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_star_id_fkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_planet_id_fkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_pkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_name_key;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_pkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_name_key;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_pkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_name_key;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_pkey;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_name_key;
ALTER TABLE ONLY public.constellation DROP CONSTRAINT constellation_pkey;
ALTER TABLE ONLY public.constellation DROP CONSTRAINT constellation_name_key;
ALTER TABLE public.star ALTER COLUMN star_id DROP DEFAULT;
ALTER TABLE public.planet ALTER COLUMN planet_id DROP DEFAULT;
ALTER TABLE public.moon ALTER COLUMN moon_id DROP DEFAULT;
ALTER TABLE public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
ALTER TABLE public.constellation ALTER COLUMN constellation_id DROP DEFAULT;
DROP SEQUENCE public.star_id_seq;
DROP TABLE public.star;
DROP SEQUENCE public.planet_id_seq;
DROP TABLE public.planet;
DROP SEQUENCE public.moon_id_seq;
DROP TABLE public.moon;
DROP SEQUENCE public.galaxy_id_seq;
DROP TABLE public.galaxy;
DROP SEQUENCE public.constellation_constellation_id_seq;
DROP TABLE public.constellation;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    meaning text,
    discovered_by_ptolemy boolean
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    diameter_in_light_years integer,
    distance_in_mil_light_years numeric(5,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    year_discovered integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_moon boolean,
    star_id integer,
    radius_in_mi numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    brightness numeric(3,2) NOT NULL,
    approval_date date,
    galaxy_id integer,
    constellation_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', NULL, 'The chained maiden or princess', true);
INSERT INTO public.constellation VALUES (2, 'Aquarius', NULL, 'water-bearer', true);
INSERT INTO public.constellation VALUES (3, 'Aries', NULL, 'ram', true);
INSERT INTO public.constellation VALUES (4, 'Caelum', 1763, 'chisel or engraving tool', false);
INSERT INTO public.constellation VALUES (5, 'Cancer', NULL, 'crab', true);
INSERT INTO public.constellation VALUES (6, 'Cassiopeia', NULL, 'named after mythological character', true);
INSERT INTO public.constellation VALUES (7, 'Draco', NULL, 'dragon', true);
INSERT INTO public.constellation VALUES (8, 'Gemini', NULL, 'twins', true);
INSERT INTO public.constellation VALUES (9, 'Hercules', NULL, 'named after mythological character', true);
INSERT INTO public.constellation VALUES (10, 'Leo', NULL, 'lion', true);
INSERT INTO public.constellation VALUES (11, 'Libra', NULL, 'balance', true);
INSERT INTO public.constellation VALUES (12, 'Orion', NULL, 'named after mythological character', true);
INSERT INTO public.constellation VALUES (13, 'Pegasus', NULL, 'mythological winged horse', true);
INSERT INTO public.constellation VALUES (14, 'Perseus', NULL, 'named after mythological character', true);
INSERT INTO public.constellation VALUES (15, 'Phoenix', 1603, 'phoenix', false);
INSERT INTO public.constellation VALUES (16, 'Pisces', NULL, 'fishes', true);
INSERT INTO public.constellation VALUES (17, 'Sagittarius', NULL, 'archer', true);
INSERT INTO public.constellation VALUES (18, 'Scorpius', NULL, 'scorpion', true);
INSERT INTO public.constellation VALUES (19, 'Taurus', NULL, 'bull', true);
INSERT INTO public.constellation VALUES (20, 'Vela', 1763, 'sails', false);
INSERT INTO public.constellation VALUES (21, 'Virgo', NULL, 'virgin or maiden', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (8, 'Butterfly Galaxies', 'Looks similar to a butterfly', NULL, NULL);
INSERT INTO public.galaxy VALUES (10, 'Milky Way', 'This galaxy hosts the Solar System, which includes Earth', 105700, NULL);
INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'The closest big galaxy to the Milky Way', 152000, 2.54);
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxies', 'Appearance is similar to an insect antennae', 500000, 65.00);
INSERT INTO public.galaxy VALUES (5, 'Backward Galaxy', 'Appears to rotate backwards', NULL, 111.00);
INSERT INTO public.galaxy VALUES (6, 'Black Eye Galaxy', 'It has a spectacular band of dark dust', 53800, 24.01);
INSERT INTO public.galaxy VALUES (9, 'Cartwheel Galaxy', 'Looks similar to a spoked cartwheel', 144300, 489.20);
INSERT INTO public.galaxy VALUES (11, 'Hercules Galaxy', 'A dwarf spheroidal galaxy in the Hercules constellation', NULL, 508.80);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 'innermost and larger of the two natural satellites of Mars', 1877, 4);
INSERT INTO public.moon VALUES (2, 'Deimos', 'outermost and smallest of the two natural satellites of Mars', 1877, 4);
INSERT INTO public.moon VALUES (3, 'Europa', 'smallest of the four Galilean moons orbiting Jupiter', 1610, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'satellite of Jupiter', 1610, 5);
INSERT INTO public.moon VALUES (5, 'Io', 'innermost and third-largest of the four Galilean moons', 1610, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 'second-largest moon of Jupiter', 1610, 5);
INSERT INTO public.moon VALUES (7, 'Amalthea', 'fifth-largest moon of Jupiter', 1892, 5);
INSERT INTO public.moon VALUES (8, 'Adrastea', 'smallest of the four inner moons of Jupiter', 1979, 5);
INSERT INTO public.moon VALUES (9, 'Jupiter LXI', 'irregular retrograde moon orbiting Jupiter', 2003, 5);
INSERT INTO public.moon VALUES (10, 'Himalia', 'largest irregular satellite of Jupiter', 1904, 5);
INSERT INTO public.moon VALUES (11, 'Thebe', 'fourth-closest moon to Jupiter', 1979, 5);
INSERT INTO public.moon VALUES (12, 'Titan', 'largest moon of Saturn', 1655, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'sixth-largest moon of Saturn', 1789, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 'a moon of Saturn', 1789, 6);
INSERT INTO public.moon VALUES (15, 'Dione', 'a moon of Saturn', 1684, 6);
INSERT INTO public.moon VALUES (16, 'Hyperion', 'irregular shape and chaotic rotation', 1848, 6);
INSERT INTO public.moon VALUES (17, 'Titania', 'largest of the moons of Uranus', 1787, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', 'outermost major moon of Uranus', 1787, 7);
INSERT INTO public.moon VALUES (19, 'Ariel', 'fourth-largest of Uranus moons', 1851, 7);
INSERT INTO public.moon VALUES (20, 'Cressida', 'inner satellite of Uranus', 1986, 7);
INSERT INTO public.moon VALUES (21, 'Triton', 'largest natural satellite of Neptune', 1846, 8);
INSERT INTO public.moon VALUES (22, 'Thalassa', 'second-innermost satellite of Neptune', 1989, 8);
INSERT INTO public.moon VALUES (23, 'Charon', 'largest of the natural satellites of Pluto', 1978, 9);
INSERT INTO public.moon VALUES (24, 'Nix', 'natural satellite of Pluto', 2005, 9);
INSERT INTO public.moon VALUES (25, 'Styx', 'small natural satellite of Pluto', 2012, 9);
INSERT INTO public.moon VALUES (26, 'Dysnomia', 'only known moon of Eris', 2005, 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, NULL, 1516);
INSERT INTO public.planet VALUES (2, 'Venus', false, NULL, 3760.4);
INSERT INTO public.planet VALUES (3, 'Earth', true, NULL, 3958.8);
INSERT INTO public.planet VALUES (4, 'Mars', true, NULL, 2106.1);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, NULL, 43441);
INSERT INTO public.planet VALUES (6, 'Saturn', true, NULL, 36184);
INSERT INTO public.planet VALUES (7, 'Uranus', true, NULL, 15769);
INSERT INTO public.planet VALUES (8, 'Neptune', true, NULL, 15299);
INSERT INTO public.planet VALUES (9, 'Pluto', true, NULL, 738.38);
INSERT INTO public.planet VALUES (10, 'Ceres', false, NULL, 293.91);
INSERT INTO public.planet VALUES (11, 'Makemake', true, NULL, 444.28);
INSERT INTO public.planet VALUES (12, 'Haumea', true, NULL, 507.04);
INSERT INTO public.planet VALUES (13, 'Eris', true, NULL, 722.65);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 2.07, '2016-06-30', 1, 1);
INSERT INTO public.star VALUES (3, 'Sadalsuud', 2.87, NULL, NULL, 2);
INSERT INTO public.star VALUES (4, 'Hamal', 2.00, '2016-07-20', NULL, 3);
INSERT INTO public.star VALUES (5, 'Botein', 4.35, '2016-09-12', NULL, 3);
INSERT INTO public.star VALUES (6, 'Caeli', 4.45, NULL, 10, 4);
INSERT INTO public.star VALUES (7, 'Beta Cancri', 3.50, NULL, NULL, 5);
INSERT INTO public.star VALUES (8, 'Cassopeiae/Shedar', 2.24, '2016-08-21', 10, 6);
INSERT INTO public.star VALUES (9, 'Gamma Draconis', 2.20, '2016-08-21', NULL, 7);
INSERT INTO public.star VALUES (10, 'Pollux', 1.14, '2015-12-15', 10, 8);
INSERT INTO public.star VALUES (11, 'Kornephoros', 2.81, '2016-08-21', 11, 9);
INSERT INTO public.star VALUES (12, 'Regulus', 1.35, NULL, 10, 10);
INSERT INTO public.star VALUES (13, 'Zubeneschamali', 2.60, '2016-06-21', NULL, 11);
INSERT INTO public.star VALUES (14, 'Denebola', 2.14, '2016-06-30', 10, 10);
INSERT INTO public.star VALUES (15, 'Rigel', 0.12, '1781-10-01', 10, 12);
INSERT INTO public.star VALUES (16, 'Betelgeuse', 0.58, NULL, 10, 13);
INSERT INTO public.star VALUES (17, 'Bellatrix', 1.60, '2016-06-30', 10, 12);
INSERT INTO public.star VALUES (18, 'Mirfak', 1.80, '2016-07-20', 10, 14);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 21, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 11, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 26, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 18, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

