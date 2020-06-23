-- Unique tuples staff-customer.
SELECT DISTINCT
    staff_id,
    customer_id
FROM
    payment;

-- DISTINCT is run only after all functions.
SELECT DISTINCT
    date_part('year', payment_date) AS year,
    date_part('month', payment_date) AS month
FROM
    payment
ORDER BY
    year,
    month;