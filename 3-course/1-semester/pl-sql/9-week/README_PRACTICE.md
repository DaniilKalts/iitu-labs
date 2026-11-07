# Practice 9 — Functions

| Item | Value |
| --- | --- |
| Student | Daniil Kalts |
| Group | it2-2404SE |
| Subject | PL/SQL |
| DBMS | Oracle Database |

## 1. GET_JOB

Create a function that returns a job title for a given job ID.

```sql
CREATE OR REPLACE FUNCTION get_job (
    p_job_id IN jobs.job_id%TYPE
) RETURN jobs.job_title%TYPE AS
    v_job_title jobs.job_title%TYPE;
BEGIN
    SELECT job_title
    INTO v_job_title
    FROM jobs
    WHERE job_id = p_job_id;

    RETURN v_job_title;
END;
```

Call the function for `SA_REP` and print the result:

```sql
BEGIN
    DBMS_OUTPUT.PUT_LINE(get_job('SA_REP'));
END;
```

**Output:** `Sales Representative` in the standard HR sample data.

## 2. GET_ANNUAL_COMP

Create a function that calculates annual pay from monthly salary and commission percentage. `NVL` treats a missing salary or commission as zero.

```sql
CREATE OR REPLACE FUNCTION get_annual_comp (
    p_salary IN employees.salary%TYPE,
    p_commission_pct IN employees.commission_pct%TYPE
) RETURN NUMBER AS
BEGIN
    RETURN NVL(p_salary, 0) * 12 * (1 + NVL(p_commission_pct, 0));
END;
```

Use the function for employees in department `30`:

```sql
SELECT
    employee_id,
    salary,
    commission_pct,
    get_annual_comp(salary, commission_pct) AS annual_comp
FROM employees
WHERE department_id = 30
ORDER BY employee_id;
```

For example, a monthly salary of `1000` with a `NULL` commission returns `12000`. A `NULL` salary returns `0`, even if commission is also `NULL`.

## 3. VALID_DEPTID and ADD_EMPLOYEE

Create a function that checks whether a department exists. Its `BOOLEAN` return value is used in PL/SQL.

```sql
CREATE OR REPLACE FUNCTION valid_deptid (
    p_deptid IN departments.department_id%TYPE
) RETURN BOOLEAN AS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM departments
    WHERE department_id = p_deptid;

    RETURN v_count > 0;
END;
```

Create a procedure that inserts an employee only when the department is valid. The employee ID comes from `EMPLOYEES_SEQ`, and the hire date is the current date without a time component.

```sql
CREATE OR REPLACE PROCEDURE add_employee (
    p_first_name IN employees.first_name%TYPE,
    p_last_name IN employees.last_name%TYPE,
    p_email IN employees.email%TYPE,
    p_job IN employees.job_id%TYPE DEFAULT 'SA_REP',
    p_mgr IN employees.manager_id%TYPE DEFAULT 145,
    p_sal IN employees.salary%TYPE DEFAULT 1000,
    p_comm IN employees.commission_pct%TYPE DEFAULT 0,
    p_deptid IN employees.department_id%TYPE DEFAULT 30
) AS
BEGIN
    IF valid_deptid(p_deptid) THEN
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
    ELSE
        DBMS_OUTPUT.PUT_LINE('Department not found: ' || p_deptid);
    END IF;
END;
```

Call the procedure for Jane Harris in department `15`:

```sql
BEGIN
    add_employee('Jane', 'Harris', 'JHARRIS9', p_deptid => 15);
END;
```

**Output:** `Department not found: 15`. Department `15` is absent from the standard HR sample data, so Jane is not inserted.

Call the procedure for Joe Harris in department `80`:

```sql
BEGIN
    add_employee('Joe', 'Harris', 'JOEHARRIS9', p_deptid => 80);
END;
```

**Output:** `Employee added: Joe Harris`. Department `80` exists in the standard HR sample data, so Joe is inserted with the other optional values set to their defaults. Check the inserted row:

```sql
SELECT
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
FROM employees
WHERE email = 'JOEHARRIS9';
```
