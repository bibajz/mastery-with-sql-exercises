SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    (
        SELECT
            max(rental_date)
        FROM
            rental AS r
        WHERE
            r.customer_id = c.customer_id) AS "last rental date"
FROM
    customer AS c;

SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM
    customer AS c
WHERE (
    SELECT
        sum(amount)
    FROM
        payment AS p
    WHERE
        p.customer_id = c.customer_id) < 100;

-- Customers that never paid.
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM
    customer AS c
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            payment AS p
        WHERE
            p.customer_id = c.customer_id);

SELECT
    r1.rental_id,
    r1.customer_id,
    r1.rental_date,
    (
        SELECT
            max(r2.rental_date)
        FROM
            rental AS r2
        WHERE
            r2.customer_id = r1.customer_id
            AND r2.rental_date < r1.rental_date) AS "prev_rental_date"
FROM
    rental AS r1
ORDER BY
    r1.customer_id,
    r1.rental_date DESC;

