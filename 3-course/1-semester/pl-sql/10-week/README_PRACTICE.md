# Practice 10 — Packages

| Item | Value |
| --- | --- |
| Student | Daniil Kalts |
| Group | it2-2404SE |
| Subject | PL/SQL |
| DBMS | Oracle Database |

Use the Oracle HR schema and enable DBMS Output. Run each SQL block separately in the order shown. The insert examples assume `IT_SYSAN`, `DASMITH`, and `SJOPLIN` are unused.

## 1. Create and invoke JOB_PKG

Create the package with `ADD_JOB`, `UPD_JOB`, and `DEL_JOB` from Practice 8 and `GET_JOB` from Practice 9.

```sql
CREATE OR REPLACE PACKAGE job_pkg AS
    PROCEDURE add_job (
        p_job_id IN jobs.job_id%TYPE,
        p_job_title IN jobs.job_title%TYPE
    );

    PROCEDURE upd_job (
        p_job_id IN jobs.job_id%TYPE,
        p_job_title IN jobs.job_title%TYPE
    );

    PROCEDURE del_job (
        p_job_id IN jobs.job_id%TYPE
    );

    FUNCTION get_job (
        p_job_id IN jobs.job_id%TYPE
    ) RETURN jobs.job_title%TYPE;
END job_pkg;
```

```sql
CREATE OR REPLACE PACKAGE BODY job_pkg AS
    PROCEDURE add_job (
        p_job_id IN jobs.job_id%TYPE,
        p_job_title IN jobs.job_title%TYPE
    ) AS
    BEGIN
        INSERT INTO jobs (
            job_id,
            job_title
        ) VALUES (
            p_job_id,
            p_job_title
        );
    END add_job;

    PROCEDURE upd_job (
        p_job_id IN jobs.job_id%TYPE,
        p_job_title IN jobs.job_title%TYPE
    ) AS
        job_not_found EXCEPTION;
    BEGIN
        UPDATE jobs
        SET job_title = p_job_title
        WHERE job_id = p_job_id;

        IF SQL%ROWCOUNT = 0 THEN
            RAISE job_not_found;
        END IF;
    EXCEPTION
        WHEN job_not_found THEN
            DBMS_OUTPUT.PUT_LINE('Job not found: ' || p_job_id);
    END upd_job;

    PROCEDURE del_job (
        p_job_id IN jobs.job_id%TYPE
    ) AS
        job_not_found EXCEPTION;
    BEGIN
        DELETE FROM jobs
        WHERE job_id = p_job_id;

        IF SQL%ROWCOUNT = 0 THEN
            RAISE job_not_found;
        END IF;
    EXCEPTION
        WHEN job_not_found THEN
            DBMS_OUTPUT.PUT_LINE('Job not found: ' || p_job_id);
    END del_job;

    FUNCTION get_job (
        p_job_id IN jobs.job_id%TYPE
    ) RETURN jobs.job_title%TYPE AS
        v_job_title jobs.job_title%TYPE;
    BEGIN
        SELECT job_title
        INTO v_job_title
        FROM jobs
        WHERE job_id = p_job_id;

        RETURN v_job_title;
    END get_job;
END job_pkg;
```

Add the systems analyst job and check the row.

```sql
BEGIN
    job_pkg.add_job('IT_SYSAN', 'SYSTEMS ANALYST');
END;
```

```sql
SELECT
    job_id,
    job_title
FROM jobs
WHERE job_id = 'IT_SYSAN';
```

## 2. Create and invoke EMP_PKG

Declare `ADD_EMPLOYEE` and `GET_EMPLOYEE` in the specification. Keep `VALID_DEPTID` private by defining it only in the body.

```sql
CREATE OR REPLACE PACKAGE emp_pkg AS
    PROCEDURE add_employee (
        p_first_name IN employees.first_name%TYPE,
        p_last_name IN employees.last_name%TYPE,
        p_email IN employees.email%TYPE,
        p_job IN employees.job_id%TYPE DEFAULT 'SA_REP',
        p_mgr IN employees.manager_id%TYPE DEFAULT 145,
        p_sal IN employees.salary%TYPE DEFAULT 1000,
        p_comm IN employees.commission_pct%TYPE DEFAULT 0,
        p_deptid IN employees.department_id%TYPE DEFAULT 30
    );

    PROCEDURE get_employee (
        p_employee_id IN employees.employee_id%TYPE,
        p_salary OUT employees.salary%TYPE,
        p_job_id OUT employees.job_id%TYPE
    );
END emp_pkg;
```

