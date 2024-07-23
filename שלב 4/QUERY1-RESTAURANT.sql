-- Query to find the most expensive meal
SELECT 
    mealID, 
    mealName, 
    mealPrice
FROM (
    SELECT 
        mealID, 
        mealName, 
        mealPrice
    FROM 
        RestaurantView
    ORDER BY 
        mealPrice DESC
)
WHERE ROWNUM = 1;
