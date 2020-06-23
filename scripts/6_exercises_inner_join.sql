-- 6.1
SELECT
    rental_date,
    title
FROM
    rental
    INNER JOIN customer ON rental.customer_id = customer.customer_id
    INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
    INNER JOIN film ON inventory.film_id = film.film_id
WHERE
    first_name = 'PETER'
    AND last_name = 'MENARD'
ORDER BY
    rental_date DESC;

-- 6.2.
SELECT
    store.store_id,
    first_name || ' ' || last_name AS "Manager",
    email
FROM
    store
    INNER JOIN staff ON store.manager_staff_id = staff.staff_id;

-- 6.3.
SELECT
    film_id,
    title,
    count(*)
FROM
    rental
    INNER JOIN inventory USING (inventory_id)
    INNER JOIN film USING (film_id)
GROUP BY
    film_id,
    title
ORDER BY
    count(*) DESC
LIMIT 3;

-- 6.4.
SELECT
    customer_id,
    count(DISTINCT film_id) AS "# films",
    count(DISTINCT actor_id) AS "# actors"
FROM
    rental
    INNER JOIN inventory USING (inventory_id)
    INNER JOIN film USING (film_id)
    INNER JOIN film_actor USING (film_id)
GROUP BY
    customer_id;

-- 6.5.
-- ON

SELECT
    film.title,
    language.name AS "language"
FROM
    film
    INNER JOIN
    LANGUAGE ON
    film.language_id = language.language_id;

-- USING
SELECT
    film.title,
    language.name AS "language"
FROM
    film
    INNER JOIN
    LANGUAGE USING (language_id);

