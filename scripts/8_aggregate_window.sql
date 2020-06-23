SELECT
    title,
    rating,
    length,
    avg(length) OVER (PARTITION BY rating) AS "Avg rating length"
FROM
    film;

-- Cumulative function
SELECT
    customer_id,
    payment_date,
    amount,
    sum(amount) OVER (PARTITION BY customer_id ORDER BY payment_date) AS "Cumulative spending"
FROM
    payment;

-- Moving average
SELECT
    customer_id,
    payment_date,
    amount,
    avg(amount) OVER (PARTITION BY customer_id ORDER BY payment_date ROWS 2 PRECEDING) AS "Last 3 payments"
FROM
    payment;

