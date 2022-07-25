use emarket;

#1. Queremos tener un listado de todas las categorías.
SELECT * FROM categorias; 

#2. Cómo las categorías no tienen imágenes, solamente interesa obtener un
#listado de CategoriaNombre y Descripcion.
SELECT CategoriaNombre, Descripcion FROM categorias;

#3. Obtener un listado de los productos.
SELECT * FROM productos;

#4. ¿Existen productos discontinuados? (Discontinuado = 1).
SELECT *FROM productos 
where Discontinuado = 1; 

#5. Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son
#los que nos provee?
SELECT * FROM productos where ProveedorID = 8;

#6. Queremos conocer todos los productos cuyo precio unitario se encuentre
#entre 10 y 22.
SELECT * FROM productos where PrecioUnitario between 10 and 12; 

#7. Se define que un producto hay que solicitarlo al proveedor si sus unidades
#en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?
SELECT * FROM productos where UnidadesStock < NivelReorden;

#8. Se quiere conocer todos los productos del listado anterior, pero que
#unidades pedidas sea igual a cero.
SELECT * FROM productos where UnidadesPedidas = 0; 

#1. Obtener un listado de todos los clientes con Contacto, Compania, Título,
#País. Ordenar el listado por País.
SELECT Contacto, Compania, Titulo, Pais FROM clientes 
ORDER BY Pais;

#2. Queremos conocer a todos los clientes que tengan un título “Owner”.
SELECT * FROM CLIENTES 
WHERE Titulo LIKE "%Owner%";  

#3. El operador telefónico que atendió a un cliente no recuerda su nombre.
#Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con
#todos los contactos que inician con la letra “C”?
SELECT * FROM CLIENTES 
WHERE Contacto LIKE "C%";  

#Obtener un listado de todas las facturas, ordenado por fecha de factura
#ascendente.
SELECT * FROM facturas;
SELECT * FROM facturas 
ORDER BY FechaFactura;

#2. Ahora se requiere un listado de las facturas con el país de envío “USA” y
#que su correo (EnvioVia) sea distinto de 3.
SELECT * FROM facturas 
WHERE PaisEnvio LIKE "USA" AND EnvioVia != 3;

#3. ¿El cliente 'GOURL' realizó algún pedido?
select * from clientes; 
SELECT * FROM clientes where clienteID = "GOURL";

#4. Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.
select * from facturas;
SELECT * FROM facturas where EmpleadoID = 2 OR EmpleadoID = 3 OR EmpleadoID = 5 OR EmpleadoID = 8 OR EmpleadoID = 9; 

#1. Obtener el listado de todos los productos ordenados
#descendentemente por precio unitario.
SELECT * FROM productos 
ORDER BY PrecioUnitario desc;

#2. Obtener el listado de top 5 de productos cuyo precio unitario es
#el más caro.
SELECT * FROM productos 
ORDER BY PrecioUnitario desc
LIMIT 5;

#3. Obtener un top 10 de los productos con más unidades en stock.

SELECT * FROM productos 
ORDER BY UnidadesStock desc
LIMIT 10;

#1.Obtener un listado de FacturaID, Producto, Cantidad.
SELECT * from facturadetalle;
SELECT FacturaID, ProductoID, Cantidad from facturadetalle; 

#2. Ordenar el listado anterior por cantidad descendentemente.
SELECT FacturaID, ProductoID, Cantidad from facturadetalle
ORDER BY catidad DESC;

#3. Filtrar el listado solo para aquellos productos donde la cantidad
#se encuentre entre 50 y 100.
SELECT FacturaID, ProductoID, Cantidad from facturadetalle
WHERE cantidad BETWEEN 50 AND 100;


#4. En otro listado nuevo, obtener un listado con los siguientes
#nombres de columnas: NroFactura (FacturaID), Producto
#(ProductoID), Total (PrecioUnitario*Cantidad).
SELECT FacturaID AS NroFactura , ProductoID as Producto, (PrecioUnitario*Cantidad) as total FROM Facturadetalle; 

#1. Obtener un listado de todos los clientes que viven en "Brazil" o "Mexico",
#o que tengan un título que empiece con “Sales”.
SELECT * FROM clientes WHERE pais = "Brazil" or pais = "Mexico" or titulo like "Sales%";

#2. Obtener un listado de todos los clientes que pertenecen a una compañía
#que empiece con la letra "A".
SELECT * FROM clientes WHERE Compania LIKE "A%";

#3. Obtener un listado con los datos: Ciudad, Contacto y renombrarlo
#como Apellido y Nombre, Titulo y renombrarlo como Puesto, de todos
#los clientes que sean de la ciudad "Madrid".
SELECT Ciudad, Contacto as ApellidoyNombre, Titulo as Puesto FROM  clientes where ciudad LIKE "%Madrid%";

#4. Obtener un listado de todas las facturas con ID entre 10000 y 10500
SELECT * FROM Facturas WHERE FacturaID BETWEEN 10000 AND 10500;

#5. Obtener un listado de todas las facturas con ID entre 10000 y 10500 o de
#los clientes con ID que empiecen con la letra “B”.

SELECT * FROM Facturas WHERE ClienteID LIKE "B%" OR FacturaID BETWEEN 10000 AND 10500;

#6. ¿Existen facturas que la ciudad de envío sea “Vancouver” o que
#utilicen el correo 3?
SELECT * FROM Facturas WHERE EnvioVia = 3 OR CiudadEnvio LIKE "%Vancouver%";

#7. ¿Cuál es el ID de empleado de “Buchanan”?
SELECT * FROM empleados; 
SELECT EmpleadoID FROM empleados WHERE Apellido = "Buchanan";

#8. ¿Existen facturas con EmpleadoID del empleado del ejercicio anterior?
#(No relacionar, sino verificar que existan facturas)
SELECT * FROM facturas; 
SELECT * FROM facturas WHERE EmpleadoID = 5 ;