USE littlelemondm;
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //

CREATE PROCEDURE CancelBooking (
    IN booking_id INT
)
BEGIN
    -- Start the transaction
    START TRANSACTION;

    -- Check if the booking exists
    IF EXISTS (SELECT 1 FROM Bookings WHERE BookingID = booking_id) THEN
        -- Delete the booking if it exists
        DELETE FROM Bookings WHERE BookingID = booking_id;

        -- Commit the transaction
        COMMIT;
        
        -- Return a confirmation message
        SELECT CONCAT("Booking ID ", booking_id, " has been cancelled.") AS `Confirmation`;
    ELSE
        -- Rollback the transaction if the booking does not exist
        ROLLBACK;
        
        -- Return an error message
        SELECT CONCAT("Booking ID ", booking_id, " does not exist.") AS `Message`;
    END IF;
END //

DELIMITER ;


