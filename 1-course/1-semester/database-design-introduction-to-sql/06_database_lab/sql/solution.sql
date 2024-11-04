-- 1. Use SELECT statement for any table with aliasing a result column.
SELECT s.first_name AS student_name
FROM student AS s;

-- 2. Use aliasing of tables in a SELECT statement with several tables (with join operation).
SELECT s.first_name, c.name
FROM student AS s
INNER JOIN student_club ON s.student_id = student_club.student_id
INNER JOIN clubs AS c ON student_club.club_id = c.club_id;

-- 3. Select data from any table and represent two different attributes in one column in the result table.
SELECT CONCAT(s.first_name, ' ', s.last_name) AS full_name
FROM students AS s;

-- 4. Write a SELECT query to get data from any table's attribute without duplicate values.
SELECT DISTINCT s.first_name
FROM students AS s;

-- 5. Select only null or not null values of any table's attribute.
SELECT s.first_name
FROM students AS s
WHERE s.first_name IS NULL;

SELECT s.first_name
FROM students AS s
WHERE s.first_name IS NOT NULL;

-- 6. Use SELECT statement to get rows from any table with filtering values in a column between two values (using the <, <=, > and >= operators).
SELECT s.first_name, s.date_of_birth
FROM student AS s
WHERE s.date_of_birth >= '2005-01-01' AND s.date_of_birth <= '2006-12-31';

-- 7. Use SELECT statement to get rows from any table with filtering values in a column between two values (using the BETWEEN operator).
SELECT s.first_name, s.date_of_birth
FROM student AS s
WHERE s.date_of_birth BETWEEN '2005-01-01' AND '2006-12-31';

-- 8. Use % with LIKE operator to find some values.
SELECT s.first_name
FROM student AS s
WHERE s.first_name LIKE 'D%';

-- 9. Use _ with LIKE operator to find some values.
SELECT s.first_name
FROM student AS s
WHERE s.first_name LIKE '_A%';

-- 10. Write a SELECT query with CAST or :: operators.
SELECT s.first_name,
    CONCAT(CAST(EXTRACT(YEAR FROM AGE(CURRENT_DATE, s.date_of_birth)) AS VARCHAR), ' years old') AS age1,
    CONCAT(EXTRACT(YEAR FROM AGE(CURRENT_DATE, s.date_of_birth)), '-years old') AS age2
FROM student AS s;
