USE littlelemondm;
SELECT  
c.CustomerID,
c.FullName,
o.OrderID,
o.TotalCost AS Cost,
menu.MenuName,
menuitems.`Main Courses`,
menuitems.Desserts,
menuitems.Staters AS CourseName 
FROM customers AS c JOIN 
orders AS o ON c.CustomerID = o.CustomerIDJOIN 
menu ON o.MenuID = menu.MenuIDJOIN 
menuitems ON menu.MenuID = menuitems.MenuItemIDWHERE 
o.TotalCost > 150
ORDER BY o.TotalCost ASC;
