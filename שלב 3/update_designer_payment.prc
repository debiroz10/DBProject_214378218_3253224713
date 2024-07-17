CREATE OR REPLACE PROCEDURE update_designer_payment(
    p_designer_id IN NUMBER,
    p_increase_percentage IN NUMBER
) AS
    v_current_payment NUMBER;
    v_new_payment NUMBER;
BEGIN
    -- Get current payment
    SELECT Payment INTO v_current_payment
    FROM Designer
    WHERE DesignerID = p_designer_id;

    -- Calculate new payment
    v_new_payment := v_current_payment * (1 + p_increase_percentage / 100);

    -- Update designer payment
    UPDATE Designer
    SET Payment = v_new_payment
    WHERE DesignerID = p_designer_id;

    DBMS_OUTPUT.PUT_LINE('Designer ' || p_designer_id || ' payment updated from $' || 
                         v_current_payment || ' to $' || v_new_payment);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Designer ' || p_designer_id || ' not found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating designer payment: ' || SQLERRM);
END;
/
