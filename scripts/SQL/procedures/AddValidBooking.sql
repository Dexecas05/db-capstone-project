CREATE DEFINER=`little-lemon`@`%` PROCEDURE `AddValidBooking`(
    IN in_booking_date DATE,
    IN in_table_number INT,
    IN in_customer_id INT
)
BEGIN
    DECLARE booking_status VARCHAR(150);
    DECLARE existing_customer_id INT;

    START TRANSACTION;

    -- Look up any existing booking for the given date and table
    SELECT customer_id
      INTO existing_customer_id
    FROM Bookings
    WHERE booking_date = in_booking_date
      AND table_number = in_table_number
    LIMIT 1;

    -- No existing booking: insert and commit
    IF existing_customer_id IS NULL THEN
        INSERT INTO Bookings (booking_date, table_number, customer_id)
        VALUES (in_booking_date, in_table_number, in_customer_id);

        COMMIT;
        SET booking_status = CONCAT(
            'Booking confirmed: Table ', in_table_number,
            ' reserved by customer ', in_customer_id,
            ' on ', in_booking_date
        );
        SELECT booking_status AS "Booking status";

    -- Already booked by the same customer: decline (avoid duplicates)
    ELSEIF existing_customer_id = in_customer_id THEN
        ROLLBACK;
        SET booking_status = CONCAT(
            'Booking not needed: Table ', in_table_number,
            ' is already booked by customer ', in_customer_id,
            ' on ', in_booking_date
        );
        SELECT booking_status AS "Booking status";

    -- Already booked by another customer: decline and rollback
    ELSE
        ROLLBACK;
        SET booking_status = CONCAT(
            'Booking declined: Table ', in_table_number,
            ' is already booked on ', in_booking_date,
            ' by customer ', existing_customer_id
        );
        SELECT booking_status AS "Booking status";
    END IF;

END