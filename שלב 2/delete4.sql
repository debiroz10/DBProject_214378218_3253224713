-- Delete orders where the customer has no orders after a specific date and the package price is below a certain threshold
DELETE FROM Invitation
WHERE InvitationId IN (
    SELECT i.InvitationId
    FROM Invitation i
    JOIN (
        SELECT CustomerId
        FROM Invitation
        WHERE Datte > '2023-01-01'  -- Specify the date threshold
        GROUP BY CustomerId
        HAVING COUNT(*) = 0
    ) noOrdersAfterDate ON i.ClientId = noOrdersAfterDate.CustomerId
    JOIN Pakcage p ON i.PackageId = p.PackageId
    WHERE p.Price < 500  -- Specify the price threshold
);
