-- 11.4.
BEGIN;
INSERT INTO customer (store_id, first_name, last_name, address_id, active)
    VALUES (1, 'Yolo', 'Swag', 1, TRUE::int)
RETURNING
    *;
ROLLBACK;

-- 11.5.
BEGIN;
CREATE TABLE rental_stats (
    rental_date date,
    rental_count int
);
INSERT INTO rental_stats
SELECT
    rental_date::date AS rental_day,
    count(*)
FROM
    rental
GROUP BY
    rental_day
ORDER BY
    rental_day
RETURNING
    *;
-- I can use CREATE TABLE AS, but RETURNING clause is prohibited...
CREATE TABLE rental_stats_direct AS
SELECT
    rental_date::date AS rental_day,
    count(*)
FROM
    rental
GROUP BY
    rental_day
ORDER BY
    rental_day;
ROLLBACK;

