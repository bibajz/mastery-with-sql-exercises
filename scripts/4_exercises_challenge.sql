-- 4.11.
-- avg1 and avg2 differ in results, since avg() does not consider NULLs, count() does!

SELECT
    1.0 * sum(length) / count(*) AS avg1,
    1.0 * avg(length) AS avg2,
    sum(length),
    count(*),
    1.0 * sum(length) / (count(*) - count(
            CASE WHEN length IS NULL THEN
                1
            END))
FROM
    film;

-- 4.12.
SELECT
    customer_id,
    avg(return_date - rental_date) AS "avg_rent_duration"
FROM
    rental
GROUP BY
    customer_id
ORDER BY
    "avg_rent_duration" DESC;

-- 4.13.
SELECT
    customer_id
FROM
    payment
GROUP BY
    customer_id
HAVING
    bool_and(amount > 2);

-- 4.14
SELECT
    rating,
    repeat('$', (count(*) / 20)::int) AS "count/20"
FROM
    film
WHERE
    rating IS NOT NULL
GROUP BY
    rating;

