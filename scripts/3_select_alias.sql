SELECT
    first_name AS "FN",
    email AS "E"
FROM
    customer
LIMIT 10;

-- Also selects 10 records, but starts from 6th and ends at 14th.
SELECT
    first_name AS "FN",
    email AS "E"
FROM
    customer
LIMIT 10 offset 5;

