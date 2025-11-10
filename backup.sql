--
-- PostgreSQL database dump
--

\restrict 5o6KtDALWiDAtytCbU7U9nOljpHltskJuLJbVfedgSMdmtcecj6FFRt7b9bbbQP

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: Invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Invoice" (
    id text NOT NULL,
    "invoiceNo" text NOT NULL,
    "vendorId" text NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    "dueDate" timestamp(3) without time zone,
    status text NOT NULL,
    "totalAmount" numeric(14,2) NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Invoice" OWNER TO postgres;

--
-- Name: LineItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LineItem" (
    id text NOT NULL,
    "invoiceId" text NOT NULL,
    description text NOT NULL,
    quantity integer NOT NULL,
    "unitPrice" numeric(12,2) NOT NULL
);


ALTER TABLE public."LineItem" OWNER TO postgres;

--
-- Name: Payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Payment" (
    id text NOT NULL,
    "invoiceId" text NOT NULL,
    "paidOn" timestamp(3) without time zone NOT NULL,
    amount numeric(14,2) NOT NULL,
    method text
);


ALTER TABLE public."Payment" OWNER TO postgres;

--
-- Name: Vendor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vendor" (
    id text NOT NULL,
    name text NOT NULL,
    category text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Vendor" OWNER TO postgres;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Data for Name: Invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Invoice" (id, "invoiceNo", "vendorId", date, "dueDate", status, "totalAmount", "createdAt") FROM stdin;
cmhrhinc30002ujdg4ju4zxia	1234	cmhrhinbm0000ujdga5mx4bqr	2025-11-04 00:00:00	\N	processed	-358.79	2025-11-09 09:02:00.099
cmhrhlirk0002ujsoed5bcub6	1234-19f79fd4-382e-4e00-9782-dab154fa6fec	cmhrhinbm0000ujdga5mx4bqr	2025-11-04 00:00:00	\N	processed	-358.79	2025-11-09 09:04:14.145
cmhrhlis80009ujsor32heui4	1234-1ec0699e-770f-4749-a5c1-681cc56b5b3b	cmhrhinbm0000ujdga5mx4bqr	2025-11-04 00:00:00	\N	processed	-358.79	2025-11-09 09:04:14.168
cmhrhlisq000gujsof9zp9hnv	RE-1001-6503745b-3b0a-46b2-a975-fd7d2f38a701	cmhrhlisi000eujso288ddp5m	2024-03-01 00:00:00	\N	processed	19.99	2025-11-09 09:04:14.186
cmhrhlit3000lujsobvlmxbiu	DE-001-776aaaf0-bc4f-41fe-876d-08ac7f1029ca	cmhrhlisx000jujso4ojtn0fb	2024-01-01 00:00:00	\N	processed	618.80	2025-11-09 09:04:14.199
cmhrhlith000sujsofpdwheuo	1234-ad67854a-364d-4a92-b164-74d8ba66bbad	cmhrhlitc000qujsokrn3hq12	2020-01-01 00:00:00	\N	processed	3653.30	2025-11-09 09:04:14.213
cmhrhliu10013ujsougflzdjn	DE/01/12/2023-587f6a6b-a6d3-45a1-aba9-2b203fae3030	cmhrhlitv0011ujsoxybk2u7v	2023-12-15 00:00:00	\N	processed	541.45	2025-11-09 09:04:14.233
cmhrhliud0018ujsofvg5k44h	Re-147/2025-fc93025f-e704-4147-9540-90a5cb2854b0	cmhrhliu70016ujsoilwj6bt0	2025-08-08 00:00:00	\N	processed	2840.00	2025-11-09 09:04:14.246
cmhrhliv1001lujsorekyul36	M1675-8e2d241d-cd55-48e7-b032-50fc1e611a4d	cmhrhliuu001jujsodkw3j6n4	2014-05-28 00:00:00	\N	processed	312.96	2025-11-09 09:04:14.269
cmhrhlivr0020ujso0o3lps7b	2015-1234-3138c695-a755-4ce4-995d-3cc54ae132e1	cmhrhlivl001yujsokuycqv0t	2015-08-07 00:00:00	\N	processed	1190.00	2025-11-09 09:04:14.295
cmhrhliw20025ujsoz18cgy9a	Re-147/2025-7e7edb10-226f-4d05-ba0f-05168a13a213	cmhrhliu70016ujsoilwj6bt0	2025-08-08 00:00:00	\N	processed	2840.00	2025-11-09 09:04:14.307
cmhrhliws002iujso6d3cykgn	012345-3b15c338-a60e-475a-b112-a870778129be	cmhrhliwm002gujsosw6767xa	2020-05-27 00:00:00	\N	processed	4645.00	2025-11-09 09:04:14.332
cmhrhlixf002xujsocp7j94r6	S018418-0653cd77-5fc6-47c5-8a9e-e9d9dc3dcb74	cmhrhlixa002vujso68scfssq	2025-10-27 00:00:00	\N	processed	84.00	2025-11-09 09:04:14.356
cmhrhlixp0032ujso2xing5qx	123100401-44e1cac4-e2d5-48b4-8d55-73be10b25907	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:14.366
cmhrhliz40043ujsodviodgy1	123100401-bc46bb3b-9528-4aee-a929-de3d7e636faa	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:14.416
cmhrhlj0o0054ujsoup6mc5d7	123100401-cfef7c11-d648-4f0a-ba3c-65fd0ed428e2	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:14.472
cmhrhlj200065ujsodcyyu3oa	123100401-90e752fc-f49a-4380-a35d-7b678eb46f11	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:14.52
cmhrhlj3g0076ujso04pyoc8h	123100401-9130f9f3-3c92-4d35-81ed-761c5a2c8503	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:14.572
cmhrhlj4z0087ujsod9iszne7	123100401-115ccb0e-8459-4aaf-89bb-5f63a519938e	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:14.628
cmhrhlj6f0098ujso5jlczjqb	123100401-e46ca248-d57e-4303-890f-567dacbdd36c	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:14.679
cmhrhlj7w00a9ujsobfqpspwi	123100401-ba22a847-1055-42d2-8c98-d2d3abfa3fa7	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:14.733
cmhrhlj9c00baujsotmqlkmmv	123100401-eac9dba4-91c3-439b-bd46-b0d4ac555d9a	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:14.784
cmhrhljax00cbujsoxgq3s417	123100401-778e0a66-0b02-4807-bb6d-74ccd2e49e94	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:14.841
cmhrhljcf00dcujsozic43v1q	123100401-de2da8f2-1009-444b-ae13-880503432b16	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:14.896
cmhrhljdu00edujsok737nlmo	123100401-e91e24bd-cce0-4f2a-b8bb-7787a5917108	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:14.946
cmhrhljf700feujsoguofi1by	123100401-3a7ca133-f678-430b-b839-ab3348636510	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:14.996
cmhrhljgp00gfujso84syjtn7	123100401-881f87b3-d894-47e3-92bd-073d47afb694	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.049
cmhrhlji700hgujson2ti76ke	123100401-5afa41f2-e931-4544-bc6c-f48638b60aea	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.103
cmhrhljjn00ihujsopuf6cgjn	123100401-601d9071-db22-4cfd-bfe4-318b5d55c7fc	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.155
cmhrhljky00jiujsorvyi1xsc	123100401-dca7bbec-030b-4466-ba24-2f9a6fbd2004	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.202
cmhrhljm800kjujsowohqgtau	123100401-a7e70342-12bd-4a63-b87b-3c1b0d265aa0	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.248
cmhrhljni00lkujso4kj1b8ck	123100401-4aadb5d6-a139-463e-bcd2-cd698d68552a	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.295
cmhrhljou00mlujsohu1mqzgc	123100401-83bf7f0e-7830-4fe3-ae72-29d166b0e19b	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.342
cmhrhljq800nmujsoxjyx8wa3	123100401-4a31d585-dcc1-4179-af24-847335ea4cf5	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.392
cmhrhljrj00onujsogopcr8x8	123100401-5116aed3-683e-4747-a997-b76aebff791f	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.44
cmhrhljsx00poujsou68fscy3	123100401-7ea4466f-34df-4119-85a3-9d981e3c1477	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.489
cmhrhljuc00qpujso21nzjzfd	123100401-d66ab537-41af-4958-8ba9-7426a7258784	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.54
cmhrhljvq00rqujsor7vs34iz	123100401-47004cd1-e024-4283-882d-bdb1ecdd61c5	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.59
cmhrhljx300srujsof1ipnn17	123100401-626e7092-0d72-487f-a64f-c49865749471	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.64
cmhrhljye00tsujsoj9suyil3	123100401-3566240f-2462-4147-b717-36003afd3fca	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.687
cmhrhljzr00utujsoz4aao91l	123100401-35171195-f875-4aa3-ac17-a00bd54d9da3	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.735
cmhrhlk1300vuujsohe8opm2m	123100401-171d72d8-5828-414b-9378-673951868faf	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.783
cmhrhlk2d00wvujsoz758cnk6	123100401-022b0c21-f79a-4779-813f-578b9f4d397b	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.829
cmhrhlk3q00xwujsotkn9iyxr	123100401-a211cfa1-8172-4d0d-9816-4be32eaeba3b	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.878
cmhrhlk4x00yxujsod2w3ogt8	123100401-4b4399c8-4b4d-4634-b9f5-f0f3e8d5b91d	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.922
cmhrhlk6200zyujsol3fg226w	123100401-e7e7f481-85d6-4a12-88d0-b2bf0776e44c	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:15.962
cmhrhlk74010zujsofwh6960e	123100401-4f359a0b-61d5-4bf2-bd9e-78d8c10bb7ae	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:16
cmhrhlk8a0120ujsod7ahlofo	123100401-ef30f4cc-435b-4628-b7fe-d91d85873959	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:16.042
cmhrhlk9i0131ujsou5d5lrt8	123100401-171033cd-7377-4a2e-855e-a6c0059bd2ae	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:16.086
cmhrhlkan0142ujsolf44nxub	123100401-f98f2e91-5515-4c27-bb34-81fa2a91bc21	cmhrhlixk0030ujsod3ps5mzg	2024-03-01 00:00:00	\N	processed	381.12	2025-11-09 09:04:16.127
\.


