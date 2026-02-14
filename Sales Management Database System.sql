/* =========================================================
   1) Show all orders executed by employee Ahmed Ali
   ========================================================= */
SELECT O.*
FROM dbo.Orders O
INNER JOIN dbo.Employees E 
    ON O.EmployeeID = E.EmployeeID
WHERE E.FirstName = 'Ahmed'
  AND E.LastName  = 'Ali';


/* =========================================================
   2) Show all customers who have orders in Riyadh branch
   ========================================================= */
SELECT DISTINCT C.Name
FROM dbo.Customers C
INNER JOIN dbo.Orders O 
    ON C.CustomerID = O.CustomerID
INNER JOIN dbo.Stores S 
    ON O.StoreID = S.StoreID
WHERE S.City = 'Riyadh';


/* =========================================================
   3) Show employees with salary greater than 6000
   ========================================================= */
SELECT EmployeeID,
       FirstName,
       LastName,
       Salary,
       HireDate,
       StoreID,
       ManagerID
FROM dbo.Employees
WHERE Salary > 6000;


/* =========================================================
   4) Insert a new customer (Maha Ali) in Store 1
   ========================================================= */
INSERT INTO dbo.Customers (CustomerID, Name, City, StoreID)
VALUES (51, 'Maha Ali', 'Riyadh', 1);


/* =========================================================
   5) Insert a new order for Customer 10 handled by 
      Employee 5 in Store 2 (today's date)
   ========================================================= */
INSERT INTO dbo.Orders (OrderID, OrderDate, CustomerID, EmployeeID, StoreID)
VALUES (101, GETDATE(), 10, 5, 2);


/* =========================================================
   6) Update salary of Employee ID 3 to 7000
   ========================================================= */
UPDATE dbo.Employees
SET Salary = 7000
WHERE EmployeeID = 3;


/* =========================================================
   7) Update Order Date of Order ID 15 to today
   ========================================================= */
UPDATE dbo.Orders
SET OrderDate = GETDATE()
WHERE OrderID = 15;


/* =========================================================
   8) Count orders per store
   ========================================================= */
SELECT StoreID,
       COUNT(*) AS OrdersCount
FROM dbo.Orders
GROUP BY StoreID;


/* =========================================================
   9) Count orders per employee
   ========================================================= */
SELECT EmployeeID,
       COUNT(*) AS OrdersCount
FROM dbo.Orders
GROUP BY EmployeeID;


/* =========================================================
   10) Total salary per store
   ========================================================= */
SELECT StoreID,
       SUM(Salary) AS TotalSalary
FROM dbo.Employees
GROUP BY StoreID;


/* =========================================================
   11) Count customers per store
   ========================================================= */
SELECT StoreID,
       COUNT(*) AS CustomerCount
FROM dbo.Customers
GROUP BY StoreID;


/* =========================================================
   12) Stored Procedure: Get orders by specific customer
   ========================================================= */
GO
CREATE PROCEDURE dbo.GetOrdersByCustomer
    @CustomerID INT
AS
BEGIN
    SELECT OrderID,
           OrderDate,
           CustomerID,
           EmployeeID,
           StoreID
    FROM dbo.Orders
    WHERE CustomerID = @CustomerID;
END;
GO

EXEC dbo.GetOrdersByCustomer 5;


/* =========================================================
   13) Stored Procedure: Update employee salary
   ========================================================= */
GO
CREATE PROCEDURE dbo.UpdateEmployeeSalary
    @EmployeeID INT,
    @Salary DECIMAL(8,2)
AS
BEGIN
    UPDATE dbo.Employees
    SET Salary = @Salary
    WHERE EmployeeID = @EmployeeID;
END;
GO

EXEC dbo.UpdateEmployeeSalary 
     @EmployeeID = 5, 
     @Salary = 7300;


/* =========================================================
   14) View: Orders with customer and employee names
   ========================================================= */
GO
CREATE VIEW dbo.OrdersWithCustomerEmployee AS
SELECT O.OrderID,
       O.OrderDate,
       C.Name AS CustomerName,
       E.FirstName + ' ' + E.LastName AS EmployeeName
FROM dbo.Orders O
INNER JOIN dbo.Customers C 
    ON O.CustomerID = C.CustomerID
INNER JOIN dbo.Employees E 
    ON O.EmployeeID = E.EmployeeID;
GO

SELECT * FROM dbo.OrdersWithCustomerEmployee;


/* =========================================================
   15) Show stores with more than 10 orders
   ========================================================= */
SELECT StoreID,
       COUNT(*) AS OrdersCount
FROM dbo.Orders
GROUP BY StoreID
HAVING COUNT(*) > 10;


/* =========================================================
   16) Employees who do NOT have any orders
   ========================================================= */
SELECT *
FROM dbo.Employees E
WHERE NOT EXISTS (
    SELECT 1
    FROM dbo.Orders O
    WHERE O.EmployeeID = E.EmployeeID
);


/* =========================================================
   17) Customers with more than two orders
   ========================================================= */
SELECT CustomerID,
       COUNT(*) AS OrdersCount
FROM dbo.Orders
GROUP BY CustomerID
HAVING COUNT(*) > 2;
