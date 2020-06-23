-- 11.6.
BEGIN;
UPDATE
    customer
SET
    email = lower(first_name) || '.' || lower(last_name) || '@sakilacustomer.org'
RETURNING
    *;
ROLLBACK;

-- 11.7.
BEGIN;
UPDATE
    film
SET
    rental_rate = 1.1 * rental_rate
WHERE
    film_id IN (
        SELECT
            film_id
        FROM
            film AS f
            INNER JOIN inventory AS i USING (film_id)
            INNER JOIN rental AS r USING (inventory_id)
        GROUP BY
            film_id
        ORDER BY
            count(*) DESC
        LIMIT 20)
RETURNING
    film_id,
    rental_rate;
ROLLBACK;

-- 11.8.
BEGIN;
ALTER TABLE film
    ADD COLUMN length_hrs numeric(2, 1);
UPDATE
    film
SET
    length_hrs = length / 60.0
RETURNING
    length,
    length_hrs;
ROLLBACK;

