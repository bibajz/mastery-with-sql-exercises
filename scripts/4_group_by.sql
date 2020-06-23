SELECT
    rating,
    sum(length)
FROM
    film
WHERE
    rating IS NOT NULL
GROUP BY
    rating;

SELECT
    customer_id,
    staff_id,
    count(*)
FROM
    payment
GROUP BY
    customer_id,
    staff_id
HAVING
    count(*) >= 15
ORDER BY
    customer_id;

SELECT
    sum(length)
FROM
    film
GROUP BY
    LEFT (title,
        1);

