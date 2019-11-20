SELECT name, price, review_count, rating
FROM app_store_apps
WHERE rating BETWEEN '3.5' AND '5.0'
ORDER BY price DESC, rating
/* all the apps on the app store that are above-average in price, looking at prices*/

SELECT AVG(CAST(review_count AS numeric))
FROM app_store_apps
/*(12,893), want to get a decent metric for which apps hae been used enough to have a reliable rating*/

SELECT MAX(price)
FROM app_store_apps
SELECT MIN(price)
FROM app_store_apps
/*#eploratory*/
SELECT name, (CAST(price AS money)), review_count, rating
FROM play_store_apps
WHERE rating BETWEEN '3.5' AND '5.0'
ORDER BY price DESC, rating
/* all the apps on the app store that are above-average in price, looking at prices*/

SELECT MAX(CAST (price AS money)) AS max_price
FROM play_store_apps
SELECT MIN(CAST(price AS money)) AS min_price
FROM play_store_apps
/*#exploratory*/

SELECT AVG(CAST(review_count AS int))
FROM play_store_apps
/*(444153... maybe be skewed? find the median? yeah that's like really really hard, maybe in datacamp?)*/

SELECT AVG(price) as avg_price, rating
FROM app_store_apps
WHERE CAST(review_count as int) >'12893'
GROUP BY rating
ORDER BY avg_price DESC
/* avg price per rating (trying to find a bang/buck metric). looks like the app store target rating is 5.0*/ 

SELECT DISTINCT rating AS rating, AVG(CAST(trim('$' from price) as NUMERIC)) AS avg_price
FROM play_store_apps  
WHERE review_count > 15000 
GROUP BY rating
ORDER BY avg_price DESC
/*OK OMG finally. Same for the play store which is a dirty, nasty bitch. Target rating: 4.1
One thing to bear in mind: this does not necessarily mean that there are not good apps in other rating ranges, it just means
the average price is pretty low relative to the rating, and its a good starting place*/

SELECT name, primary_genre AS genre, content_rating
FROM app_store_apps
WHERE rating = 5.0
AND CAST(review_count AS int) > '12893'
AND price = 0.00
GROUP BY name, content_rating, genre, review_count
ORDER BY review_count
/* ok back up list: apps on the app store that are free, highly rated, and decently reviewed. 
If I can't find 10 nice cross-platform apps, this is where I will look for more recommendations.*/

SELECT DISTINCT name AS name, genres AS genre, content_rating
FROM play_store_apps
WHERE rating = 4.9
AND review_count > '20000'
AND (CAST(trim('$' from price) as NUMERIC)) = 0.00
GROUP BY name, content_rating, genre, review_count
ORDER BY content_rating
/* ok back up list: apps on the play store that are free, highest rated, and decently reviewed. 
If I can't find 10 nice cross-platform apps, this is where I will look for more recommendations.*/

SELECT AVG(price) AS avg_price, primary_genre AS genre, AVG(CAST(review_count AS numeric)) AS review_count
FROM app_store_apps
WHERE rating = 5.0
GROUP BY genre
ORDER BY avg_price DESC
/*looking into genre*/

SELECT AVG(price) AS avg_price, content_rating, AVG(CAST(review_count AS numeric)) AS review_count
FROM app_store_apps
WHERE rating = 5.0
GROUP BY content_rating
ORDER BY avg_price DESC
/*looking into content_rating*/

SELECT DISTINCT a.name, 
a.price AS app_store_price, 
a.rating AS app_store_rating, 
a.content_rating AS app_store_content_rating,
a.primary_genre AS app_store_genre,
(CAST(trim('$' from p.price) as NUMERIC)) AS play_store_price, 
p.rating AS play_store_rating,
p.content_rating AS play_store_content_rating,
p.genres AS play_store_genre
FROM app_store_apps AS a
INNER JOIN play_store_apps as p
ON a.name = p.name
WHERE CAST(a.review_count AS int) > 20000
AND a.rating >= 5.0
AND p.rating >= 4.5
AND a.price <= 0.99
ORDER BY play_store_rating DESC
/*this is the money. these are the games. the golden ticket games that they need in their repetoire*/

SELECT rating, review_count
FROM play_store_apps
WHERE rating IS NULL
AND review_count >= 1
GROUP BY rating, review_count
ORDER BY review_count DESC
/* a little research into our DQ issue*/

SELECT a.name, a.rating, a.
FROM play_store_apps
WHERE name LIKE 'Fitbit'
/* a little resreach into our namesake app*/

SELECT 
DISTINCT a.name, 
a.price AS app_store_price, 
a.rating AS app_store_rating, 
CAST(trim('$' from p.price) as NUMERIC) AS play_store_price,
p.rating AS play_store_rating,
(a.rating + a.rating +1)*12  AS life_of_app_store_app,
((ROUND(p.rating*2,0)/2)+(ROUND(p.rating*2,0)/2)+1)*12 AS life_of_play_store_app,
(((a.rating + a.rating +1)*12)*4500)-10000 AS lifetime_earnings_ASA,
((((ROUND(p.rating*2,0)/2)+(ROUND(p.rating*2,0)/2)+1)*12)*4500)-10000 AS lifetime_earnings_PSA
FROM app_store_apps AS a
INNER JOIN play_store_apps as p
ON a.name = p.name
WHERE CAST(a.review_count AS int) > 20000
AND a.rating >= 4.5
AND p.rating >= 4.5
AND a.price <= 0.99
ORDER BY lifetime_earnings_asa DESC, lifetime_earnings_psa DESC
/*programatically finding the highest earning cross-platform apps*/ 
