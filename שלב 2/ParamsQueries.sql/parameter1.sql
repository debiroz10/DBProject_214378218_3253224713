SELECT 
    c.ClientName, 
    SUM(i.FinalPrice) AS TotalSpent
FROM 
    Client c
JOIN 
    Invitation i ON c.ClientId = i.ClientId
WHERE 
    i.Datte BETWEEN TO_DATE('&<name="startDate" required="true">', 'dd/mm/yyyy') AND TO_DATE('&<name="endDate" required="true">', 'dd/mm/yyyy')
GROUP BY 
    c.ClientName
HAVING 
    SUM(i.FinalPrice) > &<name="minAmount" required="true">;


