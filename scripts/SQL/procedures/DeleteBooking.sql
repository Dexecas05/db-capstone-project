CREATE DEFINER=`little-lemon`@`%` PROCEDURE `DeleteBooking`(IN in_booking_id INT)
BEGIN
    DECLARE booking_status VARCHAR(100);

    IF EXISTS (SELECT 1 FROM Bookings WHERE booking_id = in_booking_id) THEN
        DELETE FROM bookings WHERE booking_id = in_booking_id;

        SET booking_status = CONCAT('Booking ', in_booking_id, ' has been deleted');
        SELECT booking_status AS "Booking status";
    ELSE
        SET booking_status = CONCAT('Booking ', in_booking_id, ' not found');
        SELECT booking_status AS "Booking status";
    END IF;
END