USE spotify_daily_charts_db;
SELECT track_name, artists, daily_rank, country, snapshot_date
FROM Charts
JOIN Artists
USING (artist_id)
JOIN Countries
USING (country_id)
WHERE country = 'Australia' AND snapshot_date = '2025-02-10';

USE spotify_daily_charts_db;
SELECT CONCAT(track_name, ' by ', artists, ' was ranked ', daily_rank, ' in ', country, ' on ', snapshot_date) 
		AS 'Apt. chart positions on Feb 10th'
FROM Charts
JOIN Artists
USING (artist_id)
JOIN Countries
USING (country_id)
WHERE track_name = 'APT.' 
AND snapshot_date = '2025-02-10'
ORDER BY daily_rank,country;


USE spotify_daily_charts_db;
SELECT track_name, artists, daily_rank, daily_movement, country, snapshot_date
FROM Charts
JOIN Artists
USING (artist_id)
JOIN Countries
USING (country_id)
WHERE snapshot_date = '2025-02-03'
AND daily_movement >= 10
ORDER BY daily_movement DESC;


USE spotify_daily_charts_db;
SELECT track_name, artists, album_name, 'Album' AS From_Album_Or_Single
FROM Charts
JOIN Artists
USING (artist_id)
JOIN Albums
USING (album_id)
WHERE artists LIKE '%Kendrick%'
AND track_name != album_name


UNION 


SELECT track_name, artists, album_name, 'Single' AS From_Album_Or_Single
FROM Charts
JOIN Artists
USING (artist_id)
JOIN Albums
USING (album_id)
WHERE artists LIKE '%Kendrick%'
AND track_name = album_name
ORDER BY track_name ASC