select rating, count(*) as number_of_films from film
group by rating
order by count(*) desc