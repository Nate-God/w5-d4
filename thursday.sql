--- quest1 select country_id from city_id from adress_id from customer


---question 1
SELECT c.first_name, c.last_name
FROM customer c
JOIN address a ON c.address_id = a.address_id
WHERE a.district = 'Texas';

---ques 2
SELECT c.first_name, c.last_name, p.amount
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
WHERE p.amount > 7;

---ques3
SELECT c.first_name, c.last_name, SUM(p.amount)
from customer c
join payment p ON c.customer_id = p.customer_id
GROUP by c.customer_id, c.first_name, c.last_name
having SUM(p.amount) > 175
order by SUM(p.amount) desc;
   
   
   

---question4
SELECT c.first_name, c.last_name, ci.city 
FROM city ci
JOIN address a ON ci.city_id = a.city_id
JOIN customer c ON a.address_id = c.address_id
JOIN country c2 ON c2.country_id = ci.country_id
WHERE c2.country = 'Argentina';




---question5
select c.category_id id, c.name, COUNT(f.film_id) AS num_movies_in_cat
FROM category c
LEFT JOIN film_category f ON c.category_id = f.category_id
GROUP BY c.category_id, c.name
ORDER BY num_movies_in_cat DESC;



---question6
select f.film_id, f.title, count(actor_id) as actor_count
from film_actor fa
join film f on f.film_id = fa.film_id 
group by f.film_id 
order by actor_count desc
limit 1;


---question7
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY film_count ASC
LIMIT 1;

---question8
select c2.country, count(c.country_id) as country_count
from city c
join country c2 on c.country_id = c2.country_id
group by c2.country
order by country_count desc
limit 3;


---question9
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id)
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(fa.film_id) BETWEEN 20 AND 25;