PGDMP                       }            reservas    16.8    16.8 F    w           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            x           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            z           1262    16399    reservas    DATABASE     n   CREATE DATABASE reservas WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'pt-BR';
    DROP DATABASE reservas;
                reservas    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            {           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16434    cache    TABLE     �   CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);
    DROP TABLE public.cache;
       public         heap    reservas    false    4            �            1259    16441    cache_locks    TABLE     �   CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);
    DROP TABLE public.cache_locks;
       public         heap    reservas    false    4            �            1259    16466    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    reservas    false    4            �            1259    16465    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          reservas    false    227    4            |           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          reservas    false    226            �            1259    16458    job_batches    TABLE     d  CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);
    DROP TABLE public.job_batches;
       public         heap    reservas    false    4            �            1259    16449    jobs    TABLE     �   CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);
    DROP TABLE public.jobs;
       public         heap    reservas    false    4            �            1259    16448    jobs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.jobs_id_seq;
       public          reservas    false    4    224            }           0    0    jobs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;
          public          reservas    false    223            �            1259    16401 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    reservas    false    4            �            1259    16400    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          reservas    false    216    4            ~           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          reservas    false    215            �            1259    16418    password_reset_tokens    TABLE     �   CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);
 )   DROP TABLE public.password_reset_tokens;
       public         heap    reservas    false    4            �            1259    16489    personal_access_tokens    TABLE     �  CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.personal_access_tokens;
       public         heap    reservas    false    4            �            1259    16488    personal_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public          reservas    false    4    231                       0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          reservas    false    230            �            1259    16478    reservas    TABLE     �  CREATE TABLE public.reservas (
    id bigint NOT NULL,
    mesa_numero integer NOT NULL,
    cadeira_numero integer NOT NULL,
    nome character varying(255) NOT NULL,
    telefone character varying(255) NOT NULL,
    valor_pago numeric(8,2) NOT NULL,
    socio boolean DEFAULT false NOT NULL,
    data_aniversario date NOT NULL,
    checkin boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.reservas;
       public         heap    reservas    false    4            �            1259    16477    reservas_id_seq    SEQUENCE     x   CREATE SEQUENCE public.reservas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.reservas_id_seq;
       public          reservas    false    229    4            �           0    0    reservas_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.reservas_id_seq OWNED BY public.reservas.id;
          public          reservas    false    228            �            1259    16425    sessions    TABLE     �   CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);
    DROP TABLE public.sessions;
       public         heap    reservas    false    4            �            1259    16408    users    TABLE     x  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap    reservas    false    4            �            1259    16407    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          reservas    false    4    218            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          reservas    false    217            �           2604    16469    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          reservas    false    226    227    227            �           2604    16452    jobs id    DEFAULT     b   ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);
 6   ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
       public          reservas    false    223    224    224            �           2604    16404    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          reservas    false    216    215    216            �           2604    16492    personal_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          reservas    false    231    230    231            �           2604    16481    reservas id    DEFAULT     j   ALTER TABLE ONLY public.reservas ALTER COLUMN id SET DEFAULT nextval('public.reservas_id_seq'::regclass);
 :   ALTER TABLE public.reservas ALTER COLUMN id DROP DEFAULT;
       public          reservas    false    229    228    229            �           2604    16411    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          reservas    false    218    217    218            j          0    16434    cache 
   TABLE DATA           7   COPY public.cache (key, value, expiration) FROM stdin;
    public          reservas    false    221   qR       k          0    16441    cache_locks 
   TABLE DATA           =   COPY public.cache_locks (key, owner, expiration) FROM stdin;
    public          reservas    false    222   �R       p          0    16466    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          reservas    false    227   �R       n          0    16458    job_batches 
   TABLE DATA           �   COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
    public          reservas    false    225   �R       m          0    16449    jobs 
   TABLE DATA           c   COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
    public          reservas    false    224   �R       e          0    16401 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          reservas    false    216   S       h          0    16418    password_reset_tokens 
   TABLE DATA           I   COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
    public          reservas    false    219   �S       t          0    16489    personal_access_tokens 
   TABLE DATA           �   COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
    public          reservas    false    231   �S       r          0    16478    reservas 
   TABLE DATA           �   COPY public.reservas (id, mesa_numero, cadeira_numero, nome, telefone, valor_pago, socio, data_aniversario, checkin, created_at, updated_at) FROM stdin;
    public          reservas    false    229   �S       i          0    16425    sessions 
   TABLE DATA           _   COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
    public          reservas    false    220   �S       g          0    16408    users 
   TABLE DATA           u   COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
    public          reservas    false    218   �U       �           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          reservas    false    226            �           0    0    jobs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);
          public          reservas    false    223            �           0    0    migrations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.migrations_id_seq', 5, true);
          public          reservas    false    215            �           0    0    personal_access_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);
          public          reservas    false    230            �           0    0    reservas_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.reservas_id_seq', 6, true);
          public          reservas    false    228            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          reservas    false    217            �           2606    16447    cache_locks cache_locks_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);
 F   ALTER TABLE ONLY public.cache_locks DROP CONSTRAINT cache_locks_pkey;
       public            reservas    false    222            �           2606    16440    cache cache_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);
 :   ALTER TABLE ONLY public.cache DROP CONSTRAINT cache_pkey;
       public            reservas    false    221            �           2606    16474    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            reservas    false    227            �           2606    16476 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            reservas    false    227            �           2606    16464    job_batches job_batches_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.job_batches DROP CONSTRAINT job_batches_pkey;
       public            reservas    false    225            �           2606    16456    jobs jobs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            reservas    false    224            �           2606    16406    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            reservas    false    216            �           2606    16424 0   password_reset_tokens password_reset_tokens_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);
 Z   ALTER TABLE ONLY public.password_reset_tokens DROP CONSTRAINT password_reset_tokens_pkey;
       public            reservas    false    219            �           2606    16496 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public            reservas    false    231            �           2606    16499 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public            reservas    false    231            �           2606    16487    reservas reservas_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.reservas DROP CONSTRAINT reservas_pkey;
       public            reservas    false    229            �           2606    16431    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            reservas    false    220            �           2606    16417    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            reservas    false    218            �           2606    16415    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            reservas    false    218            �           1259    16457    jobs_queue_index    INDEX     B   CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);
 $   DROP INDEX public.jobs_queue_index;
       public            reservas    false    224            �           1259    16497 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     �   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            reservas    false    231    231            �           1259    16433    sessions_last_activity_index    INDEX     Z   CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);
 0   DROP INDEX public.sessions_last_activity_index;
       public            reservas    false    220            �           1259    16432    sessions_user_id_index    INDEX     N   CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);
 *   DROP INDEX public.sessions_user_id_index;
       public            reservas    false    220            j      x������ � �      k      x������ � �      p      x������ � �      n      x������ � �      m      x������ � �      e   x   x�e��
�0���aF�p�"���J�>��XW�!��9	 @��gH��tͅ�V5h�b��2��t.i��8p� ����ZO_�m����7��'��+���I/�zr|Xk��:D�      h      x������ � �      t      x������ � �      r      x������ � �      i   �  x�Ց�n�0���^���$v@�,JH(N�� Q7�-N�%�O_w�Ѽ��;:���cW��ƹ���������kUGHoi�t�输�]F�W��4s ՠ�%"�;~J��\�����x1��iD���~b��<�،. ��̳����x��l�t��~�Gg��2K��j���w�J�8G�a�]E�3�5��5ϪNX@#]���.�)D�p�E�_�
��4QU���m4kJ���_䉽i%n�rO�ʚ/M*%U�=�Z̈�ޔ����:Z$tj�KŽ�IK����)q����rػ�S\�^���/kk]��&�!����X�w�T[�q����2�2���+�GD�{���_At�nǳ5O�6��J��߷�S_^�)Y`�Y�B��ȴ�h�h�8~$%�}��U����066��6���"P�����O_�      g      x������ � �     