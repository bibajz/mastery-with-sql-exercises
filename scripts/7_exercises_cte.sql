-- 7.10.
WITH subsequent_rentals (
    "customer_id",
    "inv_id1",
    "inv_id2"
) AS (
    SELECT
        r1.customer_id,
        r1.inventory_id,
        r2.inventory_id
    FROM
        rental AS r1
        INNER JOIN rental AS r2 ON r1.customer_id = r2.customer_id
    WHERE
        r1.rental_date < r2.rental_date
)
SELECT
    customer_id
FROM
    subsequent_rentals
    INNER JOIN inventory AS i1 ON i1.inventory_id = subsequent_rentals.inv_id1
    INNER JOIN film AS f1 ON i1.film_id = f1.film_id
    INNER JOIN inventory AS i2 ON i2.inventory_id = subsequent_rentals.inv_id2
    INNER JOIN film AS f2 ON i2.film_id = f2.film_id
WHERE
    f1.title = 'BRIDE INTRIGUE'
    AND f2.title = 'STAR OPERATION';

-- better
WITH rental_detail AS (
    SELECT
        r.customer_id,
        r.rental_date,
        f.title
    FROM
        rental AS r
        INNER JOIN inventory AS i USING (inventory_id)
        INNER JOIN film AS f USING (film_id))
SELECT
    rd1.customer_id
FROM
    rental_detail AS rd1
    INNER JOIN rental_detail AS rd2 ON rd1.customer_id = rd2.customer_id
WHERE
    rd1.rental_date < rd2.rental_date
    AND rd1.title = 'BRIDE INTRIGUE'
    AND rd2.title = 'STAR OPERATION';

-- 7.11.
WITH monthly_income AS (
    SELECT
        date_trunc('month', payment_date) AS "month",
        sum(amount) AS "income"
    FROM
        payment
    GROUP BY
        "month"
),
prev_month_income AS (
    SELECT
        mi.month,
        mi.income,
        (
            SELECT
                income
            FROM
                monthly_income
            WHERE
                monthly_income.month < mi.month
            ORDER BY
                monthly_income.month DESC
            LIMIT 1) AS "prev_month_income"
FROM
    monthly_income AS mi
)
SELECT
    month,
    income,
    prev_month_income,
    income - prev_month_income AS "change"
FROM
    prev_month_income
ORDER BY
    month;

