-- Adding rows to faculties
INSERT INTO faculties (name, description) VALUES
('Faculty of Computer Technologies and Cyber Security', 'Faculty focusing on computer technologies and cyber security'),
('Faculty of Business, Media, and Management', 'Faculty focusing on business, media, and management disciplines'),
('Faculty of Design and Arts', 'Faculty specializing in design and fine arts');

-- Adding rows to departments
INSERT INTO departments (faculty_id, name, description) VALUES
(1, 'Computer Science', 'Department of Computer Science'),
(1, 'Cyber Security', 'Department of Cyber Security'),
(2, 'Business Administration', 'Department of Business Administration');

-- Adding rows to programs
INSERT INTO programs (department_id, name, description) VALUES
(1, 'BSc in Computer Science', 'Bachelor of Science in Computer Science'),
(2, 'BSc in Cyber Security', 'Bachelor of Science in Cyber Security'),
(3, 'MBA in Business Administration', 'Master of Business Administration in Business Management');

-- Adding rows to subjects
INSERT INTO subjects (name, description, credits) VALUES
('Data Structures and Algorithms', 'Course on data structures and algorithms', 5),
('Network Security', 'Course on principles and practices of network security', 4),
('Business Ethics', 'Course on ethics in business management', 3);

-- Adding rows to program_subject
INSERT INTO program_subject (program_id, subject_id) VALUES
(1, 1),  -- Data Structures and Algorithms for Computer Science
(2, 2),  -- Network Security for Cyber Security
(3, 3);  -- Business Ethics for Business Administration

-- Adding rows to contact_info
INSERT INTO contact_info (email, phone_number, address) VALUES
('alice.cs@example.com', '+71234567890', '123 University St'),
('bob.cybersec@example.com', '+79876543210', '456 Security Blvd'),
('carol.business@example.com', '+79998887766', '789 Business Ave');

-- Adding rows to personal_info
INSERT INTO personal_info (first_name, last_name, patronymic, gender, birth_date, iin, education, contact_info_id) VALUES
('Alice', 'Smith', 'Alexandrovna', 'female', '2000-01-01', '123456789012', 'BSc in Computer Science', 1),
('Bob', 'Johnson', 'Ivanovich', 'male', '1999-05-15', '987654321098', 'BSc in Cyber Security', 2),
('Carol', 'Brown', 'Sergeyevna', 'female', '1998-07-20', '112233445566', 'MBA in Business Administration', 3);

-- Adding rows to rector
INSERT INTO rector (personal_info_id) VALUES
(1), (2), (3);

-- Adding rows to deans
INSERT INTO deans (faculty_id, personal_info_id) VALUES
(1, 1), (2, 2), (3, 3);

-- Adding rows to groups
INSERT INTO groups (name) VALUES
('CS-2024'), ('CYBER-2024'), ('BUSINESS-2024');

-- Adding rows to students
INSERT INTO students (group_id, personal_info_id) VALUES
(1, 1),  -- Alice in CS-2024
(2, 2),  -- Bob in CYBER-2024
(3, 3);  -- Carol in BUSINESS-2024

-- Adding rows to group_heads
INSERT INTO group_heads (group_id, head_student_id) VALUES
(1, 1), (2, 2), (3, 3);

-- Adding rows to clubs
INSERT INTO clubs (name, description) VALUES
('Robotics Club', 'Club for robotics enthusiasts'),
('Cybersecurity Club', 'Club focused on cybersecurity challenges'),
('Business Strategy Club', 'Club for students interested in business strategy and management');

-- Adding rows to student_club
INSERT INTO student_club (student_id, club_id) VALUES
(1, 1), (2, 2), (3, 3);

-- Adding rows to teachers
INSERT INTO teachers (personal_info_id) VALUES
(1), (2), (3);

-- Adding rows to teacher_subject
INSERT INTO teacher_subject (teacher_id, subject_id) VALUES
(1, 1), (2, 2), (3, 3);

-- Adding rows to buildings
INSERT INTO buildings (name, description, address, floor_count) VALUES
('Main Building', 'Administrative and lecture rooms', '123 Main St', 5),
('Cybersecurity Building', 'Building for cybersecurity programs', '456 Cybersecurity Blvd', 4),
('Business Building', 'Building for business and management courses', '789 Business Ave', 3);

-- Adding rows to classrooms
INSERT INTO classrooms (building_id, name, description, floor_number, capacity) VALUES
(1, 'Room 101', 'Lecture hall for Computer Science', 1, 30),
(2, 'Room 202', 'Cybersecurity lab', 2, 25),
(3, 'Room 303', 'Business management seminar room', 3, 20);

-- Adding rows to assignments
INSERT INTO assignments (subject_id, name, description, deadline) VALUES
(1, 'Data Structures Homework', 'Assignment on linked lists and trees', '2024-10-15'),
(2, 'Network Security Lab', 'Complete the network penetration test', '2024-10-20'),
(3, 'Business Ethics Essay', 'Write an essay on ethical leadership', '2024-10-25');

-- Adding rows to schedules
INSERT INTO schedules (group_id, subject_id, teacher_id, classroom_id, weekday, start_time, end_time) VALUES
(1, 1, 1, 1, 'monday', '09:00', '10:30'),
(2, 2, 2, 2, 'wednesday', '11:00', '12:30'),
(3, 3, 3, 3, 'friday', '14:00', '15:30');

-- Adding rows to schedule_assignment
INSERT INTO schedule_assignment (schedule_id, assignment_id) VALUES
(1, 1), (2, 2), (3, 3);

-- Adding rows to student_assignment
INSERT INTO student_assignment (student_id, assignment_id) VALUES
(1, 1), (2, 2), (3, 3);
