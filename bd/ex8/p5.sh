# Agregación y Pipelines

# previamente: use sample_supplies. Nota: la única colección que hay en esta bd es "sales", no "supplies".

# 1. Muéstrame 3 pedidos (supplies) de la BD.
db.sales.find().limit(3);

# 2. Muéstrame el promedio de edad de los clientes (customer) agrupado por tienda (storeLocation)
db.sales.aggregate([{ $group: { _id: "$storeLocation", averageAge: { $avg: "$customer.age" } } }]);

# 3. ¿Cuántos clientes mujeres de más de 40 años han hecho pedidos en nuestra tienda?
db.sales.countDocuments({ "customer.gender": "F", "customer.age": { $gt: 40 } });

# 4. Muéstrame la tienda, el email del cliente y su edad, de los 5 pedidos con mejor valoración (satisfaction) de los clientes (customer)
db.sales.find().sort({ "customer.satisfaction": -1 }).limit(5).forEach(function(doc) { print("Tienda: " + doc.storeLocation); print("Email del cliente: " + doc.customer.email); print("Edad del cliente: " + doc.customer.age); print("Valoración: " + doc.customer.satisfaction); print("================")});