/*
=========================================
 Project: SQL Customer Analysis
 Author: Dipali Pathal
 Description:
 Complete SQL script for customer and order analysis
=========================================
*/

--------------------------------------------------
-- DROP TABLES (for rerun)
--------------------------------------------------
IF OBJECT_ID('orders', 'U') IS NOT NULL
    DROP TABLE orders;

IF OBJECT_ID('customers', 'U') IS NOT NULL
    DROP TABLE customers;

--------------------------------------------------
-- CREATE TABLES
--------------------------------------------------
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

--------------------------------------------------
-- INSERT SAMPLE DATA
--------------------------------------------------
INSERT INTO customers (id, name, city, email)
VALUES
(1, 'Ankit', 'Delhi', 'ankit@gmail.com'),
(2, 'Rahul', 'Mumbai', 'rahul@gmail.com'),
(3, 'Priya', 'Bangalore', 'priya@gmail.com'),
(4, 'Neha', 'Delhi', 'neha@gmail.com'),
(5, 'Amit', 'Pune', 'amit@gmail.com');

INSERT INTO orders (order_id, customer_id, order_amount, order_date)
VALUES
(101, 1, 5000.00, '2025-03-01'),
(102, 2, 7500.00, '2025-03-02'),
(103, 1, 3000.00, '2025-03-03'),
(104, 3, 10000.00, '2025-03-04'),
(105, 4, 4500.00, '2025-03-05'),
(106, 5, 9000.00, '2025-03-06'),
(107, 1, 2500.00, '2025-03-07');

--------------------------------------------------
-- BASIC SELECT QUERIES
--------------------------------------------------

-- Get all customers
SELECT * 
FROM customers;

-- Get all orders
SELECT * 
FROM orders;

--------------------------------------------------
-- WHERE CONDITION QUERIES
--------------------------------------------------

-- Customers from Delhi
SELECT *
FROM customers
WHERE city = 'Delhi';

-- Orders greater than 5000
SELECT *
FROM orders
WHERE order_amount > 5000;

--------------------------------------------------
-- GROUP BY QUERIES
--------------------------------------------------

-- Count customers by city
SELECT 
    city,
    COUNT(*) AS total_customers
FROM customers
GROUP BY city;

-- Total revenue by customer
SELECT 
    customer_id,
    SUM(order_amount) AS total_revenue
FROM orders
GROUP BY customer_id;

--------------------------------------------------
-- JOIN QUERIES
--------------------------------------------------

-- Customer order details
SELECT
    c.id,
    c.name,
    c.city,
    o.order_id,
    o.order_amount,
    o.order_date
FROM customers c
INNER JOIN orders o
    ON c.id = o.customer_id;

--------------------------------------------------
-- BUSINESS ANALYSIS QUERIES
--------------------------------------------------

-- Top customer by total purchase
SELECT
    c.name,
    SUM(o.order_amount) AS total_purchase
FROM customers c
JOIN orders o
    ON c.id = o.customer_id
GROUP BY c.name
ORDER BY total_purchase DESC;

-- City wise revenue
SELECT
    c.city,
    SUM(o.order_amount) AS city_revenue
FROM customers c
JOIN orders o
    ON c.id = o.customer_id
GROUP BY c.city
ORDER BY city_revenue DESC;

-- Customers having more than one order
SELECT
    c.name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.id = o.customer_id
GROUP BY c.name
HAVING COUNT(o.order_id) > 1;

--------------------------------------------------

--------------------------------------------------

-- Average order amount
SELECT
    AVG(order_amount) AS avg_order_value
FROM orders;

-- Highest order amount
SELECT
    MAX(order_amount) AS highest_order
FROM orders;

-- Lowest order amount
SELECT
    MIN(order_amount) AS lowest_order
FROM orders;
