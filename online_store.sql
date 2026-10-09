SELECT * FROM Customers;  
SELECT
    Customers.customer_name,
    SUM(Orders.quantity) AS total_spent
FROM Customers
JOIN Orders
    ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_name
ORDER BY total_spent DESC; 

SELECT
    products.product_name,
    SUM(orders.quantity) AS total_quantity
FROM products
JOIN orders
    ON products.product_id = orders.product_id
GROUP BY products.product_name
ORDER BY total_quantity DESC; 
SELECT
    products.product_name,
    SUM(products.price * orders.quantity) AS total_revenue
FROM products
JOIN orders
    ON products.product_id = orders.product_id
GROUP BY products.product_name
ORDER BY total_revenue DESC;
SELECT
    order_date,
    SUM(products.price * orders.quantity) AS daily_sales
FROM orders
JOIN products
    ON orders.product_id = products.product_id
GROUP BY order_date
ORDER BY order_date;

SELECT
    customers.customer_name,
    COUNT(orders.order_id) AS total_orders
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.customer_name
ORDER BY total_orders DESC; 
SELECT
    AVG(products.price * orders.quantity) AS average_order_value
FROM orders
JOIN products
    ON orders.product_id = products.product_id; 
   SELECT
    products.category,
    SUM(products.price * orders.quantity) AS total_revenue
FROM products
JOIN orders
    ON products.product_id = orders.product_id
GROUP BY products.category
ORDER BY total_revenue DESC;  
SELECT
    products.product_name,
    SUM(products.price * orders.quantity) AS total_revenue
FROM products
JOIN orders
    ON products.product_id = orders.product_id
GROUP BY products.product_id, products.product_name
ORDER BY total_revenue DESC
LIMIT 3; 
