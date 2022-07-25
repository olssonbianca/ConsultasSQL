use proyecto_spotify;

#1.Listar las canciones que poseen la letra “z” en su título.
SELECT * FROM cancion WHERE titulo LIKE "%Z%";

#2. Listar las canciones que poseen como segundo carácter la letra “a” y como
#último, la letra “s”.
SELECT * FROM cancion WHERE titulo LIKE "_a%s";


#3. Mostrar la playlist que tiene más canciones, renombrando las columnas
#poniendo mayúsculas en la primera letra, los tildes correspondientes y agregar
#los espacios entre palabras.
SELECT titulo as "Título", cantcanciones as "Cantidad de canciones"  FROM playlist 
ORDER BY "Cantidad de canciones" DESC
LIMIT 1;

#4. En otro momento se obtuvo un listado con los 5 usuarios más jóvenes, obtener
#un listado de los 10 siguientes.
SELECT * FROM usuario
ORDER BY fecha_nac DESC
LIMIT 10
OFFSET 5;

#5. Listar las 5 canciones con más reproducciones, ordenadas descendentemente.
SELECT * FROM cancion 
ORDER BY cantreproduccion DESC
LIMIT 5;

#6. Generar un reporte de todos los álbumes ordenados alfabéticamente.
SELECT * FROM album 
ORDER BY titulo;

#7. Listar todos los álbumes que no tengan imagen, ordenados alfabéticamente.
SELECT * FROM album WHERE imagenportada IS NULL
ORDER BY titulo;

#8. Insertar un usuario nuevo con los siguientes datos (tener en cuenta las
#relaciones):
#a. nombreusuario: nuevousuariodespotify@gmail.com
#b. Nombre y apellido: Elmer Gomez
#c. password: S4321m
#d. Fecha de nacimiento: 15/11/1991
#e. Sexo: Masculino
#f. Código Postal: B4129ATF
#g. País: Colombia
SELECT * FROM usuario;
INSERT INTO usuario (idusuario, nombreusuario, nyap,  password ,  fecha_nac, sexo, CP, Pais_idPais ) VALUES  (20, "nuevousuariodespotify@gmail.com", "Elmer Gomez", "S4321m", "1991/11/15" , "M", "B4129ATF", 2  );

#9. Eliminar todas las canciones de género “pop”
DELETE FROM generoxcancion WHERE idGenero = 9;

#10. Editar todos los artistas que no tengan una imagen cargada y cargarles el texto
#“Imagen faltante” en la columna de imagen
SELECT * FROM artista;
UPDATE artista
SET imagen = "Imagen faltante" 
WHERE imagen IS NULL;