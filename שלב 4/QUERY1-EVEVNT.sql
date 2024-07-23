SELECT * FROM (
    SELECT 
        PackageId,
        PackageName,
        COUNT(DISTINCT InvitationId) AS TimesBooked,
        AVG(FinalPrice) AS AverageFinalPrice,
        COUNT(DISTINCT EquipmentId) AS UniqueEquipmentCount
    FROM 
        EventDesignView
    GROUP BY 
        PackageId, PackageName
    ORDER BY 
        COUNT(DISTINCT InvitationId) DESC
)
WHERE ROWNUM <= 3;
