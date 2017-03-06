/* Query all of the entries in the Genre table */

SELECT * FROM Genre

/* Using the INSERT statement, add one of your favorite artists to the Artist table. */

INSERT INTO Artist (ArtistName, YearEstablished)
VALUES ('Wilco', '1995');

/* Using the INSERT statement, add one, or more, albums by your artist to the Album table. */

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES ('CoolAlbum', '1999', '2268', 'Woah a Band', '29', '2'),
       ('Future Album', '2250', '1234', 'Woah a Band', '29', '2')


/* Using the INSERT statement, add some songs that are on that album to the Song table. */

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('future song', '24124', '1999', '2', '29', '24'),
       ('real cool song bro', '24124', '1999', '29', '1', '24')

/* Write a SELECT query that provides the song titles, album title, and artist name for all
of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables,
 and the WHERE keyword to filter the results to the album and artist you added.
Here is some more info on joins that might help.

Reminder: Direction of join matters. Try the following statements and see the difference in results.
SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId; */

SELECT s.Title, alb.Title, art.ArtistName
FROM Song s
LEFT JOIN Album alb ON alb.AlbumId = s.AlbumId
LEFT JOIN Artist art ON art.ArtistId = alb.ArtistId
WHERE art.ArtistName = 'Wilco'


/*Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
SELECT Album.Title, COUNT(*)
FROM Song
JOIN Album ON Album.AlbumId = Song.AlbumId
GROUP BY Album.AlbumId

/*Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
SELECT Artist.ArtistName, COUNT(*)
FROM Song
JOIN Artist ON Artist.ArtistId = Song.ArtistId
GROUP BY Artist.ArtistName

/*Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
SELECT Genre.Label, COUNT(*)
FROM Song
JOIN Genre ON Genre.GenreId = Song.GenreId
GROUP BY Genre.Label

/*Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.*/
SELECT MAX(Album.AlbumLength) FROM Album
-- SELECT Album.Title, MAX(Album.AlbumLength) FROM Album


/*Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.*/

SELECT MAX(Song.SongLength FROM Song
-- SELECT Song.Title, MAX(Song.SongLength) FROM Song

/*Modify the previous query to also display the title of the album. */

-- SELECT Album.Title, Song.Title, MAX(Song.SongLength) FROM Song
-- JOIN Album ON Album.AlbumId = Song.AlbumId

SELECT Album.Title, MAX(Song.SongLength) AS "Longest Song" FROM Song
JOIN Album ON Album.AlbumId = Song.AlbumId
