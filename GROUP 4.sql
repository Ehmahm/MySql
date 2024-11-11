-- Active: 1730639930023@@127.0.0.1@3306
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

-- Assumptions 
-- A farmer can post up multiple products under the same Farmer_ID
-- A farmer can ask multiple questions can be answered by many experts
-- A farmer can attend many training sessions that are carried out by experts
-- Multiple farmers can contact multiple experts

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
        (12,  'Shane Munanura', '0789574742', 'Abangira josephine', 'Fungal diseases', '1', '34');



-- QUERY STATEMENTS
SELECT Farmer_ID
FROM Farmer;

SELECT Specialization
FROM Agricultural_experts

SELECT Product_ID, Product_Name,Price,Availability,Farmer_ID
FROM Product
WHERE Availability = 'unavailable';




