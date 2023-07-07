USE albums_db;

SHOW TABLES;

SELECT * FROM albums;

-- PRIMARY KEY = id

-- column named 'name' represents album name

-- sales column represents total copies of the album sold IN MILLIONS

SELECT name FROM albums WHERE artist = 'Pink Floyd';

-- What is the year Sgt. Pepper's
-- Lonely Hearts Club Band was released?
-- 1967
SELECT release_date FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

-- What is the genre for the album Nevermind?
-- Grunge, Alternative rock
SELECT genre FROM albums WHERE name = 'Nevermind';

-- Which albums were released in the 1990s?
SELECT * FROM albums WHERE release_date >= 1990;

-- Which albums had less than 20 million 
-- certified sales? Rename this column as low_selling_albums.
SELECT * FROM albums WHERE sales < 20.0;
SELECT DISTINCT 'name' FROM albums AS low_selling_albums WHERE sales < 20.0;


