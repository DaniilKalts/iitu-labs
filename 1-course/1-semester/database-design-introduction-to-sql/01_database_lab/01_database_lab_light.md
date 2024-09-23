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
  </span>
  <ol style="font-size: 16px; font-weight: 600;">
     <li>Describe at least 7 tables to store in the Database.</li>
     <li>Describe attributes for each table in the Database.</li>
     <li>Make sure that the Database has 5 constrained attributes.</li>
     <li>Describe relations between entities in the Database.</li>
     <li>Describe 2 access rights groups in the Database.</li>
     <li>Provide 10-15 queries for the Database.</li>
  </ol>
  <hr />
</div>

<h2 style="color: #222222">1. What tables does the Database store?</h2>

<h3 style="color: #222222">1. The Database includes the following tables:</h3>

<ol>
    <li><b>faculties</b></li>
    <li><b>departments</b></li>
    <li><b>programs</b></li>
    <li><b>subjects</b></li>
    <li><b>program_subject</b></li>
    <li><b>roles</b></li>
    <li><b>persons</b></li>
    <li><b>phone_numbers</b></li>
    <li><b>dean_faculty</b></li>
    <li><b>groups</b></li>
    <li><b>student_group</b></li>
    <li><b>buildings</b></li>
    <li><b>classrooms</b></li>
    <li><b>schedules</b></li>
    <li><b>assignments</b></li>
    <li><b>student_assignment</b></li>
    <li><b>clubs</b></li>
    <li><b>student_club</b></li>
</ol>

<h2 style="color: #222222">2. What attributes does the Database store?</h2>

