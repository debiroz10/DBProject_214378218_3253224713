SELECT 
    p.PackageName,
    COUNT(i.InvitationId) AS OrderCount
FROM 
    Invitation i
JOIN 
    Pakcage p ON i.PackageId = p.PackageId
GROUP BY 
    p.PackageName
ORDER BY 
    OrderCount DESC;
