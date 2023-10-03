CREATE TABLE label_table ( 
label_id INTEGER PRIMARY KEY AUTOINCREMENT,
label VARCHAR(30)
);



INSERT INTO label_table (label)
SELECT DISTINCT(label)
FROM labels;

SELECT * FROM label_table;


ALTER TABLE label_table
ADD label_id_new VARCHAR(15);

UPDATE label_table 
SET label_id_new = CAST(label_id AS VARCHAR(15));


UPDATE label_table
SET label_id_new = label_id_new || 'L' ;


CREATE TABLE label_s (
label_id VARCHAR(20) PRIMARY KEY,
label VARCHAR(300)
);

INSERT INTO label_s
SELECT label_id_new, label FROM label_table;


SELECT count(*) FROM label_S;

DROP TABLE label_TABLE;


