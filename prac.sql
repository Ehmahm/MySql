CREATE DATABASE Ugandas;
USE  Ugandas;

CREATE TABLE CITIZEN(
    NIN INT PRIMARY KEY,
    AGE INT,
    TEMPERATURE BOOLEAN,
    FNAME VARCHAR(25),
    LNAME VARCHAR(25),
    GENDER VARCHAR (10),
    DISTRICTCODE VARCHAR (10)
);

CREATE TABLE DISTRICT(
    DistrictCode VARCHAR(10)  PRIMARY KEY,
    Name VARCHAR(15),
    Region VARCHAR(15)
)