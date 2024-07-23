CREATE VIEW EventDesignView AS
SELECT 
    i.InvitationId,
    i.FinalPrice,
    i.Datte AS EventDate,
    c.ClientId,
    c.ClientName,
    c.Phone AS ClientPhone,
    c.BirthDate AS ClientBirthDate,
    d.DesignerID,
    d.DesignerName,
    d.Payment AS DesignerPayment,
    p.PackageId,
    p.PackageName,
    p.Price AS PackagePrice,
    e.EquipmentId,
    e.EquipmentName,
    co.AmountC AS EquipmentAmountInPackage,
    inStock.Amount AS EquipmentAmountInStock,
    s.SupplierName,
    s.Area AS SupplierArea
FROM Invitation i
JOIN Client c ON i.ClientId = c.ClientId
JOIN Designer d ON i.DesignerId = d.DesignerID
JOIN Pakcage p ON i.PackageId = p.PackageId
JOIN containing co ON p.PackageId = co.PackageId
JOIN Equipment e ON co.EquipmentId = e.EquipmentId
JOIN InStock inStock ON e.EquipmentId = inStock.EquipmentId
JOIN Supplier_ s ON inStock.SupplierId = s.SupplierId;


select * from EventDesignView


