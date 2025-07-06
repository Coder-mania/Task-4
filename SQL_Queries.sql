
USE ecommerce_sql;

-- 1. Basic SELECT, WHERE, ORDER BY, GROUP BY
-- a. Get all customers from the USA
SELECT * FROM customers WHERE country = 'USA';

-- b. Total orders per country
SELECT c.country, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.country
ORDER BY total_orders DESC;

-- 2. JOINs
-- a. INNER JOIN orders with customer and product info
SELECT o.order_id, o.order_date, c.customer_name, p.product_name, oi.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- b. LEFT JOIN to get all customers, even those with no orders
SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- 3. Subqueries
-- a. Customers who spent more than the average order value
SELECT customer_id, total_amount
FROM orders
WHERE total_amount > (SELECT AVG(total_amount) FROM orders);

-- 4. Aggregate functions (SUM, AVG)
-- a. Total revenue per product
SELECT p.product_name, SUM(p.price * oi.quantity) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name;

-- b. Average order amount
SELECT AVG(total_amount) AS avg_order_amount FROM orders;

-- 5. Create a View
CREATE VIEW customer_order_summary AS
SELECT c.customer_name, o.order_id, o.order_date, o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- Use the view
SELECT * FROM customer_order_summary;

-- 6. Optimization with Indexes
CREATE INDEX idx_customer_id ON orders(customer_id);
CREATE INDEX idx_product_id ON order_items(product_id);
