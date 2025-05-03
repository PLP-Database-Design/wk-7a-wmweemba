-- Question 1. We ensure 1NF by seperating each product type into its own row.

-- First we create the table.
CREATE TABLE ProductDetail (
    OrderID INT NOT NULL,
    CustomerName VARCHAR(255) NOT NULL,
    Product VARCHAR(255) NOT NULL
);

-- Then we insert the data into the table maintaining 1NF.
INSERT INTO ProductDetail (OrderID, CustomerName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');



-- Question 2. We ensure 2NF by removing partial dependencies.
-- We create two tables: one for customer details and another for order details to acheive 2NF.


-- Create the Customer table
CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL
);

-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    OrderID INT NOT NULL,
    CustomerID INT NOT NULL,
    Product VARCHAR(255) NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Insert data into the Customer table
INSERT INTO Customer (CustomerName)
VALUES
    ('John Doe'),
    ('Jane Smith'),
    ('Emily Clark');

-- Insert data into the OrderDetails table
INSERT INTO OrderDetails (OrderID, CustomerID, Product, Quantity)
VALUES
    (101, 1, 'Laptop', 2),
    (101, 1, 'Mouse', 1),
    (102, 2, 'Tablet', 3),
    (102, 2, 'Keyboard', 1),
    (102, 2, 'Mouse', 2),
    (103, 3, 'Phone', 1);