<h3 style="color: #222222">2. The Database includes the attributes tables:</h3>

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
    <li><b>programs:</b>
        <ul>
            <li>program_id (PK)</li>
            <li>department_id (FK to departments.department_id)</li>
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
    <li><b>program_subject:</b>
        <ul>
            <li>program_id (FK to programs.program_id)</li>
            <li>subject_id (FK to subjects.subject_id)</li>
            <li>PRIMARY KEY (program_id, subject_id)</li>
        </ul>
    </li>
    <li><b>roles:</b>
        <ul>
            <li>role_id (PK)</li>
            <li>name</li>
            <li>description</li>
        </ul>
    </li>
    <li><b>persons:</b>
        <ul>
            <li>person_id (PK)</li>
            <li>role_id (FK to roles.role_id)</li>
            <li>first_name</li>
            <li>last_name</li>
            <li>patronymic</li>
            <li>gender</li>
            <li>birth_date</li>
            <li>nationality</li>
            <li>citizenship</li>
            <li>email</li>
            <li>iin</li>
            <li>address</li>
            <li>education</li>
        </ul>
    </li>
    <li><b>phone_numbers:</b>
        <ul>
            <li>phone_id (PK)</li>
            <li>person_id (FK to persons.person_id)</li>
            <li>phone_number (must follow Kazakhstan format: +7 followed by 10 digits)</li>
        </ul>
    </li>
    <li><b>dean_faculty:</b>
        <ul>
            <li>dean_id (FK to persons.person_id)</li>
            <li>faculty_id (FK to faculties.faculty_id)</li>
            <li>PRIMARY KEY (dean_id, faculty_id)</li>
        </ul>
    </li>
    <li><b>groups:</b>
        <ul>
            <li>group_id (PK)</li>
            <li>head_student_id (FK to persons.person_id)</li>
            <li>curator_id (FK to persons.person_id)</li>
            <li>course_year</li>
            <li>name</li>
        </ul>
    </li>
    <li><b>student_group:</b>
        <ul>
            <li>student_id (FK to persons.person_id)</li>
            <li>group_id (FK to groups.group_id)</li>
            <li>PRIMARY KEY (student_id, group_id)</li>
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
            <li>teacher_id (FK to persons.person_id)</li>
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
    <li><b>student_assignment:</b>
        <ul>
            <li>student_id (FK to persons.person_id)</li>
            <li>assignment_id (FK to assignments.assignment_id)</li>
            <li>score</li>
            <li>PRIMARY KEY (student_id, assignment_id)</li>
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
            <li>student_id (FK to persons.person_id)</li>
            <li>club_id (FK to clubs.club_id)</li>
            <li>PRIMARY KEY (student_id, club_id)</li> 
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
   <li><b>programs:</b>
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
   <li><b>roles:</b>
      <ul>
         <li><b>name:</b> Must be one of the following: student, teacher, dean, head_student, head_department, rector.</li>
         <li><b>description:</b> 10-250 characters.</li>
      </ul>
   </li>
   <li><b>persons:</b>
      <ul>
         <li><b>first_name:</b> 2-100 characters.</li>
         <li><b>last_name:</b> 2-100 characters.</li>
         <li><b>patronymic:</b> 2-100 characters.</li>
         <li><b>gender:</b> Must be either MALE, FEMALE, or OTHER.</li>
         <li><b>birth_date:</b> Valid date; age must be between 17 and 70 (depending on role).</li>
         <li><b>email:</b> Must be in valid email format.</li>
         <li><b>iin:</b> Exactly 12 digits.</li>
         <li><b>address:</b> 10-100 characters.</li>
         <li><b>education:</b> 20-200 characters.</li>
      </ul>
   </li>
   <li><b>phone_numbers:</b>
      <ul>
         <li><b>phone_number:</b> Must follow Kazakhstan format: +7 followed by 10 digits.</li>
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
         <li><b>end_time:</b> Must be in valid 24-hour time format (HH:MM:SS) and must occur after <b>start_time</b> on the same day.</li>
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
         <li><b>faculties - dean_faculty</b> (one-to-one)</li>
      </ul>
   </li>
   <li><b>departments:</b>
      <ul>
         <li><b>departments - programs</b> (one-to-many)</li>
      </ul>
   </li>
   <li><b>persons:</b>
      <ul>
         <li><b>persons - phone_numbers</b> (one-to-many)</li>
         <li><b>persons - groups</b> (many-to-one)</li>
         <li><b>persons - clubs</b> (many-to-many)</li>
         <li><b>persons - assignments</b> (many-to-many)</li>
         <li><b>persons - dean_faculty</b> (one-to-one)</li>
      </ul>
   </li>
   <li><b>programs:</b>
      <ul>
         <li><b>programs - program_subject</b> (one-to-many)</li>
         <li><b>programs - subjects</b> (many-to-many through program_subject)</li>
      </ul>
   </li>
   <li><b>schedules:</b>
      <ul>
         <li><b>schedules - assignments</b> (many-to-one)</li>
         <li><b>schedules - classrooms</b> (many-to-one)</li>
         <li><b>schedules - persons (teachers)</b> (many-to-one)</li>
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

<hr />

<ul>
   <li><b>User Group 1:</b> Students</li>
   <li><b>User Group 2:</b> Teachers</li>
   <li><b>User Group 3:</b> Head Department</li>
   <li><b>User Group 4:</b> Deans</li>
   <li><b>User Group 5:</b> Rector</li>
</ul>

<hr />

