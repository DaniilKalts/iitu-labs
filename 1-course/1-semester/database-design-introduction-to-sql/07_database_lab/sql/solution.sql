-- 1. Write a query with count() aggregation function. Explain the query result.
SELECT 
  (SELECT COUNT(stud_id) FROM Students) AS students_count,
  (SELECT COUNT(teach_id) FROM Teachers) AS teachers_count;

-- 2. Write a query with max(), min(), avg() or sum() aggregation function. Explain
-- the query result.
WITH CTE_1 AS (
  SELECT
    g.group_id,
    g.group_name,
    (
      SELECT COUNT(*)
      FROM Students AS s
      WHERE s.group_id = g.group_id
    ) AS group_size
  FROM Groups AS g
),
CTE_2 AS (
  SELECT
    MIN(CTE_1.group_size) AS min_group_size,
    MAX(CTE_1.group_size) AS max_group_size,
    AVG(CTE_1.group_size) AS avg_group_size,
    SUM(CTE_1.group_size) AS total_students
  FROM CTE_1
)

SELECT
  CTE_1.group_name,
  CTE_1.group_size,
  CTE_2.min_group_size,
  CTE_2.max_group_size,
  CTE_2.avg_group_size,
  CTE_2.total_students,
  (ROUND((CTE_1.group_size / CTE_2.total_students) * 100, 2) || '%') AS group_percentage
FROM CTE_1, CTE_2;

