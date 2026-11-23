# SQL Basic Assignment - Online Bookstore

## Assignment Overview
This repository contains the solution for the SQL Basic Assignment. The project simulates a database for an online bookstore to manage information about books, authors, and publishers. 

It covers fundamental SQL operations, including:
- Creating tables with constraints (Primary Key, Foreign Key, Unique, Not Null)
- Inserting and managing sample records
- Filtering and pattern matching (`WHERE`, `BETWEEN`, `LIKE`)
- Sorting and pagination (`ORDER BY`, `LIMIT`)
- Aggregations and grouping (`COUNT`, `SUM`, `AVG`, `MAX`, `MIN`, `GROUP BY`, `HAVING`)
- Table joins (`INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`)
- Data manipulation (`INSERT`, `UPDATE`, `DELETE`)

---

## Database Schema

The database consists of the following tables:

### 1. Authors
Stores information about authors.
- `author_id` (INT) - Primary Key
- `author_name` (VARCHAR(100)) - Name of the author (NOT NULL)
- `country` (VARCHAR(50)) - Country of the author

### 2. Books
Stores book details and links to the author.
- `book_id` (INT) - Primary Key
- `title` (VARCHAR(100)) - Title of the book (NOT NULL)
- `author_id` (INT) - Foreign Key referencing `Authors(author_id)`
- `category` (VARCHAR(50)) - Genre / category of the book
- `price` (DECIMAL(10,2)) - Price of the book
- `published_year` (INT) - Year of publication

### 3. Publishers (Created in Task 21)
Stores publisher details with constraints.
- `publisher_id` (INT) - Primary Key
- `publisher_name` (VARCHAR(100)) - NOT NULL, UNIQUE
- `country` (VARCHAR(50)) - NOT NULL
- `established_year` (INT) - NOT NULL

---

## Steps to Execute the SQL Script

You can run the script using either **MySQL Workbench** or the **MySQL Command Line**.

### Option 1: Using MySQL Workbench
1. Open MySQL Workbench and connect to your local MySQL server.
2. Go to **File** -> **Open SQL Script...** and select `assignment.sql`.
3. Click the **Execute** button (the yellow lightning bolt icon) to run the entire script.
4. Review the query results in the Output panel and Result Grids below.

### Option 2: Using Terminal / MySQL CLI
1. Open your terminal and navigate to the project directory:
   ```bash
   cd /path/to/SQL-Basic-Assignment
   ```
2. Log into MySQL:
   ```bash
   mysql -u root -p
   ```
3. Run the script file:
   ```sql
   source assignment.sql;
   ```
   Or execute directly from the terminal:
   ```bash
   mysql -u root -p < assignment.sql
   ```

---

## Files in Repository
- `assignment.sql` - Complete SQL script with table definitions, sample data, and all 21 tasks organized in order.
- `README.md` - Documentation of schema and execution steps.
