-- 3.16.
SELECT
    rental_id,
    return_date
FROM
    rental
WHERE
    return_date IS NULL;

-- 3.17.
SELECT
    title,
    rating
FROM
    film
WHERE (rating IS NULL)
    OR (rating != 'PG'
        AND rating != 'G');

