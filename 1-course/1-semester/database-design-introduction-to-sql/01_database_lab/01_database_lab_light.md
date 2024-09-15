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
      IT2-2404SE.
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
   <li><b>faculties:</b>
      <ul>
         <li>faculty_id (PK)</li>
         <li>name</li>
         <li>description</li>
      </ul>
   </li>
   <li><b>departments:</b>
      <ul>
         <li>department_id (PK)</li>
         <li>faculty_id (FK to faculties.faculty_id)</li>
         <li>name</li>
         <li>description</li>
      </ul>
   </li>
   <li><b>subjects:</b>
      <ul>
         <li>subject_id (PK)</li>
         <li>name</li>
         <li>description</li>
         <li>credits</li>
      </ul>
   </li>
   <li><b>department_subject:</b>
      <ul>
         <li>department_id (FK to departments.department_id)</li>
         <li>subject_id (FK to subjects.subject_id)</li>
      </ul>
   </li>
   <li><b>persons:</b>
      <ul>
         <li>person_id (PK)</li>
         <li>first_name</li>
         <li>last_name</li>
         <li>patronymic</li>
         <li>gender</li>
         <li>birth_date</li>
         <li>nationality</li>
         <li>citizenship</li>
         <li>phone_number</li>
         <li>email</li>
         <li>iin</li>
         <li>address</li>
         <li>education</li>
      </ul>
   </li>
   <li><b>deans:</b>
        <ul>
            <li>dean_id (PK, FK to persons.person_id)</li>
            <li>faculty_id (FK to faculties.faculty_id)</li>
        </ul>
    </li>
   <li><b>teachers:</b>
      <ul>
         <li>teacher_id (PK, FK to persons.person_id)</li>
      </ul>
   </li>
   <li><b>curators:</b>
      <ul>
         <li>curator_id (PK, FK to persons.person_id)</li>
      </ul>
   </li>
   <li><b>groups:</b>
        <ul>
            <li>group_id (PK)</li>
            <li>curator_id (FK to curators.curator_id)</li>
            <li>head_student_id (FK to students.student_id)</li>
            <li>course_year</li>
            <li>name</li>
        </ul>
   </li>
   <li><b>students:</b>
      <ul>
         <li>student_id (PK, FK to persons.person_id)</li>
         <li>group_id (FK to groups.group_id)</li>
      </ul>
   </li>
   <li><b>buildings:</b>
      <ul>
         <li>building_id (PK)</li>
         <li>name</li>
         <li>description</li>
         <li>address</li>
         <li>floor_count</li>
      </ul>
   </li>
   <li><b>classrooms:</b>
      <ul>
         <li>classroom_id (PK)</li>
         <li>building_id (FK to buildings.building_id)</li>
         <li>name</li>
         <li>description</li>
         <li>floor_number</li>
         <li>capacity</li>
      </ul>
   </li>
   <li><b>schedules:</b>
      <ul>
         <li>schedule_id (PK)</li>
         <li>group_id (FK to groups.group_id)</li>
         <li>subject_id (FK to subjects.subject_id)</li>
         <li>teacher_id (FK to teachers.teacher_id)</li>
         <li>classroom_id (FK to classrooms.classroom_id)</li>
         <li>weekday</li>
         <li>start_time</li>
         <li>end_time</li>
      </ul>
   </li>
   <li><b>assignments:</b>
      <ul>
         <li>assignment_id (PK)</li>
         <li>schedule_id (FK to schedules.schedule_id)</li>
         <li>name</li>
         <li>description</li>
         <li>deadline</li>
      </ul>
   </li>
   <li><b>student_assignment</b>
      <ul>
         <li>student_id (FK to students.student_id)</li>
         <li>assignment_id (FK to assignments.assignment_id)</li>
         <li>score</li>
      </ul>
   </li>
   <li><b>exams:</b>
      <ul>
         <li>exam_id (PK)</li>
         <li>exam_type</li>
         <li>min_score</li>
         <li>max_score</li>
         <li>date</li>
      </ul>
   </li>
   <li><b>exam_schedule:</b>
      <ul>
         <li>exam_id (FK to exams.exam_id)</li>
         <li>schedule_id (FK to schedules.schedule_id)</li>
      </ul>
   </li>
   <li><b>student_exam:</b>
      <ul>
         <li>student_id (FK to students.student_id)</li>
         <li>exam_id (FK to exams.exam_id)</li>
         <li>score</li>
      </ul>
   </li>
   <li><b>student_attendance:</b>
      <ul>
         <li>schedule_id (FK to schedules.schedule_id)</li>
         <li>student_id (FK to students.student_id)</li>
         <li>attended</li>
      </ul>
   </li>
   <li><b>clubs:</b>
      <ul>
         <li>club_id (PK)</li>
         <li>name</li>
         <li>description</li>
         <li>founded_date</li>
      </ul>
   </li>
   <li><b>student_club:</b>
      <ul>
         <li>student_id (FK to students.student_id)</li>
         <li>club_id (FK to clubs.club_id)</li>
      </ul>
   </li>
