-- 3.31.
SELECT DISTINCT
    rating
FROM
    film
WHERE
    rating IS NOT NULL;

-- 3.32
SELECT DISTINCT
    date_part('hour', rental_date) AS "rental_hour"
FROM
    rental
ORDER BY
    rental_hour;

-- 3.33.
SELECT DISTINCT
    rental_duration,
    rental_rate
FROM
    film
ORDER BY
    rental_duration;

-- 3.34.
SELECT
    first_name
FROM
    actor
ORDER BY
    last_name;

