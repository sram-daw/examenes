--1. Revisa las tablas Customers (clientes), Employees (empleados) y Orders (pedidos)
SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Orders;

--2. ¿Cuántos clientes hay registrados?
SELECT COUNT(CustomerID) FROM Customers;

--3. ¿Cuántos pedidos?
SELECT COUNT(OrderID) FROM Orders;

--4. ¿Qué clientes viven en Londes y su nombre (CustomerName) empieza por A?
SELECT CustomerName, City FROM Customers WHERE City='London' AND CustomerName LIKE 'A%';

--5. ¿Cuántos clientes hay que son de Londres?
SELECT COUNT(CustomerID) FROM Customers WHERE City='London';

--6. ¿Cuántos clientes hay en cada ciudad?
SELECT COUNT(CustomerID) AS Cuantos_Clientes, City FROM Customers GROUP BY City ORDER BY Cuantos_Clientes DESC;

--7. ¿Cuántos empleados nacieron después de 1 de Junio del 1965?
SELECT COUNT(EmployeeID) FROM Employees WHERE BirthDate >1965-06-01;

--8. Hazme un informe que diga «El empleado N nación el N», siendo N, nombre (FirstName y Last Name) y día de nacimiento (BirthDate).
SELECT ('El empleado ' || FirstName||' '|| LastName ||' nació el '||BirthDate) as Informe FROM Employees;

--9. Hazme el informe anterior, pero sólo para los empleados con id 8, 7, 3 y 10.
SELECT ('El empleado ' || FirstName||' '|| LastName ||' nació el '||BirthDate) as Informe FROM Employees WHERE EmployeeID IN (8, 7, 3, 10);

--10. Dime los paises que tengan más de 5 clientes, ordenados por el nombre de país.
SELECT COUNT(CustomerID) AS N_Clientes, Country FROM Customers GROUP BY Country HAVING N_Clientes>5;