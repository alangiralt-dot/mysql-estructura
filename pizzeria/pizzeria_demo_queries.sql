/*
  PIZZERIA DATABASE - DEMO QUERIES
  This script showcases the data retrieval and reporting capabilities 
  of the pizzeria relational schema.
*/

-- 1. LOGISTICS: Verify proximity between customers and production centers
-- Purpose: Ensures delivery efficiency by matching postal codes.
SELECT o.order_id, c.postal_code AS customer, d.postal_code AS dark_kitchen
FROM customers AS c 
INNER JOIN orders AS o ON c.customer_id = o.customer_id
INNER JOIN dark_kitchens AS d ON o.dark_kitchen_id = d.dark_kitchen_id
ORDER BY c.postal_code ASC;

-- 2. DELIVERY PERFORMANCE: Calculate time elapsed from order to delivery
-- Purpose: Audit the efficiency of the delivery staff and kitchen response.
SELECT o.order_id, o.ordered_at, d.delivered_at, 
       TIMEDIFF(d.delivered_at, o.ordered_at) AS delivery_duration, 
       o.dark_kitchen_id AS kitchen_id, e.role,
       CONCAT(e.last_name, ', ', e.first_name) AS employee
FROM orders AS o 
INNER JOIN deliveries AS d ON o.order_id = d.order_id
INNER JOIN employees AS e ON d.employee_id = e.employee_id
ORDER BY delivery_duration DESC;

-- 3. MARKETING: Filter products by dietary and quality tags
-- Purpose: Useful for dynamic website filters (e.g., finding healthy options).
SELECT p.name, t.tag, c.category, p.description
FROM products AS p 
INNER JOIN products_tags AS pd ON p.product_id = pd.product_id
INNER JOIN tags AS t ON pd.tag_id = t.tag_id
INNER JOIN categories AS c ON p.category_id = c.category_id
WHERE t.tag IN ('Vegan', 'Healthy', 'Local Product')
ORDER BY p.name ASC;

-- 4. SALES REPORTING: High-level Customer Invoice Summary
-- Purpose: Provides a clear list of who ordered, when, and the total amount.
SELECT o.order_id, CONCAT(c.last_name, ', ', c.first_name) AS customer_name, o.ordered_at, ROUND(t1.total, 2) AS total
FROM customers AS c 
INNER JOIN orders AS o ON c.customer_id = o.customer_id 
INNER JOIN (
    SELECT order_id, SUM(quantity * sale_unit_price) AS total 
    FROM details 
    GROUP BY order_id
) AS t1 ON o.order_id = t1.order_id;

-- 5. BUSINESS INTELLIGENCE: Ranking Top Performing Kitchens (High Revenue)
-- Purpose: Financial reporting to identify locations exceeding sales targets.
SELECT ROUND(SUM(t1.total), 2) AS kitchen_revenue, dk.dark_kitchen_id, dk.street, dk.address_number
FROM dark_kitchens AS dk 
INNER JOIN orders AS o ON dk.dark_kitchen_id = o.dark_kitchen_id 
INNER JOIN (
    SELECT order_id, SUM(quantity * sale_unit_price) AS total 
    FROM details 
    GROUP BY order_id
) AS t1 ON o.order_id = t1.order_id
GROUP BY dk.dark_kitchen_id
HAVING kitchen_revenue > 55
ORDER BY kitchen_revenue DESC;
