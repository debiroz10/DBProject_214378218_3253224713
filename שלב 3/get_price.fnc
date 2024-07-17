CREATE OR REPLACE FUNCTION get_price(
    p_invitation_ids IN VARCHAR2,
    p_prices IN VARCHAR2
) RETURN VARCHAR2
IS
    TYPE t_numbers IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    v_ids t_numbers;
    v_prices t_numbers;
    v_max_price NUMBER := 0;
    v_max_id NUMBER := 0;
    v_index PLS_INTEGER := 1;
BEGIN
    -- Parse the input strings into arrays
    FOR i IN (SELECT REGEXP_SUBSTR(p_invitation_ids, '[^,]+', 1, LEVEL) AS val
              FROM DUAL
              CONNECT BY REGEXP_SUBSTR(p_invitation_ids, '[^,]+', 1, LEVEL) IS NOT NULL)
    LOOP
        v_ids(v_index) := TO_NUMBER(i.val);
        v_index := v_index + 1;
    END LOOP;

    v_index := 1;
    FOR i IN (SELECT REGEXP_SUBSTR(p_prices, '[^,]+', 1, LEVEL) AS val
              FROM DUAL
              CONNECT BY REGEXP_SUBSTR(p_prices, '[^,]+', 1, LEVEL) IS NOT NULL)
    LOOP
        v_prices(v_index) := TO_NUMBER(i.val);
        v_index := v_index + 1;
    END LOOP;

    -- Find the highest price and corresponding ID
    FOR i IN 1..v_prices.COUNT LOOP
        IF v_prices(i) > v_max_price THEN
            v_max_price := v_prices(i);
            v_max_id := v_ids(i);
        END IF;
    END LOOP;

    RETURN 'Highest Price: $' || v_max_price || ', Invitation ID: ' || v_max_id;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error finding highest priced order: ' || SQLERRM;
END;
/
