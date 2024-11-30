CREATE DATABASE EXPENSE_TRACKERS;
USE EXPENSE_TRACKERS ;

CREATE TABLE USERS(
    User_id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) ,
    Email VARCHAR(255) NOT NULL,
    Password_Hash VARCHAR(255) NOT NULL ,
    Profile_Picture VARCHAR(255) OPTIONAL
);

CREATE TABLE INCOME(
    Income_Id INT AUTO_INCREMENT PRIMARY KEY,
    User_Id    INT NOT NULL,
    Source_of_Income VARCHAR (255),
    frequency VARCHAR(255),
    Amount_Earned  INT NOT NULL,
    Income_Date  DATE NOT NULL,
    is_recurring BOOLEAN DEFAULT FALSE,
    FOREIGN KEY(User_Id) REFERENCES USERS(User_Id)
);

CREATE TABLE EXPENSES(
    Expense_Id INT PRIMARY KEY ,
    User_Id  INT NOT NULL,
    Category VARCHAR (50),
    Amount  INT NOT NULL,
    Expense_date DATE NOT NULL,
    Created_at DATETIME,
    Updated_at DATETIME,
    is_recurring BOOLEAN DEFAULT FALSE,
    FOREIGN KEY(User_Id) REFERENCES USERS(User_Id)
);

CREATE TABLE BUDGETS(
    Budget_id INT AUTO_INCREMENT PRIMARY KEY,
    User_Id INT NOT NULL,
    Category VARCHAR (50),
    Budget_limit INT NOT NULL,
    Created_at DATETIME,
    Updated_at DATETIME,
    FOREIGN KEY(User_Id) REFERENCES USERS(User_Id)
);

CREATE TABLE NOTIFICATION(
    Notification_id INT AUTO_INCREMENT PRIMARY KEY,
    User_Id INT NOT NULL,
    Type VARCHAR (50),
    Message TEXT,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    FOREIGN KEY(User_Id) REFERENCES USERS(User_Id)
);


CREATE TABLE REPORTS(
    Report_id INT PRIMARY KEY,
    User_Id INT,
    Report_type VARCHAR(255),
    Information INT NOT NULL,
    Generated_at TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
    FOREIGN KEY(User_ID) REFERENCES USERS(User_Id)
);

ALTER TABLE INCOME
ADD CONSTRAINT check_frequency CHECK (frequency IN ('Weekly' or 'Monthly'));

CREATE INDEX Expense_Date
ON EXPENSES (Expense_date);

CREATE INDEX Expense_category
ON EXPENSES(User_Id);

SHOW TABLES;

INSERT INTO USERS (User_Id,Name,Email,Password_Hash,Profile_Picture)
VALUES (001,'Emmanuel Magomu','ehmahmagomu7@gmail.com',24680,'emma'),
       (002,'Uwase Shantel','shantel@gmail.com','f00d','shantel.jpg'),
       (003,'Cathy Nasikye','cathy@gmail.com','c@thy','cathy.jpg');


