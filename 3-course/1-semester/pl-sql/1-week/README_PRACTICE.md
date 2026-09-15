# Practice 1. Review SQL

**Name:** Daniil Kalts  
**Group:** IT2-2404SE

These are my solutions for the Oracle HR schema exercises.

## 1. Task

The HR department needs a query to display all unique job codes from the `EMPLOYEES` table.

**Query:**

```sql
SELECT DISTINCT e.job_id
FROM hr.employees e;
```

**Output:**

| JOB_ID |
| --- |
| AC_ACCOUNT |
| AC_MGR |
| AD_ASST |
| AD_PRES |
| AD_VP |

## 2. Task

The HR department wants more descriptive column headings for its report on employees. Name the column headings `Emp #`, `Employee`, `Job`, and `Hire Date`, respectively.

**Query:**

```sql
SELECT e.employee_id AS "Emp #",
       e.last_name AS Employee,
       e.job_id AS Job,
       TO_CHAR(e.hire_date, 'DD-MON-YY') AS "Hire Date"
FROM hr.employees e;
```

**Output:**

| Emp # | Employee | Job | Hire Date |
| ---: | --- | --- | --- |
| 100 | King | AD_PRES | 17-JUN-13 |
| 101 | Yang | AD_VP | 21-SEP-15 |
| 102 | Garcia | AD_VP | 13-JAN-11 |
| 103 | James | IT_PROG | 03-JAN-16 |
| 104 | Miller | IT_PROG | 21-MAY-17 |

## 3. Task

The HR department has requested a report of all employees and their job IDs. Display the last name concatenated with the job ID, separated by a comma and a space, and name the column `Employee and Title`.

**Query:**

```sql
SELECT e.last_name || ', ' || e.job_id AS "Employee and Title"
FROM hr.employees e;
```

**Output:**

| Employee and Title |
| --- |
| Abel, SA_REP |
| Ande, SA_REP |
| Atkinson, ST_CLERK |
| Baida, PU_CLERK |
| Banda, SA_REP |

## 4. Task

The HR department needs to find high-salary and low-salary employees. Display the last name and salary for any employee whose salary is not in the range of $5,000 to $12,000.

**Query:**

```sql
SELECT e.last_name,
       e.salary
FROM hr.employees e
WHERE e.salary NOT BETWEEN 5000 AND 12000;
```

**Output:**

| LAST_NAME | SALARY |
| --- | ---: |
| King | 24000 |
| Yang | 17000 |
| Garcia | 17000 |
| Williams | 4800 |
| Jackson | 4800 |

## 5. Task

Create a report to display the last name, job ID, and start date for employees with the last names `Matos` and `Taylor`. Order the query in ascending order by start date.

**Query:**

```sql
SELECT e.last_name,
       e.job_id,
       TO_CHAR(e.hire_date, 'DD-MON-YY') AS start_date
FROM hr.employees e
WHERE e.last_name IN ('Matos', 'Taylor')
ORDER BY e.hire_date ASC;
```

**Output:**

| LAST_NAME | JOB_ID | START_DATE |
| --- | --- | --- |
| Taylor | SH_CLERK | 24-JAN-16 |
| Matos | ST_CLERK | 15-MAR-16 |
| Taylor | SA_REP | 24-MAR-16 |

## 6. Task

Display the last names and salaries of employees who earn between $5,000 and $12,000 and are in department 20 or 50. Label the columns `Employee` and `Monthly Salary`, respectively.

**Query:**

```sql
SELECT e.last_name AS Employee,
       e.salary AS "Monthly Salary"
FROM hr.employees e
WHERE e.salary BETWEEN 5000 AND 12000
  AND e.department_id IN (20, 50);
```

**Output:**

| Employee | Monthly Salary |
| --- | ---: |
| Nayer | 8000 |
| Fripp | 8200 |
| Kaufling | 7900 |
| Vollman | 6500 |
| Mourgos | 5800 |

## 7. Task

Display the last names of all employees who have both an `a` and an `e` in their last name.

**Query:**

```sql
SELECT e.last_name
FROM hr.employees e
WHERE LOWER(e.last_name) LIKE '%a%'
  AND LOWER(e.last_name) LIKE '%e%';
```

**Output:**

| LAST_NAME |
| --- |
| Abel |
| Ande |
| Bates |
| Colmenares |
| Davies |

## 8. Task

Display the last name, job, and salary for all employees whose jobs are either sales representative or stock clerk and whose salaries are not equal to $2,500, $3,500, or $7,000.

**Query:**

