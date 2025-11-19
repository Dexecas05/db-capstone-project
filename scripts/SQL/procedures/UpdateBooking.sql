CREATE DEFINER=`little-lemon`@`%` PROCEDURE `UpdateBooking`(
    IN in_booking_id INT,
    IN in_new_date DATE
)
BEGIN
    DECLARE booking_status VARCHAR(100);

    IF EXISTS (SELECT 1 FROM Bookings WHERE booking_id = in_booking_id) THEN
        UPDATE bookings
        SET booking_date = in_new_date
        WHERE booking_id = in_booking_id;

        SET booking_status = CONCAT('Booking ', in_booking_id, 
                                    ' updated to new date: ', in_new_date);
        SELECT booking_status AS "Booking status";
    ELSE
        SET booking_status = CONCAT('Booking ', in_booking_id, ' not found');
        SELECT booking_status AS "Booking status";
    END IF;
END