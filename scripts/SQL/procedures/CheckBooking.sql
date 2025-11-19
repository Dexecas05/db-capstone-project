CREATE DEFINER=`little-lemon`@`%` PROCEDURE `CheckBooking`(IN in_booking_date DATE, IN in_table_number INT)
BEGIN
	DECLARE booking_status VARCHAR(50);

    -- Check if the table is already booked for the given date
    IF EXISTS (
        SELECT 1 
        FROM bookings 
        WHERE booking_date = in_booking_date 
          AND table_number = in_table_number
    ) THEN
        SET booking_status = CONCAT('Table ', in_table_number, ' is already booked on ', in_booking_date);
    ELSE
        SET booking_status = CONCAT('Table ', in_table_number, ' is available on ', in_booking_date);
    END IF;

    -- Return the status message
    SELECT booking_status AS "Booking status";

END