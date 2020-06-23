-- 7.4.
SELECT
    c.country
FROM
    country AS c
WHERE (
    SELECT
        count(*)
    FROM
        city
    WHERE
        city.country_id = c.country_id) > 15;

-- 7.5.
-- My solution

/*
select
 c.customer_id,
 c.first_name,
 c.last_name,
 case when 
 (select count(*) from rental as r join inventory as i using (inventory_id) where r.customer_id = c.customer_id and i.store_id = 1) >
 (select count(*) from rental as r join inventory as i using (inventory_id) where r.customer_id = c.customer_id and i.store_id = 2)
 then 1 else 2 end as "Favourite Store"
from customer as c;
 */
-- better

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    (
        SELECT
            i.store_id
        FROM
            inventory AS i
            INNER JOIN rental AS r USING (inventory_id)
        WHERE
            r.customer_id = c.customer_id
        GROUP BY
            i.store_id
        ORDER BY
            count(*) DESC
        LIMIT 1) AS "Favourite Store"
FROM
    customer AS c;

-- 7.6.
SELECT
    c.first_name,
    c.last_name,
    CASE WHEN EXISTS (
        SELECT
            i.store_id
        FROM
            inventory AS i
            INNER JOIN rental AS r USING (inventory_id)
        WHERE
            r.customer_id = c.customer_id
            AND c.store_id != i.store_id) THEN
        'Y'
    ELSE
        'N'
    END AS "RentedFromAnotherStore"
FROM
    customer AS c;

