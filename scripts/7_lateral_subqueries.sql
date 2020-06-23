--
SELECT
    c.customer_id,
    d.rental_date
FROM
    customer AS c
    INNER JOIN LATERAL ( -- Here you must put LATERAL, since the join is parametrized.
        SELECT
            r.customer_id,
            r.rental_id,
            r.rental_date
        FROM
            rental AS r
        WHERE
            r.customer_id = c.customer_id
        ORDER BY
            r.rental_date DESC
        LIMIT 3) AS d ON c.customer_id = d.customer_id;

