SELECT
    rental_date,
    first_name,
    last_name
FROM
    rental
    INNER JOIN customer ON rental.customer_id = customer.customer_id;


/*
select
 * 
from film as f
left outer join film_actor as fa
 on f.film_id = fa.film_id
where f.film_id = 803;
 */
SELECT
    city,
    country
FROM
    customer AS "c"
    INNER JOIN address AS "addr" ON c.address_id = addr.address_id
    INNER JOIN city ON city.city_id = addr.city_id
    INNER JOIN country ON country.country_id = city.country_id;

-- Alternative syntax with USING, useful in JOINS having the same column name
SELECT
    city,
    country
FROM
    customer AS "c"
    INNER JOIN address AS "addr" USING (address_id)
    INNER JOIN city USING (city_id)
    INNER JOIN country USING (country_id);

