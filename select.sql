--Переделанные задания

--4 Задание - Все исполнители, которые не выпустили альбомы в 2020 году
SELECT m.musician_name, date_release FROM album a 
INNER JOIN musician m ON m.id = a.id 
WHERE a.date_release NOT IN (
	SELECT date_release FROM album a 
	INNER JOIN musician m ON m.id = a.id 
	WHERE a.date_release = '2020-01-01')
ORDER BY m.musician_name 

-- 9 Задание - Название альбомов, содержащих наименьшее количество треков
SELECT album_name, COUNT(track_name) AS count_of_track FROM track t 
INNER JOIN album a ON t.id_album = a.id 
GROUP BY a.album_name
HAVING COUNT(track_name) = (
	SELECT COUNT(track_name) FROM track t 
	INNER JOIN album a ON t.id_album = a.id 
	GROUP BY a.album_name
	ORDER BY count 
	LIMIT 1
);