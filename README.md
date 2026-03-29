# SQL Customer Analysis

This project contains basic SQL queries used for analyzing customer data.

## Topics Covered
- SELECT queries
- WHERE conditions
- GROUP BY
- JOIN operations

## Sample Queries

-- Get all customers
SELECT * FROM customers;

-- Count customers by city
SELECT city, COUNT(*) 
FROM customers
GROUP BY city;

-- Join example
SELECT c.name, o.order_amount
FROM customers c
JOIN orders o ON c.id = o.customer_id;
