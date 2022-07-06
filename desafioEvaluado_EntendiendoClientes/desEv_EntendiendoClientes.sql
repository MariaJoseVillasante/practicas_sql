psql -U mariajosevillasante -d unidad2
\set AUTOCOMMIT off
\echo :AUTOCOMMIT
-- 1. Cargar el respaldo de la base de datos unidad2.sql.
\q
psql -U mariajosevillasante -d unidad2 -f /Users/mariajosevillasante/Desktop/unidad2.sql

-- 2. El cliente usuario01 ha realizado la siguiente compra:
-- ● producto: producto9.
-- ● cantidad: 5.
-- ● fecha: fecha del sistema.
-- Mediante el uso de transacciones, realiza las consultas correspondientes para este requerimiento y luego consulta la tabla producto para validar si fue efectivamente descontado en el stock. (3 Puntos)
BEGIN TRANSACTION;
INSERT INTO public.compra(
	cliente_id, fecha)
	VALUES (1, now());
INSERT INTO public.detalle_compra(
	producto_id, compra_id, cantidad)
	VALUES (9, (SELECT MAX(id) FROM compra), 5); 
UPDATE public.producto SET stock=stock-5 WHERE id=9;
COMMIT;
select * FROM producto;

-- 3. El cliente usuario02 ha realizado la siguiente compra:
-- ● producto: producto1, producto 2, producto 8.
-- ● cantidad: 3 de cada producto.
-- ● fecha: fecha del sistema.
-- Mediante el uso de transacciones, realiza las consultas correspondientes para este requerimiento y luego consulta la tabla producto para validar que si alguno de ellos se queda sin stock, no se realice la compra. (3 Puntos)
BEGIN TRANSACTION;
INSERT INTO public.compra(
	cliente_id, fecha)
	VALUES (2, now());
INSERT INTO public.detalle_compra(
	producto_id, compra_id, cantidad)
	VALUES (1, (SELECT MAX(id) FROM compra), 3); 
UPDATE public.producto SET stock=stock-3 WHERE id=1;
INSERT INTO public.detalle_compra(
	producto_id, compra_id, cantidad)
	VALUES (2, (SELECT MAX(id) FROM compra), 3); 
UPDATE public.producto SET stock=stock-3 WHERE id=2;
SAVEPOINT checkpoint;
INSERT INTO public.detalle_compra(
	producto_id, compra_id, cantidad)
	VALUES (8, (SELECT MAX(id) FROM compra), 3); 
UPDATE public.producto SET stock=stock-3 WHERE id=8;
ROLLBACK TO checkpoint;
COMMIT;
select * FROM producto;

-- 4. Realizar las siguientes consultas (2 Puntos):
-- a. Deshabilitar el AUTOCOMMIT .
-- b. Insertar un nuevo cliente.
-- c. Confirmar que fue agregado en la tabla cliente.
-- d. Realizar un ROLLBACK.
-- e. Confirmar que se restauró la información, sin considerar la inserción del
-- punto b.
-- f. Habilitar de nuevo el AUTOCOMMIT.
\set AUTOCOMMIT off
\echo :AUTOCOMMIT

BEGIN TRANSACTION;
INSERT INTO public.cliente(
	nombre, email)
	VALUES ('Nuevo Cliente', 'nuevocliente@gmail.com');
COMMIT;

ROLLBACK;

\set AUTOCOMMIT on