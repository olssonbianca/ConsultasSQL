use movies_db;
#Funciones de agregación, GROUP BY y HAVING
#1. ¿Cuántas películas hay?
select count(*) from movies;

#2. ¿Cuántas películas tienen entre 3 y 7 premios?
select * from movies;
select count(*) from movies where awards between 3 and 7;

#3. ¿Cuántas películas tienen entre 3 y 7 premios y un rating mayor a 7?
select count(*) from movies where awards between 3 and 7 and rating > 7;

#4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
#cantidad de películas por id. de género.
select count(*) from movies 
group by genre_id;

#5. De la consulta anterior, listar sólo aquellos géneros que tengan como suma
#de premios un número mayor a 5.
select genre_id, sum(awards) from movies
group by awards > 5
having genre_id;


------- MOVIES CON JOIN-----
use movies_db;
#1. Utilizando la base de datos de movies, queremos conocer, por un lado, los
#títulos y el nombre del género de todas las series de la base de datos.
select series.id, title, genre_id, genres.id from series
inner join genres on genre_id = genres.id;

#2. Por otro, necesitamos listar los títulos de los episodios junto con el nombre y
#apellido de los actores que trabajan en cada uno de ellos.
select episodes.id, episode_id , title, actors.id, actor_id , first_name, last_name 
from episodes
inner join actor_episode on episodes.id = episode_id
inner join actors on actor_id = actors.id;

#3. Para nuestro próximo desafío, necesitamos obtener a todos los actores o
#actrices (mostrar nombre y apellido) que han trabajado en cualquier película
#de la saga de La Guerra de las galaxias.
select movies.id, actors.id,title, first_name, last_name from actors
inner join actor_movie on actors.id = actor_id
inner join movies on movies.id where title like "%La guerra de las galaxias%";

#4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
#cantidad de películas por nombre de género.
select count(*), name,  genre_id from movies 
inner join genres on genre_id = genres.id 
group by genre_id;