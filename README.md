# mastery-with-sql-exercises
Solutions to exercises from masterywithsql.com/

## Database
### Seting up
Simply type
```
$ ./run_postgres.sh
```

and connect to the database using `psql`
```
$ psql -h localhost -d videoezy -U postgres -W
```
### Tearing down
```
$ docker stop mastery_pg
```
