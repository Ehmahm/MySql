
CREATE DATABASE Uganda;
USE Uganda;

CREATE TABLE DISTRICT(
    DistrictCode VARCHAR (10) NOT NULL,
    Name VARCHAR (15) NOT NULL UNIQUE,
    Region VARCHAR (15) NOT NULL,
    PRIMARY KEY (DistrictCode)
);


CREATE TABLE CITIZEN (
    NIN BIGINT,
    Fname VARCHAR (3) NOT NULL,
    Lname VARCHAR (10) NOT NULL,
    Gender VARCHAR (10) NOT NULL,
    DistrictCode VARCHAR (10) NOT NULL,
    PRIMARY KEY (NIN) ,
    FOREIGN KEY (DistrictCode) REFERENCES DISTRICT (DistrictCode)
);


ALTER TABLE CITIZEN
ADD CONSTRAINT check_gender CHECK (gender IN ('Male' or 'Female'));

ALTER TABLE CITIZEN
MODIFY COLUMN NIN CHECK  (LENGTH (NIN) >=11 );

ALTER TABLE CITIZEN
MODIFY COLUMN Fname VARCHAR(15);

ALTER TABLE DISTRICT
ADD COLUMN population INT;

ALTER TABLE CITIZEN 
MODIFY COLUMN NIN BIGINT;


INSERT INTO CITIZEN (NIN,Fname,Lname,Gender,DistrictCode)
VALUES (236520561914,'Emmanuel','Magomu','Male',04),
       (237259382612,'Charles','Edekei','Male',68),
       (238654320696,'Angel','Magola','Male',14);
        


INSERT INTO DISTRICT (DistrictCode,Name,Region,population)
VALUES (04,'Mbale','Eastern',100000),
       (68,'Gulu','Northern',50000),
       (14,'Mbarara','Western',75000);

CREATE VIEW view1 AS
SELECT COUNT(*) AS Total_Districts
FROM DISTRICT;      

CREATE VIEW view2 AS
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name
FROM CITIZEN;

CREATE VIEW view3 AS
SELECT * 
FROM CITIZEN
WHERE DistrictCode IN (
  SELECT DistrictCode FROM DISTRICT WHERE Region = 'Northern'
);

CREATE VIEW view4 AS
SELECT DistrictCode,Name, Region
FROM DISTRICT
WHERE Name LIKE 'A%';

CREATE VIEW view5 AS
SELECT SUM(population) AS Total_Population
FROM DISTRICT;

CREATE VIEW view6 AS
SELECT Name, population
FROM DISTRICT
ORDER BY population DESC
LIMIT 1;