use viajes

# creacion de las colecciones

db.viajeros.createIndex({ id_viajero: 1 }, { unique: true });


db.viajes.createIndex({ id_vuelo: 1 }, { unique: true });


db.ciudades.createIndex({ id_ciudad: 1 }, { unique: true });

# insercion de los datos en la coleccion viajeros
db.viajeros.insertOne({
  id_viajero: 1,
  datos_viajero: {
    nombre: "Juan",
    fecha_nacimiento: new Date("1992-05-10"),
    ciudad_origen: "Madrid",
    vuelos_cogidos: [1, 3]
  }
});

db.viajeros.insertOne({
  id_viajero: 2,
  datos_viajero: {
    nombre: "María",
    fecha_nacimiento: new Date("1997-09-25"),
    ciudad_origen: "Barcelona",
    vuelos_cogidos: [2]
  }
});

db.viajeros.insertOne({
  id_viajero: 3,
  datos_viajero: {
    nombre: "Carlos",
    fecha_nacimiento: new Date("1983-12-15"),
    ciudad_origen: "Sevilla",
    vuelos_cogidos: [1, 2]
  }
});

# insercion de los datos de la coleccion viajes
db.viajes.insertOne({
  id_vuelo: 1,
  datos_viaje: {
    id_origen: 1,
    id_destino: 2,
    fecha_salida: "2023-06-10",
    aerolinea: "Air Spain"
  }
});

db.viajes.insertOne({
  id_vuelo: 2,
  datos_viaje: {
    id_origen: 3,
    id_destino: 1,
    fecha_salida: "2023-07-15",
    aerolinea: "Fly Andalusia"
  }
});

db.viajes.insertOne({
  id_vuelo: 3,
  datos_viaje: {
    id_origen: 2,
    id_destino: 1,
    fecha_salida: "2023-08-20",
    aerolinea: "Mediterranean Airlines"
  }
});

# insercion de los datos de la coleccion ciudades
db.ciudades.insertOne({
  id_ciudad: 1,
  detalles_ciudades: {
    nombre: "Madrid",
    poblacion: 3.3,
    pais: "España",
    descripcion: "Capital de España y centro cultural con una rica historia y diversos puntos de interés."
  }
});

db.ciudades.insertOne({
  id_ciudad: 2,
  detalles_ciudades: {
    nombre: "Barcelona",
    poblacion: 1.6,
    pais: "España",
    descripcion: "Ciudad costera con arquitectura modernista y una animada vida nocturna."
  }
});

db.ciudades.insertOne({
  id_ciudad: 3,
  detalles_ciudades: {
    nombre: "Sevilla",
    poblacion: 0.7,
    pais: "España",
    descripcion: "Ciudad con herencia árabe y flamenco, famosa por su catedral y la Giralda."
  }
});




