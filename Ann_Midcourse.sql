--bai1
SELECT title, replacement_cost from film
SELECT min(replacement_cost) from film
--bai2
SELECT
CASE 
WHEN replacement_cost between 9.99 and 19.99 then 'low'
WHEN replacement_cost between 20.00 and 24.99 then 'medium'
WHEN replacement_cost between 25.00 and 29.99 then 'high'
END category,
COUNT(*) AS so_luong
FROM film
Group by category
--bai3: BAI NAY EM A KET QUA LA MUSIC, 185
SELECT b.name, a.length
FROM film as a
JOIN film_category as c ON a.film_id = c.film_id
JOIN category as b ON b.category_id = c.category_id
WHERE b.name IN ('Music', 'Sport')
ORDER BY a.length DESC
LIMIT 1
--BAI 4
SELECT COUNT(a.title) as so_luong, b.name
FROM film as a
JOIN film_category as c ON a.film_id = c.film_id
JOIN category as b ON b.category_id = c.category_id
GROUP BY b.name
ORDER BY so_luong DESC
LIMIT 1
--BAI 5
SELECT 
COUNT(a.title) AS quantity,
c.first_name || ' ' || c.last_name as name
from film AS a
JOIN film_actor AS b on a.film_id=b.film_id
JOIN actor AS c on b.actor_id=c.actor_id
GROUP BY name
ORDER BY quantity DESC
LIMIT 1
--BAI6
SELECT COUNT(a.address)
FROM address AS a
LEFT JOIN customer AS b on a.address_id=b.address_id
WHERE customer_id is NULL
--bai7: 
SELECT 
b.city, sum(amount)
FROM address as a
JOIN city as b on a.city_id=b.city_id
JOIN customer as c on a.address_id=c.address_id
JOIN payment as d on c.customer_id=d.customer_id
group by b.city
order by sum(amount) DESC
--bai8
SELECT city ||', ' || country as name, 
SUM(amount) OVER( PARTITION BY city) as total_amount 
FROM address as a
JOIN city as b on a.city_id=b.city_id
JOIN customer as c on a.address_id=c.address_id
JOIN payment as d on c.customer_id=d.customer_id
JOIN country as e on e.country_id=b.country_id
ORDER BY total_amount 

