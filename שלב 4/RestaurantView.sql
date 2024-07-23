CREATE VIEW RestaurantView AS
SELECT 
    m.mealID,
    m.mealName,
    m.mealPrice,
    p.prodID,
    p.prodName,
    p.prodPrice AS ProductPrice,
    i.ingredAmount AS ProductAmount,
    s.SupplierName,
    s.Area AS SupplierArea
FROM Meal m
JOIN Ingredients i ON m.mealID = i.mealID
JOIN Product p ON i.prodID = p.prodID
JOIN Supplier_ s ON p.provID = s.SupplierId;

select * from RestaurantView
