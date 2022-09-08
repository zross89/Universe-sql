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
    size_in_kpc integer,
    number_of_stars numeric,
    type text NOT NULL,
    constellation character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    parent_planet character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    habitable boolean,
    terrestrial boolean,
    star_id integer NOT NULL,
    moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    number_of_planets integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_size; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_size (
    star_size_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    size integer,
    galaxy_id integer
);


ALTER TABLE public.star_size OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 27, 4000000000, 'Spiral', NULL);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 15, NULL, 'Spiral', 'Virgo');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 47, 1000000000000, 'Spiral', 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 19, 40000000000, 'Spiral', 'Triangulum');
INSERT INTO public.galaxy VALUES (5, 'Messier 82', 37, NULL, 'Star burst', 'Ursa Major');
INSERT INTO public.galaxy VALUES (6, 'Hoags Object', NULL, NULL, 'Ring', 'Serpens Caput');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth', 3, 1, 'Moon');
INSERT INTO public.moon VALUES (2, 'Mars', 4, 1, 'Phobos');
INSERT INTO public.moon VALUES (3, 'Mars', 4, 1, 'Deimos');
INSERT INTO public.moon VALUES (4, 'Jupiter', 5, 1, 'Europa');
INSERT INTO public.moon VALUES (5, 'Jupiter', 5, 1, 'Ganymede');
INSERT INTO public.moon VALUES (6, 'Jupiter', 5, 1, 'Io');
INSERT INTO public.moon VALUES (7, 'Jupiter', 5, 1, 'Callisto');
INSERT INTO public.moon VALUES (8, 'Saturn', 6, 1, 'Titan');
INSERT INTO public.moon VALUES (9, 'Saturn', 6, 1, 'Enceladus');
INSERT INTO public.moon VALUES (10, 'Saturn', 6, 1, 'Mimas');
INSERT INTO public.moon VALUES (11, 'Saturn', 6, 1, 'Dione');
INSERT INTO public.moon VALUES (12, 'Saturn', 6, 1, 'Tethys');
INSERT INTO public.moon VALUES (13, 'Saturn', 6, 1, 'Iapetus');
INSERT INTO public.moon VALUES (14, 'Saturn', 6, 1, 'Hyperion');
INSERT INTO public.moon VALUES (15, 'Uranus', 7, 1, 'Titania');
INSERT INTO public.moon VALUES (16, 'Uranus', 7, 1, 'Umbriel');
INSERT INTO public.moon VALUES (17, 'Uranus', 7, 1, 'Ariel');
INSERT INTO public.moon VALUES (18, 'Uranus', 7, 1, 'Oberon');
INSERT INTO public.moon VALUES (19, 'Uranus', 7, 1, 'Miranda');
INSERT INTO public.moon VALUES (20, 'Uranus', 7, 1, 'Puck');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Venus', 1, false, true, 1, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, false, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, true, 1, 2);
INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, true, 1, 0);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, false, 1, 53);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, false, 1, 82);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, false, 1, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, false, 1, 14);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1b', 1, false, true, 4, 0);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1c', 1, NULL, true, 4, NULL);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 1, NULL, true, 4, NULL);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 1, NULL, true, 4, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Milky Way', 1, 8);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Milky Way', 1, 0);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Milky Way', 1, 3);
INSERT INTO public.star VALUES (4, 'Trappist-1', 'Milky Way', 1, 4);
INSERT INTO public.star VALUES (5, 'Tau Ceti', 'Milky Way', 1, 4);
INSERT INTO public.star VALUES (6, 'UY Scuti', 'Milky Way', 1, 0);


--
-- Data for Name: star_size; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_size VALUES (1, 'Sun', 'G2V', 432690, 1);
INSERT INTO public.star_size VALUES (2, 'Betelgeuse', 'M2lab', 383000000, 1);
INSERT INTO public.star_size VALUES (3, 'Proxima Centauri', 'M5.5 EV', 66659, 1);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star_size star_size_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_size
    ADD CONSTRAINT star_size_pkey PRIMARY KEY (star_size_id);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy uq_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uq_name UNIQUE (name);


--
-- Name: planet uq_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uq_planet_name UNIQUE (name);


--
-- Name: star uq_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uq_star_name UNIQUE (name);


--
-- Name: star_size uq_star_names; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_size
    ADD CONSTRAINT uq_star_names UNIQUE (name);


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
-- Name: star stars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

