# Practice 8 — Procedures

| Item | Value |
| --- | --- |
| Student | Daniil Kalts |
| Group | it2-2404SE |
| Subject | PL/SQL |
| DBMS | Oracle Database |

## 1. ADD_JOB

Create a procedure that inserts a job using its ID and title.

```sql
CREATE OR REPLACE PROCEDURE add_job (
    p_job_id IN jobs.job_id%TYPE,
    p_job_title IN jobs.job_title%TYPE
) AS
BEGIN
    INSERT INTO jobs (job_id, job_title)
    VALUES (p_job_id, p_job_title);
END;
```

Add the Database Administrator job and check the row:

```sql
BEGIN
    add_job('IT_DBA', 'Database Administrator');
END;
```

```sql
SELECT job_id, job_title
FROM jobs
WHERE job_id = 'IT_DBA';
```

Try adding Stock Manager:

```sql
BEGIN
    add_job('ST_MAN', 'Stock Manager');
END;
```

`ST_MAN` already exists in the HR sample data. The insert raises `ORA-00001` because `JOB_ID` is the primary key. Repeating the `IT_DBA` call after a successful insert raises the same error.

## 2. UPD_JOB

Create a procedure that changes the job title. `SQL%ROWCOUNT` checks whether the update found a row.

```sql
CREATE OR REPLACE PROCEDURE upd_job (
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
END;
```

Update the new job and check it:

```sql
BEGIN
    upd_job('IT_DBA', 'Data Administrator');
END;
```

```sql
SELECT job_id, job_title
FROM jobs
WHERE job_id = 'IT_DBA';
```

Test a missing job:

```sql
BEGIN
    upd_job('IT_WEB', 'Web Master');
END;
```

**Output:** `Job not found: IT_WEB` (provided `IT_WEB` does not exist).

## 3. DEL_JOB

Create a procedure that deletes a job. `SQL%ROWCOUNT` checks whether a row was deleted.

```sql
CREATE OR REPLACE PROCEDURE del_job (
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
END;
```

Delete the job created in task 1 and check the table:

```sql
BEGIN
    del_job('IT_DBA');
END;
```

```sql
SELECT job_id, job_title
FROM jobs
WHERE job_id = 'IT_DBA';
```

The query returns no rows. Test the missing job:

```sql
BEGIN
    del_job('IT_WEB');
END;
```

**Output:** `Job not found: IT_WEB` (provided `IT_WEB` does not exist).

## 4. GET_EMPLOYEE

Create a procedure that returns an employee's salary and job ID through `OUT` parameters.

```sql
CREATE OR REPLACE PROCEDURE get_employee (
    p_employee_id IN employees.employee_id%TYPE,
    p_salary OUT employees.salary%TYPE,
    p_job_id OUT employees.job_id%TYPE
) AS
BEGIN
    SELECT salary, job_id
    INTO p_salary, p_job_id
    FROM employees
    WHERE employee_id = p_employee_id;
END;
```

Call it for employee `120` and display the values:

```sql
DECLARE
    employee_salary employees.salary%TYPE;
    employee_job_id employees.job_id%TYPE;
BEGIN
    get_employee(120, employee_salary, employee_job_id);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || employee_salary);
    DBMS_OUTPUT.PUT_LINE('Job ID: ' || employee_job_id);
END;
```

The block prints the salary and job ID stored for employee `120` in your HR data.

Call it for employee `300`:

```sql
DECLARE
    employee_salary employees.salary%TYPE;
    employee_job_id employees.job_id%TYPE;
BEGIN
    get_employee(300, employee_salary, employee_job_id);
END;
```

If employee `300` does not exist, `SELECT INTO` raises `NO_DATA_FOUND` (`ORA-01403`). The procedure has no handler, so the error reaches the calling block.
