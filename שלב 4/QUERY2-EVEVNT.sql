-- Query to find the cheapest invitation from a specific date using EventDesignView
SELECT 
    InvitationId, 
    FinalPrice, 
    EventDate
FROM (
    SELECT 
        e.InvitationId, 
        e.FinalPrice, 
        e.EventDate
    FROM 
        EventDesignView e
    WHERE 
        e.EventDate = TO_DATE('&startDate', 'dd/mm/yyyy')
    ORDER BY 
        e.FinalPrice ASC
)
WHERE ROWNUM = 1;


