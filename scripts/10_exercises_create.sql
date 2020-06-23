-- 10.1.
DROP SCHEMA IF EXISTS beach CASCADE;

CREATE SCHEMA;

-- 10.2.
CREATE TABLE IF NOT EXISTS beach.customers (
    first_name text,
    last_name text,
    email text,
    phone text,
    created_at date
);

-- 10.3.
CREATE TABLE IF NOT EXISTS beach.equipment (
    type text,
    decscription text,
    replacement_cost numeric(7, 2)
);

-- 10.4.
ALTER TABLE beach.equipment
    ADD COLUMN "missing" boolean DEFAULT FALSE;

