/*Заполняем таблицу genre*/

INSERT INTO 
	genre(name)
VALUES
	('pop'),
	('rock'),
	('indie'),
	('jazz');



/*Заполняем таблицу performer*/

INSERT INTO 
	performer(name)
VALUES
	('Annet'),
	('Cassie'),
	('Joshua'),
	('David'),
	('Band');


/*Заполняем таблицу album*/

INSERT INTO 
	album(name, year)
VALUES
	('Album A', 1987),
	('Album B', 2005),
	('Album C', 1995),
	('Album D', 2011),
	('Album E', 2020);
	


/*Заполняем таблицу track*/
	
	
INSERT INTO 
	track(name, album_id, duration)
VALUES
	('This is my song', 3, 185),
	('Hello', 1, 154),
	('Sorry, my dear', 3, 199),
	('Summer', 2, 205),
	('Goodbye', 5, 177),
	('Love song', 4, 208),
	('Hi, my friend', 4, 171);
	


/*Заполняем таблицу collection*/

INSERT INTO
	collection(name, year)
VALUES
	('White', 2018),
	('Yellow', 2023),
	('Black', 1999),
	('Red', 2002),
	('Pink', 2009),
	('Grey', 2017);
	

/*Заполняем таблицы связей*/

INSERT INTO
	genre_performer(genre_id, performer_id)
VALUES
	(1, 2),
	(1, 5),
	(2, 4),
	(2, 1),
	(3, 1),
	(3, 2),
	(4, 3),
	(4, 5);
	
INSERT INTO
	album_performer(album_id, performer_id)
VALUES
	(1, 1),
	(2, 5),
	(2, 2),
	(3, 3),
	(3, 4),
	(4, 2),
	(5, 5);
	
INSERT INTO
	track_collection(track_id, collection_id)
VALUES
	(1, 3),
	(1, 5),
	(2, 4),
	(3, 6),
	(4, 2),
	(4, 1),
	(5, 2),
	(6, 1),
	(7, 2),
	(7, 6);