```sql
CREATE OR REPLACE PACKAGE BODY emp_pkg AS
    FUNCTION valid_deptid (
        p_deptid IN departments.department_id%TYPE
    ) RETURN BOOLEAN AS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM departments
        WHERE department_id = p_deptid;

        RETURN v_count > 0;
    END valid_deptid;

    PROCEDURE add_employee (
        p_first_name IN employees.first_name%TYPE,
        p_last_name IN employees.last_name%TYPE,
        p_email IN employees.email%TYPE,
        p_job IN employees.job_id%TYPE DEFAULT 'SA_REP',
        p_mgr IN employees.manager_id%TYPE DEFAULT 145,
        p_sal IN employees.salary%TYPE DEFAULT 1000,
        p_comm IN employees.commission_pct%TYPE DEFAULT 0,
        p_deptid IN employees.department_id%TYPE DEFAULT 30
    ) AS
        invalid_department EXCEPTION;
    BEGIN
        IF NOT valid_deptid(p_deptid) THEN
            RAISE invalid_department;
        END IF;

        INSERT INTO employees (
            employee_id,
            first_name,
            last_name,
            email,
            hire_date,
            job_id,
            manager_id,
            salary,
            commission_pct,
            department_id
        ) VALUES (
            employees_seq.NEXTVAL,
            p_first_name,
            p_last_name,
            p_email,
            TRUNC(SYSDATE),
            p_job,
            p_mgr,
            p_sal,
            p_comm,
            p_deptid
        );

        DBMS_OUTPUT.PUT_LINE('Employee added: ' || p_first_name || ' ' || p_last_name);
    EXCEPTION
        WHEN invalid_department THEN
            DBMS_OUTPUT.PUT_LINE('Department not found: ' || p_deptid);
    END add_employee;

    PROCEDURE get_employee (
        p_employee_id IN employees.employee_id%TYPE,
        p_salary OUT employees.salary%TYPE,
        p_job_id OUT employees.job_id%TYPE
    ) AS
    BEGIN
        SELECT
            salary,
            job_id
        INTO
            p_salary,
            p_job_id
        FROM employees
        WHERE employee_id = p_employee_id;
    END get_employee;
END emp_pkg;
```

Try adding Jane Harris to department `15`.

```sql
BEGIN
    emp_pkg.add_employee('Jane', 'Harris', 'JAHARRIS', p_deptid => 15);
END;
```

`Department not found: 15` appears in DBMS Output.

Add David Smith to department `80` and check the row.

```sql
BEGIN
    emp_pkg.add_employee('David', 'Smith', 'DASMITH', p_deptid => 80);
END;
```

```sql
SELECT
    employee_id,
    first_name,
    last_name,
    email,
    department_id
FROM employees
WHERE email = 'DASMITH';
```

## 3. Overload ADD_EMPLOYEE

Replace the specification and body. The new procedure takes the first name, last name, and department ID. It builds the email in uppercase from the first letter of the first name and up to seven letters of the last name, then calls the original procedure.

```sql
CREATE OR REPLACE PACKAGE emp_pkg AS
    PROCEDURE add_employee (
        p_first_name IN employees.first_name%TYPE,
        p_last_name IN employees.last_name%TYPE,
        p_email IN employees.email%TYPE,
        p_job IN employees.job_id%TYPE DEFAULT 'SA_REP',
        p_mgr IN employees.manager_id%TYPE DEFAULT 145,
        p_sal IN employees.salary%TYPE DEFAULT 1000,
        p_comm IN employees.commission_pct%TYPE DEFAULT 0,
        p_deptid IN employees.department_id%TYPE DEFAULT 30
    );

    PROCEDURE add_employee (
        p_first_name IN employees.first_name%TYPE,
        p_last_name IN employees.last_name%TYPE,
        p_deptid IN employees.department_id%TYPE
    );

    PROCEDURE get_employee (
        p_employee_id IN employees.employee_id%TYPE,
        p_salary OUT employees.salary%TYPE,
        p_job_id OUT employees.job_id%TYPE
    );
END emp_pkg;
```

