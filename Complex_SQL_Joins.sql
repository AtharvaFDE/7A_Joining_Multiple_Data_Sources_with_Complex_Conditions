CREATE DATABASE IF NOT EXISTS sales_database;

USE sales_database;

CREATE TABLE IF NOT EXISTS Customers (
	customer_id INT,
    customer_name VARCHAR(100),
    region VARCHAR(50),
    city VARCHAR(50),
    CONSTRAINT pk_customer_id PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS Products (
	product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    CONSTRAINT pk_product_id PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS Sales (
	sale_id INT,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_amount DECIMAL(10,2),
    sale_date DATE,
    CONSTRAINT FOREIGN KEY (customer_id) REFERENCES
    Customers(customer_id),
    CONSTRAINT FOREIGN KEY (product_id) REFERENCES
    Products(product_id)
);


-- Insert Customers
INSERT INTO Customers VALUES
(1, 'Atharva', 'West', 'Mumbai'),
(2, 'Rahul', 'North', 'Delhi'),
(3, 'Priya', 'South', 'Bangalore'),
(4, 'Sneha', 'East', 'Kolkata'),
(5, 'Amit', 'West', 'Pune');

-- Insert Products
INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 50000),
(102, 'Mobile', 'Electronics', 20000),
(103, 'Chair', 'Furniture', 5000),
(104, 'Table', 'Furniture', 10000),
(105, 'Headphones', 'Accessories', 2000);

-- Insert Sales
INSERT INTO Sales VALUES
(1001, 1, 101, 2, 100000, '2026-01-10'),
(1002, 2, 102, 3, 60000, '2026-01-15'),
(1003, 3, 103, 4, 20000, '2026-02-05'),
(1004, 4, 104, 2, 20000, '2026-02-10'),
(1005, 5, 105, 5, 10000, '2026-03-01'),
(1006, 1, 102, 1, 20000, '2026-03-05'),
(1007, 2, 101, 1, 50000, '2026-03-10'),
(1008, 3, 105, 3, 6000, '2026-03-15');

SELECT * FROM Customers;
SELECT * FROM Sales;
SELECT * FROM Products;
-- Join Sales with Products and Customers

-- Task 1: INNER JOIN

SELECT
	s.sale_id,
    c.customer_name,
    c.region,
    p.product_name,
    p.category,
    s.quantity,
    s.sale_amount,
    s.sale_date
FROM
	Sales s 
INNER JOIN Customers c
ON	s.customer_id = c.customer_id
INNER JOIN
	Products p
ON s.product_id = p.product_id;


-- Task 2: LEFT JOIN

-- A LEFT JOIN returns all customers, including customers who have not purchased anything.

SELECT
	c.customer_id,
    c.customer_name,
    c.region,
    s.sale_id,
    s.sale_amount
FROM
	Customers c
INNER JOIN
	Sales s
ON
	c.customer_id = s.customer_id;
    
-- Task 3: RIGHT JOIN
-- A RIGHT JOIN returns all products, including products that have never been sold.
    
SELECT
	p.product_id,
    p.product_name,
    p.category,
    s.sale_id,
    s.quantity,
    s.sale_amount
FROM 
	Sales s
RIGHT JOIN 
	Products p
ON s.product_id = p.product_id;


-- Apply complex filtering conditions

-- Sales amount must be greater than ₹10,000.
-- Quantity must be greater than or equal to 2.
-- Only Electronics and Furniture products.
-- Only West and North regions.
-- Sales must be between January and March 2026.


SELECT
	s.sale_id,
    c.customer_name,
    c.region,
    p.product_name,
    p.category,
    s.quantity,
    s.sale_amount,
    s.sale_date
FROM
	Sales s
INNER JOIN 
	Customers c
ON
	s.customer_id = c.customer_id
INNER JOIN
	Products p
ON 
	s.product_id = p.product_id
WHERE
	s.sale_amount > 10000
AND
	s.quantity >= 2
AND
	p.category IN ("Electronics","Furniture")
AND
	c.region IN ('WEST','NORTH')
AND
	s.sale_date BETWEEN '2026-01-01' AND 
						'2026-03-31'
ORDER BY s.sale_amount DESC;


-- Aggregate sales results

-- calculate total sales by region, product, and customer.


SELECT
	c.region,
    SUM(s.sale_amount) AS total_sales,
    COUNT(s.sale_id) AS total_orders
FROM
	Sales s
INNER JOIN
	Customers c
ON
	s.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_sales DESC;

-- Total sales by product

SELECT
	p.product_name,
    p.category,
    SUM(s.quantity) AS total_quantity,
    SUM(s.sale_amount) AS total_sales
FROM
	Sales s
INNER JOIN
	Products p
ON
	s.product_id = p.product_id
GROUP BY p.product_id , p.product_name , p.category
ORDER BY total_sales DESC;

-- Total sales by customer

SELECT
	c.customer_name,
    c.region,
    COUNT(s.sale_id) AS total_orders,
    SUM(s.sale_amount) AS total_sales
FROM
	Customers c
INNER JOIN
	Sales s 
ON
	c.customer_id = s.customer_id
GROUP BY c.customer_id , c.customer_name , c.region
ORDER BY total_sales DESC;


-- classifying customers based on their purchasing behavior.

SELECT
	c.customer_name,
    c.region,
    SUM(s.sale_amount) AS total_sales,
    
    CASE
		WHEN SUM(s.sale_amount) >= 100000
			THEN 'Premium Customer'
		WHEN SUM(s.sale_amount) >= 50000
			THEN 'Regular Customer'
		ELSE "Basic Customer"
    END AS customer_segment
FROM
	Customers c
INNER JOIN
	Sales s
ON
	c.customer_id = s.customer_id
GROUP BY
	c.customer_id,
    c.customer_name,
    c.region
ORDER BY 
	total_sales DESC;

