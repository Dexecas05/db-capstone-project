-- Prepare the statement
PREPARE GetOrderDetail FROM
'SELECT order_id, quantity, total_cost
 FROM orders
 WHERE customer_id = ?';
 
 -- Create a variable to hold the CustomerID
SET @id = 1;

-- Execute the prepared statement using the variable
EXECUTE GetOrderDetail USING @id;

-- Optionally, deallocate when done
DEALLOCATE PREPARE GetOrderDetail;

