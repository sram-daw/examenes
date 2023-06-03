--Uso de JSON en Postgres

--1. Le añades una tabla que se llame "frutas" con un campo que sea clave primaria y otro que permita usar JSON, que guardará información sobre frutas.
--previamente: create database bd_frutas_json
CREATE TABLE frutas (
	id serial NOT NULL PRIMARY KEY,
	info jsonb NOT NULL
);

--2. Una fruta tiene varias propiedades:
    -- Un nombre: naranja, pera, manzana, etc
    -- Un diámetro (en cm): 5, 10, 15, etc
    -- Un origen (ciudad): Vigo, Ourense, Santiago, etc

--3. Añade al menos 5 frutas a tu base de datos
INSERT INTO frutas (info)
VALUES
    ('{"nombre": "Manzana", "diámetro": 8, "origen": "Buenos Aires"}'),
    ('{"nombre": "Plátano", "diámetro": 6, "origen": "Praga"}'),
    ('{"nombre": "Naranja", "diámetro": 7, "origen": "Ourense"}'),
    ('{"nombre": "Pera", "diámetro": 5, "origen": "Valencia"}'),
    ('{"nombre": "Sandía", "diámetro": 15, "origen": "Ourense"}');

--4. Ponme la consulta para mostrar las frutas que vienen de Ourense
SELECT *
FROM frutas
WHERE info->>'origen' = 'Ourense';

--5. Muéstrame las frutas que comiencen por la letra N
SELECT *
FROM frutas
WHERE info->>'nombre' LIKE 'N%';
