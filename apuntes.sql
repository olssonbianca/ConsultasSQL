-- Con CREATE DATABASE podemos crear una base de datos desde cero.
CREATE DATABASE baseDeDatos; 

--Con CREATE TABLE podemos crear una tabla desde cero, junto con sus
--columnas, tipos y constraints. 
CREATE TABLE peliculas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(500) NOT NULL,
    rating DECIMAL(3,1) NOT NULL,
    awards INT DEFAULT 0,
    release_date DATE NOT NULL,
    length INT NOT NULL
);

-- La sentencia FOREIGN KEY 
--sirve para aclarar a qué tabla y a qué columna hace referencia aquel dato.
CREATE TABLE ordenes (
    orden_id INT NOT NULL,
    orden_numero INT NOT NULL,
    cliente_id INT,
    PRIMARY KEY (orden_id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
); 

--ALTER TABLE 
--permite alterar una tabla ya existente y va a operar con tres comandos:
--ADD: Agregar columnas
ALTER TABLE peliculas
ADD rating DECIMAL(3,1) NOT NULL;
--MODIFY: Modifica Columna
ALTER TABLE peliculas
MODIFY rating DECIMAL(4,1) NOT NULL;
--DROP: Elimina columnas
ALTER TABLE peliculas
DROP rating; 


--UPDATE
--modificará los registros existentes de una tabla
UPDATE artistas
SET nombre = 'Charly Garcia', rating = 1.0
WHERE id = 1;

--WHERE
--podemos borrar información de una tabla
DELETE FROM nombre_tabla WHERE condición; 
--La funcionalidad del WHERE es la de condicionar y filtrar las consultas
--SELECT que se realizan a una base de datos.
SELECT nombre_columna_1, nombre_columna_2, ...
FROM nombre_tabla
WHERE condicion;

SELECT primer_nombre, apellido
FROM clientes
WHERE pais <> ‘Argentina’;

DELETE FROM usuarios
WHERE id = 2;

--INSERT
---Insertando datos en todas las columnas 
INSERT INTO table_name (columna_1, columna_2, columna_3, ...)
VALUES (valor_1, valor_2, valor_3, ...); 

--Insertando datos en columnas específicas 
INSERT INTO artistas (nombre)
VALUES ('Calle 13'); 
-- ORDER BY

--INSERT
---Insertando datos en todas las columnas 
INSERT INTO table_name (columna_1, columna_2, columna_3, ...)
VALUES (valor_1, valor_2, valor_3, ...); 

--Insertando datos en columnas específicas 
INSERT INTO artistas (nombre)
VALUES ('Calle 13'); 

--BETWEEN 
--Cuando necesitamos obtener valores dentro de un rango
--➔ BETWEEN incluye los extremos.
--➔ BETWEEN funciona con números, textos y fechas.
--➔ Se usa como un filtro de un WHERE.
SELECT nombre, edad
FROM alumnos
WHERE edad BETWEEN 6 AND 12;


--LIKE
--Especificar un patrón de búsqueda que nos permita especificar algo concreto 
--que queremos encontrar en los registros.

--COMODIN %
--Es un sustituto que representa cero, uno, o varios caracteres

--COMODIN_
--Es un sustituto para un solo carácter

SELECT nombre
FROM usuarios
WHERE nombre LIKE '_a%'; 
-- Devuelve aquellos nombres que tengan la letra 'a' como segundo carácter.

SELECT nombre
FROM usuarios
WHERE direccion LIKE '%Monroe%';
--Devuelve las direcciones de los usuarios que incluyan la calle 'Monroe'.

SELECT nombre
FROM clientes
WHERE nombre LIKE 'Los%s';
--Devuelve los clientes que empiecen con 'Los' y terminen con 's’. 

--LIMIT
--Su funcionalidad es la de limitar el número de filas devueltas en el SELET
SELECT *
FROM peliculas
WHERE premios > 4
LIMIT 10; 

--OFFSET 
--nos permite especificar a partir de qué fila comenzar la recuperación 
--de los datos solicitados.
SELECT id, nombre, apellido
FROM alumnos
LIMIT 20
OFFSET 20;

--ALIAS
--Los alias se usan para darle un nombre temporal y más amigable a las
--tablas, columnas y funciones.

SELECT nombre_columna1 AS alias_nombre_columna1
FROM nombre_tabla; 

-----OPERACIONES-----

--COUNT : Devuelve un único resultado indicando la cantidad de filas/registros que
--cumplen con el criterio.
SELECT COUNT(*) FROM movies;

--AVG: devuelve un único resultado indicando el promedio de una
--columna cuyo tipo de datos debe ser numérico.
SELECT AVG(rating) FROM movies; 

--SUM : devuelve un único resultado indicando la suma de una columna
--cuyo tipo de datos debe ser numérico. 
SELECT SUM(length) FROM movies; 

--MIN: devuelve un único resultado indicando el valor mínimo de una columna
--cuyo tipo de datos debe ser numérico
SELECT MIN(rating) FROM movies;

--MAX:devuelve un único resultado indicando el valor máximo de una columna
--cuyo tipo de datos debe ser numérico.
SELECT MAX(length) FROM movies; 

--GROUP BY
--se usa para agrupar los registros de la tabla resultante de una
--consulta por una o más columnas.7

SELECT marca
FROM coche
WHERE anio_fabricacion>= 2010
GROUP BY marca;

--Se usa para agrupar filas que contienen los mismos valores.
--Opcionalmente, se utiliza junto con las funciones de agregación (SUM,
--AVG, COUNT, MIN, MAX) con el objetivo de producir reportes resumidos.
--Las consultas que cont--GROUP BY
--se usa para agrupar los registros de la tabla resultante de una
--consulta por una o más columnas.7
SELECT marca
FROM coche
WHERE anio_fabricacion>= 2010
GROUP BY marca;
ienen la cláusula GROUP BY se denominan
--consultas agrupadas y solo devuelven una sola fila para cada elemento agrupado

-- HAVING
--MAX:devuelve un único resultado indicando el valor máximo de una columna
--cuyo tipo de datos debe ser numérico.
SELECT MAX(length) FROM movies; 



-------JOINS-----
INNER JOIN
Cada JOIN lleva su ON (q sería como el WHERE, pero va en la misma línea)
Además podría usar el WHERE

SELECT column1, column2, column3 //o bien el *
FROM table1
INNER JOIN table2 ON idFK = idPk

SELECT column1, column2, column3 //o bien el *
FROM table1
LEFT JOIN table2 ON  idFK = idP //Acá nos trae TAMBIEN todo lo de la izq de la table1, aparte de la intersección del ON, AUNQUE no matchee

SELECT column1, column2, column3 //o bien el *
FROM table1
RIGTH JOIN table2 ON  idFK = idP //Acá nos trae TAMBIEN todo lo de la derecha de la table2, aparte de la intersección del ON, AUNQUE no matchee

---

LEFT Excluding JOIN

SELECT [factura.id](factura.id) AS nro_factura, apellido, nombre, fecha
FROM cliente
LEFT JOIN factura
ON [cliente.id](cliente.id) = factura.cliente_id
WHERE [factura.id](factura.id) IS NULL;

RIGHT Excluding JOIN
SELECT [factura.id](factura.id) AS nro_factura, apellido, nombre, fecha
FROM cliente
RIGHT JOIN factura
ON [cliente.id](cliente.id) = factura.cliente_id
WHERE [cliente.id](cliente.id) IS NULL;


---------FUNCIONES DE ALTERACIÓN------
- --CONCAT---
concat: unir varias columnas
SELECT CONCAT(first_name, " ", last_name) AS nombre_completo
FROM actors
- --COALESCE---
coalesce: para q en vez de NULL, te diga otra cosa
SELECT title, COALESCE(name, "No tiene genero")
FROM movies
LEFT JOIN genres ON genre_id = [genres.id](genres.id)
- --DATEDIFF---
datediff: diferencia entre fechas
now: nos permite tener fecha y hora actual
SELECT title, DATEDIFF(NOW(), release_date)
FROM movies

timediff: devuelve la dif entre 2 horarios

extract: extrae algo particular, para extraer partes de una datetime
SELECT title, EXTRACT(day FROM release_Date)
FROM movies

- --DATE_FORMAT---
date formart: nos permite formatear la fecha hacia cómo queremos verla
SELECT title, DATE_FORMAT(release_date, "%d/%m/%Y")
FROM movies

date_add

date_sub

- --REPLACE---
replace: reemplazar
SELECT REPLACE(title, "Harry", "Juanito") //columna a modificar, texto a modif, porqué texto modifico
FROM movies
- --LENGTH---
length: cuántos caracteres tiene
SELECT LENGTH(title)
FROM movies //para saber ctos caracteres tiene el título

length
SELECT title
FROM movies
WHERE LENGTH(title) > 10 //tb puede ir en ORDER BY

- --CASE---
case:
SELECT title, rating
CASE
WHEN rating < 5 THEN "Mala"
WHEN rating < 7 THEN "Buena"
ELSE "Muy buena"
END
FROM movies