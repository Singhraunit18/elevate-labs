CREATE DATABASE sales;

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    registration_date DATE
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(200),
    category_id INTEGER REFERENCES categories(category_id),
    price DECIMAL(10, 2),
    stock_quantity INTEGER
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(20)
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id),
    product_id INTEGER REFERENCES products(product_id),
    quantity INTEGER,
    unit_price DECIMAL(10, 2)
);

INSERT INTO customers (first_name, last_name, email, city, state, registration_date) VALUES
('John', 'Smith', 'john.smith@email.com', 'New York', 'NY', '2024-01-15'),
('Emma', 'Johnson', 'emma.j@email.com', 'Los Angeles', 'CA', '2024-01-20'),
('Michael', 'Brown', 'michael.b@email.com', 'Chicago', 'IL', '2024-01-25'),
('Sarah', 'Davis', 'sarah.d@email.com', 'Houston', 'TX', '2024-02-01'),
('David', 'Wilson', 'david.w@email.com', 'Phoenix', 'AZ', '2024-02-05'),
('Lisa', 'Anderson', 'lisa.a@email.com', 'Miami', 'FL', '2024-02-10'),
('James', 'Taylor', 'james.t@email.com', 'Seattle', 'WA', '2024-02-15'),
('Emily', 'Thomas', 'emily.t@email.com', 'Boston', 'MA', '2024-02-20'),
('Robert', 'Martinez', 'robert.m@email.com', 'Denver', 'CO', '2024-02-25'),
('Jessica', 'Garcia', 'jessica.g@email.com', 'Austin', 'TX', '2024-03-01'),
('Daniel', 'Rodriguez', 'daniel.r@email.com', 'Dallas', 'TX', '2024-03-05'),
('Ashley', 'Lee', 'ashley.l@email.com', 'San Diego', 'CA', '2024-03-10'),
('Matthew', 'White', 'matthew.w@email.com', 'Portland', 'OR', '2024-03-15'),
('Amanda', 'Harris', 'amanda.h@email.com', 'Atlanta', 'GA', '2024-03-20'),
('Joshua', 'Clark', 'joshua.c@email.com', 'Tampa', 'FL', '2024-03-25'),
('Jennifer', 'Lewis', 'jennifer.l@email.com', 'Orlando', 'FL', '2024-04-01'),
('Ryan', 'Walker', 'ryan.w@email.com', 'Nashville', 'TN', '2024-04-05'),
('Nicole', 'Hall', 'nicole.h@email.com', 'Charlotte', 'NC', '2024-04-10'),
('Kevin', 'Allen', 'kevin.a@email.com', 'Detroit', 'MI', '2024-04-15'),
('Michelle', 'Young', 'michelle.y@email.com', 'Columbus', 'OH', '2024-04-20');

INSERT INTO categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home & Garden'),
('Sports');

INSERT INTO products (product_name, category_id, price, stock_quantity) VALUES
('Laptop', 1, 999.99, 50),
('Smartphone', 1, 699.99, 100),
('Headphones', 1, 149.99, 200),
('T-Shirt', 2, 29.99, 500),
('Jeans', 2, 59.99, 300),
('Jacket', 2, 129.99, 150),
('Novel', 3, 19.99, 200),
('Cookbook', 3, 34.99, 150),
('Table Lamp', 4, 49.99, 100),
('Plant Pot', 4, 24.99, 250),
('Yoga Mat', 5, 39.99, 180),
('Basketball', 5, 29.99, 120);

INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, '2024-03-01', 999.99, 'Delivered'),
(2, '2024-03-02', 149.99, 'Delivered'),
(3, '2024-03-03', 89.98, 'Shipped'),
(4, '2024-03-04', 699.99, 'Delivered'),
(5, '2024-03-05', 179.97, 'Processing'),
(1, '2024-03-06', 59.99, 'Delivered'),
(6, '2024-03-07', 129.99, 'Delivered'),
(7, '2024-03-08', 74.98, 'Shipped'),
(8, '2024-03-09', 39.99, 'Delivered'),
(9, '2024-03-10', 699.99, 'Delivered'),
(10, '2024-03-11', 109.98, 'Processing'),
(2, '2024-03-12', 29.99, 'Delivered'),
(11, '2024-03-13', 999.99, 'Cancelled'),
(12, '2024-03-14', 149.99, 'Delivered'),
(13, '2024-03-15', 59.99, 'Shipped'),
(14, '2024-03-16', 54.98, 'Delivered'),
(15, '2024-03-17', 699.99, 'Processing'),
(3, '2024-03-18', 129.99, 'Delivered'),
(16, '2024-03-19', 39.99, 'Delivered'),
(17, '2024-03-20', 89.98, 'Shipped');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 999.99),
(2, 3, 1, 149.99),
(3, 4, 3, 29.99),
(4, 2, 1, 699.99),
(5, 5, 3, 59.99),
(6, 5, 1, 59.99),
(7, 6, 1, 129.99),
(8, 10, 3, 24.99),
(9, 11, 1, 39.99),
(10, 2, 1, 699.99),
(11, 7, 2, 19.99),
(11, 11, 2, 39.99),
(12, 12, 1, 29.99),
(13, 1, 1, 999.99),
(14, 3, 1, 149.99),
(15, 5, 1, 59.99),
(16, 7, 2, 19.99),
(16, 8, 1, 34.99),
(17, 2, 1, 699.99),
(18, 6, 1, 129.99),
(19, 11, 1, 39.99),
(20, 4, 3, 29.99);

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM customers WHERE state = 'TX';

