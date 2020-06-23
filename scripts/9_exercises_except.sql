-- 9.4.
SELECT
    id
FROM
    generate_series(1, 16049) AS gen (id)
EXCEPT
SELECT
    rental_id
FROM
    rental;

-- 9.5.
SELECT
    first_name,
    last_name
FROM
    customer
    INNER JOIN rental USING (customer_id)
WHERE
    extract(isodow FROM rental_date) = 6
EXCEPT
SELECT
    first_name,
    last_name
FROM
    customer
    INNER JOIN rental USING (customer_id)
WHERE
    extract(isodow FROM rental_date) = 7
