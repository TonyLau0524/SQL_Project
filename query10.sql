select title, COALESCE(sum(amount),0) as revenue
from film as f
full join inventory as i on f.film_id = i.film_id
full join rental as r on i.inventory_id = r.inventory_id
full join payment as p on p.rental_id = r.rental_id
group by title
order by revenue desc
limit 3;