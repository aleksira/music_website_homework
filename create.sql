create table genre (
	genre_id SERIAL primary key,
	name VARCHAR(255) not null
);

create table performer (
	performer_id SERIAL primary key,
	name VARCHAR(255) not NULL
);

create table genre_performer (
	genre_performer_id SERIAL primary key,
	genre_id INTEGER not null,
	performer_id INTEGER not null,
	constraint fk_genre foreign key(genre_id) references genre(genre_id) on delete cascade,
	constraint fk_performer foreign KEY(performer_id) references performer(performer_id) on delete cascade
);

create table album (
	album_id SERIAL primary key,
	name VARCHAR(255) not null,
	year INTEGER check (year between 1950 and 2024)
);

create table album_performer (
	album_performer_id SERIAL primary key,
	album_id INTEGER not null,
	performer_id INTEGER not null,
	constraint fk_album foreign key(album_id) references album(album_id) on delete cascade,
	constraint fk_performer foreign KEY(performer_id) references performer(performer_id) on delete cascade
);

create table track (
	track_id SERIAL primary key,
	name VARCHAR(255) not null,
	album_id INTEGER references album(album_id) not null,
	duration INTEGER not NULL
);

create table collection (
	collection_id SERIAL primary key,
	name VARCHAR(255) not null,
	year INTEGER check (year between 1950 and 2024)
);

create table track_collection (
	track_collection_id SERIAL primary key,
	track_id INT not null,
	collection_id INT not null,
	constraint fk_track foreign key(track_id) references track(track_id) on delete cascade,
	constraint fk_collection foreign KEY(collection_id) references collection(collection_id) on delete cascade
);