-- 3. Add to the previous query (from #1 or #2) GROUP BY condition. Explain the
-- query result.
WITH Total_Students AS (
  SELECT 
    COUNT(*) AS total_students
  FROM Students
),
CTE_1 AS (
  SELECT
    g.group_id,
    g.group_name,
    g.major_id,
    COUNT(s.stud_id) AS group_size
  FROM Groups g
  LEFT JOIN Students s 
    ON s.group_id = g.group_id
  GROUP BY 
    g.group_id, g.group_name, g.major_id
)

SELECT 
  d.dep_name,
  MIN(CTE_1.group_size) AS min_group_size,
  MAX(CTE_1.group_size) AS max_group_size,
  AVG(CTE_1.group_size) AS avg_group_size,
  SUM(CTE_1.group_size) AS department_size,
  (ROUND((SUM(CTE_1.group_size) / (
    SELECT total_students
    FROM Total_Students
  )) * 100, 2) || '%') AS group_percentage
FROM CTE_1
JOIN Majors m 
  ON CTE_1.major_id = m.major_id
JOIN Departments d 
  ON m.dep_id = d.dep_id
GROUP BY 
  d.dep_name;

-- 4. Add to the previous query from #3 a condition with HAVING. Explain the query
-- result.
WITH CTE_1 AS (
  SELECT
    g.group_id,
    g.group_name,
    g.major_id,
    (
      SELECT COUNT(*)
      FROM Students AS s
      WHERE s.group_id = g.group_id
    ) AS students_count
  FROM Groups AS g
)

SELECT 
  d.dep_name,
  MIN(CTE_1.students_count) AS min_students_count,
  MAX(CTE_1.students_count) AS max_students_count,
  AVG(CTE_1.students_count) AS avg_students_count,
  SUM(CTE_1.students_count) AS total_students_count
FROM CTE_1
JOIN Majors AS m ON CTE_1.major_id = m.major_id
JOIN Departments AS d ON m.dep_id = d.dep_id
GROUP BY d.dep_name
HAVING AVG(CTE_1.students_count) <= 8;

-- 5. Add to the previous query from #4 ORDER BY condition. Explain the query
-- result.
WITH CTE_1 AS (
  SELECT
    g.group_id,
    g.group_name,
    g.major_id,
    (
      SELECT COUNT(*)
      FROM Students AS s
      WHERE s.group_id = g.group_id
    ) AS students_count
  FROM Groups AS g
)

SELECT 
  d.dep_name,
  MIN(CTE_1.students_count) AS min_students_count,
  MAX(CTE_1.students_count) AS max_students_count,
  AVG(CTE_1.students_count) AS avg_students_count,
  SUM(CTE_1.students_count) AS total_students_count
FROM CTE_1
JOIN Majors AS m ON CTE_1.major_id = m.major_id
JOIN Departments AS d ON m.dep_id = d.dep_id
GROUP BY d.dep_name
HAVING AVG(CTE_1.students_count) <= 8
ORDER BY avg_students_count;

-- 6. Show the Schedule in the following way: Group name, Subject name, Room,
-- Time, Day of week, Type of class, Teacher lname.
SELECT
  g.group_name AS "Group Name",
  s.subj_name AS "Subject Name",
  sch.room AS "Room",
  sch.sch_time AS "Time",
  sch.day_of_week AS "Day of Week",
  c.class_type AS "Type of Class",
  t.lname AS "Teacher Last Name"
FROM Schedule sch
JOIN Classes c 
  ON c.class_id = sch.class_id
JOIN Teachers t 
  ON t.teach_id = sch.teach_id
JOIN Ed_process e 
  ON e.proc_id = sch.proc_id
JOIN Subjects s 
  ON s.subj_id = e.subj_id
JOIN Groups g 
  ON g.group_id = e.group_id;

-- 7. In this task before the SELECT statement add a few rows with different values
-- in the Progress and Ed_process tables. Show the Progress table in the
-- following way: Student fname and lname in one column with "Full name" title,
-- Subject name, RK1, RK2, RK average, Exam, Final.
SELECT
  (stud.fname || ' ' || stud.lname) AS "Full name",
  subj.subj_name,
  prog.rk1,
  prog.rk2,
  prog.rk_avg,
  prog.exam,
  prog.final
FROM Progress prog
JOIN Students stud 
  ON stud.stud_id = prog.stud_id
JOIN Ed_process ed_proc 
  ON ed_proc.proc_id = prog.proc_id
JOIN Subjects subj 
  ON subj.subj_id = ed_proc.subj_id;

-- 8. Edit the previous query to get only students with good (but not excellent) final
-- grades (in other words, from 75 to 90). Final column contains grades in 100%
-- scoring system.
SELECT
  (stud.fname || ' ' || stud.lname) AS "Full name",
  subj.subj_name,
  prog.rk1,
  prog.rk2,
  prog.rk_avg,
  prog.exam,
  prog.final
FROM Progress prog
JOIN Students stud 
  ON stud.stud_id = prog.stud_id
JOIN Ed_process ed_proc 
  ON ed_proc.proc_id = prog.proc_id
JOIN Subjects subj 
  ON subj.subj_id = ed_proc.subj_id
WHERE prog.final BETWEEN 75 AND 90;

-- 9. Show the following information with the Ed_process table: Group name,
-- Subject name, average value of final (for every subject for every group).
SELECT
  g.group_name,
  s.subj_name,
  AVG(p.final) AS "average_final"
FROM Ed_process ed_proc
JOIN Groups g 
  ON g.group_id = ed_proc.group_id
JOIN Subjects s 
  ON s.subj_id = ed_proc.subj_id
JOIN Progress p 
  ON p.proc_id = ed_proc.proc_id
GROUP BY 
  g.group_name, 
  s.subj_name;

-- 10. Show the following information with the Students and Progress tables: Student
-- fname and lname in one column with "Full name" title, average value of final for
-- all subjects for every student (like gpa). Show only students with average final
-- grade more or equal 90. Sort students alphabetically.
SELECT
  (s.fname || ' ' || s.lname) AS "Full name",
  AVG(p.final) AS "gpa"
FROM Progress p
JOIN Students s 
  ON s.stud_id = p.stud_id
GROUP BY 
  s.fname, s.lname
HAVING 
  AVG(p.final) >= 90
ORDER BY 
  "Full name";
