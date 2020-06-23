-- 8.4.
SELECT
    customer_id,
    rental_id,
    return_date - rental_date AS "rental duration",
    avg(return_date - rental_date) OVER (PARTITION BY customer_id)
FROM
    rental;

-- 8.5.
WITH monthly_income AS (
    SELECT
        date_trunc('month', payment_date) AS "month",
        sum(amount) AS "amount"
    FROM
        payment
    GROUP BY
        "month"
)
SELECT
    month,
    amount,
    sum(amount) OVER (ORDER BY month) AS "running total"
    FROM
        monthly_income;

