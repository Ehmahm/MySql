-- Active: 1730639930023@@127.0.0.1@3306
-- GROUP 4 
-- QUESTION 4

-- Group Members 
-- Precious Abangira B28326
-- Josephine Nakiwala B29182
-- Shane Munanura B28332-
-- Warudata Natukunda B27536
-- Angel Magoola B28735
-- Trevor Muhanguzi
-- Magomu Emmanuel
-- Sisulu Amanya B27500





CREATE DATABASE Ministy_Of_Agriculture;
    DEFAULT CHARACTER SET = 'utf8mb4';
    USE Ministy_Of_Agriculture;

CREATE TABLE Farmer (
    Farmer_ID INT, 
    First_Name VARCHAR(45),
    Last_Name VARCHAR(45),
    Contact  INT,
    Location VARCHAR(45),
    Speciality VARCHAR(30),
    PRIMARY KEY (Farmer_ID)
);
CREATE INDEX idx_Farmer_ID ON
Farmer(Farmer_ID);

CREATE TABLE Product (
    Product_ID INT,
    Product_Name VARCHAR(20),
    Product_category VARCHAR(30),
    Price INT,
    Availability VARCHAR(45),
    Farmer_ID INT,
    PRIMARY KEY (Product_ID),
    FOREIGN KEY (Farmer_ID) REFERENCES Farmer(Farmer_ID)
);

ALTER TABLE Product MODIFY Farmer_ID INT NOT NULL;
-- Since we assume a farmer can ask multiple questions

CREATE TABLE Agricultural_experts(
    Expert_ID INT,
    Expert_Name VARCHAR(30),
    Telephone_number INT,
    Email VARCHAR(30),
    Specialization VARCHAR(30),
    Farmer_ID INT,
    PRIMARY KEY (Expert_ID),
    Training_ID INT
);

ALTER TABLE Agricultural_experts MODIFY Farmer_ID INT NOT NULL;
CREATE INDEX idx_Expert_ID ON
Agricultural_experts(Expert_ID);

CREATE TABLE Training(
      Training_ID INT,
      Trainer_Name VARCHAR(45),
      Topic_Of_Discussion VARCHAR(45),
      Date DATE,
      Expert_ID INT,
      PRIMARY KEY (Training_ID),
      FOREIGN KEY (Expert_ID) REFERENCES Agricultural_experts(Expert_ID)
);


ALTER TABLE Training ADD COLUMN Farmer_ID INT;


ALTER TABLE Training MODIFY Expert_ID INT NOT NULL;
-- Since we  assume that experts carryout the training 

ALTER TABLE Training MODIFY Farmer_ID INT UNIQUE;
-- Since A farmer can attend many training sessions which means the farmer ID cannot be repeated per session

CREATE TABLE QUESTION(
    Question_ID INT,
    Question VARCHAR(45),
    Expert_questioned VARCHAR(30),
    Date_posted DATE,
    Expert_ID INT,
    Farmer_ID INT,
    PRIMARY KEY (Question_ID),
    FOREIGN KEY (Expert_ID) REFERENCES Agricultural_experts(Expert_ID),
    FOREIGN KEY (Farmer_ID) REFERENCES Farmer(Farmer_ID)
);
ALTER TABLE QUESTION MODIFY Question VARCHAR(100);
ALTER TABLE QUESTION MODIFY Farmer_ID INT NOT NULL;
ALTER TABLE QUESTION MODIFY Expert_ID INT NOT NULL;

-- for one to answer questions they must be an expert hence the expert ID column can not be empty  

-- Assumptions 
-- A farmer can post up multiple products under the same Farmer_ID
-- A farmer has access to posting multiple questions can be answered by many experts
-- A farmer can attend many training sessions that are carried out by experts
-- Multiple farmers can contact multiple experts

USE Ministy_Of_Agriculture;

ALTER TABLE Farmer
ADD COLUMN Speciality VARCHAR(45);


INSERT INTO Farmer (Farmer_ID, First_Name, Last_Name, Contact, Location,Speciality)
VALUES (1, 'Angel', 'Nakiwala', '0706174834', 'Ibanda', 'Dairy'),
       (2, 'Precious', 'Amanya','0789042365', 'Sironko','Crop farming');
       
INSERT INTO Product (Product_ID, Product_Name, Price, Availability, Farmer_ID)
VALUES  (15, 'Milk', '80000', 'Available', '1' ),
        (20, 'Maize', '70000', 'unavailable', '2');

DESCRIBE Product;

ALTER TABLE Agricultural_experts
ADD COLUMN Training_ID INT;

INSERT INTO  Agricultural_experts (Expert_ID, Expert_Name, Telephone_number, Email, Specialization, Farmer_ID, Training_ID)
VALUES  (05, 'Magomu Trevor', '0789747478', 'warudata@gmail.com', 'Footrot disease', '1', '46'),
        (12,  'Shane Munanura', '0789574742', 'Abangirajosephine@gmail.com', 'Fungal diseases', '1', '34');


INSERT INTO QUESTION  (Question_ID, Question, Expert_questioned,Date_posted,Expert_ID, Farmer_ID)
VALUES  (100, 'How do I immunise against footrot disease', 'Magomu Trevor', '2024-09-18','05', '2'),
        (78, 'Which insectides should I use for cassava', 'Shane Munanura', '2024-10-12', '12', '1');



-- QUERY STATEMENTS
-- incase a farmer sells an expired product and a buyer has a receipt with that farmers ID the farmer can be identified.

SELECT Farmer_ID, First_Name, Last_Name, Speciality
FROM Farmer
WHERE Farmer_ID = '2';
-- For an instance when a farmer is looking for an expert who specializes in something
SELECT Specialization
FROM Agricultural_experts

-- incase someone wants to check if a product is available
SELECT Product_ID, Product_Name,Price,Availability,Farmer_ID
FROM Product
WHERE Availability = 'Available';

-- Incase we want to check for certain speciality
SELECT Farmer_ID,First_Name, Location, Contact, Speciality
FROM Farmer
WHERE Speciality = 'Dairy';

-- checking for product prices in descending order
SELECT Product_ID,Product_Name,Price, Availability
FROM Product
WHERE Availability = 'unavailable'
ORDER BY Price ASC;
 
 -- Checking for a product  that starts with a certain letter
SELECT Product_Name
FROM Product 
WHERE Product_Name LIKE 'M%';

