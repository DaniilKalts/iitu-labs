# Practice 3 — Interacting with the Oracle Server

| Item | Value |
| --- | --- |
| Student | Daniil Kalts |
| Group | it2-2404SE |
| Subject | PL/SQL |
| DBMS | Oracle Database |

## 1. Output the average salary for a department

```sql
DECLARE
    v_department_id employees.department_id%TYPE := 50;
    v_average_salary employees.salary%TYPE;
BEGIN
    SELECT AVG(salary)
    INTO v_average_salary
    FROM employees
    WHERE department_id = v_department_id;

    DBMS_OUTPUT.PUT_LINE('Average salary: ' || ROUND(v_average_salary, 2));
END;
```

## 2. Count the employees in a particular position

```sql
DECLARE
    v_job_id employees.job_id%TYPE := 'ST_CLERK';
    v_employee_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_employee_count
    FROM employees
    WHERE job_id = v_job_id;

    DBMS_OUTPUT.PUT_LINE('Number of employees: ' || v_employee_count);
END;
```

## 3. Count the letters in an employee's first and last names

```sql
DECLARE
    v_employee_id employees.employee_id%TYPE := 100;
    v_first_name_length NUMBER;
    v_last_name_length NUMBER;
BEGIN
    SELECT LENGTH(first_name), LENGTH(last_name)
    INTO v_first_name_length, v_last_name_length
    FROM employees
    WHERE employee_id = v_employee_id;

    DBMS_OUTPUT.PUT_LINE('Letters in first name: ' || v_first_name_length);
    DBMS_OUTPUT.PUT_LINE('Letters in last name: ' || v_last_name_length);
END;
```

## 4. Display the maximum department ID

```sql
DECLARE
    max_deptno departments.department_id%TYPE;
BEGIN
    SELECT MAX(department_id)
    INTO max_deptno
    FROM departments;

    DBMS_OUTPUT.PUT_LINE('Maximum department ID: ' || max_deptno);
END;
```

## 5. Insert the Education department

```sql
DECLARE
    max_deptno departments.department_id%TYPE;
    v_department_name departments.department_name%TYPE;
BEGIN
    SELECT MAX(department_id)
    INTO max_deptno
    FROM departments;

    INSERT INTO departments (department_id, department_name, location_id)
    VALUES (max_deptno + 10, 'Education', NULL);

    DBMS_OUTPUT.PUT_LINE('Rows inserted: ' || SQL%ROWCOUNT);

    SELECT department_name
    INTO v_department_name
    FROM departments
    WHERE department_id = max_deptno + 10;

    DBMS_OUTPUT.PUT_LINE('Department: ' || v_department_name);
END;
```

## 6. Update and delete the Education department

```sql
DECLARE
    v_department_id departments.department_id%TYPE;
    v_department_name departments.department_name%TYPE;
    v_location_id departments.location_id%TYPE;
BEGIN
    SELECT MAX(department_id)
    INTO v_department_id
    FROM departments
    WHERE department_name = 'Education';

    UPDATE departments
    SET location_id = 3000
    WHERE department_id = v_department_id;

    SELECT department_name, location_id
    INTO v_department_name, v_location_id
    FROM departments
    WHERE department_id = v_department_id;

    DBMS_OUTPUT.PUT_LINE('Department: ' || v_department_name);
    DBMS_OUTPUT.PUT_LINE('Location ID: ' || v_location_id);

    DELETE FROM departments
    WHERE department_id = v_department_id;

    DBMS_OUTPUT.PUT_LINE('Rows deleted: ' || SQL%ROWCOUNT);
END;
```

## 7. Retrieve the employee ID from the Human Resources department

```sql
DECLARE
    v_employee_id employees.employee_id%TYPE;
BEGIN
    SELECT e.employee_id
    INTO v_employee_id
    FROM employees e
    JOIN departments d ON d.department_id = e.department_id
    WHERE d.department_name = 'Human Resources';

    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id);
END;
```
