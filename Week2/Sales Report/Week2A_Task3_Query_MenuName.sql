USE littlelemondm;
SELECT MenuName FROM menu
JOIN Orders ON menu.menuID = orders.MenuID
WHERE OrderID = ANY(SELECT OrderID FROM Orders WHERE Quantity > 2);  
