select a.actor_id,first_name,last_name, count(*) as number_of_rental
from actor as a
join film_actor fa on a.actor_id = fa.actor_id
join film as f on fa.film_id = f.film_id
 join inventory as i on f.film_id = i.film_id
join rental as r on i.inventory_id = r.inventory_id
group by a.actor_id
order by number_of_rental desc
limit 10;