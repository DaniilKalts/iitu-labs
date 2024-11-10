CREATE TABLE Credits(
    cred_num int PRIMARY KEY,
    lect_hours int,
    lab_hours int,
    pract_hours int,
    ind_st_hours int,
    total_hours int
);

CREATE TABLE Subjects(
    subj_id int PRIMARY KEY,
    subj_name varchar(20),
    cred_num int REFERENCES Credits (cred_num)
);

CREATE TABLE Students(
    stud_id int PRIMARY KEY,
    fname varchar(20),
    lname varchar(20),
    bdate date,
    phnum int,
    email varchar(50),
    group_id int
);

CREATE TABLE Groups(
    group_id int PRIMARY KEY,
    group_name varchar(10),
    headstud_id int REFERENCES Students(stud_id) ON DELETE SET NULL,
    major_id int
);

ALTER TABLE Students ADD FOREIGN KEY (group_id) REFERENCES Groups(group_id) ON DELETE SET NULL;

CREATE TABLE Ed_process(
    proc_id int PRIMARY KEY,
    group_id int REFERENCES Groups(group_id) ON DELETE CASCADE,
    subj_id int REFERENCES Subjects(subj_id) ON DELETE CASCADE,
    term int
);

CREATE TABLE Progress(
    progress_id int PRIMARY KEY,
    proc_id int REFERENCES Ed_process(proc_id) ON DELETE CASCADE,
    stud_id int REFERENCES Students(stud_id) ON DELETE CASCADE,
    rk1 int,
    rk2 int,
    rk_avg int,
    exam int,
    final int
);

CREATE TABLE Teachers(
    teach_id int PRIMARY KEY,
    fname varchar(20),
    lname varchar(20),
    phnum int,
    email varchar(50),
    positions varchar(50),
    dep_id int
);

CREATE TABLE Departments(
    dep_id int PRIMARY KEY,
    dep_name varchar(50),
    room int,
    phnum int,
    email varchar(50),
    headteach_id int REFERENCES Teachers(teach_id) ON DELETE SET NULL
);

ALTER TABLE Teachers ADD FOREIGN KEY (dep_id) REFERENCES Departments(dep_id) ON DELETE SET NULL;

CREATE TABLE Majors(
    major_id int PRIMARY KEY,
    major_name varchar(100),
    dep_id int REFERENCES Departments(dep_id) ON DELETE CASCADE
);

ALTER TABLE Groups ADD FOREIGN KEY (major_id) REFERENCES Majors(major_id) ON DELETE SET NULL;

CREATE TABLE Classes(
    class_id int PRIMARY KEY,
    class_type varchar(15)
);

CREATE TABLE Schedule(
    sch_id int PRIMARY KEY,
    proc_id int REFERENCES Ed_process(proc_id) ON DELETE CASCADE,
    class_id int REFERENCES Classes(class_id),
    teach_id int REFERENCES Teachers(teach_id),
    room int,
    sch_time time,
    day_of_week varchar(10)
);
