-- 7.7.
SELECT
    c.first_name,
    c.last_name
FROM
    customer AS c
    CROSS JOIN generate_series(1, 4)
ORDER BY
    first_name,
    last_name;

-- 7.8.
SELECT
    days.day_name,
    round(avg(count)) AS "average"
FROM (
    SELECT
        date_trunc('week', r.rental_date),
        extract(isodow FROM r.rental_date),
        count(*)
    FROM
        rental AS r
    GROUP BY
        1,
        2) AS t ("week",
        "day",
        "count")
        INNER JOIN (
            VALUES (1, 'Monday'),
                (2, 'Tuesday'),
                (3, 'Wednesday'),
                (4, 'Thursday'),
                (5, 'Friday'),
                (6, 'Saturday'),
                (7, 'Sunday')) AS days ("pos", "day_name") ON t.day = days.pos
    GROUP BY
        days.day_name
    ORDER BY
        average DESC;

