
CREATE TABLE artist_table ( 
artist_id INTEGER PRIMARY KEY AUTOINCREMENT,
artist VARCHAR(300)
);


INSERT INTO artist_table (artist)
SELECT DISTINCT(artist)
FROM artists;

SELECT * FROM ARTIST_table;


ALTER TABLE artist_table
ADD artist_id_new VARCHAR(15);

UPDATE artist_table 
SET artist_id_new = CAST(artist_id AS VARCHAR(15));


UPDATE artist_table 
SET artist_id_new = artist_id_new || 'A' ;


CREATE TABLE artist_s (
artist_id VARCHAR(20) PRIMARY KEY,
artist VARCHAR(300)
);

INSERT INTO artist_s
SELECT artist_id_new, artist FROM artist_table;


SELECT * FROM ARTIST_S;

DROP TABLE ARTIST_TABLE;