SELECT s.SupplierName, COUNT(i.InvitationId) AS total_orders
FROM Supplier_ s
JOIN InStock ins ON s.SupplierId = ins.SupplierId
JOIN Equipment e ON ins.EquipmentId = e.EquipmentId
JOIN containing c ON e.EquipmentId = c.EquipmentId
JOIN Pakcage p ON c.PackageId = p.PackageId
JOIN Invitation i ON p.PackageId = i.PackageId
GROUP BY s.SupplierName
HAVING COUNT(i.InvitationId) = (
  SELECT MAX(total_orders)
  FROM (
    SELECT COUNT(i2.InvitationId) AS total_orders
    FROM Supplier_ s2
    JOIN InStock is2 ON s2.SupplierId = is2.SupplierId
    JOIN Equipment e2 ON is2.EquipmentId = e2.EquipmentId
    JOIN containing c2 ON e2.EquipmentId = c2.EquipmentId
    JOIN Pakcage p2 ON c2.PackageId = p2.PackageId
    JOIN Invitation i2 ON p2.PackageId = i2.PackageId
    GROUP BY s2.SupplierName
  )  max_orders
);


