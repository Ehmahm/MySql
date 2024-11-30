CREATE DATABASE movielibrary;

USE movielibrary;

CREATE TABLE MovieGenres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);
CREATE TABLE ProductionCountries (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL
);
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT,
    genre_id INT,
    country_id INT,
    FOREIGN KEY (genre_id) REFERENCES MovieGenres(genre_id),
    FOREIGN KEY (country_id) REFERENCES ProductionCountries(country_id)
);
-- Create tables for customer data
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);
CREATE TABLE Subscriptions (
    subscription_id INT PRIMARY KEY,
    customer_id INT,
    subscription_type VARCHAR(50) NOT NULL,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE PaymentMethods (
    payment_method_id INT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    payment_method_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (payment_method_id) REFERENCES PaymentMethods(payment_method_id)
);
-- Enforce constraints
ALTER TABLE Movies
ADD CONSTRAINT chk_release_year CHECK (release_year > 1800);

ALTER TABLE Payments
ADD CONSTRAINT chk_amount CHECK (amount > 0);
-- Insert sample data
INSERT INTO MovieGenres (genre_id, genre_name) VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Drama');
INSERT INTO ProductionCountries (country_id, country_name) VALUES
(1, 'USA'),
(2, 'UK'),
(3, 'France');

INSERT INTO Movies (movie_id, title, release_year, genre_id, country_id) VALUES
(1, 'Action Movie', 2020, 1, 1),
(2, 'Comedy Movie', 2019, 2, 2),
(3, 'Drama Movie', 2021, 3, 3);

INSERT INTO Customers (customer_id, first_name, last_name, email) VALUES
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com'),
(3, 'Emily', 'Jones', 'emily.jones@example.com');

INSERT INTO Subscriptions (subscription_id, customer_id, subscription_type, start_date, end_date) VALUES
(1, 1, 'Monthly', '2024-01-01', '2024-01-31'),
(2, 2, 'Annual', '2024-01-01', '2024-12-31'),
(3, 3, 'Monthly', '2024-02-01', '2024-02-28');

INSERT INTO PaymentMethods (payment_method

show TABLES;
