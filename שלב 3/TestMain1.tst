PL/SQL Developer Test script 3.0
76
DECLARE
    v_client_id VARCHAR2(8);
    v_designer_id NUMBER;
    v_package_id NUMBER;
    v_supplier_id NUMBER;
    v_inventory_value NUMBER;
    v_invitation_id NUMBER;
    v_final_price NUMBER;
    v_highest_order VARCHAR2(100);
    
    -- Variables to store IDs and prices of created orders
    v_invitation_ids VARCHAR2(100) := '';
    v_prices VARCHAR2(100) := '';
    
    CURSOR c_clients IS
        SELECT ClientId FROM Client;
    
    CURSOR c_designers IS
        SELECT DesignerID FROM Designer;
    
    CURSOR c_packages IS
        SELECT PackageId FROM Pakcage;
    
    CURSOR c_suppliers IS
        SELECT SupplierId FROM Supplier_;
    
BEGIN
    -- Create 5 random invitations
    FOR i IN 1..5 LOOP
        -- Select random client, designer, and package
        SELECT ClientId INTO v_client_id FROM (
            SELECT ClientId FROM Client ORDER BY DBMS_RANDOM.VALUE
        ) WHERE ROWNUM = 1;
        
        SELECT DesignerID INTO v_designer_id FROM (
            SELECT DesignerID FROM Designer ORDER BY DBMS_RANDOM.VALUE
        ) WHERE ROWNUM = 1;
        
        SELECT PackageId INTO v_package_id FROM (
            SELECT PackageId FROM Pakcage ORDER BY DBMS_RANDOM.VALUE
        ) WHERE ROWNUM = 1;
        
        -- Call the add_invitation procedure
        add_invitation(v_client_id, v_designer_id, v_package_id);
          -- Get the invitation ID and final price of the just-created invitation
        SELECT InvitationId, FinalPrice 
        INTO v_invitation_id, v_final_price
        FROM Invitation
        WHERE InvitationId = (SELECT MAX(InvitationId) FROM Invitation);
        
        -- Store the ID and price
        v_invitation_ids := v_invitation_ids || v_invitation_id || ',';
        v_prices := v_prices || v_final_price || ',';
        
        DBMS_OUTPUT.PUT_LINE('Created Invitation ID: ' || v_invitation_id || ', Price: $' || v_final_price);
        DBMS_OUTPUT.PUT_LINE('--------------------');
    END LOOP;
      -- Remove trailing commas
    v_invitation_ids := RTRIM(v_invitation_ids, ',');
    v_prices := RTRIM(v_prices, ',');
    
    -- Calculate and print inventory value for each supplier
    FOR supplier IN c_suppliers LOOP
        v_inventory_value := calculateS(supplier.SupplierId);
        DBMS_OUTPUT.PUT_LINE('Supplier ID ' || supplier.SupplierId || ' inventory value: $' || v_inventory_value);
    END LOOP;
    
      -- Find and print the highest priced order among the 5 created orders
    v_highest_order := get_price(v_invitation_ids, v_prices);
    DBMS_OUTPUT.PUT_LINE('--------------------');
    DBMS_OUTPUT.PUT_LINE('Highest Priced Order: ' || v_highest_order);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
0
0
