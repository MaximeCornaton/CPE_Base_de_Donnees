---1.


SELECT title
from film
where
((film.length > 120 AND rating in ('NC-17', 'R')) OR (film.length < 60 AND rating = 'G'))




---2.


SELECT * from actor
where LOWER(first_name) in ('cameron', 'fay', 'penelope')




---3.


SELECT concat(first_name,' ', last_name) from actor order by last_name




---4.


SELECT first_name from actor order by last_name




---5. 


SELECT title from film where description like '%Chef%'
SELECT title from film where UPPER(description) like '%CHEF%'


SELECT title from film where description Ilike '%chef%'


---6.


SELECT
city,
count(address)
FROM
city
INNER JOIN address
ON city.city_id = address.city_id
GROUP BY city
order by city




SELECT
city,
count(address) as nb_address
FROM
city
INNER JOIN address
ON city.city_id = address.city_id
GROUP BY city
order by nb_address desc




---7.


SELECT
sum(amount)
from payment


---8.


SELECT
EXTRACT(MONTH FROM payment_date) as date_,
sum(amount)
from payment
group by date_


UNION


SELECT
EXTRACT(YEAR FROM payment_date) as date_,
sum(amount)
from payment
group by date_


---9. 


select title,
case rating
when 'R' then 18
when 'G' then 0
when 'PG' then 15
when 'PG-13' then 13
when 'NC-17' then 17
else ‘ND’
end as age
from film


—-10. 


select
title,
length
from film
where description Ilike '%japan%' or description ilike '%japon%'
order by length
limit 1






select * from
(
select
rank() over (order by length) as rk,
title,
length
from film
where description Ilike '%japan%' or description ilike '%japon%'
)as a
where  rk = 1


—12.


select age(coalesce (return_date, now()), rental_date)
from rental


—13.




select district
from address
group by district


—


select DISTINCT district
from address
order by district




—14.

select customer_id,


count (1) as nb
from rental
group by customer_id
order by nb desc limit 1


—15


select staff_id,
count (1) as nb
from rental
group by staff_id
order by nb desc limit 1


—16.


select
    r.staff_id,
    sum(p.amount) as tt
from
    payment p
            inner join rental r
                    on p.rental_id = r.rental_id
group by r.staff_id
order by tt desc
limit 1








—17.


select
    c.first_name,
    c.last_name,
    sum(p.amount) as tt
from
    customer c
            inner join rental r
                    on r.customer_id = c.customer_id
            inner join payment p
                    on p.rental_id = r.rental_id
group by
    c.first_name,
    c.last_name
    
order by tt desc
limit 5




—18.