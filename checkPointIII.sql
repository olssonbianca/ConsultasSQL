#GRUPO 1
#Alejandra Vedoya - Bianca Olsson - Natalia Lavado - Jesica Ramirez - Cintia Filosi  

use laaprobacion; 
#1
select * from habitacion_x_servicio_basico
where habitacion_numero = 25;
#RETORNA: 4 FILAS

#2
select nombre, habitacion_x_servicio_basico.habitacion_numero  from servicio_basico
inner join habitacion_x_servicio_basico on habitacion_x_servicio_basico.servicio_basico_id = servicio_basico.id;
#RETORNA 6 filas

#3
select  checkin.huesped_id, CONCAT(nombre, " ",apellido ) as Cliente, count(checkin.huesped_id) as cantidadCheckin from checkin 
inner join huesped on checkin.huesped_id = huesped.id 
group by checkin.huesped_id having cantidadCheckin > 3;
#RETORNA 14 FILAS

#4
SELECT h.id AS 'Num Huesped', UPPER(CONCAT(apellido, ', ', nombre)) AS 'Huésped sin check-in'
FROM huesped h
LEFT JOIN checkin ch ON h.id = ch.huesped_id
WHERE ch.huesped_id is null;
# ROW 16 FILES

#5
select hu.id, hu.apellido, hu.nombre, ha.numero as numeroHabitacion, cl.nombre as nombreClase
from huesped hu
inner join checkin ch on hu.id = ch.huesped_id
inner join habitacion ha on ch.habitacion_numero = ha.numero
inner join clase cl on ha.clase_id = cl.id
where cl.id = 2
group by hu.id; 
#RETORNA: 33 FILAS

#6
select huesped_id, apellido, nombre, servicio_extra_id
from huesped
inner join reserva
on huesped.id = reserva.huesped_id
where reserva.id >= 1 and apellido like '_u%';
#RETORNA: 10 FILAS

#7 
SELECT pais.nombre as Pais, COUNT(huesped.pais_id) as Total FROM huesped
INNER JOIN pais
ON pais.id = huesped.pais_id
GROUP BY pais_id;

#RETORNA 4 FILAS


#8
SELECT huesped.apellido, SUM(reserva.importe) as importeTotal , COUNT(reserva.id) as cantidadReservas from huesped
inner join reserva on huesped.id = huesped_id  where month(fecha) = 03
group by huesped.id;
#RETORNA 9 FILAS

#9
SELECT ch.habitacion_numero AS 'Hab-Numero', d.nombre AS 'Nombre-Decoracion', c.nombre AS 'Nombre-Clase', SUM(ch.importe) AS Total
FROM checkin ch
JOIN habitacion h ON ch.habitacion_numero = h.numero
JOIN decoracion d ON h.decoracion_id = d.id
JOIN clase c ON h.clase_id = c.id
WHERE h.numero = 22; 
#retorna 1 fila

#10
select pais.nombre, habitacion.numero, sum(checkin.importe) as totalRecaudado
from pais 
inner join huesped on huesped.pais_id = pais.id
inner join checkin on checkin.huesped_id = huesped.id
inner join habitacion on habitacion.numero = checkin.habitacion_numero
where habitacion.numero in (5, 10, 22)
group by pais.id;
#RETORNA  4 FILAS

#11
select sum(importe) as 'Total', forma_pago.nombre  from reserva
inner join forma_pago on forma_pago_id = forma_pago.id
group by forma_pago_id;
#RETORNA: 4 FILAS

#12
SELECT empleado.legajo, empleado.apellido, CONCAT(SUBSTRING(empleado.nombre, 1, 1), ".") AS Nombre, pais.nombre AS Pais, sector.nombre AS Sector
FROM empleado
INNER JOIN sector ON empleado.sector_id = sector.id
INNER JOIN pais ON empleado.pais_id = pais.id
WHERE empleado.sector_id = 1 AND empleado.pais_id = 1;
#rows: 3



#13
SELECT habitacion.numero, habitacion.clase_id, servicio_basico.nombre from habitacion_x_servicio_basico
inner join habitacion on habitacion.numero = habitacion_numero
inner join servicio_basico on servicio_basico.id = servicio_basico_id 
where habitacion.numero between 20 and 24
order by habitacion.numero, servicio_basico.id; 
#RETORNA 28 FILAS

#14
SELECT * FROM decoracion;
SELECT * FROM HABITACION;
SELECT *
FROM decoracion d
LEFT JOIN habitacion h ON d.id = h.decoracion_id
WHERE h.decoracion_id IS NULL;
#RETORNA 2 FILAS

#15
select apellido,
nombre,
TIMESTAMPDIFF(YEAR,fecha_nacimiento,CURDATE()) as edad,
case
when TIMESTAMPDIFF(YEAR,fecha_nacimiento,CURDATE()) < 35 then 'JUNIOR'
WHEN TIMESTAMPDIFF(YEAR,fecha_nacimiento,CURDATE()) between 35 and 40 THEN 'SEMI-SENIOR'
ELSE 'SENIOR'
END AS CATEGORIA
from empleado
order by edad;

#RETORNA 25 FILAS


#16
select sum(importe) as 'Total', round(avg(importe),2) as 'Promedio', forma_pago.nombre 
from checkin
inner join forma_pago on forma_pago_id = forma_pago.id
group by forma_pago_id;
#RETORNA: 4 FILAS

#17

#18
SELECT huesped.apellido, huesped.nombre , huesped.pais_id, pais.nombre, SUM(checkin.importe) as importeTotal from huesped
inner join pais on huesped.pais_id = pais.id
inner join checkin on huesped_id = huesped.id where huesped.apellido like "Mercado" and  huesped.nombre like "Joel"; 
#RETORNA 1 FILA

#19
SELECT se.nombre AS 'Nombre Serv. Extra', fp.nombre AS 'Nombre Forma Pago', count(r.forma_pago_id) AS Cantidad
FROM servicio_extra se 
JOIN reserva r ON se.id = r.servicio_extra_id
JOIN forma_pago fp ON fp.id = r.forma_pago_id
GROUP BY fp.id;

/*retorna 4 filas*/

#20
select se.nombre as 'servicio extra', 
fp.nombre as 'forma de pago',
h.id as 'huesped',
sum(r.importe) as 'importe total'
from reserva r
join servicio_extra se on r.servicio_extra_id = se.id
join forma_pago fp on r.forma_pago_id = fp.id
join huesped h on r.huesped_id = h.id
where se.nombre = 'Sauna'
group by h.id;


/*retorna 22 filas*/


