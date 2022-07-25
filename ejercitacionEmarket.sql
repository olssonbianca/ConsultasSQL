use emarket;
#1 ¿Cuántos clientes existen?
select count(clienteID) from clientes;

#2 ¿Cuántos clientes hay por ciudad?
select count(clienteID), ciudad from clientes
group by ciudad;

#1 ¿Cual es el total de transporte?
select sum(transporte) as total from facturas;

#2 ¿Cual es el total de transporte por EnvioVia (empresa de envío)?
select EnvioVia, sum(transporte) as total from facturas
group by EnvioVia;

#3 Calcular la cantidad de facturas por cliente. Ordenar descendentemente por
#cantidad de facturas.
select clienteID, count(*) as cantidad from facturas
group by clienteID
order by cantidad DESC ;

#4 Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.
select clienteID, count(*) as cantidad from facturas
group by clienteID
order by cantidad DESC
limit 5;

#5 ¿Cual es el país de envío menos frecuente de acuerdo a la cantidad de facturas?
select  paisEnvio, count(*) as cantidad from facturas
group by paisEnvio 
order by cantidad
limit 1;

#6 Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado
#realizó más operaciones de ventas?
select nombre, apellido, empleados.EmpleadoID, facturas.EmpleadoID, count(*) as cantidad from facturas
inner join empleados on empleados.EmpleadoID = facturas.EmpleadoID
group by facturas.EmpleadoID 
order by cantidad desc
limit 1;

#1 ¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?
select productoID, count(productoID) as cantidad from facturadetalle
group by productoID
order by cantidad desc
limit 1; 

#2 ¿Cuál es el total facturado? Considerar que el total facturado es la suma de
#cantidad por precio unitario.
select sum(cantidad * precioUnitario) as total from facturadetalle;


#3 ¿Cuál es el total facturado para los productos ID entre 30 y 50?
select sum(cantidad * precioUnitario) as total from facturadetalle
where productoID between 30 and 50;

#4 ¿Cuál es el precio unitario promedio de cada producto?
select productoID, avg(precioUnitario) as producto from facturadetalle
group by ProductoID;

#5 ¿Cuál es el precio unitario máximo?
select productoID, max(precioUnitario) as producto from facturadetalle;

#1 Generar un listado de todas las facturas del empleado 'Buchanan'.
select facturaID,  apellido from facturas
inner join empleados on empleados.empleadoID = facturas.EmpleadoID where apellido like "%Buchanan%";

#2 Generar un listado con todos los campos de las facturas del correo 'Speedy Express'.
select * from facturas 
inner join correos on EnvioVia = CorreoID where compania like "%Speedy Express%";

#3 Generar un listado de todas las facturas con el nombre y apellido de los
#empleados.
select FacturaID, nombre, apellido from facturas 
inner join empleados on facturas.EmpleadoID = Empleados.EmpleadoID;

#4 Mostrar un listado de las facturas de todos los clientes “Owner” y país de envío
#“USA”.
select FacturaID, titulo, PaisEnvio from Facturas
inner join clientes on  clientes.clienteID = facturas.clienteID where titulo like "%Owner" and PaisEnvio like "%USA%";

#5 Mostrar todos los campos de las facturas del empleado cuyo apellido sea
#“Leverling” o que incluyan el producto id = “42”.
select facturas.FacturaID, empleados.apellido, facturadetalle.productoID from facturas
inner join empleados on empleados.empleadoID = Facturas.empleadoID 
inner join facturadetalle on facturas.facturaID = facturadetalle.facturaID 
where apellido like "%Leverling%" or ProductoID = 42;

#6 Mostrar todos los campos de las facturas del empleado cuyo apellido sea
#“Leverling” y que incluya los producto id = “80” o ”42”.
select facturas.FacturaID, empleados.apellido, facturadetalle.productoID from facturas
inner join empleados on empleados.empleadoID = Facturas.empleadoID 
inner join facturadetalle on facturas.facturaID = facturadetalle.facturaID 
where apellido like "%Leverling%" and ProductoID in (42,12);

#7 Generar un listado con los cinco mejores clientes, según sus importes de
#compras total (PrecioUnitario * Cantidad).
select sum(precioUnitario*cantidad) as importe, clientes.clienteID from facturas
inner join facturadetalle on facturas.facturaID= facturadetalle.FacturaID  
inner join clientes on clientes.clienteID = facturas.clienteID
group by clientes.clienteID
order by importe desc
limit 5;