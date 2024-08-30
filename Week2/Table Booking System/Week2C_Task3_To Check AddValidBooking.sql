USE littlelemondm;
DELIMITER //

CREATE PROCEDURE AddValidBooking (
    IN booking_date DATE,
    IN table_no INT,
    IN customer_id INT
)
BEGIN
    DECLARE table_status INT;

    -- Start the transaction
    START TRANSACTION;

    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO table_status
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNumber = table_no;

    -- If the table is booked, rollback the transaction
    IF table_status > 0 THEN
        ROLLBACK;
        SELECT CONCAT("Booking for Table ", table_no, " on ", booking_date, " could not be completed. The table is already booked.") AS `Booking Status`;
    ELSE
        -- If the table is available, add the new booking and commit the transaction
        INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
        VALUES (booking_date, table_no, customer_id);
        COMMIT;
        SELECT CONCAT("Booking for Table ", table_no, " on ", booking_date, " was successfully added.") AS `Booking Status`;
    END IF;
END //

DELIMITER ;

CALL AddValidBooking('2022-10-10', 5, 1);


