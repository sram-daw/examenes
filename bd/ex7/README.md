# Examen: Programando el SGBDR
Vinculado al tema https://www.apuntesinformaticafp.com/cursos/programando_sgbd.html

## Usando funciones nativas en Postgres. 20p
Me adjuntas el código directamente para ejecutar en consola. Por ejemplo si te digo que me digas cuanto es 4 más 5, responderías SELECT 4 + 5;

Dime qué funciones podrían resolverme estos problemas:

1. Quiero crear un número aleatorio entre el 5 y el 30

2. ¿Cuanto es 4 elevado a 5?

3. Crea la secuencia seq_01 que sea de números enteros, y que salte de 2 en 2
4. ¿Cómo sabes cual es el valor actual de la secuencia? ¿Y el siguiente?
5. ¿Qué sentencia tienes que construir para obtener “2001-07-27 12:00”,
6. usando un intervalo de 3 días?
7. ¿Cuantas horas son desde las 07:30 a as 08:45? (usando time, claro)
8. ¿Cuales son los segundos, de la fecha 2001-02-16 20:38:40?
9. ¿Como concatenas, usando un operador, el valor “Hola, me llamo” y el nombre “Pepe”?
10. ¿Cómo harías para quitar las o’s y las e’s de “Hola soy Pepe”?

## Creando funciones (en SQL). 30p
Implementa las siguientes funciones:

1. suma(n1,n2,n3). Crea una función que sume los dos primeros argumentos, y lo multiplique por un tercero. Los argumentos serán enteros.
2. actualizar_bicis(codigo). Sobre la BD Hubway, quiero cambiar todos los valores de los códigos de las bicis que están a null, con un valor que yo quiero escoger. Por ejemplo actualizar_bicis('000000').
3. duracion_viaje(id,tipo). Necesito saber la duración de un viaje, en minutos o en horas, según el parámetro sea M o H. Por ejemplo duracion_viaje(4300,'M')
   

## Creando funciones (en PL/pgSQL). 30p
Sobre la BD de Hubway, implementa las siguientes funciones usando PL/pgPSQL:

1. actualiza_viaje(viaje, factor). Actualizar la duración para un viaje concreto. Es decir la nueva duración será la que tiene multiplicada por factor. Devolverá el número de viajes realizado desde la misma estación de origen
2. contar_viajes_mes(mes, referencia). Devuelve un entero con los viajes que se hicieron en un mes concreto (siendo 1 - enero y 12 - diciembre). Lanzará también un aviso en consola (RAISE NOTICE) clasificándolo en pocos / normal / muchos. El umbral de decisión será de 0,25 el valor de referencia (para pocos), 0,5 para normal y 0,75 muchos
3. borra_y_guarda(id). Crea una función que borre el viaje con ese id. Además guardará en un log (tabla viajes_borrados) un registro del tipo «El usuario $U borró el viaje $V», además el timestamp del borrado


## Creando Triggers. 20p
Sobre la BD Huway, implementa los siguientes disparadores:

1. act_duracion_t. Al actualizar un viaje, comprobará que al menos la duración es de 20 segundos. Si no lo es, lo actualizará para que sea ese valor
2. check_municipio_t. Cuando se actualice el municipio de una estación, garantizará que sea de un municipio que esté previamente en la tabla. En el caso de que no exista ese municipio previamente no se aceptarán municipios nuevos.