```sql
CREATE OR REPLACE PACKAGE BODY emp_pkg AS
    FUNCTION valid_deptid (
        p_deptid IN departments.department_id%TYPE
    ) RETURN BOOLEAN AS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM departments
        WHERE department_id = p_deptid;

        RETURN v_count > 0;
    END valid_deptid;

    PROCEDURE add_employee (
        p_first_name IN employees.first_name%TYPE,
        p_last_name IN employees.last_name%TYPE,
        p_email IN employees.email%TYPE,
        p_job IN employees.job_id%TYPE DEFAULT 'SA_REP',
        p_mgr IN employees.manager_id%TYPE DEFAULT 145,
        p_sal IN employees.salary%TYPE DEFAULT 1000,
        p_comm IN employees.commission_pct%TYPE DEFAULT 0,
        p_deptid IN employees.department_id%TYPE DEFAULT 30
    ) AS
        invalid_department EXCEPTION;
    BEGIN
        IF NOT valid_deptid(p_deptid) THEN
            RAISE invalid_department;
        END IF;

        INSERT INTO employees (
            employee_id,
            first_name,
            last_name,
            email,
            hire_date,
            job_id,
            manager_id,
            salary,
            commission_pct,
            department_id
        ) VALUES (
            employees_seq.NEXTVAL,
            p_first_name,
            p_last_name,
            p_email,
            TRUNC(SYSDATE),
            p_job,
            p_mgr,
            p_sal,
            p_comm,
            p_deptid
        );

        DBMS_OUTPUT.PUT_LINE('Employee added: ' || p_first_name || ' ' || p_last_name);
    EXCEPTION
        WHEN invalid_department THEN
            DBMS_OUTPUT.PUT_LINE('Department not found: ' || p_deptid);
    END add_employee;

    PROCEDURE add_employee (
        p_first_name IN employees.first_name%TYPE,
        p_last_name IN employees.last_name%TYPE,
        p_deptid IN employees.department_id%TYPE
    ) AS
        v_email employees.email%TYPE;
    BEGIN
        v_email := UPPER(SUBSTR(p_first_name, 1, 1) || SUBSTR(p_last_name, 1, 7));

        add_employee(
            p_first_name => p_first_name,
            p_last_name => p_last_name,
            p_email => v_email,
            p_deptid => p_deptid
        );
    END add_employee;

    PROCEDURE get_employee (
        p_employee_id IN employees.employee_id%TYPE,
        p_salary OUT employees.salary%TYPE,
        p_job_id OUT employees.job_id%TYPE
    ) AS
    BEGIN
        SELECT
            salary,
            job_id
        INTO
            p_salary,
            p_job_id
        FROM employees
        WHERE employee_id = p_employee_id;
    END get_employee;
END emp_pkg;
```

Add Samuel Joplin to department `30` and check the row.

```sql
BEGIN
    emp_pkg.add_employee('Samuel', 'Joplin', 30);
END;
```

```sql
SELECT
    employee_id,
    first_name,
    last_name,
    email,
    department_id
FROM employees
WHERE email = 'SJOPLIN';
```

## 4. Overload GET_EMPLOYEE and print the results

Replace the specification and body. One function looks up an employee by ID and the other looks up an employee by an exact last name. Both return an `EMPLOYEES%ROWTYPE` record. A last name must match exactly one row for the lookup to succeed.

```sql
CREATE OR REPLACE PACKAGE emp_pkg AS
    PROCEDURE add_employee (
        p_first_name IN employees.first_name%TYPE,
        p_last_name IN employees.last_name%TYPE,
        p_email IN employees.email%TYPE,
        p_job IN employees.job_id%TYPE DEFAULT 'SA_REP',
        p_mgr IN employees.manager_id%TYPE DEFAULT 145,
        p_sal IN employees.salary%TYPE DEFAULT 1000,
        p_comm IN employees.commission_pct%TYPE DEFAULT 0,
        p_deptid IN employees.department_id%TYPE DEFAULT 30
    );

    PROCEDURE add_employee (
        p_first_name IN employees.first_name%TYPE,
        p_last_name IN employees.last_name%TYPE,
        p_deptid IN employees.department_id%TYPE
    );

    PROCEDURE get_employee (
        p_employee_id IN employees.employee_id%TYPE,
        p_salary OUT employees.salary%TYPE,
        p_job_id OUT employees.job_id%TYPE
    );

    FUNCTION get_employee (
        p_emp_id IN employees.employee_id%TYPE
    ) RETURN employees%ROWTYPE;

    FUNCTION get_employee (
        p_family_name IN employees.last_name%TYPE
    ) RETURN employees%ROWTYPE;

    PROCEDURE print_employee (
        p_employee IN employees%ROWTYPE
    );
END emp_pkg;
```

