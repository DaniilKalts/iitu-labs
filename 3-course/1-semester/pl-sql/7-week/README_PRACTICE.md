# Practice 7 — Exceptions

| Item | Value |
| --- | --- |
| Student | Daniil Kalts |
| Group | it2-2404SE |
| Subject | PL/SQL |
| DBMS | Oracle Database |

Use the Oracle HR `employees` and `departments` tables. Run each block separately with DBMS Output enabled.

## 1. Employee with a given salary

Create this table once:

```sql
CREATE TABLE messages (
    results VARCHAR2(50)
);
```

Before each run, empty the table:

```sql
DELETE FROM messages;
COMMIT;
```

```sql
DECLARE
    ename employees.last_name%TYPE;
    emp_sal employees.salary%TYPE := 24000;
BEGIN
    SELECT last_name
    INTO ename
    FROM employees
    WHERE salary = emp_sal;

    INSERT INTO messages (results)
    VALUES (ename || ' earns ' || TO_CHAR(emp_sal));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        INSERT INTO messages (results)
        VALUES ('No employee with a salary of ' || TO_CHAR(emp_sal) || '.');
    WHEN TOO_MANY_ROWS THEN
        INSERT INTO messages (results)
        VALUES ('More than one employee with a salary of ' || TO_CHAR(emp_sal) || '.');
    WHEN OTHERS THEN
        INSERT INTO messages (results)
        VALUES ('Some other error occurred.');
END;
```

View the result:

```sql
COMMIT;
SELECT results FROM messages;
```

## 2. Handle ORA-02292

```sql
DECLARE
    childrecord_exists EXCEPTION;
    PRAGMA EXCEPTION_INIT(childrecord_exists, -2292);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Deleting department 40.....');

    DELETE FROM departments
    WHERE department_id = 40;

    DBMS_OUTPUT.PUT_LINE('Department 40 was deleted.');
EXCEPTION
    WHEN childrecord_exists THEN
        DBMS_OUTPUT.PUT_LINE('Department 40 cannot be deleted because child records exist.');
END;
```

## 3. Handle a user-defined exception

```sql
DECLARE
    invalid_salary EXCEPTION;
    emp_sal employees.salary%TYPE := -100;
BEGIN
    IF emp_sal < 0 THEN
        RAISE invalid_salary;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Salary is valid: ' || TO_CHAR(emp_sal));
EXCEPTION
    WHEN invalid_salary THEN
        DBMS_OUTPUT.PUT_LINE('Salary cannot be negative.');
END;
```
