SELECT
    avg(total_rented)
FROM (
    SELECT
        customer_id,
        count(*)
    FROM
        rental
    GROUP BY
        customer_id) AS t (customer,
        total_rented);

SELECT
    title,
    rental_rate,
    replacement_cost,
    break_even
FROM (
    SELECT
        title,
        rental_rate,
        replacement_cost,
        ceil(replacement_cost / rental_rate) AS break_even
    FROM
        film) AS t
WHERE
    break_even > 30;


/*
Creation of virtual tables

Note that when inserting direct values into some table, you are actually creating
a virtual table!

INSERT INTO tab VALUES
...

 */
SELECT
    f.title,
    c.desc,
    f.length
FROM (
    VALUES ('short', 0, 60),
        ('medium', 61, 120),
        ('long', 121, 10000)) AS c ("desc", "min", "max")
    RIGHT JOIN film AS f ON f.length BETWEEN c.min
        AND c.max;