--
-- Data for Name: LineItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."LineItem" (id, "invoiceId", description, quantity, "unitPrice") FROM stdin;
cmhrhinc90004ujdgxqeevke3	cmhrhinc30002ujdg4ju4zxia	Beispieldienstleistung	3	-69.00
cmhrhincd0006ujdgr7txtdlp	cmhrhinc30002ujdg4ju4zxia	Beispielprodukt	1	-129.00
cmhrhliru0004ujso423b7qyp	cmhrhlirk0002ujsoed5bcub6	Beispieldienstleistung	3	-69.00
cmhrhlirz0006ujsoqnv5gjjw	cmhrhlirk0002ujsoed5bcub6	Beispielprodukt	1	-129.00
cmhrhlisc000bujsopp8t075v	cmhrhlis80009ujsor32heui4	Beispieldienstleistung	3	-69.00
cmhrhlise000dujsohpu00j2f	cmhrhlis80009ujsor32heui4	Beispielprodukt	1	-129.00
cmhrhlisu000iujsoxj09k00h	cmhrhlisq000gujsof9zp9hnv	belegFuchs Premium	1	19.99
cmhrhlit6000nujso3blwgrqe	cmhrhlit3000lujsobvlmxbiu	Ersatzteile Heizung	1	320.00
cmhrhlit9000pujsofgcn5nl9	cmhrhlit3000lujsobvlmxbiu	Arbeitsstunden	2	100.00
cmhrhlitk000uujso93659md0	cmhrhlith000sujsofpdwheuo	Beratung Website Neugestaltung Analyse der bestehenden Website und Aufstellung der notwendigen Änderungen.	4	80.00
cmhrhlitn000wujsoot78wq5j	cmhrhlith000sujsofpdwheuo	Entwicklung Website example.com	30	80.00
cmhrhlitq000yujsoz87sy7qp	cmhrhlith000sujsofpdwheuo	Dokumentation	3	80.00
cmhrhlits0010ujsobizqe2c2	cmhrhlith000sujsofpdwheuo	Projektübergabe	1	110.00
cmhrhliu50015ujsol92v2zqt	cmhrhliu10013ujsougflzdjn	Marketing-Service	1	541.45
cmhrhliug001aujso1ee4926a	cmhrhliud0018ujsofvg5k44h	Farbe weis - Eimer 2,5 Liter	10	72.49
cmhrhliuj001cujso7o57d1mh	cmhrhliud0018ujsofvg5k44h	Farbe blau - Eimer 2,5 Liter	10	50.00
cmhrhlium001eujsok4ost3n5	cmhrhliud0018ujsofvg5k44h	Arbeitsstunde Helfer	15	50.00
cmhrhliuo001gujsoy1421xgd	cmhrhliud0018ujsofvg5k44h	Arbeitsstunde Meister	15	74.99
cmhrhliur001iujsogjesjmj3	cmhrhliud0018ujsofvg5k44h	Anfahrt	1	59.50
cmhrhliv4001nujsoz7r6llsk	cmhrhliv1001lujsorekyul36	B-3025, Farbe Grün Musterartikel	1	47.00
cmhrhliv7001pujsos44cmrtx	cmhrhliv1001lujsorekyul36	B-3025, Farbe Rot Musterartikel	1	47.00
cmhrhliva001rujsouf8kqh5j	cmhrhliv1001lujsorekyul36	B-0050, Farbe Blau Musterartikel ABC	2	36.00
cmhrhlivc001tujso5s7l3b7f	cmhrhliv1001lujsorekyul36	A-0050, Edelstahl Musterartikel	1	29.00
cmhrhlivf001vujsoaeyrsnff	cmhrhliv1001lujsorekyul36	A-0086, Antik Look Musterartikel	1	56.00
cmhrhlivi001xujsokwlfw4xm	cmhrhliv1001lujsorekyul36	Versand und Verpackung	1	11.99
cmhrhlivu0022ujso7z2i33vi	cmhrhlivr0020ujso0o3lps7b	Item	1	0.00
cmhrhliw60027ujso2lakdfri	cmhrhliw20025ujsoz18cgy9a	Farbe weis - Eimer 2,5 Liter	10	72.49
cmhrhliw90029ujso9s5qjj3t	cmhrhliw20025ujsoz18cgy9a	Farbe blau - Eimer 2,5 Liter	10	50.00
cmhrhliwd002bujsovkyg5rxk	cmhrhliw20025ujsoz18cgy9a	Arbeitsstunde Helfer	15	50.00
cmhrhliwh002dujso2e3pdkzv	cmhrhliw20025ujsoz18cgy9a	Arbeitsstunde Meister	15	74.99
cmhrhliwk002fujso2ggpuqyg	cmhrhliw20025ujsoz18cgy9a	Anfahrt	1	59.50
cmhrhliwv002kujsopctohnwe	cmhrhliws002iujso6d3cykgn	Services, Products & Goods | Domestic	1	750.00
cmhrhliwy002mujso9wlq8oe9	cmhrhliws002iujso6d3cykgn	Services, Products & Goods | Export	1	1400.00
cmhrhlix1002oujso95832k55	cmhrhliws002iujso6d3cykgn	Hotels & Books | Reduced	1	350.00
cmhrhlix3002qujsor31o6efh	cmhrhliws002iujso6d3cykgn	Education & Training	1	1290.00
cmhrhlix5002sujso4n225x4o	cmhrhliws002iujso6d3cykgn	Medical Service	1	430.00
cmhrhlix8002uujso7mbbskl4	cmhrhliws002iujso6d3cykgn	Domestic & International Transport	1	137.60
cmhrhlixi002zujsofe5kx3j2	cmhrhlixf002xujsocp7j94r6	1 SWIET @@ 560	0	560.00
cmhrhlixs0034ujsolbdg7j2e	cmhrhlixp0032ujso2xing5qx	Basic Fee wmView	1	130.00
cmhrhlixv0036ujsoob05qmu0	cmhrhlixp0032ujso2xing5qx	Basis fee for additional user accounts	0	10.00
cmhrhlixy0038ujsojwvnihr5	cmhrhlixp0032ujso2xing5qx	Basic Fee wmPos	0	50.00
cmhrhliy1003aujsoqvwpiqzs	cmhrhlixp0032ujso2xing5qx	Basic Fee wmGuide	0	1000.00
cmhrhliy3003cujsow0kkj4ma	cmhrhlixp0032ujso2xing5qx	Change of user accounts	0	10.00
cmhrhliy5003eujsovuhnjyym	cmhrhlixp0032ujso2xing5qx	Transaction Fee T1	14	0.58
cmhrhliy8003gujsojssi51i6	cmhrhlixp0032ujso2xing5qx	Transaction Fee T2	0	0.70
cmhrhliyb003iujsotsko73if	cmhrhlixp0032ujso2xing5qx	Transaction Fee T3	162	1.50
cmhrhliyd003kujso33vj1hve	cmhrhlixp0032ujso2xing5qx	Transaction Fee T4	0	0.50
cmhrhliyg003mujsoosabivr8	cmhrhlixp0032ujso2xing5qx	Transaction Fee T5	0	0.80
cmhrhliyj003oujso6sy1sl57	cmhrhlixp0032ujso2xing5qx	Transaction Fee T6	0	1.80
cmhrhliyl003qujso9neu3k55	cmhrhlixp0032ujso2xing5qx	Transaction Fee G1	0	0.30
cmhrhliyn003sujsogbsmi5ez	cmhrhlixp0032ujso2xing5qx	Transaction Fee G2	0	0.30
cmhrhliyp003uujsofqjvhrd4	cmhrhlixp0032ujso2xing5qx	Transaction Fee G3	0	0.40
cmhrhliys003wujsoswbuzjrl	cmhrhlixp0032ujso2xing5qx	Transaction Fee G4	0	0.40
cmhrhliyu003yujsowepj6vdq	cmhrhlixp0032ujso2xing5qx	Transaction Fee G5	0	0.30
cmhrhliyx0040ujso0v6yep5g	cmhrhlixp0032ujso2xing5qx	Transaction Fee G6	0	0.30
cmhrhliz70045ujsop8ap5b4h	cmhrhliz40043ujsodviodgy1	Basic Fee wmView	1	130.00
cmhrhliza0047ujsohrvk7tlb	cmhrhliz40043ujsodviodgy1	Basis fee for additional user accounts	0	10.00
cmhrhlizc0049ujsoznshezx3	cmhrhliz40043ujsodviodgy1	Basic Fee wmPos	0	50.00
cmhrhlize004bujso0y2r89mb	cmhrhliz40043ujsodviodgy1	Basic Fee wmGuide	0	1000.00
cmhrhlizh004dujso9vsidofy	cmhrhliz40043ujsodviodgy1	Change of user accounts	0	10.00
cmhrhlizj004fujsoil2wc802	cmhrhliz40043ujsodviodgy1	Transaction Fee T1	14	0.58
cmhrhlizm004hujso9fb7x5r6	cmhrhliz40043ujsodviodgy1	Transaction Fee T2	0	0.70
cmhrhlizo004jujsodc40z6pm	cmhrhliz40043ujsodviodgy1	Transaction Fee T3	162	1.50
cmhrhlizr004lujsouvyootrw	cmhrhliz40043ujsodviodgy1	Transaction Fee T4	0	0.50
cmhrhlizu004nujsos503t1za	cmhrhliz40043ujsodviodgy1	Transaction Fee T5	0	0.80
cmhrhlizw004pujso4g1mar0e	cmhrhliz40043ujsodviodgy1	Transaction Fee T6	0	1.80
cmhrhlizz004rujsobzumv0ac	cmhrhliz40043ujsodviodgy1	Transaction Fee G1	0	0.30
cmhrhlj01004tujsorx9qm0yb	cmhrhliz40043ujsodviodgy1	Transaction Fee G2	0	0.30
cmhrhlj04004vujsok6qe9jtm	cmhrhliz40043ujsodviodgy1	Transaction Fee G3	0	0.40
cmhrhlj07004xujso0uh9xjfl	cmhrhliz40043ujsodviodgy1	Transaction Fee G4	0	0.40
cmhrhlj0d004zujso7aiyfmg5	cmhrhliz40043ujsodviodgy1	Transaction Fee G5	0	0.30
cmhrhlj0g0051ujsow1vqa5k9	cmhrhliz40043ujsodviodgy1	Transaction Fee G6	0	0.30
cmhrhlj0q0056ujsopr6dymk1	cmhrhlj0o0054ujsoup6mc5d7	Basic Fee wmView	1	130.00
cmhrhlj0s0058ujsox8uphcdz	cmhrhlj0o0054ujsoup6mc5d7	Basis fee for additional user accounts	0	10.00
cmhrhlj0v005aujsouxw6pk3d	cmhrhlj0o0054ujsoup6mc5d7	Basic Fee wmPos	0	50.00
cmhrhlj0x005cujsoe1up0opw	cmhrhlj0o0054ujsoup6mc5d7	Basic Fee wmGuide	0	1000.00
cmhrhlj0z005eujsohr7buwb2	cmhrhlj0o0054ujsoup6mc5d7	Change of user accounts	0	10.00
cmhrhlj12005gujsor1ltf4ab	cmhrhlj0o0054ujsoup6mc5d7	Transaction Fee T1	14	0.58
cmhrhlj15005iujsoyxtsfdqh	cmhrhlj0o0054ujsoup6mc5d7	Transaction Fee T2	0	0.70
cmhrhlj18005kujsooerdrou6	cmhrhlj0o0054ujsoup6mc5d7	Transaction Fee T3	162	1.50
cmhrhlj1a005mujso8ciqdbq7	cmhrhlj0o0054ujsoup6mc5d7	Transaction Fee T4	0	0.50
cmhrhlj1d005oujsolx2ziii2	cmhrhlj0o0054ujsoup6mc5d7	Transaction Fee T5	0	0.80
cmhrhlj1e005qujsoeic3d7nz	cmhrhlj0o0054ujsoup6mc5d7	Transaction Fee T6	0	1.80
cmhrhlj1h005sujso0dqrpiyo	cmhrhlj0o0054ujsoup6mc5d7	Transaction Fee G1	0	0.30
cmhrhlj1j005uujsoegp1esdt	cmhrhlj0o0054ujsoup6mc5d7	Transaction Fee G2	0	0.30
cmhrhlj1m005wujso0cbh7q6z	cmhrhlj0o0054ujsoup6mc5d7	Transaction Fee G3	0	0.40
cmhrhlj1o005yujsogov37258	cmhrhlj0o0054ujsoup6mc5d7	Transaction Fee G4	0	0.40
cmhrhlj1r0060ujsos2i4xuwm	cmhrhlj0o0054ujsoup6mc5d7	Transaction Fee G5	0	0.30
cmhrhlj1t0062ujsooq61e3ss	cmhrhlj0o0054ujsoup6mc5d7	Transaction Fee G6	0	0.30
cmhrhlj230067ujso5zxhoo0s	cmhrhlj200065ujsodcyyu3oa	Basic Fee wmView	1	130.00
cmhrhlj250069ujso9r442ck5	cmhrhlj200065ujsodcyyu3oa	Basis fee for additional user accounts	0	10.00
cmhrhlj27006bujso2z20n49j	cmhrhlj200065ujsodcyyu3oa	Basic Fee wmPos	0	50.00
cmhrhlj29006dujsoqd9c7uy8	cmhrhlj200065ujsodcyyu3oa	Basic Fee wmGuide	0	1000.00
cmhrhlj2b006fujso1gq0jwyf	cmhrhlj200065ujsodcyyu3oa	Change of user accounts	0	10.00
cmhrhlj2e006hujso4b19gwqa	cmhrhlj200065ujsodcyyu3oa	Transaction Fee T1	14	0.58
cmhrhlj2h006jujsoiklfny91	cmhrhlj200065ujsodcyyu3oa	Transaction Fee T2	0	0.70
cmhrhlj2j006lujsoff8cziqe	cmhrhlj200065ujsodcyyu3oa	Transaction Fee T3	162	1.50
cmhrhlj2m006nujsoq9wyjmc8	cmhrhlj200065ujsodcyyu3oa	Transaction Fee T4	0	0.50
cmhrhlj2o006pujso3ybemaco	cmhrhlj200065ujsodcyyu3oa	Transaction Fee T5	0	0.80
cmhrhlj2r006rujsoos61p2b2	cmhrhlj200065ujsodcyyu3oa	Transaction Fee T6	0	1.80
cmhrhlj2t006tujsolqg7gsw8	cmhrhlj200065ujsodcyyu3oa	Transaction Fee G1	0	0.30
cmhrhlj2w006vujsorp3m2o6h	cmhrhlj200065ujsodcyyu3oa	Transaction Fee G2	0	0.30
cmhrhlj2z006xujso8xnx8k75	cmhrhlj200065ujsodcyyu3oa	Transaction Fee G3	0	0.40
cmhrhlj32006zujsoncalmbfa	cmhrhlj200065ujsodcyyu3oa	Transaction Fee G4	0	0.40
cmhrhlj340071ujsoc9t5rief	cmhrhlj200065ujsodcyyu3oa	Transaction Fee G5	0	0.30
cmhrhlj370073ujso0uhycekw	cmhrhlj200065ujsodcyyu3oa	Transaction Fee G6	0	0.30
cmhrhlj3j0078ujso7pch0rsf	cmhrhlj3g0076ujso04pyoc8h	Basic Fee wmView	1	130.00
cmhrhlj3m007aujsozdgcqk47	cmhrhlj3g0076ujso04pyoc8h	Basis fee for additional user accounts	0	10.00
cmhrhlj3o007cujsodvmc3r24	cmhrhlj3g0076ujso04pyoc8h	Basic Fee wmPos	0	50.00
cmhrhlj3q007eujso3t1e8b6p	cmhrhlj3g0076ujso04pyoc8h	Basic Fee wmGuide	0	1000.00
cmhrhlj3t007gujsox113sjn2	cmhrhlj3g0076ujso04pyoc8h	Change of user accounts	0	10.00
cmhrhlj3w007iujsop2f1c0ti	cmhrhlj3g0076ujso04pyoc8h	Transaction Fee T1	14	0.58
cmhrhlj3z007kujsoqekxuqs9	cmhrhlj3g0076ujso04pyoc8h	Transaction Fee T2	0	0.70
cmhrhlj42007mujsoci4h71a6	cmhrhlj3g0076ujso04pyoc8h	Transaction Fee T3	162	1.50
cmhrhlj45007oujso6flhn7ko	cmhrhlj3g0076ujso04pyoc8h	Transaction Fee T4	0	0.50
cmhrhlj48007qujsocrnai3vd	cmhrhlj3g0076ujso04pyoc8h	Transaction Fee T5	0	0.80
cmhrhlj4c007sujso6f7c7k21	cmhrhlj3g0076ujso04pyoc8h	Transaction Fee T6	0	1.80
cmhrhlj4f007uujso145iakpe	cmhrhlj3g0076ujso04pyoc8h	Transaction Fee G1	0	0.30
cmhrhlj4i007wujsoiv9j08un	cmhrhlj3g0076ujso04pyoc8h	Transaction Fee G2	0	0.30
cmhrhlj4l007yujso91n19ln4	cmhrhlj3g0076ujso04pyoc8h	Transaction Fee G3	0	0.40
cmhrhlj4n0080ujso6b7b0sl5	cmhrhlj3g0076ujso04pyoc8h	Transaction Fee G4	0	0.40
cmhrhlj4p0082ujsojrpjit7e	cmhrhlj3g0076ujso04pyoc8h	Transaction Fee G5	0	0.30
cmhrhlj4s0084ujsoyie3zi1h	cmhrhlj3g0076ujso04pyoc8h	Transaction Fee G6	0	0.30
cmhrhlj520089ujsokdctxydt	cmhrhlj4z0087ujsod9iszne7	Basic Fee wmView	1	130.00
cmhrhlj54008bujsolhktx4rg	cmhrhlj4z0087ujsod9iszne7	Basis fee for additional user accounts	0	10.00
cmhrhlj57008dujso1u36qsl4	cmhrhlj4z0087ujsod9iszne7	Basic Fee wmPos	0	50.00
cmhrhlj5a008fujsoctnhjvdr	cmhrhlj4z0087ujsod9iszne7	Basic Fee wmGuide	0	1000.00
cmhrhlj5c008hujsob984zm4r	cmhrhlj4z0087ujsod9iszne7	Change of user accounts	0	10.00
cmhrhlj5e008jujsogj0qhlb6	cmhrhlj4z0087ujsod9iszne7	Transaction Fee T1	14	0.58
cmhrhlj5h008lujsozh3m2oo7	cmhrhlj4z0087ujsod9iszne7	Transaction Fee T2	0	0.70
cmhrhlj5j008nujsodyrzkv7l	cmhrhlj4z0087ujsod9iszne7	Transaction Fee T3	162	1.50
cmhrhlj5m008pujsog8h6ccgd	cmhrhlj4z0087ujsod9iszne7	Transaction Fee T4	0	0.50
cmhrhlj5p008rujsor78jufti	cmhrhlj4z0087ujsod9iszne7	Transaction Fee T5	0	0.80
cmhrhlj5r008tujsoaxvcft3j	cmhrhlj4z0087ujsod9iszne7	Transaction Fee T6	0	1.80
cmhrhlj5u008vujsorpvzypma	cmhrhlj4z0087ujsod9iszne7	Transaction Fee G1	0	0.30
cmhrhlj5w008xujsop9kxjfnr	cmhrhlj4z0087ujsod9iszne7	Transaction Fee G2	0	0.30
cmhrhlj5z008zujso79ikxcoz	cmhrhlj4z0087ujsod9iszne7	Transaction Fee G3	0	0.40
cmhrhlj610091ujso7irsuub3	cmhrhlj4z0087ujsod9iszne7	Transaction Fee G4	0	0.40
cmhrhlj640093ujsodlgeuv79	cmhrhlj4z0087ujsod9iszne7	Transaction Fee G5	0	0.30
cmhrhlj670095ujso6u5vdu62	cmhrhlj4z0087ujsod9iszne7	Transaction Fee G6	0	0.30
cmhrhlj6i009aujsopze1oxfc	cmhrhlj6f0098ujso5jlczjqb	Basic Fee wmView	1	130.00
cmhrhlj6k009cujsobshpjixa	cmhrhlj6f0098ujso5jlczjqb	Basis fee for additional user accounts	0	10.00
cmhrhlj6n009eujsokeo3bgqe	cmhrhlj6f0098ujso5jlczjqb	Basic Fee wmPos	0	50.00
cmhrhlj6p009gujso0fcjy4qk	cmhrhlj6f0098ujso5jlczjqb	Basic Fee wmGuide	0	1000.00
cmhrhlj6s009iujsoctolesuo	cmhrhlj6f0098ujso5jlczjqb	Change of user accounts	0	10.00
cmhrhlj6u009kujsokf4o235d	cmhrhlj6f0098ujso5jlczjqb	Transaction Fee T1	14	0.58
cmhrhlj6x009mujsowu3ez2li	cmhrhlj6f0098ujso5jlczjqb	Transaction Fee T2	0	0.70
cmhrhlj70009oujsozyvbjpql	cmhrhlj6f0098ujso5jlczjqb	Transaction Fee T3	162	1.50
cmhrhlj72009qujsoedp537m0	cmhrhlj6f0098ujso5jlczjqb	Transaction Fee T4	0	0.50
cmhrhlj75009sujsoqq58fpmt	cmhrhlj6f0098ujso5jlczjqb	Transaction Fee T5	0	0.80
cmhrhlj78009uujsoirb3r2ka	cmhrhlj6f0098ujso5jlczjqb	Transaction Fee T6	0	1.80
cmhrhlj7a009wujso6clagn7c	cmhrhlj6f0098ujso5jlczjqb	Transaction Fee G1	0	0.30
cmhrhlj7d009yujsovtifotw5	cmhrhlj6f0098ujso5jlczjqb	Transaction Fee G2	0	0.30
cmhrhlj7f00a0ujsop5h86m7k	cmhrhlj6f0098ujso5jlczjqb	Transaction Fee G3	0	0.40
cmhrhlj7i00a2ujsofmx8zkjj	cmhrhlj6f0098ujso5jlczjqb	Transaction Fee G4	0	0.40
cmhrhlj7l00a4ujsoegphh0qy	cmhrhlj6f0098ujso5jlczjqb	Transaction Fee G5	0	0.30
cmhrhlj7n00a6ujso1x84rlg5	cmhrhlj6f0098ujso5jlczjqb	Transaction Fee G6	0	0.30
cmhrhlj7z00abujsoeyn7gxn5	cmhrhlj7w00a9ujsobfqpspwi	Basic Fee wmView	1	130.00
cmhrhlj8200adujsouzp68jh3	cmhrhlj7w00a9ujsobfqpspwi	Basis fee for additional user accounts	0	10.00
cmhrhlj8500afujsocbredt1r	cmhrhlj7w00a9ujsobfqpspwi	Basic Fee wmPos	0	50.00
cmhrhlj8700ahujso9zhcdrms	cmhrhlj7w00a9ujsobfqpspwi	Basic Fee wmGuide	0	1000.00
cmhrhlj8a00ajujsoaj6nfrb4	cmhrhlj7w00a9ujsobfqpspwi	Change of user accounts	0	10.00
cmhrhlj8c00alujsofaol6e7b	cmhrhlj7w00a9ujsobfqpspwi	Transaction Fee T1	14	0.58
cmhrhlj8f00anujsorxfb75bz	cmhrhlj7w00a9ujsobfqpspwi	Transaction Fee T2	0	0.70
cmhrhlj8i00apujsozcqgvogd	cmhrhlj7w00a9ujsobfqpspwi	Transaction Fee T3	162	1.50
cmhrhlj8k00arujsowrnarsjc	cmhrhlj7w00a9ujsobfqpspwi	Transaction Fee T4	0	0.50
cmhrhlj8n00atujsoogyh38ft	cmhrhlj7w00a9ujsobfqpspwi	Transaction Fee T5	0	0.80
cmhrhlj8p00avujsos0kushzd	cmhrhlj7w00a9ujsobfqpspwi	Transaction Fee T6	0	1.80
cmhrhlj8s00axujsoe51no2a3	cmhrhlj7w00a9ujsobfqpspwi	Transaction Fee G1	0	0.30
cmhrhlj8u00azujsoe29pgne4	cmhrhlj7w00a9ujsobfqpspwi	Transaction Fee G2	0	0.30
cmhrhlj8x00b1ujsoddknlya0	cmhrhlj7w00a9ujsobfqpspwi	Transaction Fee G3	0	0.40
cmhrhlj9000b3ujsor7l43kfi	cmhrhlj7w00a9ujsobfqpspwi	Transaction Fee G4	0	0.40
cmhrhlj9200b5ujsoxzhy5otr	cmhrhlj7w00a9ujsobfqpspwi	Transaction Fee G5	0	0.30
cmhrhlj9400b7ujsorl42zrzt	cmhrhlj7w00a9ujsobfqpspwi	Transaction Fee G6	0	0.30
cmhrhlj9f00bcujsobmxqdxb9	cmhrhlj9c00baujsotmqlkmmv	Basic Fee wmView	1	130.00
cmhrhlj9h00beujsotuapnumm	cmhrhlj9c00baujsotmqlkmmv	Basis fee for additional user accounts	0	10.00
cmhrhlj9k00bgujsouoxfuq2w	cmhrhlj9c00baujsotmqlkmmv	Basic Fee wmPos	0	50.00
cmhrhlj9n00biujsokpyq3n1z	cmhrhlj9c00baujsotmqlkmmv	Basic Fee wmGuide	0	1000.00
cmhrhlj9q00bkujsozmckbnz4	cmhrhlj9c00baujsotmqlkmmv	Change of user accounts	0	10.00
cmhrhlj9s00bmujsok5leos2w	cmhrhlj9c00baujsotmqlkmmv	Transaction Fee T1	14	0.58
cmhrhlj9v00boujsoye3acgxc	cmhrhlj9c00baujsotmqlkmmv	Transaction Fee T2	0	0.70
cmhrhlj9y00bqujsoku2iqr5u	cmhrhlj9c00baujsotmqlkmmv	Transaction Fee T3	162	1.50
cmhrhlja000bsujsoc3p8f4ps	cmhrhlj9c00baujsotmqlkmmv	Transaction Fee T4	0	0.50
cmhrhlja300buujsoftslvvqg	cmhrhlj9c00baujsotmqlkmmv	Transaction Fee T5	0	0.80
cmhrhlja600bwujsocyvr519e	cmhrhlj9c00baujsotmqlkmmv	Transaction Fee T6	0	1.80
cmhrhlja900byujso8s5eubat	cmhrhlj9c00baujsotmqlkmmv	Transaction Fee G1	0	0.30
cmhrhljad00c0ujsoygceabkz	cmhrhlj9c00baujsotmqlkmmv	Transaction Fee G2	0	0.30
cmhrhljah00c2ujsog2gxp137	cmhrhlj9c00baujsotmqlkmmv	Transaction Fee G3	0	0.40
cmhrhljaj00c4ujsoogdmi3ka	cmhrhlj9c00baujsotmqlkmmv	Transaction Fee G4	0	0.40
cmhrhljam00c6ujsoktx1gt11	cmhrhlj9c00baujsotmqlkmmv	Transaction Fee G5	0	0.30
cmhrhljap00c8ujso3t4pb9cw	cmhrhlj9c00baujsotmqlkmmv	Transaction Fee G6	0	0.30
cmhrhljb100cdujso4s4lxe6d	cmhrhljax00cbujsoxgq3s417	Basic Fee wmView	1	130.00
cmhrhljb300cfujsojma03315	cmhrhljax00cbujsoxgq3s417	Basis fee for additional user accounts	0	10.00
cmhrhljb600chujso72of9roc	cmhrhljax00cbujsoxgq3s417	Basic Fee wmPos	0	50.00
cmhrhljb900cjujsoqm3ak8ro	cmhrhljax00cbujsoxgq3s417	Basic Fee wmGuide	0	1000.00
cmhrhljbc00clujso3nono0l1	cmhrhljax00cbujsoxgq3s417	Change of user accounts	0	10.00
cmhrhljbf00cnujso931jqdhy	cmhrhljax00cbujsoxgq3s417	Transaction Fee T1	14	0.58
cmhrhljbh00cpujsogbsdnsxr	cmhrhljax00cbujsoxgq3s417	Transaction Fee T2	0	0.70
cmhrhljbk00crujsooxubq8c2	cmhrhljax00cbujsoxgq3s417	Transaction Fee T3	162	1.50
cmhrhljbm00ctujso20frc6ot	cmhrhljax00cbujsoxgq3s417	Transaction Fee T4	0	0.50
cmhrhljbp00cvujsofzbmn971	cmhrhljax00cbujsoxgq3s417	Transaction Fee T5	0	0.80
cmhrhljbs00cxujso03n347hb	cmhrhljax00cbujsoxgq3s417	Transaction Fee T6	0	1.80
cmhrhljbu00czujsosm113zty	cmhrhljax00cbujsoxgq3s417	Transaction Fee G1	0	0.30
cmhrhljbx00d1ujso68odsee1	cmhrhljax00cbujsoxgq3s417	Transaction Fee G2	0	0.30
cmhrhljc000d3ujso7xt7yhb2	cmhrhljax00cbujsoxgq3s417	Transaction Fee G3	0	0.40
cmhrhljc200d5ujso497lidwr	cmhrhljax00cbujsoxgq3s417	Transaction Fee G4	0	0.40
cmhrhljc500d7ujso1gf0oom3	cmhrhljax00cbujsoxgq3s417	Transaction Fee G5	0	0.30
cmhrhljc800d9ujsoiq8w6c5r	cmhrhljax00cbujsoxgq3s417	Transaction Fee G6	0	0.30
cmhrhljci00deujsonwcl9ij3	cmhrhljcf00dcujsozic43v1q	Basic Fee wmView	1	130.00
cmhrhljck00dgujsof8ztecsh	cmhrhljcf00dcujsozic43v1q	Basis fee for additional user accounts	0	10.00
cmhrhljcn00diujso59psvx2a	cmhrhljcf00dcujsozic43v1q	Basic Fee wmPos	0	50.00
cmhrhljcq00dkujso9wpc0m61	cmhrhljcf00dcujsozic43v1q	Basic Fee wmGuide	0	1000.00
cmhrhljcs00dmujsoxr3u2b4t	cmhrhljcf00dcujsozic43v1q	Change of user accounts	0	10.00
cmhrhljcv00doujsonkejhapg	cmhrhljcf00dcujsozic43v1q	Transaction Fee T1	14	0.58
cmhrhljcx00dqujsorjzglv44	cmhrhljcf00dcujsozic43v1q	Transaction Fee T2	0	0.70
cmhrhljcz00dsujsof81ut4un	cmhrhljcf00dcujsozic43v1q	Transaction Fee T3	162	1.50
cmhrhljd200duujsoxe8ksg7s	cmhrhljcf00dcujsozic43v1q	Transaction Fee T4	0	0.50
cmhrhljd500dwujsot5azonpf	cmhrhljcf00dcujsozic43v1q	Transaction Fee T5	0	0.80
cmhrhljd700dyujsoue8v7nuk	cmhrhljcf00dcujsozic43v1q	Transaction Fee T6	0	1.80
cmhrhljda00e0ujso2ftb0t3f	cmhrhljcf00dcujsozic43v1q	Transaction Fee G1	0	0.30
cmhrhljdc00e2ujsou3dj2szt	cmhrhljcf00dcujsozic43v1q	Transaction Fee G2	0	0.30
cmhrhljdf00e4ujso0a1zun62	cmhrhljcf00dcujsozic43v1q	Transaction Fee G3	0	0.40
cmhrhljdh00e6ujso0otsrcz7	cmhrhljcf00dcujsozic43v1q	Transaction Fee G4	0	0.40
cmhrhljdk00e8ujsozvaqhe3m	cmhrhljcf00dcujsozic43v1q	Transaction Fee G5	0	0.30
cmhrhljdn00eaujsoz9j6qwwk	cmhrhljcf00dcujsozic43v1q	Transaction Fee G6	0	0.30
cmhrhljdw00efujsobahlaxvo	cmhrhljdu00edujsok737nlmo	Basic Fee wmView	1	130.00
cmhrhljdz00ehujsoks0mzgtl	cmhrhljdu00edujsok737nlmo	Basis fee for additional user accounts	0	10.00
cmhrhlje100ejujsoi3vy3eqh	cmhrhljdu00edujsok737nlmo	Basic Fee wmPos	0	50.00
cmhrhlje400elujso7e04lc5x	cmhrhljdu00edujsok737nlmo	Basic Fee wmGuide	0	1000.00
cmhrhlje600enujsocmvbj79a	cmhrhljdu00edujsok737nlmo	Change of user accounts	0	10.00
cmhrhlje800epujsooblbr5y5	cmhrhljdu00edujsok737nlmo	Transaction Fee T1	14	0.58
cmhrhljeb00erujso0ur651ko	cmhrhljdu00edujsok737nlmo	Transaction Fee T2	0	0.70
cmhrhljed00etujsoo0nk3rh0	cmhrhljdu00edujsok737nlmo	Transaction Fee T3	162	1.50
cmhrhljeg00evujso0vulw4ty	cmhrhljdu00edujsok737nlmo	Transaction Fee T4	0	0.50
cmhrhljej00exujsoe1g7px9m	cmhrhljdu00edujsok737nlmo	Transaction Fee T5	0	0.80
cmhrhljel00ezujso6ydhei39	cmhrhljdu00edujsok737nlmo	Transaction Fee T6	0	1.80
cmhrhljeo00f1ujsof8i4u952	cmhrhljdu00edujsok737nlmo	Transaction Fee G1	0	0.30
cmhrhljeq00f3ujsogyg6fiuk	cmhrhljdu00edujsok737nlmo	Transaction Fee G2	0	0.30
cmhrhljes00f5ujsovp2ymf5l	cmhrhljdu00edujsok737nlmo	Transaction Fee G3	0	0.40
cmhrhljev00f7ujsoiudasn7o	cmhrhljdu00edujsok737nlmo	Transaction Fee G4	0	0.40
cmhrhljey00f9ujsooil91pme	cmhrhljdu00edujsok737nlmo	Transaction Fee G5	0	0.30
cmhrhljf000fbujsojp4qyj2e	cmhrhljdu00edujsok737nlmo	Transaction Fee G6	0	0.30
cmhrhljfa00fgujsovpvyxy83	cmhrhljf700feujsoguofi1by	Basic Fee wmView	1	130.00
cmhrhljfc00fiujsowrtyntdr	cmhrhljf700feujsoguofi1by	Basis fee for additional user accounts	0	10.00
cmhrhljff00fkujso52phn8hp	cmhrhljf700feujsoguofi1by	Basic Fee wmPos	0	50.00
cmhrhljfi00fmujso456r1muc	cmhrhljf700feujsoguofi1by	Basic Fee wmGuide	0	1000.00
cmhrhljfk00foujsovnhwd7fg	cmhrhljf700feujsoguofi1by	Change of user accounts	0	10.00
cmhrhljfn00fqujsooxsle61z	cmhrhljf700feujsoguofi1by	Transaction Fee T1	14	0.58
cmhrhljfq00fsujsotpqk85vn	cmhrhljf700feujsoguofi1by	Transaction Fee T2	0	0.70
cmhrhljfs00fuujsobtuqebow	cmhrhljf700feujsoguofi1by	Transaction Fee T3	162	1.50
cmhrhljfv00fwujsou6p4xbht	cmhrhljf700feujsoguofi1by	Transaction Fee T4	0	0.50
cmhrhljfy00fyujsoswwrtio2	cmhrhljf700feujsoguofi1by	Transaction Fee T5	0	0.80
cmhrhljg100g0ujso6ws6k5if	cmhrhljf700feujsoguofi1by	Transaction Fee T6	0	1.80
cmhrhljg400g2ujsof856nuw9	cmhrhljf700feujsoguofi1by	Transaction Fee G1	0	0.30
cmhrhljg600g4ujsotmv2unb0	cmhrhljf700feujsoguofi1by	Transaction Fee G2	0	0.30
cmhrhljg900g6ujsocxqztdrg	cmhrhljf700feujsoguofi1by	Transaction Fee G3	0	0.40
cmhrhljgb00g8ujso6ck01i8t	cmhrhljf700feujsoguofi1by	Transaction Fee G4	0	0.40
cmhrhljge00gaujso37xhifbj	cmhrhljf700feujsoguofi1by	Transaction Fee G5	0	0.30
cmhrhljgh00gcujsomocfbbvs	cmhrhljf700feujsoguofi1by	Transaction Fee G6	0	0.30
cmhrhljgr00ghujsosp1avi85	cmhrhljgp00gfujso84syjtn7	Basic Fee wmView	1	130.00
cmhrhljgu00gjujsozll86nxg	cmhrhljgp00gfujso84syjtn7	Basis fee for additional user accounts	0	10.00
cmhrhljgx00glujsoshhyw96y	cmhrhljgp00gfujso84syjtn7	Basic Fee wmPos	0	50.00
cmhrhljgz00gnujsozvvdrjdy	cmhrhljgp00gfujso84syjtn7	Basic Fee wmGuide	0	1000.00
cmhrhljh200gpujsoykbj2j3v	cmhrhljgp00gfujso84syjtn7	Change of user accounts	0	10.00
cmhrhljh400grujsoaqq2xrgg	cmhrhljgp00gfujso84syjtn7	Transaction Fee T1	14	0.58
cmhrhljh700gtujsozqcir2fp	cmhrhljgp00gfujso84syjtn7	Transaction Fee T2	0	0.70
cmhrhljh900gvujsoq89j7lxl	cmhrhljgp00gfujso84syjtn7	Transaction Fee T3	162	1.50
cmhrhljhc00gxujsow7zhdj49	cmhrhljgp00gfujso84syjtn7	Transaction Fee T4	0	0.50
cmhrhljhf00gzujsow675ttyh	cmhrhljgp00gfujso84syjtn7	Transaction Fee T5	0	0.80
cmhrhljhh00h1ujsolvlcdrl8	cmhrhljgp00gfujso84syjtn7	Transaction Fee T6	0	1.80
cmhrhljhk00h3ujsogcu1460g	cmhrhljgp00gfujso84syjtn7	Transaction Fee G1	0	0.30
cmhrhljhn00h5ujsoa96iye0x	cmhrhljgp00gfujso84syjtn7	Transaction Fee G2	0	0.30
cmhrhljhp00h7ujso4c59o4ff	cmhrhljgp00gfujso84syjtn7	Transaction Fee G3	0	0.40
cmhrhljhs00h9ujsoel9yl8ry	cmhrhljgp00gfujso84syjtn7	Transaction Fee G4	0	0.40
cmhrhljhv00hbujso8uidjljc	cmhrhljgp00gfujso84syjtn7	Transaction Fee G5	0	0.30
cmhrhljhy00hdujsoqvr6wu7q	cmhrhljgp00gfujso84syjtn7	Transaction Fee G6	0	0.30
cmhrhljia00hiujsodkrsog1t	cmhrhlji700hgujson2ti76ke	Basic Fee wmView	1	130.00
cmhrhljid00hkujsoeveu4o1o	cmhrhlji700hgujson2ti76ke	Basis fee for additional user accounts	0	10.00
cmhrhljig00hmujsoqeuly0wa	cmhrhlji700hgujson2ti76ke	Basic Fee wmPos	0	50.00
cmhrhljii00houjso4q8bycbb	cmhrhlji700hgujson2ti76ke	Basic Fee wmGuide	0	1000.00
cmhrhljil00hqujso3ok3clqp	cmhrhlji700hgujson2ti76ke	Change of user accounts	0	10.00
cmhrhljio00hsujsog5gdaka8	cmhrhlji700hgujson2ti76ke	Transaction Fee T1	14	0.58
cmhrhljir00huujsoeimz0zkv	cmhrhlji700hgujson2ti76ke	Transaction Fee T2	0	0.70
cmhrhljiu00hwujso46u0z1oe	cmhrhlji700hgujson2ti76ke	Transaction Fee T3	162	1.50
cmhrhljix00hyujso8qkdlndm	cmhrhlji700hgujson2ti76ke	Transaction Fee T4	0	0.50
cmhrhljiz00i0ujsojczrxl8z	cmhrhlji700hgujson2ti76ke	Transaction Fee T5	0	0.80
cmhrhljj200i2ujsoqhnvj7c1	cmhrhlji700hgujson2ti76ke	Transaction Fee T6	0	1.80
cmhrhljj400i4ujsoke492g9p	cmhrhlji700hgujson2ti76ke	Transaction Fee G1	0	0.30
cmhrhljj700i6ujsotsjdx7y1	cmhrhlji700hgujson2ti76ke	Transaction Fee G2	0	0.30
cmhrhljj900i8ujsoaltyy546	cmhrhlji700hgujson2ti76ke	Transaction Fee G3	0	0.40
cmhrhljjc00iaujsoy2hwe652	cmhrhlji700hgujson2ti76ke	Transaction Fee G4	0	0.40
cmhrhljje00icujsofqe9urfj	cmhrhlji700hgujson2ti76ke	Transaction Fee G5	0	0.30
cmhrhljjg00ieujsoakwwras3	cmhrhlji700hgujson2ti76ke	Transaction Fee G6	0	0.30
cmhrhljjp00ijujsoqfl05heu	cmhrhljjn00ihujsopuf6cgjn	Basic Fee wmView	1	130.00
cmhrhljjs00ilujsorlxfz0q1	cmhrhljjn00ihujsopuf6cgjn	Basis fee for additional user accounts	0	10.00
cmhrhljju00inujso4htaxuma	cmhrhljjn00ihujsopuf6cgjn	Basic Fee wmPos	0	50.00
cmhrhljjw00ipujso7bld2zxl	cmhrhljjn00ihujsopuf6cgjn	Basic Fee wmGuide	0	1000.00
cmhrhljjy00irujso4ne2x7q2	cmhrhljjn00ihujsopuf6cgjn	Change of user accounts	0	10.00
cmhrhljk000itujso36lvuare	cmhrhljjn00ihujsopuf6cgjn	Transaction Fee T1	14	0.58
cmhrhljk300ivujsort4svlhe	cmhrhljjn00ihujsopuf6cgjn	Transaction Fee T2	0	0.70
cmhrhljk500ixujsoj68l09eo	cmhrhljjn00ihujsopuf6cgjn	Transaction Fee T3	162	1.50
cmhrhljk800izujsotlgw98w2	cmhrhljjn00ihujsopuf6cgjn	Transaction Fee T4	0	0.50
cmhrhljka00j1ujso86siodk8	cmhrhljjn00ihujsopuf6cgjn	Transaction Fee T5	0	0.80
cmhrhljkc00j3ujsob3e9fu5p	cmhrhljjn00ihujsopuf6cgjn	Transaction Fee T6	0	1.80
cmhrhljke00j5ujsowrbx2kpz	cmhrhljjn00ihujsopuf6cgjn	Transaction Fee G1	0	0.30
cmhrhljkh00j7ujsoapgv20vu	cmhrhljjn00ihujsopuf6cgjn	Transaction Fee G2	0	0.30
cmhrhljkj00j9ujsovc1n4o2m	cmhrhljjn00ihujsopuf6cgjn	Transaction Fee G3	0	0.40
cmhrhljkm00jbujsoskhmo9ww	cmhrhljjn00ihujsopuf6cgjn	Transaction Fee G4	0	0.40
cmhrhljko00jdujsob6ibk0hp	cmhrhljjn00ihujsopuf6cgjn	Transaction Fee G5	0	0.30
cmhrhljkq00jfujso3a6gjmdw	cmhrhljjn00ihujsopuf6cgjn	Transaction Fee G6	0	0.30
cmhrhljl000jkujsoskm0iu94	cmhrhljky00jiujsorvyi1xsc	Basic Fee wmView	1	130.00
cmhrhljl200jmujsobz4ii0jf	cmhrhljky00jiujsorvyi1xsc	Basis fee for additional user accounts	0	10.00
cmhrhljl400joujso7b5jijvb	cmhrhljky00jiujsorvyi1xsc	Basic Fee wmPos	0	50.00
cmhrhljl600jqujsozuv3eg3j	cmhrhljky00jiujsorvyi1xsc	Basic Fee wmGuide	0	1000.00
cmhrhljl800jsujsoks113rla	cmhrhljky00jiujsorvyi1xsc	Change of user accounts	0	10.00
cmhrhljlb00juujsohd545ogp	cmhrhljky00jiujsorvyi1xsc	Transaction Fee T1	14	0.58
cmhrhljld00jwujso2d053o0z	cmhrhljky00jiujsorvyi1xsc	Transaction Fee T2	0	0.70
cmhrhljlf00jyujsofgqayrlw	cmhrhljky00jiujsorvyi1xsc	Transaction Fee T3	162	1.50
cmhrhljli00k0ujso0qghni3h	cmhrhljky00jiujsorvyi1xsc	Transaction Fee T4	0	0.50
cmhrhljlk00k2ujsofrgjy89n	cmhrhljky00jiujsorvyi1xsc	Transaction Fee T5	0	0.80
cmhrhljlm00k4ujsooiratku2	cmhrhljky00jiujsorvyi1xsc	Transaction Fee T6	0	1.80
cmhrhljlo00k6ujsoi3uvobp9	cmhrhljky00jiujsorvyi1xsc	Transaction Fee G1	0	0.30
cmhrhljlr00k8ujsojkzwo5hy	cmhrhljky00jiujsorvyi1xsc	Transaction Fee G2	0	0.30
cmhrhljlt00kaujsoaev1lqpj	cmhrhljky00jiujsorvyi1xsc	Transaction Fee G3	0	0.40
cmhrhljlw00kcujsoouzs9q1j	cmhrhljky00jiujsorvyi1xsc	Transaction Fee G4	0	0.40
cmhrhljly00keujsohbzbo6tn	cmhrhljky00jiujsorvyi1xsc	Transaction Fee G5	0	0.30
cmhrhljm100kgujsoopexbf94	cmhrhljky00jiujsorvyi1xsc	Transaction Fee G6	0	0.30
cmhrhljma00klujsozm6npd1c	cmhrhljm800kjujsowohqgtau	Basic Fee wmView	1	130.00
cmhrhljmd00knujsoai95nnue	cmhrhljm800kjujsowohqgtau	Basis fee for additional user accounts	0	10.00
cmhrhljmf00kpujso0ppmqzk7	cmhrhljm800kjujsowohqgtau	Basic Fee wmPos	0	50.00
cmhrhljmh00krujsogdu83zaf	cmhrhljm800kjujsowohqgtau	Basic Fee wmGuide	0	1000.00
cmhrhljmj00ktujsonqrjfuu5	cmhrhljm800kjujsowohqgtau	Change of user accounts	0	10.00
cmhrhljmm00kvujsosa28hcz7	cmhrhljm800kjujsowohqgtau	Transaction Fee T1	14	0.58
cmhrhljmo00kxujsomw6coq93	cmhrhljm800kjujsowohqgtau	Transaction Fee T2	0	0.70
cmhrhljmq00kzujsogyyham4q	cmhrhljm800kjujsowohqgtau	Transaction Fee T3	162	1.50
cmhrhljmt00l1ujsosur07gdt	cmhrhljm800kjujsowohqgtau	Transaction Fee T4	0	0.50
cmhrhljmv00l3ujso490dseso	cmhrhljm800kjujsowohqgtau	Transaction Fee T5	0	0.80
cmhrhljmx00l5ujsombqnklj1	cmhrhljm800kjujsowohqgtau	Transaction Fee T6	0	1.80
cmhrhljn000l7ujsoih8mb880	cmhrhljm800kjujsowohqgtau	Transaction Fee G1	0	0.30
cmhrhljn200l9ujsoauvb715w	cmhrhljm800kjujsowohqgtau	Transaction Fee G2	0	0.30
cmhrhljn400lbujsofim5tp6q	cmhrhljm800kjujsowohqgtau	Transaction Fee G3	0	0.40
cmhrhljn700ldujsoog7j9otm	cmhrhljm800kjujsowohqgtau	Transaction Fee G4	0	0.40
cmhrhljn900lfujsoz6u56bnz	cmhrhljm800kjujsowohqgtau	Transaction Fee G5	0	0.30
cmhrhljnb00lhujsosh2459ft	cmhrhljm800kjujsowohqgtau	Transaction Fee G6	0	0.30
cmhrhljnl00lmujsos929vbjf	cmhrhljni00lkujso4kj1b8ck	Basic Fee wmView	1	130.00
cmhrhljnn00loujso4o2lqegs	cmhrhljni00lkujso4kj1b8ck	Basis fee for additional user accounts	0	10.00
cmhrhljnp00lqujso94rouupn	cmhrhljni00lkujso4kj1b8ck	Basic Fee wmPos	0	50.00
cmhrhljns00lsujso2k7aur9m	cmhrhljni00lkujso4kj1b8ck	Basic Fee wmGuide	0	1000.00
cmhrhljnu00luujsoesfpityi	cmhrhljni00lkujso4kj1b8ck	Change of user accounts	0	10.00
cmhrhljnw00lwujsobi7y36ay	cmhrhljni00lkujso4kj1b8ck	Transaction Fee T1	14	0.58
cmhrhljny00lyujsoiaezpykh	cmhrhljni00lkujso4kj1b8ck	Transaction Fee T2	0	0.70
cmhrhljo000m0ujso3ihgmzta	cmhrhljni00lkujso4kj1b8ck	Transaction Fee T3	162	1.50
cmhrhljo300m2ujsoaoc6ypay	cmhrhljni00lkujso4kj1b8ck	Transaction Fee T4	0	0.50
cmhrhljo500m4ujsodchg5gop	cmhrhljni00lkujso4kj1b8ck	Transaction Fee T5	0	0.80
cmhrhljo700m6ujso7m8reuvp	cmhrhljni00lkujso4kj1b8ck	Transaction Fee T6	0	1.80
cmhrhljoa00m8ujso1p4ulv3y	cmhrhljni00lkujso4kj1b8ck	Transaction Fee G1	0	0.30
cmhrhljoc00maujsoke6729qy	cmhrhljni00lkujso4kj1b8ck	Transaction Fee G2	0	0.30
cmhrhljof00mcujsotcq9v6n5	cmhrhljni00lkujso4kj1b8ck	Transaction Fee G3	0	0.40
cmhrhljoh00meujso9zsb98bi	cmhrhljni00lkujso4kj1b8ck	Transaction Fee G4	0	0.40
cmhrhljoj00mgujson4ailzup	cmhrhljni00lkujso4kj1b8ck	Transaction Fee G5	0	0.30
cmhrhljom00miujsouzbcn1ss	cmhrhljni00lkujso4kj1b8ck	Transaction Fee G6	0	0.30
cmhrhljox00mnujso0af4evgd	cmhrhljou00mlujsohu1mqzgc	Basic Fee wmView	1	130.00
cmhrhljoz00mpujsoxs6hnrmd	cmhrhljou00mlujsohu1mqzgc	Basis fee for additional user accounts	0	10.00
cmhrhljp100mrujso6q35bphs	cmhrhljou00mlujsohu1mqzgc	Basic Fee wmPos	0	50.00
cmhrhljp400mtujson706fwlc	cmhrhljou00mlujsohu1mqzgc	Basic Fee wmGuide	0	1000.00
cmhrhljp700mvujsonm5pdgwr	cmhrhljou00mlujsohu1mqzgc	Change of user accounts	0	10.00
cmhrhljpa00mxujso1p6svt75	cmhrhljou00mlujsohu1mqzgc	Transaction Fee T1	14	0.58
cmhrhljpc00mzujso0atxfdqz	cmhrhljou00mlujsohu1mqzgc	Transaction Fee T2	0	0.70
cmhrhljpe00n1ujsoc4cm6162	cmhrhljou00mlujsohu1mqzgc	Transaction Fee T3	162	1.50
cmhrhljph00n3ujsou2s87yr7	cmhrhljou00mlujsohu1mqzgc	Transaction Fee T4	0	0.50
cmhrhljpj00n5ujsoucysiu0c	cmhrhljou00mlujsohu1mqzgc	Transaction Fee T5	0	0.80
cmhrhljpl00n7ujsovvvtgee4	cmhrhljou00mlujsohu1mqzgc	Transaction Fee T6	0	1.80
cmhrhljpo00n9ujso2svyh7lc	cmhrhljou00mlujsohu1mqzgc	Transaction Fee G1	0	0.30
cmhrhljpr00nbujsotge6oky2	cmhrhljou00mlujsohu1mqzgc	Transaction Fee G2	0	0.30
cmhrhljpt00ndujsoibvkxobj	cmhrhljou00mlujsohu1mqzgc	Transaction Fee G3	0	0.40
cmhrhljpv00nfujsoyctj6erk	cmhrhljou00mlujsohu1mqzgc	Transaction Fee G4	0	0.40
cmhrhljpy00nhujsodhhm5fm8	cmhrhljou00mlujsohu1mqzgc	Transaction Fee G5	0	0.30
cmhrhljq000njujsovvxjpz41	cmhrhljou00mlujsohu1mqzgc	Transaction Fee G6	0	0.30
cmhrhljqa00noujsogho7ihxa	cmhrhljq800nmujsoxjyx8wa3	Basic Fee wmView	1	130.00
cmhrhljqc00nqujso7xr5xfwn	cmhrhljq800nmujsoxjyx8wa3	Basis fee for additional user accounts	0	10.00
cmhrhljqf00nsujso6bzl2otr	cmhrhljq800nmujsoxjyx8wa3	Basic Fee wmPos	0	50.00
cmhrhljqh00nuujsouscpiuco	cmhrhljq800nmujsoxjyx8wa3	Basic Fee wmGuide	0	1000.00
cmhrhljqk00nwujsocxfo07ol	cmhrhljq800nmujsoxjyx8wa3	Change of user accounts	0	10.00
cmhrhljqm00nyujso3ygtql2z	cmhrhljq800nmujsoxjyx8wa3	Transaction Fee T1	14	0.58
cmhrhljqp00o0ujsolygkm1cc	cmhrhljq800nmujsoxjyx8wa3	Transaction Fee T2	0	0.70
cmhrhljqr00o2ujsocnvtepmk	cmhrhljq800nmujsoxjyx8wa3	Transaction Fee T3	162	1.50
cmhrhljqt00o4ujsoijdk5f8d	cmhrhljq800nmujsoxjyx8wa3	Transaction Fee T4	0	0.50
cmhrhljqw00o6ujsori6eyqqi	cmhrhljq800nmujsoxjyx8wa3	Transaction Fee T5	0	0.80
cmhrhljqy00o8ujsosobzzbgv	cmhrhljq800nmujsoxjyx8wa3	Transaction Fee T6	0	1.80
cmhrhljr000oaujsonz0pmeqg	cmhrhljq800nmujsoxjyx8wa3	Transaction Fee G1	0	0.30
cmhrhljr300ocujsog2g3qrcv	cmhrhljq800nmujsoxjyx8wa3	Transaction Fee G2	0	0.30
cmhrhljr500oeujsoytvzscq4	cmhrhljq800nmujsoxjyx8wa3	Transaction Fee G3	0	0.40
cmhrhljr700ogujso540ab2d4	cmhrhljq800nmujsoxjyx8wa3	Transaction Fee G4	0	0.40
cmhrhljra00oiujsocgf5dlqw	cmhrhljq800nmujsoxjyx8wa3	Transaction Fee G5	0	0.30
cmhrhljrc00okujso2bmr9jc2	cmhrhljq800nmujsoxjyx8wa3	Transaction Fee G6	0	0.30
cmhrhljrn00opujsovf6xd73w	cmhrhljrj00onujsogopcr8x8	Basic Fee wmView	1	130.00
cmhrhljrp00orujsoozjhj3tg	cmhrhljrj00onujsogopcr8x8	Basis fee for additional user accounts	0	10.00
cmhrhljrs00otujsofmkqebfj	cmhrhljrj00onujsogopcr8x8	Basic Fee wmPos	0	50.00
cmhrhljru00ovujsoz6mfd2f9	cmhrhljrj00onujsogopcr8x8	Basic Fee wmGuide	0	1000.00
cmhrhljrw00oxujsoej8cftx1	cmhrhljrj00onujsogopcr8x8	Change of user accounts	0	10.00
cmhrhljrz00ozujso4ql6r2az	cmhrhljrj00onujsogopcr8x8	Transaction Fee T1	14	0.58
cmhrhljs100p1ujsokoyempze	cmhrhljrj00onujsogopcr8x8	Transaction Fee T2	0	0.70
cmhrhljs300p3ujsox6uw1tam	cmhrhljrj00onujsogopcr8x8	Transaction Fee T3	162	1.50
cmhrhljs600p5ujsoo9tp3wim	cmhrhljrj00onujsogopcr8x8	Transaction Fee T4	0	0.50
cmhrhljs800p7ujso7c7noim1	cmhrhljrj00onujsogopcr8x8	Transaction Fee T5	0	0.80
cmhrhljsa00p9ujsob717fgiu	cmhrhljrj00onujsogopcr8x8	Transaction Fee T6	0	1.80
cmhrhljsd00pbujsodi58hb1d	cmhrhljrj00onujsogopcr8x8	Transaction Fee G1	0	0.30
cmhrhljsf00pdujsozqlj81pr	cmhrhljrj00onujsogopcr8x8	Transaction Fee G2	0	0.30
cmhrhljsi00pfujsowocj7ear	cmhrhljrj00onujsogopcr8x8	Transaction Fee G3	0	0.40
cmhrhljsk00phujso03lkeo1x	cmhrhljrj00onujsogopcr8x8	Transaction Fee G4	0	0.40
cmhrhljsm00pjujsoxe98bp8d	cmhrhljrj00onujsogopcr8x8	Transaction Fee G5	0	0.30
cmhrhljsp00plujsoo76uzzst	cmhrhljrj00onujsogopcr8x8	Transaction Fee G6	0	0.30
cmhrhljt000pqujso1mchx51b	cmhrhljsx00poujsou68fscy3	Basic Fee wmView	1	130.00
cmhrhljt200psujsod93g0fdr	cmhrhljsx00poujsou68fscy3	Basis fee for additional user accounts	0	10.00
cmhrhljt400puujsosyaxm5l7	cmhrhljsx00poujsou68fscy3	Basic Fee wmPos	0	50.00
cmhrhljt700pwujsozxml4hri	cmhrhljsx00poujsou68fscy3	Basic Fee wmGuide	0	1000.00
cmhrhljt900pyujsohk6j9x9j	cmhrhljsx00poujsou68fscy3	Change of user accounts	0	10.00
cmhrhljtc00q0ujsosqwi2169	cmhrhljsx00poujsou68fscy3	Transaction Fee T1	14	0.58
cmhrhljte00q2ujsobhgdzto0	cmhrhljsx00poujsou68fscy3	Transaction Fee T2	0	0.70
cmhrhljtg00q4ujso6nmwoblh	cmhrhljsx00poujsou68fscy3	Transaction Fee T3	162	1.50
cmhrhljti00q6ujsos1eeqb4l	cmhrhljsx00poujsou68fscy3	Transaction Fee T4	0	0.50
cmhrhljtl00q8ujsoa3lf2rs5	cmhrhljsx00poujsou68fscy3	Transaction Fee T5	0	0.80
cmhrhljtn00qaujsojxnfksh7	cmhrhljsx00poujsou68fscy3	Transaction Fee T6	0	1.80
cmhrhljtq00qcujsoyp5r4z6k	cmhrhljsx00poujsou68fscy3	Transaction Fee G1	0	0.30
cmhrhljts00qeujsotig484ab	cmhrhljsx00poujsou68fscy3	Transaction Fee G2	0	0.30
cmhrhljtv00qgujsozfb4cq0l	cmhrhljsx00poujsou68fscy3	Transaction Fee G3	0	0.40
cmhrhljtx00qiujso8s6unka6	cmhrhljsx00poujsou68fscy3	Transaction Fee G4	0	0.40
cmhrhlju000qkujsoz1up9hks	cmhrhljsx00poujsou68fscy3	Transaction Fee G5	0	0.30
cmhrhlju300qmujsolz3wqosv	cmhrhljsx00poujsou68fscy3	Transaction Fee G6	0	0.30
cmhrhljuf00qrujsot0fe4jet	cmhrhljuc00qpujso21nzjzfd	Basic Fee wmView	1	130.00
cmhrhljuh00qtujsoavhpx2zo	cmhrhljuc00qpujso21nzjzfd	Basis fee for additional user accounts	0	10.00
cmhrhljuk00qvujsow7cw62mn	cmhrhljuc00qpujso21nzjzfd	Basic Fee wmPos	0	50.00
cmhrhljun00qxujsoyexougki	cmhrhljuc00qpujso21nzjzfd	Basic Fee wmGuide	0	1000.00
cmhrhljup00qzujsoy4vjw1x6	cmhrhljuc00qpujso21nzjzfd	Change of user accounts	0	10.00
cmhrhljus00r1ujsoysww7ztr	cmhrhljuc00qpujso21nzjzfd	Transaction Fee T1	14	0.58
cmhrhljuu00r3ujsopcepzi5u	cmhrhljuc00qpujso21nzjzfd	Transaction Fee T2	0	0.70
cmhrhljux00r5ujsor0og27ex	cmhrhljuc00qpujso21nzjzfd	Transaction Fee T3	162	1.50
cmhrhljuz00r7ujsojlypxl1m	cmhrhljuc00qpujso21nzjzfd	Transaction Fee T4	0	0.50
cmhrhljv200r9ujsoopcp2f2q	cmhrhljuc00qpujso21nzjzfd	Transaction Fee T5	0	0.80
cmhrhljv400rbujso52w82ckh	cmhrhljuc00qpujso21nzjzfd	Transaction Fee T6	0	1.80
cmhrhljv600rdujsozzfdooei	cmhrhljuc00qpujso21nzjzfd	Transaction Fee G1	0	0.30
cmhrhljv900rfujsoym55xs22	cmhrhljuc00qpujso21nzjzfd	Transaction Fee G2	0	0.30
cmhrhljvb00rhujsoc2345hxg	cmhrhljuc00qpujso21nzjzfd	Transaction Fee G3	0	0.40
cmhrhljve00rjujsoxods0xa2	cmhrhljuc00qpujso21nzjzfd	Transaction Fee G4	0	0.40
cmhrhljvg00rlujsotsg0f705	cmhrhljuc00qpujso21nzjzfd	Transaction Fee G5	0	0.30
cmhrhljvi00rnujso7524g9xe	cmhrhljuc00qpujso21nzjzfd	Transaction Fee G6	0	0.30
cmhrhljvs00rsujso3agjg0i7	cmhrhljvq00rqujsor7vs34iz	Basic Fee wmView	1	130.00
cmhrhljvv00ruujsodx93wfz1	cmhrhljvq00rqujsor7vs34iz	Basis fee for additional user accounts	0	10.00
cmhrhljvy00rwujso4v297x9q	cmhrhljvq00rqujsor7vs34iz	Basic Fee wmPos	0	50.00
cmhrhljw000ryujsoris7vxqz	cmhrhljvq00rqujsor7vs34iz	Basic Fee wmGuide	0	1000.00
cmhrhljw200s0ujsowj8xvlhe	cmhrhljvq00rqujsor7vs34iz	Change of user accounts	0	10.00
cmhrhljw500s2ujso8vp3zb4g	cmhrhljvq00rqujsor7vs34iz	Transaction Fee T1	14	0.58
cmhrhljw800s4ujsoxvg29y26	cmhrhljvq00rqujsor7vs34iz	Transaction Fee T2	0	0.70
cmhrhljwa00s6ujsodsxxtek0	cmhrhljvq00rqujsor7vs34iz	Transaction Fee T3	162	1.50
cmhrhljwd00s8ujsornex4u7c	cmhrhljvq00rqujsor7vs34iz	Transaction Fee T4	0	0.50
cmhrhljwf00saujsoxtp6hhab	cmhrhljvq00rqujsor7vs34iz	Transaction Fee T5	0	0.80
cmhrhljwi00scujsoa21pijie	cmhrhljvq00rqujsor7vs34iz	Transaction Fee T6	0	1.80
cmhrhljwk00seujsovjq25vtv	cmhrhljvq00rqujsor7vs34iz	Transaction Fee G1	0	0.30
cmhrhljwn00sgujsog2pmmppk	cmhrhljvq00rqujsor7vs34iz	Transaction Fee G2	0	0.30
cmhrhljwp00siujso54y7lt89	cmhrhljvq00rqujsor7vs34iz	Transaction Fee G3	0	0.40
cmhrhljws00skujsoygdie7di	cmhrhljvq00rqujsor7vs34iz	Transaction Fee G4	0	0.40
cmhrhljwu00smujsovg9boohd	cmhrhljvq00rqujsor7vs34iz	Transaction Fee G5	0	0.30
cmhrhljww00soujsosfdnf9j1	cmhrhljvq00rqujsor7vs34iz	Transaction Fee G6	0	0.30
cmhrhljx600stujsovkz72s4l	cmhrhljx300srujsof1ipnn17	Basic Fee wmView	1	130.00
cmhrhljx800svujsounhwrptk	cmhrhljx300srujsof1ipnn17	Basis fee for additional user accounts	0	10.00
cmhrhljxb00sxujso0oltoxj4	cmhrhljx300srujsof1ipnn17	Basic Fee wmPos	0	50.00
cmhrhljxd00szujsoo5rti0je	cmhrhljx300srujsof1ipnn17	Basic Fee wmGuide	0	1000.00
cmhrhljxf00t1ujsoj6t46peo	cmhrhljx300srujsof1ipnn17	Change of user accounts	0	10.00
cmhrhljxi00t3ujso6gdu5kwj	cmhrhljx300srujsof1ipnn17	Transaction Fee T1	14	0.58
cmhrhljxk00t5ujso7f3vqi05	cmhrhljx300srujsof1ipnn17	Transaction Fee T2	0	0.70
cmhrhljxm00t7ujsohu6u91xc	cmhrhljx300srujsof1ipnn17	Transaction Fee T3	162	1.50
cmhrhljxp00t9ujsograhtt9s	cmhrhljx300srujsof1ipnn17	Transaction Fee T4	0	0.50
cmhrhljxr00tbujsokvx19s6h	cmhrhljx300srujsof1ipnn17	Transaction Fee T5	0	0.80
cmhrhljxt00tdujsopwhb45xs	cmhrhljx300srujsof1ipnn17	Transaction Fee T6	0	1.80
cmhrhljxw00tfujsofqp4d8a3	cmhrhljx300srujsof1ipnn17	Transaction Fee G1	0	0.30
cmhrhljxy00thujsop6rqrzi8	cmhrhljx300srujsof1ipnn17	Transaction Fee G2	0	0.30
cmhrhljy100tjujso204bm7cd	cmhrhljx300srujsof1ipnn17	Transaction Fee G3	0	0.40
cmhrhljy300tlujsoiad6cvnb	cmhrhljx300srujsof1ipnn17	Transaction Fee G4	0	0.40
cmhrhljy500tnujsogk3q2u0e	cmhrhljx300srujsof1ipnn17	Transaction Fee G5	0	0.30
cmhrhljy700tpujsoyewjb7kv	cmhrhljx300srujsof1ipnn17	Transaction Fee G6	0	0.30
cmhrhljyh00tuujsohurxt65u	cmhrhljye00tsujsoj9suyil3	Basic Fee wmView	1	130.00
cmhrhljyj00twujso7sdal4ip	cmhrhljye00tsujsoj9suyil3	Basis fee for additional user accounts	0	10.00
cmhrhljym00tyujsoy9otlfe5	cmhrhljye00tsujsoj9suyil3	Basic Fee wmPos	0	50.00
cmhrhljyo00u0ujsowqwikwht	cmhrhljye00tsujsoj9suyil3	Basic Fee wmGuide	0	1000.00
cmhrhljyq00u2ujsoqvgn9kuk	cmhrhljye00tsujsoj9suyil3	Change of user accounts	0	10.00
cmhrhljyt00u4ujsoucvyutld	cmhrhljye00tsujsoj9suyil3	Transaction Fee T1	14	0.58
cmhrhljyv00u6ujsorcwet74i	cmhrhljye00tsujsoj9suyil3	Transaction Fee T2	0	0.70
cmhrhljyy00u8ujsofdvhqn71	cmhrhljye00tsujsoj9suyil3	Transaction Fee T3	162	1.50
cmhrhljz000uaujsomwh7vckr	cmhrhljye00tsujsoj9suyil3	Transaction Fee T4	0	0.50
cmhrhljz200ucujsoxw9idedt	cmhrhljye00tsujsoj9suyil3	Transaction Fee T5	0	0.80
cmhrhljz500ueujsoyugvvfmp	cmhrhljye00tsujsoj9suyil3	Transaction Fee T6	0	1.80
cmhrhljz700ugujsof4a5w216	cmhrhljye00tsujsoj9suyil3	Transaction Fee G1	0	0.30
cmhrhljz900uiujsohn7sw2xx	cmhrhljye00tsujsoj9suyil3	Transaction Fee G2	0	0.30
cmhrhljzc00ukujsoys7wkpn5	cmhrhljye00tsujsoj9suyil3	Transaction Fee G3	0	0.40
cmhrhljze00umujsodprfqb6g	cmhrhljye00tsujsoj9suyil3	Transaction Fee G4	0	0.40
cmhrhljzh00uoujsoeu070w2e	cmhrhljye00tsujsoj9suyil3	Transaction Fee G5	0	0.30
cmhrhljzj00uqujso18k5ajt8	cmhrhljye00tsujsoj9suyil3	Transaction Fee G6	0	0.30
cmhrhljzt00uvujsojxn8tofs	cmhrhljzr00utujsoz4aao91l	Basic Fee wmView	1	130.00
cmhrhljzw00uxujsotrtm4cxf	cmhrhljzr00utujsoz4aao91l	Basis fee for additional user accounts	0	10.00
cmhrhljzy00uzujso4ioa5vi3	cmhrhljzr00utujsoz4aao91l	Basic Fee wmPos	0	50.00
cmhrhlk0100v1ujso5fhz5q1t	cmhrhljzr00utujsoz4aao91l	Basic Fee wmGuide	0	1000.00
cmhrhlk0300v3ujso933urtp3	cmhrhljzr00utujsoz4aao91l	Change of user accounts	0	10.00
cmhrhlk0500v5ujsolzoqjm3p	cmhrhljzr00utujsoz4aao91l	Transaction Fee T1	14	0.58
cmhrhlk0800v7ujso3ulkxipx	cmhrhljzr00utujsoz4aao91l	Transaction Fee T2	0	0.70
cmhrhlk0a00v9ujsoelh1yhis	cmhrhljzr00utujsoz4aao91l	Transaction Fee T3	162	1.50
cmhrhlk0c00vbujso81aywein	cmhrhljzr00utujsoz4aao91l	Transaction Fee T4	0	0.50
cmhrhlk0f00vdujsosz1yqitz	cmhrhljzr00utujsoz4aao91l	Transaction Fee T5	0	0.80
cmhrhlk0h00vfujsoe1kxiayu	cmhrhljzr00utujsoz4aao91l	Transaction Fee T6	0	1.80
cmhrhlk0k00vhujso1jl933jg	cmhrhljzr00utujsoz4aao91l	Transaction Fee G1	0	0.30
cmhrhlk0m00vjujsoznhn7mjq	cmhrhljzr00utujsoz4aao91l	Transaction Fee G2	0	0.30
cmhrhlk0o00vlujsod5xe0zik	cmhrhljzr00utujsoz4aao91l	Transaction Fee G3	0	0.40
cmhrhlk0r00vnujso8dd7e1tz	cmhrhljzr00utujsoz4aao91l	Transaction Fee G4	0	0.40
cmhrhlk0t00vpujso3ercx8h8	cmhrhljzr00utujsoz4aao91l	Transaction Fee G5	0	0.30
cmhrhlk0v00vrujsoamvr05rl	cmhrhljzr00utujsoz4aao91l	Transaction Fee G6	0	0.30
cmhrhlk1500vwujsox09sptok	cmhrhlk1300vuujsohe8opm2m	Basic Fee wmView	1	130.00
cmhrhlk1800vyujsopqwo2pyh	cmhrhlk1300vuujsohe8opm2m	Basis fee for additional user accounts	0	10.00
cmhrhlk1a00w0ujsouc9bcx2z	cmhrhlk1300vuujsohe8opm2m	Basic Fee wmPos	0	50.00
cmhrhlk1c00w2ujso0470i711	cmhrhlk1300vuujsohe8opm2m	Basic Fee wmGuide	0	1000.00
cmhrhlk1f00w4ujsotnn634vj	cmhrhlk1300vuujsohe8opm2m	Change of user accounts	0	10.00
cmhrhlk1i00w6ujsohtdfw63b	cmhrhlk1300vuujsohe8opm2m	Transaction Fee T1	14	0.58
cmhrhlk1k00w8ujsog5wbjx0d	cmhrhlk1300vuujsohe8opm2m	Transaction Fee T2	0	0.70
cmhrhlk1n00waujsoeue52kib	cmhrhlk1300vuujsohe8opm2m	Transaction Fee T3	162	1.50
cmhrhlk1p00wcujsomqadl4vh	cmhrhlk1300vuujsohe8opm2m	Transaction Fee T4	0	0.50
cmhrhlk1r00weujsol2oo4ocu	cmhrhlk1300vuujsohe8opm2m	Transaction Fee T5	0	0.80
cmhrhlk1t00wgujsoq1c6ibxo	cmhrhlk1300vuujsohe8opm2m	Transaction Fee T6	0	1.80
cmhrhlk1v00wiujsofg8ohdtr	cmhrhlk1300vuujsohe8opm2m	Transaction Fee G1	0	0.30
cmhrhlk1y00wkujso1gh1ivfb	cmhrhlk1300vuujsohe8opm2m	Transaction Fee G2	0	0.30
cmhrhlk2000wmujsoyl5ghjqk	cmhrhlk1300vuujsohe8opm2m	Transaction Fee G3	0	0.40
cmhrhlk2200woujsoreni7w34	cmhrhlk1300vuujsohe8opm2m	Transaction Fee G4	0	0.40
cmhrhlk2400wqujsoehhspfkv	cmhrhlk1300vuujsohe8opm2m	Transaction Fee G5	0	0.30
cmhrhlk2600wsujsoupba90o9	cmhrhlk1300vuujsohe8opm2m	Transaction Fee G6	0	0.30
cmhrhlk2f00wxujso0d7ab1ln	cmhrhlk2d00wvujsoz758cnk6	Basic Fee wmView	1	130.00
cmhrhlk2i00wzujso54se1m8w	cmhrhlk2d00wvujsoz758cnk6	Basis fee for additional user accounts	0	10.00
cmhrhlk2k00x1ujsof7po6gva	cmhrhlk2d00wvujsoz758cnk6	Basic Fee wmPos	0	50.00
cmhrhlk2m00x3ujso6kcvsl6o	cmhrhlk2d00wvujsoz758cnk6	Basic Fee wmGuide	0	1000.00
cmhrhlk2p00x5ujsohwfcufhu	cmhrhlk2d00wvujsoz758cnk6	Change of user accounts	0	10.00
cmhrhlk2s00x7ujso9krjhncn	cmhrhlk2d00wvujsoz758cnk6	Transaction Fee T1	14	0.58
cmhrhlk2u00x9ujsoxjt3gbd1	cmhrhlk2d00wvujsoz758cnk6	Transaction Fee T2	0	0.70
cmhrhlk2x00xbujsol3u49vpq	cmhrhlk2d00wvujsoz758cnk6	Transaction Fee T3	162	1.50
cmhrhlk2z00xdujsongieluve	cmhrhlk2d00wvujsoz758cnk6	Transaction Fee T4	0	0.50
cmhrhlk3200xfujsonm58thk4	cmhrhlk2d00wvujsoz758cnk6	Transaction Fee T5	0	0.80
cmhrhlk3400xhujsopd25q11t	cmhrhlk2d00wvujsoz758cnk6	Transaction Fee T6	0	1.80
cmhrhlk3700xjujsovwbbqhuz	cmhrhlk2d00wvujsoz758cnk6	Transaction Fee G1	0	0.30
cmhrhlk3900xlujsozdnm9dwk	cmhrhlk2d00wvujsoz758cnk6	Transaction Fee G2	0	0.30
cmhrhlk3b00xnujsonf2l6aoi	cmhrhlk2d00wvujsoz758cnk6	Transaction Fee G3	0	0.40
cmhrhlk3e00xpujsov4rk5ck1	cmhrhlk2d00wvujsoz758cnk6	Transaction Fee G4	0	0.40
cmhrhlk3g00xrujsox3rw756r	cmhrhlk2d00wvujsoz758cnk6	Transaction Fee G5	0	0.30
cmhrhlk3j00xtujsorrc2fy95	cmhrhlk2d00wvujsoz758cnk6	Transaction Fee G6	0	0.30
cmhrhlk3s00xyujsoesoen2c8	cmhrhlk3q00xwujsotkn9iyxr	Basic Fee wmView	1	130.00
cmhrhlk3v00y0ujso4pk37cxe	cmhrhlk3q00xwujsotkn9iyxr	Basis fee for additional user accounts	0	10.00
cmhrhlk3x00y2ujso18b8kilb	cmhrhlk3q00xwujsotkn9iyxr	Basic Fee wmPos	0	50.00
cmhrhlk4000y4ujso2uh7wwd1	cmhrhlk3q00xwujsotkn9iyxr	Basic Fee wmGuide	0	1000.00
cmhrhlk4200y6ujso0z32rua4	cmhrhlk3q00xwujsotkn9iyxr	Change of user accounts	0	10.00
cmhrhlk4500y8ujsoawxe1zl5	cmhrhlk3q00xwujsotkn9iyxr	Transaction Fee T1	14	0.58
cmhrhlk4700yaujso85pe6k08	cmhrhlk3q00xwujsotkn9iyxr	Transaction Fee T2	0	0.70
cmhrhlk4900ycujso6rs0nynx	cmhrhlk3q00xwujsotkn9iyxr	Transaction Fee T3	162	1.50
cmhrhlk4b00yeujsoew3p5hly	cmhrhlk3q00xwujsotkn9iyxr	Transaction Fee T4	0	0.50
cmhrhlk4d00ygujso56e23zyb	cmhrhlk3q00xwujsotkn9iyxr	Transaction Fee T5	0	0.80
cmhrhlk4f00yiujso3szsuv4n	cmhrhlk3q00xwujsotkn9iyxr	Transaction Fee T6	0	1.80
cmhrhlk4h00ykujsolp196mjb	cmhrhlk3q00xwujsotkn9iyxr	Transaction Fee G1	0	0.30
cmhrhlk4k00ymujsoc3wc0aaq	cmhrhlk3q00xwujsotkn9iyxr	Transaction Fee G2	0	0.30
cmhrhlk4m00youjsoped6pyqe	cmhrhlk3q00xwujsotkn9iyxr	Transaction Fee G3	0	0.40
cmhrhlk4n00yqujsobcwflwsu	cmhrhlk3q00xwujsotkn9iyxr	Transaction Fee G4	0	0.40
cmhrhlk4p00ysujso9la6x5g4	cmhrhlk3q00xwujsotkn9iyxr	Transaction Fee G5	0	0.30
cmhrhlk4r00yuujsoxczvrqx0	cmhrhlk3q00xwujsotkn9iyxr	Transaction Fee G6	0	0.30
cmhrhlk5000yzujsohs4mfq7a	cmhrhlk4x00yxujsod2w3ogt8	Basic Fee wmView	1	130.00
cmhrhlk5200z1ujso8ii3bxwr	cmhrhlk4x00yxujsod2w3ogt8	Basis fee for additional user accounts	0	10.00
cmhrhlk5400z3ujsouuak5alb	cmhrhlk4x00yxujsod2w3ogt8	Basic Fee wmPos	0	50.00
cmhrhlk5600z5ujsogks45k6c	cmhrhlk4x00yxujsod2w3ogt8	Basic Fee wmGuide	0	1000.00
cmhrhlk5800z7ujsod4o6k1qm	cmhrhlk4x00yxujsod2w3ogt8	Change of user accounts	0	10.00
cmhrhlk5a00z9ujso3ghocau3	cmhrhlk4x00yxujsod2w3ogt8	Transaction Fee T1	14	0.58
cmhrhlk5d00zbujsop717hkyo	cmhrhlk4x00yxujsod2w3ogt8	Transaction Fee T2	0	0.70
cmhrhlk5e00zdujsom3aeywbe	cmhrhlk4x00yxujsod2w3ogt8	Transaction Fee T3	162	1.50
cmhrhlk5g00zfujso2qg93oaa	cmhrhlk4x00yxujsod2w3ogt8	Transaction Fee T4	0	0.50
cmhrhlk5i00zhujsoqy2kgpct	cmhrhlk4x00yxujsod2w3ogt8	Transaction Fee T5	0	0.80
cmhrhlk5k00zjujsozi9xdziq	cmhrhlk4x00yxujsod2w3ogt8	Transaction Fee T6	0	1.80
cmhrhlk5m00zlujsorxqoq3dg	cmhrhlk4x00yxujsod2w3ogt8	Transaction Fee G1	0	0.30
cmhrhlk5p00znujsoqd0zpy09	cmhrhlk4x00yxujsod2w3ogt8	Transaction Fee G2	0	0.30
cmhrhlk5r00zpujsowze8zv0e	cmhrhlk4x00yxujsod2w3ogt8	Transaction Fee G3	0	0.40
cmhrhlk5t00zrujsoasn6gw11	cmhrhlk4x00yxujsod2w3ogt8	Transaction Fee G4	0	0.40
cmhrhlk5u00ztujsotv4gabve	cmhrhlk4x00yxujsod2w3ogt8	Transaction Fee G5	0	0.30
cmhrhlk5w00zvujsou44q47jk	cmhrhlk4x00yxujsod2w3ogt8	Transaction Fee G6	0	0.30
cmhrhlk640100ujsohh2brcq8	cmhrhlk6200zyujsol3fg226w	Basic Fee wmView	1	130.00
cmhrhlk660102ujsoobbgyfw0	cmhrhlk6200zyujsol3fg226w	Basis fee for additional user accounts	0	10.00
cmhrhlk670104ujsowfci8edf	cmhrhlk6200zyujsol3fg226w	Basic Fee wmPos	0	50.00
cmhrhlk690106ujsod73zmxz8	cmhrhlk6200zyujsol3fg226w	Basic Fee wmGuide	0	1000.00
cmhrhlk6b0108ujsodhfb6v2y	cmhrhlk6200zyujsol3fg226w	Change of user accounts	0	10.00
cmhrhlk6d010aujsoazslmxe4	cmhrhlk6200zyujsol3fg226w	Transaction Fee T1	14	0.58
cmhrhlk6f010cujsoc9rbq9k8	cmhrhlk6200zyujsol3fg226w	Transaction Fee T2	0	0.70
cmhrhlk6h010eujsonrfxvr6p	cmhrhlk6200zyujsol3fg226w	Transaction Fee T3	162	1.50
cmhrhlk6j010gujso2uoh57lf	cmhrhlk6200zyujsol3fg226w	Transaction Fee T4	0	0.50
cmhrhlk6l010iujsonayv27vf	cmhrhlk6200zyujsol3fg226w	Transaction Fee T5	0	0.80
cmhrhlk6m010kujsozd2qd9lh	cmhrhlk6200zyujsol3fg226w	Transaction Fee T6	0	1.80
cmhrhlk6o010mujsorkk6iykq	cmhrhlk6200zyujsol3fg226w	Transaction Fee G1	0	0.30
cmhrhlk6q010oujso4nx8ughs	cmhrhlk6200zyujsol3fg226w	Transaction Fee G2	0	0.30
cmhrhlk6s010qujsos3ntqa6e	cmhrhlk6200zyujsol3fg226w	Transaction Fee G3	0	0.40
cmhrhlk6u010sujso1mil7pzh	cmhrhlk6200zyujsol3fg226w	Transaction Fee G4	0	0.40
cmhrhlk6w010uujsoi3rvdk3o	cmhrhlk6200zyujsol3fg226w	Transaction Fee G5	0	0.30
cmhrhlk6y010wujso8uzokbuv	cmhrhlk6200zyujsol3fg226w	Transaction Fee G6	0	0.30
cmhrhlk760111ujso9ja8a5hk	cmhrhlk74010zujsofwh6960e	Basic Fee wmView	1	130.00
cmhrhlk770113ujso8dinnf0t	cmhrhlk74010zujsofwh6960e	Basis fee for additional user accounts	0	10.00
cmhrhlk790115ujsoqxzjwids	cmhrhlk74010zujsofwh6960e	Basic Fee wmPos	0	50.00
cmhrhlk7b0117ujsodp39aynv	cmhrhlk74010zujsofwh6960e	Basic Fee wmGuide	0	1000.00
cmhrhlk7d0119ujsoldnx38kx	cmhrhlk74010zujsofwh6960e	Change of user accounts	0	10.00
cmhrhlk7f011bujsourf6fpfi	cmhrhlk74010zujsofwh6960e	Transaction Fee T1	14	0.58
cmhrhlk7i011dujsoec9f826n	cmhrhlk74010zujsofwh6960e	Transaction Fee T2	0	0.70
cmhrhlk7k011fujsoibfyrghk	cmhrhlk74010zujsofwh6960e	Transaction Fee T3	162	1.50
cmhrhlk7n011hujso93l985tj	cmhrhlk74010zujsofwh6960e	Transaction Fee T4	0	0.50
cmhrhlk7p011jujsoywhtrfzw	cmhrhlk74010zujsofwh6960e	Transaction Fee T5	0	0.80
cmhrhlk7r011lujso0revgkdb	cmhrhlk74010zujsofwh6960e	Transaction Fee T6	0	1.80
cmhrhlk7t011nujsotzuko3h0	cmhrhlk74010zujsofwh6960e	Transaction Fee G1	0	0.30
cmhrhlk7v011pujso6ge8xru7	cmhrhlk74010zujsofwh6960e	Transaction Fee G2	0	0.30
cmhrhlk7x011rujsor69t9oig	cmhrhlk74010zujsofwh6960e	Transaction Fee G3	0	0.40
cmhrhlk7z011tujsoslewaasi	cmhrhlk74010zujsofwh6960e	Transaction Fee G4	0	0.40
cmhrhlk81011vujsoqcl2cm9n	cmhrhlk74010zujsofwh6960e	Transaction Fee G5	0	0.30
cmhrhlk83011xujsofx2cqynp	cmhrhlk74010zujsofwh6960e	Transaction Fee G6	0	0.30
cmhrhlk8e0122ujso599jt4wh	cmhrhlk8a0120ujsod7ahlofo	Basic Fee wmView	1	130.00
cmhrhlk8h0124ujsov1kcuq4h	cmhrhlk8a0120ujsod7ahlofo	Basis fee for additional user accounts	0	10.00
cmhrhlk8j0126ujsoetxvk9d3	cmhrhlk8a0120ujsod7ahlofo	Basic Fee wmPos	0	50.00
cmhrhlk8l0128ujsofc8isita	cmhrhlk8a0120ujsod7ahlofo	Basic Fee wmGuide	0	1000.00
cmhrhlk8n012aujso9ds6913m	cmhrhlk8a0120ujsod7ahlofo	Change of user accounts	0	10.00
cmhrhlk8p012cujsogi4kx07s	cmhrhlk8a0120ujsod7ahlofo	Transaction Fee T1	14	0.58
cmhrhlk8r012eujsof3cff4fe	cmhrhlk8a0120ujsod7ahlofo	Transaction Fee T2	0	0.70
cmhrhlk8t012gujsoaay3yfdj	cmhrhlk8a0120ujsod7ahlofo	Transaction Fee T3	162	1.50
cmhrhlk8v012iujsoz09lik6z	cmhrhlk8a0120ujsod7ahlofo	Transaction Fee T4	0	0.50
cmhrhlk8x012kujsoq2epkw1y	cmhrhlk8a0120ujsod7ahlofo	Transaction Fee T5	0	0.80
cmhrhlk8z012mujsohaa9jldy	cmhrhlk8a0120ujsod7ahlofo	Transaction Fee T6	0	1.80
cmhrhlk91012oujso3ozg2jv7	cmhrhlk8a0120ujsod7ahlofo	Transaction Fee G1	0	0.30
cmhrhlk93012qujso6c7jrmue	cmhrhlk8a0120ujsod7ahlofo	Transaction Fee G2	0	0.30
cmhrhlk95012sujsoa7z1w0v6	cmhrhlk8a0120ujsod7ahlofo	Transaction Fee G3	0	0.40
cmhrhlk97012uujsotgpubk7m	cmhrhlk8a0120ujsod7ahlofo	Transaction Fee G4	0	0.40
cmhrhlk9a012wujso2v7wk9lu	cmhrhlk8a0120ujsod7ahlofo	Transaction Fee G5	0	0.30
cmhrhlk9c012yujso0160ooa9	cmhrhlk8a0120ujsod7ahlofo	Transaction Fee G6	0	0.30
cmhrhlk9k0133ujso3vh09s2n	cmhrhlk9i0131ujsou5d5lrt8	Basic Fee wmView	1	130.00
cmhrhlk9m0135ujsozbu86rz9	cmhrhlk9i0131ujsou5d5lrt8	Basis fee for additional user accounts	0	10.00
cmhrhlk9o0137ujsopnvf6p9b	cmhrhlk9i0131ujsou5d5lrt8	Basic Fee wmPos	0	50.00
cmhrhlk9q0139ujsotj5ayalr	cmhrhlk9i0131ujsou5d5lrt8	Basic Fee wmGuide	0	1000.00
cmhrhlk9s013bujsorouu8dvp	cmhrhlk9i0131ujsou5d5lrt8	Change of user accounts	0	10.00
cmhrhlk9u013dujsogm1zt2qo	cmhrhlk9i0131ujsou5d5lrt8	Transaction Fee T1	14	0.58
cmhrhlk9w013fujso3b07zdxn	cmhrhlk9i0131ujsou5d5lrt8	Transaction Fee T2	0	0.70
cmhrhlk9y013hujso51j5hb1u	cmhrhlk9i0131ujsou5d5lrt8	Transaction Fee T3	162	1.50
cmhrhlka0013jujsowtji9uw6	cmhrhlk9i0131ujsou5d5lrt8	Transaction Fee T4	0	0.50
cmhrhlka2013lujso1a1hsl5a	cmhrhlk9i0131ujsou5d5lrt8	Transaction Fee T5	0	0.80
cmhrhlka4013nujso8amq2eat	cmhrhlk9i0131ujsou5d5lrt8	Transaction Fee T6	0	1.80
cmhrhlka6013pujso0bxwjjpo	cmhrhlk9i0131ujsou5d5lrt8	Transaction Fee G1	0	0.30
cmhrhlka8013rujso0ygw2qr6	cmhrhlk9i0131ujsou5d5lrt8	Transaction Fee G2	0	0.30
cmhrhlkaa013tujsoi7b8im8i	cmhrhlk9i0131ujsou5d5lrt8	Transaction Fee G3	0	0.40
cmhrhlkad013vujsonlaxg0ec	cmhrhlk9i0131ujsou5d5lrt8	Transaction Fee G4	0	0.40
cmhrhlkaf013xujso3kd5cr0k	cmhrhlk9i0131ujsou5d5lrt8	Transaction Fee G5	0	0.30
cmhrhlkah013zujso8vanos07	cmhrhlk9i0131ujsou5d5lrt8	Transaction Fee G6	0	0.30
cmhrhlkap0144ujsoqexeje8r	cmhrhlkan0142ujsolf44nxub	Basic Fee wmView	1	130.00
cmhrhlkar0146ujsoa6mu5lye	cmhrhlkan0142ujsolf44nxub	Basis fee for additional user accounts	0	10.00
cmhrhlkat0148ujsokhjmonft	cmhrhlkan0142ujsolf44nxub	Basic Fee wmPos	0	50.00
cmhrhlkav014aujso8j03vv8x	cmhrhlkan0142ujsolf44nxub	Basic Fee wmGuide	0	1000.00
cmhrhlkax014cujsom55welk7	cmhrhlkan0142ujsolf44nxub	Change of user accounts	0	10.00
cmhrhlkay014eujso49gizg41	cmhrhlkan0142ujsolf44nxub	Transaction Fee T1	14	0.58
cmhrhlkb0014gujsopmjy0rgk	cmhrhlkan0142ujsolf44nxub	Transaction Fee T2	0	0.70
cmhrhlkb2014iujso3ifu614c	cmhrhlkan0142ujsolf44nxub	Transaction Fee T3	162	1.50
cmhrhlkb4014kujsoaay4ma43	cmhrhlkan0142ujsolf44nxub	Transaction Fee T4	0	0.50
cmhrhlkb6014mujsopsoenxo4	cmhrhlkan0142ujsolf44nxub	Transaction Fee T5	0	0.80
cmhrhlkb7014oujsodhs9ws07	cmhrhlkan0142ujsolf44nxub	Transaction Fee T6	0	1.80
cmhrhlkb9014qujso38hfthte	cmhrhlkan0142ujsolf44nxub	Transaction Fee G1	0	0.30
cmhrhlkbb014sujsodqbkyla6	cmhrhlkan0142ujsolf44nxub	Transaction Fee G2	0	0.30
cmhrhlkbd014uujsoci4o8qw5	cmhrhlkan0142ujsolf44nxub	Transaction Fee G3	0	0.40
cmhrhlkbf014wujsoiktatyqg	cmhrhlkan0142ujsolf44nxub	Transaction Fee G4	0	0.40
cmhrhlkbh014yujsohygecf8z	cmhrhlkan0142ujsolf44nxub	Transaction Fee G5	0	0.30
cmhrhlkbi0150ujso4j8uzufx	cmhrhlkan0142ujsolf44nxub	Transaction Fee G6	0	0.30
\.


