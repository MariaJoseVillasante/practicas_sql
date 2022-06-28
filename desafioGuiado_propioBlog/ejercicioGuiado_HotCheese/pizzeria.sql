-- 1-Crear una base de datos llamada “pizzeria”.
CREATE DATABASE pizzeria;
-- 2-Conectarse a la base de datos pizzeria.
\c pizzeria
-- 3-Crear 2 tablas llamadas “ventas” y “pizzas”. La columna stock debe tener una restricción que diga que su valor debe ser mayor o igual a 0.
CREATE TABLE pizzas(
id INT,
stock INT CHECK (stock >= 0.00), costo DECIMAL,
nombre VARCHAR(25),
PRIMARY KEY(id)
);
CREATE TABLE ventas( cliente VARCHAR(20), fecha DATE,
monto DECIMAL, pizza INT,
FOREIGN KEY (pizza) REFERENCES pizzas(id) );
-- 4-Agregar 1 registro a la tabla “pizzas” seteando como stock inicial 0
INSERT INTO pizzas (id, stock, costo, nombre) VALUES (1, 0, 12000, 'Uhlalá');
-- 5-Realizar una transacción que registre una nueva pizza con un stock positivo mayor a 1.
BEGIN;
INSERT INTO pizzas (id, stock, costo, nombre) VALUES (2, 2, 15000, 'Jamón a todo dar');
COMMIT;
-- 6-Realizar una transacción que registre una venta con la pizza con stock 0 e intentar actualizar su stock restándole 1.
BEGIN;
INSERT INTO ventas (cliente, fecha, monto, pizza) VALUES ('Dexter Gonzalez', '2020-02-02', 12000, 1);
UPDATE pizzas SET stock = stock - 1 WHERE id = 1;
COMMIT;
-- 7-Realizar una transacción que intente registrar 1 venta por cada pizza, guardando un SAVEPOINT luego de la primera venta y volviendo a este punto si surge un error.
BEGIN;
INSERT INTO ventas (cliente, fecha, monto, pizza) VALUES ('Juan Bravo', '2020-02-02', 15000, 2);
UPDATE pizzas SET stock = stock - 1 WHERE id = 2;
SAVEPOINT checkpoint;
INSERT INTO ventas (cliente, fecha, monto, pizza) VALUES ('Utonio Ramirez', '2020-02-02', 12000, 1);
UPDATE pizzas SET stock = stock - 1 WHERE id = 1;
-- Acá recibirás un error por intentar rebajar el stock de una pizza cuyo stock es 0
ROLLBACK TO checkpoint;
-- 8-Exportar la base de datos “pizzeria” como un archivo pizzeria.sql.

-- 9-Eliminar la base de datos “pizzeria”.

-- 10-Importar el archivo pizzeria.sql.


