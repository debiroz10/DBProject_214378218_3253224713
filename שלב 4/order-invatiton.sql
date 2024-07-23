ALTER TABLE Invitation
ADD orderStatus VARCHAR(20);
ALTER TABLE Invitation
MODIFY ClientId VARCHAR(10);  -- Or a larger size if needed

ALTER TABLE Invitation
MODIFY PackageId NUMBER NULL;  -- Or use the appropriate data type


INSERT INTO Invitation (InvitationId, FinalPrice, Datte, ClientId, DesignerId, PackageId, orderStatus)
SELECT orderID, orderPrice, orderDate, custID, 1, NULL, orderStatus FROM Orders
WHERE orderID NOT IN (SELECT InvitationId FROM Invitation);

UPDATE Invitation
SET orderStatus = 
      CASE 
        WHEN MOD(ROWNUM, 4) = 0 THEN 'received'
        WHEN MOD(ROWNUM, 4) = 1 THEN 'sent'
        WHEN MOD(ROWNUM, 4) = 2 THEN 'delivered'
        ELSE 'in preparation'
      END

WHERE orderStatus IS NULL;

select * from INVITATION t
--forigen key
-- 2. Drop the correct foreign key constraint
ALTER TABLE WorkerOrder DROP CONSTRAINT SYS_C007358;
ALTER TABLE mealOrder DROP CONSTRAINT SYS_C007347;
-- 3. Add the new foreign key constraint
ALTER TABLE WorkerOrder
ADD CONSTRAINT fk_workerorder_invitation
FOREIGN KEY (orderID) REFERENCES Invitation(InvitationId);

ALTER TABLE mealOrder
ADD CONSTRAINT fk_mealorder_invitation
FOREIGN KEY (orderID) REFERENCES Invitation(InvitationId);

DROP TABLE Orders;





