-- SQL Basic Assignment: Online Bookstore

-- Database creation
CREATE DATABASE IF NOT EXISTS bookstore_db;
USE bookstore_db;

-- Table Creation
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    published_year INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Insert sample data into Authors table
INSERT INTO Authors (author_id, author_name, country) VALUES
(1, 'Kenji Takahashi', 'Japan'),
(2, 'Marcus Vance', 'USA'),
(3, 'Callum Gallagher', 'UK'),
(4, 'Rohan Deshmukh', 'India'),
(5, 'Mateo Silva', 'Brazil'),
(6, 'Elena Rostova', 'Germany');

-- Insert sample data into Books table
INSERT INTO Books (book_id, title, author_id, category, price, published_year) VALUES
(1, 'Steins-Gate', 1, 'Programming', 750.00, 2011),
(2, 'Sword Art Online', 1, 'Programming', 850.00, 2022),
(3, 'Serial Experiments Lain', 1, 'Programming', 650.00, 1998),
(4, 'Attack on Titan', 2, 'Action', 720.00, 2013),
(5, 'Jujutsu Kaisen', 2, 'Action', 580.00, 2021),
(6, 'Fullmetal Alchemist', 3, 'Fantasy', 520.00, 2003),
(7, 'Demon Slayer', 3, 'Fantasy', 480.00, 2019),
(8, 'Neon Genesis Evangelion', 4, 'Sci-Fi', 780.00, 1995),
(9, 'Cowboy Bebop', 4, 'Sci-Fi', 620.00, 1998),
(10, 'Spy x Family', 5, 'Comedy', 450.00, 2022);


-- Section 1: Basic Queries

-- Task 1: Display all books
SELECT * FROM Books;

-- Task 2: Display only the book title and price
SELECT title, price FROM Books;

-- Task 3: Display the book title as Book Name and price as Book Price using column aliases
SELECT title AS "Book Name", price AS "Book Price" 
FROM Books;

-- Task 4: Display all unique book categories
SELECT DISTINCT category FROM Books;


-- Section 2: Filtering Data

-- Task 5: Display books priced above 700
SELECT * FROM Books 
WHERE price > 700;

-- Task 6: Display books priced between 500 and 800
SELECT * FROM Books 
WHERE price BETWEEN 500 AND 800;

-- Task 7: Display books that belong to the Programming category
SELECT * FROM Books 
WHERE category = 'Programming';

-- Task 8: Display books whose titles start with the letter S
SELECT * FROM Books 
WHERE title LIKE 'S%';

-- Task 9: Display books published after 2020
SELECT * FROM Books 
WHERE published_year > 2020;


-- Section 3: Sorting and Limiting Results

-- Task 10: Display books sorted by price in descending order
SELECT * FROM Books 
ORDER BY price DESC;

-- Task 11: Display the top 3 most expensive books
SELECT * FROM Books 
ORDER BY price DESC 
LIMIT 3;


-- Section 4: Aggregate Functions

-- Task 12: Find total number of books, total price, average price, highest price, and lowest price
SELECT 
    COUNT(*) AS total_books,
    SUM(price) AS total_price,
    AVG(price) AS average_price,
    MAX(price) AS highest_price,
    MIN(price) AS lowest_price
FROM Books;


-- Section 5: GROUP BY and HAVING

-- Task 13: Display the average book price for each category
SELECT category, AVG(price) AS average_price
FROM Books
GROUP BY category;

-- Task 14: Display only those categories whose average book price is greater than 650
SELECT category, AVG(price) AS average_price
FROM Books
GROUP BY category
HAVING AVG(price) > 650;


-- Section 6: Joins

-- Task 15: Display each book along with its author's name using an INNER JOIN
SELECT Books.book_id, Books.title, Authors.author_name, Books.category, Books.price
FROM Books
INNER JOIN Authors ON Books.author_id = Authors.author_id;

-- Task 16: Display all authors along with the books they have written using a LEFT JOIN
SELECT Authors.author_id, Authors.author_name, Authors.country, Books.title, Books.price
FROM Authors
LEFT JOIN Books ON Authors.author_id = Books.author_id;

-- Task 17: Display all books along with their author details using a RIGHT JOIN
SELECT Books.book_id, Books.title, Books.category, Books.price, Authors.author_name, Authors.country
FROM Authors
RIGHT JOIN Books ON Authors.author_id = Books.author_id;


-- Section 7: Data Manipulation

-- Task 18: Insert a new book into the Books table
INSERT INTO Books (book_id, title, author_id, category, price, published_year)
VALUES (11, 'Solo Leveling', 2, 'Action', 680.00, 2023);

-- Task 19: Update the price of the book you inserted
UPDATE Books
SET price = 740.00
WHERE book_id = 11;

-- Task 20: Delete the book record that you inserted
DELETE FROM Books
WHERE book_id = 11;


-- Section 8: Creating Tables and Constraints

-- Task 21: Create a new table named Publishers with the required constraints
CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(50) NOT NULL,
    established_year INT NOT NULL
);

-- View table structure to verify columns and constraints
DESCRIBE Publishers;
