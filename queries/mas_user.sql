--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.3
-- Dumped by pg_dump version 9.3.3
-- Started on 2024-05-20 21:41:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 1964 (class 0 OID 65863)
-- Dependencies: 179
-- Data for Name: mas_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('admin', '123', 1, 100);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('roshni', '123', 2, 101);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('shraddha', '234', 3, 102);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('Shawn M', '345', 3, 105);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('rj d', '12', 3, 107);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('shraddha b', '567', 2, 106);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('pra d', '34', 3, 108);


SET default_tablespace = '';

--
-- TOC entry 1856 (class 2606 OID 65867)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mas_user
    ADD CONSTRAINT user_pkey PRIMARY KEY (uname);


-- Completed on 2024-05-20 21:41:35

--
-- PostgreSQL database dump complete
--

