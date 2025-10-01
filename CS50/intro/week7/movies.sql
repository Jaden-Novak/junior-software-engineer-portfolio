-- 1) Write a SQL query to list the titles of all movies released in 2008.
SELECT title FROM movies WHERE year = 2008;

-- 2) Write a SQL query to determine the birth year of Emma Stone.
SELECT birth FROM people WHERE name = 'Emma Stone';

-- 3) Write a SQL query to list the titles of all movies with a release date on or after 2018, in alphabetical order.
SELECT title FROM movies WHERE year >= 2018 ORDER BY title ASC;

-- 4) Write a SQL query to determine the number of movies with an IMDb rating of 10.0.
SELECT COUNT(*) FROM ratings WHERE rating = 10.0;

-- 5) Write a SQL query to list the titles and release years of all Harry Potter movies, in chronological order.
SELECT title, year FROM movies WHERE title LIKE 'Harry Potter%' ORDER BY year;

-- 6) Write a SQL query to determine the average rating of all movies released in 2012.
SELECT AVG(rating) FROM ratings WHERE movie_id IN (SELECT id FROM movies WHERE year = 2012);

-- 7) Write a SQL query to list all movies released in 2010 and their ratings, in descending order by rating. For movies with the same rating, order them alphabetically by title.
SELECT movies.title, ratings.rating FROM movies
JOIN ratings ON movies.id = ratings.movie_id
WHERE movies.year = 2010
ORDER BY ratings.rating DESC, movies.title ASC;

-- 8) Write a SQL query to list the names of all people who starred in Toy Story.
SELECT people.name FROM people
JOIN stars ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
WHERE movies.title = 'Toy Story';

-- 9) Write a SQL query to list the names of all people who starred in a movie released in 2004, ordered by birth year.
SELECT DISTINCT name FROM people
JOIN stars ON people.id = stars.person_id
JOIN movies ON movie_id = movies.id
WHERE movies.year = 2004
ORDER BY people.birth;

-- 10) Write a SQL query to list the names of all people who have directed a movie that received a rating of at least 9.0.
SELECT DISTINCT name FROM people
JOIN directors ON people.id = directors.person_id
JOIN movies ON directors.movie_id = movies.id
JOIN ratings ON movies.id = ratings.movie_id
WHERE rating >= 9.0;

-- 11) Write a SQL query to list the titles of the five highest rated movies (in order) that Chadwick Boseman starred in, starting with the highest rated.
SELECT DISTINCT title FROM movies
JOIN stars ON movies.id = stars.movie_id
JOIN people ON stars.person_id = people.id
JOIN ratings ON movies.id = ratings.movie_id
WHERE people.name = 'Chadwick Boseman'
ORDER BY ratings.rating DESC
LIMIT 5;

-- 12) Write a SQL query to list the titles of all movies in which both Bradley Cooper and Jennifer Lawrence starred.
SELECT title FROM movies
JOIN stars ON movies.id = stars.movie_id
JOIN people ON stars.person_id = people.id
WHERE people.name IN ('Bradley Cooper', 'Jennifer Lawrence')
GROUP BY movies.id, movies.title
HAVING COUNT(DISTINCT people.name) = 2;

-- 13) Write a SQL query to list the names of all people who starred in a movie in which Kevin Bacon also starred.
SELECT DISTINCT name FROM people
JOIN stars ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
WHERE movies.id IN
(SELECT movies.id FROM movies
JOIN stars ON stars.movie_id = movies.id
JOIN people ON stars.person_id = people.id
WHERE people.name = 'Kevin Bacon' AND people.birth = 1958)
AND people.name != 'Kevin Bacon';
