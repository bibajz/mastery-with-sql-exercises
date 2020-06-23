-- 3.8.
SELECT
    title,
    rating
FROM
    film
WHERE
    rating = 'G';

-- 3.9.
SELECT
    title,
    length
FROM
    film
WHERE
    length >= 120;

-- 3.10.
SELECT
    rental_id,
    rental_date
FROM
    rental
WHERE
    rental_date < '2005-06-01';

-- 3.11.
SELECT
    title,
    rental_rate,
    replacement_cost,
    ceil(replacement_cost / rental_rate) AS "break-even"
FROM
    film
WHERE
    ceil(replacement_cost / rental_rate) > 30;

