CREATE DATABASE online_store;

USE online_store;

CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(50) NOT NULL UNIQUE,
    Description VARCHAR(100)
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50) NOT NULL UNIQUE,
    Category_ID INT NOT NULL,
    Price DECIMAL(10,2) CHECK (Price > 0),
    Stock_Quantity INT CHECK (Stock_Quantity >= 0),
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

INSERT INTO Category VALUES
(1, 'Mobiles', 'Mobile phones'),
(2, 'Laptops', 'Laptop computers'),
(3, 'Clothes', 'Fashion clothes'),
(4, 'Cosmetics', 'Beauty products'),
(5, 'Stationery', 'Study products');

INSERT INTO Product VALUES
(1, 'Samsung Phone', 1, 18000, 20),
(2, 'Redmi Phone', 1, 15000, 25),
(3, 'Vivo Phone', 1, 20000, 15),
(4, 'HP Laptop', 2, 45000, 10),
(5, 'Dell Laptop', 2, 55000, 8),
(6, 'Cotton Shirt', 3, 800, 30),
(7, 'Denim Jeans', 3, 1500, 20),
(8, 'Face Cream', 4, 600, 25),
(9, 'Lip Balm', 4, 300, 40),
(10, 'Notebook', 5, 100, 50);

SELECT * FROM Category;

SELECT * FROM Product;

INSERT INTO Product
VALUES (11, 'Realme Phone', 1, 16000, 20);

UPDATE Product
SET Price = 17000
WHERE Product_ID = 2;

UPDATE Product
SET Stock_Quantity = 30
WHERE Product_ID = 6;

DELETE FROM Product
WHERE Product_ID = 9;

SELECT c.Category_Name, p.Product_Name, p.Price
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID;

SELECT c.Category_Name, COUNT(p.Product_ID) AS Total_Products
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_Name;

SELECT c.Category_Name, MAX(p.Price) AS Highest_Price
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_Name;

SELECT c.Category_Name, AVG(p.Price) AS Average_Price
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_Name;

SELECT c.Category_Name, COUNT(p.Product_ID) AS Total_Products
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_Name
HAVING COUNT(p.Product_ID) > 5;

select * FROM Product;