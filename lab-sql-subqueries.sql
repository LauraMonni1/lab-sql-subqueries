USE sakila;

-- 1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.

SELECT title FROM sakila.film 
WHERE title = 'Hunchback Impossible';  -- select film name
SELECT COUNT(*) FROM sakila.inventory -- count the number of copies of that film
WHERE film_id = (SELECT film_id FROM sakila.film 
                  WHERE title = 'Hunchback Impossible');

SELECT -- put the two queries together to have title and number of copies
(SELECT title FROM sakila.film 
WHERE title = 'Hunchback Impossible') AS film_title,
(SELECT COUNT(*) FROM sakila.inventory
 WHERE film_id = (
                   SELECT film_id FROM sakila.film 
                   WHERE title = 'Hunchback Impossible')
                   ) AS number_of_copies;


-- 2. List all films whose length is longer than the average length of all the films in the Sakila database.

SELECT f.title AS film_title, f.length FROM sakila.film AS f
WHERE f.length > (SELECT AVG(length) FROM sakila.film);

-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".

SELECT a.first_name, a.last_name FROM sakila.actor AS a
JOIN sakila.film_actor AS fa
ON a.actor_id = fa.actor_id
WHERE 
fa.film_id = (
              SELECT film_id FROM sakila.film 
              WHERE title = 'Alone Trip');
