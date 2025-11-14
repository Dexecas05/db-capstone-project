-- Create a view called OrdersView from orders table with quantity > 2
CREATE VIEW OrdersView AS
SELECT 
    order_id,
    quantity,
    total_cost
FROM orders
WHERE quantity > 2;

-- Querying the view
SELECT * FROM OrdersView;

-- Query for getting orders with total_cost > 150
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    o.order_id,
    o.total_cost,
    m.item_name AS menu_name,
    m.category AS menu_category
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN order_menu om 
    ON o.order_id = om.order_id
JOIN menu m 
    ON om.menu_item_id = m.menu_item_id
WHERE o.total_cost > 150
  AND m.category IN ('Course', 'Starter')
ORDER BY o.total_cost ASC;

-- Dynamic query for getting orders with total_cost > 150
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    o.order_id,
    SUM(m.price * o.quantity) AS calculated_total_cost,
    m.item_name AS menu_name,
    m.category AS menu_category
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN order_menu om 
    ON o.order_id = om.order_id
JOIN menu m 
    ON om.menu_item_id = m.menu_item_id
WHERE m.category IN ('Course', 'Starter')
GROUP BY c.customer_id, full_name, o.order_id, m.item_name, m.category
HAVING SUM(m.price * o.quantity) > 150
ORDER BY calculated_total_cost ASC;

-- Query with subquery for getting menu items for which more than 2 orders have been placed
SELECT item_name
FROM menu
WHERE menu_item_id = ANY (
    SELECT om.menu_item_id
    FROM order_menu om
    WHERE om.quantity > 2
);

/*
Another version of the 
This version is more aggregate-driven: instead of checking if any single order had quantity > 2, 
it checks the total demand across all orders.
*/
SELECT m.item_name, SUM(om.quantity) AS total_quantity
FROM menu m
JOIN order_menu om 
    ON m.menu_item_id = om.menu_item_id
GROUP BY m.item_name
HAVING SUM(om.quantity) > 2
ORDER BY total_quantity ASC;

-- Aggregate demand using Orders.quantity
SELECT m.item_name, SUM(o.quantity) AS total_quantity
FROM menu m
JOIN order_menu om 
    ON m.menu_item_id = om.menu_item_id
JOIN orders o
    ON om.order_id = o.order_id
GROUP BY m.item_name
HAVING SUM(o.quantity) > 2
ORDER BY total_quantity ASC;


