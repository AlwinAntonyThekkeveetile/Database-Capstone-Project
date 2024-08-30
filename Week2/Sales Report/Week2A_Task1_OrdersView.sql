USE littlelemondb;
CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM OrdersWHERE Quantity > 2;
