--1 Задание
SELECT mg.genre, COUNT(musician_id) AS count_musician FROM genre_musician gm
INNER JOIN music_genre mg ON gm.genre_id = mg.id 
GROUP BY mg.genre
ORDER BY COUNT(musician_id) DESC;

--2 Задание
SELECT a.date_release, COUNT(track_name) AS count_track  FROM track t 
INNER JOIN album a ON a.id = t.id_album 
GROUP BY a.date_release
HAVING a.date_release BETWEEN '2018-01-01' AND '2019-01-01'; -- сгрупировал с 18 по 19 год, т.к. 20 не имею

--3 Задание
SELECT a.album_name, AVG(track_duration) AS average_duration FROM track t 
INNER JOIN album a ON a.id = t.id_album 
GROUP BY a.album_name
ORDER BY AVG(track_duration) DESC;

--4 Задание
SELECT m.musician_name, date_release FROM album a 
INNER JOIN musician m ON m.id = a.id 
WHERE a.date_release != '2019-01-01';  --исключил 19 год т.к. 20 не имею, но смысл я понял

--5 Задание
SELECT c.collection_name, musician_name FROM musician m 
INNER JOIN album_musician am ON m.id = am.musician_id 
INNER JOIN album a ON am.album_id = a.id 
INNER JOIN track t  ON a.id = t.id_album 
INNER JOIN collection_track ct ON t.id = ct.track_id 
INNER JOIN collection c ON ct.collection_id = c.id 
WHERE m.musician_name  = 'Ария ';

--6 Задание
SELECT album_name, COUNT(mg.genre) AS count_of_genre FROM album a  
INNER JOIN genre_musician gm ON a.id = gm.musician_id
INNER JOIN music_genre mg  ON gm.genre_id = mg.id 
GROUP BY album_name
ORDER BY count_of_genre DESC;

--7 задание
SELECT track_name, collection_name FROM collection c 
INNER JOIN collection_track ct ON c.id = ct.collection_id 
RIGHT JOIN track t ON ct.track_id = t.id 
WHERE c.collection_name IS NULL;

--8 задание
SELECT m.musician_name , MIN(track_duration) AS duration_of_a_short_track FROM track t 
INNER JOIN album a ON t.id_album = a.id 
INNER JOIN musician m ON a.id = m.id 
GROUP BY m.musician_name 
HAVING MIN(track_duration) = (SELECT MIN(track_duration) FROM track);

--9 Задание 
SELECT album_name, COUNT(track_name) AS count_of_track FROM track t 
INNER JOIN album a ON t.id_album = a.id 
GROUP BY a.album_name
HAVING COUNT(track_name) = (SELECT MIN(id_album) FROM track); --Не уверен в корректности такого решения, но другого не придумал
