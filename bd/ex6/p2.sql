--1. Dime el nombre del cliente del pedido 10360
SELECT Customers.CustomerName, Orders.OrderID 
FROM Customers
INNER JOIN Orders ON Customers.CustomerID=Orders.CustomerID 
WHERE Orders.OrderID=10360;


--2. Dime el nombre completo de los clientes con los pedidos 10360, 10253 y 10440
SELECT Customers.CustomerName, Orders.OrderID 
FROM Customers 
INNER JOIN Orders ON Customers.CustomerID=Orders.CustomerID 
WHERE Orders.OrderID IN (10360, 10253, 10440);


--3. Dime las ciudades y número de pedidos de clientes en esa ciudad
SELECT Customers.City, COUNT(Orders.OrderID) 
FROM Customers 
INNER JOIN Orders ON Customers.CustomerID=Orders.CustomerID 
GROUP BY Customers.City;


--4. ¿Cuales son las ciudades desde las que hay más de 7 pedidos?
SELECT Customers.City, COUNT(Orders.OrderID) 
FROM Customers 
INNER JOIN Orders ON Customers.CustomerID=Orders.CustomerID 
GROUP BY Customers.City 
HAVING COUNT(Orders.OrderID)>7;


--5.¿Cuales son los tres países desde los que tengo más pedidos?
SELECT Customers.City, COUNT(Orders.OrderID) 
FROM Customers 
INNER JOIN Orders ON Customers.CustomerID=Orders.CustomerID 
GROUP BY Customers.City 
ORDER BY COUNT(Orders.OrderID) DESC LIMIT 3;


--6. Necesito un informe con el Nombre completo de los Empleados y el número de pedidos que registraron
SELECT Employees.FirstName, Employees.LastName,
COUNT(Orders.EmployeeID) as Num_Pedidos_Registrados 
FROM Employees 
INNER JOIN Orders ON Orders.EmployeeID=Employees.EmployeeID 
GROUP BY Employees.FirstName;


--7. En el informe anterior, sólo necesito los empleados cuyo nombre comience por M
SELECT Employees.FirstName, Employees.LastName, COUNT(Orders.EmployeeID) as Num_Pedidos_Registrados 
FROM Employees 
INNER JOIN Orders ON Orders.EmployeeID=Employees.EmployeeID 
WHERE Employees.FirstName LIKE 'M%' 
GROUP BY Employees.FirstName;

--8. Quiero saber el número de pedido, qué empleado (sólo el nombre) lo registró y el cliente.
SELECT Orders.OrderID, Employees.FirstName as Empleado, Customers.CustomerName as Cliente 
FROM Employees 
INNER JOIN Orders ON Orders.EmployeeID=Employees.EmployeeID
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID
GROUP BY Employees.FirstName, Customers.CustomerName;


--9. ¿Hay algún cliente que haya hecho más de un pedido registrado por el mismo empleado?
SELECT COUNT(Orders.OrderID) as Cuantos_pedidos, Employees.FirstName as Empleado, Customers.CustomerName as Cliente 
FROM Employees 
INNER JOIN Orders ON Orders.EmployeeID=Employees.EmployeeID
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID
GROUP BY Customers.CustomerName, Employees.FirstName
HAVING COUNT(Orders.OrderID)>1;


--10. Quiero saber los clientes que hayan hecho más de un pedido y que hayan sido registrado por un Empleado cuyo nombre sea Margaret.
SELECT COUNT(Orders.OrderID) as Cuantos_pedidos, Employees.FirstName as Empleado, Customers.CustomerName as Cliente 
FROM Employees 
INNER JOIN Orders ON Orders.EmployeeID=Employees.EmployeeID
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID
WHERE Employees.FirstName LIKE 'Margaret'
GROUP BY Customers.CustomerName, Employees.FirstName
HAVING COUNT(Orders.OrderID)>1;
