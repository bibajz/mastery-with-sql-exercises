-- 6.9.
SELECT
    f.film_id,
    s.store_id,
    count(i.inventory_id) AS "stock"
FROM
    film AS f
    CROSS JOIN store AS s
    LEFT JOIN inventory AS i ON f.film_id = i.film_id
        AND i.store_id = s.store_id
GROUP BY
    f.film_id,
    s.store_id
ORDER BY
    stock,
    f.film_id,
    s.store_id;

-- 6.10.
SELECT
    t,
    count(rental.rental_id)
FROM
    generate_series('2005-01-01'::timestamptz, '2005-12-01'::timestamptz, interval '1 month') AS t
    LEFT OUTER JOIN rental ON date_trunc('month', rental.rental_date) = t
GROUP BY
    t;

-- 6.11.
SELECT
    r.customer_id
FROM
    rental AS r
    INNER JOIN inventory AS i1 ON r.inventory_id = i1.inventory_id
        AND i1.film_id = 97
    INNER JOIN inventory AS i2 ON i1.inventory_id < i2.inventory_id
        AND i2.film_id = 841
    INNER JOIN rental AS r2 ON i2.inventory_id = r2.inventory_id
        AND r.rental_date <= r2.rental_date
        AND r.customer_id = r2.customer_id;

-- Alternative - INNER JOINS with conditions and WHERE clauses are equivalent.
-- Not OUTER JOINS though!
SELECT
    r.customer_id
FROM
    rental AS r
    INNER JOIN inventory AS i1 ON r.inventory_id = i1.inventory_id
    INNER JOIN inventory AS i2 ON i1.inventory_id < i2.inventory_id
    INNER JOIN rental AS r2 ON i2.inventory_id = r2.inventory_id
WHERE
    i1.film_id = 97
    AND i2.film_id = 841
    AND r2.rental_date > r.rental_date
    AND r.customer_id = r2.customer_id;

