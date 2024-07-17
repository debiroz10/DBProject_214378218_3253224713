CREATE OR REPLACE FUNCTION get_package_popularity(
    p_package_id IN NUMBER
) RETURN NUMBER AS
    v_popularity NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_popularity
    FROM Invitation
    WHERE PackageId = p_package_id;

    RETURN v_popularity;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error calculating package popularity: ' || SQLERRM);
        RETURN -1;
END;
/
