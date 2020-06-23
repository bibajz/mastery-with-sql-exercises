SELECT
    customer_id,
    rental_date,
    lag(rental_date, 1) OVER (PARTITION BY customer_id ORDER BY rental_date) AS "previous rental"
FROM
    rental;

