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
    <li><b>deans</b></li>
    <li><b>departments</b></li>
    <li><b>programs</b></li>
    <li><b>program_subject</b></li>
    <li><b>subjects</b></li>
    <li><b>contact_info</b></li>
    <li><b>personal_info</b></li>
    <li><b>students</b></li>
    <li><b>teachers</b></li>
    <li><b>teacher_subject</b></li>
    <li><b>groups</b></li>
    <li><b>buildings</b></li>
    <li><b>classrooms</b></li>
    <li><b>schedules</b></li>
    <li><b>assignments</b></li>
    <li><b>schedule_assignments</b></li>
    <li><b>student_assignment</b></li>
    <li><b>clubs</b></li>
    <li><b>student_club</b></li>
    <li><b>rector</b></li>
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
    <li><b>deans:</b>
      <ul>
        <li>dean_id (PK)</li>
        <li>faculty_id (FK to faculties.faculty_id)</li>
        <li>personal_info_id (FK to personal_info.personal_info_id)</li>
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
    <li><b>program_subject:</b>
      <ul>
        <li>program_id (FK to programs.program_id)</li>
        <li>subject_id (FK to subjects.subject_id)</li>
        <li>PRIMARY KEY (program_id, subject_id)</li>
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
    <li><b>contact_info:</b>
      <ul>
        <li>contact_info_id (PK)</li>
        <li>email</li>
        <li>phone_number</li>
        <li>address</li>
      </ul>
    </li>
    <li><b>personal_info:</b>
      <ul>
        <li>personal_info_id (PK)</li>
        <li>first_name</li>
        <li>last_name</li>
        <li>patronymic</li>
        <li>gender</li>
        <li>birth_date</li>
        <li>nationality</li>
        <li>citizenship</li>
        <li>iin</li>
        <li>education</li>
        <li>contact_info_id (FK to contact_info.contact_info_id)</li>
      </ul>
    </li>
    <li><b>students:</b>
      <ul>
        <li>student_id (PK)</li>
        <li>group_id (FK to groups.group_id)</li>
        <li>personal_info_id (FK to personal_info.personal_info_id)</li>
      </ul>
    </li>
    <li><b>teachers:</b>
      <ul>
        <li>teacher_id (PK)</li>
        <li>personal_info_id (FK to personal_info.personal_info_id)</li>
      </ul>
    </li>
    <li><b>teacher_subject:</b>
      <ul>
        <li>teacher_id (FK to teachers.teacher_id)</li>
        <li>subject_id (FK to subjects.subject_id)</li>
        <li>PRIMARY KEY (teacher_id, subject_id)</li>
      </ul>
    </li>
    <li><b>groups:</b>
      <ul>
        <li>group_id (PK)</li>
        <li>head_student_id (FK to students.student_id)</li>
        <li>name</li>
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
        <li>date</li>
        <li>weekday</li>
        <li>start_time</li>
        <li>end_time</li>
      </ul>
    </li>
    <li><b>assignments:</b>
      <ul>
        <li>assignment_id (PK)</li>
        <li>subject_id (FK to subjects.subject_id)</li>
        <li>name</li>
        <li>description</li>
        <li>deadline</li>
      </ul>
    </li>
    <li><b>schedule_assignments:</b>
      <ul>
        <li>schedule_id (FK to schedules.schedule_id)</li>
        <li>assignment_id (FK to assignments.assignment_id)</li>
        <li>PRIMARY KEY (schedule_id, assignment_id)</li>
      </ul>
    </li>
    <li><b>student_assignment:</b>
      <ul>
        <li>student_id (FK to students.student_id)</li>
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
      </ul>
    </li>
    <li><b>student_club:</b>
      <ul>
        <li>student_id (FK to students.student_id)</li>
        <li>club_id (FK to clubs.club_id)</li>
        <li>PRIMARY KEY (student_id, club_id)</li>
      </ul>
    </li>
    <li><b>rector:</b>
      <ul>
        <li>rector_id (PK)</li>
        <li>personal_info_id (FK to personal_info.personal_info_id)</li>
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
    <li><b>deans:</b>
      <ul>
        <li><b>personal_info_id:</b> Valid foreign key to personal_info.</li>
        <li><b>faculty_id:</b> Valid foreign key to faculties.</li>
      </ul>
    </li>
    <li><b>departments:</b>
      <ul>
        <li><b>name:</b> 5-100 characters.</li>
        <li><b>description:</b> 20-500 characters.</li>
        <li><b>faculty_id:</b> Valid foreign key to faculties.</li>
      </ul>
    </li>
    <li><b>programs:</b>
      <ul>
        <li><b>name:</b> 5-100 characters.</li>
        <li><b>description:</b> 20-500 characters.</li>
        <li><b>department_id:</b> Valid foreign key to departments.</li>
      </ul>
    </li>
    <li><b>program_subject:</b>
      <ul>
        <li><b>program_id:</b> Valid foreign key to programs.</li>
        <li><b>subject_id:</b> Valid foreign key to subjects.</li>
      </ul>
    </li>
    <li><b>subjects:</b>
      <ul>
        <li><b>name:</b> 5-50 characters.</li>
        <li><b>description:</b> 20-250 characters.</li>
        <li><b>credits:</b> Must be between 1 and 10.</li>
      </ul>
    </li>
    <li><b>contact_info:</b>
      <ul>
        <li><b>email:</b> Must be in valid email format.</li>
        <li><b>phone_number:</b> Must follow the Kazakhstan format: +7 followed by 10 digits.</li>
        <li><b>address:</b> 10-100 characters.</li>
      </ul>
    </li>
    <li><b>personal_info:</b>
      <ul>
        <li><b>first_name:</b> 2-100 characters.</li>
        <li><b>last_name:</b> 2-100 characters.</li>
        <li><b>patronymic:</b> 2-100 characters.</li>
        <li><b>gender:</b> Must be either MALE, FEMALE, or OTHER.</li>
        <li><b>birth_date:</b> Valid date; age must be between 17 and 70.</li>
        <li><b>iin:</b> Exactly 12 digits.</li>
        <li><b>education:</b> 20-200 characters.</li>
        <li><b>contact_info_id:</b> Valid foreign key to contact_info.</li>
      </ul>
    </li>
    <li><b>students:</b>
      <ul>
        <li><b>group_id:</b> Valid foreign key to groups.</li>
        <li><b>personal_info_id:</b> Valid foreign key to personal_info.</li>
      </ul>
    </li>
    <li><b>teachers:</b>
      <ul>
        <li><b>personal_info_id:</b> Valid foreign key to personal_info.</li>
      </ul>
    </li>
    <li><b>teacher_subject:</b>
      <ul>
        <li><b>teacher_id:</b> Valid foreign key to teachers.</li>
        <li><b>subject_id:</b> Valid foreign key to subjects.</li>
      </ul>
    </li>
    <li><b>groups:</b>
      <ul>
        <li><b>name:</b> 6-20 characters.</li>
        <li><b>head_student_id:</b> Valid foreign key to students.</li>
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
        <li><b>group_id:</b> Valid foreign key to groups.</li>
        <li><b>subject_id:</b> Valid foreign key to subjects.</li>
        <li><b>teacher_id:</b> Valid foreign key to teachers.</li>
        <li><b>classroom_id:</b> Valid foreign key to classrooms.</li>
        <li><b>date:</b> Must be a valid date.</li>
        <li><b>weekday:</b> Must be one of the days Monday to Sunday.</li>
        <li><b>start_time:</b> Must be in valid 24-hour time format (HH:MM:SS).</li>
        <li><b>end_time:</b> Must be in valid 24-hour time format (HH:MM:SS) and must occur after <b>start_time</b> on
          the same day.</li>
      </ul>
    </li>
    <li><b>assignments:</b>
      <ul>
        <li><b>name:</b> 5-40 characters.</li>
        <li><b>description:</b> 15-100 characters.</li>
        <li><b>deadline:</b> Must be a valid date.</li>
        <li><b>subject_id:</b> Valid foreign key to subjects.</li>
      </ul>
    </li>
    <li><b>schedule_assignments:</b>
      <ul>
        <li><b>schedule_id:</b> Valid foreign key to schedules.</li>
        <li><b>assignment_id:</b> Valid foreign key to assignments.</li>
      </ul>
    </li>
    <li><b>student_assignment:</b>
      <ul>
        <li><b>student_id:</b> Valid foreign key to students.</li>
        <li><b>assignment_id:</b> Valid foreign key to assignments.</li>
        <li><b>score:</b> Must be between 0 and 100.</li>
      </ul>
    </li>
    <li><b>clubs:</b>
      <ul>
        <li><b>name:</b> 5-100 characters.</li>
        <li><b>description:</b> 20-500 characters.</li>
      </ul>
    </li>
    <li><b>student_club:</b>
      <ul>
        <li><b>student_id:</b> Valid foreign key to students.</li>
        <li><b>club_id:</b> Valid foreign key to clubs.</li>
      </ul>
    </li>
    <li><b>rector:</b>
      <ul>
        <li><b>personal_info_id:</b> Valid foreign key to personal_info.</li>
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
    <li><b>deans:</b>
        <ul>
            <li><b>deans - faculties</b> (one-to-one)</li>
            <li><b>deans - personal_info</b> (one-to-one)</li>
        </ul>
    </li>
    <li><b>departments:</b>
      <ul>
        <li><b>departments - programs</b> (one-to-many)</li>
      </ul>
    </li>
    <li><b>programs:</b>
      <ul>
        <li><b>programs - program_subject</b> (one-to-many)</li>
        <li><b>programs - subjects</b> (many-to-many through program_subject)</li>
      </ul>
    </li>
    <li><b>program_subject:</b>
      <ul>
        <li><b>program_subject - programs</b> (many-to-one)</li>
        <li><b>program_subject - subjects</b> (many-to-one)</li>
      </ul>
    </li>
    <li><b>subjects:</b>
      <ul>
        <li><b>subjects - program_subject</b> (one-to-many)</li>
        <li><b>subjects - assignments</b> (one-to-many)</li>
      </ul>
    </li>
    <li><b>contact_info:</b>
      <ul>
        <li><b>contact_info - personal_info</b> (one-to-one)</li>
      </ul>
    </li>
    <li><b>personal_info:</b>
      <ul>
        <li><b>personal_info - students</b> (one-to-one)</li>
        <li><b>personal_info - teachers</b> (one-to-one)</li>
        <li><b>personal_info - deans</b> (one-to-one)</li>
      </ul>
    </li>
    <li><b>students:</b>
      <ul>
        <li><b>students - groups</b> (many-to-one)</li>
        <li><b>students - clubs</b> (many-to-many through student_club)</li>
        <li><b>students - assignments</b> (many-to-many through student_assignment)</li>
        <li><b>students - personal_info</b> (one-to-one)</li>
      </ul>
    </li>
    <li><b>teachers:</b>
      <ul>
        <li><b>teachers - schedules</b> (one-to-many)</li>
        <li><b>teachers - subjects</b> (many-to-many through teacher_subject)</li>
        <li><b>teachers - personal_info</b> (one-to-one)</li>
      </ul>
    </li>
    <li><b>teacher_subject:</b>
      <ul>
        <li><b>teacher_subject - teachers</b> (many-to-one)</li>
        <li><b>teacher_subject - subjects</b> (many-to-one)</li>
      </ul>
    </li>
    <li><b>deans:</b>
      <ul>
        <li><b>deans - faculties</b> (one-to-one)</li>
        <li><b>deans - personal_info</b> (one-to-one)</li>
      </ul>
    </li>
    <li><b>groups:</b>
      <ul>
        <li><b>groups - students</b> (one-to-many)</li>
        <li><b>groups - schedules</b> (one-to-many)</li>
      </ul>
    </li>
    <li><b>buildings:</b>
      <ul>
        <li><b>buildings - classrooms</b> (one-to-many)</li>
      </ul>
    </li>
    <li><b>classrooms:</b>
      <ul>
        <li><b>classrooms - schedules</b> (one-to-many)</li>
        <li><b>classrooms - buildings</b> (many-to-one)</li>
      </ul>
    </li>
    <li><b>schedules:</b>
      <ul>
        <li><b>schedules - schedule_assignments</b> (one-to-many)</li>
        <li><b>schedules - classrooms</b> (many-to-one)</li>
        <li><b>schedules - teachers</b> (many-to-one)</li>
        <li><b>schedules - groups</b> (many-to-one)</li>
      </ul>
    </li>
    <li><b>assignments:</b>
      <ul>
        <li><b>assignments - schedule_assignments</b> (one-to-many)</li>
        <li><b>assignments - student_assignment</b> (one-to-many)</li>
        <li><b>assignments - subjects</b> (many-to-one)</li>
      </ul>
    </li>
    <li><b>student_assignment:</b>
      <ul>
        <li><b>student_assignment - students</b> (many-to-one)</li>
        <li><b>student_assignment - assignments</b> (many-to-one)</li>
      </ul>
    </li>
    <li><b>clubs:</b>
      <ul>
        <li><b>clubs - students</b> (many-to-many through student_club)</li>
      </ul>
    </li>
    <li><b>student_club:</b>
      <ul>
        <li><b>student_club - students</b> (many-to-one)</li>
        <li><b>student_club - clubs</b> (many-to-one)</li>
      </ul>
    </li>
    <li><b>rector:</b>
      <ul>
        <li><b>rector - personal_info:</b> (one-to-one)</li>
      </ul>
    </li>
  </ol>

  <h2 style="color: #222222">5. What access rights groups does the Database have?</h2>

  <h3 style="color: #222222">5. Access rights groups of the Database:</h3>

  <hr />

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
        <li>Deans - rw (read-write for faculties they manage)</li>
        <li>Rector - rw (read-write)</li>
      </ul>
    </li>
    <li><b>deans:</b>
      <ul>
        <li>Students - ro (read-only)</li>
        <li>Teachers - ro (read-only)</li>
        <li>Deans - rw (read-write for their own data)</li>
        <li>Rector - ro (read-only)</li>
      </ul>
    </li>
    <li><b>departments:</b>
      <ul>
        <li>Students - ro (read-only)</li>
        <li>Teachers - ro (read-only)</li>
        <li>Deans - rw (read-write for departments related to their faculties)</li>
        <li>Rector - rw (read-write)</li>
      </ul>
    </li>
    <li><b>programs:</b>
      <ul>
        <li>Students - ro (read-only)</li>
        <li>Teachers - ro (read-only)</li>
        <li>Deans - rw (read-write for programs related to their departments)</li>
        <li>Rector - rw (read-write)</li>
      </ul>
    </li>
    <li><b>program_subject:</b>
      <ul>
        <li>Students - ro (read-only)</li>
        <li>Teachers - ro (read-only)</li>
        <li>Deans - rw (read-write for subjects related to their programs)</li>
        <li>Rector - rw (read-write)</li>
      </ul>
    </li>
    <li><b>subjects:</b>
      <ul>
        <li>Students - ro (read-only)</li>
        <li>Teachers - rw (read-write for subjects they teach)</li>
        <li>Deans - rw (read-write for subjects related to their faculties)</li>
        <li>Rector - rw (read-write)</li>
      </ul>
    </li>
    <li><b>contact_info:</b>
      <ul>
        <li>Students - rw (read-write for their own contact data)</li>
        <li>Teachers - rw (read-write for their own contact data)</li>
        <li>Deans - rw (read-write for their own contact data)</li>
        <li>Rector - rw (read-write for their own contact data)</li>
      </ul>
    </li>
    <li><b>personal_info:</b>
      <ul>
        <li>Students - rw (read-write for their own data)</li>
        <li>Teachers - rw (read-write for their own data)</li>
        <li>Deans - rw (read-write for their own data)</li>
        <li>Rector - rw (read-write for their own data)</li>
      </ul>
    </li>
    <li><b>students:</b>
      <ul>
        <li>Students - rw (read-write for their own data)</li>
        <li>Teachers - ro (read-only)</li>
        <li>Deans - ro (read-only)</li>
        <li>Rector - ro (read-only)</li>
      </ul>
    </li>
    <li><b>teachers:</b>
      <ul>
        <li>Students - ro (read-only)</li>
        <li>Teachers - rw (read-write for their own data)</li>
        <li>Deans - ro (read-only)</li>
        <li>Rector - ro (read-only)</li>
      </ul>
    </li>
    <li><b>teacher_subject:</b>
      <ul>
        <li>Students - ro (read-only)</li>
        <li>Teachers - rw (read-write for subjects they teach)</li>
        <li>Deans - rw (read-write for subjects related to their faculties)</li>
        <li>Rector - rw (read-write)</li>
      </ul>
    </li>
    <li><b>groups:</b>
      <ul>
        <li>Students - ro (read-only)</li>
        <li>Teachers - ro (read-only)</li>
        <li>Deans - rw (read-write for groups related to their faculties)</li>
        <li>Rector - rw (read-write)</li>
      </ul>
    </li>
    <li><b>buildings:</b>
      <ul>
        <li>Students - ro (read-only)</li>
        <li>Teachers - ro (read-only)</li>
        <li>Deans - ro (read-only)</li>
        <li>Rector - rw (read-write)</li>
      </ul>
    </li>
    <li><b>classrooms:</b>
      <ul>
        <li>Students - ro (read-only)</li>
        <li>Teachers - ro (read-only)</li>
        <li>Deans - ro (read-only)</li>
        <li>Rector - rw (read-write)</li>
      </ul>
    </li>
    <li><b>schedules:</b>
      <ul>
        <li>Students - ro (read-only)</li>
        <li>Teachers - rw (read-write for schedules related to their subjects)</li>
        <li>Deans - rw (read-write for schedules related to their faculties)</li>
        <li>Rector - rw (read-write)</li>
      </ul>
    </li>
    <li><b>assignments:</b>
      <ul>
        <li>Students - ro (read-only)</li>
        <li>Teachers - rw (read-write for assignments they manage)</li>
        <li>Deans - rw (read-write for assignments related to their faculties)</li>
        <li>Rector - rw (read-write)</li>
      </ul>
    </li>
    <li><b>schedule_assignments:</b>
      <ul>
        <li>Students - ro (read-only)</li>
        <li>Teachers - rw (read-write for assignments related to their schedules)</li>
        <li>Deans - rw (read-write for assignments related to their faculties)</li>
        <li>Rector - rw (read-write)</li>
      </ul>
    </li>
    <li><b>student_assignment:</b>
      <ul>
        <li>Students - rw (read-write for their own data)</li>
        <li>Teachers - rw (read-write for assignments they manage)</li>
        <li>Deans - rw (read-write for assignments related to their faculties)</li>
        <li>Rector - rw (read-write)</li>
      </ul>
    </li>
    <li><b>clubs:</b>
      <ul>
        <li>Students - ro (read-only)</li>
        <li>Teachers - ro (read-only)</li>
        <li>Deans - ro (read-only)</li>
        <li>Rector - rw (read-write)</li>
      </ul>
    </li>
    <li><b>student_club:</b>
      <ul>
        <li>Students - rw (read-write for their own data)</li>
        <li>Teachers - ro (read-only)</li>
        <li>Deans - ro (read-only)</li>
        <li>Rector - rw (read-write)</li>
      </ul>
    </li>
    <li><b>rector:</b>
      <ul>
        <li>Rector - rw (read-write for their own data)</li>
      </ul>
    </li>
  </ol>

  <h2 style="color: #222222">6. What are potential queries for the Database?</h2>

  <h3 style="color: #222222">6. The Database may have the following queries:</h3>

  <ol>
    <li><b>List all faculties along with their departments.</b></li>
    <li><b>List the number of students in each program.</b></li>
    <li><b>Find the subject with the highest average student score.</b></li>
    <li><b>List all teachers assigned to the Database Design subject.</b></li>
    <li><b>List all teachers who are teaching more than 3 subjects.</b></li>
    <li><b>Find the teacher with the highest number of students across all their classes.</b></li>
    <li><b>List all groups with their corresponding head students.</b></li>
    <li><b>List all classrooms that have a capacity greater than 30.</b></li>
    <li><b>List all assignments due next week.</b></li>
    <li><b>List all assignments related to a specific subject.</b></li>
    <li><b>List all students who have completed all assignments in a subject.</b></li>
    <li><b>List the average score of students for each assignment.</b></li>
    <li><b>List all students with a GPA below 50%.</b></li>
    <li><b>List all students who have not joined any clubs.</b></li>
  </ol>

  <hr />

  <h2 style="color: #222222; border-bottom: none; text-align: center;">Thank you for your time!</h2>
