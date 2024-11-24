-- 1. Show last names of all students whose major is “CSSE”.
SELECT s.lname
FROM Students s
JOIN Groups g
ON s.group_id = g.group_id
JOIN Majors m
ON g.major_id = m.major_id
WHERE m.name = 'CSSE';

-- Using subquery:

SELECT s.name
FROM Students s
WHERE s.group_id IN (
  SELECT g.group_id
  FROM Groups g
  WHERE g.major_id IN (
    SELECT m.major_id
    FROM Majors
    WHERE m.name = 'CSSE'
  )
);

-- 2. Show the identifiers of all students whose "final" grade is greater than the
-- average "final" grade of all students.
SELECT s.stud_id
FROM Students s
JOIN Progress p
ON s.stud_id = p.stud_id
WHERE p.final > (
  SELECT AVG(p1.final)
  FROM Progress p1
);

-- Actually we don't need information about students, so we could rewrite this:

SELECT p.stud_id
FROM Progress p
WHERE p.final > (
  SELECT AVG(p1.final)
  FROM Progress p1
);

-- 3. Show last names of all the teachers who work in departments CSSE&T and IS.
SELECT t.lname
FROM Teachers t
JOIN Departments d
ON t.dep_id = d.dep_id
WHERE d.name IN ('CSSE&T', 'IS');

-- Using subquery:

SELECT t.lname
FROM Teachers t
WHERE t.dep_id IN (
  SELECT d.dep_id
  FROM Departments d
  WHERE d.name IN ('CSSE&T', 'IS')
);

-- 4. If at least one student has an "exam" grade below 50%, show a list of the last
-- names of all university students with their "exam" grades (i.e. all students with
-- any grades).
SELECT s.lname, p.exam
FROM Students s
JOIN Progress p
ON s.stud_id = p.stud_id
WHERE EXISTS (
  SELECT 1
  FROM Progress p1
  WHERE p1.exam < 50
);

-- 5. Write a query with ANY keyword and a subquery. Explain the query result.
SELECT g.group_id, g.name
FROM Groups g
WHERE g.group_id = ANY (
  SELECT s.group_id
  FROM Students s
  JOIN Progress p
  ON s.stud_id = p.stud_id
  WHERE p.final > (
    SELECT AVG(p1.final)
    FROM Progress p1
  )
);

-- 6. Write a query with ALL keyword and a subquery. Explain the query result.
SELECT t.teach_id, t.lname
FROM Teachers t
WHERE t.dep_id = ALL (
  SELECT d.dep_id
  FROM Departments d
);

-- 7. Write a query with a subquery in FROM clause. Explain the query result.
SELECT stud_id, fname
FROM (
  SELECT *
  FROM Students s
  WHERE LENGTH(s.fname) >= 8
) AS long_names;

-- 8. Write a query with a subquery in INSERT statement. Explain the query result.
INSERT INTO Students VALUES (25, 'Person', 'Person', '1970-01-01', 1234567813, 'mail@iitu.edu.kz', (
  SELECT g.group_id
  FROM Groups g
  WHERE g.name = 'SE-2023-B'
));

-- 9. Write a query with a subquery in DELETE statement. Explain the query result.
DELETE FROM Students
WHERE fname IN (
  SELECT s.fname
  FROM Students s
  WHERE LENGTH(s.fname) <= 5
);

-- 10. Write a query with a subquery in UPDATE statement. Explain the query result
UPDATE Progress
SET exam = 100
WHERE exam < (
  SELECT AVG(p.exam)
  FROM Progress p
);