<ol>
   <li><b>faculties:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Head Department - ro (read-only)</li>
         <li>Deans - rw (read-write, can override subjects related to their faculty)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>departments:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Head Department - rw (read-write, can override department related to their department)</li>
         <li>Deans - rw (read-write, can override department related to their faculty)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>programs:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Head Department - rw (read-write, can override program related to their department)</li>
         <li>Deans - rw (read-write, can override program related to their faculty)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>subjects:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Head Department - rw (read-write, can override subject related to their department)</li>
         <li>Deans - rw (read-write, can override subject related to their faculty)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>roles:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Head Department - ro (read-only)</li>
         <li>Deans - ro (read-only)</li>
         <li>Rector - rw (read-write, can assign roles)</li>
      </ul>
   </li>
   <li><b>persons:</b>
      <ul>
         <li>Students - rw (read-write for their own data)</li>
         <li>Teachers - rw (read-write for their own data)</li>
         <li>Head Department - rw (read-write for their own data)</li>
         <li>Deans - rw (read-write for their own data)</li>
         <li>Rector - rw (read-write for their own data)</li>
      </ul>
   </li>
   <li><b>phone_numbers:</b>
      <ul>
         <li>Students - rw (read-write for their own data)</li>
         <li>Teachers - rw (read-write for their own data)</li>
         <li>Head Department - rw (read-write for their own data)</li>
         <li>Deans - rw (read-write for their own data)</li>
         <li>Rector - rw (read-write for their own data)</li>
      </ul>
   </li>
   <li><b>dean_faculty:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Head Department - ro (read-only)</li>
         <li>Deans - ro (read-only)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>groups:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Head Department - rw (read-write, can override groups related to their departments)</li>
         <li>Deans - rw (read-write, can override groups related to their faculties)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>buildings:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Head Department - ro (read-only)</li>
         <li>Deans - ro (read-only)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>classrooms:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - ro (read-only)</li>
         <li>Head Department - ro (read-only)</li>
         <li>Deans - ro (read-only)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>schedules:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write, can override schedules related to their subjects)</li>
         <li>Head Department - rw (read-write, can override schedules related to their departments)</li>
         <li>Deans - rw (read-write, can override schedules related to their faculties)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>assignments:</b>
      <ul>
         <li>Students - ro (read-only)</li>
         <li>Teachers - rw (read-write, can give assignments related to their subjects)</li>
         <li>Head Department - rw (read-write, can override assignments related to their departments)</li>
         <li>Deans - rw (read-write, can override assignments related to their faculties)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>student_assignment:</b>
      <ul>
         <li>Students - rw (read-write for their own data)</li>
         <li>Teachers - rw (read-write, can override assignments related to their departments)</li>
         <li>Head Department - rw (read-write, can override assignments related to their departments)</li>
         <li>Deans - rw (read-write, can override assignments related to their faculties)</li>
         <li>Rector - rw (read-write)</li>
      </ul>
   </li>
   <li><b>clubs:</b>
       <ul>
          <li>Students - ro (read-only)</li>
          <li>Teachers - ro (read-only)</li>
          <li>Head Department - ro (read-only)</li>
          <li>Deans - ro (read-only)</li>
          <li>Rector - rw (read-write)</li>
       </ul>
    </li>
    <li><b>student_club:</b>
       <ul>
          <li>Students - rw (read-write for their own data)</li>
          <li>Teachers - ro (read-only)</li>
          <li>Head Department - ro (read-only)</li>
          <li>Deans - ro (read-only)</li>
          <li>Rector - rw (read-write)</li>
       </ul>
    </li>
</ol>

<h2 style="color: #222222">6. What are potential queries for the Database?</h2>

<h3 style="color: #222222">6. The Database may have the following queries:</h3>

<ol>
   <li><b>List all faculties along with their departments.</b></li>
   <li><b>List all students enrolled in the Cyber Security program.</b></li>
   <li><b>List all subjects with more than 3 credits.</b></li>
   <li><b>List all students with a GPA below 50%.</b></li>
   <li><b>List all assignments due next week.</b></li>
   <li><b>List all teachers assigned to the Database Design subject.</b></li>
   <li><b>List all groups with their corresponding head students.</b></li>
   <li><b>List all classrooms that have a capacity greater than 30.</b></li>
   <li><b>List the names of all clubs along with their founding dates.</b></li>
   <li><b>List all students who are in the same group as a specific student.</b></li>
   <li><b>List all buildings with more than 5 floors.</b></li>
   <li><b>List all students who are enrolled in more than one group.</b></li>
   <li><b>List all subjects that are not scheduled for any groups this semester.</b></li>
   <li><b>List all assignments related to a specific subject.</b></li>
   <li><b>List the average score of students for each assignment.</b></li>
</ol>

<hr />

<h2 style="color: #222222; border-bottom: none; text-align: center;">Thank you for your time!</h2>
