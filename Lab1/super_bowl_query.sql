USE ovechkin_stats_db;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Super_Bowl
WHERE game_date = '1969-01-12';


UPDATE Super_Bowl
SET mvp_player_first_name = "Jalen",
mvp_player_last_name = "Hurts",
performer_1 = "Kendrick Lamar",
performer_2 = "SZA",
performer_3 = "Samuel L. Jackson",
more_than_3_performers = "yes"
WHERE super_bowl.date = '2025-02-09';


INSERT INTO Super_Bowl (game_id, game_number, super_bowl.date, venue, city, state, performer_1, performer_2, performer_3)
VALUES
(60,'LX', '2026-02-08', 'Levi\'s Stadium', 'Santa Clara', 'California', 'Olivia Rodrigo', 'Laufey', 'Sabrina Carpenter');