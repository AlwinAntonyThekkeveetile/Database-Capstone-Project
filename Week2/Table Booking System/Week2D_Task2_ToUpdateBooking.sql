USE littlelemondb;
DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //

CREATE PROCEDURE UpdateBooking (
    IN booking_id INT,
    IN booking_date DATE
)
BEGIN
    -- Start the transaction----
    START TRANSACTION;

    -- Check if the booking exists--
    IF EXISTS (SELECT 1 FROM Bookings WHERE BookingID = booking_id)
    THEN
        -- Update the booking date if it exists
        UPDATE Bookings
        SET BookingDate = booking_date
        WHERE BookingID = booking_id;

        -- Commit the transaction---
        COMMIT;
        
        -- Return a confirmation message---
        SELECT CONCAT("Booking ID ", booking_id, " has been updated to ", booking_date) AS `Confirmation`;
    ELSE
        -- Rollback the transaction if the booking does not exist---
        ROLLBACK;
        
        -- Return an error message---
        SELECT CONCAT("Booking ID ", booking_id, " does not exist.") AS `Message`;
    END IF;
END //

DELIMITER ;
