-- 7.9.
-- parametrized JOINS by column from the table we are performing join upon.
SELECT
    c.first_name,
    c.last_name,
    d.title,
    d.rental_date
FROM
    customer AS c
    LEFT OUTER JOIN LATERAL (
    SELECT
        f.title,
        r.customer_id,
        r.rental_date
    FROM
        film AS f
        INNER JOIN inventory AS i USING (film_id)
        INNER JOIN rental AS r USING (inventory_id)
    WHERE
        f.rating = 'PG'
        AND r.customer_id = c.customer_id
    ORDER BY
        r.rental_date ASC
    LIMIT 1) AS d ON c.customer_id = d.customer_id;

