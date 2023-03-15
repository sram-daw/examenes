/*Para favorecer la atomicidad de la primera forma normal, los nombres y apellidos podrían ir en campos distintos. 
El segundo nombre y segundo apellido no son obligatorios para evitar errores con nombres o apellidos únicos.
Para evitar redundancias en los campos de los datos personales al introducir todas las asignaturas en las que un mismo alumno está matriculado, 
podría incluirse una segunda tabla llamada “asignaturas” con el id de la asignatura y el nombre de la misma. 
Así mismo, crearíamos una tercera tabla, "matriculas", que sería una tabla puente e incluye el dni del alumno como FK 
y el id de la asignatura en la que está matriculado el alumno, también como FK. 
Esto permite relacionar los datos de la tabla "alumnos" con los de "asignaturas".
*/


CREATE TABLE alumnos (dni VARCHAR(15) PRIMARY KEY, nombre1 VARCHAR(30) NOT NULL, nombre2 VARCHAR(30), apellido1 VARCHAR(30) NOT NULL, apellido2 VARCHAR(30));

CREATE TABLE asignaturas (id_asignatura INTEGER PRIMARY KEY, nombre VARCHAR(50) NOT NULL);

CREATE TABLE matriculas (dni VARCHAR(15), id_asignatura INTEGER, FOREIGN KEY (dni) REFERENCES alumnos(dni), FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id_asignatura));



