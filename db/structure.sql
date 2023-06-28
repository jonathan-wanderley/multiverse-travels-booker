--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.3 (Ubuntu 15.3-1.pgdg22.04+1)

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
-- Name: migration_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migration_versions (
    version character varying(17) NOT NULL
);


ALTER TABLE public.migration_versions OWNER TO postgres;

--
-- Name: travel_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.travel_plans (
    id bigint NOT NULL,
    travel_stops integer[]
);


ALTER TABLE public.travel_plans OWNER TO postgres;

--
-- Name: travel_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.travel_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.travel_plans_id_seq OWNER TO postgres;

--
-- Name: travel_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.travel_plans_id_seq OWNED BY public.travel_plans.id;


--
-- Name: travel_plans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.travel_plans ALTER COLUMN id SET DEFAULT nextval('public.travel_plans_id_seq'::regclass);


--
-- Name: travel_plans travel_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.travel_plans
    ADD CONSTRAINT travel_plans_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

