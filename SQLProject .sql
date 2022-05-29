use sakila; 



#Counting total number of movies and its total rental rate per category
select category_id as Category, count(title) as Number_Of_Films, sum(rental_rate) as Rental_Rate
from film as f
inner join film_category as fc
using (film_id)
group by category_id;


#Calculating sales
select st.store_id as store_id, sta.first_name, sta.last_name, count(pa.amount) as revenue
from store as st
join staff as sta 
on st.manager_staff_id = sta.staff_id
join payment as pa 
on sta.staff_id = pa.staff_id
group by pa.staff_id; 

#Extracting customer and film category with details 
create view view4 as 
select c.customer_id as CID, count(r.rental_id) as Total_Rentals, c.first_name as First_Name, c.last_name as Last_Name, c.store_id as Store
from customer as c
left join rental as r
on c.customer_id = r.customer_id
group by c.customer_id; 


#Finding top 10 customers by stores
select Total_Rentals, First_Name, Last_Name, Store
from view4
order by Total_Rentals desc
limit 10;

#Calculating demand
#Understanding the max and min number of rentals(purchase patterns), and rental frequency to deciper demand
select customer.first_name, customer.last_name ,customer.customer_id, max(datediff(return_date, rental_date)) as max_days, min(datediff(return_date, rental_date)) as min_days, count(return_date) as rental_frequency
from rental
join customer
using (customer_id)
group by customer_id;









