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
-- importar tabla autos
\copy autos FROM '/Users/mariajosevillasante/Documents/EmprendimientoDigital/M7-Introduccion_a_bases_de_datos/1-Basesdedatosrelacionales/dia2/ApoyoLectura-Basededatosrelacionales/autos.csv' csv header;

-- 6- hacer cosulta con alias
SELECT marca, modelo as "tipo", year as "año", color
	FROM public.autos;

-- hacer 2 inserciones en la tabla ventas 
INSERT INTO public.ventas(
	id, fecha, cliente, referencia, cantidad, id_auto)
	VALUES (1, '2022-01-05', 'Cesar Osses', 'Compañero de trabajo', 2, 1);
INSERT INTO public.ventas(
	id, fecha, cliente, referencia, cantidad, id_auto)
	VALUES (2, '2022-01-27', 'Miguel Angel', 'Amigo', 2, 3);

-- realizar una suma
SELECT SUM(cantidad) as "autos vendidos" from ventas

-- agregar una columna en una tabla 
-- ALTER TABLE table_name
-- ADD column_name datatype;
ALTER TABLE autos
ADD estado text;

-- insertar nuevo auto
INSERT INTO public.autos(
	id, marca, modelo, year, color, estado)
	VALUES (5, 'mazda', 'cx5', 2022, 'grafito', 'nuevo')

-- Actualizar info
UPDATE public.autos
	SET marca='CHEVROLET', modelo='AVEO' 
	WHERE ID=2;

-- agrupar y contar por marca
SELECT count(marca), marca
	FROM public.autos
    group by marca;

