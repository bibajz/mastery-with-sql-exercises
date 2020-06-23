-- 3.18.
SELECT
    title,
    rating
FROM
    film
WHERE
    rating IN ('G', 'PG', 'PG-13');

-- 3.19.
SELECT
    title,
    length
FROM
    film
WHERE
    length BETWEEN 90 AND 120;

-- 3.20.
SELECT
    title
FROM
    film
WHERE
    title LIKE '%GRAFFITI';

-- 3.21.
SELECT
    title,
    rating
FROM
    film
WHERE
    rating NOT IN ('PG', 'G');
