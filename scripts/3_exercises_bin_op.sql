-- 3.12.
SELECT
    rental_id,
    rental_date
FROM
    rental
WHERE
    customer_id = 388
    AND (rental_date >= '2005-01-01'
        AND rental_date < '2006-01-01');

-- 3.13.
SELECT
    title,
    rental_duration,
    length
FROM
    film
WHERE
    NOT (length > 60);

SELECT
    title,
    rental_duration,
    length
FROM
    film
WHERE
    length <= 60;

-- 3.14.
SELECT
    title,
    rating
FROM
    film
WHERE
    rating != 'G'
    AND rating != 'PG';

-- 3.15.
SELECT
    rental_id,
    rental_date,
    return_date
FROM
    rental
WHERE (rental_date != return_date)
    OR (rental_date = return_date);

