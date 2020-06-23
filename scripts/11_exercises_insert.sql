-- 11.2.
/*
When using psql, type
\copy (... query ...) to 'outputs/11_exercises_out.csv' delimiter ',' csv header
running this script with \i will not work
 */
SELECT
    u.first_name || ' ' || u.last_name AS "full_name",
    count(*) AS "note_count"
FROM
    playground.users AS u
    INNER JOIN playground.notes AS n ON u.email = n.user_email
GROUP BY
    u.email
ORDER BY
    "note_count" DESC;

-- 11.3.
