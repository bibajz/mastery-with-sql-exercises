-- 8.1.
WITH last_rentals AS (
    SELECT
        customer_id,
        rental_date,
        rank() OVER (PARTITION BY customer_id ORDER BY rental_date DESC)
    FROM rental
)
SELECT
    r.rental_id,
    r.customer_id,
    r.rental_date
FROM
    rental AS r
    INNER JOIN last_rentals USING (customer_id, rental_date)
WHERE
    last_rentals.rank <= 3;

-- 8.2.
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
film_rental_rank AS (
    SELECT
        film_id,
        rank() OVER (ORDER BY count)
    FROM film_rental_count
)
SELECT DISTINCT
    customer_id
FROM
    rental AS r
    INNER JOIN inventory AS i USING (inventory_id)
    INNER JOIN film_rental_rank AS fr_rank ON fr_rank.film_id = i.film_id
WHERE
    fr_rank.rank = 1;

-- 8.3.
SELECT
    rating
FROM (
    SELECT
        rating,
        row_number() OVER (PARTITION BY rating)
    FROM film) AS t
WHERE
    t.row_number = 1
    AND rating IS NOT NULL;

