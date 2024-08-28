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
FROM 
    customers AS c 
JOIN 
    orders AS o ON c.CustomerID = o.CustomerID
JOIN 
    menu ON o.MenuID = menu.MenuID
JOIN 
    menuitems ON menu.MenuID = menuitems.MenuItemID
WHERE 
    o.TotalCost > 150
ORDER BY 
    o.TotalCost ASC;
