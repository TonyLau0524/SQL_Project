select first_name, last_name ,count(*)  as number_of_rental,country from customer as c
join rental as r on c.customer_id = r.customer_id
join address as a on c.address_id = a.address_id
join city  on a.city_id = city.city_id
join country on city.country_id = country.country_id
group by c.customer_id ,country
order by count(*) desc, first_name
limit 10;


