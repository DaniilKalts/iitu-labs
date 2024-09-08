<h1 style="color: #222222; text-align: center; border-bottom: none;">Lab work 1</h1>
<h2 style="color: #222222; text-align: center;">Database Design. Introduction to SQL.</h1>

<hr />

<div style="font-weight: 500">
   <span style="font-size: 20px; color: #222222">
      Full Name:
   </span>
   <span style="font-size: 18px;">
      Daniil Kalts.
   </span> <br />
   <span style="font-size: 20px; color: #222222">
      Group:
   </span>
   <span style="font-size: 18px;">
      IT2-2404.
   </span> <br />
   <span style="font-size: 20px; color: #222222">
      Goal:
   </span>
   <span style="font-size: 18px;">
      Perform a subject area analysis for a University Database.
   </span> <br />
      <span style="font-size: 20px; color: #222222">
      Task:
   </span> <br />
   <span style="font-size: 18px;">
      Provide a description of the future Database according to the following plan:
      <ol style="font-size: 16px; color: #222222;">
         <li>Describe at least 7 tables to store in the Database.</li>
         <li>Describe attributes for each table in the Database.</li>
         <li>Make sure that the Database has 5 constrained attributes.</li>
         <li>Describe relations between entities in the Database.</li>
         <li>Describe 2 access rights groups in the Database.</li>
         <li>Provide 10-15 queries for the Database.</li>
      </ol>
   </span>
   <hr />
</div>

<h2 style="color: #222222">1. What tables does the Database store?</h2>

<h3 style="color: #222222">1. The Database includes the following tables:</h3>

<ol>
   <li><b>faculties</b> – What's the info about the faculties?</li>
   <li><b>departments</b> – What departments are there within the faculties?</li>
   <li><b>deans</b> – Who are the head administrators managing the faculties and departments?</li>
   <li><b>educational_programs</b> – Which programs are offered in each department?</li>
   <li><b>courses</b> – What courses can students take in the programs?</li>
   <li><b>semesters</b> – When do the semesters for these courses start and end?</li>
   <li><b>teacher_subject_semesters</b> – Which teachers are assigned to which subjects in specific semesters, and what roles do they have?</li>
   <li><b>subjects</b> – What subjects are included in the courses?</li>
   <li><b>teachers</b> – Who are the teachers for the subjects?</li>
   <li><b>students</b> – Who are the students taking these subjects?</li>
   <li><b>groups</b> – What student groups are formed for the subjects?</li>
   <li><b>student_groups</b> – Which students are in which groups?</li>
   <li><b>buildings</b> – Where are the buildings located?</li>
   <li><b>classrooms</b> – What are the classrooms for the scheduled subjects?</li>
   <li><b>schedule</b> – When and where do the classes happen?</li>
   <li><b>assignments</b> – What assignments are given to the groups?</li>
   <li><b>exams</b> – What exams do students have to take?</li>
   <li><b>lab_works</b> – What lab work are students assigned?</li>
   <li><b>quizzes</b> – What quizzes do students have to complete?</li>
   <li><b>attendance</b> – How is attendance tracked for students in subjects?</li>
   <li><b>clubs</b> – What clubs can students join?</li>
   <li><b>students_clubs</b> – Which students are in which clubs?</li>
</ol>

<h2 style="color: #222222">2. What attributes does each table have?</h2>

<h3 style="color: #222222">2. Each table contains the following attributes:</h3>

