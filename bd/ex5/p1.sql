-- Ejercicio 1
CREATE DATABASE ejemplo;
-- Ejercicio 2
CREATE SCHEMA esq1;
-- Ejercicio 3
CREATE TABLE esq1.tabla1 (dni varchar(15) PRIMARY KEY, nombre varchar(30));
-- Ejercicio 4
CREATE TABLE tabla2 (id INTEGER PRIMARY KEY, dni varchar(15), FOREIGN KEY (dni) REFERENCES esq1.tabla1(dni));
-- Ejercicio 5
ALTER TABLE esq1.tabla1 ADD edad INT CHECK (edad >= 0 AND edad <= 99);
-- Ejercicio 6
ALTER TABLE tabla2 ADD precio DECIMAL(8,4);

