-- Group customer first names by its length. They need to begin with
-- 'A' or 'M' and said length must occur more than 4 times.
SELECT
    length(first_name),
    count(*)
FROM
    customer
WHERE
    LEFT (first_name, 1) IN ('A', 'M')
GROUP BY
    length(first_name)
HAVING
    count(*) > 4;

