
-- Add new column provPhoneNumber if it doesn't already exist
ALTER TABLE Supplier_
ADD (provPhoneNumber VARCHAR2(20));

-- Modify existing columns to ensure they meet requirements
ALTER TABLE Supplier_
MODIFY (SupplierId NUMBER(10));
ALTER TABLE Supplier_
MODIFY (SupplierName VARCHAR2(20));

INSERT INTO Supplier_ (SupplierId, SupplierName, Area, provPhoneNumber)
SELECT provID, SUBSTR(provName, 1, 20), NULL, provPhoneNumber
FROM Providers
WHERE provID NOT IN (SELECT SupplierId FROM Supplier_);


-- Update Area with random values where it is NULL
UPDATE Supplier_
SET Area = 
  CASE 
    WHEN DBMS_RANDOM.VALUE < 0.33 THEN 'North'
    WHEN DBMS_RANDOM.VALUE < 0.66 THEN 'South'
    ELSE 'gushDan'
  END
WHERE Area IS NULL;

-- Update provPhoneNumber with random values where it is NULL
UPDATE Supplier_
SET provPhoneNumber = '0' || LPAD(TRUNC(DBMS_RANDOM.VALUE(100000000, 999999999)), 9, '0')
WHERE provPhoneNumber IS NULL;

--forigen key
-- 1. Find the correct constraint name
SELECT constraint_name
FROM user_constraints
WHERE table_name = 'PRODUCT'
AND constraint_type = 'R';

-- 2. Drop the correct foreign key constraint
ALTER TABLE Product
DROP CONSTRAINT SYS_C007328;

-- 3. Add the new foreign key constraint
ALTER TABLE Product
ADD CONSTRAINT FK_PRODUCT_SUPPLIER
FOREIGN KEY (provID) REFERENCES Supplier_(SupplierId);
