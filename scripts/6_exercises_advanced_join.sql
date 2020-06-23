-- 6.8.
/*
if you want zeroes in the aggregation using outer join, use count() on values
that can be null.

select count(*);
 count 
-------
 1
(1 row)

select count(null);
 count 
-------
 0
(1 row)
 */
SELECT
    c.customer_id,
    count(r.rental_id) AS "# rented"
FROM
    customer AS c
    LEFT OUTER JOIN rental AS r ON c.customer_id = r.customer_id
    AND date_trunc('day', r.rental_date) = '2005-05-24'
GROUP BY
    c.customer_id
ORDER BY
    "# rented" DESC,
    c.customer_id;

SELECT
    c.customer_id,
    count(*) AS "# rented" -- incorrect!
FROM
    customer AS c
    LEFT OUTER JOIN rental AS r ON c.customer_id = r.customer_id
    AND date_trunc('day', r.rental_date) = '2005-05-24'
GROUP BY
    c.customer_id
ORDER BY
    "# rented" DESC,
    c.customer_id;

