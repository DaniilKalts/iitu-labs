-- Update the name and description of a faculty
UPDATE faculties
SET name = 'Faculty of Advanced Computer Technologies',
    description = 'Faculty focusing on cutting-edge computer technologies and cybersecurity'
WHERE faculty_id = 1;

-- Update the email and phone number of a contact info entry
UPDATE contact_info
SET email = 'alice.updated@example.com',
    phone_number = '+71234560000'
WHERE contact_info_id = 1;

-- Update the name of a department
UPDATE departments
SET name = 'Cyber Defense',
    description = 'Department specializing in defensive cybersecurity techniques'
WHERE department_id = 2;

-- Update the credits for a subject
UPDATE subjects
SET credits = 6
WHERE subject_id = 1;

-- Update the address and floor count of a building
UPDATE buildings
SET address = '123 Updated University St',
    floor_count = 6
WHERE building_id = 1;
