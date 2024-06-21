--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.3
-- Dumped by pg_dump version 9.3.3
-- Started on 2024-05-20 21:52:53

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 1951 (class 0 OID 16671)
-- Dependencies: 170
-- Data for Name: mas_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mas_category (cat_id, cat_name) VALUES (1, 'Books');
INSERT INTO mas_category (cat_id, cat_name) VALUES (2, 'Mobiles');
INSERT INTO mas_category (cat_id, cat_name) VALUES (3, 'Clothes');
INSERT INTO mas_category (cat_id, cat_name) VALUES (4, 'AC');
INSERT INTO mas_category (cat_id, cat_name) VALUES (5, 'TV');
INSERT INTO mas_category (cat_id, cat_name) VALUES (6, 'Bag');


SET default_tablespace = '';

--
-- TOC entry 1843 (class 2606 OID 16675)
-- Name: mas_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mas_category
    ADD CONSTRAINT mas_category_pkey PRIMARY KEY (cat_id);


-- Completed on 2024-05-20 21:52:53

--
-- PostgreSQL database dump complete
--

