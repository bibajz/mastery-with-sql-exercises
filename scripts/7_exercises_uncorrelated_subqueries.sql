-- 7.1.
SELECT
    first_name,
    last_name
FROM
    customer
    INNER JOIN rental USING (customer_id)
WHERE
    date_trunc('day', rental_date) = (
        SELECT
            date_trunc('day', min(rental_date))
        FROM
            rental)
ORDER BY
    first_name;

-- 7.2.
-- subquery

SELECT
    film_id,
    title
FROM
    film
WHERE
    film_id NOT IN (
        SELECT
            film_id
        FROM
            film_actor);

-- left outer join
SELECT
    film_id,
    title
FROM
    film
    LEFT OUTER JOIN film_actor USING (film_id)
WHERE
    actor_id IS NULL;

-- 7.3.
-- Done in more generality, show ALL people who rented some of least rented films
WITH film_rental_count AS (
    SELECT
        film_id,
        count(*)
    FROM
        rental AS r
        INNER JOIN inventory AS i USING (inventory_id)
    GROUP BY
        film_id
    ORDER BY
        count(*), film_id
),
least_rented_film AS (
    SELECT
        film_id
    FROM
        film_rental_count
    WHERE
        count = (
            SELECT
                min(count)
            FROM
                film_rental_count))
SELECT DISTINCT
    customer_id,
    first_name,
    last_name
FROM
    customer
    INNER JOIN rental USING (customer_id)
    INNER JOIN inventory USING (inventory_id)
WHERE
    film_id IN (
        SELECT
            film_id
        FROM
            least_rented_film);

