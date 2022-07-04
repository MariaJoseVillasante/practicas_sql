-- 1-Crear una base de datos llamada "agencia_autos”.
CREATE DATABASE agencia_autos;
-- 2-Conectarse a la base de datos agencia_autos.
\c agencia_autos
-- crear tabla autos 
-- Table: public.autos

-- DROP TABLE IF EXISTS public.autos;

CREATE TABLE IF NOT EXISTS public.autos
(
    id bigint NOT NULL,
    marca text COLLATE pg_catalog."default" NOT NULL,
    modelo text COLLATE pg_catalog."default" NOT NULL,
    year integer NOT NULL,
    color character varying(20)[] COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT autos_pkey PRIMARY KEY (id)
)

-- crear table ventas
CREATE TABLE IF NOT EXISTS public.ventas
(
    id bigint NOT NULL,
    fecha date NOT NULL,
    cliente text COLLATE pg_catalog."default" NOT NULL,
    referencia text COLLATE pg_catalog."default",
    cantidad integer NOT NULL,
    id_auto bigint NOT NULL,
    CONSTRAINT ventas_pkey PRIMARY KEY (id),
    CONSTRAINT autos FOREIGN KEY (id_auto)
        REFERENCES public.autos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
