#Camada 7
#Grupo 3
#Integrante:
# -Bianca Olsson
# -Jimena Simanca
# -Yusneidy Polanco 
# -Sara Arias 
# -Natalia Lavado 

#1
SELECT id, nombre, apellido
FROM huesped
WHERE nombre LIKE 's%'; 

#2 
select legajo from empleado 
where domicilio = "Av. Rosalind Franklin 600";

#3 
select MAX(importe) FROM reserva;  

#4
select * from reserva
where id in (15, 19, 21, 35);

#5
select sum(importe) from checkin 
where habitacion_numero = 40; 

#6
select * from empleado
where sector_id != 3 and fecha_nacimiento > '1989/9/3' or fecha_nacimiento = '1986/11/7' 
order by fecha_nacimiento DESC; 

#7
select importe from reserva 
where importe between '10499,50' and '12000,00'
order by importe DESC; 

#8
select importe from checkin 
order by importe
LIMIT 1
OFFSET 5;

#9
select id, fecha_entrada, importe from checkin 
order by importe desc
LIMIT 1;

#10 
select id, importe, servicio_extra_id from reserva 
order by importe
limit 10; 

#11 
select * from reserva
where fecha between '2021/07/14' and '2021/08/15'
order by fecha;

#12
select * from reserva
where fecha between '2021/07/14' and '2021/08/15'
order by fecha;

#13
select legajo, apellido, nombre, telefono_movil from empleado 
where nombre like '%ia';

#14 
select avg(importe) from reserva 
where forma_pago_id = 1; 

#15 
select importe from checkin 
where forma_pago_id = 3
order by importe desc
limit 1 
offset 3;  

#16 
select habitacion_numero as "Habitacion", count(*) as "Cantidad"
from checkin
where habitacion_numero = 7;

#17 
select domicilio from huesped 
where domicilio like "% __n__ %" or domicilio like "% __n__" or domicilio like " __n__ %";

#18 
UPDATE decoracion
SET nombre = 'Romana'
WHERE id = 3;

#19
INSERT INTO huesped (id, apellido, nombre, pasaporte, fecha_nacimiento, domicilio, pais_id, telefono_movil, email)
values(default, "Palermo Díaz", "Ricardo Omar", "28001555", "1980-01-05", "calle Av. Sarmiento 752 este", "1" ,"+542645667714",'pal1980sj@gmail.com');

#20 
delete from habitacion_x_servicio_basico
where servicio_basico_id = 5;
select * from habitacion_x_servicio_basico; 

DELETE FROM servicio_basico
WHERE id = 5;
select * from  servicio_basico;
