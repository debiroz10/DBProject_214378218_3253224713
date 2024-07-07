SELECT 
    s.SupplierName, 
    e.EquipmentName, 
    i.Amount
FROM 
    Supplier_ s
JOIN 
    InStock i ON s.SupplierId = i.SupplierId
JOIN 
    Equipment e ON i.EquipmentId = e.EquipmentId
WHERE 
    s.SupplierId = &<name="supplier_name" 
                    list="SELECT SupplierId, SupplierName FROM Supplier_ ORDER BY SupplierName" 
                    description="yes" restricted="yes">;
