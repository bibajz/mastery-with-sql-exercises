-- 5.9.
-- condition can be '01' or '1', does not matter.
SELECT
    count(*) AS "# End-of-month rentals"
FROM
    rental
WHERE
    date_part('day', rental_date + interval '1 day') = '01';

-- 5.10.
SELECT
    title
FROM
    film
WHERE
    LEFT (title, 1) = ' '
    OR
    RIGHT (title,
        1) = ' ';

-- 5.11.
SELECT
    customer_id,
    round(extract(epoch FROM (sum(return_date - rental_date))) / 3600) AS "hrs_rented"
FROM
    rental
GROUP BY
    customer_id
ORDER BY
    "hrs_rented" DESC
LIMIT 3;

-- 5.12.
SELECT
    make_timestamptz(2019, generate_series, 1, 17, 0, 0, 'UTC')
FROM
    generate_series(1, 12);

-- 5.13.
SELECT
    first_name,
    length(replace(first_name, 'A', 'XX')) - length(first_name) AS count
FROM
    customer
GROUP BY
    first_name,
    2
ORDER BY
    2 DESC;

-- 5.14.
SELECT
    sum(
        CASE WHEN extract(isodow FROM payment_date) BETWEEN 6 AND 7 THEN
            amount
        END) AS "total $"
FROM
    payment;

