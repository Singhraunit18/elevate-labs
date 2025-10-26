CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    address VARCHAR(50),
    totalamount INT,
    paymentmode VARCHAR(20)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customer(customer_id),
    order_date DATE,
    amount INT,
    paymentmode VARCHAR(20),
    product VARCHAR(100)
);

INSERT INTO customer (name, age, address, totalamount, paymentmode) VALUES
('Rohan Sharma', 28, 'Delhi', 4500, 'Cash'),
('Priya Singh', 25, 'Mumbai', 7800, 'Credit Card'),
('Amit Patel', 32, 'Ahmedabad', 5600, 'UPI'),
('Neha Gupta', 29, 'Pune', 9200, 'Debit Card'),
('Rahul Verma', 35, 'Chennai', 3000, 'Cash'),
('Sneha Reddy', 27, 'Hyderabad', 6500, 'Credit Card'),
('Arjun Das', 40, 'Kolkata', 11000, 'UPI'),
('Meera Nair', 31, 'Kochi', 7300, 'Debit Card'),
('Vikas Kumar', 26, 'Jaipur', 4000, 'Cash'),
('Anjali Mehta', 33, 'Surat', 9800, 'Credit Card'),
('Saurabh Joshi', 24, 'Bhopal', 3600, 'UPI'),
('Kiran Yadav', 37, 'Lucknow', 8900, 'Debit Card'),
('Tanya Arora', 22, 'Noida', 2500, 'Cash'),
('Ravi Chauhan', 41, 'Patna', 10200, 'Credit Card'),
('Deepika Soni', 30, 'Indore', 5700, 'UPI'),
('Mohit Khanna', 27, 'Nagpur', 6800, 'Debit Card'),
('Pooja Mishra', 34, 'Varanasi', 9100, 'Credit Card'),
('Harshad Desai', 38, 'Rajkot', 7700, 'UPI'),
('Simran Kaur', 23, 'Amritsar', 4200, 'Cash'),
('Manish Tiwari', 36, 'Kanpur', 8600, 'Debit Card');

INSERT INTO orders (customer_id, order_date, amount, paymentmode, product) VALUES
(1, '2025-06-01', 1200, 'Cash', 'T-shirt'),
(1, '2025-06-15', 3300, 'Cash', 'Shoes'),
(2, '2025-07-02', 7800, 'Credit Card', 'Mobile'),
(3, '2025-05-20', 5600, 'UPI', 'Headphones'),
(4, '2025-08-10', 9200, 'Debit Card', 'Laptop'),
(7, '2025-04-22', 11000, 'UPI', 'TV'),
(10,'2025-09-12', 9800, 'Credit Card', 'Refrigerator'),
(14,'2025-03-05', 10200, 'Credit Card', 'Washing Machine'),
(16,'2025-02-17', 6800, 'Debit Card', 'Smartwatch'),
(19,'2025-01-30', 4200, 'Cash', 'Backpack');


SELECT COUNT(*) FROM customer;   -- expect 20
SELECT COUNT(*) FROM orders;     -- expect 10

--SELECT / WHERE / ORDER BY

-- Sab customers
SELECT * FROM customer;

-- Age > 30
SELECT name, age, address FROM customer WHERE age > 30 ORDER BY age DESC;

--AGGREGATES & GROUP BY (SUM, AVG)
-- Total and average order amount by payment mode (orders)
SELECT paymentmode, SUM(amount) AS total_sales, AVG(amount) AS avg_order
FROM orders
GROUP BY paymentmode
ORDER BY total_sales DESC;

--JOINS (INNER / LEFT / RIGHT)

-- Inner join: customers with their orders
SELECT c.customer_id, c.name, o.order_id, o.order_date, o.product, o.amount
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC;

-- Left join: all customers + orders (NULL if no order)
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

--VIEW creation
CREATE OR REPLACE VIEW customer_spending AS
SELECT c.customer_id, c.name, COALESCE(SUM(o.amount),0) AS total_orders_amount
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- Use the view
SELECT * FROM customer_spending ORDER BY total_orders_amount DESC;


-- index
CREATE INDEX IF NOT EXISTS idx_orders_customer_id ON orders(customer_id);
CREATE INDEX IF NOT EXISTS idx_orders_paymentmode ON orders(paymentmode);

-- Check explain
EXPLAIN ANALYZE
SELECT * FROM orders WHERE amount > 5000;