</ol>

<h2 style="color: #222222">3. What constrained attributes does the Database have?</h2>

<h3 style="color: #222222">3. Constrained attributes of each table:</h3>

<ol>
   <li><b>faculties:</b>
      <ul>
         <li><b>name:</b> 5-100 characters.</li>
         <li><b>description:</b> 20-500 characters.</li>
      </ul>
   </li>
   <li><b>departments:</b>
      <ul>
         <li><b>name:</b> 5-100 characters.</li>
         <li><b>description:</b> 20-500 characters.</li>
      </ul>
   </li>
   <li><b>subjects:</b>
      <ul>
         <li><b>name:</b> 5-50 characters.</li>
         <li><b>description:</b> 20-250 characters.</li>
         <li><b>credits:</b> Must be between 1 and 10.</li>
      </ul>
   </li>
   <li><b>persons:</b>
      <ul>
         <li><b>first_name:</b> 2-100 characters.</li>
         <li><b>last_name:</b> 2-100 characters.</li>
         <li><b>patronymic:</b> 2-100 characters.</li>
         <li><b>gender:</b> Must be either MALE, FEMALE, or OTHER.</li>
         <li><b>birth_date:</b> Valid date, age must be between 17 and 70 (depending on role).</li>
         <li><b>phone_number:</b> Must follow Kazakhstan format: +7 followed by 10 digits (e.g., +7 707 123 4567).</li>
         <li><b>email:</b> Valid email format.</li>
         <li><b>iin:</b> Exactly 12 digits.</li>
         <li><b>address:</b> 10-100 characters.</li>
         <li><b>education:</b> 20-200 characters.</li>
      </ul>
   </li>
   <li><b>groups:</b>
      <ul>
         <li><b>name:</b> 6-20 characters.</li>
         <li><b>course_year:</b> Must be between 1 and 4.</li>
      </ul>
   </li>
   <li><b>buildings:</b>
      <ul>
         <li><b>name:</b> 5-100 characters.</li>
         <li><b>description:</b> 20-500 characters.</li>
         <li><b>address:</b> 10-100 characters.</li>
         <li><b>floor_count:</b> Must be between 1 and 50.</li>
      </ul>
   </li>
   <li><b>classrooms:</b>
      <ul>
         <li><b>name:</b> 5-100 characters.</li>
         <li><b>description:</b> 20-200 characters.</li>
         <li><b>floor_number:</b> Must be between 1 and the total number of floors in the building.</li>
         <li><b>capacity:</b> Must be between 5 and 100.</li>
      </ul>
   </li>
   <li><b>schedules:</b>
      <ul>
         <li><b>weekday:</b> Must be one of the days Monday to Sunday.</li>
         <li><b>start_time:</b> Must be in valid 24-hour time format (HH:MM:SS).</li>
         <li><b>end_time:</b> Must be in valid 24-hour time format (HH:MM:SS) and must occur after the <b>start_time</b> on the same day.</li>
      </ul>
   </li>
   <li><b>assignments:</b>
      <ul>
         <li><b>name:</b> 5-40 characters.</li>
         <li><b>description:</b> 15-100 characters.</li>
         <li><b>deadline:</b> Must be a valid date.</li>
      </ul>
   </li>
   <li><b>student_assignment:</b>
      <ul>
         <li><b>score:</b> Must be between 0 and 10.</li>
      </ul>
   </li>
   <li><b>exams:</b>
      <ul>
         <li><b>exam_type:</b> Must be either 'midterm' or 'final'.</li>
         <li><b>min_score:</b> Minimum score must be 50.</li>
         <li><b>max_score:</b> Maximum score must be 100.</li>
         <li><b>date:</b> Must be a valid date.</li>
      </ul>
   </li>
   <li><b>student_exam:</b>
      <ul>
         <li><b>score:</b> Must be between 0 and 100.</li>
      </ul>
   </li>
   <li><b>student_attendance:</b>
      <ul>
         <li><b>attended:</b> Boolean value (true/false).</li>
      </ul>
   </li>
   <li><b>clubs:</b>
      <ul>
         <li><b>name:</b> 5-100 characters.</li>
         <li><b>description:</b> 20-500 characters.</li>
         <li><b>founded_date:</b> Must be a valid date in the past.</li>
      </ul>
   </li>
