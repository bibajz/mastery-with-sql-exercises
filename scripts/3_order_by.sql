SELECT
    title,
    length
FROM
    film
ORDER BY
    length,
    RIGHT (title,
        1) DESC nulls FIRST;

-- ORDER BY already knows the names of derived columns, unlike WHERE
SELECT
    title,
    rental_rate,
    replacement_cost,
    ceil(replacement_cost / rental_rate) AS "break_even"
FROM
    film
ORDER BY
    break_even DESC;

