--Usando funciones nativas en Postgres

--1. Quiero crear un número aleatorio entre el 5 y el 30
SELECT floor(random() * 26 + 5); --floor es necesario para redondear los posibles decimales y que dé un entero

--2. ¿Cuanto es 4 elevado a 5?
SELECT POWER(4, 5);

--3. Crea la secuencia seq_01 que sea de números enteros, y que salte de 2 en 2.
CREATE SEQUENCE seq_01
INCREMENT BY 2
START WITH 1
NO MINVALUE
NO MAXVALUE
CACHE 1; --'cache 1' indica que solo se debe almacenar en caché un valor de la secuencia

--4. ¿Cómo sabes cual es el valor actual de la secuencia? ¿Y el siguiente?
SELECT CURRVAL('seq_01'); --valor actual
SELECT NEXTVAL('seq_01'); --siguiente valor

--5. ¿Qué sentencia tienes que construir para obtener “2001-07-27 12:00”,
SELECT DATE_TRUNC('day', '2001-07-30'::timestamp) + INTERVAL '12 hour';

--6. usando un intervalo de 3 días?
SELECT DATE_TRUNC('day', '2001-07-30'::timestamp - INTERVAL '3 day') + INTERVAL '12 hour';

--7. ¿Cuantas horas son desde las 07:30 a as 08:45? (usando time, claro)
SELECT '08:45:00'::TIME - '07:30:00'::TIME;

--8. ¿Cuales son los segundos, de la fecha 2001-02-16 20:38:40?
SELECT EXTRACT(SECOND FROM TIMESTAMP '2001-02-16 20:38:40') as segundos;

--9. ¿Como concatenas, usando un operador, el valor “Hola, me llamo” y el nombre “Pepe”?
SELECT 'Hola, me llamo ' || 'Pepe';

--10. ¿Cómo harías para quitar las o’s y las e’s de “Hola soy Pepe”?
SELECT REPLACE(REPLACE('Hola soy Pepe', 'o', ''), 'e', '');

----------------------------------------------------------------------
--Creando funciones (en SQL)

--1. suma(n1,n2,n3). Crea una función que sume los dos primeros argumentos, y lo multiplique por un tercero. Los argumentos serán enteros.
CREATE FUNCTION suma(n1 integer, n2 integer, n3 integer)
RETURNS integer AS
$$
SELECT (n1+n2)*n3;
$$
LANGUAGE SQL;

--2. actualizar_bicis(codigo). Sobre la BD Hubway, quiero cambiar todos los valores de los códigos de las bicis que están a null, con un valor que yo quiero escoger. Por ejemplo actualizar_bicis('000000').
CREATE or REPLACE PROCEDURE actualizar_bicis(codigo character varying(6))
LANGUAGE SQL AS 
$$
UPDATE trips SET bike_number = codigo WHERE bike_number is null;
$$;

--3. duracion_viaje(id,tipo). Necesito saber la duración de un viaje, en minutos o en horas, según el parámetro sea M o H. Por ejemplo duracion_viaje(4300,'M')
CREATE OR REPLACE FUNCTION duracion_viaje(viaje integer, tipo char(1)) --se usa el nombre de parámetro 'viaje' en lugar de id para que no haya confusión a la hora de referirse al id de la tabla o al parámetro
RETURNS decimal(5,2) AS
$$
SELECT
CASE
  WHEN tipo = 'M'  THEN (duration / 60)::decimal(5,2)
  WHEN tipo = 'H' THEN (duration / 60 / 60)::decimal(5,2)
END
FROM trips where id = viaje
$$
LANGUAGE SQL;

----------------------------------------------------------------------

--Creando funciones (en PL/pgSQL)

--1. actualiza_viaje(viaje, factor). Actualizar la duración para un viaje concreto. Es decir la nueva duración será la que tiene multiplicada por factor. Devolverá el número de viajes realizado desde la misma estación de origen
CREATE OR REPLACE FUNCTION actualiza_viaje(viaje integer, factor integer)
RETURNS integer AS $$
DECLARE
   num_viajes integer;
