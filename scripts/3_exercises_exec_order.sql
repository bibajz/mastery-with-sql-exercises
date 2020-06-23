-- 3.26
SELECT
    rental_id,
    date_part('hour', rental_date) AS "rental_hour"
FROM
    rental
WHERE
    date_part('hour', rental_date) >= 22;

SELECT
    rental_id,
    rental_hour
FROM (
    SELECT
        rental_id,
        date_part('hour', rental_date) AS "rental_hour"
    FROM
        rental) AS s
WHERE
    rental_hour >= 22
