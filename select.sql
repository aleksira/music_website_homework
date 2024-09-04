/*Дополнения, чтобы получился результат в задании*/

INSERT INTO 
	track(name, album_id, duration)
VALUES
	('Lalala', 4, 240),
	('A Good Song', 1, 216)

INSERT INTO 
	album(name, year)
VALUES
	('Album F', 2020)
	
INSERT INTO 
	performer(name)
VALUES
	('Thomas Thomas')
	
INSERT INTO 
	genre_performer(genre_id, performer_id)
VALUES
	(4, 6)
	
INSERT INTO 
	album_performer(album_id, performer_id)
VALUES
	(3, 6);
	
	
INSERT INTO
	album(name, year)
VALUES
	('Album G', 2019)
	
INSERT INTO
	track(name, album_id, duration)
VALUES
	('Song about something', 6, 246),
	('Winter Day', 6, 201);
	
/*Название и продолжительность самого длительного трека*/

SELECT name, duration
FROM track
WHERE duration = (SELECT MAX(duration) FROM track);

/*Название треков, продолжительность которых не менее 3,5 минут*/

SELECT name, duration
FROM track
WHERE duration >= 210;

/*Названия сборников, вышедших в период с 2018 по 2020 год включительно*/

SELECT name
FROM collection
WHERE year BETWEEN 2018 AND 2020;

/*Исполнители, чьё имя состоит из одного слова*/

SELECT name
FROM performer
WHERE name NOT LIKE '% %';

/*Название треков, которые содержат слово «мой» или «my»*/

SELECT name
FROM track
WHERE name LIKE '%my%' OR name LIKE '%мой%';

/*Количество исполнителей в каждом жанре*/

SELECT name, COUNT(gp.genre_id)
FROM genre g
JOIN genre_performer gp ON g.genre_id = gp.genre_id 
GROUP BY g.name;

/*Количество треков, вошедших в альбомы 2019–2020 годов*/

SELECT a.name, COUNT(t.album_id)
FROM track t
JOIN album a ON t.album_id = a.album_id
WHERE a.year BETWEEN 2019 AND 2020
GROUP BY a.name;

/*Средняя продолжительность треков по каждому альбому*/

SELECT a.name, avg(t.duration)
FROM track t
JOIN album a ON t.album_id = a.album_id 
GROUP BY a.name
ORDER BY a.name;


/*Все исполнители, которые не выпустили альбомы в 2020 году*/

SELECT p.name
FROM performer p 
WHERE p.name NOT IN (
SELECT p.name FROM performer p 
JOIN album_performer ap ON p.performer_id = ap.performer_id
JOIN album a ON a.album_id = ap.album_id 
WHERE a.year = 2020);

/*Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)*/

SELECT DISTINCT c.name
FROM collection c
JOIN track_collection tc ON c.collection_id = tc.collection_id
JOIN track t ON t.track_id = tc.track_id
JOIN album_performer ap ON ap.album_id = t.album_id
WHERE ap.performer_id = 2 /*любой id*/

/*Названия альбомов, в которых присутствуют исполнители более чем одного жанра*/

SELECT a.name
FROM album a
JOIN album_performer ap ON ap.album_id = a.album_id
JOIN performer p ON p.performer_id = ap.performer_id
JOIN genre_performer gp ON gp.performer_id = p.performer_id
GROUP BY a.name
HAVING COUNT(gp.performer_id) > 1


/*Наименования треков, которые не входят в сборники*/

SELECT t.name
FROM track t
LEFT JOIN track_collection tc ON tc.track_id = t.track_id
WHERE collection_id ISNULL 

/*Исполнитель или исполнители, написавшие самый короткий по продолжительности трек*/

SELECT p.name
FROM performer p
JOIN album_performer ap ON p.performer_id = ap.performer_id
JOIN album a ON a.album_id = ap.album_id
JOIN track t ON a.album_id = t.album_id
WHERE t.duration IN (SELECT MIN(duration) FROM track)

/*Названия альбомов, содержащих наименьшее количество треков*/

SELECT a.name, count(t.album_id)
FROM album a
JOIN track t ON a.album_id = t.album_id
GROUP BY a.name
HAVING COUNT(t.album_id) = (SELECT COUNT(t.album_id) FROM track t GROUP BY t.album_id ORDER BY COUNT(t.album_id) LIMIT 1)

