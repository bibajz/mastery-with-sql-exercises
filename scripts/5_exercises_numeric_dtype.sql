-- 5.3.
SELECT
    round(100.0 * sum(
            CASE WHEN rating = 'NC-17' THEN
                1
            ELSE
                0
            END) / count(*)) AS "% NC-17",
    round(100.0 * sum(
            CASE WHEN rating = 'PG' THEN
                1
            ELSE
                0
            END) / count(*)) AS "% PG",
    round(100.0 * sum(
            CASE WHEN rating = 'G' THEN
                1
            ELSE
                0
            END) / count(*)) AS "% G",
    round(100.0 * sum(
            CASE WHEN rating = 'PG-13' THEN
                1
            ELSE
                0
            END) / count(*)) AS "% PG-13",
    round(100.0 * sum(
            CASE WHEN rating = 'R' THEN
                1
            ELSE
                0
            END) / count(*)) AS "% R"
FROM
    film;

-- 5.4.
SELECT int '33'; -- OK
SELECT int '33.3'; -- throws syntax error
SELECT CAST(33.3 AS int); -- rounded to 33
SELECT 33::text; -- OK
SELECT 'hello'::varchar(2); -- returns 'he'
SELECT CAST(100000 AS smallint); -- smallint out of range
SELECT 12.1::numeric(1, 1); -- numeric field overflow
