--TASK 1
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    DOB DATE,
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(255)
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    balance DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(50),
    amount DECIMAL(10, 2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
drop table Transactions;

--TASK 2
--1
INSERT INTO Customers (customer_id, first_name, last_name, DOB, email, phone_number, address) VALUES
(1, 'Rajesh', 'Kumar', '1990-05-15', 'rajeshkumar@example.com', '1234567890', '123 Main Street, Chennai'),
(2, 'Priya', 'Sundaram', '1985-08-22', 'priyasundaram@example.com', '2345678901', '456 Park Avenue, Madurai'),
(3, 'Manoj', 'Venkatesh', '1982-11-10', 'manojvenkatesh@example.com', '3456789012', '789 Elm Street, Coimbatore'),
(4, 'Deepa', 'Natarajan', '1995-03-03', 'deepanatarajan@example.com', '4567890123', '101 Oak Lane, Salem'),
(5, 'Aravind', 'Ganesan', '1988-07-18', 'aravindganesan@example.com', '5678901234', '202 Maple Drive, Trichy'),
(6, 'Sangeetha', 'Rajagopal', '1992-09-25', 'sangeetharajagopal@example.com', '6789012345', '303 Cedar Street, Thanjavur'),
(7, 'Vijay', 'Balaji', '1980-01-30', 'vijaybalaji@example.com', '7890123456', '404 Pine Avenue, Tirunelveli'),
(8, 'Lakshmi', 'Subramanian', '1983-04-12', 'lakshmisubramanian@example.com', '8901234567', '505 Birch Road, Vellore'),
(9, 'Karthik', 'Chandrasekaran', '1993-06-07', 'karthikchandrasekaran@example.com', '9012345678', '606 Cedar Lane, Erode'),
(10, 'Meera', 'Krishnan', '1987-12-19', 'meerakrishnan@example.com', '0123456789', '707 Elm Drive, Pondicherry');

INSERT INTO Accounts (account_id, customer_id, account_type, balance) VALUES
(1, 1, 'savings', 5000.00),
(2, 2, 'current', 10000.00),
(3, 3, 'savings', 7500.00),
(4, 4, 'zero-balance', 0),
(5, 5, 'savings', 30000.00),
(6, 6, 'current', 15000.00),
(7, 7, 'savings', 1000.00),
(8, 8, 'current', 5000.00),
(9, 9, 'zero-balance',0),
(10, 10, 'current', 8000.00)
(11, 1, 'savings', 500.00),
(12, 2, 'current', 2000.00),
(13, 3, 'zero-balance', 0.00),
(14, 4, 'savings', 1500.00),
(15, 5, 'current', 3000.00),
(16, 6, 'savings', 800.00),
(17, 7, 'zero-balance', 0.00),
(18, 8, 'current', 500.00),
(19, 9, 'savings', 10000.00),
(20, 10, 'zero-balance', 0.00);


INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date) VALUES
(1, 1, 'deposit', 1000.00, '2024-04-01'),
(2, 2, 'withdrawal', 500.00, '2024-04-02'),
(3, 3, 'transfer', 2000.00, '2024-04-03'),
--(4, 4, 'deposit', 150.00, '2024-04-04'),
(5, 5, 'withdrawal', 1000.00, '2024-04-05'),
(6, 6, 'transfer', 300.00, '2024-04-06'),
(7, 7, 'deposit', 500.00, '2024-04-07'),
(8, 8, 'withdrawal', 200.00, '2024-04-08'),
--(9, 9, 'transfer', 700.00, '2024-04-09'),
(10, 10, 'deposit', 1200.00, '2024-04-10');

--2---
--1
SELECT Customers.customer_id,Customers.first_name,Customers.last_name,Customers.email,Accounts.account_type FROM Customers,Accounts WHERE Customers.customer_id = Accounts.customer_id;

--2
SELECT Customers.customer_id,Accounts.account_id,Transactions.transaction_id,Transactions.amount,Transactions.transaction_type FROM Transactions JOIN Accounts ON Transactions.account_id=Accounts.account_id JOIN Customers ON Accounts.customer_id=Customers.customer_id;
--3
UPDATE Accounts
SET balance = balance + 1000
WHERE account_id = 1;
--4
SELECT CONCAT(first_name,' ',last_name) AS Name FROM Customers;
--5
DELETE Accounts WHERE account_type='zero-balance';
--6
SELECT * FROM Customers WHERE address LIKE '%Chennai%';
--7
SELECT balance FROM Accounts WHERE account_id= 1;
--8
SELECT * FROM Accounts WHERE account_type='current' AND balance>1000;
--9
SELECT * FROM Transactions WHERE account_id=1;
--10
DECLARE @interest_rate DECIMAL(5, 2) = 0.05;
SELECT account_id,balance AS current_balance,balance * @interest_rate AS interest_accrued FROM Accounts WHERE account_type = 'savings';

--11
DECLARE @overdraft_limit DECIMAL(10, 2) = 1000.00;
SELECT account_id,balance FROM Accounts WHERE balance < @overdraft_limit;

--12
SELECT * FROM Customers WHERE address NOT LIKE '%Chennai%';

--TASK 3
--1
SELECT AVG(Balance) AS AVERAGEBALANCE FROM Accounts;
--2
SELECT TOP 10 account_id, balance FROM Accounts ORDER BY balance DESC;
--3
SELECT SUM(amount) AS total_deposits FROM Transactions WHERE transaction_type = 'deposit'AND transaction_date = '2024-04-06';
--4
SELECT MIN(DOB) AS oldest_customer,MAX(DOB) AS newest_customer FROM Customers;
--5
SELECT Accounts.account_type,Transactions.transaction_id,Transactions.amount FROM Transactions JOIN Accounts ON Transactions.account_id=Accounts.account_id;
--6
SELECT Customers.customer_id,Customers.first_name,Customers.last_name,Accounts.account_id,Accounts.account_type,Accounts.balance FROM Customers INNER JOIN Accounts ON Accounts.customer_id=Customers.customer_id;
--7