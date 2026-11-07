# Practice 6 — Cursors

| Item | Value |
| --- | --- |
| Student | Daniil Kalts |
| Group | it2-2404SE |
| Subject | PL/SQL |
| DBMS | Oracle Database |

Use the Oracle HR `employees` and `departments` tables. Run each block separately with DBMS Output enabled.

## 1. Top n salaries

Create this table once:

```sql
CREATE TABLE top_salaries (
    salary NUMBER(8, 2)
);
```

```sql
DECLARE
    n NUMBER := 5;
    sal employees.salary%TYPE;

    CURSOR emp_cursor IS
        SELECT DISTINCT salary
        FROM employees
        ORDER BY salary DESC;
BEGIN
    OPEN emp_cursor;

    LOOP
        EXIT WHEN emp_cursor%ROWCOUNT >= n;
        FETCH emp_cursor INTO sal;
        EXIT WHEN NOT emp_cursor%FOUND;

        INSERT INTO top_salaries (salary) VALUES (sal);
    END LOOP;

    CLOSE emp_cursor;
END;
```

View the result, then empty the table:

```sql
SELECT salary FROM top_salaries ORDER BY salary DESC;
```

```sql
DELETE FROM top_salaries;
COMMIT;
```

Run the block three times, changing `n` to `5`, `0`, and `1000`. View and empty the table after each run.

## 2. Employees in department 60 with salary over 5000

```sql
DECLARE
    CURSOR emp_cursor IS
        SELECT last_name, salary
        FROM employees
        WHERE department_id = 60 AND salary > 5000;

    employee emp_cursor%ROWTYPE;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO employee;
        EXIT WHEN emp_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(employee.last_name || ': ' || employee.salary);
    END LOOP;

    CLOSE emp_cursor;
END;
```

## 3. Task 2 with a cursor FOR loop

```sql
DECLARE
    CURSOR emp_cursor IS
        SELECT last_name, salary
        FROM employees
        WHERE department_id = 60 AND salary > 5000;
BEGIN
    FOR employee IN emp_cursor LOOP
        DBMS_OUTPUT.PUT_LINE(employee.last_name || ': ' || employee.salary);
    END LOOP;
END;
```

## 4. Employees due for a raise

```sql
DECLARE
    deptno departments.department_id%TYPE := 10;

    CURSOR emp_cursor IS
        SELECT last_name, salary, manager_id
        FROM employees
        WHERE department_id = deptno;
BEGIN
    FOR employee IN emp_cursor LOOP
        IF employee.salary < 5000 AND employee.manager_id IN (101, 124) THEN
            DBMS_OUTPUT.PUT_LINE(employee.last_name || ' Due for a raise');
        ELSE
            DBMS_OUTPUT.PUT_LINE(employee.last_name || ' Not due for a raise');
        END IF;
    END LOOP;
END;
```

Run it with `deptno` set to `10`, `20`, `50`, and `80`.

## 5. Departments and their employees

```sql
DECLARE
    CURSOR dept_cursor IS
        SELECT department_id, department_name
        FROM departments
        WHERE department_id < 100
        ORDER BY department_id;

    CURSOR emp_cursor(deptno departments.department_id%TYPE) IS
        SELECT last_name, job_id, hire_date, salary
        FROM employees
        WHERE department_id = deptno AND employee_id < 120;

    dept_id departments.department_id%TYPE;
    dept_name departments.department_name%TYPE;
    emp_name employees.last_name%TYPE;
    emp_job employees.job_id%TYPE;
    emp_date employees.hire_date%TYPE;
    emp_salary employees.salary%TYPE;
BEGIN
    OPEN dept_cursor;

    LOOP
        FETCH dept_cursor INTO dept_id, dept_name;
        EXIT WHEN dept_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Department Number: ' || dept_id ||
                             ' Department Name: ' || dept_name);

        IF NOT emp_cursor%ISOPEN THEN
            OPEN emp_cursor(dept_id);
        END IF;

        LOOP
            FETCH emp_cursor INTO emp_name, emp_job, emp_date, emp_salary;
            EXIT WHEN emp_cursor%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE(emp_name || ' ' || emp_job || ' ' ||
                                 TO_CHAR(emp_date, 'DD-MON-YY') || ' ' || emp_salary);
        END LOOP;

        CLOSE emp_cursor;
        DBMS_OUTPUT.PUT_LINE('------------------------------');
    END LOOP;

    CLOSE dept_cursor;
END;
```