```sql
SELECT e.last_name,
       e.job_id,
       e.salary
FROM hr.employees e
WHERE e.job_id IN ('SA_REP', 'ST_CLERK')
  AND e.salary NOT IN (2500, 3500, 7000);
```

**Output:**

| LAST_NAME | JOB_ID | SALARY |
| --- | --- | ---: |
| Nayer | ST_CLERK | 3200 |
| Mikkilineni | ST_CLERK | 2700 |
| Landry | ST_CLERK | 2400 |
| Markle | ST_CLERK | 2200 |
| Bissot | ST_CLERK | 3300 |

## 9. Task

Display the last name with the first letter uppercase and all other letters lowercase, together with the length of the last name, for employees whose names start with `J`, `A`, or `M`. Give each column an appropriate label and sort by last name.

**Query:**

```sql
SELECT INITCAP(LOWER(e.last_name)) AS Name,
       LENGTH(e.last_name) AS Length
FROM hr.employees e
WHERE UPPER(e.last_name) LIKE 'J%'
   OR UPPER(e.last_name) LIKE 'A%'
   OR UPPER(e.last_name) LIKE 'M%'
ORDER BY e.last_name;
```

**Output:**

| NAME | LENGTH |
| --- | ---: |
| Abel | 4 |
| Ande | 4 |
| Atkinson | 8 |
| Jackson | 7 |
| Jacobs | 6 |

## 10. Task

Create a report that produces the following for each employee: `<employee last name> earns <salary> monthly but wants <3 times salary>`. Label the column `Dream Salaries`.

**Query:**

```sql
SELECT e.last_name
       || ' earns '
       || TO_CHAR(e.salary, 'FM$999,999,990')
       || ' monthly but wants '
       || TO_CHAR(e.salary * 3, 'FM$999,999,990') AS "Dream Salaries"
FROM hr.employees e;
```

**Output:**

| DREAM SALARIES |
| --- |
| King earns $24,000 monthly but wants $72,000 |
| Yang earns $17,000 monthly but wants $51,000 |
| Garcia earns $17,000 monthly but wants $51,000 |
| James earns $9,000 monthly but wants $27,000 |
| Miller earns $6,000 monthly but wants $18,000 |

## 11. Task

Display the last name, hire date, and day of the week on which the employee started. Label the day column `DAY`. Order the results by the day of the week, starting with Monday.

**Query:**

```sql
SELECT e.last_name,
       e.hire_date,
       TO_CHAR(e.hire_date, 'FMDay', 'NLS_DATE_LANGUAGE=English') AS DAY
FROM hr.employees e
ORDER BY e.hire_date - TRUNC(e.hire_date, 'IW');
```

**Output:**

| LAST_NAME | HIRE_DATE | DAY |
| --- | --- | --- |
| King | 6/17/2013, 12:00:00 | Monday |
| Davis | 8/17/2015, 12:00:00 | Monday |
| Yang | 9/21/2015, 12:00:00 | Monday |
| Martinez | 2/17/2014, 12:00:00 | Monday |
| Feeney | 5/23/2016, 12:00:01 | Monday |

## 12. Task

Display the minimum, maximum, sum, and average salary for each job type.

**Query:**

```sql
SELECT e.job_id,
       MIN(e.salary) AS minimum_salary,
       MAX(e.salary) AS maximum_salary,
       SUM(e.salary) AS sum_salary,
       ROUND(AVG(e.salary), 2) AS average_salary
FROM hr.employees e
GROUP BY e.job_id
ORDER BY e.job_id;
```

**Output:**

| JOB_ID | MINIMUM_SALARY | MAXIMUM_SALARY | SUM_SALARY | AVERAGE_SALARY |
| --- | ---: | ---: | ---: | ---: |
| AC_ACCOUNT | 8300 | 8300 | 8300 | 8300 |
| AC_MGR | 12008 | 12008 | 12008 | 12008 |
| AD_ASST | 4400 | 4400 | 4400 | 4400 |
| AD_PRES | 24000 | 24000 | 24000 | 24000 |
| AD_VP | 17000 | 17000 | 34000 | 17000 |

## 13. Task

Create a report to display the manager number and the salary of the lowest-paid employee for that manager. Exclude employees whose manager is not known. Exclude groups where the minimum salary is $6,000 or less. Sort the output in descending order of salary.

**Query:**

```sql
SELECT e.manager_id,
       MIN(e.salary) AS lowest_salary
FROM hr.employees e
WHERE e.manager_id IS NOT NULL
GROUP BY e.manager_id
HAVING MIN(e.salary) > 6000
ORDER BY lowest_salary DESC;
```

**Output:**

