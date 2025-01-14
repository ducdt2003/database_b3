use mavenmovies;

/*
1.	We will need a list of all staff members, including their first and last names, 
email addresses, and the store identification number where they work. 
*/ 
SELECT first_name, last_name, email, store_id
FROM staff;


/*
2.	We will need separate counts of inventory items held at each of your two stores. 
*/ 
SELECT store_id, COUNT(*) AS inventory_number
FROM inventory
GROUP BY store_id;


/*
3.	We will need a count of active customers for each of your stores. Separately, please. 
*/
SELECT store_id, COUNT(*) AS active_customers
FROM customer
-- trong cột active 1 là hoạt động , 0 là không hoạt động 
WHERE active = 1 
GROUP BY store_id;


/*
4.	In order to assess the liability of a data breach, we will need you to provide a count 
of all customer email addresses stored in the database. 
*/
SELECT email AS email_list
FROM customer;


/*
5_1.	We are interested in how diverse your film offering is as a means of understanding how likely 
you are to keep customers engaged in the future. Please provide a count of unique film titles 
you have in inventory at each store.
*/
SELECT i.store_id, COUNT(DISTINCT f.title) 
FROM inventory i 
JOIN film f ON i.film_id = f.film_id
GROUP BY i.store_id;



/*
5_2. And then provide a count of the unique categories of films you provide.
*/
SELECT COUNT(DISTINCT c.name)
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;


/*
6.	We would like to understand the replacement cost of your films. 
Please provide the replacement cost for the film that is least expensive to replace, 
the most expensive to replace, and the average of all films you carry. ``	
*/
SELECT 
    MIN(replacement_cost) AS least_cost, 
    MAX(replacement_cost) AS most_expensive, 
    AVG(replacement_cost) AS average_cost
FROM 
    film;



/*
7.	We are interested in having you put payment monitoring systems and maximum payment 
processing restrictions in place in order to minimize the future risk of fraud by your staff. 
Please provide the average payment you process, as well as the maximum payment you have processed.
*/
SELECT 
    AVG(amount) AS average_payment,
    MAX(amount) AS max_payment
FROM payment;


/*
8.	We would like to better understand what your customer base looks like. 
Please provide a list of all customer identification values, with a count of rentals 
they have made all-time, with your highest volume customers at the top of the list.
*/

SELECT c.customer_id, 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(r.rental_id) AS total_rentals
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_rentals DESC;


/* 
9. My partner and I want to come by each of the stores in person and meet the managers. 
Please send over the managers’ names at each store, with the full address 
of each property (street address, district, city, and country please).  
*/ 

SELECT s.store_id,CONCAT(m.first_name, ' ', m.last_name) AS manager_name, 
              a.address AS street_address, a.district, city.city, country.country
FROM store s
JOIN staff m ON s.manager_staff_id = m.staff_id
JOIN address a ON s.address_id = a.address_id
JOIN city ON a.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;

	
/*
10.	I would like to get a better understanding of all of the inventory that would come along with the business. 
Please pull together a list of each inventory item you have stocked, including the store_id number, 
the inventory_id, the name of the film, the film’s rating, its rental rate and replacement cost. 
*/
SELECT s.store_id, i.inventory_id, f.title AS film_title,
    IFNULL(f.rating, 'N/A') AS film_rating,  
    f.rental_rate,
    IFNULL(f.replacement_cost, 0) AS replacement_cost  
FROM store s
LEFT JOIN inventory i ON s.store_id = i.store_id
LEFT JOIN film f ON i.film_id = f.film_id
ORDER BY s.store_id, i.inventory_id;



/* 
11.	From the same list of films you just pulled, please roll that data up and provide a summary level overview 
of your inventory. We would like to know how many inventory items you have with each rating at each store. 
*/
SELECT s.store_id, IFNULL(f.rating, 'N/A') AS film_rating, COUNT(i.inventory_id) AS inventory_count 
FROM store s
LEFT JOIN inventory i ON s.store_id = i.store_id
LEFT JOIN film f ON i.film_id = f.film_id
GROUP BY s.store_id, f.rating 
ORDER BY s.store_id, film_rating;


/* 
12. Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to 
see how big of a hit it would be if a certain category of film became unpopular at a certain store.
We would like to see the number of films, as well as the average replacement cost, and total replacement cost, 
sliced by store and film category. 
*/ 
SELECT s.store_id, c.name AS category_name, 
			COUNT(i.inventory_id) AS inventory_count,
			AVG(f.replacement_cost) AS avg_replacement_cost,
			SUM(f.replacement_cost) AS total_replacement_cost
FROM store s
LEFT JOIN inventory i ON s.store_id = i.store_id
LEFT JOIN film f ON i.film_id = f.film_id
LEFT JOIN film_category fc ON f.film_id = fc.film_id
LEFT JOIN category c ON fc.category_id = c.category_id
GROUP BY s.store_id, c.name
ORDER BY s.store_id, c.name;


/*
13.	We want to make sure you folks have a good handle on who your customers are. Please provide a list 
of all customer names, which store they go to, whether or not they are currently active, 
and their full addresses – street address, city, and country. 
*/
SELECT c.first_name AS customer_first_name, c.last_name AS customer_last_name, s.store_id,
    IFNULL(c.active, 0) AS active_status,
    a.address AS street_address, ci.city AS city, co.country AS country
FROM customer c
LEFT JOIN store s ON c.store_id = s.store_id
LEFT JOIN address a ON s.address_id = a.address_id
LEFT JOIN city ci ON a.city_id = ci.city_id
LEFT JOIN country co ON ci.country_id = co.country_id;


/*
14.	We would like to understand how much your customers are spending with you, and also to know 
who your most valuable customers are. Please pull together a list of customer names, their total 
lifetime rentals, and the sum of all payments you have collected from them. It would be great to 
see this ordered on total lifetime value, with the most valuable customers at the top of the list. 
*/
SELECT c.customer_id, c.first_name AS customer_first_name, c.last_name AS customer_last_name, 
					COUNT(r.rental_id) AS total_rentals
FROM customer c 
LEFT JOIN rental r USING(customer_id)
LEFT JOIN payment p USING(rental_id)
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_rentals DESC;

/*
15. My partner and I would like to get to know your board of advisors and any current investors.
Could you please provide a list of advisor and investor names in one table? 
Could you please note whether they are an investor or an advisor, and for the investors, 
it would be good to include which company they work with. 
*/

SELECT CONCAT(a.first_name, ' ', a.last_name) AS name, 'Advisor' AS role, NULL AS company
FROM advisor a
UNION
SELECT CONCAT(i.first_name, ' ', i.last_name) AS name, 'Investor' AS role, i.company_name AS company
FROM investor i;




/*
16. We're interested in how well you have covered the most-awarded actors. 
Of all the actors with three types of awards, for what % of them do we carry a film?
And how about for actors with two types of awards? Same questions. 
Finally, how about actors with just one award? 
*/
