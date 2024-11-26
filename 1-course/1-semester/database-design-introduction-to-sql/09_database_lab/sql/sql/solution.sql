-- 1. Choose any query from the LW9 (implemented before with subquery) and remake
-- them using CTE.
WITH CTE AS (
    SELECT *
    FROM Teachers t
    WHERE t.dep_id IN (
        SELECT d.dep_id
        FROM Departments d
        WHERE d.name IN ('CSSE&T', 'IS')
    )
)
SELECT t.lname
FROM CTE;

-- 2. Choose any other query from the LW9 (implemented before with subquery) and
-- also remake them using CTE.
WITH AVG_final AS (
    SELECT AVG(final) AS avg_final
    FROM Progress
),
CTE AS (
    SELECT s.stud_id
    FROM Students s
    JOIN Progress p ON s.stud_id = p.stud_id
    WHERE p.final > (SELECT avg_final FROM AVG_final)
)
SELECT s.stud_id
FROM CTE;

-- 3. The Teachers table contains some columns with private information. 
-- Create a view Teacher_info to hide them and to show only first, last names and id.
CREATE VIEW Teacher_info AS
SELECT fname, lname, teach_id
FROM Teachers;

-- 4. Show all rows from the view Teacher_info with SELECT statement.
SELECT *
FROM Teacher_info;

-- 5. Add a new row into the Teachers table.
INSERT INTO Teachers (teach_id, lname, fname, phone, email, dep_id, position)
VALUES (
    5,
    'Smirnov',
    'Maxim',
    77007475131,
    'smirnovmaxim@gmail.com',
    2,
    'Lecturer'
);

-- 6. Check with SELECT if the Teacher_info view contains this new information or not.
SELECT *
FROM Teacher_info
WHERE teach_id = 5;

-- 7. Change the structure of the Teacher_info view to include another column from the Teachers table.
CREATE OR REPLACE VIEW Teacher_info AS
SELECT fname, lname, teach_id
FROM Teachers;

-- 8. Show with SELECT a result of the renewed view Teacher_info.
SELECT *
FROM Teacher_info;

-- 9. Create a new view with joining of two or more tables, an aggregation function, or a subquery.
CREATE VIEW Students_Info AS
SELECT
    s.fname,
    s.lname,
    s.bdate,
    s.pnum,
    s.email,
    s.group_id,
    g.group_name,
    p.rk1,
    p.rk2,
    p.rk_avg,
    p.exam,
    p.final
FROM Students s
JOIN Groups g ON s.group_id = g.group_id
JOIN Progress p ON s.stud_id = p.stud_id;

-- 10. Show with SELECT a result of the view from the #9.
SELECT *
FROM Students_Info;
