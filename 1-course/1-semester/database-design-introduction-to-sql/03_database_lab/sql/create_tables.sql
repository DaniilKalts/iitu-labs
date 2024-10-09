CREATE TABLE faculties (
	faculty_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	description VARCHAR(200)
);

CREATE TABLE departments (
	department_id SERIAL PRIMARY KEY,
	faculty_id INTEGER,
	name VARCHAR(100) NOT NULL UNIQUE,
	-- description VARCHAR(200),
	
	FOREIGN KEY (faculty_id) REFERENCES faculties(faculty_id)
);

CREATE TABLE programs (
	program_id SERIAL PRIMARY KEY,
	department_id INTEGER,
	name VARCHAR(100) NOT NULL UNIQUE,
	description VARCHAR(200),

	FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE subjects (
	subject_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE,
	description VARCHAR(250),
	credits INTEGER CHECK (credits <= 10)
);

CREATE TABLE program_subject (
    program_id INTEGER,
    subject_id INTEGER,

    FOREIGN KEY (program_id) REFERENCES programs(program_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),

    PRIMARY KEY (program_id, subject_id)  -- Composite primary key
);

CREATE TABLE contact_info (
	contact_info_id SERIAL PRIMARY KEY,
	email VARCHAR(100) NOT NULL UNIQUE CHECK (email ~ '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
	phone_number VARCHAR(15) UNIQUE CHECK (phone_number ~ '^\+7\d{10}$'),
	address VARCHAR(100)
);

CREATE TYPE gender_enum AS ENUM ('male', 'female', 'other');

CREATE TABLE personal_info (
	personal_info_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	patronymic VARCHAR(100),
	gender gender_enum,
	birth_date DATE,
	iin VARCHAR(12) UNIQUE,
	education VARCHAR(200),
	contact_info_id INTEGER,
	
	FOREIGN KEY (contact_info_id) REFERENCES contact_info(contact_info_id)
);

CREATE TABLE rector (
	rector_id SERIAL PRIMARY KEY,
	personal_info_id INTEGER,

	FOREIGN KEY (personal_info_id) REFERENCES personal_info(personal_info_id)
);

CREATE TABLE deans (	
	dean_id SERIAL PRIMARY KEY,
	faculty_id INTEGER,
	personal_info_id INTEGER,
	
	FOREIGN KEY (faculty_id) REFERENCES faculties(faculty_id),
	FOREIGN KEY (personal_info_id) REFERENCES personal_info(personal_info_id)
);

CREATE TABLE groups (
  group_id SERIAL PRIMARY KEY,
  name VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  group_id INTEGER,
  personal_info_id INTEGER,

  FOREIGN KEY (group_id) REFERENCES groups(group_id),
  FOREIGN KEY (personal_info_id) REFERENCES personal_info(personal_info_id)
);

CREATE TABLE group_heads (
  group_id INTEGER,
  head_student_id INTEGER,

  FOREIGN KEY(group_id) REFERENCES groups(group_id),
  FOREIGN KEY(head_student_id) REFERENCES students(student_id),

  PRIMARY KEY(group_id, head_student_id)
);


CREATE TABLE clubs (
  club_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL UNIQUE,
	description VARCHAR(200)
);

CREATE TABLE student_club (
  student_id INTEGER,
  club_id INTEGER,

  FOREIGN KEY(student_id) REFERENCES students(student_id),
  FOREIGN KEY(club_id) REFERENCES clubs(club_id),

  PRIMARY KEY (student_id, club_id)  -- Composite primary key
);

CREATE TABLE teachers (
	teacher_id SERIAL PRIMARY KEY,
	personal_info_id INTEGER,

	FOREIGN KEY (personal_info_id) REFERENCES personal_info(personal_info_id)
);

CREATE TABLE teacher_subject (
  teacher_id INTEGER,
  subject_id INTEGER,

  FOREIGN KEY(teacher_id) REFERENCES teachers(teacher_id),
  FOREIGN KEY(subject_id) REFERENCES subjects(subject_id),

  PRIMARY KEY (teacher_id, subject_id)  -- Composite primary key
);

CREATE TABLE buildings (
  building_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL UNIQUE,
	description VARCHAR(200),
	address VARCHAR(100),
  floor_count INTEGER
);

CREATE TABLE classrooms (
  classroom_id SERIAL PRIMARY KEY,
  building_id INTEGER,
	name VARCHAR(100) NOT NULL UNIQUE,
	description VARCHAR(200),
  floor_number INTEGER,
  capacity INTEGER,

  FOREIGN KEY(building_id) REFERENCES buildings(building_id)
);

CREATE TABLE assignments (
  assignment_id SERIAL PRIMARY KEY,
  subject_id INTEGER,
	name VARCHAR(40) NOT NULL,
	description VARCHAR(100),
  deadline DATE,

  FOREIGN KEY(subject_id) REFERENCES subjects(subject_id),

  UNIQUE(subject_id, name)
);

CREATE TYPE weekday_enum AS ENUM ('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday');

CREATE TABLE schedules (
  schedule_id SERIAL PRIMARY KEY,
  group_id INTEGER,
  subject_id INTEGER,
  teacher_id INTEGER,
  classroom_id INTEGER,
  weekday weekday_enum NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,

  FOREIGN KEY(group_id) REFERENCES groups(group_id),
  FOREIGN KEY(subject_id) REFERENCES subjects(subject_id),
  FOREIGN KEY(teacher_id) REFERENCES teachers(teacher_id),
  FOREIGN KEY(classroom_id) REFERENCES classrooms(classroom_id)
);

CREATE TABLE schedule_assignment (
  schedule_id INTEGER,
  assignment_id INTEGER,

  FOREIGN KEY(schedule_id) REFERENCES schedules(schedule_id),
  FOREIGN KEY(assignment_id) REFERENCES assignments(assignment_id),

  PRIMARY KEY(schedule_id, assignment_id) -- Composite primary key
);

CREATE TABLE student_assignment (
  student_id INTEGER,
  assignment_id INTEGER,

  FOREIGN KEY(student_id) REFERENCES students(student_id),
  FOREIGN KEY(assignment_id) REFERENCES assignments(assignment_id),

  PRIMARY KEY(student_id, assignment_id) -- Composite primary key
);
