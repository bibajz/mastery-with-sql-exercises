CREATE OR REPLACE FUNCTION popular_films (
    IN p_n int,
    IN p_rating mpaa_rating DEFAULT 'PG',
    OUT title varchar(255),
    OUT description text,
    OUT length int2, 
    OUT rating mpaa_rating)
    RETURNS SETOF record
    LANGUAGE sql
    AS $$
    SELECT
        f.title,
        f.description,
        f.length,
        f.rating
    FROM
        rental AS r
        INNER JOIN inventory AS i USING (inventory_id)
        INNER JOIN film AS f USING (film_id)
    WHERE
        f.rating = p_rating
    GROUP BY
        f.film_id
    ORDER BY
        count(*) DESC,
        f.title
    LIMIT p_n
$$;

CREATE OR REPLACE FUNCTION popular_films_as_table (IN p_n int, IN p_rating mpaa_rating DEFAULT 'PG')
    RETURNS TABLE (
        title varchar(255),
        description text,
        length int2,
        rating mpaa_rating)
    LANGUAGE sql
    AS $$
    SELECT
        f.title,
        f.description,
        f.length,
        f.rating
    FROM
        rental AS r
        INNER JOIN inventory AS i USING (inventory_id)
        INNER JOIN film AS f USING (film_id)
    WHERE
        f.rating = p_rating
    GROUP BY
        f.film_id
    ORDER BY
        count(*) DESC,
        f.title
    LIMIT p_n
$$;

CREATE OR REPLACE FUNCTION sum(IN a int, IN b int)
    RETURNS int
    LANGUAGE sql
    AS $$
    SELECT
        a + b
$$;

