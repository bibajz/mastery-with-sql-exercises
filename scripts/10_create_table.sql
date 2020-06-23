CREATE SCHEMA IF NOT EXISTS playground;

CREATE TABLE IF NOT EXISTS playground.users (
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100) CHECK (position('@' IN email) > 0),
    date_of_birth date
);

INSERT INTO playground.users (first_name, last_name, email, date_of_birth)
    VALUES ('a', 'b', 'a@b.c', '1970-01-01'), ('d', 'e', 'd@e.f', '1970-01-01');

DROP SCHEMA playground CASCADE;

