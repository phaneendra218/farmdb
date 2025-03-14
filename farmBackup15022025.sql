toc.dat                                                                                             0000600 0004000 0002000 00000047525 14753714572 0014473 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   &    :                 }         	   farm_8sfr    16.6 (Debian 16.6-1.pgdg120+1)    16.2 A    p           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         q           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         r           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         s           1262    16389 	   farm_8sfr    DATABASE     t   CREATE DATABASE farm_8sfr WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF8';
    DROP DATABASE farm_8sfr;
                farmpsql_user    false         t           0    0 	   farm_8sfr    DATABASE PROPERTIES     2   ALTER DATABASE farm_8sfr SET "TimeZone" TO 'utc';
                     farmpsql_user    false                     2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                farmpsql_user    false         �            1259    16399    address    TABLE     �  CREATE TABLE public.address (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address text NOT NULL,
    address_type character varying(50),
    is_default boolean DEFAULT false,
    pincode character varying(10) NOT NULL,
    d_phone_number character varying(15),
    d_name character varying(80) DEFAULT 'Unknown'::character varying NOT NULL,
    alt_d_phone_number character varying(15),
    town character varying(100) DEFAULT 'Unknown'::character varying NOT NULL,
    city character varying(100) DEFAULT 'Unknown'::character varying NOT NULL,
    state character varying(100) DEFAULT 'Unknown'::character varying NOT NULL,
    landmark character varying(255)
);
    DROP TABLE public.address;
       public         heap    farmpsql_user    false    5         �            1259    16405    address_id_seq    SEQUENCE     �   CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.address_id_seq;
       public          farmpsql_user    false    5    215         u           0    0    address_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;
          public          farmpsql_user    false    216         �            1259    16406    basket    TABLE     �   CREATE TABLE public.basket (
    id integer NOT NULL,
    user_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity numeric(10,2) NOT NULL,
    basket_id character varying(8) NOT NULL
);
    DROP TABLE public.basket;
       public         heap    farmpsql_user    false    5         �            1259    16409    basket_id_seq    SEQUENCE     �   CREATE SEQUENCE public.basket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.basket_id_seq;
       public          farmpsql_user    false    217    5         v           0    0    basket_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.basket_id_seq OWNED BY public.basket.id;
          public          farmpsql_user    false    218         �            1259    16410    item    TABLE     �  CREATE TABLE public.item (
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
       public         heap    farmpsql_user    false    5         �            1259    16419    item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.item_id_seq;
       public          farmpsql_user    false    219    5         w           0    0    item_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.item_id_seq OWNED BY public.item.id;
          public          farmpsql_user    false    220         �            1259    16420    order    TABLE       CREATE TABLE public."order" (
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
    payment_option character varying(50) DEFAULT 'default_method'::character varying NOT NULL,
    item_price numeric(10,2) NOT NULL,
    b_order_id character varying(12) NOT NULL,
    total_b_value numeric(10,2) NOT NULL
);
    DROP TABLE public."order";
       public         heap    farmpsql_user    false    5         �            1259    16429    order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.order_id_seq;
       public          farmpsql_user    false    221    5         x           0    0    order_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.order_id_seq OWNED BY public."order".id;
          public          farmpsql_user    false    222         �            1259    16430 
   order_item    TABLE     �   CREATE TABLE public.order_item (
    id integer NOT NULL,
    order_id integer NOT NULL,
    item_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric NOT NULL
);
    DROP TABLE public.order_item;
       public         heap    farmpsql_user    false    5         �            1259    16435    order_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.order_item_id_seq;
       public          farmpsql_user    false    223    5         y           0    0    order_item_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.order_item_id_seq OWNED BY public.order_item.id;
          public          farmpsql_user    false    224         �            1259    16436    user    TABLE     �  CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(80) NOT NULL,
    password character varying(255) NOT NULL,
    is_admin boolean,
    phone_number character varying(255),
    address character varying(255),
    alternate_address character varying(255),
    u_display_name character varying(80) DEFAULT 'User'::character varying NOT NULL,
    mail_id character varying(120)
);
    DROP TABLE public."user";
       public         heap    farmpsql_user    false    5         �            1259    16442    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          farmpsql_user    false    225    5         z           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          farmpsql_user    false    226         �           2604    16443 
   address id    DEFAULT     h   ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);
 9   ALTER TABLE public.address ALTER COLUMN id DROP DEFAULT;
       public          farmpsql_user    false    216    215         �           2604    16444 	   basket id    DEFAULT     f   ALTER TABLE ONLY public.basket ALTER COLUMN id SET DEFAULT nextval('public.basket_id_seq'::regclass);
 8   ALTER TABLE public.basket ALTER COLUMN id DROP DEFAULT;
       public          farmpsql_user    false    218    217         �           2604    16445    item id    DEFAULT     b   ALTER TABLE ONLY public.item ALTER COLUMN id SET DEFAULT nextval('public.item_id_seq'::regclass);
 6   ALTER TABLE public.item ALTER COLUMN id DROP DEFAULT;
       public          farmpsql_user    false    220    219         �           2604    16446    order id    DEFAULT     f   ALTER TABLE ONLY public."order" ALTER COLUMN id SET DEFAULT nextval('public.order_id_seq'::regclass);
 9   ALTER TABLE public."order" ALTER COLUMN id DROP DEFAULT;
       public          farmpsql_user    false    222    221         �           2604    16447    order_item id    DEFAULT     n   ALTER TABLE ONLY public.order_item ALTER COLUMN id SET DEFAULT nextval('public.order_item_id_seq'::regclass);
 <   ALTER TABLE public.order_item ALTER COLUMN id DROP DEFAULT;
       public          farmpsql_user    false    224    223         �           2604    16448    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          farmpsql_user    false    226    225         b          0    16399    address 
   TABLE DATA           �   COPY public.address (id, user_id, address, address_type, is_default, pincode, d_phone_number, d_name, alt_d_phone_number, town, city, state, landmark) FROM stdin;
    public          farmpsql_user    false    215       3426.dat d          0    16406    basket 
   TABLE DATA           K   COPY public.basket (id, user_id, item_id, quantity, basket_id) FROM stdin;
    public          farmpsql_user    false    217       3428.dat f          0    16410    item 
   TABLE DATA           W   COPY public.item (id, name, price, is_hidden, image_path, file_size, unit) FROM stdin;
    public          farmpsql_user    false    219       3430.dat h          0    16420    order 
   TABLE DATA           �   COPY public."order" (id, user_id, item_id, quantity, total_price, date, delivery_address, payment_method, order_id, order_date, address_id, created_at, payment_option, item_price, b_order_id, total_b_value) FROM stdin;
    public          farmpsql_user    false    221       3432.dat j          0    16430 
   order_item 
   TABLE DATA           L   COPY public.order_item (id, order_id, item_id, quantity, price) FROM stdin;
    public          farmpsql_user    false    223       3434.dat l          0    16436    user 
   TABLE DATA           �   COPY public."user" (id, username, password, is_admin, phone_number, address, alternate_address, u_display_name, mail_id) FROM stdin;
    public          farmpsql_user    false    225       3436.dat {           0    0    address_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.address_id_seq', 51, true);
          public          farmpsql_user    false    216         |           0    0    basket_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.basket_id_seq', 309, true);
          public          farmpsql_user    false    218         }           0    0    item_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.item_id_seq', 33, true);
          public          farmpsql_user    false    220         ~           0    0    order_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.order_id_seq', 102, true);
          public          farmpsql_user    false    222                    0    0    order_item_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.order_item_id_seq', 1, false);
          public          farmpsql_user    false    224         �           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 13, true);
          public          farmpsql_user    false    226         �           2606    16450    address address_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT address_pkey;
       public            farmpsql_user    false    215         �           2606    16452    basket basket_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.basket DROP CONSTRAINT basket_pkey;
       public            farmpsql_user    false    217         �           2606    16454    item item_name_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_name_key UNIQUE (name);
 <   ALTER TABLE ONLY public.item DROP CONSTRAINT item_name_key;
       public            farmpsql_user    false    219         �           2606    16456    item item_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.item DROP CONSTRAINT item_pkey;
       public            farmpsql_user    false    219         �           2606    16458    order_item order_item_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.order_item DROP CONSTRAINT order_item_pkey;
       public            farmpsql_user    false    223         �           2606    16460    order order_order_id_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_order_id_key UNIQUE (order_id);
 D   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_order_id_key;
       public            farmpsql_user    false    221         �           2606    16462    order order_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_pkey;
       public            farmpsql_user    false    221         �           2606    16464    user user_mail_id_key 
   CONSTRAINT     U   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_mail_id_key UNIQUE (mail_id);
 A   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_mail_id_key;
       public            farmpsql_user    false    225         �           2606    16466    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            farmpsql_user    false    225         �           2606    16468    user user_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_username_key;
       public            farmpsql_user    false    225         �           2606    16469    address address_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.address DROP CONSTRAINT address_user_id_fkey;
       public          farmpsql_user    false    225    215    3271         �           2606    16474    basket basket_item_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(id);
 D   ALTER TABLE ONLY public.basket DROP CONSTRAINT basket_item_id_fkey;
       public          farmpsql_user    false    217    219    3261         �           2606    16479    basket basket_user_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 D   ALTER TABLE ONLY public.basket DROP CONSTRAINT basket_user_id_fkey;
       public          farmpsql_user    false    217    225    3271         �           2606    16484    order fk_address    FK CONSTRAINT     �   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT fk_address FOREIGN KEY (address_id) REFERENCES public.address(id) ON DELETE CASCADE;
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT fk_address;
       public          farmpsql_user    false    215    3255    221         �           2606    16489    order fk_item    FK CONSTRAINT        ALTER TABLE ONLY public."order"
    ADD CONSTRAINT fk_item FOREIGN KEY (item_id) REFERENCES public.item(id) ON DELETE CASCADE;
 9   ALTER TABLE ONLY public."order" DROP CONSTRAINT fk_item;
       public          farmpsql_user    false    219    3261    221         �           2606    16494    basket fk_item_in_basket    FK CONSTRAINT     �   ALTER TABLE ONLY public.basket
    ADD CONSTRAINT fk_item_in_basket FOREIGN KEY (item_id) REFERENCES public.item(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.basket DROP CONSTRAINT fk_item_in_basket;
       public          farmpsql_user    false    217    219    3261         �           2606    16499    order order_item_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.item(id);
 D   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_item_id_fkey;
       public          farmpsql_user    false    219    221    3261         �           2606    16504 #   order_item order_item_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(id);
 M   ALTER TABLE ONLY public.order_item DROP CONSTRAINT order_item_order_id_fkey;
       public          farmpsql_user    false    3265    223    221         �           2606    16509    order order_user_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 D   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_user_id_fkey;
       public          farmpsql_user    false    225    221    3271                    826    16391     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     T   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES TO farmpsql_user;
                   postgres    false                    826    16393    DEFAULT PRIVILEGES FOR TYPES    DEFAULT ACL     P   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES TO farmpsql_user;
                   postgres    false                    826    16392     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     T   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS TO farmpsql_user;
                   postgres    false                    826    16390    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     Q   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO farmpsql_user;
                   postgres    false                                                                                                                                                                                   3426.dat                                                                                            0000600 0004000 0002000 00000000355 14753714572 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        49	1	6/140, H Cherlopalli	Home	t	516115	2356268685	Phaneendra raju		Rajampet	Kadapaa	Andhra Pradesh	Near Ramalayam Temples
50	1	33, Kodambakkam, Chennai	Office	f	516112	6466464767	Unknown	8142512555	kodambakkam	Chennai	Unknown	None
\.


                                                                                                                                                                                                                                                                                   3428.dat                                                                                            0000600 0004000 0002000 00000000005 14753714573 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3430.dat                                                                                            0000600 0004000 0002000 00000000630 14753714573 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Banana	20	f	static/uploads/Banana.png	\N	Dozen
2	Custard Apple	89	f	static/uploads/CApple.png	\N	Kg
3	Guava	49	f	static/uploads/Guava.png	\N	Kg
4	Jamun	68	f	static/uploads/Jamun.png	\N	Bag
5	Mango	45	t	static/uploads/Mango.png	\N	Piece
6	Pomegranate	198	f	static/uploads/Pomegranate.png	\N	Kg
7	Mosambi (Battai)	35	f	static/uploads/Mosambi.png	\N	Kg
8	Coconut	30	f	static/uploads/Coconut.png	\N	Piece
\.


                                                                                                        3432.dat                                                                                            0000600 0004000 0002000 00000000005 14753714573 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3434.dat                                                                                            0000600 0004000 0002000 00000000005 14753714573 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3436.dat                                                                                            0000600 0004000 0002000 00000000322 14753714573 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	test	test	f	8142515277	6/140, cherlopalli, rajampet	6/141, cherlopalli, rajampet	Phaneendra Raju	rajuraju218@gmail.com
2	admin	admin	t	8142515278	\N	\N	Admin	\N
11	test1	test1	f	8142515276	\N	\N	User	\N
\.


                                                                                                                                                                                                                                                                                                              restore.sql                                                                                         0000600 0004000 0002000 00000041130 14753714573 0015403 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Debian 16.6-1.pgdg120+1)
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

