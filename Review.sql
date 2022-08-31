-- SOL 1

SELECT DISTINCT  NOM_EMPL, EDIFICI
FROM EMPLEATS e, DEPARTAMENTS d 
WHERE e.NUM_DPT = 5 AND e.NUM_DPT = d.NUM_DPT 
ORDER BY NOM_EMPL ASC;

-- SOL 2

SELECT DISTINCT  NOM_EMPL, SOU
FROM EMPLEATS e
WHERE e.NUM_DPT = 1 OR e.NUM_DPT = 2 
ORDER BY NOM_EMPL, SOU;

-- SOL 3

SELECT DISTINCT NUM_DPT, NOM_DPT
FROM DEPARTAMENTS d NATURAL INNER JOIN EMPLEATS e 
WHERE  EXISTS 
	(SELECT CIUTAT_EMPL
	FROM EMPLEATS e1
	WHERE e.CIUTAT_EMPL = e1.CIUTAT_EMPL AND e.NUM_EMPL <> e1.NUM_EMPL);
	
-- SOL 4

SELECT NUM_DPT, NOM_DPT
FROM DEPARTAMENTS d
WHERE NOT EXISTS 
	(SELECT CIUTAT_EMPL
	FROM EMPLEATS e
	WHERE d.NUM_DPT = e.NUM_DPT  AND e.CIUTAT_EMPL = 'MADRID')
ORDER BY NOM_DPT ASC;

