--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.3
-- Dumped by pg_dump version 9.3.3
-- Started on 2024-05-20 21:56:41

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 1953 (class 0 OID 33077)
-- Dependencies: 176
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO customers (cus_uid, cus_name, email, ph_no, gender, bdate, address, uid) VALUES (1, 'kajal S', 'kj@email.com', '1234567890', 'F ', '2023-04-12', '       agartala             ', 102);
INSERT INTO customers (cus_uid, cus_name, email, ph_no, gender, bdate, address, uid) VALUES (3, 'gita sen', 'gita@gmail.com', '123456', 'F ', '1988-06-10', '                    delhi,india', 567);
INSERT INTO customers (cus_uid, cus_name, email, ph_no, gender, bdate, address, uid) VALUES (5, 'raj p', 'r@p.com', '3456', 'M ', '2000-03-10', 'agartala', 678);
INSERT INTO customers (cus_uid, cus_name, email, ph_no, gender, bdate, address, uid) VALUES (2, 'veer k', 'v@k.com', '9087654321', 'M ', '2023-10-12', '        inkj            ', 902);
INSERT INTO customers (cus_uid, cus_name, email, ph_no, gender, bdate, address, uid) VALUES (4, 'william s', 'will@gmail.com', '45678', 'M ', '2023-04-12', '        england            ', 901);
INSERT INTO customers (cus_uid, cus_name, email, ph_no, gender, bdate, address, uid) VALUES (6, 'sanju singh', 'sanju@gmail.com', '34567', 'M ', '2023-04-12', '            kerala        ', NULL);


--
-- TOC entry 1959 (class 0 OID 0)
-- Dependencies: 175
-- Name: customers_cus_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('customers_cus_uid_seq', 6, true);


SET default_tablespace = '';

--
-- TOC entry 1844 (class 2606 OID 33082)
-- Name: pkey_customers; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT pkey_customers PRIMARY KEY (cus_uid);


-- Completed on 2024-05-20 21:56:42

--
-- PostgreSQL database dump complete
--

