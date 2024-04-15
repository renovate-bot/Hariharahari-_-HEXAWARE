CREATE DATABASE TECHSHOP1;
----- Task 1
CREATE TABLE Customers (
    Cous_ID INT PRIMARY KEY,
    First_name VARCHAR(20),
    Last_name VARCHAR(20),
    Email VARCHAR(20),
    Phone INT,
    Address VARCHAR(40)
);

INSERT INTO Customers (Cous_ID, First_name, Last_name, Email, Phone, Address)
VALUES
(1, 'Aravind', 'Kumar', 'aravind@example.com', 12345678, '123 Street, City'),
(2, 'Deepika', 'Sundaram', 'deepika@example.com', 23478901, '456 Road, Town'),
(3, 'Ganesh', 'Mani', 'ganesh@example.com', 34567892, '789 Avenue, Village'),
(4, 'Harini', 'Venkatesan', 'harini@example.com', 45670123, '321 Lane, Suburb'),
(5, 'Ishaan', 'Senthil', 'ishaan@example.com', 56789234, '654 Boulevard, District'),
(6, 'Janani', 'Raj', 'janani@example.com', 67890345, '987 Alley, County'),
(7, 'Karthik', 'Chandrasekhar', 'karthik@example.com', 78903456, '147 Drive, State'),
(8, 'Lakshmi', 'Balaji', 'lakshmi@example.com', 89012567, '258 Court, Province'),
(9, 'Mukesh', 'Krishnan', 'mukesh@example.com', 90145678, '369 Park, Territory'),
(10, 'Nisha', 'Suresh', 'nisha@example.com', 12348765, '852 Garden, Region');

-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Description VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- Insert sample data into Products table
INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
(1, 'Laptop', 'High-performance laptop with SSD storage', 40000),
(2, 'Smartphone', 'Latest smartphone with advanced camera features', 8000),
(3, 'Tablet', 'Portable tablet with long battery life', 5000),
(4, 'Headphones', 'Wireless headphones with noise-canceling technology', 150),
(5, 'Smartwatch', 'Fitness tracker and smartwatch with heart rate monitor', 2000),
(6, 'Bluetooth Speaker', 'Portable speaker with built-in Bluetooth connectivity', 1000),
(7, 'Gaming Console', 'Next-generation gaming console with 4K graphics', 4000),
(8, 'Camera', 'High-resolution camera with interchangeable lenses', 60000),
(9, 'Printer', 'All-in-one printer with wireless printing capabilities', 10000),
(10, 'External Hard Drive', 'External storage device for backing up files', 800);


-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(Cous_ID)
);

-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1, 1, '2024-04-01', 45000),
(2, 2, '2024-04-02', 10000),
(3, 3, '2024-04-03', 60000),
(4, 4, '2024-04-04', 1200),
(5, 5, '2024-04-05', 4000),
(6, 6, '2024-04-06', 3000),
(7, 7, '2024-04-07', 8000),
(8, 8, '2024-04-08', 12000),
(9, 9, '2024-04-09', 20000),
(10, 10, '2024-04-10', 1600),
(11, 1, '2024-04-11', 32000),
(12, 2, '2024-04-12', 6000),
(13, 3, '2024-04-13', 70000),
(14, 4, '2024-04-14', 1400),
(15, 5, '2024-04-15', 5000),
(16, 6, '2024-04-16', 3500),
(17, 7, '2024-04-17', 10000),
(18, 8, '2024-04-18', 15000),
(19, 9, '2024-04-19', 25000),
(20, 10, '2024-04-20', 2000);


-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data into OrderDetails table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 6),
(7, 7, 7, 7),
(8, 8, 8, 8),
(9, 9, 9, 9),
(10, 10, 10, 10),
(11, 11, 1, 2),
(12, 12, 2, 3),
(13, 13, 3, 4),
(14, 14, 4, 5),
(15, 15, 5, 6),
(16, 16, 6, 7),
(17, 17, 7, 8),
(18, 18, 8, 9),
(19, 19, 9, 10),
(20, 20, 10, 1);


