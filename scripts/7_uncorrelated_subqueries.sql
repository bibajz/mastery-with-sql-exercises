SELECT
    title,
    length
FROM
    film
WHERE
    length > (
        SELECT
            avg(length)
        FROM
            film)
ORDER BY
    length;

SELECT
    customer_id,
    sum(amount) AS "customer_amount",
    sum(amount) / (
        SELECT
            sum(amount)
        FROM
            payment) AS "percentage"
FROM
    payment
GROUP BY
    customer_id
ORDER BY
    "percentage" DESC;

SELECT
    rating,
    count(title)
FROM
    film
WHERE
    rating IN ( SELECT DISTINCT
            rating
        FROM
            film
        WHERE
        LEFT (rating::varchar, 2) = 'PG')
GROUP BY
    rating;

SELECT
    *
FROM
    actor
WHERE
    actor_id NOT IN (
        SELECT
            actor_id
        FROM
            film
            INNER JOIN film_actor USING (film_id)
            INNER JOIN actor USING (actor_id)
        WHERE
            rating::text = 'R');

