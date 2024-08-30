USE littlelemondm;
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN 
SELECT Quantity AS "Max Quantity in Order" FROM orders
ORDER BY Quantity DESC;
END //
DELIMITER ;
CALL GetMaxQuantity;
