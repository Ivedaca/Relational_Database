--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    size integer,
    velocity numeric(20,2),
    notes text
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
    name character varying(30) NOT NULL,
    distance_earth numeric(20,2) NOT NULL,
    near_supermassive_blackhole boolean,
    notes text
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
    planet_id integer,
    name character varying(30) NOT NULL,
    radius integer NOT NULL,
    distance_planet numeric(20,2),
    spherical boolean,
    notes text
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
    star_id integer,
    name character varying(30) NOT NULL,
    radius integer NOT NULL,
    atmosphere boolean,
    orbital_period numeric(20,2),
    notes text
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
    galaxy_id integer,
    name character varying(30) NOT NULL,
    mass integer,
    temperature integer NOT NULL,
    variable boolean,
    luminosity numeric(20,2),
    notes text
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939, 17.90, 'Largest asteroid in the asteroid belt');
INSERT INTO public.asteroid VALUES (2, 'Pallas', 512, 17.60, 'Second largest asteroid');
INSERT INTO public.asteroid VALUES (3, 'Vesta', 525, 19.30, 'Third largest asteroid');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Canis Major Dwarf', 25000.00, false, 'Satellite of Milky Way');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 0.00, true, 'Our Home Galaxy');
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 2537000.00, true, 'Nearest Major Galaxy');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 30000000.00, false, 'Third Largest in the Local Group');
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 12000000.00, true, 'Large Spiral Galaxy');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 23000000.00, true, 'Interacting Grand Design Galaxy');
INSERT INTO public.galaxy VALUES (7, 'Hat', 290000000.00, true, 'Unusual Galaxy with a Large Central Bulge');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 1737, 384400.00, true, 'None');
INSERT INTO public.moon VALUES (2, 2, 'Phobos', 11, 9376.00, false, 'None');
INSERT INTO public.moon VALUES (3, 2, 'Deimos', 6, 23460.00, false, 'None');
INSERT INTO public.moon VALUES (4, 3, 'Ganymede', 2634, 1070400.00, true, 'None');
INSERT INTO public.moon VALUES (5, 4, 'Europa', 1500, 670900.00, true, 'None');
INSERT INTO public.moon VALUES (6, 5, 'Io', 1821, 421700.00, true, 'None');
INSERT INTO public.moon VALUES (7, 6, 'Callisto', 2410, 1882700.00, true, 'None');
INSERT INTO public.moon VALUES (8, 7, 'Titan', 2576, 1221870.00, true, 'None');
INSERT INTO public.moon VALUES (9, 8, 'Triton', 1353, 354760.00, true, 'None');
INSERT INTO public.moon VALUES (10, 9, 'Dione', 560, 377400.00, true, 'None');
INSERT INTO public.moon VALUES (11, 10, 'Rhea', 764, 527000.00, true, 'None');
INSERT INTO public.moon VALUES (12, 11, 'Iapetus', 735, 3560000.00, true, 'None');
INSERT INTO public.moon VALUES (13, 12, 'Enceladus', 252, 237948.00, true, 'None');
INSERT INTO public.moon VALUES (14, 12, 'Mimas', 198, 185500.00, true, 'None');
INSERT INTO public.moon VALUES (15, 9, 'Titania', 788, 435910.00, true, 'None');
INSERT INTO public.moon VALUES (16, 7, 'Oberon', 761, 583520.00, true, 'None');
INSERT INTO public.moon VALUES (17, 6, 'Ariel', 578, 191240.00, true, 'None');
INSERT INTO public.moon VALUES (18, 8, 'Umbriel', 584, 266000.00, true, 'None');
INSERT INTO public.moon VALUES (19, 9, 'Miranda', 235, 129870.00, true, 'None');
INSERT INTO public.moon VALUES (20, 12, 'Charon', 606, 19500.00, true, 'None');
INSERT INTO public.moon VALUES (21, 11, 'Nix', 50, 48794.00, false, 'None');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 2, 'Earth', 6371, true, 365.25, 'None');
INSERT INTO public.planet VALUES (2, 2, 'Mars', 3389, true, 687.00, 'None');
INSERT INTO public.planet VALUES (3, 2, 'Venus', 6052, true, 224.70, 'None');
INSERT INTO public.planet VALUES (4, 1, 'Proxima B', 6000, true, 11.20, 'None');
INSERT INTO public.planet VALUES (5, 3, 'Rigel A1', 7000, false, 42.50, 'None');
INSERT INTO public.planet VALUES (6, 4, 'Betelgeuse C', 9500, true, 89.00, 'None');
INSERT INTO public.planet VALUES (7, 5, 'Vega I', 12900, false, 150.40, 'None');
INSERT INTO public.planet VALUES (8, 6, 'Altair II', 8000, true, 200.00, 'None');
INSERT INTO public.planet VALUES (9, 1, 'Mercury', 2440, false, 88.00, 'None');
INSERT INTO public.planet VALUES (10, 2, 'Proxima C', 5000, false, 15.40, 'None');
INSERT INTO public.planet VALUES (11, 3, 'Rigel B', 11000, false, 73.80, 'None');
INSERT INTO public.planet VALUES (12, 5, 'Vega II', 10500, true, 134.20, 'None');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 2, 'Sun', 1, 5778, true, 1.00, 'None');
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 1, 3042, true, 0.00, 'None');
INSERT INTO public.star VALUES (3, 2, 'Rigel', 17, 11000, false, 120000.00, 'None');
INSERT INTO public.star VALUES (4, 2, 'Betelgeuse', 20, 3500, true, 90000.00, 'None');
INSERT INTO public.star VALUES (5, 3, 'Vega', 2, 9602, false, 40.00, 'None');
INSERT INTO public.star VALUES (6, 3, 'Altair', 2, 7550, false, 10.60, 'None');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_unique UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

