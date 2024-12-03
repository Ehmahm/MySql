CREATE DATABASE KIBINGE_FARMERS_DB ;
USE DATABASE KIBINGE_FARMERS_DB;

CREATE TABLE Farmer(
    Farmer_ID INT PRIMARY KEY,
    Name VARCHAR (100),
    Address VARCHAR (100) ,
    Contact_Number VARCHAR (12)
    );

CREATE TABLE Crop(
    Crop_ID INT PRIMARY KEY,
    Crop_Name VARCHAR (20),
    Type   VARCHAR (20),
    Season VARCHAR (10)
);

CREATE TABLE Farmer_Crop(
    Famer_Crop_ID INT PRIMARY KEY,
    Farmer_ID  INT,
    Crop_ID  INT,
    Area_Cultivated BOOLEAN,
    Yield BOOLEAN,
    FOREIGN KEY (Crop_ID) REFERENCES Crop(Crop_ID)
);

CREATE TABLE Market(
    Market_ID INT PRIMARY KEY ,
    Market_Name VARCHAR (100),
    Location VARCHAR (100)  
    );

CREATE TABLE Sales_Transaction(
    Transaction_ID INT PRIMARY KEY,
    Farmer_Crop_ID INT,
    Market_ID INT,
    DATE Date,
    Quantity_Sold BOOLEAN,
    Price_per_Unit BOOLEAN,
    Total_Amount BOOLEAN,
    FOREIGN KEY(Famer_Crop_ID) REFERENCES Farmer_Crop(Famer_Crop_ID)
);

INSERT INTO Farmer(Farmer_ID,Name,Address,Contact_Number)
VALUES (1,'John Kyambadde','Kibinge Village','+256700111111'),
       (2,'Sarah Nambi','Kiwangala Town','+256700222222'),
       (3,'Paul Okello','Lwengo District','+256700333333');

INSERT INTO Crop(Crop_ID,Crop_Name,Type,Season)
VALUES (101,'Coffee','Cash Crop','Rainy'),
       (102,'Maize','Food Crop','Dry'),
       (103,'Beans','Food Crop','Rainy');

INSERT INTO Market(Market_ID,Market_Name,Location)
VALUES (201,'Kibinge Market','Kibinge'),
       (201,'Masaka Central Market','Masaka'),
       (203,'Lwengo Farmers Market','Lwengo');

INSERT INTO Farmer_Crop(Famer_Crop_ID,Farmer_ID,Crop_ID,Area_Cultivated,Yield)
VALUES (1,1,101,5,1000),
       (2,1,102,3.5,700),
       (3,3,103,2,400) ;

INSERT INTO Sales_Transaction(Transaction_ID,Famer_Crop_ID,Market_ID,DATE,Quantity_Sold,Price_per_Unit,Total_Amount)
VALUES (301,1,201,'2024-01-15',500,3,1500),
       (302,2,202,'2024-02-10',300,2.5,750),
       (303,1,203,'2024-03-05',150,4,600);  
    


CREATE VIEW view2b AS 
FROM Crop
WHERE = 'Food Crop';


CREATE VIEW view2c AS



CREATE VIEW view2d
 ASSELECT f.Farmer_name, f.Address, c.Crop_name
FROM Farmers f
JOIN crops c ON f.Farmer_id = c.Farmer_id;


ALTER TABLE Farmer
ADD COLUMN Email VARCHAR (30)  ;

ALTER TABLE Farmer
CHANGE COLUMN Farmer_ID Farmer_Identification INT;

ALTER TABLE Crop
MODIFY COLUMN Season VARCHAR(20);


CREATE TABLE Taxes(
    Tax_ID INT PRIMARY KEY,
    Tax_Type VARCHAR (100),
    Payment_method VARCHAR (100),
    Frequency INT
);

INSERT INTO Taxes(Tax_ID,Tax_Type,Payment_method,Frequency)
VALUES (401,'Value Added Tax','Bank','Monthly'),
       (402,'Pay As You Earn','Mobile Money','Yearly'),
       (403,'Cash Crop tax','Bank','Weekly');








