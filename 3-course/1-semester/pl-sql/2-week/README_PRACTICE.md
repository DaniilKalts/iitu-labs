# Practice 2 — Variables and Statements

| Item | Value |
| --- | --- |
| Student | Daniil Kalts |
| Group | it2-2404SE |
| Subject | PL/SQL |
| DBMS | Oracle Database |

## 1. Which PL/SQL blocks run without errors?

### a.

```sql
BEGIN
END;
```

- [ ] Correct
- [x] Incorrect

**Explanation:** The execution block can't be empty.

### b.

```sql
DECLARE
    amount INTEGER(10);
END;
```

- [ ] Correct
- [x] Incorrect

**Explanation:** A PL/SQL block must have `BEGIN` and `END` sections. Also, `INTEGER` doesn't accept a size.

### c.

```sql
DECLARE
BEGIN
END;
```

- [ ] Correct
- [x] Incorrect

**Explanation:** The execution block can't be empty.

### d.

```sql
DECLARE
    amount INTEGER(10);
BEGIN
    DBMS_OUTPUT.PUT_LINE(amount);
END;
```

- [ ] Correct
- [x] Incorrect

**Explanation:** `INTEGER` doesn't accept a size.

## 2. Write and run an anonymous block that prints “Hello World.”

```sql
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
END;
```

## 3. Which declarations are correct? Explain why the others are incorrect.

### a.

```sql
DECLARE
    name,dept VARCHAR2(14);
```

- [ ] Correct
- [x] Incorrect

**Explanation:** Can't create multiple variables in a single line.

### b.

```sql
DECLARE
    test NUMBER(5);
```

- [x] Correct
- [ ] Incorrect

**Explanation:** The canonical order: variable name, data type. Number accepts a parameter for precision.

### c.

```sql
DECLARE
    MAXSALARY NUMBER(7,2) = 5000;
```

- [ ] Correct
- [x] Incorrect

**Explanation:** Assign operator in PL/SQL is `:=`.

### d.

```sql
DECLARE
    JOINDATE BOOLEAN := SYSDATE;
```

- [ ] Correct
- [x] Incorrect

**Explanation:** `SYSDATE` returns date, which is not compatible with `BOOLEAN` data types

## 4. What is the data type of the expression on the right side of each assignment?

### a.

```sql
email := firstname || to_char(empno);
```

**Type:** VARCHAR2

### b.

```sql
confirm := to_date('20-JAN-1999', 'DD-MON-YYYY');
```

**Type:** DATE

### c.

```sql
sal := (1000*12) + 500
```

**Type:** NUMBER

### d.

```sql
test := FALSE;
```

**Type:** BOOLEAN

### e.

```sql
temp := temp1 < (temp2/3);
```

**Type:** BOOLEAN

### f.

```sql
var := sysdate;
```

**Type:** DATE

## 5. Which variable names are correct?

### a.

```sql
today
```

- [x] Correct
- [ ] Incorrect

### b.

```sql
last_name
```

- [x] Correct
- [ ] Incorrect

### c.

```sql
today’s_date
```

- [ ] Correct
- [x] Incorrect

**Explanation:** Can't use `'` in variable names.

### d.

```sql
Number_of_days_in_February_this_year
```

- [x] Correct
- [ ] Incorrect

### e.

```sql
Isleap$year
```

- [x] Correct
- [ ] Incorrect

### f.

```sql
#number
```

- [ ] Correct
- [x] Incorrect

**Explanation:** Can't use `#` character in the beginning of variable names.

### g.

```sql
NUMBER#
```

- [x] Correct
- [ ] Incorrect

### h.

```sql
number1to7
```

- [x] Correct
- [ ] Incorrect

## 6. Which variable declarations and starting values are correct?

### a.

```sql
number_of_copies PLS_INTEGER;
```

- [x] Correct
- [ ] Incorrect

### b.

```sql
printer_name constant VARCHAR2(10);
```

- [ ] Correct
- [x] Incorrect

**Explanation:** A constant must have a value.

### c.

```sql
deliver_to VARCHAR2(10):=Johnson;
```

- [ ] Correct
- [x] Incorrect

**Explanation:** The `Johnson` isn't written inside single quotes.

### d.

```sql
by_when DATE:= SYSDATE+1;
```

- [x] Correct
- [ ] Incorrect

## 7. Read the block and choose the correct statement.

