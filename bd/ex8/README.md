Examen Práctico: Bases de Datos No SQL
==============================

Vinculado al tema https://www.apuntesinformaticafp.com/cursos/bd_no_sql.html

Uso de JSON en Postgres. 20p
=======================

Crea una base de datos en postgres que se llame "bd_frutas_json". Yo ya la tengo creada la BD en mi sistema.

Todas las tareas van en un archivo sql (p1.sql) que puedo importar a mi sistema gestor (vía \i o psql o copiar/pegar el sql). 

1. Le añades una tabla que se llame "frutas" con un campo que sea clave primaria y otro que permita usar JSON, que guardará información sobre frutas.
2. Una fruta tiene varias propiedades:

   1. Un nombre: naranja, pera, manzana, etc
   2. Un diámetro (en cm): 5, 10, 15, etc
   3. Un origen (ciudad): Vigo, Ourense, Santiago, etc

3. Añade al menos 5 frutas a tu base de datos
4. Ponme la consulta para mostrar las frutas que vienen de Ourense
5. Muéstrame las frutas que comiencen por la letra N

Modelo de datos en MongoDB. 20p
==========================

Diseña un almacén de datos que te permita gestionar y acceder a los datos de una aplicación de gestión de viajes sencilla. Se cumplirán los siguientes requisitos:

1. Necesitamos conocer la información de los viajeros y los vuelos que hacen.
2. Los viajeros son españoles o con residencia en España, y queremos saber el día que nacen para saber cual es su edad y felicitarle el cumpleaños. Un viajero puede hacer muchos viajes
3. De los viajes queremos conocer de qué ciudad es el origen y cual es el destino, y claro la fecha (de salida y llegada). Ah! Y de cada ciudad queremos saber cuantos habitantes tiene y una descripción sencilla de 150 caracteres máximo con un recomendación de cosas para ver.

Envíame en el archivo p2.sh (pongo la extensión .sh porque lo podría ejecutar esas instruccciones en mi consola mongosh) tu base de datos. Recuerda que no hay documento del modelo de datos (diseño físico) sino que se crea cuando insertas los datos. Necesito que cada colección tenga al menos 3 registros.

Consultas en MongoDB. 20p
=========================

Trabajamos sobre la colección restaurants de la BD sample_restaurants. En el archivo p3.sh dejas los comandos (las instrucciones).

1. Los que sean de cocina griega (Greek). Sólo quiero saber el nombre, no toda la información
2. Quiero un listado con el nombre de restaurante, el tipo de cocina y barrio (borough) en el que está
3. Los que sean de cocina griega y tengan una nota (grade) de B. Solo el nombre y la nota.
4. Los que hayan tenido una valoración (score) de al menos 30 puntos. Que apareza el nombre, el score y el barrio.
5. Los que sean de cocina Italiana o Mexican y estén en Manhattan (borough). Que aparezca la calle, el edificio, el barrio, el tipo de cocina y grades (todas las valoraciones)

Actualización Borrado de datos. 20p
===================================

Trabajamos con la colección movies de la BD sample_mflix

1. Actualiza el campo year de la pelicula de título “Civilization” a “1985”
2. Actualiza el campo comentarios de todas las películas, sumándole 10
3. Actualiza el campo year de las peliculas con duración (runtime) mayor a 100 para que sea 100 (es decir, no habrá ninguna duración mayor que 100)
4. Borra las que sean el género Action
5. Borra las películas de entre los años 1950 y 1970 y que tengan menos de 80 votos en imdb

Agregación y Pipelines. 20p
===========================

Trabajamos con la colección supplies de la BD sample_supplies

1. Muéstrame 3 pedidos (supplies) de la BD.
2. Muéstrame el promedio de edad de los clientes (customer) agrupado por tienda (storeLocation)
3. ¿Cuántos clientes mujeres de más de 40 años han hecho pedidos en nuestra tienda?
4. Muéstrame la tienda, el email del cliente y su edad,  de los 5 pedidos con mejor valoración (satisfaction) de los clientes (customer)
