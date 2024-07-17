CREATE OR REPLACE FUNCTION calculateS(p_supplier_id IN NUMBER)
RETURN NUMBER
IS
    v_total_value NUMBER := 0;
    
    CURSOR c_inventory IS
        SELECT i.Amount, p.Price
        FROM InStock i
        JOIN containing c ON i.EquipmentId = c.EquipmentId
        JOIN Pakcage p ON c.PackageId = p.PackageId
        WHERE i.SupplierId = p_supplier_id;
    
    TYPE t_inventory_item IS RECORD (
        amount NUMBER,
        price NUMBER
    );
    v_inventory_item t_inventory_item;
    
BEGIN
    OPEN c_inventory;
    LOOP
        FETCH c_inventory INTO v_inventory_item;
        EXIT WHEN c_inventory%NOTFOUND;
        
        v_total_value := v_total_value + (v_inventory_item.amount * v_inventory_item.price);
    END LOOP;
    CLOSE c_inventory;
    
    RETURN v_total_value;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN NULL;
END;
/
