CREATE TABLE Students( 
  stud_id int PRIMARY KEY, 
  fname varchar(20), 
  lname varchar(20) 
); 

CREATE TABLE Departments( 
  dep_id int PRIMARY KEY, 
  name varchar(10) 
); 

CREATE TABLE Teachers( 
  teach_id int PRIMARY KEY, 
  fname varchar(20), 
  lname varchar(20), 
  dep_id int REFERENCES Departments(dep_id) 
); 
 
INSERT INTO Students VALUES (1,'A','A'), (2,'B','B'); 
INSERT INTO Departments VALUES (1,'AAA'), (2,'BBB'); 
INSERT INTO Teachers VALUES (1,'B','B', 2), (2,'C','C', 2); 
