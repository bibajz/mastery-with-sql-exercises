SELECT
    customer_id,
    justify_hours(sum(return_date - rental_date)) AS "rented"
FROM
    rental
GROUP BY
    customer_id
ORDER BY
    "rented" DESC;

