CREATE DEFINER=`little-lemon`@`%` PROCEDURE `CancelOrder`(IN in_order_id INT)
BEGIN
	-- Check if the order exists
    IF EXISTS (SELECT 1 FROM orders WHERE order_id = in_order_id) THEN
    
		-- Delete related records in order_delivery_status first
        DELETE FROM order_delivery_status WHERE order_id = in_order_id;
		-- Then delete related records in Order_Menu
        DELETE FROM order_menu WHERE order_id = in_order_id;
        -- Finally delete the order itself
        DELETE FROM orders WHERE order_id = in_order_id;

        -- Return confirmation message
        SELECT CONCAT('Order ', in_order_id, ' and related items are cancelled') AS confirmation;
    ELSE
        -- Return failure message
        SELECT CONCAT('Order ', in_order_id, ' not found') AS error_message;
    END IF;

END