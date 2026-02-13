--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter_km integer,
    is_hazardous boolean DEFAULT false
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20),
    age_billion_years numeric(10,2) NOT NULL,
    diameter_light_years integer NOT NULL,
    has_life boolean DEFAULT false,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20),
    planet_id integer,
    diameter_km integer NOT NULL,
    is_spherical boolean DEFAULT true
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    star_id integer,
    radius_km numeric(10,1) NOT NULL,
    has_atmosphere boolean DEFAULT false,
    surface_description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer,
    mass_solar numeric(8,2) NOT NULL,
    temperature_kelvin integer,
    is_binary boolean DEFAULT false
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Pyroclast', 4, 12, true);
INSERT INTO public.asteroid VALUES (2, 'Caelith', 5, 8, false);
INSERT INTO public.asteroid VALUES (3, 'Umbra Rock', 12, 25, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.60, 120000, true, 'A large barred spiral galaxy that contains our Solar System, comprising 100–400 billion stars, gas, dust, and dark matter.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.40, 220000, false, 'Nearest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12.80, 60000, false, 'A spiral galaxy in the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 8.00, 80000, false, 'Interacting grand-design spiral galaxy.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 13.25, 49000, false, 'Unusual galaxy with a bright nucleus.');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 13.24, 240000, false, 'Supergiant elliptical galaxy with a massive black hole.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ember', 1, 450, false);
INSERT INTO public.moon VALUES (2, 'Sulphara', 2, 950, false);
INSERT INTO public.moon VALUES (3, 'Luna', 3, 3474, true);
INSERT INTO public.moon VALUES (4, 'Scorcha', 4, 950, false);
INSERT INTO public.moon VALUES (5, 'Ignis', 5, 1200, false);
INSERT INTO public.moon VALUES (6, 'Stormis', 6, 2000, true);
INSERT INTO public.moon VALUES (7, 'Flare', 6, 680, false);
INSERT INTO public.moon VALUES (8, 'Planktonia', 7, 1100, false);
INSERT INTO public.moon VALUES (9, 'Bioluma', 7, 900, false);
INSERT INTO public.moon VALUES (10, 'Verdantis', 8, 2500, true);
INSERT INTO public.moon VALUES (11, 'Glacien', 9, 820, false);
INSERT INTO public.moon VALUES (12, 'Frostbite', 9, 600, false);
INSERT INTO public.moon VALUES (13, 'Aetheris', 10, 5210, true);
INSERT INTO public.moon VALUES (14, 'Cirrus', 10, 4300, true);
INSERT INTO public.moon VALUES (15, 'Zephyria', 10, 2100, true);
INSERT INTO public.moon VALUES (16, 'Oceana', 11, 4800, true);
INSERT INTO public.moon VALUES (17, 'Tritonis', 11, 3600, true);
INSERT INTO public.moon VALUES (18, 'Nereid', 11, 1400, false);
INSERT INTO public.moon VALUES (19, 'Shadow', 12, 1700, false);
INSERT INTO public.moon VALUES (20, 'Eclipse', 12, 950, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 3, 2439.7, false, 'Mercury is the first planet from the Sun and the smallest in the Solar System');
INSERT INTO public.planet VALUES (2, 'Venus', 3, 6051.8, true, 'Earth''s "sister planet," similar in size and structure but with a hellish environment');
INSERT INTO public.planet VALUES (3, 'Earth', 3, 6371.0, true, 'Earth is the third planet from the Sun, known as the "Goldilocks planet" for its perfect conditions supporting life, featuring liquid water, an oxygen-rich atmosphere (mostly nitrogen), and diverse ecosystems, with ~70% surface water and one moon, forming over 4.5 billion years ago.');
INSERT INTO public.planet VALUES (4, 'Pyron', 1, 6100.0, true, 'A scorched, airless rock world orbiting extremely close to the star. Surface minerals glow faintly from constant stellar radiation.');
INSERT INTO public.planet VALUES (5, 'Caelus Minor', 1, 4200.0, false, 'Volcanically active with vast lava seas. Tidal forces from the binary companion star drive constant tectonic upheaval.');
INSERT INTO public.planet VALUES (6, 'Virex', 1, 7800.0, true, 'A dense, orange-clouded world with lightning storms that circle the planet continuously.');
INSERT INTO public.planet VALUES (7, 'Thalara', 1, 6500.0, true, 'A temperate ocean world in the inner habitable zone. Bioluminescent plankton light up its shallow seas.');
INSERT INTO public.planet VALUES (8, 'Nareth', 1, 8900.0, true, 'A super-Earth with vast continents and high-gravity conditions. Towering forests of thick-trunked flora dominate the land.');
INSERT INTO public.planet VALUES (9, 'Crythos', 1, 3900.0, true, 'A frozen moon-sized planet with subsurface oceans kept liquid by tidal heating.');
INSERT INTO public.planet VALUES (10, 'Helion', 1, 42000.0, true, 'A striped gas giant with a bright ring system reflecting Alpheratz''s blue light.');
INSERT INTO public.planet VALUES (11, 'Vaelor', 1, 58000.0, true, 'A massive gas giant with dozens of moons, including several potentially habitable ocean moons.');
INSERT INTO public.planet VALUES (12, 'Umbros', 1, 18000.0, true, 'A dark, distant ice giant with a highly elliptical orbit, glowing faintly from internal heat.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 2, 3.60, 13800, true);
INSERT INTO public.star VALUES (2, 'Mirach', 2, 4.00, 3850, false);
INSERT INTO public.star VALUES (3, 'Red Giants', 1, 8.00, 5000, false);
INSERT INTO public.star VALUES (4, 'White Dwarfs', 1, 0.60, 100000, true);
INSERT INTO public.star VALUES (5, 'Beta Trianguli', 3, 3.52, 7683, true);
INSERT INTO public.star VALUES (6, 'Gamma Trianguli', 3, 2.70, 9210, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_ateroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_ateroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_galaxy_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_key UNIQUE (name);


--
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

