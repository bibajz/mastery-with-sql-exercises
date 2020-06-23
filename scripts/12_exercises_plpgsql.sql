-- 12.9.
DROP FUNCTION discount_eligible;

CREATE OR REPLACE FUNCTION discount_eligible (c_id int, f_id int)
    RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
    has_unreturned boolean := (
        SELECT
            EXISTS (
                SELECT
                    1
                FROM
                    rental AS r
                WHERE
                    r.customer_id = c_id
                    AND return_date IS NULL));
BEGIN
    IF has_unreturned THEN
        RETURN FALSE;
    elsif f_id IN ( SELECT DISTINCT
                f.film_id
            FROM
                film AS f
                INNER JOIN inventory AS i USING (film_id)
                INNER JOIN rental AS r USING (inventory_id)
            WHERE
                r.customer_id = c_id) THEN
        RETURN FALSE;
    ELSE
        RETURN TRUE;
    END IF;
END;
$$;

