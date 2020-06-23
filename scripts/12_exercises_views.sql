-- 12.1.
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

SELECT
    *
FROM
    vw_rental_film;

-- 12.2.
SELECT
    c.customer_id,
    count(rf.rental_id)
FROM
    customer AS c
    INNER JOIN rental AS r USING (customer_id)
    LEFT OUTER JOIN vw_rental_film AS rf ON r.rental_id = rf.rental_id
        AND rf.rating = 'R'
GROUP BY
    c.customer_id
ORDER BY
    c.customer_id;

-- 12.3.
DROP VIEW IF EXISTS vw_monthly_totals;

CREATE VIEW vw_monthly_totals AS
SELECT
    date_trunc('month', payment_date) AS month,
    sum(amount) AS "total"
FROM
    payment
GROUP BY
    1
ORDER BY
    month ASC;

SELECT
    month,
    total,
    lag(total, 1) OVER (ORDER BY month) AS "prev month income",
    total - lag(total, 1) OVER (ORDER BY month) AS "change"
FROM
    vw_monthly_totals;