--
-- Data for Name: Payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Payment" (id, "invoiceId", "paidOn", amount, method) FROM stdin;
6481772c-dac9-488f-8cd9-9d8fd0415fcf	cmhrhlisq000gujsof9zp9hnv	2024-03-08 00:00:00	19.99	\N
2b800dbf-e2e6-4c6c-91ba-d25c2aad7ebf	cmhrhlit3000lujsobvlmxbiu	2024-01-08 00:00:00	618.80	\N
deddee47-4f7a-4c10-8a8e-3aaf5115e9b1	cmhrhlith000sujsofpdwheuo	2020-01-08 00:00:00	3653.30	\N
8dda7156-b04f-411d-b84d-cde5f9a6826e	cmhrhliu10013ujsougflzdjn	2023-12-22 00:00:00	541.45	\N
4f5ee98c-a6be-482a-b442-193508ede89b	cmhrhliud0018ujsofvg5k44h	2025-08-15 00:00:00	2840.00	\N
5630cca7-3068-472e-b5f3-1cb75fda008c	cmhrhliv1001lujsorekyul36	2014-06-04 00:00:00	312.96	\N
02136d7f-2f2a-4092-8d46-15b4d3cd2bff	cmhrhlivr0020ujso0o3lps7b	2015-08-14 00:00:00	1190.00	\N
1577387b-75f1-4e48-9e9a-f71fc5df7bab	cmhrhliw20025ujsoz18cgy9a	2025-08-15 00:00:00	2840.00	\N
366ec176-cbff-4b15-a3e7-f4fc3195165e	cmhrhliws002iujso6d3cykgn	2020-06-03 00:00:00	4645.00	\N
4cd68146-4176-4548-9e77-3b9b7d18c4d4	cmhrhlixf002xujsocp7j94r6	2025-11-03 00:00:00	84.00	\N
947d4d9c-e9cc-4fc8-a2da-c31be5549f20	cmhrhlixp0032ujso2xing5qx	2024-03-08 00:00:00	381.12	\N
6c267586-ff26-4e88-88e6-21b0029d1efe	cmhrhliz40043ujsodviodgy1	2024-03-08 00:00:00	381.12	\N
b6174f7f-8a45-4029-a2a4-3b3e77227da2	cmhrhlj0o0054ujsoup6mc5d7	2024-03-08 00:00:00	381.12	\N
5dcd8af9-e91a-4e30-a6d7-3ee7904e3feb	cmhrhlj200065ujsodcyyu3oa	2024-03-08 00:00:00	381.12	\N
ab895483-421f-41c1-91d7-137fc9ca3a49	cmhrhlj3g0076ujso04pyoc8h	2024-03-08 00:00:00	381.12	\N
282ef2e9-02e4-4605-9eb5-0e7623fd458b	cmhrhlj4z0087ujsod9iszne7	2024-03-08 00:00:00	381.12	\N
6b3449dc-b665-4503-98e0-a2a461a8abe8	cmhrhlj6f0098ujso5jlczjqb	2024-03-08 00:00:00	381.12	\N
bf6aadd3-dd7b-4244-baa9-9ced1bb77466	cmhrhlj7w00a9ujsobfqpspwi	2024-03-08 00:00:00	381.12	\N
c917989b-dd32-4102-82ec-8b2a2521674d	cmhrhlj9c00baujsotmqlkmmv	2024-03-08 00:00:00	381.12	\N
5163c69c-b7e1-473b-80bc-3a13ad56b6a4	cmhrhljax00cbujsoxgq3s417	2024-03-08 00:00:00	381.12	\N
6fb535ab-2773-44d5-a365-15fffdc6a5e8	cmhrhljcf00dcujsozic43v1q	2024-03-08 00:00:00	381.12	\N
f58dec5c-d06f-4a19-b5b0-a645d0f72301	cmhrhljdu00edujsok737nlmo	2024-03-08 00:00:00	381.12	\N
5535e30e-25e8-45f0-a323-98b9b3c46240	cmhrhljf700feujsoguofi1by	2024-03-08 00:00:00	381.12	\N
e5d0e27b-5006-49ec-adfe-2599d5c277e5	cmhrhljgp00gfujso84syjtn7	2024-03-08 00:00:00	381.12	\N
4f8f116f-df68-4afb-988b-3115d7ae0e7f	cmhrhlji700hgujson2ti76ke	2024-03-08 00:00:00	381.12	\N
11c3eeae-5340-411b-91f2-eb3544998c02	cmhrhljjn00ihujsopuf6cgjn	2024-03-08 00:00:00	381.12	\N
521dc1f9-5b60-44f2-aaf5-f013cfb9eea1	cmhrhljky00jiujsorvyi1xsc	2024-03-08 00:00:00	381.12	\N
acca6f21-0c6a-403f-8b81-bf57ad90ed9b	cmhrhljm800kjujsowohqgtau	2024-03-08 00:00:00	381.12	\N
f60dca22-b055-4fab-861b-bee33f4e7041	cmhrhljni00lkujso4kj1b8ck	2024-03-08 00:00:00	381.12	\N
d48489b9-7fcc-436c-87e2-48a0624a254a	cmhrhljou00mlujsohu1mqzgc	2024-03-08 00:00:00	381.12	\N
897104c8-93c4-4564-afb5-474f353e8e69	cmhrhljq800nmujsoxjyx8wa3	2024-03-08 00:00:00	381.12	\N
d07d4a34-b996-4000-90e5-745f3ab79070	cmhrhljrj00onujsogopcr8x8	2024-03-08 00:00:00	381.12	\N
748ecc0a-cfc4-40ef-b219-e75975d6f26b	cmhrhljsx00poujsou68fscy3	2024-03-08 00:00:00	381.12	\N
57d483a3-8efa-4e39-a5d0-86ea209c7f01	cmhrhljuc00qpujso21nzjzfd	2024-03-08 00:00:00	381.12	\N
5708ef74-6efa-4024-a4c3-bd18c7b8fcf0	cmhrhljvq00rqujsor7vs34iz	2024-03-08 00:00:00	381.12	\N
17a3d2a6-1bba-4213-93f1-76286ee0b6eb	cmhrhljx300srujsof1ipnn17	2024-03-08 00:00:00	381.12	\N
2616bb6b-e700-4097-90fe-6f2157cda591	cmhrhljye00tsujsoj9suyil3	2024-03-08 00:00:00	381.12	\N
4facc8e4-67b6-4fb0-aeb1-771dd63663ae	cmhrhljzr00utujsoz4aao91l	2024-03-08 00:00:00	381.12	\N
aefe6bc7-0d61-4cdf-93c9-29eda7da135c	cmhrhlk1300vuujsohe8opm2m	2024-03-08 00:00:00	381.12	\N
423440ce-63fd-4fa4-aee4-d035b128fdeb	cmhrhlk2d00wvujsoz758cnk6	2024-03-08 00:00:00	381.12	\N
004e2e0e-ff78-4558-924a-5644a8620f9c	cmhrhlk3q00xwujsotkn9iyxr	2024-03-08 00:00:00	381.12	\N
ee56afd7-0075-4ecb-ac89-ffefd8d9af38	cmhrhlk4x00yxujsod2w3ogt8	2024-03-08 00:00:00	381.12	\N
db20ba3c-bb05-4e6f-aa8e-b9131fd81bde	cmhrhlk6200zyujsol3fg226w	2024-03-08 00:00:00	381.12	\N
e186a299-6c9a-439a-855e-5f06d7812ac3	cmhrhlk74010zujsofwh6960e	2024-03-08 00:00:00	381.12	\N
e19574b4-19f3-40e0-b662-0beeefbfc6b8	cmhrhlk8a0120ujsod7ahlofo	2024-03-08 00:00:00	381.12	\N
60fd046b-b905-4966-afb7-e3f86470e93c	cmhrhlk9i0131ujsou5d5lrt8	2024-03-08 00:00:00	381.12	\N
24418639-66e3-4a38-8f15-c91e3d094e49	cmhrhlkan0142ujsolf44nxub	2024-03-08 00:00:00	381.12	\N
\.


