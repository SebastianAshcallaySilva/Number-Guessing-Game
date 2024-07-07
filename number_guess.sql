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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    num_of_guesses integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (4, 10, 7);
INSERT INTO public.games VALUES (5, 9, 7);
INSERT INTO public.games VALUES (6, 6, 8);
INSERT INTO public.games VALUES (7, 8, 8);
INSERT INTO public.games VALUES (8, 750, 9);
INSERT INTO public.games VALUES (9, 187, 9);
INSERT INTO public.games VALUES (10, 437, 10);
INSERT INTO public.games VALUES (11, 497, 10);
INSERT INTO public.games VALUES (12, 406, 9);
INSERT INTO public.games VALUES (13, 950, 9);
INSERT INTO public.games VALUES (14, 83, 9);
INSERT INTO public.games VALUES (15, 945, 11);
INSERT INTO public.games VALUES (16, 544, 11);
INSERT INTO public.games VALUES (17, 257, 12);
INSERT INTO public.games VALUES (18, 829, 12);
INSERT INTO public.games VALUES (19, 622, 11);
INSERT INTO public.games VALUES (20, 583, 11);
INSERT INTO public.games VALUES (21, 11, 11);
INSERT INTO public.games VALUES (22, 11, 7);
INSERT INTO public.games VALUES (23, 490, 13);
INSERT INTO public.games VALUES (24, 555, 13);
INSERT INTO public.games VALUES (25, 476, 14);
INSERT INTO public.games VALUES (26, 45, 14);
INSERT INTO public.games VALUES (27, 312, 13);
INSERT INTO public.games VALUES (28, 105, 13);
INSERT INTO public.games VALUES (29, 542, 13);
INSERT INTO public.games VALUES (30, 6, 8);
INSERT INTO public.games VALUES (31, 313, 15);
INSERT INTO public.games VALUES (32, 557, 15);
INSERT INTO public.games VALUES (33, 627, 16);
INSERT INTO public.games VALUES (34, 592, 16);
INSERT INTO public.games VALUES (35, 394, 15);
INSERT INTO public.games VALUES (36, 6, 15);
INSERT INTO public.games VALUES (37, 119, 15);
INSERT INTO public.games VALUES (38, 285, 17);
INSERT INTO public.games VALUES (39, 700, 17);
INSERT INTO public.games VALUES (40, 519, 18);
INSERT INTO public.games VALUES (41, 346, 18);
INSERT INTO public.games VALUES (42, 594, 17);
INSERT INTO public.games VALUES (43, 690, 17);
INSERT INTO public.games VALUES (44, 196, 17);
INSERT INTO public.games VALUES (45, 13, 7);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (7, 'invdab17');
INSERT INTO public.users VALUES (8, 'elitewizard17');
INSERT INTO public.users VALUES (9, 'user_1720391820191');
INSERT INTO public.users VALUES (10, 'user_1720391820190');
INSERT INTO public.users VALUES (11, 'user_1720391984120');
INSERT INTO public.users VALUES (12, 'user_1720391984119');
INSERT INTO public.users VALUES (13, 'user_1720392111250');
INSERT INTO public.users VALUES (14, 'user_1720392111249');
INSERT INTO public.users VALUES (15, 'user_1720392349469');
INSERT INTO public.users VALUES (16, 'user_1720392349468');
INSERT INTO public.users VALUES (17, 'user_1720392376686');
INSERT INTO public.users VALUES (18, 'user_1720392376685');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 45, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 18, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

