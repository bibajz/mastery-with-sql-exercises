-- filmy, ve kterych nikdo nehraje
select
	f.film_id,
	f.title,
	count(fa.actor_id) as "# actors"
from film as f
left outer join film_actor as fa
	on f.film_id = fa.film_id
group by f.film_id, f.title
order by f.film_id;

select
	f.film_id,
	f.title,
	fa.actor_id,
	a.first_name,
	a.last_name
from film as f
	full outer join film_actor as fa
		on f.film_id = fa.film_id
	left outer join actor as a
		on fa.actor_id = a.actor_id
where f.film_id = 803;