--
-- Data for Name: Vendor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Vendor" (id, name, category, "createdAt") FROM stdin;
cmhrhinbm0000ujdga5mx4bqr	Musterfirma Müller	\N	2025-11-09 09:02:00.082
cmhrhlisi000eujso288ddp5m	belegFuchs	\N	2025-11-09 09:04:14.178
cmhrhlisx000jujso4ojtn0fb	Auto Teile Europa GmbH	\N	2025-11-09 09:04:14.193
cmhrhlitc000qujsokrn3hq12	pixa	\N	2025-11-09 09:04:14.208
cmhrhlitv0011ujsoxybk2u7v	Taxon GmbH	\N	2025-11-09 09:04:14.228
cmhrhliu70016ujsoilwj6bt0	EasyFirma GmbH & Co KG	\N	2025-11-09 09:04:14.24
cmhrhliuu001jujsodkw3j6n4	Muster GmbH	\N	2025-11-09 09:04:14.263
cmhrhlivl001yujsokuycqv0t	Firmenname	\N	2025-11-09 09:04:14.289
cmhrhliwm002gujsosw6767xa	ABC Seller	\N	2025-11-09 09:04:14.327
cmhrhlixa002vujso68scfssq	LAXMIDAIRY	\N	2025-11-09 09:04:14.35
cmhrhlixk0030ujsod3ps5mzg	CPB SOFTWARE (GERMANY) GMBH	\N	2025-11-09 09:04:14.36
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
b95b6349-359c-40d2-a54b-68020ffd4183	4f697e674ac45145f029b0ebd9cb59815e4d8c6b28f98ae9aa842e0083f46e15	2025-11-09 14:01:47.205164+05:30	20251109083147_init	\N	\N	2025-11-09 14:01:47.148916+05:30	1
954c5918-f59d-4287-b92c-782f04a6c423	1cb050d03b40118457355f035ec7cfca9f791ebe2ecbce9365d8edfec69868e2	2025-11-09 14:31:35.821627+05:30	20251109090135_make_vendor_name_unique	\N	\N	2025-11-09 14:31:35.801373+05:30	1
\.


