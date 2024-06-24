--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.3
-- Dumped by pg_dump version 9.3.3
-- Started on 2024-05-20 21:41:34

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 1951 (class 0 OID 33045)
-- Dependencies: 174
-- Data for Name: mas_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('admin', '123', 1, 100);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('roshni', '123', 2, 101);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('ritik s', '789', 2, 234);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('shraddha j', '567', 2, 123);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('raj k', '1234', 2, 345);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('sanju s', '890', 2, 456);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('gita sen', '567', 3, 567);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('raj p', '567', 3, 678);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('sanjay singh', '7890', 3, 789);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('william s', '4567', 3, 901);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('veer k', '345', 3, 902);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('rahul roy', '6789', 3, 987);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('sanju singh', '4567', 3, 897);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('shraddha', '234', 3, 102);


SET default_tablespace = '';

--
-- TOC entry 1843 (class 2606 OID 33049)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mas_user
    ADD CONSTRAINT user_pkey PRIMARY KEY (uname);


-- Completed on 2024-05-20 21:41:34

--
-- PostgreSQL database dump complete
--

