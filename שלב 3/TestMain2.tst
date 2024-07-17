PL/SQL Developer Test script 3.0
48
DECLARE
    v_designer_id NUMBER;
    v_package_id NUMBER;
    v_designer_invitations NUMBER;
    v_package_popularity NUMBER;
    v_increase_percentage NUMBER;

    CURSOR c_designers IS
        SELECT DesignerID
        FROM Designer;

    CURSOR c_packages IS
        SELECT PackageId
        FROM Pakcage;

BEGIN
    -- Analyze designer performance and update payments
    FOR designer IN c_designers LOOP
        -- Count invitations for this designer
        SELECT COUNT(*) INTO v_designer_invitations
        FROM Invitation
        WHERE DesignerId = designer.DesignerID;

        -- Calculate payment increase based on performance
        v_increase_percentage := CASE
            WHEN v_designer_invitations > 10 THEN 10
            WHEN v_designer_invitations > 5 THEN 5
            ELSE 0
        END;

        -- Update designer payment
        update_designer_payment(designer.DesignerID, v_increase_percentage);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('--------------------');

    -- Analyze package popularity
    FOR package IN c_packages LOOP
        v_package_popularity := get_package_popularity(package.PackageId);

        DBMS_OUTPUT.PUT_LINE('Package ' || package.PackageId || 
                             ' popularity: ' || v_package_popularity || ' orders');
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in main program: ' || SQLERRM);
END;
0
0
