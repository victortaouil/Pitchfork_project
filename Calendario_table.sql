select * from reviews LIMIT 5;

SELECT Max(pub_date) FROM reviews;

CREATE TEMP TABLE IntervaloDeDatas (data DATE);


INSERT INTO IntervaloDeDatas (data)
VALUES (DATE('1999-01-05')) ;

-- Use uma consulta recursiva para adicionar datas ao intervalo
WITH RECURSIVE DateRange AS (
  SELECT DATE('1999-01-05') AS data
  UNION ALL
  SELECT DATE(data, '+1 day')
  FROM DateRange
  WHERE data < ('2017-01-09')
)
INSERT INTO IntervaloDeDatas (data)
SELECT data FROM DateRange;

SELECT * FROM IntervaloDeDatas;

DROP TABLE IntervaloDeDatass;

CREATE TABLE calendario0 ( 
date_id INTEGER PRIMARY KEY AUTOINCREMENT,
data DATE 
);

INSERT INTO calendario0 (data)
SELECT * FROM IntervaloDeDatas;

select * from calendario0;

ALTER TABLE calendario0
ADD date_id_new VARCHAR(20);

UPDATE calendario0
SET date_id_new = CAST(date_id AS VARCHAR(20)) || 'D';



CREATE TABLE calendario (
date_id VARCHAR(20) PRIMARY KEY,
data DATE
);

select * from calendario0;

INSERT INTO calendario
SELECT date_id_new, data FROM calendario0;


SELECT * FROM calendario;

DROP TABLE IntervaloDeDatas;
DROP TABLE calendario0;