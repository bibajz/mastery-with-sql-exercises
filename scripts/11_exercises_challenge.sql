-- 11.11.
BEGIN;
UPDATE
    customer
SET
    activebool = customer_id IN ( SELECT DISTINCT
            customer_id
        FROM
            rental
        WHERE
            rental_date >= '2006-01-01')
RETURNING
    *;
ROLLBACK;

-- 11.12.
-- Can be done using correlated subquery.

BEGIN;
CREATE TABLE inventory_stats (
    film_id int REFERENCES film (film_id),
    store_id int REFERENCES store (store_id),
    stock_count int NOT NULL,
    PRIMARY KEY (film_id, store_id)
);
INSERT INTO inventory_stats (film_id, store_id, stock_count)
SELECT
    f.film_id,
    s.store_id,
    count(i.inventory_id) AS "stock_count"
FROM
    film AS f
    CROSS JOIN store AS s
    LEFT OUTER JOIN inventory AS i ON i.film_id = f.film_id
        AND i.store_id = s.store_id
GROUP BY
    f.film_id,
    s.store_id
ON CONFLICT (film_id, -- UPSERT example
    store_id)
    DO UPDATE SET
        stock_count = excluded.stock_count;
ROLLBACK;

-- 11.13.
BEGIN;

WITH deleted_rentals AS (
    DELETE FROM rental
    WHERE rental_id IN ( SELECT DISTINCT ON (customer_id)
                rental_id
            FROM
                rental
            ORDER BY
                customer_id,
                rental_date ASC)
        RETURNING
            rental_id)
DELETE FROM payment
WHERE rental_id IN (
        SELECT
            rental_id
        FROM
            deleted_rentals);
ROLLBACK;

-- 11.14.
BEGIN;
CREATE TABLE mpaa_ratings (
    rating text PRIMARY KEY
);
INSERT INTO mpaa_ratings SELECT DISTINCT
    coalesce(rating::text, 'G')
FROM
    film;
ALTER TABLE film
    ALTER COLUMN rating DROP DEFAULT,
    ALTER COLUMN rating TYPE text,
    ALTER COLUMN rating SET DEFAULT 'G';
UPDATE
    film
SET
    rating = rating::text;
ALTER TABLE film
    ADD CONSTRAINT film_mpaa_ratings_fkey FOREIGN KEY (rating) REFERENCES mpaa_ratings (rating);
DROP TYPE mpaa_rating CASCADE;
ROLLBACK;

