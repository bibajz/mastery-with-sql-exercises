-- Cannot be run in psql using \i :(
COPY playground.users
FROM
    '/tmp/ch11-users.csv' WITH (
        format csv,
        header TRUE);

