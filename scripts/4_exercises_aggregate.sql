-- 4.1.
SELECT
    count(customer_id) AS "# customers",
    count(email) AS "# customer emails"
FROM
    customer;

-- 4.2.
SELECT
    count(customer_id) AS "# customers",
    count(email) AS "# customer emails",
    1.0 * count(email) / count(customer_id) AS "% with email"
FROM
    customer;

-- 4.3.
SELECT
    count(DISTINCT customer_id)
FROM
    payment;

SELECT
    avg(return_date - rental_date) AS "avg rental duration"
FROM
    rental;

SELECT
    sum(amount) AS "total"
FROM
    payment;

