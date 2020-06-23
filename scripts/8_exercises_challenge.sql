-- 8.6.
SELECT
    *
FROM (
    SELECT
        *,
        rank() OVER (PARTITION BY rating ORDER BY income DESC)
    FROM (
    SELECT
        f.title,
        f.rating,
        sum(rental_rate) AS "income"
    FROM
        film AS f
        INNER JOIN inventory AS i USING (film_id)
        INNER JOIN rental AS r USING (inventory_id)
    GROUP BY
        f.film_id) AS t
WHERE
    rating IS NOT NULL) AS s
WHERE
    rank <= 3;

-- 8.7.
WITH t AS (
    SELECT
        rental_id AS CURRENT,
        lead(rental_id) OVER (ORDER BY rental_id) AS NEXT
    FROM
        rental
)
SELECT
    CURRENT + 1 AS missing_from,
    NEXT - 1 AS missing_to
FROM
    t
WHERE
    NEXT - CURRENT > 1;

-- 8.8
SELECT
    customer_id,
    max(break) AS "longest break"
FROM (
    SELECT
        customer_id,
        lead(rental_date) OVER (PARTITION BY customer_id ORDER BY rental_date) - rental_date AS "break"
    FROM
        rental) AS t
GROUP BY
    customer_id
ORDER BY
    customer_id;

