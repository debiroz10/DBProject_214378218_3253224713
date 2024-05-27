CREATE TABLE Client
(
  ClientId VARCHAR(8) NOT NULL,
  ClientName VARCHAR(15) NOT NULL,
  Phone VARCHAR(10) NOT NULL,
  PRIMARY KEY (ClientId)
);

CREATE TABLE Supplier_
(
  SupplierId NUMERIC(5) NOT NULL,
  SupplierName VARCHAR(15) NOT NULL,
  Area VARCHAR(30),
  PRIMARY KEY (SupplierId)
);

CREATE TABLE Pakcage
(
  PackageId NUMERIC(5) NOT NULL,
  PackageName VARCHAR(15) NOT NULL,
  Price NUMERIC(5) NOT NULL,
  PRIMARY KEY (PackageId)
);

CREATE TABLE Designer
(
  DesignerName VARCHAR(15) NOT NULL,
  DesignerID NUMERIC(5) NOT NULL,
  Payment NUMERIC(5) NOT NULL,
  PRIMARY KEY (DesignerID)
);

CREATE TABLE Equipment
(
  EquipmentId NUMERIC(5) NOT NULL,
  EquipmentName VARCHAR(15) NOT NULL,
  PRIMARY KEY (EquipmentId)
);

CREATE TABLE InStock
(
  Amount NUMERIC(5) NOT NULL,
  SupplierId NUMERIC(5) NOT NULL,
  EquipmentId NUMERIC(5) NOT NULL,
  PRIMARY KEY (SupplierId, EquipmentId),
  FOREIGN KEY (SupplierId) REFERENCES Supplier_(SupplierId),
  FOREIGN KEY (EquipmentId) REFERENCES Equipment(EquipmentId)
);

CREATE TABLE containing
(
  AmountC NUMERIC(5) NOT NULL,
  EquipmentId NUMERIC(5) NOT NULL,
  PackageId NUMERIC(5) NOT NULL,
  PRIMARY KEY (EquipmentId, PackageId),
  FOREIGN KEY (EquipmentId) REFERENCES Equipment(EquipmentId),
  FOREIGN KEY (PackageId) REFERENCES Pakcage(PackageId)
);

CREATE TABLE Invitation
(                                                                                                                                                                                                                                                               
  FinalPrice NUMERIC(7),
  InvitationId NUMERIC(5) NOT NULL,
  Datte DATE NOT NULL,
  ClientId VARCHAR(8) NOT NULL,
  DesignerId NUMERIC(5) NOT NULL,
  PackageId NUMERIC(5) NOT NULL,
  PRIMARY KEY (InvitationId),
  FOREIGN KEY (ClientId) REFERENCES Client(ClientId),
  FOREIGN KEY (DesignerID) REFERENCES Designer(DesignerID),
  FOREIGN KEY (PackageId) REFERENCES Pakcage(PackageId)
);