DROP DATABASE farm_8sfr;
--
-- Name: farm_8sfr; Type: DATABASE; Schema: -; Owner: farmpsql_user
--

CREATE DATABASE farm_8sfr WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF8';


ALTER DATABASE farm_8sfr OWNER TO farmpsql_user;

\connect farm_8sfr

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
-- Name: farm_8sfr; Type: DATABASE PROPERTIES; Schema: -; Owner: farmpsql_user
--

ALTER DATABASE farm_8sfr SET "TimeZone" TO 'utc';


\connect farm_8sfr

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
    is_default boolean DEFAULT false,
    pincode character varying(10) NOT NULL,
    d_phone_number character varying(15),
    d_name character varying(80) DEFAULT 'Unknown'::character varying NOT NULL,
    alt_d_phone_number character varying(15),
    town character varying(100) DEFAULT 'Unknown'::character varying NOT NULL,
    city character varying(100) DEFAULT 'Unknown'::character varying NOT NULL,
    state character varying(100) DEFAULT 'Unknown'::character varying NOT NULL,
    landmark character varying(255)
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
    basket_id character varying(8) NOT NULL
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
    payment_option character varying(50) DEFAULT 'default_method'::character varying NOT NULL,
    item_price numeric(10,2) NOT NULL,
    b_order_id character varying(12) NOT NULL,
    total_b_value numeric(10,2) NOT NULL
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
    alternate_address character varying(255),
    u_display_name character varying(80) DEFAULT 'User'::character varying NOT NULL,
    mail_id character varying(120)
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

