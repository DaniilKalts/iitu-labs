-- Delete from "student_assignment" for assignments linked to subject_id 2
DELETE FROM student_assignment
WHERE assignment_id IN (SELECT assignment_id FROM assignments WHERE subject_id = 2);

-- Delete from "schedule_assignment" for assignments linked to subject_id 2
DELETE FROM schedule_assignment
WHERE assignment_id IN (SELECT assignment_id FROM assignments WHERE subject_id = 2);

-- Delete from "assignments" where subject_id is 2
DELETE FROM assignments WHERE subject_id = 2;

-- Delete from "teacher_subject" where subject_id is 2
DELETE FROM teacher_subject WHERE subject_id = 2;

-- Delete from "program_subject" where subject_id is 2
DELETE FROM program_subject WHERE subject_id = 2;

-- Delete from "schedules" where subject_id is 2
DELETE FROM schedules WHERE subject_id = 2;

-- Delete from "subjects" where subject_id is 2
DELETE FROM subjects WHERE subject_id = 2;
