
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

INSERT INTO customers VALUES
(1, 'Ankit', 'Delhi', 'ankit@gmail.com'),
(2, 'Rahul', 'Mumbai', 'rahul@gmail.com'),
(3, 'Priya', 'Bangalore', 'priya@gmail.com');

INSERT INTO orders VALUES
(101, 1, 5000, '2025-03-01'),
(102, 2, 7500, '2025-03-02'),
(103, 1, 3000, '2025-03-03'),
(104, 3, 10000, '2025-03-04');
