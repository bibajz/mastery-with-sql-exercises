-- 6.6.
SELECT
    f.title
FROM
    film f
    LEFT JOIN inventory USING (film_id)
GROUP BY
    f.title,
    inventory.inventory_id
HAVING
    count(inventory.inventory_id) = 0;

SELECT
    f.title,
    count(inventory.inventory_id) AS "count"
FROM
    film f
    LEFT JOIN inventory USING (film_id)
GROUP BY
    f.film_id,
    f.title
ORDER BY
    count,
    f.title;

