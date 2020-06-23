-- 12.5.
-- copy-pasta from 12.1.

DROP VIEW IF EXISTS vw_rental_film;

CREATE VIEW vw_rental_film AS
SELECT
  r.rental_id,
  f.title,
  f.length,
  f.rating
FROM
  rental AS r
  INNER JOIN inventory AS i USING (inventory_id)
  INNER JOIN film AS f USING (film_id)
ORDER BY
  r.rental_id ASC;

--
DROP MATERIALIZED VIEW IF EXISTS mvw_rental_film;

CREATE MATERIALIZED VIEW mvw_rental_film AS
SELECT
  *
FROM
  vw_rental_film;

BEGIN;
INSERT INTO rental (rental_date, inventory_id, customer_id, return_date, staff_id)
  VALUES (now(), 100, 100, NULL, 2), (now(), 150, 150, NULL, 2), (now(), 200, 200, NULL, 1);
SELECT
  *
FROM
  vw_rental_film
EXCEPT
SELECT
  *
FROM
  mvw_rental_film;
ROLLBACK;

