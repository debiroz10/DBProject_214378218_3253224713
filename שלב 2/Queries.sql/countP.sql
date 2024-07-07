SELECT EquipmentId, COUNT(PackageId) AS package_count
FROM containing
GROUP BY EquipmentId
ORDER BY package_count DESC;
