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

**Query_01: Comparison Operator**

    SELECT film_id, title, replacement_cost
    FROM film
    WHERE replacement_cost > 20
    ORDER BY replacement_cost DESC

This query retrieved which film's replacement cost was larger than $20 with the film ID, film title, and the replacement cost. The table is in descending order by the replacement cost of the film. In this query, comparison operator '>' is used to compare the replacement cost of each film which larger than $20.

**Query_02: Logical operator**

    SELECT staff_id, first_name, last_name, active
    FROM staff
    WHERE active in (true)

This query retrieved which staff is currently working in the DVD store with the staff ID, staff's first name, last name, and their active status. In this query, the logical operator "IN" is used to check whether the staff's active status is true or not.

**Query_03: Wildcard**

    SELECT city_id, city
    FROM city
    WHERE city ILIKE '%c%'

This query retrieved which city contains the letter 'c' in their city name with their city ID. The wildcard "ILIKE" is used to check which city contains the letter 'c' in it.


