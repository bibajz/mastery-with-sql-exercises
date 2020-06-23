SELECT
    title,
    length,
    CASE WHEN rating IN ('G', 'PG') THEN
        'kid friendly'
    ELSE
        'kid unfriendly'
    END AS "rating_desc"
FROM
    film;
