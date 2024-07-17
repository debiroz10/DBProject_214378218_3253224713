CREATE OR REPLACE PROCEDURE add_invitation(
    p_client_id IN VARCHAR2,
    p_designer_id IN NUMBER,
    p_package_id IN NUMBER
) AS
    v_invitation_id NUMBER;
    v_final_price NUMBER;
BEGIN
    -- Generate a new invitation ID
    SELECT NVL(MAX(InvitationId), 0) + 1 INTO v_invitation_id FROM Invitation;
    
    -- Calculate final price (package price + designer payment)
    SELECT Price + Payment INTO v_final_price
    FROM Pakcage p
    JOIN Designer d ON d.DesignerID = p_designer_id
    WHERE p.PackageId = p_package_id;
    
    -- Insert new invitation
    INSERT INTO Invitation (InvitationId, Datte, ClientId, DesignerId, PackageId, FinalPrice)
    VALUES (v_invitation_id, SYSDATE, p_client_id, p_designer_id, p_package_id, v_final_price);
    
    -- Print basic invitation details
    DBMS_OUTPUT.PUT_LINE('New Invitation Created: ID ' || v_invitation_id || ', Price: $' || v_final_price);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding invitation: ' || SQLERRM);
        ROLLBACK;
END;
/
