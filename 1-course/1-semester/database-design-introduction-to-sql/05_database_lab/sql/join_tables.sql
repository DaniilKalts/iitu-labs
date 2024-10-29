-- 1 Task
SELECT *
FROM Teachers;

-- 2 Task
SELECT lname
FROM Students;

-- 3 Task
SELECT lname
FROM teachers
WHERE fname = 'B';

-- 4 Task
SELECT fname, lname
FROM Students
UNION
SELECT fname, lname
FROM Teachers;

-- 5 Task
SELECT fname, lname FROM Students
EXCEPT
SELECT fname, lname FROM Teachers;

-- 6 Task
SELECT fname, lname
FROM Teachers
INTERSECT
SELECT fname, lname
FROM Students;

-- 7 Task
SELECT t.lname, d.name
FROM Teachers AS t
JOIN Departments AS d
ON t.dep_id = d.dep_id;

-- 8 Task
SELECT t.lname, d.name
FROM Teachers AS t
LEFT JOIN Departments AS d
ON t.dep_id = d.dep_id;

-- 9 Task
SELECT t.lname, d.name
FROM Teachers AS t
RIGHT JOIN Departments AS d
ON t.dep_id = d.dep_id;

-- 10 Task
SELECT t.lname, d.name
FROM Teachers AS t
FULL JOIN Departments AS d
ON t.dep_id = d.dep_id;
