-- 3.27
SELECT
    payment_id,
    payment_date
FROM
    payment
ORDER BY
    payment_date DESC
LIMIT 3;

-- 3.28
SELECT
    title,
    length,
    rating
FROM
    film
WHERE
    rating <> 'R'
ORDER BY
    length ASC,
    title ASC
LIMIT 4;

-- 3.29.
SELECT
    payment_id,
    amount,
    payment_date
FROM
    payment
WHERE
    payment_date BETWEEN '2007-01-01'
    AND '2007-02-01'
ORDER BY
    payment_date DESC
LIMIT 3;

-- 3.30.
SELECT
    *
FROM (
    SELECT
        payment_id,
        amount,
        payment_date
    FROM
        payment
    WHERE
        payment_date BETWEEN '2007-01-01'
        AND '2007-02-01'
    ORDER BY
        payment_date DESC
    LIMIT 3) AS s
ORDER BY
    payment_date ASC;

