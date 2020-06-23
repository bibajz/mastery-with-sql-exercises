-- 3.35.
SELECT DISTINCT
    rating,
    CASE rating
    WHEN 'G' THEN
        'General'
    WHEN 'PG' THEN
        'Parental Guidance Recommended'
    WHEN 'PG-13' THEN
        'Parents strongly Cautioned'
    WHEN 'R' THEN
        'Restricted'
    WHEN 'NC-17' THEN
        'Adults Only'
    END AS "rating description"
FROM
    film
WHERE
    rating IS NOT NULL
ORDER BY
    rating;

-- 3.36
SELECT
    rental_id,
    rental_date,
    return_date,
    CASE WHEN return_date IS NULL THEN
        'Not Returned'
    ELSE
        'Returned'
    END AS "return_status"
FROM
    rental
ORDER BY
    return_status,
    rental_date ASC;

-- 3.37.
SELECT
    country
FROM
    country
ORDER BY
    CASE WHEN country IN ('Australia', 'United Kingdom', 'United States') THEN
        1
    ELSE
        2
    END,
    country ASC;

