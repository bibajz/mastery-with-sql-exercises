-- 7.12.
/*
select
 r.customer_id
from rental as r
except
select distinct
 r1.customer_id
from rental as r1
left outer join rental as r2 on date_trunc('year', r1.rental_date) = date_trunc('year', r2.rental_date) + interval '1 year'
where r1.customer_id = r2.customer_id
order by customer_id;
 */
WITH rentals_2005 AS (
    SELECT DISTINCT
        customer_id
    FROM
        rental AS r
    WHERE
        date_trunc('year', r.rental_date) = '2005-01-01'
),
rentals_2006 AS (
    SELECT DISTINCT
        customer_id
    FROM
        rental AS r
    WHERE
        date_trunc('year', r.rental_date) = '2006-01-01'
)
SELECT
    *
FROM
    rentals_2005
EXCEPT
SELECT
    *
FROM
    rentals_2006
ORDER BY
    customer_id;

-- 7.13.
WITH "customer_count" AS (
    SELECT
        count(*)
    FROM
        customer
)
SELECT
    country,
    count(*) AS "num customers",
    round(100 * count(*) / (
        SELECT
            count FROM customer_count))
FROM
    country
    INNER JOIN city USING (country_id)
    INNER JOIN address USING (city_id)
    INNER JOIN customer USING (address_id)
GROUP BY
    country
ORDER BY
    "num customers" DESC
LIMIT 3;

-- 7.14.
WITH monthly_income AS (
    SELECT
        date_trunc('month', payment_date) AS "month",
        sum(amount) AS "income"
    FROM
        payment
    GROUP BY
        "month"
)
SELECT
    mi.month,
    mi.income,
    (
        SELECT
            sum(m.income)
        FROM
            monthly_income AS m
        WHERE
            m.month <= mi.month) AS "cumulative income"
FROM
    monthly_income AS mi
ORDER BY
    mi.month;

-- 7.15.
SELECT
    id
FROM
    generate_series(1, 16049) AS gen (id)
    LEFT JOIN rental ON gen.id = rental.rental_id
WHERE
    rental.rental_id IS NULL;

-- 7.16.
WITH "payment_january" AS (
    SELECT
        payment_id,
        amount,
        payment_date
    FROM
        payment
    WHERE
        date_trunc('month', payment_date) = '2007-01-01'
    ORDER BY
        payment_date DESC
    LIMIT 3
)
SELECT
    *
FROM
    payment_january
ORDER BY
    payment_date ASC;

