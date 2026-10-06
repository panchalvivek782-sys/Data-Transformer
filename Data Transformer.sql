CREATE DATABASE DataTransformer;
USE DataTransformer;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, RegistrationDate) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2023-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2023-02-20');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, HireDate, Salary) VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00);

SELECT o.*, c.*
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

SELECT c.*, o.*
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;




SELECT c.*, o.*
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.*, o.*
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT DISTINCT c.*
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (SELECT AVG(TotalAmount) FROM Orders);

SELECT *
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

SELECT OrderID, YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth
FROM Orders;

SELECT OrderID, OrderDate, DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
FROM Orders;

SELECT OrderID, DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate
FROM Orders;

SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;

SELECT REPLACE(FirstName, 'John', 'Jonathan') AS UpdatedFirstName
FROM Customers;

SELECT UPPER(FirstName) AS UpperFirstName, LOWER(LastName) AS LowerLastName
FROM Customers;

SELECT TRIM(Email) AS CleanedEmail
FROM Customers;

SELECT OrderID, TotalAmount,
       SUM(TotalAmount) OVER (ORDER BY OrderID) AS RunningTotal
FROM Orders;

SELECT OrderID, TotalAmount,
       RANK() OVER (ORDER BY TotalAmount DESC) AS OrderRank
FROM Orders;

SELECT OrderID, TotalAmount,
       CASE 
           WHEN TotalAmount > 1000 THEN TotalAmount * 0.10
           WHEN TotalAmount > 500 THEN TotalAmount * 0.05
           ELSE 0
       END AS DiscountAmount
FROM Orders;

SELECT EmployeeID, FirstName, LastName, Salary,
       CASE 
           WHEN Salary >= 60000 THEN 'high'
           WHEN Salary >= 40000 THEN 'medium'
           ELSE 'low'
       END AS SalaryCategory
FROM Employees;