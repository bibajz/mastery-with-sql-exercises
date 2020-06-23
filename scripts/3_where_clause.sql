SELECT
    *
FROM
    customer
WHERE
    lower(last_name) = 'smith';

-- Timestamps are compared exact, not only days
SELECT
    *
FROM
    rental
WHERE
    rental_date = '2005-05-24 22:54:33';

-- Empty result, equivalent to '2005-05-24 00:00:00'
SELECT
    *
FROM
    rental
WHERE
    rental_date = '2005-05-24';

