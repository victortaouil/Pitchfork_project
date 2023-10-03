CREATE TABLE author_table ( 
author_id INTEGER PRIMARY KEY AUTOINCREMENT,
author VARCHAR(30)
);



INSERT INTO author_table (author)
SELECT DISTINCT(author_type)
FROM reviews;

SELECT * FROM author_table;


ALTER TABLE author_table
ADD author_id_new VARCHAR(15);

UPDATE author_table 
SET author_id_new = CAST(author_id AS VARCHAR(15));


UPDATE author_table
SET author_id_new = author_id_new || 'AT' ;


CREATE TABLE author_s (
author_id VARCHAR(20) PRIMARY KEY,
author VARCHAR(300)
);

INSERT INTO author_s
SELECT author_id_new, author FROM author_table;


SELECT * FROM author_S;

DROP TABLE author_TABLE;