BEGIN
   UPDATE trips SET duration = duration * factor WHERE id = viaje;
   SELECT COUNT(*) INTO num_viajes FROM trips WHERE start_station = (SELECT start_station FROM trips WHERE id = viaje);
   RETURN num_viajes;
END;
$$ LANGUAGE plpgsql;

--2. contar_viajes_mes(mes, referencia). Devuelve un entero con los viajes que se hicieron en un mes concreto (siendo 1 - enero y 12 - diciembre). Lanzará también un aviso en consola (RAISE NOTICE) clasificándolo en pocos / normal / muchos. El umbral de decisión será de 0,25 el valor de referencia (para pocos), 0,5 para normal y 0,75 muchos
CREATE OR REPLACE FUNCTION contar_viajes_mes(mes INTEGER, referencia INTEGER) RETURNS TABLE (categoria TEXT, total_viajes INTEGER) AS $$
DECLARE
  LIMITE_POCOS INTEGER := 0.25 * referencia;
  LIMITE_NORMAL INTEGER := 0.50 * referencia;
  LIMITE_MUCHOS INTEGER := 0.75 * referencia;
BEGIN
  SELECT COUNT(*) INTO total_viajes FROM trips WHERE extract(MONTH FROM start_date) = mes;
  
  IF total_viajes < LIMITE_POCOS THEN
    categoria := 'pocos';
  ELSIF total_viajes >= LIMITE_POCOS AND total_viajes < LIMITE_NORMAL THEN
    categoria := 'normal';
  ELSIF total_viajes >= LIMITE_NORMAL AND total_viajes < LIMITE_MUCHOS THEN
    categoria := 'muchos';
  ELSE
    categoria := 'muchísimos';
  END IF;
  
  RAISE NOTICE 'Este mes ha habido % viajes.', categoria;
  
  RETURN QUERY SELECT categoria, total_viajes;
END;
$$ LANGUAGE plpgsql;

--3. borra_y_guarda(id). Crea una función que borre el viaje con ese id. Además guardará en un log (tabla viajes_borrados) un registro del tipo «El usuario $U borró el viaje $V», además el timestamp del borrado
CREATE OR REPLACE FUNCTION borra_y_guarda(id_trip INTEGER) RETURNS VOID AS $$
DECLARE
  viajes_borrados RECORD;
  usuario TEXT := current_user;
  texto_notice TEXT;
BEGIN
  SELECT * INTO viajes_borrados FROM trips WHERE id = $1;
  DELETE FROM trips WHERE id = $1;

  texto_notice := 'El usuario ' || usuario || ' borró el viaje ' || viajes_borrados::TEXT;

  INSERT INTO viajes_borrados(texto_notice) VALUES (texto_notice);

END;
$$ LANGUAGE plpgsql;

/*Se ha creado previamente la tabla viajes_borrados de la siguiente forma:
CREATE TABLE viajes_borrados (
  texto_notice TEXT
);
*/

----------------------------------------------------------------------
--Creando Triggers

--1. act_duracion_t. Al actualizar un viaje, comprobará que al menos la duración es de 20 segundos. Si no lo es, lo actualizará para que sea ese valor
CREATE OR REPLACE FUNCTION comprobar_duracion() 
RETURNS trigger AS
$$
BEGIN
  IF NEW.duration < 20
  THEN NEW.duration :=20;
  END IF;
  RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER act_duracion_t
BEFORE INSERT ON trips
FOR EACH ROW
EXECUTE FUNCTION comprobar_duracion();

--2. check_municipio_t. Cuando se actualice el municipio de una estación, garantizará que sea de un municipio que esté previamente en la tabla. En el caso de que no exista ese municipio previamente no se aceptarán municipios nuevos.
CREATE OR REPLACE FUNCTION existe_ciudad() RETURNS trigger AS
$$
BEGIN
SELECT EXISTS (
        SELECT 1 FROM stations WHERE municipality = NEW.municipality
    ) INTO FOUND;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'No existe este municipio.';
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER check_municipio_t
BEFORE UPDATE ON stations
FOR EACH ROW
EXECUTE FUNCTION existe_ciudad();



