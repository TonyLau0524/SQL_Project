With no_actor_table as (select distinct title, 
count(actor_id)over(PARTITION BY title) as Number_of_Actors from film_actor as fa
right join film as f on fa.film_id = f.film_id
order by number_of_actors)

select title from no_actor_table
where number_of_actors = 0;




