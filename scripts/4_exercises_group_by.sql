-- 4.6.
SELECT
    actor_id,
    count(*) AS "num_films"
FROM
    film_actor
GROUP BY
    actor_id
ORDER BY
    "num_films" DESC;

-- 4.7.
SELECT
    customer_id
FROM
    rental
GROUP BY
    customer_id
HAVING
    count(*) > 40;

-- 4.8.
SELECT
    date_part('year', payment_date) AS "year",
    date_part('month', payment_date) AS "month",
    staff_id,
    count(amount) AS "# payments",
    sum(amount) AS "total payment",
    avg(amount) AS "average payment"
FROM
    payment
GROUP BY
    date_part('year', payment_date),
    date_part('month', payment_date),
    staff_id
ORDER BY
    year,
    month,
    staff_id;

