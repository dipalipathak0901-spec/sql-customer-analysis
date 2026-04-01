-- Get all customers
SELECT * FROM customers;

-- Customers from Delhi
SELECT *
FROM customers
WHERE city = 'Delhi';

-- Orders greater than 5000
SELECT *
FROM orders
WHERE order_amount > 5000;
