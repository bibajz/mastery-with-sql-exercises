-- https://www.postgresql.org/docs/12/functions-string.html
SELECT
    rental_date,
    return_date,
    (return_date - rental_date) AS "rented for"
FROM
    rental;

SELECT
    first_name,
    last_name,
    first_name || ' ' || last_name AS "Full Name"
FROM
    customer
LIMIT 10;

-- Only lower case
SELECT
    first_name,
    last_name,
    lower(first_name || ' ' || last_name) AS "Full Name"
FROM
    customer
LIMIT 10;

-- First letter is capitalized, rest is lower case
SELECT
    first_name,
    last_name,
    initcap(first_name || ' ' || last_name) AS "Full Name"
FROM
    customer
LIMIT 10;

