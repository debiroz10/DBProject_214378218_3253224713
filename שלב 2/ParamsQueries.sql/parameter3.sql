SELECT 
    c.ClientName, 
    i.InvitationId, 
    i.Datte, 
    i.FinalPrice, 
    d.DesignerName,
    p.PackageName
FROM 
    Client c
JOIN 
    Invitation i ON c.ClientId = i.ClientId
JOIN 
    Designer d ON i.DesignerId = d.DesignerID
JOIN 
    Pakcage p ON i.PackageId = p.PackageId
WHERE 
    d.DesignerID = &<name="designer_name" 
                     list="SELECT DesignerID, DesignerName FROM Designer ORDER BY DesignerName" 
                     description="yes" restricted="yes">
ORDER BY 
    i.Datte DESC, 
    i.FinalPrice DESC;

