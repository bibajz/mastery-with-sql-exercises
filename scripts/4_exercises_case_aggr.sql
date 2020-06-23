-- 4.9.
SELECT
    count(*) FILTER (WHERE return_date - rental_date < interval '3 days') AS "lt 3 days",
    count(*) FILTER (WHERE return_date - rental_date >= interval '3 days') AS "gte 3 days",
    count(*) FILTER (WHERE return_date IS NULL) AS "never returned"
FROM
    rental;

-- 4.10.
SELECT
    CASE WHEN length >= 0
        AND length < 60 THEN
        '0-1hrs'
    WHEN length >= 60
        AND length < 120 THEN
        '1-2hrs'
    WHEN length >= 120
        AND length < 180 THEN
        '2-3hrs'
    WHEN length >= 180 THEN
        '3+hrs'
    ELSE
        '0-1hrs'
    END AS "len",
    count(*)
FROM
    film
GROUP BY
    CASE WHEN length >= 0
        AND length < 60 THEN
        '0-1hrs'
    WHEN length >= 60
        AND length < 120 THEN
        '1-2hrs'
    WHEN length >= 120
        AND length < 180 THEN
        '2-3hrs'
    WHEN length >= 180 THEN
        '3+hrs'
    ELSE
        '0-1hrs'
    END
ORDER BY
    count;

-- 4.10. Without the copy-pasta, using the '1' column alias
SELECT
    CASE WHEN length >= 0
        AND length < 60 THEN
        '0-1hrs'
    WHEN length >= 60
        AND length < 120 THEN
        '1-2hrs'
    WHEN length >= 120
        AND length < 180 THEN
        '2-3hrs'
    WHEN length >= 180 THEN
        '3+hrs'
    ELSE
        '0-1hrs'
    END AS "len",
    count(*)
FROM
    film
GROUP BY
    1
ORDER BY
    2;

