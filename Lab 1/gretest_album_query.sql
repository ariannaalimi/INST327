USE greatest_albums_db;

SELECT Album_Rank, Album_Title, Artist, Genre, Release_Year
FROM Album_Rankings
JOIN Artists
USING (Artist_ID)
JOIN Genres
USING (Genre_ID)
WHERE Album_Rank <= 100
ORDER BY Album_Rank ASC;

DROP VIEW IF EXISTS rock_albums;

CREATE VIEW rock_albums AS
SELECT Album_Rank, Album_Title, Artist, Genre, Release_Year, Worldwide_Sales_In_Millions
FROM Album_Rankings
JOIN Artists
USING (Artist_ID)
JOIN Genres
USING (Genre_ID)
WHERE Genre LIKE "%Rock%";

DROP VIEW IF EXISTS albums_with_long_songs;

CREATE VIEW albums_with_long_songs AS
SELECT Album_Title, Artist, Genre, (Duration_In_Minutes/Track_Count) AS average_song_duration
FROM Album_Rankings
JOIN Artists
USING (Artist_ID)
JOIN Genres
USING (Genre_ID)
HAVING average_song_duration >= 5
ORDER BY average_song_duration DESC;



DROP PROCEDURE IF EXISTS albums_by;

DELIMITER //

CREATE PROCEDURE albums_by(IN artist_name VARCHAR(255))
BEGIN
    SELECT Artist, Album_Title, Album_Rank, Genre, Worldwide_Sales_In_Millions
    FROM Album_Rankings
	JOIN Artists
	USING (Artist_ID)
	JOIN Genres
	USING (Genre_ID)
    WHERE Artist LIKE CONCAT('%', artist_name, '%')
    ORDER BY Album_Rank;
END //

DELIMITER ;

-- Calling the procedure
CALL albums_by('Drake');


DROP FUNCTION IF EXISTS top_album_from;

DELIMITER //

CREATE FUNCTION top_album_from(album_year int)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE album VARCHAR(255);
    SELECT Album_Title INTO album
    FROM Album_Rankings
    WHERE Release_Year = album_year
    ORDER BY Album_Rank ASC
    LIMIT 1;
    RETURN album;
END //

DELIMITER ;

-- Using the function in a SELECT query
SELECT top_album_from('1979');
