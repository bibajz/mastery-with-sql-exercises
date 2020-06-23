SELECT
    first_name,
    last_name,
    amount,
    sum(amount) OVER (PARTITION BY customer_id) AS "total spent"
FROM
    customer
    INNER JOIN payment AS p USING (customer_id);

