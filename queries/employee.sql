--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.3
-- Dumped by pg_dump version 9.3.3
-- Started on 2024-05-20 21:57:07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 1953 (class 0 OID 41239)
-- Dependencies: 178
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO employee (emp_id, emp_name, uid, email) VALUES (1, 'roshni', 101, 'roshni@email.com');
INSERT INTO employee (emp_id, emp_name, uid, email) VALUES (2, 'shraddha j', 123, 'sj@gmail.com');
INSERT INTO employee (emp_id, emp_name, uid, email) VALUES (3, 'ritik s', 234, 'r@s.com');
INSERT INTO employee (emp_id, emp_name, uid, email) VALUES (5, 'raj k', 345, 'raj@gmail.com');
INSERT INTO employee (emp_id, emp_name, uid, email) VALUES (4, 'sanju sen', 456, 'san@s.com');


--
-- TOC entry 1959 (class 0 OID 0)
-- Dependencies: 177
-- Name: employee_emp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('employee_emp_id_seq', 5, true);


SET default_tablespace = '';

--
-- TOC entry 1844 (class 2606 OID 41244)
-- Name: employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_id);


-- Completed on 2024-05-20 21:57:07

--
-- PostgreSQL database dump complete
--

