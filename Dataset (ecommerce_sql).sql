
CREATE DATABASE IF NOT EXISTS ecommerce_sql;
USE ecommerce_sql;

-- Table: customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50),
    email VARCHAR(100)
);

-- Table: products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Table: orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Table: order_items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample data into customers
INSERT INTO customers VALUES
(1, 'Alice Smith', 'USA', 'alice@example.com'),
(2, 'Bob Johnson', 'Canada', 'bob@example.com'),
(3, 'Charlie Brown', 'UK', 'charlie@example.com');

-- Insert sample data into products
INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 1200.00),
(102, 'Smartphone', 'Electronics', 800.00),
(103, 'Desk Chair', 'Furniture', 150.00);

-- Insert sample data into orders
INSERT INTO orders VALUES
(1001, 1, '2023-01-15', 2000.00),
(1002, 2, '2023-02-10', 800.00),
(1003, 1, '2023-03-05', 1350.00);

-- Insert sample data into order_items
INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1003, 103, 3);
