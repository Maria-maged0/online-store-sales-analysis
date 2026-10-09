
-- 1. View all customers
SELECT *
FROM customers;

-- 2. Total spending by customer
SELECT
    customers.customer_name,
    SUM(products.price * orders.quantity) AS total_spent
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN products
    ON orders.product_id = products.product_id
GROUP BY customers.customer_id, customers.customer_name
ORDER BY total_spent DESC;

-- 3. Best-selling products by quantity
SELECT
    products.product_name,
    SUM(orders.quantity) AS total_quantity
FROM products
JOIN orders
    ON products.product_id = orders.product_id
GROUP BY products.product_id, products.product_name
ORDER BY total_quantity DESC;

-- 4. Revenue by product
SELECT
    products.product_name,
    SUM(products.price * orders.quantity) AS total_revenue
FROM products
JOIN orders
    ON products.product_id = orders.product_id
GROUP BY products.product_id, products.product_name
ORDER BY total_revenue DESC;

-- 5. Daily sales
SELECT
    orders.order_date,
    SUM(products.price * orders.quantity) AS daily_sales
FROM orders
JOIN products
    ON orders.product_id = products.product_id
GROUP BY orders.order_date
ORDER BY orders.order_date;

-- 6. Number of orders per customer
SELECT
    customers.customer_name,
    COUNT(orders.order_id) AS total_orders
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.customer_name
ORDER BY total_orders DESC;

-- 7. Average order-line value
SELECT
    AVG(products.price * orders.quantity) AS average_order_value
FROM orders
JOIN products
    ON orders.product_id = products.product_id;

-- 8. Revenue by category
SELECT
    products.category,
    SUM(products.price * orders.quantity) AS total_revenue
FROM products
JOIN orders
    ON products.product_id = orders.product_id
GROUP BY products.category
ORDER BY total_revenue DESC;

-- 9. Top 3 products by revenue
SELECT
    products.product_name,
    SUM(products.price * orders.quantity) AS total_revenue
FROM products
JOIN orders
    ON products.product_id = orders.product_id
GROUP BY products.product_id, products.product_name
ORDER BY total_revenue DESC
LIMIT 3;

-- 10. Total revenue
SELECT
    SUM(products.price * orders.quantity) AS total_revenue
FROM orders
JOIN products
    ON orders.product_id = products.product_id;