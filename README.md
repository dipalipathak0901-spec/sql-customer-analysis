# SQL Customer Analysis

This project contains SQL queries used for analyzing customer and order data.  
It covers basic to intermediate SQL concepts with practical examples for data analysis.

---

## Project Objective
The purpose of this project is to perform customer data analysis using SQL queries such as:

- Retrieving customer details
- Filtering records
- Aggregating data
- Joining multiple tables
- Analyzing order trends

---

## Topics Covered

- SELECT statements
- WHERE conditions
- ORDER BY
- GROUP BY
- HAVING clause
- INNER JOIN
- LEFT JOIN
- Aggregate functions
- Subqueries

---

## Database Tables Used

### Customers Table
| Column Name | Data Type |
|------------|-----------|
| id | INT |
| name | VARCHAR |
| city | VARCHAR |
| email | VARCHAR |

### Orders Table
| Column Name | Data Type |
|------------|-----------|
| order_id | INT |
| customer_id | INT |
| order_amount | DECIMAL |
| order_date | DATE |

---

## Sample Queries

### Get all customers
```sql
SELECT * 
FROM customers;
