--- 3.5.
SELECT
    first_name,
    char_length(first_name) AS length
FROM
    customer;

--- 3.6.
SELECT
    first_name,
    last_name,
    upper(
    LEFT (first_name, 1) ||
    LEFT (last_name, 1)) AS "initial"
FROM
    customer;

--- 3.7.
SELECT
    title,
    rental_rate,
    replacement_cost,
    ceil(replacement_cost / rental_rate) AS "break-even"
FROM
    film;

