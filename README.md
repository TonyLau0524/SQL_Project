## 💿DVD Rental PostgreSQL Project


![enter image description here](https://img.lemde.fr/2022/05/04/0/0/5760/3840/800/0/75/0/f5f9669_1651669070859-rea9343106-1.jpg)

##  Introduction
In this project, DVD rental data give a lot of insight to the business and we are going to use SQL querying techniques we have learnt from CanTek to explore and manipulate the data.The DVD rental database dataset can be found from [here](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/)


## Tool
 - PostgreSQL (version 16)
 - pgAdmin 4 (version 7.7)
 - Git (version 2.37.1)

##  DVD Rental ER Model
<p align="center">
  <img src="https://github.com/gordonkwokkwok/DVD-Rental-PostgreSQL-Project/assets/112631794/5c55cbde-9e67-4363-99bc-177bf7903882" alt="Image" width="700">
</p>

##  DVD Rental Database Tables
There are 15 tables in the DVD Rental database:

- actor – stores actors data including first name and last name.
- film – stores film data such as title, release year, length, rating, etc.
- film_actor – stores the relationships between films and actors.
- category – stores film’s categories data.
- film_category- stores the relationships between films and categories.
- store – contains the store data including manager staff and address.
- inventory – stores inventory data.
- rental – stores rental data.
- payment – stores customer’s payments.
- staff – stores staff data.
- customer – stores customer data.
- address – stores address data for staff and customers
- city – stores city names.
- country – stores country names.

## SQL analysis of DVD rental database

**Query_01: Actor whose first name start with A**

    select count(*) as number_of_actor_whose_first_name_start_with_A from actor
    where first_name ilike 'A%'

This query retrieved the number of actor whose first name start with A.

**Query_02: The film rating**

    select rating, count(*) as number_of_films from film
    group by rating
    order by count(*) desc

This query retrieved which the film rating is the most in all the film that DVD rental has.

**Query_03: Top customer in rental**

    select first_name, last_name ,count(*)  as number_of_rental,country from customer as c
    join rental as r on c.customer_id = r.customer_id
    join address as a on c.address_id = a.address_id
    join city  on a.city_id = city.city_id
    join country on city.country_id = country.country_id
    group by c.customer_id ,country
    order by count(*) desc, first_name
    limit 10;

This query retrieved which customers rent the most film DVD in the store. by using Inner Join the country data, It gives the nationality of the customers.

**Query_04: Top country in rental**

    select country, count(*)  as number_of_rental from customer as c
    join rental as r on c.customer_id = r.customer_id
    join address as a on c.address_id = a.address_id
    join city  on a.city_id = city.city_id
    join country on city.country_id = country.country_id
    group by country
    order by count(*) desc
    limit 10;

This query retrieved which countries rent the most film DVD in the store. This result tells us the target audience from.

**Query_05: The median **

    select
    (
	     (select max(length) from (SELECT  length from film order by length limit 500))
    + (select min(length) from (SELECT  length from film order by length desc limit 500))
	       )/2 as length_median

This query retrieved the median of the film lengths. There is no MEDIAN() function in SQL Server but we still can work it out.

**Query_06: Short or Long film? **

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
  
 This query retrieved which film lengths have the higher rate in rental. There is no classification in film lengths so we try to use case when function to identify.

    
**Query_07: Top actor in rental**

    select a.actor_id,first_name,last_name, count(*) as number_of_rental
    from actor as a
    join film_actor fa on a.actor_id = fa.actor_id
    join film as f on fa.film_id = f.film_id
    join inventory as i on f.film_id = i.film_id
    join rental as r on i.inventory_id = r.inventory_id
    group by a.actor_id
    order by number_of_rental desc
    limit 10;

This query retrieved the actors whose have the highest rate in rental. The result tell us that the films with these actors may bring more revenue to DVD rental.
    
**Query_08: Top customer in revenue **

    select first_name, last_name,sum(amount) as Total_amount, country from customer as c
    join payment as p on c.customer_id = p.customer_id
    join address as a on c.address_id = a.address_id
    join city  on a.city_id = city.city_id
    join country on city.country_id = country.country_id
    group by c.customer_id ,country
    order by sum( amount) desc, first_name
    limit 10;

This query retrieved the customers whose have the highest amount and their country.
    
**Query_09: Film with zero actor**

    With no_actor_table as (select distinct title, 
    count(actor_id)over(PARTITION BY title) as Number_of_Actors from film_actor as fa
    right join film as f on fa.film_id = f.film_id
    order by number_of_actors)

    select title from no_actor_table
    where number_of_actors = 0;

This query retrieved which the films have zero actor.


**Query_10: Top 3 films in revenue**

    select title, COALESCE(sum(amount),0) as revenue
    from film as f
    full join inventory as i on f.film_id = i.film_id
    full join rental as r on i.inventory_id = r.inventory_id
    full join payment as p on p.rental_id = r.rental_id
    group by title
    order by revenue desc
    limit 3;

This query retrieved which the films have the highest revenue.


The results of all queries have been saved in the corresponding folder of each query. The results are stored in csv files.
