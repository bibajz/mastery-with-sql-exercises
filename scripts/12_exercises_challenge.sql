-- 12.10.
DROP TABLE IF EXISTS fizz_buzz;

CREATE TABLE fizz_buzz (
    n int,
    fb text
);

DROP FUNCTION fizzbuzz;

CREATE FUNCTION fizzbuzz (n int)
    RETURNS SETOF fizz_buzz
    LANGUAGE plpgsql
    AS $$
DECLARE
    i int;
    result text;
BEGIN
    FOR i IN 1..n LOOP
        result = '';
        IF i % 3 = 0 THEN
            result := result || 'Fizz';
        END IF;
        IF i % 5 = 0 THEN
            result := result || 'Buzz';
        END IF;
        IF result = '' THEN
            result := i::text;
        END IF;
        RETURN NEXT (i,
            result);
    END LOOP;
END
$$;

DROP FUNCTION fizzbuzz2;

CREATE FUNCTION fizzbuzz2 (p_n int)
    RETURNS TABLE (
        n int,
        fb text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    FOR i IN 1..p_n LOOP
        n := i;
        fb = '';
        IF i % 3 = 0 THEN
            fb := fb || 'Fizz';
        END IF;
        IF i % 5 = 0 THEN
            fb := fb || 'Buzz';
        END IF;
        IF fb = '' THEN
            fb := i::text;
        END IF;
        RETURN NEXT;
    END LOOP;
END
$$;

