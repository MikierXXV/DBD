CREATE TABLE T (
  A INTEGER,
  B INTEGER,
  C INTEGER NOT NULL,
  D INTEGER NOT NULL,
  PRIMARY KEY (A, B)
);


EX4:

Files agregacio:

v1 -> 100.000, 10 -> 10
v2 -> 100.000, 10*100 -> 1.000
v3 -> 100.000, 100*200 -> 20.000
crea candidata v4 -> 100.000, 10*100 -> 1.000
es crea candidata a causa del group by cand y edat que per obtenir el avg de candidat utilitzraem el count(*), ja que sense es te el avg del group by anterior

Espai d agregacio:

v1 -> 10.000 * (3/6) * (10/100.000) = 0,5
v2 -> 10.000 * (5/6) * (1.000/100.000) = 83.3
v3 -> 10.000 * (5/6) * (20.000/100.000) = 1666.6
v4 -> 10.000 * (6/6) * (1.000/100.000) = 100


CREATE MATERIALIZED VIEW b
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
ENABLE QUERY REWRITE
AS SELECT cand, edat, AVG(val), MAX(val), count(*) FROM CentMilResp GROUP BY cand, edat;



EX5:

Files agregacio:

v1 -> 50.000, 500*4000*40000 -> 50000
v2 -> 50.000, 500*40000*4000 -> 50000
v3 -> 50.000, 500*4000*40000*5 -> 50000
v4 -> 50.000, 500*5*4000 -> 500000

Espai d agregacio:

v1 -> 1.000 * (4/5) * (50000/50000) = 800
v2 -> 1.000 * (4/5) * (50000/50000) = 800
v3 -> 1.000 * (5/5) * (50000/50000) = 1000
v4 -> 1.000 * (4/5) * (50000/50000) = 800

CREATE MATERIALIZED VIEW v3
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
ENABLE QUERY REWRITE
AS SELECT A, SUM(B), SUM(C), SUM(D), COUNT(*) FROM T GROUP BY A;

CREATE MATERIALIZED VIEW v4
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
ENABLE QUERY REWRITE
AS SELECT A, D, SUM(B) FROM T GROUP BY A, D;

CREATE MATERIALIZED VIEW v2
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
ENABLE QUERY REWRITE
AS SELECT A, C, SUM(B) FROM T GROUP BY A, C;



