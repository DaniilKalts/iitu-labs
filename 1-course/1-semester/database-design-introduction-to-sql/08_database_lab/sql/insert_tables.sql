INSERT INTO Credits VALUES 
    (1, 10, 5, 2, 3, 20),
    (2, 15, 10, 5, 5, 35),
    (3, 20, 15, 10, 5, 50),
    (4, 25, 20, 15, 10, 70);

INSERT INTO Subjects VALUES 
    (1, 'Database Systems', 1),
    (2, 'Operating Systems', 2),
    (3, 'Algorithms', 3),
    (4, 'Data Structures', 4),
    (5, 'Mathematics', 2);

INSERT INTO Departments VALUES 
    (1, 'Computer Science', 101, 1234567, 'cs@university.edu', NULL),
    (2, 'Information Systems', 102, 1234568, 'is@university.edu', NULL);

INSERT INTO Majors VALUES 
    (1, 'Software Engineering', 1),
    (2, 'Data Science', 1),
    (3, 'Information Technology', 2);

INSERT INTO Groups VALUES 
    (1, 'SE-2023-A', NULL, 1),
    (2, 'SE-2023-B', NULL, 1),
    (3, 'DS-2023', NULL, 2),
    (4, 'IT-2023', NULL, 3);

-- Group 1: SE-2023-A (7 students)
INSERT INTO Students VALUES 
    (1, 'Alice', 'Brown', '2000-05-20', 1234567890, 'alice.brown@university.edu', 1),
    (2, 'Bob', 'Smith', '2000-07-15', 1234567891, 'bob.smith@university.edu', 1),
    (3, 'Carla', 'Johnson', '1999-03-17', 1234567892, 'carla.johnson@university.edu', 1),
    (4, 'Daniel', 'White', '2000-12-05', 1234567893, 'daniel.white@university.edu', 1),
    (5, 'Eva', 'Black', '2000-09-10', 1234567894, 'eva.black@university.edu', 1),
    (6, 'Frank', 'Gray', '1999-07-11', 1234567895, 'frank.gray@university.edu', 1),
    (7, 'Grace', 'Green', '1999-04-20', 1234567896, 'grace.green@university.edu', 1);

-- Group 2: SE-2023-B (3 students)
INSERT INTO Students VALUES 
    (8, 'Helen', 'Parker', '2001-02-25', 1234567897, 'helen.parker@university.edu', 2),
    (9, 'Ian', 'Collins', '2000-05-30', 1234567898, 'ian.collins@university.edu', 2),
    (10, 'Jane', 'Morris', '2001-11-10', 1234567899, 'jane.morris@university.edu', 2);

-- Group 3: DS-2023 (5 students)
INSERT INTO Students VALUES 
    (11, 'Karl', 'Lewis', '1999-08-22', 1234567800, 'karl.lewis@university.edu', 3),
    (12, 'Linda', 'Young', '2000-10-11', 1234567801, 'linda.young@university.edu', 3),
    (13, 'Mark', 'Bennett', '2001-09-21', 1234567802, 'mark.bennett@university.edu', 3),
    (14, 'Nina', 'King', '1999-03-15', 1234567803, 'nina.king@university.edu', 3),
    (15, 'Oliver', 'Scott', '2000-12-28', 1234567804, 'oliver.scott@university.edu', 3);

-- Group 4: IT-2023 (9 students)
INSERT INTO Students VALUES 
    (16, 'Paul', 'Adams', '2001-04-13', 1234567805, 'paul.adams@university.edu', 4),
    (17, 'Quinn', 'Baker', '2000-06-19', 1234567806, 'quinn.baker@university.edu', 4),
    (18, 'Rachel', 'Carter', '1999-07-07', 1234567807, 'rachel.carter@university.edu', 4),
    (19, 'Sam', 'Evans', '2000-01-14', 1234567808, 'sam.evans@university.edu', 4),
    (20, 'Tina', 'Foster', '2000-11-02', 1234567809, 'tina.foster@university.edu', 4),
    (21, 'Uma', 'Harris', '2001-05-23', 1234567810, 'uma.harris@university.edu', 4),
    (22, 'Victor', 'Irvine', '2000-03-09', 1234567811, 'victor.irvine@university.edu', 4),
    (23, 'Wendy', 'James', '1999-08-03', 1234567812, 'wendy.james@university.edu', 4),
    (24, 'Xander', 'Kemp', '2001-09-18', 1234567813, 'xander.kemp@university.edu', 4);

INSERT INTO Teachers VALUES 
    (1, 'John', 'Doe', 1234567898, 'john.doe@university.edu', 'Professor', 1),
    (2, 'Sarah', 'Adams', 1234567899, 'sarah.adams@university.edu', 'Associate Professor', 1),
    (3, 'Michael', 'Baker', 1234567800, 'michael.baker@university.edu', 'Lecturer', 2),
    (4, 'Rachel', 'Martin', 1234567801, 'rachel.martin@university.edu', 'Assistant Professor', 2);

INSERT INTO Classes VALUES 
    (1, 'Lecture'),
    (2, 'Lab'),
    (3, 'Tutorial');

INSERT INTO Ed_process VALUES 
    (1, 1, 1, 1),
    (2, 1, 2, 1),
    (3, 2, 3, 1),
    (4, 2, 4, 2),
    (5, 3, 2, 2),
    (6, 3, 4, 2),
    (7, 4, 3, 1),
    (8, 4, 5, 1);

INSERT INTO Progress VALUES 
    (1, 1, 1, 80, 85, 82, 90, 85),
    (2, 2, 2, 75, 80, 78, 88, 80),
    (3, 3, 3, 65, 70, 68, 75, 70),
    (4, 4, 4, 90, 95, 92, 97, 94),
    (5, 5, 5, 85, 80, 82, 85, 84),
    (6, 6, 6, 70, 75, 73, 80, 77),
    (7, 7, 7, 60, 65, 63, 70, 67),
    (8, 8, 8, 88, 87, 88, 92, 89);

INSERT INTO Schedule VALUES 
    (1, 1, 1, 1, 101, '09:00:00', 'Mon'),
    (2, 2, 2, 2, 102, '11:00:00', 'Wed'),
    (3, 3, 1, 3, 103, '13:00:00', 'Fri'),
    (4, 4, 3, 4, 104, '15:00:00', 'Mon'),
    (5, 5, 2, 1, 105, '10:00:00', 'Tue'),
    (6, 6, 2, 2, 106, '12:00:00', 'Thu'),
    (7, 7, 3, 3, 107, '14:00:00', 'Tue'),
    (8, 8, 3, 4, 108, '16:00:00', 'Wed');
