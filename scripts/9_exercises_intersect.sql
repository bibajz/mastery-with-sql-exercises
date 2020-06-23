-- 9.2.
SELECT
    first_name,
    last_name
FROM
    customer
INTERSECT
SELECT
    first_name,
    last_name
FROM
    actor;

-- 9.3.
SELECT
    film_id
FROM
    film_actor
WHERE
    actor_id = 49
INTERSECT
SELECT
    film_id
FROM
    film_actor
WHERE
    actor_id = 152
INTERSECT
SELECT
    film_id
FROM
    film_actor
WHERE
    actor_id = 180;

