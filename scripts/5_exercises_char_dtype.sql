-- 5.1.
SELECT
    title || ' is ' || coalesce(length || ' minutes.', 'uknown length.') AS "length_desc"
FROM
    film;

-- 5.2.
SELECT
    LEFT (title,
        3) || repeat('*', length(title) - 3) AS "Guess!"
FROM
    film;

