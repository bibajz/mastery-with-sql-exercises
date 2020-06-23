-- 12.6.
CREATE OR REPLACE FUNCTION unreturned_rentals (IN c_id int)
    RETURNS bigint
    LANGUAGE sql
    AS $$
    SELECT
        count(*)
    FROM
        rental AS r
    WHERE
        r.customer_id = c_id
        AND r.return_date IS NULL
$$;

-- 12.7.
SELECT
    customer_id,
    (
        SELECT
            unreturned_rentals (customer_id))
FROM
    customer;

-- 12.8.
CREATE OR REPLACE FUNCTION rand_range (lower int, upper int)
    RETURNS int
    LANGUAGE sql
    AS $$
    SELECT
        lower + round(random() * (upper - lower))::int
$$;

