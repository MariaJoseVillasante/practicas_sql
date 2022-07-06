-- 1. Cargar el respaldo de la base de datos unidad2.sql.


-- 2. El cliente usuario01 ha realizado la siguiente compra:
-- ● producto: producto9.
-- ● cantidad: 5.
-- ● fecha: fecha del sistema.
-- Mediante el uso de transacciones, realiza las consultas correspondientes para este requerimiento y luego consulta la tabla producto para validar si fue efectivamente descontado en el stock. (3 Puntos)


-- 3. El cliente usuario02 ha realizado la siguiente compra:
-- ● producto: producto1, producto 2, producto 8.
-- ● cantidad: 3 de cada producto.
-- ● fecha: fecha del sistema.
-- Mediante el uso de transacciones, realiza las consultas correspondientes para este requerimiento y luego consulta la tabla producto para validar que si alguno de ellos se queda sin stock, no se realice la compra. (3 Puntos)


-- 4. Realizar las siguientes consultas (2 Puntos):
-- a. Deshabilitar el AUTOCOMMIT .
-- b. Insertar un nuevo cliente.
-- c. Confirmar que fue agregado en la tabla cliente.
-- d. Realizar un ROLLBACK.
-- e. Confirmar que se restauró la información, sin considerar la inserción del
-- punto b.
-- f. Habilitar de nuevo el AUTOCOMMIT.