COPY public.address (id, user_id, address, address_type, is_default, pincode, d_phone_number, d_name, alt_d_phone_number, town, city, state, landmark) FROM stdin;
\.
COPY public.address (id, user_id, address, address_type, is_default, pincode, d_phone_number, d_name, alt_d_phone_number, town, city, state, landmark) FROM '$$PATH$$/3426.dat';

--
-- Data for Name: basket; Type: TABLE DATA; Schema: public; Owner: farmpsql_user
--

COPY public.basket (id, user_id, item_id, quantity, basket_id) FROM stdin;
\.
COPY public.basket (id, user_id, item_id, quantity, basket_id) FROM '$$PATH$$/3428.dat';

--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: farmpsql_user
--

COPY public.item (id, name, price, is_hidden, image_path, file_size, unit) FROM stdin;
\.
COPY public.item (id, name, price, is_hidden, image_path, file_size, unit) FROM '$$PATH$$/3430.dat';

--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: farmpsql_user
--

COPY public."order" (id, user_id, item_id, quantity, total_price, date, delivery_address, payment_method, order_id, order_date, address_id, created_at, payment_option, item_price, b_order_id, total_b_value) FROM stdin;
\.
COPY public."order" (id, user_id, item_id, quantity, total_price, date, delivery_address, payment_method, order_id, order_date, address_id, created_at, payment_option, item_price, b_order_id, total_b_value) FROM '$$PATH$$/3432.dat';

