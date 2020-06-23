-- 5.5.
-- select * from pg_timezone_names;
-- select * from pg_timezone_abbrevs;
-- a)

SELECT
    '2019-03-04 15:30 US/Eastern'::timestamptz;

-- b)
SELECT
    '2019-03-04 15:30 EST'::timestamptz;

-- c)
SELECT
    '2019-03-04 15:30 -5'::timestamptz;

-- 5.6.
SELECT
    title,
    make_interval(days => rental_duration) AS "duration",
    make_interval(days => rental_duration + 1) AS "duration + 1"
FROM
    film;

-- 5.7.
SELECT
    date_part('hour', rental_date) AS "hr",
    count(*)
FROM
    rental
GROUP BY
    "hr"
ORDER BY
    "hr";

-- 5.8.
SELECT
    date_trunc('month', payment_date) AS "month",
    sum(amount) AS "amount"
FROM
    payment
GROUP BY
    "month"
ORDER BY
    "month";

