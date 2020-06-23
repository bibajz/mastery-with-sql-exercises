-- 9.6.
(
    SELECT
        rental_date::date AS "interaction date",
        'rental' AS TYPE
    FROM
        rental)
UNION (
    SELECT
        payment_date::date AS "interaction date",
        'payment' AS TYPE
    FROM
        payment)
ORDER BY
    "interaction date";

-- 9.7.
(
    SELECT
        country
    FROM
        staff
        INNER JOIN address USING (address_id)
        INNER JOIN city USING (city_id)
        INNER JOIN country USING (country_id))
INTERSECT (
    SELECT
        country
    FROM
        customer
        INNER JOIN address USING (address_id)
        INNER JOIN city USING (city_id)
        INNER JOIN country USING (country_id));

