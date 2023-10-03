CREATE TABLE review_s ( 
reviewid INTEGER PRIMARY KEY AUTOINCREMENT,
title TEXT,
URL TEXT,
score REAL,
author TEXT,
author_id VARCHAR(20),
genre_id VARCHAR(20),
label_id VARCHAR(20),
date_id VARCHAR(20),
author_type TEXT,
genre TEXT,
label TEXT,
pub_date DATE,
CONSTRAINT author FOREIGN KEY (author_id) REFERENCES author_s (author_id),
CONSTRAINT genre FOREIGN KEY (genre_id) REFERENCES genre_s (genre_id),
CONSTRAINT label FOREIGN KEY (label_id) REFERENCES label_s (label_id),
CONSTRAINT date FOREIGN KEY (date_id) REFERENCES calendario (date_id)
);

WITH cte1 AS 
(
SELECT g.genre,l.label 
FROM genres AS g 
INNER JOIN label AS l 
ON g.reviewid = l.reviewid
);


INSERT INTO review_s (title,URL,score,author,author_type,genre,label,pub_date)
SELECT title,URL,score,author,author_type, g.genre, l.label, pub_date
FROM genres AS g
INNER JOIN labels AS l
ON g.reviewid = l.reviewid 
INNER JOIN reviews AS r
ON g.reviewid = r.reviewid;

select * from review_s;

UPDATE review_s
SET author_id = (SELECT a.author_id FROM author_s AS a WHERE a.author = review_s.author_type),
	genre_id = (SELECT g.genre_id FROM genre_s AS g WHERE g.genre = review_s.genre),
	label_id = (SELECT l.label_id FROM label_s AS l WHERE l.label = review_s.label),
	date_id = (SELECT c.date_id FROM calendario AS c WHERE c.data = review_s.pub_date);

select COUNT(DISTINCT(title)) from review_s;

DROP TABLE artist_table;
DROP TABLE artists;
DROP TABLE author_table;
DROP TABLE genres;
DROP TABLE labels;
DROP TABLE reviews;
DROP TABLE years;

