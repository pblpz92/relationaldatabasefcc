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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer,
    discovery_year integer,
    distance_from_earth numeric(6,2),
    has_life boolean,
    is_spherical boolean
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
-- Name: galaxy_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_info (
    galaxy_info_id integer NOT NULL,
    info text NOT NULL,
    discoverer character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.galaxy_info OWNER TO freecodecamp;

--
-- Name: galaxy_info_galaxy_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_info_galaxy_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_info_galaxy_info_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_info_galaxy_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_info_galaxy_info_id_seq OWNED BY public.galaxy_info.galaxy_info_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer,
    discovery_year integer,
    distance_from_earth numeric(6,2),
    has_life boolean,
    is_spherical boolean,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer,
    discovery_year integer,
    distance_from_earth numeric(6,2),
    has_life boolean,
    is_spherical boolean,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer,
    discovery_year integer,
    distance_from_earth numeric(6,2),
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_info galaxy_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_info ALTER COLUMN galaxy_info_id SET DEFAULT nextval('public.galaxy_info_galaxy_info_id_seq'::regclass);


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

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'A spiral galaxy located 2.537 million light-years from Earth.', 2200, 964, 2.54, true, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'The galaxy that contains our Solar System.', 13000, 1783, 0.00, false, true);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'A supergiant elliptical galaxy in the constellation Virgo.', 6500, 1781, 55.00, false, true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'A smaller spiral galaxy that is a member of the Local Group.', 4000, 1784, 3.00, false, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'A classic spiral galaxy located in the constellation Canes Venatici.', 16000, 1773, 23.00, false, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'A face-on spiral galaxy located in the constellation Ursa Major.', 25000, 1855, 21.00, false, true);