</ol>

<h2 style="color: #222222">4. What relations between tables does the Database have?</h2>

<h3 style="color: #222222">4. Relations between tables:</h3>

<ol>
   <li><b>faculties:</b>
      <ul>
         <li><b>faculties - departments</b> (one-to-many)</li>
         <li><b>faculties - deans</b> (one-to-one)</li>
      </ul>
   </li>
   <li><b>departments:</b>
      <ul>
         <li><b>departments - subjects</b> (many-to-many)</li>
      </ul>
   </li>
   <li><b>students:</b>
      <ul>
         <li><b>students - groups</b> (many-to-one)</li>
         <li><b>students - attendance</b> (one-to-many)</li>
         <li><b>students - clubs</b> (many-to-many)</li>
         <li><b>students - assignments</b> (many-to-many)</li>
         <li><b>students - exams</b> (many-to-many)</li>
      </ul>
   </li>
   <li><b>schedules:</b>
      <ul>
         <li><b>schedules - assignments </b> (one-to-one)</li>
         <li><b>schedules - classrooms </b> (many-to-one)</li>
         <li><b>schedules - teachers</b> (many-to-one)</li>
         <li><b>schedules - exams</b> (many-to-one)</li>
         <li><b>schedules - groups</b> (many-to-one)</li>
      </ul>
   </li>
   <li><b>classrooms:</b>
      <ul>
         <li><b>classrooms - buildings</b> (many-to-one)</li>
      </ul>
   </li>
</ol>

<h2 style="color: #222222">5. What access rights groups does the Database have?</h2>

<h3 style="color: #222222">5. Access rights groups of the Database:</h3>

<ul>
   <li><b>User Group 1:</b> Students</li>
   <li><b>User Group 2:</b> Teachers</li>
   <li><b>User Group 3:</b> Deans</li>
   <li><b>User Group 4:</b> Rector</li>
</ul>

<hr />

<ol>
   <li><b>faculties:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>departments:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>subjects:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>department_subject:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>person:</b>
      <ul>
         <li>Students - rw (read-write for their own data)</li>
         <li>Teachers - rw (read-write for their own data)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>deans:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>teachers:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write for their own data)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>curators:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
    <li><b>groups:</b>
        <ul>
            <li>Students - ro (read-only)</li>
            <li>Teachers - ro (read-only)</li>
            <li>Deans - rw (read-write)</li>
            <li>Rector - rw (read-write)</li>
        </ul>
    </li>
   <li><b>students:</b>
      <ul>
         <li>Students - rw (read-write for their own data)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>buildings:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>classrooms:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>schedules:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>assignments:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>student_assignment:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>exams:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>exam_schedule:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>student_exam:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>student_attendance:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>clubs:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>student_club:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Deans - rw (read-write)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
</ol>

<h2 style="color: #222222">6. What are potential queries for the Database?</h2>

<h3 style="color: #222222">6. The Database may have the following queries:</h3>

<ol>
   <li><b>List all students from the first-year course.</b></li>
   <li><b>List all students from foreign countries.</b></li>
   <li><b>List all students who failed the final Mathematics exam (score below 50).</b></li>
   <li><b>List all students who need to take retake on Database Design.</b></li>
   <li><b>List the top 5 students from the first-year Cyber Security course based on GPA.</b></li>
   <li><b>List all students from the university with current GPA above 90%.</b></li>
   <li><b>List all students who attended less than 80% of some lessons.</b></li>
   <li><b>List all classrooms on the 3rd floor of a Baizak building.</b></li>
   <li><b>List all subjects scheduled for group IT2-2404SE on Monday.</b></li>
   <li><b>List all departments that include C++ programming language.</b></li>
   <li><b>List the top 5 groups from the second-year course based on the average GPA of students.</b></li>
   <li><b>List all students who have participated in more than 2 clubs.</b></li>
   <li><b>List all exams scheduled for next week.</b></li>
   <li><b>List all students who haven't submitted their assignments on time on the last week.</b></li>
</ol>

<hr />

<h2 style="color: #222222; border-bottom: none; text-align: center;">Thank you for your time!</h2>