-- Create Inventory table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data into Inventory table
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
(1, 1, 100, '2024-04-01'),
(2, 2, 150, '2024-04-02'),
(3, 3, 200, '2024-04-03'),
(4, 4, 300, '2024-04-04'),
(5, 5, 250, '2024-04-05'),
(6, 6, 180, '2024-04-06'),
(7, 7, 120, '2024-04-07'),
(8, 8, 90, '2024-04-08'),
(9, 9, 80, '2024-04-09'),
(10, 10, 220, '2024-04-10');

ALTER TABLE Products
ADD Category VARCHAR(20);

UPDATE Products
SET Category = 
    CASE 
        WHEN ProductID IN (1,3,5,6,7,9) THEN 'Digital'
        WHEN ProductID IN (2,4,6,8,10) THEN 'Electronics'
        ELSE 'Other'
    END;


SELECT * FROM Products;

----TASK - 2
---Retrieve the names and emails of all customers:
SELECT First_name, Last_name, Email FROM Customers;

--List all orders with their order dates and corresponding customer names:
SELECT Orders.OrderID, Orders.OrderDate, Customers.First_name, Customers.Last_name FROM Orders JOIN Customers ON Orders.CustomerID = Customers.Cous_ID;

--Insert a new customer record into the "Customers" table:
INSERT INTO Customers (Cous_ID, First_name, Last_name, Email,Phone, Address) VALUES (11,'Ravi', 'Kumar', 'Ravi@example.com',983425, '123 Main St');

--Update the prices of all electronic gadgets in the "Products" table by increasing them by 10%:
UPDATE Products SET Price = Price * 1.10;

---Delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables:
DELETE FROM OrderDetails WHERE OrderID = 19; DELETE FROM Orders WHERE OrderID = 19;

--Insert a new order into the "Orders" table:
INSERT INTO Orders (OrderID,CustomerID, OrderDate,TotalAmount) VALUES (21,1, '2024-04-15',40000);

--Update the contact information of a specific customer in the "Customers" table:
UPDATE Customers
SET Email = 'newemail@example.com', Address = '456 Oak St'
WHERE Cous_ID = [CustomerID];

--Recalculate and update the total cost of each order in the "Orders" table:
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(Orderdetails.Quantity * Products.Price) 
    FROM OrderDetails 
    WHERE OrderDetails.OrderID = Orders.OrderID
);
---- need to change

--Insert a new electronic gadget product into the "Products" table:
INSERT INTO Products (ProductID,ProductName, Description, Price) VALUES (11,'LED TV', 'Latest LED TV with advanced features', 10000);

--Update the status of a specific order in the "Orders" table:
UPDATE Orders SET Status = 'Shipped' WHERE OrderID = [OrderID];

--Calculate and update the number of orders placed by each customer in the "Customers" table:
UPDATE Customers
SET NumOrders = (
    SELECT COUNT(*) 
    FROM Orders 
    WHERE Orders.CustomerID = Customers.Cous_ID
);

------TASK - 3;
--Retrieve a list of all orders along with customer information:
SELECT Orders.OrderID, Orders.OrderDate, Customers.First_name, Customers.Last_name, Customers.Email, Customers.Phone FROM Orders JOIN Customers ON Orders.CustomerID = Customers.Cous_ID;

--Find the total revenue generated by each electronic gadget product:
SELECT Products.ProductName, SUM(Products.Price * OrderDetails.Quantity) AS TotalRevenue FROM Products JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID GROUP BY Products.ProductName;

--List all customers who have made at least one purchase:
SELECT First_name, Last_name, Email, Phone FROM Customers WHERE Cous_ID IN (SELECT DISTINCT CustomerID FROM Orders);

--Find the most popular electronic gadget:
SELECT Products.ProductName, SUM(OrderDetails.Quantity) AS TotalQuantityOrdered FROM Products JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY Products.ProductName
ORDER BY TotalQuantityOrdered DESC;

