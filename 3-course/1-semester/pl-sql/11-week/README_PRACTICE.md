# Practice 11 — Triggers. Part 1

| Item | Value |
| --- | --- |
| Student | Daniil Kalts |
| Group | it2-2404SE |
| Subject | PL/SQL |
| DBMS | Oracle Database |

Use the Oracle HR schema and enable DBMS Output. Run each SQL block separately in the order shown. Each task ends by dropping its trigger, so the triggers do not interfere with one another. The examples assume department `280` is unused.

## 0. Prepare test data

Create a test department with two employees. They have no subordinates and no job history, so they can be deleted safely.

```sql
INSERT INTO departments (
    department_id,
    department_name,
    location_id
) VALUES (
    280,
    'Trigger Test',
    1700
);
```

```sql
INSERT INTO employees (
    employee_id,
    first_name,
    last_name,
    email,
    hire_date,
    job_id,
    salary,
    department_id
) VALUES (
    employees_seq.NEXTVAL,
    'Test',
    'One',
    'TESTONE',
    TRUNC(SYSDATE),
    'IT_PROG',
    5000,
    280
);
```

```sql
INSERT INTO employees (
    employee_id,
    first_name,
    last_name,
    email,
    hire_date,
    job_id,
    salary,
    department_id
) VALUES (
    employees_seq.NEXTVAL,
    'Test',
    'Two',
    'TESTTWO',
    TRUNC(SYSDATE),
    'IT_PROG',
    5000,
    280
);
```

## 1. Delete employees after a department is deleted

```sql
CREATE OR REPLACE TRIGGER trg_dept_delete_emps
AFTER DELETE ON departments
FOR EACH ROW
BEGIN
    DELETE FROM employees
    WHERE department_id = :OLD.department_id;
END;
```

The HR foreign key `EMP_DEPT_FK` rejects the parent delete before an `AFTER` row trigger runs. Disable it for the test.

```sql
ALTER TABLE employees DISABLE CONSTRAINT emp_dept_fk;
```

```sql
DELETE FROM departments
WHERE department_id = 280;
```

The query returns no rows: the trigger deleted the employees of department `280`.

```sql
SELECT
    employee_id,
    last_name,
    department_id
FROM employees
WHERE department_id = 280;
```

Undo the test, enable the constraint again, and drop the trigger.

```sql
ROLLBACK;
```

```sql
ALTER TABLE employees ENABLE CONSTRAINT emp_dept_fk;
```

```sql
DROP TRIGGER trg_dept_delete_emps;
```

## 2. Check the SA_REP salary before insert

```sql
CREATE OR REPLACE TRIGGER trg_emp_check_sa_rep_salary
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF :NEW.job_id = 'SA_REP'
        AND :NEW.salary NOT BETWEEN 2000 AND 7000 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Salary for SA_REP must be between 2000 and 7000'
        );
    END IF;
END;
```

This insert fails with `ORA-20001`.

```sql
INSERT INTO employees (
    employee_id,
    first_name,
    last_name,
    email,
    hire_date,
    job_id,
    salary,
    department_id
) VALUES (
    employees_seq.NEXTVAL,
    'Sales',
    'Rep',
    'SALESREP',
    TRUNC(SYSDATE),
    'SA_REP',
    9000,
    80
);
```

```sql
DROP TRIGGER trg_emp_check_sa_rep_salary;
```

## 3. Report an inserted employee

```sql
CREATE OR REPLACE TRIGGER trg_emp_after_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('The employee with id ' || :NEW.employee_id || ' is inserted');
END;
```

```sql
INSERT INTO employees (
    employee_id,
    first_name,
    last_name,
    email,
    hire_date,
    job_id,
    salary,
    department_id
) VALUES (
    employees_seq.NEXTVAL,
    'Test',
    'Three',
    'TESTTHREE',
    TRUNC(SYSDATE),
    'IT_PROG',
    5000,
    280
);
```

```sql
ROLLBACK;
```

```sql
DROP TRIGGER trg_emp_after_insert;
```

## 4. Block deleting a department with employees

```sql
CREATE OR REPLACE TRIGGER trg_dept_check_children
BEFORE DELETE ON departments
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM employees
    WHERE department_id = :OLD.department_id;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Department ' || :OLD.department_id || ' has ' || v_count || ' employees'
        );
    END IF;
END;
```

This delete fails with `ORA-20002`.

```sql
DELETE FROM departments
WHERE department_id = 280;
```

```sql
DROP TRIGGER trg_dept_check_children;
```

## 5. Block an unchanged salary update

```sql
CREATE OR REPLACE TRIGGER trg_emp_check_salary_change
BEFORE UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
    IF :NEW.salary = :OLD.salary THEN
        RAISE_APPLICATION_ERROR(
            -20003,
            'New salary equals old salary for employee ' || :OLD.employee_id
        );
    END IF;
END;
```

This update fails with `ORA-20003`.

```sql
UPDATE employees
SET salary = salary
WHERE employee_id = 100;
```

```sql
DROP TRIGGER trg_emp_check_salary_change;
```

## 6. Report each DML operation

```sql
CREATE OR REPLACE TRIGGER trg_emp_before_dml
BEFORE INSERT OR UPDATE OR DELETE ON employees
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('The employee with id ' || :NEW.employee_id || ' is inserted');
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('The employee with id ' || :OLD.employee_id || ' is updated');
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('The employee with id ' || :OLD.employee_id || ' is deleted');
    END IF;
END;
```

Update and delete the test employees. One line appears for each row.

```sql
UPDATE employees
SET salary = salary + 100
WHERE department_id = 280;
```

```sql
DELETE FROM employees
WHERE department_id = 280;
```

```sql
DROP TRIGGER trg_emp_before_dml;
```

## 7. Clean up

```sql
DELETE FROM employees
WHERE department_id = 280;
```

```sql
DELETE FROM departments
WHERE department_id = 280;
```

```sql
COMMIT;
```
