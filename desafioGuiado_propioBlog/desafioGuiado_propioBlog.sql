/*Crear base de datos llamada blog*/
CREATE DATABASE blog
    WITH
    OWNER = mariajosevillasante
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
\c blog /*para cambiarnos a esta base de datos*/
/*Crear tablas: usuarios, posts y comentarios*/
-- Table: public.usuarios

-- DROP TABLE IF EXISTS public.usuarios;

CREATE TABLE IF NOT EXISTS public.usuarios
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    email character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT usuarios_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.usuarios
    OWNER to mariajosevillasante;
-- Table: public.posts

-- DROP TABLE IF EXISTS public.posts;

CREATE TABLE IF NOT EXISTS public.posts
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    usuario_id integer NOT NULL,
    titulo character varying COLLATE pg_catalog."default" NOT NULL,
    fecha date NOT NULL,
    CONSTRAINT posts_pkey PRIMARY KEY (id),
    CONSTRAINT usuario_id FOREIGN KEY (usuario_id)
        REFERENCES public.usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.posts
    OWNER to mariajosevillasante;
-- Table: public.comentarios

-- DROP TABLE IF EXISTS public.comentarios;

CREATE TABLE IF NOT EXISTS public.comentarios
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    post_id integer NOT NULL,
    usuario_id integer NOT NULL,
    texto character varying COLLATE pg_catalog."default" NOT NULL,
    fecha date NOT NULL,
    CONSTRAINT comentarios_pkey PRIMARY KEY (id),
    CONSTRAINT post_id FOREIGN KEY (post_id)
        REFERENCES public.posts (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT usuario_id FOREIGN KEY (usuario_id)
        REFERENCES public.usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.comentarios
    OWNER to mariajosevillasante;

/*-paso 3 Insertar registros-*/
INSERT INTO public.usuarios(
	email)
	VALUES ('usuario01@hotmail.com');
INSERT INTO public.usuarios(
	email)
	VALUES ('usuario02@hotmail.com');
INSERT INTO public.usuarios(
	email)
	VALUES ('usuario03@hotmail.com');
INSERT INTO public.usuarios(
	email)
	VALUES ('usuario04@hotmail.com');
INSERT INTO public.usuarios(
	email)
	VALUES ('usuario05@hotmail.com');
INSERT INTO public.usuarios(
	email)
	VALUES ('usuario06@hotmail.com');
INSERT INTO public.usuarios(
	email)
	VALUES ('usuario07@hotmail.com');
INSERT INTO public.usuarios(
	email)
	VALUES ('usuario08@hotmail.com');
INSERT INTO public.usuarios(
	email)
	VALUES ('usuario09@hotmail.com');

INSERT INTO public.posts(
	usuario_id, titulo, fecha)
	VALUES (1, 'Post 1: Esto es malo', '2020-06-29');
INSERT INTO public.posts(
	usuario_id, titulo, fecha)
	VALUES (5, 'Post 2: Esto es malo', '2020-06-20');
INSERT INTO public.posts(
	usuario_id, titulo, fecha)
	VALUES (1, 'Post 3: Esto es excelente', '2020-05-30');
INSERT INTO public.posts(
	usuario_id, titulo, fecha)
	VALUES (9, 'Post 4: Esto es bueno', '2020-05-09');
INSERT INTO public.posts(
	usuario_id, titulo, fecha)
	VALUES (7, 'Post 5: Esto es bueno', '2020-07-10');
INSERT INTO public.posts(
	usuario_id, titulo, fecha)
	VALUES (5, 'Post 6: Esto es excelente', '2020-07-18');
INSERT INTO public.posts(
	usuario_id, titulo, fecha)
	VALUES (8, 'Post 7: Esto es excelente', '2020-07-07');
INSERT INTO public.posts(
	usuario_id, titulo, fecha)
	VALUES (5, 'Post 8: Esto es excelente', '2020-05-14');
INSERT INTO public.posts(
	usuario_id, titulo, fecha)
	VALUES (2, 'Post 9: Esto es bueno', '2020-05-08');
INSERT INTO public.posts(
	usuario_id, titulo, fecha)
	VALUES (6, 'Post 10: Esto es bueno', '2020-06-02');
INSERT INTO public.posts(
	usuario_id, titulo, fecha)
	VALUES (4, 'Post 11: Esto es bueno', '2020-05-05');
INSERT INTO public.posts(
	usuario_id, titulo, fecha)
	VALUES (9, 'Post 12: Esto es malo', '2020-07-23');
INSERT INTO public.posts(
	usuario_id, titulo, fecha)
	VALUES (5, 'Post 13: Esto es excelente', '2020-05-30');
INSERT INTO public.posts(
	usuario_id, titulo, fecha)
	VALUES (8, 'Post 14: Esto es excelente', '2020-05-01');
INSERT INTO public.posts(
	usuario_id, titulo, fecha)
	VALUES (7, 'Post 15: Esto es malo', '2020-06-17');


INSERT INTO public.comentarios(
	post_id, usuario_id, texto, fecha)
	VALUES (6, 3, 'Este es el comentario 1', '2020-07-08');
INSERT INTO public.comentarios(
	post_id, usuario_id, texto, fecha)
	VALUES (2, 4, 'Este es el comentario 2', '2020-06-07');
INSERT INTO public.comentarios(
	post_id, usuario_id, texto, fecha)
	VALUES (4, 6, 'Este es el comentario 3', '2020-06-16');
INSERT INTO public.comentarios(
	post_id, usuario_id, texto, fecha)
	VALUES (13, 2, 'Este es el comentario 4', '2020-06-15');
INSERT INTO public.comentarios(
	post_id, usuario_id, texto, fecha)
	VALUES (6, 6, 'Este es el comentario 5', '2020-05-14');
INSERT INTO public.comentarios(
	post_id, usuario_id, texto, fecha)
	VALUES (3, 3, 'Este es el comentario 6', '2020-07-08');
INSERT INTO public.comentarios(
	post_id, usuario_id, texto, fecha)
	VALUES (7, 1, 'Este es el comentario 7', '2020-05-22');
UPDATE public.comentarios
	SET post_id=1, usuario_id=6
	WHERE id=7;
INSERT INTO public.comentarios(
	post_id, usuario_id, texto, fecha)
	VALUES (7, 6, 'Este es el comentario 8', '2020-07-09');
INSERT INTO public.comentarios(
	post_id, usuario_id, texto, fecha)
	VALUES (13, 8, 'Este es el comentario 9', '2020-06-30');
INSERT INTO public.comentarios(
	post_id, usuario_id, texto, fecha)
	VALUES (6, 8, 'Este es el comentario 10', '2020-06-19');
INSERT INTO public.comentarios(
	post_id, usuario_id, texto, fecha)
	VALUES (1, 5, 'Este es el comentario 11', '2020-05-09');
INSERT INTO public.comentarios(
	post_id, usuario_id, texto, fecha)
	VALUES (15, 8, 'Este es el comentario 12', '2020-06-17');
INSERT INTO public.comentarios(
	post_id, usuario_id, texto, fecha)
	VALUES (9, 1, 'Este es el comentario 13', '2020-05-01');
INSERT INTO public.comentarios(
	post_id, usuario_id, texto, fecha)
	VALUES (5, 2, 'Este es el comentario 14', '2020-05-31');
INSERT INTO public.comentarios(
	post_id, usuario_id, texto, fecha)
	VALUES (3, 4, 'Este es el comentario 15', '2020-06-28');

-- Seleccionar el correo, id y título de todos los post publicados por el usuario 5.
SELECT posts.id, posts.titulo 
FROM public.posts
JOIN public.usuarios ON posts.usuario_id=usuarios.id 
WHERE usuarios.id = '5';
-- 2	"Post 2: Esto es malo"
-- 6	"Post 6: Esto es excelente"
-- 8	"Post 8: Esto es excelente"
-- 13	"Post 13: Esto es excelente"
SELECT usuarios.email 
FROM public.usuarios
WHERE usuarios.id = '5';
-- "usuario05@gmail.com"

-- Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados
-- por el usuario con email usuario06@hotmail.com.


-- Listar los usuarios que no han publicado ningún post.


-- Listar todos los post con sus comentarios (incluyendo aquellos que no poseen comentarios).



-- Listar todos los usuarios que hayan publicado un post en Junio.