--Calculate the average order value for each customer:
SELECT Customers.First_name, Customers.Last_name, AVG(Orders.TotalAmount) AS AverageOrderValue
FROM Customers
JOIN Orders ON Customers.Cous_ID = Orders.CustomerID
GROUP BY Orders.OrderID, Customers.First_name, Customers.Last_name;

--List electronic gadgets and the number of times each product has been ordered:
SELECT Products.ProductName, COUNT(OrderDetails.OrderID) AS NumOrders
FROM Products
LEFT JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY Products.ProductName;

--Find customers who have purchased a specific electronic gadget product:
SELECT Customers.First_name, Customers.Last_name, Customers.Email, Customers.Phone FROM Customers JOIN Orders ON Customers.Cous_ID = Orders.CustomerID JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.ProductName = 'Camera';

--Calculate the total revenue generated by all orders placed within a specific time period:

SELECT SUM(Orders.TotalAmount) AS TotalRevenue
FROM Orders
WHERE Orders.OrderDate BETWEEN 'start_date' AND 'end_date';

--TASK 4 --

--Find out which customers have not placed any orders:

SELECT First_name, Last_name FROM Customers WHERE Cous_ID NOT IN (SELECT DISTINCT CustomerID FROM Orders);

--Find the total number of products available for sale:
SELECT (SELECT COUNT(ProductID) FROM Products) AS TotalProducts;

--Calculate the average quantity ordered for products in a specific category:
SELECT AVG(Quantity) AS AverageQuantityOrdered
FROM OrderDetails
WHERE ProductID IN (SELECT ProductID FROM Products WHERE Category = 'YourCategory');

--Calculate the total revenue generated by a specific customer:
DECLARE @CustomerID INT = 1;
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE CustomerID = (SELECT Cous_ID FROM Customers WHERE Cous_ID = @CustomerID);


--Find the customers who have placed the most orders:
SELECT First_name, Last_name, OrderCount FROM ( SELECT Customers.Cous_ID, First_name, Last_name, COUNT(*) AS OrderCount FROM Customers JOIN Orders ON Customers.Cous_ID = Orders.CustomerID GROUP BY Customers.Cous_ID, First_name, Last_name ) AS CustomerOrderCounts
WHERE OrderCount = (SELECT MAX(OrderCount) FROM (SELECT COUNT(*) AS OrderCount FROM Orders GROUP BY CustomerID) AS MaxOrderCounts); 


--Find the most popular product category:
SELECT TOP 1 category FROM Products WHERE ProductID IN (SELECT Productid FROM OrderDetails GROUP BY ProductID );


--Find the customer who has spent the most money on electronic gadgets:
SELECT TOP 1 Customers.First_name,Customers.Last_name,(SELECT SUM(Orders.TotalAmount) FROM Orders WHERE Orders.CustomerID = Customers.Cous_ID) AS TotalSpending FROM Customers 
WHERE Customers.Cous_ID IN (SELECT DISTINCT Orders.CustomerID FROM OrderDetails INNER JOIN Orders ON OrderDetails.Orderid = Orders.Orderid INNER JOIN Products ON OrderDetails.Productid = Products.Productid
WHERE Products.Category = 'Electronic') ORDER BY TotalSpending DESC;


--Calculate the average order value for all customers:
SELECT AVG(TotalRevenue / NumberOfOrders) AS AverageOrderValue FROM (SELECT SUM(Orders.Totalamount) AS TotalRevenue, COUNT(*) AS NumberOfOrders FROM Orders GROUP BY Orders.CustomerID) AS OrderSummary;


--Find the total number of orders placed by each customer and list their names along with the order count:
SELECT Customers.First_name,Customers.Last_name,(SELECT COUNT(*) FROM Orders WHERE Orders.CustomerID = Customers.Cous_ID) AS OrderCount FROM Customers;



   