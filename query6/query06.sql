With duration_table as(SELECT *,
case 
when length <60 then 'under 60mins'
when length >=60 and length<90 then '60 - 90mins'
when length >=90 and length<120 then '90 - 120mins'
else 'more than 120 mins'
end as film_duration

from film as f
join inventory as i on f.film_id = i.film_id
join rental as r on i.inventory_id = r.inventory_id)

select film_duration,count(*) as number_of_rental
  
from duration_table
group by film_duration
order by number_of_rental desc;