--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: farmpsql_user
--

COPY public.order_item (id, order_id, item_id, quantity, price) FROM stdin;
\.
COPY public.order_item (id, order_id, item_id, quantity, price) FROM '$$PATH$$/3434.dat';

--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: farmpsql_user
--

COPY public."user" (id, username, password, is_admin, phone_number, address, alternate_address, u_display_name, mail_id) FROM stdin;
\.
COPY public."user" (id, username, password, is_admin, phone_number, address, alternate_address, u_display_name, mail_id) FROM '$$PATH$$/3436.dat';

--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmpsql_user
--

SELECT pg_catalog.setval('public.address_id_seq', 51, true);


--
-- Name: basket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmpsql_user
--

SELECT pg_catalog.setval('public.basket_id_seq', 309, true);


--
-- Name: item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmpsql_user
--

SELECT pg_catalog.setval('public.item_id_seq', 33, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmpsql_user
--

SELECT pg_catalog.setval('public.order_id_seq', 102, true);


--
-- Name: order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmpsql_user
--

SELECT pg_catalog.setval('public.order_item_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: farmpsql_user
--

SELECT pg_catalog.setval('public.user_id_seq', 13, true);


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
-- Name: user user_mail_id_key; Type: CONSTRAINT; Schema: public; Owner: farmpsql_user
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_mail_id_key UNIQUE (mail_id);


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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        