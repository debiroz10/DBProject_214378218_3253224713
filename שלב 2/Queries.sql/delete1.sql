-- Delete unnecessary orders for package number 1 in 2006
DELETE FROM Invitation
WHERE PackageId = 1
AND Datte >= to_date('01/01/2006','dd/mm/yyyy') AND Datte < to_date('01/01/2007','dd/mm/yyyy')
AND InvitationId NOT IN (
    SELECT MIN(InvitationId)
    FROM Invitation
    WHERE PackageId = 1 AND Datte >= to_date('01/01/2006','dd/mm/yyyy') AND Datte < to_date('01/01/2007','dd/mm/yyyy')
);
SELECT *
FROM Invitation
WHERE Datte >=to_date('01/01/2006','dd/mm/yyyy') AND Datte < to_date('01/01/2007','dd/mm/yyyy');

