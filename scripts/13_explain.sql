explain analyze
select *
from customer
where first_name = 'JOHN';

-- 

begin;

explain analyze
update actor
set last_update = now();

rollback;