```sql
DECLARE
    fname VARCHAR2(20);
    lname VARCHAR2(15) DEFAULT 'fernandez';
BEGIN
    DBMS_OUTPUT.PUT_LINE( FNAME ||' ' ||lname);
END;
/
```

- [x] The block runs and prints ‘fernandez’ (with a space before the last name).
- [ ] The block gives an error because `fname` has no starting value.
- [ ] The block runs and prints ‘null fernandez’.
- [ ] The block gives an error because `DEFAULT` cannot set the starting value of a `VARCHAR2` variable.
- [ ] The block gives an error because `FNAME` is not declared.

## 8. Print today and tomorrow

Write an anonymous block. Declare `today` as `DATE` and set it to `SYSDATE`. Declare `tomorrow` using `today%TYPE`. In the `BEGIN` section, set `tomorrow` to `today + 1`. Print “Hello World”, then both dates.

```sql
DECLARE
    today DATE := SYSDATE;
    tomorrow today%TYPE;
BEGIN
    tomorrow := today + 1;
    DBMS_OUTPUT.PUT_LINE('Hello World');
    DBMS_OUTPUT.PUT_LINE('Today: ' || TO_CHAR(today, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Tomorrow: ' || TO_CHAR(tomorrow, 'YYYY-MM-DD'));
END;
```

## 9. Find each variable’s type and value at positions 1 and 2

```sql
DECLARE
    weight NUMBER(3) := 600;
    message VARCHAR2(255) := 'Product 10012';
BEGIN
    DECLARE
        weight NUMBER(3) := 1;
        message VARCHAR2(255) := 'Product 11001';
        new_locn VARCHAR2(50) := 'Europe';
    BEGIN
        weight := weight + 1;
        new_locn := 'Western ' || new_locn;
    END;
    weight := weight + 1;
    message := message || ' is in stock';
    new_locn := 'Western ' || new_locn;
END;
```

Here, position 1 means the end of the inner block, and position 2 means the end of the main block.

| Item | Variable | Position | Type | Value |
| --- | --- | --- | --- | --- |
| a | `weight` | 1 | `NUMBER(3)` | `2` |
| b | `new_locn` | 1 | `VARCHAR2(50)` | `Western Europe` |
| c | `weight` | 2 | `NUMBER(3)` | `601` |
| d | `message` | 2 | `VARCHAR2(255)` | `Product 10012 is in stock` |
| e | `new_locn` | 2 | Not available here | Out of scope |


## 10. Find each variable’s type and value in the inner and main blocks

```sql
DECLARE
    customer VARCHAR2(50) := 'Womansport';
    credit_rating VARCHAR2(50) := 'EXCELLENT';
BEGIN
    DECLARE
        customer NUMBER(7) := 201;
        c_name VARCHAR2(25) := 'Unisports';
    BEGIN
        credit_rating :='GOOD';
        …
    END;
    …
END;
```

The `…` marks show omitted code in the task. Inner values are taken after the assignment. Main values are taken after the inner block ends, assuming no other changes.

| Item | Variable | Block | Type | Value |
| --- | --- | --- | --- | --- |
| a | `customer` | Inner | `NUMBER(7)` | `201` |
| b | `c_name` | Inner | `VARCHAR2(25)` | `Unisports` |
| c | `credit_rating` | Inner | `VARCHAR2(50)` | `GOOD` |
| d | `customer` | Main | `VARCHAR2(50)` | `Womansport` |
| e | `c_name` | Main | Not available here | Out of scope |
| f | `credit_rating` | Main | `VARCHAR2(50)` | `GOOD` |


## 11. Print an employee’s name, salary, and PF contribution

Declare `fname` as `VARCHAR2(15)` and `emp_sal` as `NUMBER`. Get the first name and salary for employee ID `100`. Print “Hello” with the name, then print salary and provident fund (PF) contribution.

Basic salary is 45% of salary. PF is 12% of basic salary. Calculate PF in one expression.

This answer assumes an `employees` table with `employee_id`, `first_name`, and `salary` columns, and a row with ID `100`.

```sql
DECLARE
    fname VARCHAR2(15);
    emp_sal NUMBER;
BEGIN
    SELECT first_name, salary
    INTO fname, emp_sal
    FROM employees
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE('Hello ' || fname);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || emp_sal);
    DBMS_OUTPUT.PUT_LINE('PF: ' || emp_sal * 0.45 * 0.12);
END;
```

