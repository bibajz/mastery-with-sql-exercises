-- 9.1.
(
    SELECT
        rental_date::date AS "interaction date"
    FROM
        rental)
UNION (
    SELECT
        payment_date::date AS "interaction date"
    FROM
        payment)
ORDER BY
    "interaction date";

