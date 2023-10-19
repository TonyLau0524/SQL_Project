select first_name, last_name,sum(amount) as Total_amount, country from customer as c
join payment as p on c.customer_id = p.customer_id
join address as a on c.address_id = a.address_id
join city  on a.city_id = city.city_id
join country on city.country_id = country.country_id
group by c.customer_id ,country
order by sum( amount) desc, first_name
limit 10;
