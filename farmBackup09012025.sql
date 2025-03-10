toc.dat                                                                                             0000600 0004000 0002000 00000045331 14737554773 0014473 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   /             	         }            farmpsql    16.4 (Debian 16.4-1.pgdg120+2)    16.2 @    i           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         j           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         k           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         l           1262    16389    farmpsql    DATABASE     s   CREATE DATABASE farmpsql WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF8';
    DROP DATABASE farmpsql;
                farmpsql_user    false         m           0    0    farmpsql    DATABASE PROPERTIES     1   ALTER DATABASE farmpsql SET "TimeZone" TO 'utc';
                     farmpsql_user    false                     2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                farmpsql_user    false         �            1259    16612    address    TABLE     �   CREATE TABLE public.address (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address text NOT NULL,
    address_type character varying(50),
    is_default boolean DEFAULT false
);
    DROP TABLE public.address;
       public         heap    farmpsql_user    false    5         �            1259    16611    address_id_seq    SEQUENCE     �   CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.address_id_seq;
       public          farmpsql_user    false    224    5         n           0    0    address_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;
          public          farmpsql_user    false    223         �            1259    16435    basket    TABLE     �   CREATE TABLE public.basket (
    id integer NOT NULL,
    user_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity numeric(10,2) NOT NULL,
    basket_id character varying(6) NOT NULL
);
    DROP TABLE public.basket;
       public         heap    farmpsql_user    false    5         �            1259    16434    basket_id_seq    SEQUENCE     �   CREATE SEQUENCE public.basket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.basket_id_seq;
       public          farmpsql_user    false    5    222         o           0    0    basket_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.basket_id_seq OWNED BY public.basket.id;
          public          farmpsql_user    false    221         �            1259    16409    item    TABLE     �  CREATE TABLE public.item (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    price double precision NOT NULL,
    is_hidden boolean DEFAULT false,
    image_path character varying(255),
    file_size bytea,
    unit character varying(50) DEFAULT 'Kg'::character varying NOT NULL,
    CONSTRAINT item_image_path_check CHECK ((octet_length((image_path)::text) <= 51200)),
    CONSTRAINT item_image_path_check1 CHECK ((octet_length((image_path)::text) <= 102400))
);
    DROP TABLE public.item;
       public         heap    farmpsql_user    false    5         �            1259    16408    item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.item_id_seq;
       public          farmpsql_user    false    5    218         p           0    0    item_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.item_id_seq OWNED BY public.item.id;
          public          farmpsql_user    false    217         �            1259    16418    order    TABLE     �  CREATE TABLE public."order" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity numeric(10,2) NOT NULL,
    total_price double precision NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    delivery_address character varying(255) NOT NULL,
    payment_method character varying(50) DEFAULT 'default_method'::character varying NOT NULL,
    order_id character varying(36) DEFAULT gen_random_uuid() NOT NULL,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    address_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    payment_option character varying(50) DEFAULT 'default_method'::character varying NOT NULL
);
    DROP TABLE public."order";
       public         heap    farmpsql_user    false    5         �            1259    16417    order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.order_id_seq;
       public          farmpsql_user    false    5    220         q           0    0    order_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;
          public          farmpsql_user    false    219         �            1259    16984 
   order_item    TABLE     �   CREATE TABLE public.order_item (
    id integer NOT NULL,
    order_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric NOT NULL
);
    DROP TABLE public.order_item;
       public         heap    farmpsql_user    false    5         �            1259    16983    order_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.order_item_id_seq;
       public          farmpsql_user    false    226    5         r           0    0    order_item_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.order_item_id_seq OWNED BY public.order_item.id;
          public          farmpsql_user    false    225         �            1259    16400    user    TABLE     $  CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(80) NOT NULL,
    password character varying(255) NOT NULL,
    is_admin boolean,
    phone_number character varying(255),
    address character varying(255),
    alternate_address character varying(255)
);
    DROP TABLE public."user";
       public         heap    farmpsql_user    false    5         �            1259    16399    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          farmpsql_user    false    216    5         s           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          farmpsql_user    false    215         �           2604    16615 
   address id    DEFAULT     h   ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);
 9   ALTER TABLE public.address ALTER COLUMN id DROP DEFAULT;
       public          farmpsql_user    false    224    223    224         �           2604    16438 	   basket id    DEFAULT     f   ALTER TABLE ONLY public.basket ALTER COLUMN id SET DEFAULT nextval('public.basket_id_seq'::regclass);
 8   ALTER TABLE public.basket ALTER COLUMN id DROP DEFAULT;
       public          farmpsql_user    false    221    222    222         �           2604    16412    item id    DEFAULT     b   ALTER TABLE ONLY public.item ALTER COLUMN id SET DEFAULT nextval('public.item_id_seq'::regclass);
 6   ALTER TABLE public.item ALTER COLUMN id DROP DEFAULT;
       public          farmpsql_user    false    217    218    218         �           2604    16421    order id    DEFAULT     f   ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);
 9   ALTER TABLE public."order" ALTER COLUMN id DROP DEFAULT;
       public          farmpsql_user    false    219    220    220         �           2604    16987    order_item id    DEFAULT     n   ALTER TABLE ONLY public.order_item ALTER COLUMN id SET DEFAULT nextval('public.order_item_id_seq'::regclass);
 <   ALTER TABLE public.order_item ALTER COLUMN id DROP DEFAULT;
       public          farmpsql_user    false    225    226    226         �           2604    16403    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          farmpsql_user    false    216    215    216         d          0    16612    address 
   TABLE DATA           Q   COPY public.address (id, user_id, address, address_type, is_default) FROM stdin;
    public          farmpsql_user    false    224       3428.dat b          0    16435    basket 
   TABLE DATA           K   COPY public.basket (id, user_id, item_id, quantity, basket_id) FROM stdin;
    public          farmpsql_user    false    222       3426.dat ^          0    16409    item 
   TABLE DATA           W   COPY public.item (id, name, price, is_hidden, image_path, file_size, unit) FROM stdin;
    public          farmpsql_user    false    218       3422.dat `          0    16418    order 
   TABLE DATA           �   COPY public."order" (id, user_id, item_id, quantity, total_price, date, delivery_address, payment_method, order_id, order_date, address_id, created_at, payment_option) FROM stdin;
    public          farmpsql_user    false    220       3424.dat f          0    16984 
   order_item 
   TABLE DATA           L   COPY public.order_item (id, order_id, item_id, quantity, price) FROM stdin;
    public          farmpsql_user    false    226       3430.dat \          0    16400    user 
   TABLE DATA           l   COPY public."user" (id, username, password, is_admin, phone_number, address, alternate_address) FROM stdin;
    public          farmpsql_user    false    216       3420.dat t           0    0    address_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.address_id_seq', 48, true);
          public          farmpsql_user    false    223         u           0    0    basket_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.basket_id_seq', 211, true);
          public          farmpsql_user    false    221         v           0    0    item_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.item_id_seq', 32, true);
          public          farmpsql_user    false    217         w           0    0    order_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.order_id_seq', 49, true);
          public          farmpsql_user    false    219         x           0    0    order_item_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.order_item_id_seq', 1, false);
          public          farmpsql_user    false    225         y           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 10, true);
          public          farmpsql_user    false    215         �           2606    16620    address address_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT address_pkey;
       public            farmpsql_user    false    224         �           2606    16440    basket basket_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.basket DROP CONSTRAINT basket_pkey;
       public            farmpsql_user    false    222         �           2606    16416    item item_name_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_name_key UNIQUE (name);
 <   ALTER TABLE ONLY public.item DROP CONSTRAINT item_name_key;
       public            farmpsql_user    false    218         �           2606    16414    item item_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.item DROP CONSTRAINT item_pkey;
       public            farmpsql_user    false    218         �           2606    16991    order_item order_item_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.order_item DROP CONSTRAINT order_item_pkey;
       public            farmpsql_user    false    226         �           2606    16953    order order_order_id_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_order_id_key UNIQUE (order_id);
 D   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_order_id_key;
       public            farmpsql_user    false    220         �           2606    16423    order order_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_pkey;
       public            farmpsql_user    false    220         �           2606    16405    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            farmpsql_user    false    216         �           2606    16407    user user_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_username_key;
       public            farmpsql_user    false    216         �           2606    16621    address address_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.address DROP CONSTRAINT address_user_id_fkey;
       public          farmpsql_user    false    216    224    3250         �           2606    16446    basket basket_item_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(id);
 D   ALTER TABLE ONLY public.basket DROP CONSTRAINT basket_item_id_fkey;
       public          farmpsql_user    false    222    218    3256         �           2606    16441    basket basket_user_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 D   ALTER TABLE ONLY public.basket DROP CONSTRAINT basket_user_id_fkey;
       public          farmpsql_user    false    3250    216    222         �           2606    16960    order fk_address    FK CONSTRAINT     �   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT fk_address FOREIGN KEY (address_id) REFERENCES public.address(id) ON DELETE CASCADE;
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT fk_address;
       public          farmpsql_user    false    224    220    3264         �           2606    16970    order fk_item    FK CONSTRAINT        ALTER TABLE ONLY public."order"
    ADD CONSTRAINT fk_item FOREIGN KEY (item_id) REFERENCES public.item(id) ON DELETE CASCADE;
 9   ALTER TABLE ONLY public."order" DROP CONSTRAINT fk_item;
       public          farmpsql_user    false    218    220    3256         �           2606    16975    basket fk_item_in_basket    FK CONSTRAINT     �   ALTER TABLE ONLY public.basket
    ADD CONSTRAINT fk_item_in_basket FOREIGN KEY (item_id) REFERENCES public.item(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.basket DROP CONSTRAINT fk_item_in_basket;
       public          farmpsql_user    false    218    3256    222         �           2606    16429    order order_item_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(id);
 D   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_item_id_fkey;
       public          farmpsql_user    false    218    3256    220         �           2606    16992 #   order_item order_item_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(id);
 M   ALTER TABLE ONLY public.order_item DROP CONSTRAINT order_item_order_id_fkey;
       public          farmpsql_user    false    220    3260    226         �           2606    16424    order order_user_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 D   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_user_id_fkey;
       public          farmpsql_user    false    220    216    3250                    826    16391     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     T   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES TO farmpsql_user;
                   postgres    false                    826    16393    DEFAULT PRIVILEGES FOR TYPES    DEFAULT ACL     P   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES TO farmpsql_user;
                   postgres    false                    826    16392     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     T   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS TO farmpsql_user;
                   postgres    false                    826    16390    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     Q   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO farmpsql_user;
                   postgres    false                                                                                                                                                                                                                                                                                                               3428.dat                                                                                            0000600 0004000 0002000 00000000264 14737554774 0014303 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        47	3	tesdghgs	test2	f
48	3	gfghdsf	tresrts	f
31	1	6/142, Cherlopalli, hfdsfgdasds	home1	f
27	1	6/141, Cherlopalli, hfdsfg	home	t
30	1	6/141, Cherlopalli, hfdsfgdasds	Office	f
\.


                                                                                                                                                                                                                                                                                                                                            3426.dat                                                                                            0000600 0004000 0002000 00000000005 14737554774 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3422.dat                                                                                            0000600 0004000 0002000 00000000554 14737554774 0014277 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        20	Banana	29	f	static/uploads/Banana.png	\N	Dozen
23	Jamun	68	f	static/uploads/Jamun.png	\N	Bag
29	Mosambi (Battai)	35	f	static/uploads/Mosambi.png	\N	Kg
24	Mango	45	t	static/uploads/Mango.png	\N	Piece
21	Custard Apple	89	f	static/uploads/CApple.png	\N	Kg
22	Guava	49	f	static/uploads/Guava.png	\N	Kg
28	Pomegranate	198	f	static/uploads/Pomegranate.png	\N	Kg
\.


                                                                                                                                                    3424.dat                                                                                            0000600 0004000 0002000 00000001716 14737554774 0014302 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        40	1	21	1.00	89	2025-01-07 20:03:58.932141	6/141, Cherlopalli, hfdsfg	cash_on_delivery	65ee3255-a33e-4732-a398-0da6aa87a9f2	2025-01-07 20:03:58.932141	27	2025-01-07 20:03:59.237024	default_method
41	3	29	1.00	35	2025-01-07 20:04:29.481426	tesdghgs	cash_on_delivery	25e455c4-09c6-486f-80ff-8111ffa1cd67	2025-01-07 20:04:29.481426	47	2025-01-07 20:04:29.650088	default_method
44	1	21	2.00	178	2025-01-08 14:18:46.841825	6/141, Cherlopalli, hfdsfg	cash_on_delivery	1b56179c-ab4d-4fae-a12f-efcb6e223125	2025-01-08 14:18:46.841825	27	2025-01-08 14:18:47.007169	default_method
46	1	28	1.00	198	2025-01-08 14:35:39.364452	6/141, Cherlopalli, hfdsfg	cash_on_delivery	d96e207d-0f47-415b-986f-1e83bf6d2e91	2025-01-08 14:35:39.364452	27	2025-01-08 14:35:39.528719	default_method
49	1	23	1.00	68	2025-01-08 17:15:07.274784	6/141, Cherlopalli, hfdsfgdasds	cash_on_delivery	3a6830de-3540-4dcd-be0b-5ddb04e5b8a5	2025-01-08 17:15:07.274784	30	2025-01-08 17:15:07.461588	default_method
\.


                                                  3430.dat                                                                                            0000600 0004000 0002000 00000000005 14737554774 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3420.dat                                                                                            0000600 0004000 0002000 00000000232 14737554775 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	test2	test2	f	8142515279	\N	\N
1	test	test	f	8142515277	6/140, cherlopalli, rajampet	6/141, cherlopalli, rajampet
2	admin	admin	t	8142515278	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                      restore.sql                                                                                         0000600 0004000 0002000 00000036626 14737554775 0015431 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+2)
-- Dumped by pg_dump version 16.2

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

DROP DATABASE farmpsql;
--
-- Name: farmpsql; Type: DATABASE; Schema: -; Owner: farmpsql_user
--

CREATE DATABASE farmpsql WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF8';


ALTER DATABASE farmpsql OWNER TO farmpsql_user;

\connect farmpsql

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

--
-- Name: farmpsql; Type: DATABASE PROPERTIES; Schema: -; Owner: farmpsql_user
--

ALTER DATABASE farmpsql SET "TimeZone" TO 'utc';


\connect farmpsql

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: farmpsql_user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO farmpsql_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: address; Type: TABLE; Schema: public; Owner: farmpsql_user
--

CREATE TABLE public.address (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address text NOT NULL,
    address_type character varying(50),
    is_default boolean DEFAULT false
);


ALTER TABLE public.address OWNER TO farmpsql_user;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: farmpsql_user
--

CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.address_id_seq OWNER TO farmpsql_user;

--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: farmpsql_user
--

ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;


--
-- Name: basket; Type: TABLE; Schema: public; Owner: farmpsql_user
--

CREATE TABLE public.basket (
    id integer NOT NULL,
    user_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity numeric(10,2) NOT NULL,
    basket_id character varying(6) NOT NULL
);


ALTER TABLE public.basket OWNER TO farmpsql_user;

--
-- Name: basket_id_seq; Type: SEQUENCE; Schema: public; Owner: farmpsql_user
--

CREATE SEQUENCE public.basket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.basket_id_seq OWNER TO farmpsql_user;

--
-- Name: basket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: farmpsql_user
--

ALTER SEQUENCE public.basket_id_seq OWNED BY public.basket.id;


--
-- Name: item; Type: TABLE; Schema: public; Owner: farmpsql_user
--

CREATE TABLE public.item (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    price double precision NOT NULL,
    is_hidden boolean DEFAULT false,
    image_path character varying(255),
    file_size bytea,
    unit character varying(50) DEFAULT 'Kg'::character varying NOT NULL,
    CONSTRAINT item_image_path_check CHECK ((octet_length((image_path)::text) <= 51200)),
    CONSTRAINT item_image_path_check1 CHECK ((octet_length((image_path)::text) <= 102400))
);


ALTER TABLE public.item OWNER TO farmpsql_user;

--
-- Name: item_id_seq; Type: SEQUENCE; Schema: public; Owner: farmpsql_user
--

CREATE SEQUENCE public.item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.item_id_seq OWNER TO farmpsql_user;

--
-- Name: item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: farmpsql_user
--

ALTER SEQUENCE public.item_id_seq OWNED BY public.item.id;


--
-- Name: order; Type: TABLE; Schema: public; Owner: farmpsql_user
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity numeric(10,2) NOT NULL,
    total_price double precision NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    delivery_address character varying(255) NOT NULL,
    payment_method character varying(50) DEFAULT 'default_method'::character varying NOT NULL,
    order_id character varying(36) DEFAULT gen_random_uuid() NOT NULL,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    address_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    payment_option character varying(50) DEFAULT 'default_method'::character varying NOT NULL
);


ALTER TABLE public."order" OWNER TO farmpsql_user;

--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: farmpsql_user
--

CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_id_seq OWNER TO farmpsql_user;

--
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: farmpsql_user
--

ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;


--
-- Name: order_item; Type: TABLE; Schema: public; Owner: farmpsql_user
--

CREATE TABLE public.order_item (
    id integer NOT NULL,
    order_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric NOT NULL
);


ALTER TABLE public.order_item OWNER TO farmpsql_user;

--
-- Name: order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: farmpsql_user
--

CREATE SEQUENCE public.order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_item_id_seq OWNER TO farmpsql_user;

--
-- Name: order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: farmpsql_user
--

ALTER SEQUENCE public.order_item_id_seq OWNED BY public.order_item.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: farmpsql_user
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(80) NOT NULL,
    password character varying(255) NOT NULL,
    is_admin boolean,
    phone_number character varying(255),
    address character varying(255),
    alternate_address character varying(255)
);


ALTER TABLE public."user" OWNER TO farmpsql_user;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: farmpsql_user
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO farmpsql_user;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: farmpsql_user
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: address id; Type: DEFAULT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- Name: basket id; Type: DEFAULT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public.basket ALTER COLUMN id SET DEFAULT nextval('public.basket_id_seq'::regclass);


--
-- Name: item id; Type: DEFAULT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public.item ALTER COLUMN id SET DEFAULT nextval('public.item_id_seq'::regclass);


--
-- Name: order id; Type: DEFAULT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);


--
-- Name: order_item id; Type: DEFAULT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public.order_item ALTER COLUMN id SET DEFAULT nextval('public.order_item_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: farmpsql_user
--

COPY public.address (id, user_id, address, address_type, is_default) FROM stdin;
\.
COPY public.address (id, user_id, address, address_type, is_default) FROM '$$PATH$$/3428.dat';

--
-- Data for Name: basket; Type: TABLE DATA; Schema: public; Owner: farmpsql_user
--

COPY public.basket (id, user_id, item_id, quantity, basket_id) FROM stdin;
\.
COPY public.basket (id, user_id, item_id, quantity, basket_id) FROM '$$PATH$$/3426.dat';

--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: farmpsql_user
--

COPY public.item (id, name, price, is_hidden, image_path, file_size, unit) FROM stdin;
\.
COPY public.item (id, name, price, is_hidden, image_path, file_size, unit) FROM '$$PATH$$/3422.dat';

--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: farmpsql_user
--

COPY public."order" (id, user_id, item_id, quantity, total_price, date, delivery_address, payment_method, order_id, order_date, address_id, created_at, payment_option) FROM stdin;
\.
COPY public."order" (id, user_id, item_id, quantity, total_price, date, delivery_address, payment_method, order_id, order_date, address_id, created_at, payment_option) FROM '$$PATH$$/3424.dat';

--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: farmpsql_user
--

COPY public.order_item (id, order_id, item_id, quantity, price) FROM stdin;
\.
COPY public.order_item (id, order_id, item_id, quantity, price) FROM '$$PATH$$/3430.dat';

--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: farmpsql_user
--

COPY public."user" (id, username, password, is_admin, phone_number, address, alternate_address) FROM stdin;
\.
COPY public."user" (id, username, password, is_admin, phone_number, address, alternate_address) FROM '$$PATH$$/3420.dat';

--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmpsql_user
--

SELECT pg_catalog.setval('public.address_id_seq', 48, true);


--
-- Name: basket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmpsql_user
--

SELECT pg_catalog.setval('public.basket_id_seq', 211, true);


--
-- Name: item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmpsql_user
--

SELECT pg_catalog.setval('public.item_id_seq', 32, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmpsql_user
--

SELECT pg_catalog.setval('public.order_id_seq', 49, true);


--
-- Name: order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmpsql_user
--

SELECT pg_catalog.setval('public.order_item_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmpsql_user
--

SELECT pg_catalog.setval('public.user_id_seq', 10, true);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: basket basket_pkey; Type: CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_pkey PRIMARY KEY (id);


--
-- Name: item item_name_key; Type: CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_name_key UNIQUE (name);


--
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);


--
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);


--
-- Name: order order_order_id_key; Type: CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_order_id_key UNIQUE (order_id);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: address address_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: basket basket_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(id);


--
-- Name: basket basket_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: order fk_address; Type: FK CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT fk_address FOREIGN KEY (address_id) REFERENCES public.address(id) ON DELETE CASCADE;


--
-- Name: order fk_item; Type: FK CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT fk_item FOREIGN KEY (item_id) REFERENCES public.item(id) ON DELETE CASCADE;


--
-- Name: basket fk_item_in_basket; Type: FK CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public.basket
    ADD CONSTRAINT fk_item_in_basket FOREIGN KEY (item_id) REFERENCES public.item(id) ON DELETE CASCADE;


--
-- Name: order order_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(id);


--
-- Name: order_item order_item_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: order order_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES TO farmpsql_user;


--
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES TO farmpsql_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS TO farmpsql_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO farmpsql_user;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          