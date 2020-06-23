-- 3.22.
SELECT
    first_name,
    last_name
FROM
    customer
WHERE
    email IS NOT NULL
ORDER BY
    last_name DESC;

-- 3.33
SELECT
    country_id,
    city
FROM
    city
ORDER BY
    country_id,
    city;

-- 3.34.
SELECT
    full_name,
    length(full_name) AS "len"
FROM (
    SELECT
        first_name || ' ' || last_name AS "full_name"
    FROM
        actor) AS s
ORDER BY
    len DESC;

