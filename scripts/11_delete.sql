BEGIN;
DELETE FROM payment
WHERE customer_id IN (
        SELECT
            customer_id
        FROM
            customer
        WHERE
            lower(first_name) = 'john')
RETURNING
    *;
ROLLBACK;

-- TRUNCATE is fater, but table must not have any foreign key constraints...
BEGIN;
TRUNCATE TABLE payment;
SELECT
    *
FROM
    payment;
ROLLBACK;

