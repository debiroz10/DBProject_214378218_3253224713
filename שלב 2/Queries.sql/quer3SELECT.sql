SELECT DISTINCT c.ClientName
FROM Invitation i
JOIN Client c ON i.ClientId = c.ClientId
WHERE  i.FinalPrice > 40000;

