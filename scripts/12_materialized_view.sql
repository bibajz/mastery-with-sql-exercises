/*
Video suggests following:
SELECT
    c.customer_id,
    (
        SELECT
            array_agg(r.rental_id)
        FROM
            rental AS r
        WHERE
            r.customer_id = c.customer_id) AS "rentals"
FROM
    customer AS c
ORDER BY
    c.customer_id;

I think it can be done much better without the correlated subquery.
 */
SELECT
    c.customer_id,
    array_agg(r.rental_id) AS "rentals"
FROM
    customer AS c
    INNER JOIN rental AS r USING (customer_id)
GROUP BY
    c.customer_id;
