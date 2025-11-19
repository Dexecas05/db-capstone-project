CREATE DEFINER=`little-lemon`@`%` PROCEDURE `GetOrderDetail`(IN cust_id INT)
BEGIN
	SELECT 
        order_id, 
        quantity, 
        total_cost
    FROM Orders
    WHERE customer_id = cust_id;

END