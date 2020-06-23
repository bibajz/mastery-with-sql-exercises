SELECT
    c1.first_name || ' ' || c1.last_name AS "customer 1",
    c2.first_name || ' ' || c2.last_name AS "customer 2"
FROM
    customer AS c1
    INNER JOIN customer AS c2 ON c1.customer_id < c2.customer_id;

SELECT
    count(*)
FROM
    customer;

