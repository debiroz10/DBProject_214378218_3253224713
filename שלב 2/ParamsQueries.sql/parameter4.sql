SELECT 
    c.ClientName, 
    i.Datte, 
    i.FinalPrice
FROM 
    Invitation i
JOIN 
    Client c ON i.ClientId = c.ClientId
WHERE 
    i.Datte >= TO_DATE('&<name="start_date" hint="Enter the start date (DD/MM/YYYY)">', 'DD/MM/YYYY')
ORDER BY 
    i.Datte;





