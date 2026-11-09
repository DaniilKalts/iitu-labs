# Practice 6. Cursors

Daniil Kalts  
Group: it2-2404SE

Use the `employees` and `departments` tables. Run each PL/SQL block separately and check DBMS Output.


## 1. Top n salaries

Create `top_salaries` with one `salary NUMBER(8, 2)` column. Declare `n`, a salary variable based on `employees.salary`, and `emp_cursor` to retrieve distinct salaries in descending order. Use `OPEN`, `FETCH`, and `CLOSE` to insert the top `n` salaries into the table. Use `%ROWCOUNT` and `%FOUND` in the exit logic. Display the table contents with a `SELECT`. Test `n = 0`, `n = 5`, and `n` greater than the number of salaries; empty the table after each test.

```sql
-- Table definition
```

```sql
-- PL/SQL block
```

```sql
-- SELECT and cleanup statements
```

## 2. Explicit cursor

Display employees from department 60 whose salary is greater than 5000.

```sql
-- Your solution
```

## 3. Cursor FOR loop

Rewrite task 2 with a cursor `FOR` loop.

```sql
-- Your solution
```

## 4. Employees due for a raise

Declare `deptno` and a cursor that retrieves `last_name`, `salary`, and `manager_id` for that department. With a cursor `FOR` loop, print `Due for a raise` when salary is below 5000 and manager ID is 101 or 124. Otherwise print `Not due for a raise`. Test the block with different department IDs.

```sql
-- Your solution
```

## 5. Parameterized cursors

Declare `dept_cursor` for departments with `department_id < 100`, ordered by ID. Declare `emp_cursor` with a department ID parameter to retrieve `last_name`, `job_id`, `hire_date`, and `salary` for employees with `employee_id < 120` in that department. Use `%TYPE` variables, nested explicit cursor loops, suitable exit attributes, and an open check before opening a cursor. Print each department and its employees, then close the cursors.

```sql
-- Your solution
```