```sql
CREATE OR REPLACE PACKAGE BODY emp_pkg AS
    FUNCTION valid_deptid (
        p_deptid IN departments.department_id%TYPE
    ) RETURN BOOLEAN AS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM departments
        WHERE department_id = p_deptid;

        RETURN v_count > 0;
    END valid_deptid;

    PROCEDURE add_employee (
        p_first_name IN employees.first_name%TYPE,
        p_last_name IN employees.last_name%TYPE,
        p_email IN employees.email%TYPE,
        p_job IN employees.job_id%TYPE DEFAULT 'SA_REP',
        p_mgr IN employees.manager_id%TYPE DEFAULT 145,
        p_sal IN employees.salary%TYPE DEFAULT 1000,
        p_comm IN employees.commission_pct%TYPE DEFAULT 0,
        p_deptid IN employees.department_id%TYPE DEFAULT 30
    ) AS
        invalid_department EXCEPTION;
    BEGIN
        IF NOT valid_deptid(p_deptid) THEN
            RAISE invalid_department;
        END IF;

        INSERT INTO employees (
            employee_id,
            first_name,
            last_name,
            email,
            hire_date,
            job_id,
            manager_id,
            salary,
            commission_pct,
            department_id
        ) VALUES (
            employees_seq.NEXTVAL,
            p_first_name,
            p_last_name,
            p_email,
            TRUNC(SYSDATE),
            p_job,
            p_mgr,
            p_sal,
            p_comm,
            p_deptid
        );

        DBMS_OUTPUT.PUT_LINE('Employee added: ' || p_first_name || ' ' || p_last_name);
    EXCEPTION
        WHEN invalid_department THEN
            DBMS_OUTPUT.PUT_LINE('Department not found: ' || p_deptid);
    END add_employee;

    PROCEDURE add_employee (
        p_first_name IN employees.first_name%TYPE,
        p_last_name IN employees.last_name%TYPE,
        p_deptid IN employees.department_id%TYPE
    ) AS
        v_email employees.email%TYPE;
    BEGIN
        v_email := UPPER(SUBSTR(p_first_name, 1, 1) || SUBSTR(p_last_name, 1, 7));

        add_employee(
            p_first_name => p_first_name,
            p_last_name => p_last_name,
            p_email => v_email,
            p_deptid => p_deptid
        );
    END add_employee;

    PROCEDURE get_employee (
        p_employee_id IN employees.employee_id%TYPE,
        p_salary OUT employees.salary%TYPE,
        p_job_id OUT employees.job_id%TYPE
    ) AS
    BEGIN
        SELECT
            salary,
            job_id
        INTO
            p_salary,
            p_job_id
        FROM employees
        WHERE employee_id = p_employee_id;
    END get_employee;

    FUNCTION get_employee (
        p_emp_id IN employees.employee_id%TYPE
    ) RETURN employees%ROWTYPE AS
        v_employee employees%ROWTYPE;
    BEGIN
        SELECT *
        INTO v_employee
        FROM employees
        WHERE employee_id = p_emp_id;

        RETURN v_employee;
    END get_employee;

    FUNCTION get_employee (
        p_family_name IN employees.last_name%TYPE
    ) RETURN employees%ROWTYPE AS
        v_employee employees%ROWTYPE;
    BEGIN
        SELECT *
        INTO v_employee
        FROM employees
        WHERE last_name = p_family_name;

        RETURN v_employee;
    END get_employee;

    PROCEDURE print_employee (
        p_employee IN employees%ROWTYPE
    ) AS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(
            p_employee.department_id || ' | ' ||
            p_employee.employee_id || ' | ' ||
            p_employee.first_name || ' | ' ||
            p_employee.last_name || ' | ' ||
            p_employee.job_id || ' | ' ||
            p_employee.salary
        );
    END print_employee;
END emp_pkg;
```

Look up employee `100` and the employee with the last name `Joplin`. Print one line for each record.

```sql
DECLARE
    v_employee employees%ROWTYPE;
BEGIN
    v_employee := emp_pkg.get_employee(p_emp_id => 100);
    emp_pkg.print_employee(v_employee);

    v_employee := emp_pkg.get_employee(p_family_name => 'Joplin');
    emp_pkg.print_employee(v_employee);
END;
```
