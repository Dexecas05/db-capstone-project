CREATE DEFINER=`little-lemon`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
	SELECT o.order_id,
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    MAX(o.quantity) AS "Max quantity in Orders table"
    FROM orders o 
    JOIN customers c
		ON o.customer_id = c.customer_id
	GROUP BY o.order_id, c.customer_id, customer_name
    ORDER BY MAX(o.quantity) DESC
    LIMIT 1;
END