SELECT 
    c.ClientName,
    COUNT(i.InvitationId) AS TotalOrders,
    MAX(i.Datte) AS LastOrderDate
FROM 
    Client c
JOIN 
    Invitation i ON c.ClientId = i.ClientId
JOIN 
    Designer d ON i.DesignerId = d.DesignerID
GROUP BY 
    c.ClientId, c.ClientName
ORDER BY 
    TotalOrders DESC;


