/*Dado que una misma persona puede tener varias fotos, en la tabla orinigal va a existir una redundancia en los datos que hacen 
referencia a la persona (idPersona, nombre, dni…), y lo mismo con los datos relativos a los monumentos (puede haber fotos de distintas 
personas en un mismo monumento). Existen dependencias transitivas con respecto a los datos de la persona (ej. nombre y dni dependen 
de idPersona, y este atributo a su vez depende de idFoto). El resultado serían cuatro tablas: una “fotos”, otra “personas” 
(en la que sustituimos idPersona por el dni para ahorrar un campo), otra “monumentos” y una última “recuerdos”, que sería una tabla puente 
entre “fotos”, “personas”  y "monumentos" con tres FK: id_foto, dni e id_monumento.
*/

CREATE TABLE personas (dni VARCHAR(15) PRIMARY KEY, nombre VARCHAR(30) NOT NULL, apellido VARCHAR(30) NOT NULL);

CREATE TABLE fotos (id_foto INTEGER PRIMARY KEY, titulo VARCHAR(50), fecha DATE NOT NULL);

CREATE TABLE monumentos (id_monumento INTEGER PRIMARY KEY, nombre VARCHAR(50) NOT NULL, ciudad VARCHAR(50) NOT NULL, antiguedad INTEGER NOT NULL);

CREATE TABLE recuerdos (id_foto INTEGER, dni VARCHAR(15), id_monumento INTEGER, FOREIGN KEY (id_foto) REFERENCES fotos(id_foto), FOREIGN KEY (dni) REFERENCES personas(dni), FOREIGN KEY (id_monumento) REFERENCES monumentos(id_monumento));


