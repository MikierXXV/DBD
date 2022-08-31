-- Ex7 :
CREATE CLUSTER hash_proj (proj_id number(8,0)) single TABLE
HASHKEYS 17 PCTFREE 0;
create table projectes(
 id  number(8,0),
 zona char(20),
 pressupost number(17, 0),
 nom char(100),
  descripcio char(250),
  qual_mediamb char(250)
 ) CLUSTER hash_proj(id);
 
CREATE CLUSTER hash_ob (ob_proj number(8, 0)) single TABLE 
HASHKEYS 92 PCTFREE 0;
create table obres(
 id  number(8,0),
 proj number(8, 0),
  tipus  number(17,0),
 pressupost number(17, 0),
 empreses char(250),
 responsables char(250)
) CLUSTER hash_ob(proj);

DECLARE id INT; pn INT; i INT;
nz INT;
zona CHAR(20);
tipus INT;
proj int;

begin

for i in 1..100 loop
  	nz := (i - 1) Mod 10 + 1;
	if (nz = 1) then zona := 'Baix Llobregat'; END if;
	if (nz = 2) then zona := 'Barcelona'; END if;
	if (nz = 3) then zona := 'Baix Vall?s'; END if;
	if (nz = 4) then zona := 'Baix Montseny'; END if;
	if (nz = 5) then zona := 'Vall?s Orient'; END if;
	if (nz = 6) then zona := 'Vall?s Occident'; END if;
	if (nz = 7) then zona := 'Moian?s'; END if;
	if (nz = 8) then zona := 'Segarra'; END if;
	if (nz = 9) then zona := 'Gavarres'; END if;
	if (nz = 10) then zona := 'Ardenya'; END if;
        insert into projectes values(i, zona, 20000, 'nom' || i, 'descr' || i, 'qual' || i);
end loop;


pn:= 1;
for i in 1..1000 loop
	if (pn = 1) then 
		id := i;
	else
		id := 1002 - i;
	END if;
	nz := (id - 1) Mod 10 + 1;
	tipus := (id - 1) mod 200 + 1;
        proj := (id - 1) mod 100 + 1;
	insert into obres values (id, proj, tipus, 1000, 'emp' || id, 'resp' || id);
	pn:=pn * (-1);
end loop;
end;


-- Actualitzar estadístiques
DECLARE
esquema VARCHAR2(100);
CURSOR c IS SELECT TABLE_NAME FROM USER_TABLES WHERE TABLE_NAME NOT LIKE 'SHADOW_%';
BEGIN
SELECT '"'||sys_context('USERENV', 'CURRENT_SCHEMA')||'"' INTO esquema FROM dual;
FOR taula IN c LOOP
  DBMS_STATS.GATHER_TABLE_STATS( 
    ownname => esquema, 
    tabname => taula.table_name, 
    estimate_percent => NULL,
    method_opt =>'FOR ALL COLUMNS SIZE REPEAT',
    granularity => 'GLOBAL',
    cascade => TRUE
    );
  END LOOP;
END;


/* select sum(o.pressupost), sum(p.pressupost)
from obres o, projectes p
where o.proj = p.id and p.id = 50;

SELECT * FROM user_tables;

PURGE RECYCLEBIN */


/* saber B */
--SELECT blocks FROM USER_TABLES WHERE table_name = 'OBRES'

/* si em passo */
--SELECT blocks FROM USER_ts_quotas WHERE tablespace_name = 'USERS'

--SELECT * FROM user_segments
--SELECT * FROM USER_TS_QUOTAS 