--
-- Name: Invoice Invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Invoice"
    ADD CONSTRAINT "Invoice_pkey" PRIMARY KEY (id);


--
-- Name: LineItem LineItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LineItem"
    ADD CONSTRAINT "LineItem_pkey" PRIMARY KEY (id);


--
-- Name: Payment Payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "Payment_pkey" PRIMARY KEY (id);


--
-- Name: Vendor Vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vendor"
    ADD CONSTRAINT "Vendor_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Invoice_invoiceNo_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Invoice_invoiceNo_key" ON public."Invoice" USING btree ("invoiceNo");


--
-- Name: Vendor_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Vendor_name_key" ON public."Vendor" USING btree (name);


--
-- Name: Invoice Invoice_vendorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Invoice"
    ADD CONSTRAINT "Invoice_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES public."Vendor"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: LineItem LineItem_invoiceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LineItem"
    ADD CONSTRAINT "LineItem_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES public."Invoice"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Payment Payment_invoiceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "Payment_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES public."Invoice"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO vanna_ro;


--
-- Name: TABLE "Invoice"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public."Invoice" TO vanna_ro;


--
-- Name: TABLE "LineItem"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public."LineItem" TO vanna_ro;


--
-- Name: TABLE "Payment"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public."Payment" TO vanna_ro;


--
-- Name: TABLE "Vendor"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public."Vendor" TO vanna_ro;


--
-- Name: TABLE _prisma_migrations; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public._prisma_migrations TO vanna_ro;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT ON TABLES TO vanna_ro;


--
-- PostgreSQL database dump complete
--

\unrestrict 5o6KtDALWiDAtytCbU7U9nOljpHltskJuLJbVfedgSMdmtcecj6FFRt7b9bbbQP

