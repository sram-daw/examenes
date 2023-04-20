--1. ¿Cual es el producto con el precio mínimo más bajo? (usando subconsultas)
SELECT *
FROM Products
WHERE price = (SELECT min(price) FROM Products);

--2. ¿Cual es el producto cuyo precio sea al menos 10 veces el pedido mínimo (quantity) de los pedidos (OrderDetails)?
SELECT *
FROM Products
WHERE price >= (SELECT min(Quantity) FROM OrderDetails)*10 ORDER BY Price;


--3. ¿Cuales son los registros de productos (Products) cuyo precio (price) sea mayor que el máximo de los precios de los productos cuyo id sea 3, 6, 9 y 10?
SELECT *
FROM Products
WHERE price > (SELECT max(Price) FROM Products WHERE 
ProductID IN(3,6,9,10));


--4. ¿Cuales son los registros de productos (Products) cuyo ProductID sea un valor que esté en Shippers.ShipperID?
SELECT *
FROM Products
WHERE ProductID IN (SELECT ShipperID FROM Shippers);


--5. ¿Qué clientes (Customers) tenemos registrados, que estén en ciudades de nuestros proveedores (Suppliers)?
SELECT *
FROM Customers
WHERE City IN (SELECT City FROM Suppliers);
