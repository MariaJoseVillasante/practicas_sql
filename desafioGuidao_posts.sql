/*-paso 1 -*/ 
CREATE DATABASE posts;
/*-paso 2 -*/
CREATE TABLE post(id SERIAL, usuario VARCHAR(20),fecha_creacion DATE, contenido VARCHAR, descripcion VARCHAR(255),PRIMARY KEY (id));
/*-paso 3 -*/
INSERT INTO post (usuario, fecha_creacion, contenido, descripcion)
VALUES ('Pamela','07-13-2019' ,'Revisaremos el contenido que se verá en
este curso, comenzando por ..','Introducción a las bases de datos');
INSERT INTO post (usuario, fecha_creacion, contenido, descripcion)
VALUES ('Pamela','07-14-2019' ,'En esta oportunidad, empezaremos con la
creación ....','Creando una tabla');
INSERT INTO post (usuario, fecha_creacion, contenido, descripcion)
VALUES ('Carlos','07-15-2019' ,'En latinoamérica hay un déficit de
programadores ....','Empezando a programar');
/*-paso 4 -*/
ALTER TABLE post ADD titulo VARCHAR(20);
/*-paso 5 -*/
UPDATE post SET titulo ='Unidad 1' WHERE id = 1;
UPDATE post SET titulo ='Unidad 2' WHERE id = 2;
UPDATE post SET titulo ='Programación?' WHERE id = 3;
/*-paso 6 -*/
[13:26] Roberto Hernandez
INSERT INTO post (usuario, fecha_creacion, contenido, descripcion,
titulo)
VALUES ('Pedro','07-14-2019' ,'Los pasos para armar ...','Tips al
momento de armar el curriculum ', 'Armando curriculum');
INSERT INTO post (usuario, fecha_creacion, contenido, descripcion,
titulo)
VALUES ('Pedro','07-14-2019' ,'Hoy en día, ...','Problemas al momento de
buscar trabajo', 'Mi primer trabajo');
/*-paso 7-*/
DELETE FROM post WHERE usuario='Carlos';
/*-paso 8-*/
INSERT INTO post (usuario, fecha_creacion, contenido, descripcion,
titulo) VALUES ('Carlos','07-14-2019' ,'En esta nueva unidad
...','Alterando una tabla', 'ALTER TABLE');

/*-----------Parte2----------------------*/
/*-paso 1-*/
CREATE TABLE comentario(
id_comentario SERIAL,id_post INT,fecha_creacion TIMESTAMP,contenido VARCHAR (255),FOREIGN KEY (id_post) REFERENCES post (id));
/*-paso 2-*/
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (6,
'07-19-2019 15:16:19', 'Muy buen contenido!');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (6,
'07-19-2019 16:16:19', 'Gracias');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (3,
'07-19-2019 12:19:49', 'exelente');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (3,
'07-20-2019 16:20:15', 'maravilloso');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (3,
'07-21-2019 17:40:12', 'me perdí en el 3er punto');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (3,
'07-21-2019 19:26:56', 'gracias!');
/*-paso 3-*/
INSERT INTO post (usuario, fecha_creacion, contenido, descripcion,
titulo) VALUES ('Margarita','07-23-2019' ,'para comenzar ...','Taller de
bases de datos', 'SQL');
/*-paso 4-*/
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (7,
'07-22-2019 13:26:56', 'gracias!');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (7,
'07-22-2019 14:38:12', 'gracias!');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (7,
'07-22-2019 15:26:56', 'muchas gracias por tu aporte');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (7,
'07-23-2019 13:42:42', 'Entendí todo');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (7,
'07-24-2019 03:15:34', 'gracias!');


