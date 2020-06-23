-- Same declaration as before, only LANGUAGE plpgsql is different
CREATE OR REPLACE FUNCTION circle_area (r int)
    RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE
    PI constant numeric := 3.1415;
BEGIN
    RETURN PI * r * r;
END
$$;

DROP FUNCTION IF EXISTS circle_desc;

CREATE OR REPLACE FUNCTION circle_desc (r int)
    RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    area numeric;
BEGIN
    area := circle_area (r);
    IF area < 20 THEN
        RETURN 'small circle';
    ELSE
        RETURN 'big circle';
    END IF;
END
$$;

