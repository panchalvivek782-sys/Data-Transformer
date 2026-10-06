## DataTransformer

A minimalistic relational database schema built in SQL featuring core entities (**Customers**, **Orders**, and **Employees**). It includes sample data alongside a collection of query patterns demonstrating data transformation techniques like joins, subqueries, date/string manipulation, window functions, and conditional logic.

### Database Schema

*   **Customers**: Tracks profile data (`CustomerID`, names, email, and registration date).
*   **Orders**: Tracks transactional data (`OrderID`, total amounts, dates) and links to customers.
*   **Employees**: Tracks internal HR records (`EmployeeID`, department, hiring history, salary).

### SQL Scripts Overview

The code covers five main categories of SQL operations:

1.  **Table Relations**: Demonstrates `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and a simulated `FULL OUTER JOIN` via `UNION`.
2.  **Subqueries**: Filters records dynamically using aggregated subqueries (e.g., finding employees earning above the average salary).
3.  **Date Transformations**: Functions for parsing temporal metrics (`YEAR()`, `MONTH()`), computing age/intervals (`DATEDIFF()`), and styling layouts (`DATE_FORMAT()`).
4.  **String Cleanup**: Standardizes text formats via `CONCAT()`, `REPLACE()`, parsing casing (`UPPER()`, `LOWER()`), and whitespace management (`TRIM()`).
5.  **Analytics & Logic**: Implements analytical window functions (`SUM() OVER`, `RANK() OVER`) and evaluates conditional logic patterns using `CASE` expressions.

### Usage

Execute the entire script in any standard MySQL-compatible database system to instantly initialize the database, seed it with sample records, and observe the query results.
