-- 3.38.
-- Use some CTEs and joins, try to flex your SQL skills...

WITH customer_count AS (
    SELECT
        count(*)
    FROM
        customer
),
winner_ids AS (
    SELECT
        floor(random() * (
            SELECT
                count FROM customer_count)) + 1 AS winner_id
    FROM
        generate_series(1, 5))
SELECT
    first_name,
    last_name,
    email
FROM
    customer
    INNER JOIN winner_ids ON customer.customer_id = winner_ids.winner_id;

-- ... or be smart. :D
SELECT
    first_name,
    last_name,
    email
FROM
    customer
ORDER BY
    random()
LIMIT 5;

-- 3.39
-- 1.

SELECT
    rental_id,
    rental_date
FROM
    rental
WHERE
    date_part('year', rental_date) = 2005
    AND date_part('month', rental_date) = '06';

-- 2.
SELECT
    rental_id,
    rental_date
FROM
    rental
WHERE
    rental_date BETWEEN '2005-06-01 00:00:00'
    AND '2005-06-30 24:00:00';

;

-- 3.
SELECT
    rental_id,
    rental_date
FROM
    rental
WHERE
    rental_date >= '2005-06-01 00:00:00'
    AND rental_date <= '2005-06-30 24:00:00';

-- 3.40.
SELECT
    title,
    rental_rate,
    length,
    (rental_rate / length) AS "per_minute"
FROM
    film
WHERE (length IS NOT NULL
    AND length <> 0)
ORDER BY
    "per_minute" DESC
LIMIT 5;

-- 3.41.
SELECT
    first_name
FROM
    customer
WHERE
    first_name LIKE '%A%A%';

-- 3.42.
SELECT DISTINCT ON (customer_id)
    customer_id,
    rental_date
FROM
    rental
ORDER BY
    customer_id ASC,
    rental_date DESC;

-- 3.43.
SELECT
    first_name,
    last_name,
    email
FROM
    customer
WHERE
    email NOT LIKE first_name || '.' || last_name || '@sakilacustomer.org';

