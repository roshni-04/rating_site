--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.3
-- Dumped by pg_dump version 9.3.3
-- Started on 2024-05-21 23:21:07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 1966 (class 0 OID 65894)
-- Dependencies: 183
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO employee (emp_id, emp_name, uid, email) VALUES (1, 'roshni', 101, 'rosh@wmail.com');
INSERT INTO employee (emp_id, emp_name, uid, email) VALUES (2, 'shraddha b', 106, 's@email.com');


--
-- TOC entry 1972 (class 0 OID 0)
-- Dependencies: 182
-- Name: employee_emp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('employee_emp_id_seq', 2, true);


SET default_tablespace = '';

--
-- TOC entry 1857 (class 2606 OID 65899)
-- Name: employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_id);


-- Completed on 2024-05-21 23:21:07

--
-- PostgreSQL database dump complete
--

