WITH ClientOrderSummary AS (
    SELECT 
        i.ClientId,
        SUM(i.FinalPrice) AS TotalAmount,
        COUNT(DISTINCT i.PackageId) AS PackageCount,
        COUNT(*) - COUNT(DISTINCT i.PackageId) AS SamePackageOrders
    FROM Invitation i
    GROUP BY i.ClientId
)
SELECT 
    c.ClientId,
    c.ClientName
FROM 
    ClientOrderSummary cos
JOIN 
    Client c ON cos.ClientId = c.ClientId
WHERE 
    cos.TotalAmount > 100000 AND cos.SamePackageOrders >= 3
ORDER BY 
    cos.TotalAmount DESC;

