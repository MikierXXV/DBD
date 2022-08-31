-- Ex1: 
CREATE TABLE airport (

IATA CHAR(3) PRIMARY KEY,

city VARCHAR2(25) NOT NULL,

country VARCHAR2(20) NOT NULL,

region VARCHAR2(14) NOT NULL constraint A1  CHECK (region IN ('north america',

'south america', 'caribbean', 'west europe', 'east europe',

'africa', 'middle east', 'central asia', 'southeast asia',

'north asia', 'east asia', 'south asia', 'oceania'))

);

 

CREATE TABLE expenses (

IATA1 CHAR(3)REFERENCES airport, --departure airport

IATA2 CHAR(3)REFERENCES airport, --destination airport

fuel NUMBER(8,2) NOT NULL  constraint E3 check (fuel > 0),

taxes NUMBER(10,2) NOT NULL constraint E4 check (taxes > 0),

PRIMARY KEY (IATA1, IATA2),

constraint E2 check (fuel > taxes)

);

 

CREATE TABLE ticket (

IATA1 CHAR(3)REFERENCES airport, --departure airport

IATA2 CHAR(3)REFERENCES airport, --destination airport

passenger CHAR(10),

price NUMBER(9,2) constraint  T1 check (price < 0),

discount INTEGER constraint T2 check (discount > 0),

PRIMARY KEY (IATA1, IATA2, passenger),

constraint T3 check (price - discount > 0),

constraint T4 check (IATA1 = IATA2),

foreign key (IATA1, IATA2) references expenses

);





-- Ex 2:
CREATE TABLE airport (

IATA CHAR(3) PRIMARY KEY,

city VARCHAR2(25) NOT NULL,

country VARCHAR2(20) NOT NULL,

region VARCHAR2(14) NOT NULL constraint A1  CHECK (region IN ('north america',

'south america', 'caribbean', 'west europe', 'east europe',

'africa', 'middle east', 'central asia', 'southeast asia',

'north asia', 'east asia', 'south asia', 'oceania'))

);

 

CREATE TABLE expenses (

IATA1 CHAR(3)REFERENCES airport, --departure airport

IATA2 CHAR(3)REFERENCES airport, --destination airport

fuel NUMBER(8,2) NOT NULL  constraint E3 check (fuel > 0),

taxes NUMBER(10,2) NOT NULL constraint E4 check (taxes > 0),

PRIMARY KEY (IATA1, IATA2),

constraint E2 check (fuel > taxes)

);

 

CREATE TABLE ticket (

IATA1 CHAR(3)REFERENCES airport, --departure airport

IATA2 CHAR(3)REFERENCES airport, --destination airport

passenger CHAR(10),

price NUMBER(9,2) constraint  T1 check (price < 0),

discount INTEGER constraint T2 check (discount > 0),

PRIMARY KEY (IATA1, IATA2, passenger),

constraint T3 check (price - discount > 0),

foreign key (IATA1, IATA2) references expenses

);


-- Ex 3:
-- Si te vivencia