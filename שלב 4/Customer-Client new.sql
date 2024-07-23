-- Modify Client table
ALTER TABLE Client
ADD  Address VARCHAR(30);
-- Increase the size of the PhoneNumber column to accommodate larger values
ALTER TABLE Client
MODIFY  Phone VARCHAR(20);
ALTER TABLE Client
MODIFY  ClientName VARCHAR(40);
--הכנסת הערכים מהטבלהשלהם לטבלה שלנו 
INSERT INTO Client (ClientId, ClientName, Phone, BirthDate, Address)
SELECT custID, custName, custPhoneNumber, to_date('01/01/1990','dd/mm/yyyy'), custAddress FROM Customers
WHERE custID NOT IN (SELECT ClientId FROM Client);
-- Update custAddress to "Dodaim 5 Ramat Gan" where it is NULL
UPDATE Client
SET Address = 'Dodaim 5 Ramat Gan'
WHERE Address IS NULL;
-- Update BirthDate to "01/01/2007" where it is NULL
UPDATE Client
SET BirthDate = TO_DATE('01/01/2007', 'DD/MM/YYYY')
WHERE BirthDate IS NULL;
--שינוי תכונה כדי נשוכל להעביר מפתח זר
ALTER TABLE Orders
ADD tempCustID VARCHAR2(10);
UPDATE Orders
SET tempCustID = TO_CHAR(custID);
ALTER TABLE Orders
DROP COLUMN custID;
ALTER TABLE Orders
RENAME COLUMN tempCustID TO custID;
--forigen key
-- 1. Find the correct constraint name
SELECT constraint_name
FROM user_constraints
WHERE table_name = 'ORDERS'
AND constraint_type = 'R';
-- 2. Drop the correct foreign key constraint
ALTER TABLE Orders
DROP CONSTRAINT SYS_C007341;
-- 3. Add the new foreign key constraint
ALTER TABLE Orders
ADD CONSTRAINT fk_orders_client
FOREIGN KEY (custID) REFERENCES Client(ClientId);

DROP TABLE Customers;

select * from Client t