--
-- Data for Name: galaxy_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_info VALUES (1, 'Andromeda is the closest spiral galaxy to the Milky Way and is expected to collide with it in about 4.5 billion years.', 'E
dwin Hubble', 1, NULL);
INSERT INTO public.galaxy_info VALUES (2, 'The Milky Way is a barred spiral galaxy that contains the Solar System.', 'Galileo Galilei', 2, NULL);
INSERT INTO public.galaxy_info VALUES (3, 'Messier 87 is notable for its large population of globular clusters and its active galactic nucleus.', 'Charles Messier', 3
, NULL);
INSERT INTO public.galaxy_info VALUES (4, 'Triangulum is the third-largest member of the Local Group of galaxies, after the Milky Way and Andromeda.', 'William Hersch
el', 4, NULL);
INSERT INTO public.galaxy_info VALUES (5, 'The Whirlpool Galaxy is a classic example of a spiral galaxy, with prominent spiral arms.', 'Charles Messier', 5, NULL);
INSERT INTO public.galaxy_info VALUES (6, 'The Pinwheel Galaxy is notable for its bright spiral arms and is often photographed due to its beauty.', 'Lord Rosse', 6, N
ULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'The natural satellite of Earth, often referred to as "the Moon."', 4500, -4500, 0.00, false, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and innermost moon of Mars.', 4500, 1877, 9.38, false, true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and outermost moon of Mars.', 4500, 1877, 23.46, false, true, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'The innermost of the four Galilean moons of Jupiter, known for its volcanic activity.', 4500, 1610, 421.60, false, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'The smallest of the four Galilean moons of Jupiter, known for its smooth and icy surface.', 4500, 1610, 670.90, false, t
rue, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon of Jupiter and in the Solar System.', 4500, 1610, 1070.40, false, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'The second-largest moon of Jupiter and the third-largest moon in the Solar System.', 4500, 1610, 1882.70, false, true,
 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'The largest moon of Saturn, known for its dense atmosphere.', 4500, 1655, 1253.40, false, true, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 'The second-largest moon of Saturn and the ninth-largest moon in the Solar System.', 4500, 1672, 527.00, false, true, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'The third-largest moon of Saturn and known for its unusual two-tone coloration.', 4500, 1671, 3560.40, false, true, 6)
;
INSERT INTO public.moon VALUES (11, 'Miranda', 'The smallest and innermost of Uranuss five major moons.', 4500, 1948, 129.80, false, true, 7);
INSERT INTO public.moon VALUES (12, 'Ariel', 'The fourth-largest of Uranus moons.', 4500, 1851, 191.20, false, true, 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', 'The third-largest moon of Uranus.', 4500, 1851, 266.00, false, true, 7);
INSERT INTO public.moon VALUES (14, 'Titania', 'The largest moon of Uranus and the eighth-largest moon in the Solar System.', 4500, 1787, 435.80, false, true, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 'The second-largest moon of Uranus and the ninth-largest moon in the Solar System.', 4500, 1787, 583.50, false, true, 7)
;
INSERT INTO public.moon VALUES (16, 'Triton', 'The largest moon of Neptune and the only large moon in the Solar System with a retrograde orbit.', 4500, 1846, 354.80, 
false, true, 8);
INSERT INTO public.moon VALUES (17, 'Nereid', 'The third-largest moon of Neptune and the second-most-massive.', 4500, 1949, 5513.60, false, true, 8);
INSERT INTO public.moon VALUES (18, 'Charon', 'The largest of Plutos five moons.', 4500, 1978, 19.60, false, true, 9);
INSERT INTO public.moon VALUES (19, 'Styx', 'The second-discovered moon of Pluto and the smallest.', 4500, 2012, 42.00, false, true, 9);
INSERT INTO public.moon VALUES (20, 'Nix', 'The third-discovered moon of Pluto.', 4500, 2005, 49.80, false, true, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in the Solar System and the closest to the Sun.', 4500, -1600, 0.39, false, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'The second planet from the Sun, named after the Roman goddess of love and beauty.', 4500, -1600, 0.72, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The third planet from the Sun and the only astronomical object known to harbor life.', 4500, -1600, 1.00, true, true, 1
);
INSERT INTO public.planet VALUES (4, 'Mars', 'The fourth planet from the Sun, often called the "Red Planet" due to its reddish appearance.', 4500, -1600, 1.52, false,
 true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the Solar System, known for its Great Red Spot.', 4500, -1600, 5.20, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The sixth planet from the Sun and the second-largest in the Solar System, known for its prominent ring system.', 4500,
 -1600, 9.58, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The seventh planet from the Sun, named after the Greek god of the sky.', 4500, 1781, 19.22, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The eighth and farthest-known Solar planet from the Sun.', 4500, 1846, 30.05, false, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'A dwarf planet in the Kuiper belt, the ninth-most-massive known body directly orbiting the Sun.', 4500, 1930, 39.48, fa
lse, true, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'An exoplanet orbiting the red dwarf Kepler-186, the first known Earth-sized planet to orbit within the habitable
 zone of another star.', 5000, 2014, 500.00, true, true, 6);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'An exoplanet discovered in 1999 orbiting the solar analog star HD 209458.', 6000, 1999, 159.00, false, true, 6);
INSERT INTO public.planet VALUES (12, 'WASP-12b', 'A hot Jupiter exoplanet discovered in 2008 orbiting the star WASP-12.', 5000, 2008, 871.00, false, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System.', 4600, -2600, 0.00, true, true, 2);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'A red dwarf star closest to the Sun.', 6000, 1915, 4.24, false, true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'The brightest star in the night sky.', 250, -1537, 8.60, false, false, 2);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 'A triple star system consisting of three stars.', 6000, -1537, 4.37, false, true, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'A red supergiant star in the constellation of Orion.', 8000, -1000, 643.00, false, false, 2);
INSERT INTO public.star VALUES (6, 'Vega', 'The brightest star in the constellation of Lyra.', 455, -240, 25.04, false, true, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_info_galaxy_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_info_galaxy_info_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy_info galaxy_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_info
    ADD CONSTRAINT galaxy_id_unique UNIQUE (galaxy_id);


--
-- Name: galaxy_info galaxy_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_info
    ADD CONSTRAINT galaxy_info_pkey PRIMARY KEY (galaxy_info_id);


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
-- Name: galaxy_info fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_info
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
