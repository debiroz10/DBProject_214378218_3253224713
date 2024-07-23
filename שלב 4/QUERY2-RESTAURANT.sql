-- Query to list all meals with their total product costs, limited to a certain number
SELECT * 
FROM (
    SELECT 
        mealID, 
        mealName, 
        SUM(ProductPrice * ProductAmount) AS TotalProductCost
    FROM (
        SELECT 
            m.mealID, 
            m.mealName, 
            p.prodPrice AS ProductPrice,
            i.ingredAmount AS ProductAmount
        FROM 
            RestaurantView rv
        JOIN Meal m ON rv.mealID = m.mealID
        JOIN Product p ON rv.prodID = p.prodID
        JOIN Ingredients i ON rv.prodID = i.prodID
        WHERE m.mealID = rv.mealID
    )
    GROUP BY 
        mealID, 
        mealName
    ORDER BY 
        TotalProductCost DESC
)
WHERE ROWNUM <= 5;  -- Adjust the number as needed

