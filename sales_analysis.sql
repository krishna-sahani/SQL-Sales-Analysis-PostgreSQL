
CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price NUMERIC(10, 2)
);



INSERT INTO sales
    (order_id, customer_name, city, product, quantity, price)
VALUES
    (101, 'Rahul', 'Delhi', 'Laptop', 1, 50000),
    (102, 'Priya', 'Mumbai', 'Mouse', 2, 500),
    (103, 'Amit', 'Delhi', 'Keyboard', 1, 1500),
    (104, 'Neha', 'Pune', 'Laptop', 1, 50000),
    (105, 'Rahul', 'Delhi', 'Mouse', 3, 500);


SELECT *
FROM sales;


SELECT *
FROM sales;


SELECT *
FROM sales
WHERE product = 'Laptop';

SELECT *
FROM sales
WHERE city = 'Delhi';



SELECT product, price
FROM sales
ORDER BY price DESC;


SELECT *
FROM sales
ORDER BY price DESC
LIMIT 3;


SELECT
    order_id,
    product,
    quantity,
    price,
    quantity * price AS revenue
FROM sales;

SELECT
    SUM(quantity * price) AS total_revenue
FROM sales;


SELECT
    product,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product;



SELECT
    product,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;


SELECT COUNT(*) AS total_orders
FROM sales;


SELECT COUNT(DISTINCT customer_name) AS unique_customers
FROM sales;

SELECT
    AVG(quantity * price) AS average_order_value
FROM sales;


SELECT
    product,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product
HAVING SUM(quantity * price) > 5000;


SELECT
    order_id,
    product,
    quantity * price AS revenue,
    CASE
        WHEN quantity * price >= 10000 THEN 'High'
        WHEN quantity * price >= 2000 THEN 'Medium'
        ELSE 'Low'
    END AS revenue_category
FROM sales;

SELECT
    product,
    SUM(quantity) AS units_sold,
    SUM(quantity * price) AS total_revenue,
    ROUND(AVG(quantity * price), 2) AS avg_order_value
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;



SELECT
    city,
    SUM(quantity * price) AS total_revenue,
    COUNT(*) AS total_orders
FROM sales
GROUP BY city
ORDER BY total_revenue DESC;






CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers (customer_id, customer_name, city)
VALUES
    (1, 'Rahul', 'Delhi'),
    (2, 'Priya', 'Mumbai'),
    (3, 'Amit', 'Delhi'),
    (4, 'Neha', 'Pune');

	
SELECT
    s.order_id,
    c.customer_name,
    c.city AS customer_city,
    s.product,
    s.quantity,
    s.price,
    s.quantity * s.price AS revenue
FROM sales AS s
INNER JOIN customers AS c
    ON s.customer_name = c.customer_name;


SELECT
    customer_name,
    COUNT(*) AS total_orders,
    SUM(quantity * price) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC;



-- Project: Sales Analysis using PostgreSQL
-- Purpose: Analyze sales, products, customers and revenue

-- 1. View all sales
SELECT *
FROM sales;

-- 2. Calculate revenue for each order
SELECT
    order_id,
    customer_name,
    product,
    quantity,
    price,
    quantity * price AS revenue
FROM sales;

-- 3. Total revenue
SELECT
    SUM(quantity * price) AS total_revenue
FROM sales;

-- 4. Product-wise revenue
SELECT
    product,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;

-- 5. City-wise sales
SELECT
    city,
    COUNT(*) AS total_orders,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC;

-- 6. Customer-wise sales
SELECT
    customer_name,
    COUNT(*) AS total_orders,
    SUM(quantity * price) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC;
