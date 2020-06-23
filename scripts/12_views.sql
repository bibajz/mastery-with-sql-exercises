/*

- VIEW is virtual table defined by a query
- not stored on disk
 */
CREATE VIEW view_address_details AS
SELECT
    a.address_id,
    a.address,
    a.district,
    ct.city,
    a.postal_code,
    co.country
FROM
    address AS a
    INNER JOIN city AS ct USING (city_id)
    INNER JOIN country AS co USING (country_id);


/*

- Now, VIEW behaves like a standard table - I can join on it...
 */
SELECT
    addr.country,
    count(*)
FROM
    customer AS c
    INNER JOIN view_address_details AS addr USING (address_id)
GROUP BY
    addr.country
ORDER BY
    count DESC;

