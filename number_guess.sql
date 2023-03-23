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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    username character varying,
    games_played integer,
    best_game integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES ('user_1679601712975', 2, 369);
INSERT INTO public.players VALUES ('user_1679603388209', 2, 227);
INSERT INTO public.players VALUES ('user_1679602698663', 2, 363);
INSERT INTO public.players VALUES ('user_1679601712976', 5, 15);
INSERT INTO public.players VALUES ('user_1679602698664', 5, 1);
INSERT INTO public.players VALUES ('user_1679601723903', 2, 326);
INSERT INTO public.players VALUES ('user_1679603388210', 3, 395);
INSERT INTO public.players VALUES ('user_1679601723904', 5, 1);
INSERT INTO public.players VALUES ('user_1679602884209', 2, 756);
INSERT INTO public.players VALUES ('user_1679601912484', 2, 453);
INSERT INTO public.players VALUES ('user_1679602884210', 5, 1);
INSERT INTO public.players VALUES ('user_1679601912485', 5, 10);
INSERT INTO public.players VALUES ('user_1679603401743', 2, 690);
INSERT INTO public.players VALUES ('user_1679602909289', 2, 197);
INSERT INTO public.players VALUES ('user_1679602232873', 2, 611);
INSERT INTO public.players VALUES ('user_1679603401744', 5, 1);
INSERT INTO public.players VALUES ('user_1679602232874', 5, 1);
INSERT INTO public.players VALUES ('user_1679602909290', 5, 99);
INSERT INTO public.players VALUES ('user_1679602597272', 2, 1);
INSERT INTO public.players VALUES ('user_1679602597273', 5, 1);
INSERT INTO public.players VALUES ('user_1679603462572', 2, 284);
INSERT INTO public.players VALUES ('user_1679603004810', 2, 296);
INSERT INTO public.players VALUES ('user_1679603004811', 4, 465);
INSERT INTO public.players VALUES ('user_1679603462573', 5, 1);
INSERT INTO public.players VALUES ('user_1679603025849', 2, 256);
INSERT INTO public.players VALUES ('user_1679603536878', 2, 1);
INSERT INTO public.players VALUES ('user_1679603025850', 5, 32);
INSERT INTO public.players VALUES ('user_1679603536879', 5, 33);
INSERT INTO public.players VALUES ('user_1679603055363', 2, 604);
INSERT INTO public.players VALUES ('user_1679603055364', 5, 234);


--
-- PostgreSQL database dump complete
--

