use sakila; 


#Total number of films per rating 
select count(title) as count, rating
from film
group by rating;

#Displaying film id, description, rental_ate and category via inner join
select f.film_id, f.title, f.description,f.rental_rate, fc.category_id
from film as f
inner join film_category as fc
on f.film_id= fc.film_id; 

Select * from film_category; 

#Counting total numnber of movies and its total rental rate per category
select count(title) as total_film, sum(rental_rate) as total_rental, category_id
from film as f
inner join film_category as fc
using (film_id)
group by category_id;

#Total number of films / actor
select fa.actor_id as ID, a.first_name as first_name, a.last_name as last_name, count(film_id) as total_films
from film_actor as fa
inner join actor as a
on fa.actor_id= a.actor_id 
group by fa.actor_id; 

select * from film_actor;
select * from actor_id;

#select title
#from view1
#group by language_id; 