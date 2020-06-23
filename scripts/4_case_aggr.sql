SELECT
    sum(
        CASE WHEN rating IN ('R', 'NC-17') THEN
            1
        ELSE
            0
        END) AS "adult films",
    count(*) AS "all films"
FROM
    film;

-- I do not need to put ELSE in the CASE clause, since it defaults to NULL
SELECT
    sum(
        CASE WHEN rating IN ('R', 'NC-17') THEN
            1
        END) AS "adult films",
    count(*) AS "all films"
FROM
    film;

-- The PostgreSQL way
SELECT
    count(*) FILTER (WHERE rating IN ('R', 'NC-17')) AS "adult films",
    count(*)
FROM
    film;

