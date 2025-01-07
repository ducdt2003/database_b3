USE sakila;

-- 1. How many category film we have?

SELECT COUNT(*) AS total_categories
FROM category;

-- 2. Count the number of "ACTION" films
SELECT COUNT(*) AS action_films_count
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Action';

-- 3. Count the number of unique customers who have in rental table
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM rental;

-- 4. Select the film title and length of all films that have length greater than the average film length
SELECT title, length
FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- 5. Select the maximum number and the minimum number of films for each category
SELECT category.name AS category_name,
       MAX(film_count) AS max_films,
       MIN(film_count) AS min_films
FROM (
    SELECT category_id, COUNT(*) AS film_count
    FROM film_category
    GROUP BY category_id
) AS film_counts
JOIN category ON film_counts.category_id = category.category_id
GROUP BY category.name;

-- 6. Tell me each category name and the number of films for that category

SELECT category.name AS category_name, 
       COUNT(film_category.film_id) AS film_count
FROM category
JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.name;

-- 7. concatenate the film titles and length from the films table

SELECT CONCAT(title, ' - ', length, ' minutes') AS film_description
FROM film;

-- 8. Extract the customers email from the 5th character onwards
SELECT SUBSTRING(email, 5) AS email_starting_5th_char
FROM customer;

-- 9. Tell me the customers first name in lower case and last name in upper case for each customer who have last name is "Smith"
SELECT LOWER(first_name) AS first_name_lower,
       UPPER(last_name) AS last_name_upper
FROM customer
WHERE last_name = 'Smith';

-- 10. Tell me the last 3 letters of each film title from the films table
SELECT SUBSTRING(title, -3) AS last_3_letters
FROM film;

-- 11. Concatenate the first three letters in the first name and last name columns together from the customers table
SELECT CONCAT(SUBSTRING(first_name, 1, 3), SUBSTRING(last_name, 1, 3)) AS name_initials
FROM customer;

-- 12. Which films are over 2 hours long?
SELECT title, length
FROM film
WHERE length > 120;

-- 13. Which category name had the most film?

SELECT category.name AS category_name, 
       COUNT(film_category.film_id) AS film_count
FROM category
JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY film_count DESC
LIMIT 1;

-- 14. How many actor for the film 'AFFAIR PREJUDICE'?
SELECT COUNT(*) AS actor_count
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
WHERE film.title = 'AFFAIR PREJUDICE';

-- 15. Which 5 customers made the most rental?

SELECT customer_id, COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id
ORDER BY rental_count DESC
LIMIT 5;

-- 16. Which films were shown in category 'Action'?
SELECT film.title
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Action';

-- 17. How many of the customers made a rental?
SELECT COUNT(DISTINCT customer_id) AS customers_made_rental
FROM rental;


