# Practice 4 - Control Structures

**Daniil Kalts**  
**Group:** it2-2404SE

## Task 1 — Leap year

```sql
DECLARE
    v_year INTEGER := 2000;
BEGIN
    IF MOD(v_year, 4) = 0
        AND (MOD(v_year, 100) != 0 OR MOD(v_year, 400) = 0)
    THEN
        DBMS_OUTPUT.PUT_LINE(v_year || ' is a leap year.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_year || ' is not a leap year.');
    END IF;
END;
```

## Task 2 — Employee salary

```sql
DECLARE
    v_employee_id INTEGER := 116;
    v_name VARCHAR2(50);
    v_sal INTEGER;
BEGIN
    SELECT SALARY, FIRST_NAME INTO v_sal, v_name FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = v_employee_id;

    IF v_sal < 3000 THEN
        DBMS_OUTPUT.PUT_LINE(v_sal);
        v_sal := v_sal + 500;
        DBMS_OUTPUT.PUT_LINE(v_name || '''salary updated');
        DBMS_OUTPUT.PUT_LINE(v_sal);
    ELSIF v_sal > 3000 THEN
        DBMS_OUTPUT.PUT_LINE(v_name || ' earns ' || v_sal);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No employee found with ID ' || v_employee_id);
    
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
```

## Task 3 — Insert numbers into messages

### Create the table

```sql
CREATE TABLE messages (
    results NUMBER(3)
);
```

### For loop

```sql
BEGIN
	FOR v_number IN 1..10 LOOP
		IF v_number NOT IN (6, 8) THEN
			INSERT INTO DANIILKALTS.MESSAGES (results) VALUES (v_number);
		END IF;
	END LOOP;

	COMMIT;

	<!-- FOR row_item IN ( -->
	<!-- 	SELECT results -->
	<!-- 	FROM DANIILKALTS.MESSAGES -->
	<!-- ) LOOP -->
	<!-- 	DBMS_OUTPUT.PUT_LINE(row_item.results); -->
	<!-- END LOOP; -->
END;
```

### Verify the results

```sql
SELECT * FROM MESSAGES
```

## Task 4 — Month name

### CASE expression

```sql
DECLARE
    v_month NUMBER := 3;
    v_name VARCHAR2(20);
BEGIN
    v_name := CASE v_month
        WHEN 1 THEN 'January'
        WHEN 2 THEN 'February'
        WHEN 3 THEN 'March'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'May'
        WHEN 6 THEN 'June'
        WHEN 7 THEN 'July'
        WHEN 8 THEN 'August'
        WHEN 9 THEN 'September'
        WHEN 10 THEN 'October'
        WHEN 11 THEN 'November'
        WHEN 12 THEN 'December'
        ELSE 'Invalid month number'
    END;

    DBMS_OUTPUT.PUT_LINE(v_name);
END;
```

### CASE statement

```sql
DECLARE
    v_month NUMBER := 3;
BEGIN
    CASE v_month
        WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('January');
        WHEN 2 THEN DBMS_OUTPUT.PUT_LINE('February');
        WHEN 3 THEN DBMS_OUTPUT.PUT_LINE('March');
        WHEN 4 THEN DBMS_OUTPUT.PUT_LINE('April');
        WHEN 5 THEN DBMS_OUTPUT.PUT_LINE('May');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('June');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('July');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('August');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('September');
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('October');
        WHEN 11 THEN DBMS_OUTPUT.PUT_LINE('November');
        WHEN 12 THEN DBMS_OUTPUT.PUT_LINE('December');
        ELSE DBMS_OUTPUT.PUT_LINE('Invalid month number');
    END CASE;
END;
```
