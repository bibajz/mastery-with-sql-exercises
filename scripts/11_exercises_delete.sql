-- 11.9.
BEGIN;
DELETE FROM payment
WHERE amount = 0
RETURNING
    *;
ROLLBACK;

-- 11.10.
BEGIN;
DELETE FROM
LANGUAGE
WHERE language_id NOT IN ( SELECT DISTINCT
            language_id
        FROM
            film)
RETURNING
    *;
ROLLBACK;

