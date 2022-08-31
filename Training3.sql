-- SOL1:

CREATE TABLE fam_re(
familia varchar(1),
reproducio varchar(1),
PRIMARY KEY (familia)
);


CREATE TABLE esp_rar(
especie varchar(1),
familia varchar(1) NOT NULL,
color varchar(1) NOT NULL,
raresa varchar(1),
PRIMARY KEY (especie),
UNIQUE (familia,color),
FOREIGN KEY (familia) REFERENCES fam_re(familia)
);


-- SOL2:

CREATE TABLE pais2pib(
paisAg varchar(1),
pib varchar(1),
PRIMARY KEY (paisAg)
);

CREATE TABLE D_AC(
paisD varchar(1);
paisAc varchar(1);
deute varchar (1);
PRIMARY KEY (paisD,paisAc)
);

CREATE TABLE agencia2pais(
ag varchar(1),
paisAg varchar(1),
PRIMARY KEY (ag),
FOREIGN KEY (paisAg) REFERENCES pais2pib(paisAg)
);

CREATE TABLE resultat(
ag varchar(1),
paisD varchar(1),
paisAc varchar(1),
PRIMARY KEY (ag,paisD,paisAc),
FOREIGN KEY (ag) REFERENCES agencia2pais(ag),
FOREIGN KEY (paisD,paisAc) REFERENCES D_AC(paisD, paisAc)
);


-- SOL3:

CREATE MATERIALIZED VIEW a 
build IMMEDIATE 
refresh complete ON demand
enable query rewrite 
AS (SELECT cand, poble, MAX(val)
FROM CentMilResp
GROUP BY cand, pobl);

CREATE MATERIALIZED VIEW b
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
ENABLE QUERY REWRITE
AS (SELECT cand, MAX(val) FROM CentMilResp GROUP BY cand);



