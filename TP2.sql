TP2


—1.


SELECT
    c.last_name as nom,
    c.first_name as prenom,
    ct.city as ville


FROM
    customer c
    INNER JOIN address a
    on c.address_id = a.address_id
    INNER JOIN city ct
    on ct.city_id = a.city_id
–599 rows


—2.


SELECT
    c.last_name as nom,
    c.first_name as prenom,
    ct.city as ville,
    cnty.country as pays
FROM
    customer c
    INNER JOIN address a
    on c.address_id = a.address_id
    INNER JOIN city ct
    on ct.city_id = a.city_id
    INNER JOIN country cnty
    on cnty.country_id = ct.country_id
–599 rows




–3.


SELECT
    f.title as titre,
    f.description as description,
    count(i.film_id) as nombre_de_copie
FROM
    film f
    LEFT OUTER join inventory i
    on f.film_id = i.film_id
Group by
    f.film_id,
    titre,
    description
order by nombre_de_copie




–4.


SELECT
    f.title as titre,
    f.description as description,
    s.store_id as magasin,
    count(i.film_id) as nombre_de_copie
FROM
    film f
    LEFT OUTER join inventory i
    INNER JOIN store s
    on i.store_id = s.store_id
    on f.film_id = i.film_id
Group by
    s.store_id,
    titre,
    description
order by titre




–7.


SELECT distinct
        f.title
FROM
    film f
    INNER JOIN inventory i
    INNER JOIN rental r
        INNER JOIN staff s
        on r.staff_id = s.staff_id
    on i.inventory_id = r.inventory_id
    on f.film_id = i.film_id
WHERE
        s.first_name ilike 'Jon'
        and
        DATE(r.rental_date) between '2005-06-01' and '2005-06-30'
order by
        f.title








–8.


select
    r.rental_id,
    p.payment_id,
    p.amount
from
    rental r
    inner join payment p
    on r.rental_id = p.rental_id
where
    p.customer_id != r.customer_id




–9.


SELECT
        f.title,
    c.name as category_name,
    CONCAT(a.first_name, a.last_name)
from
    film f
    LEFT OUTER JOIN film_category fc
    INNER JOIN category c
    on c.category_id = fc.category_id
    on fc.film_id = f.film_id
    
    LEFT OUTER JOIN film_actor fa
    INNER JOIN actor a
    on a.actor_id = fa.actor_id
    on fa.film_id = f.film_id


Order by f.title
        


–13.


Select
    s.first_name,
    s.last_name,
    count(r.rental_id) as nbr
    
from
    staff s
    inner join rental r
    on s.staff_id = r.staff_id
Group by
    s.first_name,
    s.last_name


order by
    s.first_name


–14.


Select
    c.first_name,
    c.last_name,
    count(r.rental_id) as nbr
    
from
    customer c
    inner join rental r
    on c.customer_id = r.customer_id
Group by
    c.first_name,
    c.last_name


order by
    c.first_name
        


–15.


Select
    f.title,
    count(r.rental_id)
from
    film f inner join
    inventory i inner join
    rental r
    on r.inventory_id = i.inventory_id
    on i.film_id = f.film_id
group by
    f.title
HAVING count(r.rental_id) = 8


–23.





Select
    f1.title as tit1,
    f2.title as tit2,
    f1.length
from
    film f1
    Inner join film f2
    on f1.film_id < f2.film_id
where
    f1.length = f2.length
order by
    f1.title