SELECT * FROM customers 
WHERE state = 'CA' AND registration_date >= '2024-03-01';

SELECT product_name, price, stock_quantity 
FROM products 
ORDER BY price DESC;

SELECT first_name, last_name, state, city 
FROM customers 
ORDER BY state, city;

SELECT first_name, last_name, email 
FROM customers 
WHERE first_name LIKE 'J%';

SELECT order_id, customer_id, order_date, total_amount 
FROM orders 
WHERE order_date BETWEEN '2024-03-01' AND '2024-03-15';

SELECT product_name, price 
FROM products 
WHERE category_id IN (1, 2);

SELECT product_name, price 
FROM products 
ORDER BY price DESC 
LIMIT 5;

SELECT COUNT(*) AS total_customers FROM customers;

SELECT SUM(total_amount) AS total_revenue FROM orders;

SELECT ROUND(AVG(total_amount), 2) AS average_order_value FROM orders;

SELECT 
    MIN(price) AS min_price, 
    MAX(price) AS max_price 
FROM products;

SELECT state, COUNT(*) AS customer_count 
FROM customers 
GROUP BY state 
ORDER BY customer_count DESC;

SELECT status, COUNT(*) AS order_count, SUM(total_amount) AS total_sales 
FROM orders 
GROUP BY status;

SELECT c.category_name, COUNT(p.product_id) AS product_count 
FROM categories c 
LEFT JOIN products p ON c.category_id = p.category_id 
GROUP BY c.category_name;

SELECT state, COUNT(*) AS customer_count 
FROM customers 
GROUP BY state 
HAVING COUNT(*) > 1 
ORDER BY customer_count DESC;

SELECT 
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS avg_order,
    MIN(total_amount) AS min_order,
    MAX(total_amount) AS max_order
FROM orders;

SELECT 
    o.order_id, 
    c.first_name, 
    c.last_name, 
    o.order_date, 
    o.total_amount 
FROM orders o 
INNER JOIN customers c ON o.customer_id = c.customer_id 
ORDER BY o.order_date;

SELECT first_name, last_name, email 
FROM customers 
WHERE customer_id IN (
    SELECT customer_id 
    FROM orders 
    WHERE total_amount > (SELECT AVG(total_amount) FROM orders)
);

SELECT 
    c.first_name, 
    c.last_name, 
    SUM(o.total_amount) AS total_spent 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name 
ORDER BY

CREATE VIEW customer_summary AS 
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.state,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM customers c 
LEFT JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.first_name, c.last_name, c.email, c.state;

CREATE VIEW product_sales AS 
SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    p.price,
    COALESCE(SUM(oi.quantity), 0) AS total_sold,
    COALESCE(SUM(oi.quantity * oi.unit_price), 0) AS total_revenue
FROM products p 
LEFT JOIN categories c ON p.category_id = c.category_id 
LEFT JOIN order_items oi ON p.product_id = oi.product_id 
GROUP BY p.product_id, p.product_name, c.category_name, p.price;

SELECT * FROM product_sales ORDER BY total_revenue DESC;

CREATE VIEW order_details AS 
SELECT 
    o.order_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    o.order_date,
    o.status,
    o.total_amount,
    COUNT(oi.order_item_id) AS items_count
FROM orders o 
JOIN customers c ON o.customer_id = c.customer_id 
LEFT JOIN order_items oi ON o.order_id = oi.order_id 
GROUP BY o.order_id, c.first_name, c.last_name, o.order_date, o.status, o.total_amount;

SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS month,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS monthly_revenue,
    ROUND(AVG(total_amount), 2) AS avg_order_value
FROM orders
WHERE status != 'Cancelled'
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY month;

WITH monthly_stats AS (
    SELECT 
        TO_CHAR(order_date, 'YYYY-MM') AS month,
        SUM(total_amount) AS revenue
    FROM orders
    WHERE status != 'Cancelled'
    GROUP BY TO_CHAR(order_date, 'YYYY-MM')
)
SELECT 
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue,
    revenue - LAG(revenue) OVER (ORDER BY month) AS revenue_change,
    ROUND(
        ((revenue - LAG(revenue) OVER (ORDER BY month)) / 
        LAG(revenue) OVER (ORDER BY month) * 100), 2
    ) AS growth_percentage
FROM monthly_stats
ORDER BY month;