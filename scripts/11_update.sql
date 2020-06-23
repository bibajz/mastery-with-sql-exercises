begin;

update customer
set
    first_name = initcap(first_name),
    last_name = initcap(last_name),
    email = lower(email)
where customer_id in (1, 3)
returning *;

rollback;

select rental_date, payment_date
from rental as r
inner join payment as p using (rental_id);

begin;
update payment
set payment_date = (
    select rental_date
    from rental
    where rental.rental_id = payment.rental_id
)
returning *;
rollback;


-- Correlated subquery is not needed, SELECT DISTINCT is sufficient
begin;
update customer as c
set activebool = true
where
    c.customer_id in (
        select distinct
            customer_id
        from rental as r
        where rental_date >= '2006-01-01'::date
    )
returning *;

rollback;