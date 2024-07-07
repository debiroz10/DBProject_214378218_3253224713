-- Update the price of packages that have been ordered more than 24 times
UPDATE Pakcage
SET Price = Price + 1500
WHERE PackageId IN (
    SELECT PackageId
    FROM Invitation
    GROUP BY PackageId
    HAVING COUNT(InvitationId) > 24
);
select * from  PAKCAGE;