| MANAGER_ID | LOWEST_SALARY |
| ---: | ---: |
| 102 | 9000 |
| 205 | 8300 |
| 145 | 7000 |
| 146 | 7000 |
| 108 | 6900 |

## 14. Task

The HR department needs a report of all employees. Display the last name, department number, and department name for all employees.

**Query:**

```sql
SELECT e.last_name,
       e.department_id,
       d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d ON d.department_id = e.department_id
ORDER BY e.last_name;
```

**Output:**

The screenshot for this task displays the previous query's result instead of the result of the Task 14 query. The visible table is therefore not included as Task 14 output.

Visible in the screenshot:

| MANAGER_ID | LOWEST_SALARY |
| ---: | ---: |
| 102 | 9000 |
| 205 | 8300 |
| 145 | 7000 |
| 146 | 7000 |
| 108 | 6900 |

## 15. Task

Create a report of employees in Toronto. Display the last name, job, department number, and department name.

**Query:**

```sql
SELECT e.last_name,
       e.job_id,
       d.department_id,
       d.department_name
FROM hr.employees e
JOIN hr.departments d ON d.department_id = e.department_id
JOIN hr.locations l ON l.location_id = d.location_id
WHERE l.city = 'Toronto'
ORDER BY e.last_name;
```

**Output:**

| LAST_NAME | JOB_ID | DEPARTMENT_ID | DEPARTMENT_NAME |
| --- | --- | ---: | --- |
| Davis | MK_REP | 20 | Marketing |
| Martinez | MK_MAN | 20 | Marketing |

## 16. Task

Create a report to display each employee's last name and employee number together with their manager's last name and manager number. Label the columns `Employee`, `Emp#`, `Manager`, and `Mgr#`, respectively.

**Query:**

```sql
SELECT e.last_name AS Employee,
       e.employee_id AS "Emp#",
       m.last_name AS Manager,
       m.employee_id AS "Mgr#"
FROM hr.employees e
LEFT JOIN hr.employees m ON m.employee_id = e.manager_id
ORDER BY e.employee_id;
```

**Output:**

| Employee | Emp# | Manager | Mgr# |
| --- | ---: | --- | ---: |
| King | 100 | NULL | NULL |
| Yang | 101 | King | 100 |
| Garcia | 102 | King | 100 |
| James | 103 | Garcia | 102 |
| Miller | 104 | James | 103 |

## 17. Task

Prompt the user for an employee last name. Display the last name and hire date of every employee in the same department as that employee, excluding the supplied employee.

**Query:**

```sql
SELECT e.last_name,
       e.hire_date
FROM hr.employees e
WHERE e.department_id IN (SELECT e2.department_id
                          FROM hr.employees e2
                          WHERE UPPER(e2.last_name) = UPPER('&last_name'))
  AND UPPER(e.last_name) <> UPPER('&last_name')
ORDER BY e.last_name;
```

**Output:**

The screenshot shows the result after entering `Zlotkey`.

| LAST_NAME | HIRE_DATE |
| --- | --- |
| Abel | 5/11/2014, 12:00:00 |
| Ande | 3/24/2018, 12:00:00 |
| Banda | 4/21/2018, 12:00:01 |
| Bates | 3/24/2017, 12:00:00 |
| Bernstein | 3/24/2015, 12:00:00 |

## 18. Task

Display the employee number, last name, and salary of all employees who earn more than the average salary. Sort the results in ascending order of salary.

**Query:**

```sql
SELECT e.employee_id,
       e.last_name,
       e.salary
FROM hr.employees e
WHERE e.salary > (SELECT AVG(e2.salary)
                  FROM hr.employees e2)
ORDER BY e.salary ASC;
```

**Output:**

| EMPLOYEE_ID | LAST_NAME | SALARY |
| ---: | --- | ---: |
| 203 | Jacobs | 6500 |
| 123 | Vollman | 6500 |
| 165 | Lee | 6800 |
| 113 | Popp | 6900 |
| 155 | Tuvault | 7000 |

## 19. Task

The HR department needs a report that displays the last name, department number, and job ID of all employees whose department location ID is 1700.

**Query:**

```sql
SELECT e.last_name,
       e.department_id,
       e.job_id
FROM hr.employees e
JOIN hr.departments d ON d.department_id = e.department_id
WHERE d.location_id = 1700
ORDER BY e.last_name;
```

**Output:**

| LAST_NAME | DEPARTMENT_ID | JOB_ID |
| --- | ---: | --- |
| Baida | 30 | PU_CLERK |
| Chen | 100 | FI_ACCOUNT |
| Colmenares | 30 | PU_CLERK |
| Faviet | 100 | FI_ACCOUNT |
| Garcia | 90 | AD_VP |
