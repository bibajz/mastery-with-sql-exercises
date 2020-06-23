SELECT
    f.film_id,
    s.store_id,
    c.email,
    s.email
FROM
    staff AS "s"
    CROSS JOIN film AS "f"
    CROSS JOIN customer AS "c"
LIMIT 1;