<ol>
   <li><b>faculties:</b>
      <ul>
         <li><b>id:</b> What's the faculty ID?</li>
         <li><b>name:</b> What's the faculty name?</li>
         <li><b>description:</b> What's the faculty description?</li>
      </ul>
   </li>
   <li><b>departments:</b>
      <ul>
         <li><b>id:</b> What's the department ID?</li>
         <li><b>faculty_id:</b> Which faculty does this department belong to?</li>
         <li><b>name:</b> What's the department name?</li>
         <li><b>description:</b> What's the department description?</li>
      </ul>
   </li>
   <li><b>deans:</b>
      <ul>
         <li><b>id:</b> What's the dean's ID?</li>
         <li><b>name:</b> What's the name of the dean?</li>
         <li><b>surname:</b> What's the dean's surname?</li>
         <li><b>patronymic:</b> What's the dean's patronymic?</li>
         <li><b>gender:</b> What's the gender of the dean?</li>
         <li><b>birth_date:</b> When was the dean born?</li>
         <li><b>nationality:</b> What's the dean's nationality?</li>
         <li><b>citizenship:</b> What's the dean's citizenship?</li>
         <li><b>department_id:</b> Which department does the dean belong to?</li>
         <li><b>phone_number:</b> What's the dean's phone number?</li>
         <li><b>email:</b> What's the dean's email address?</li>
         <li><b>experience:</b> How many years of experience does the dean have?</li>
         <li><b>education:</b> What's the dean's educational background?</li>
         <li><b>position:</b> What's the title or position of the dean?</li>
         <li><b>address:</b> What's the address of the dean?</li>
         <li><b>created_at:</b> When was this dean's record created?</li>
         <li><b>updated_at:</b> When was this dean's record last updated?</li>
      </ul>
   </li>
   <li><b>educational_programs:</b>
      <ul>
         <li><b>id:</b> What's the program ID?</li>
         <li><b>faculty_id:</b> Which faculty does this program belong to?</li>
         <li><b>department_id:</b> Which department does this program belong to?</li>
         <li><b>name:</b> What's the program name?</li>
         <li><b>description:</b> What's the program description?</li>
         <li><b>type:</b> What's the type of program?</li>
         <li><b>credits:</b> How many credits does this program have?</li>
         <li><b>study_duration:</b> How long is the program?</li>
      </ul>
   </li>
   <li><b>courses:</b>
      <ul>
         <li><b>id:</b> What's the course ID?</li>
         <li><b>educational_program_id:</b> Which educational program does this course belong to?</li>
         <li><b>name:</b> What's the course name?</li>
         <li><b>description:</b> What's the course description?</li>
         <li><b>year_of_study:</b> What's the year of study for this course?</li>
         <li><b>price:</b> What's the course price?</li>
      </ul>
   </li>
   <li><b>semesters:</b>
      <ul>
         <li><b>id:</b> What's the semester ID?</li>
         <li><b>course_id:</b> Which course does this semester belong to?</li>
         <li><b>start_date:</b> When does the semester start?</li>
         <li><b>end_date:</b> When does the semester end?</li>
         <li><b>semester_half:</b> What's the semester half?</li>
      </ul>
   </li>
   <li><b>subjects:</b>
      <ul>
         <li><b>id:</b> What's the subject ID?</li>
         <li><b>educational_program_id:</b> Which educational program does this subject belong to?</li>
         <li><b>semester_id:</b> Which semester does this subject belong to?</li>
         <li><b>name:</b> What's the subject name?</li>
         <li><b>description:</b> What's the subject description?</li>
         <li><b>credits:</b> How many credits does this subject have?</li>
         <li><b>lecture_hours:</b> How many lecture hours does this subject have?</li>
         <li><b>lab_hours:</b> How many lab hours does this subject have?</li>
      </ul>
   </li>
   <li><b>teachers:</b>
      <ul>
         <li><b>id:</b> What's the teacher ID?</li>
         <li><b>educational_program_id:</b> Which program does this teacher belong to?</li>
         <li><b>semester_id:</b> Which semester does this teacher belong to?</li>
         <li><b>name:</b> What's the teacher's name?</li>
         <li><b>surname:</b> What's the teacher's surname?</li>
         <li><b>patronymic:</b> What's the teacher's patronymic?</li>
         <li><b>gender:</b> What's the teacher's gender?</li>
         <li><b>birth_date:</b> When was the teacher born?</li>
         <li><b>nationality:</b> What's the teacher's nationality?</li>
         <li><b>citizenship:</b> What's the teacher's citizenship?</li>
         <li><b>phone_number:</b> What's the teacher's phone number?</li>
         <li><b>email:</b> What's the teacher's email address?</li>
         <li><b>experience:</b> How many years of experience does the teacher have?</li>
         <li><b>education:</b> What's the teacher's educational background?</li>
         <li><b>position:</b> What's the teacher's position?</li>
         <li><b>iin:</b> What's the teacher's national ID number?</li>
         <li><b>address:</b> What's the teacher's address?</li>
         <li><b>created_at:</b> When was this teacher record created?</li>
         <li><b>updated_at:</b> When was this teacher record last updated?</li>
      </ul>
   </li>
   <li><b>teacher_subject_semesters:</b>
      <ul>
         <li><b>id:</b> What's the record ID?</li>
         <li><b>teacher_id:</b> Which teacher is assigned to the subject and semester?</li>
         <li><b>subject_id:</b> Which subject is this for?</li>
         <li><b>semester_id:</b> Which semester is this assignment for?</li>
         <li><b>role:</b> What's the teacher's role (lecture or lab)?</li>
      </ul>
   </li>
   <li><b>students:</b>
      <ul>
         <li><b>id:</b> What's the student ID?</li>
         <li><b>semester_id:</b> Which course does this student belong to?</li>
         <li><b>name:</b> What's the student's name?</li>
         <li><b>surname:</b> What's the student's surname?</li>
         <li><b>patronymic:</b> What's the student's patronymic?</li>
         <li><b>gender:</b> What's the student's gender?</li>
         <li><b>birth_date:</b> When was the student born?</li>
         <li><b>nationality:</b> What's the student's nationality?</li>
         <li><b>citizenship:</b> What's the student's citizenship?</li>
         <li><b>phone_number:</b> What's the student's phone number?</li>
         <li><b>email:</b> What's the student's email?</li>
         <li><b>iin:</b> What's the student's national ID number?</li>
         <li><b>address:</b> What's the student's address?</li>
         <li><b>created_at:</b> When was this student record created?</li>
         <li><b>updated_at:</b> When was this student record last updated?</li>
      </ul>
   </li>
   <li><b>groups:</b>
      <ul>
         <li><b>id:</b> What's the group ID?</li>
         <li><b>semester_id:</b> Which course does this group belong to?</li>
         <li><b>name:</b> What's the group name?</li>
         <li><b>student_count:</b> How many students are in this group?</li>
         <li><b>created_at:</b> When was this group record created?</li>
         <li><b>updated_at:</b> When was this group record last updated?</li>
      </ul>
   </li>
   <li><b>student_groups:</b>
      <ul>
         <li><b>student_id:</b> Which student belongs to this group?</li>
         <li><b>group_id:</b> Which group is the student assigned to?</li>
      </ul>
   </li>
   <li><b>buildings:</b>
      <ul>
         <li><b>id:</b> What's the building ID?</li>
         <li><b>name:</b> What's the building's name?</li>
         <li><b>description:</b> What's the building's description?</li>
         <li><b>address:</b> What's the building's address?</li>
         <li><b>floors:</b> How many floors does the building have?</li>
      </ul>
   </li>
   <li><b>classrooms:</b>
      <ul>
         <li><b>id:</b> What's the classroom ID?</li>
         <li><b>building_id:</b> Which building does this classroom belong to?</li>
         <li><b>name:</b> What's the classroom's name?</li>
         <li><b>description:</b> What's the classroom's description?</li>
         <li><b>floor:</b> What floor is the classroom located on? (Must not exceed the building's total floors)</li>
         <li><b>capacity:</b> How many people can fit in the classroom?</li>
      </ul>
   </li>
   <li><b>schedule:</b>
      <ul>
         <li><b>id:</b> What's the schedule ID?</li>
         <li><b>student_group_id:</b> Which student group is scheduled for this time?</li>
         <li><b>teacher_id:</b> Which teacher is responsible for this schedule?</li>
         <li><b>subject_id:</b> What subject is being taught during this schedule?</li>
         <li><b>classroom_id:</b> Which classroom is assigned to this schedule?</li>
         <li><b>start_datetime:</b> When does this scheduled session start?</li>
         <li><b>end_datetime:</b> When does this scheduled session end?</li>
         <li><b>created_at:</b> When was this schedule record created?</li>
         <li><b>updated_at:</b> When was this schedule record last updated?</li>
      </ul>
   </li>
   <li><b>assignments:</b>
      <ul>
         <li><b>id:</b> What's the assignment ID?</li>
         <li><b>student_group_id:</b> Which student group is this assignment for?</li>
         <li><b>teacher_id:</b> Which teacher assigned this task?</li>
         <li><b>subject_id:</b> What subject is the assignment related to?</li>
         <li><b>name:</b> What's the assignment name?</li>
         <li><b>description:</b> What's the assignment description?</li>
         <li><b>deadline_date:</b> What's the assignment deadline date?</li>
         <li><b>created_at:</b> When was this assignment record created?</li>
         <li><b>updated_at:</b> When was this assignment record last updated?</li>
      </ul>
   </li>
   <li><b>exams:</b>
      <ul>
         <li><b>id:</b> What's the exam ID?</li>
         <li><b>student_id:</b> Which student took this exam?</li>
         <li><b>subject_id:</b> Which subject is this exam related to?</li>
         <li><b>exam_type:</b> What type of exam is this (midterm, final)?</li>
         <li><b>mark:</b> What mark did the student receive for this exam?</li>
         <li><b>date:</b> When was the exam held?</li>
         <li><b>created_at:</b> When was this exam record created?</li>
         <li><b>updated_at:</b> When was this exam record last updated?</li>
      </ul>
   </li>
   <li><b>lab_works:</b>
      <ul>
         <li><b>id:</b> What's the lab work ID?</li>
         <li><b>student_id:</b> Which student completed this lab work?</li>
         <li><b>subject_id:</b> Which subject does this lab work relate to?</li>
         <li><b>assignment_id:</b> Which assignment does this lab work relate to?</li>
         <li><b>lab_work_number:</b> What's the number of this lab work (1st, 2nd, etc.)?</li>
         <li><b>mark:</b> What's the mark for this lab work?</li>
         <li><b>created_at:</b> When was this lab work record created?</li>
         <li><b>updated_at:</b> When was this lab work record last updated?</li>
      </ul>
   </li>
   <li><b>quizzes:</b>
      <ul>
         <li><b>id:</b> What's the quiz ID?</li>
         <li><b>student_id:</b> Which student took this quiz?</li>
         <li><b>subject_id:</b> Which subject does this quiz relate to?</li>
         <li><b>lab_work_id:</b> Which subject does this quiz relate to?</li>
         <li><b>quiz_number:</b> What's the quiz number (1st, 2nd, etc.)?</li>
         <li><b>mark:</b> What's the mark for this quiz?</li>
         <li><b>created_at:</b> When was this quiz record created?</li>
         <li><b>updated_at:</b> When was this quiz record last updated?</li>
      </ul>
   </li>
   <li><b>attendance:</b>
      <ul>
         <li><b>id:</b> What's the attendance record ID?</li>
         <li><b>student_id:</b> Which student is this attendance record for?</li>
         <li><b>subject_id:</b> Which subject is this attendance record for?</li>
         <li><b>total_lessons:</b> How many total lessons were held?</li>
         <li><b>attended_lessons:</b> How many lessons did the student attend?</li>
         <li><b>created_at:</b> When was this attendance record created?</li>
         <li><b>updated_at:</b> When was this attendance record last updated?</li>
      </ul>
   </li>
   <li><b>clubs:</b>
      <ul>
         <li><b>id:</b> What's the club ID?</li>
         <li><b>name:</b> What's the club's name?</li>
         <li><b>description:</b> What's the club's description?</li>
         <li><b>president_student_id:</b> Who's the president or head of the club (student ID)?</li>
         <li><b>founded_date:</b> When was the club founded?</li>
         <li><b>created_at:</b> When was this club record created?</li>
         <li><b>updated_at:</b> When was this club record last updated?</li>
      </ul>
   </li>
   <li><b>students_clubs:</b>
      <ul>
         <li><b>id:</b> What's the membership record ID?</li>
         <li><b>student_id:</b> Which student is a member of this club?</li>
         <li><b>club_id:</b> Which club does this membership record refer to?</li>
         <li><b>join_date:</b> When did the student join the club?</li>
         <li><b>role:</b> What role does the student have in the club (e.g., member, vice president)?</li>
         <li><b>created_at:</b> When was this membership record created?</li>
         <li><b>updated_at:</b> When was this membership record last updated?</li>
      </ul>
   </li>
</ol>

<h2 style="color: #222222">3. What constrained attributes does the Database has?</h2>

<h3 style="color: #222222">3. Constrained attributes of each table:</h3>

<ol>
   <li><b>faculties:</b>
      <ul>
         <li><b>name:</b> The character limit is between 5 and 100 characters.</li>
         <li><b>description:</b> The character limit is between 20 and 500 characters.</li>
      </ul>
   </li>
   <li><b>departments:</b>
      <ul>
         <li><b>name:</b> The character limit is between 5 and 100 characters.</li>
         <li><b>description:</b> The character limit is between 20 and 500 characters.</li>
      </ul>
   </li>
   <li><b>deans:</b>
      <ul>
         <li><b>name:</b> The character limit is between 2 and 100 characters.</li>
         <li><b>surname:</b> The character limit is between 2 and 100 characters.</li>
         <li><b>patronymic:</b> The character limit is between 2 and 100 characters.</li>
         <li><b>gender:</b> Must be one of the following: MALE, FEMALE, OTHER.</li>
         <li><b>birth_date:</b> Must be a valid date, and the dean's age must be between 30 and 70 years.</li>
         <li><b>phone_number:</b> Must be a valid phone number format (e.g., +[country code][number], 10-15 digits).</li>
         <li><b>email:</b> Must be a valid email format (e.g., number@iitu.edu.kz).</li>
         <li><b>experience:</b> Must be a number between 5 and 40 years.</li>
         <li><b>education:</b> The character limit is between 10 and 250 characters.</li>
         <li><b>position:</b> The position can be Dean, Professor, or Head of Department.</li>
         <li><b>iin:</b> Must be exactly 12 digits (assuming a national ID number).</li>
         <li><b>address:</b> The character limit is between 10 and 100 characters.</li>
      </ul>
   </li>
   <li><b>educational_programs:</b>
      <ul>
         <li><b>name:</b> The character limit is between 5 and 100 characters.</li>
         <li><b>description:</b> The character limit is between 20 and 500 characters.</li>
         <li><b>type:</b> The type can only be BACHELOR, MASTER, or DOCTORAL STUDY.</li>
         <li><b>study_duration:</b> The program can last from 1 to 4 years.</li>
      </ul>
   </li>
   <li><b>courses:</b>
      <ul>
         <li><b>name:</b> The character limit is between 5 and 100 characters.</li>
         <li><b>description:</b> The character limit is between 20 and 500 characters.</li>
         <li><b>year_of_study:</b> The year of study can be 1, 2, 3, or 4.</li>
         <li><b>price:</b> The price can vary between $100 and $10,000.</li>
      </ul>
   </li>
   <li><b>semesters:</b>
      <ul>
         <li><b>semester_half:</b> The semester half can be 1 or 2.</li>
      </ul>
   </li>
   <li><b>subjects:</b>
      <ul>
         <li><b>name:</b> The character limit is between 5 and 50 characters.</li>
         <li><b>description:</b> The character limit is between 20 and 250 characters.</li>
      </ul>
   </li>
   <li><b>teachers:</b>
      <ul>
         <li><b>name:</b> The character limit is between 2 and 100 characters.</li>
         <li><b>surname:</b> The character limit is between 2 and 100 characters.</li>
         <li><b>patronymic:</b> The character limit is between 2 and 100 characters.</li>
         <li><b>gender:</b> Must be one of the following: MALE, FEMALE, OTHER.</li>
         <li><b>birth_date:</b> Must be a valid date, and the teacher's age must be between 25 and 70 years.</li>
         <li><b>phone_number:</b> Must be a valid phone number format (e.g., +[country code][number], 10-15 digits).</li>
         <li><b>email:</b> Must be a valid email format (e.g., number@iitu.edu.kz).</li>
         <li><b>experience:</b> Must be a number between 1 and 45 years.</li>
         <li><b>education:</b> The character limit is between 10 and 250 characters.</li>
         <li><b>position:</b> The position can be Lecturer, Professor, or Academic.</li>
         <li><b>iin:</b> Must be exactly 12 digits (assuming a national ID number).</li>
         <li><b>address:</b> The character limit is between 10 and 100 characters.</li>
      </ul>
   </li>
   <li><b>teacher_subject_semesters:</b>
      <ul>
         <li><b>role:</b> Must be one of the following: lecturer, lab instructor</li>
      </ul>
   </li>
   <li><b>students:</b>
      <ul>
         <li><b>name:</b> The character limit is between 2 and 100 characters.</li>
         <li><b>surname:</b> The character limit is between 2 and 100 characters.</li>
         <li><b>patronymic:</b> The character limit is between 2 and 100 characters.</li>
         <li><b>gender:</b> Must be one of the following: MALE, FEMALE, OTHER.</li>
         <li><b>birth_date:</b> Must be a valid date, and the student's age must be between 17 and 50 years.</li>
         <li><b>phone_number:</b> Must be a valid phone number format (e.g., +[country code][number], 10-15 digits).</li>
         <li><b>email:</b> Must be a valid email format (e.g., number@iitu.edu.kz).</li>
         <li><b>iin:</b> Must be exactly 12 digits (assuming a national ID number).</li>
         <li><b>address:</b> The character limit is between 10 and 100 characters.</li>
      </ul>
   </li>
   <li><b>groups:</b>
      <ul>
         <li><b>name:</b> The character limit is between 10 and 20 characters.</li>
         <li><b>student_count:</b> The student limit is between 2 and 60.</li>
      </ul>
   </li>
   <li><b>student_groups:</b>
      <ul>
         <li>Nothing to constrain.</li>
      </ul>
   </li>
   <li><b>buildings:</b>
      <ul>
         <li><b>name:</b> The character limit is between 5 and 100 characters.</li>
         <li><b>description:</b> The character limit is between 20 and 500 characters.</li>
         <li><b>address:</b> The character limit is between 10 and 100 characters.</li>
         <li><b>floors:</b> The number of floors must be between 1 and 50.</li>
      </ul>
   </li>
   <li><b>classrooms:</b>
      <ul>
         <li><b>name:</b> The character limit is between 5 and 100 characters.</li>
         <li><b>description:</b> The character limit is between 20 and 200 characters.</li>
         <li><b>floor:</b> The classroom floor must be between 1 and the number of floors in the building.</li>
         <li><b>capacity:</b> The number of people must be between 5 and 100.</li>
      </ul>
   </li>
   <li><b>schedule:</b>
      <ul>
         <li>Nothing to constrain.</li>
      </ul>
   </li>
   <li><b>assignments:</b>
      <ul>
         <li><b>name:</b> The character limit is between 5 and 40 characters.</li>
         <li><b>description:</b> The character limit is between 15 and 100 characters.</li>
      </ul>
   </li>
   <li><b>exams:</b>
      <ul>
         <li><b>exam_type:</b> Must be one of the following: midterm, final.</li>
         <li><b>mark:</b> Must be between 0 and 100.</li>
      </ul>
   </li>
   <li><b>lab_works:</b>
      <ul>
         <li><b>lab_work_number:</b> The lab work number must be between 1 and 10 (e.g., 1st, 2nd, etc.).</li>
         <li><b>mark:</b> The mark for this lab work must be between 0 and 100.</li>
      </ul>
   </li>
   <li><b>quizzes:</b>
      <ul>
         <li><b>quiz_number:</b> The quiz number must be between 1 and 10 (e.g., 1st, 2nd, etc.).</li>
         <li><b>mark:</b> The mark for this quiz must be between 0 and 100.</li>
      </ul>
   </li>
   <li><b>attendance:</b>
      <ul>
         <li><b>total_lessons:</b> The number of total lessons must be between 1 and 50.</li>
         <li><b>attended_lessons:</b> The number of attended lessons must be between 0 and the total lessons.</li>
      </ul>
   </li>
   <li><b>clubs:</b>
      <ul>
         <li><b>name:</b> The character limit is between 5 and 100 characters.</li>
         <li><b>description:</b> The character limit is between 20 and 500 characters.</li>
         <li><b>founded_date:</b> Must be a valid date in the past.</li>
      </ul>
   </li>
   <li><b>students_clubs:</b>
      <ul>
         <li><b>join_date:</b> Must be a valid date in the past.</li>
         <li><b>role:</b> Must be one of the following: member, vice president.</li>
      </ul>
   </li>
</ol>

<h2 style="color: #222222">4. What relations between tables does the Database have?</h2>

<h3 style="color: #222222">4. Relations between tables:</h3>

<ol>
   <li><b>faculties:</b>
      <ul>
         <li>faculties - departments (one-to-many)</li>
      </ul>
   </li>
   <li><b>departments:</b>
      <ul>
         <li>departments - deans (one-to-one)</li>
         <li>departments - educational_programs (many-to-many)</li>
      </ul>
   </li>
   <li><b>deans:</b>
      <ul>
         <li>No relations</li>
      </ul>
   </li>
   <li><b>educational_programs:</b>
      <ul>
         <li>educational_programs - courses (one-to-many)</li>
         <li>educational_programs - subjects (many-to-one)</li>
         <li>educational_programs - teachers (many-to-many)</li>
      </ul>
   </li>
   <li><b>courses:</b>
      <ul>
         <li>courses - semesters (one-to-many)</li>
      </ul>
   </li>
   <li><b>semesters:</b>
      <ul>
         <li>semesters - subjects (one-to-many)</li>
         <li>semesters - teachers (many-to-many)</li>
         <li>semesters - students (many-to-one)</li>
         <li>semesters - groups (many-to-one)</li>
      </ul>
   </li>
   <li><b>subjects:</b>
      <ul>
         <li>subjects - teachers (one-to-many)</li>
         <li>subjects - schedule (one-to-many)</li>
         <li>subjects - assignments (one-to-many)</li>
         <li>subjects - exams (one-to-many)</li>
         <li>subjects - quizzes (one-to-many)</li>
         <li>subjects - lab_works (one-to-many)</li>
         <li>subjects - attendance (one-to-many)</li>
      </ul>
   </li>
   <li><b>teachers:</b>
      <ul>
         <li>teachers - teacher_subject_semesters (one-to-many)</li>
         <li>teachers - schedule (many-to-many)</li>
         <li>teachers - assignments (many-to-many)</li>
      </ul>
   </li>
   <li><b>teacher_subject_semesters:</b>
      <ul>
         <li>No relations</li>
      </ul>
   </li>
   <li><b>students:</b>
      <ul>
         <li>students - student_groups (one-to-many)</li>
         <li>students - exams (one-to-many)</li>
         <li>students - quizzes (one-to-many)</li>
         <li>students - lab_works (one-to-many)</li>
         <li>students - attendance (one-to-many)</li>
         <li>students - clubs (one-to-one)</li>
         <li>students - students_clubs (one-to-many)</li>
      </ul>
   </li>
   <li><b>groups:</b>
      <ul>
         <li>groups - student_groups (one-to-many)</li>
      </ul>
   </li>
   <li><b>student_groups:</b>
      <ul>
         <li>student_groups - schedule (one-to-many)</li>
         <li>student_groups - assignments (one-to-many)</li>
      </ul>
   </li>
   <li><b>buildings:</b>
      <ul>
         <li>buildings - classrooms (many-to-one)</li>
      </ul>
   </li>
   <li><b>classrooms:</b>
      <ul>
         <li>classrooms - schedule (one-to-many)</li>
      </ul>
   </li>
   <li><b>schedule:</b>
      <ul>
         <li>No relations.</li>
      </ul>
   </li>
   <li><b>assignments:</b>
      <ul>
         <li>assignments - lab_works (one-to-one)</li>
      </ul>
   </li>
   <li><b>exams:</b>
      <ul>
         <li>No relations.</li>
      </ul>
   </li>
   <li><b>lab_works:</b>
      <ul>
         <li>lab_works - quizzes (one-to-one).</li>
      </ul>
   </li>
   <li><b>quizzes:</b>
      <ul>
         <li>No relations.</li>
      </ul>
   </li>
   <li><b>attendance:</b>
      <ul>
         <li>No relations.</li>
      </ul>
   </li>
   <li><b>clubs:</b>
      <ul>
         <li>clubs - students_clubs (one-to-many)</li>
      </ul>
   </li>
   <li><b>students_clubs:</b>
      <ul>
         <li>No relations.</li>
      </ul>
   </li>
</ol>

<h2 style="color: #222222">5. What access rights groups does the Database have?</h2>

<h3 style="color: #222222">5. Access rights groups of the Database:</h3>

<ul>
   <li><b>User Group 1:</b> Students</li>
   <li><b>User Group 2:</b> Teachers</li>
   <li><b>User Group 3:</b> Deans</li>
</ul>

---

<ol>
   <li><b>faculties:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>departments:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>deans:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>educational_programs:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>courses:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>semesters:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>subjects:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>teachers:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>teacher_subject_semesters:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>students:</b>
      <ul>
         <li>Students - rw (read-write)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>groups:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>student_groups:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>buildings:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>classrooms:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>schedule:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>assignments:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>exams:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>lab_works:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>quizzes:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>attendance:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>clubs:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
   <li><b>students_clubs:</b>
      <ul>
         <li>Students - rw (read-write)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
      </ul>
   </li>
</ol>

<h2 style="color: #222222">6. What are potential queries for the Database?</h2>

<h3 style="color: #222222">6. The Database may have the following queries:</h3>

<ol>
   <li><b>List all students from the first-year course.</b></li>
   <li><b>List all students from foreign countries.</b></li>
   <li><b>List all students who failed the Mathematics exam.</b></li>
   <li><b>List the top 5 students from the first-year Cyber Security course based on GPA.</b></li>
   <li><b>List all students with an average GPA above 90% in their current course.</b></li>
   <li><b>List all students who attended less than 80% of their lessons.</b></li>
   <li><b>List all teachers with more than 5 years of experience.</b></li>
   <li><b>List all classrooms on the 3rd floor of a building.</b></li>
   <li><b>List all subjects scheduled for group IT2-2404SE on Monday.</b></li>
   <li><b>List all courses and semesters that include Mathematics for Software Engineering.</b></li>
   <li><b>List all courses that include C++ programming.</b></li>
   <li><b>List the top 5 groups from the second-year course based on the average GPA of students.</b></li>
   <li><b>List all students from IT2-2406SE who completed laboratory works but received low scores on quizzes.</b></li>
   <li><b>List all professors at the university.</b></li>
   <li><b>List all DOCTORAL educational programs.</b></li>
</ol>

<hr />

<h2 style="color: #222222; border-bottom: none; text-align: center;">Thank you for your time!</h2>
