# Practice 5 — Composite Data Types

| Item | Value |
| --- | --- |
| Student | Daniil Kalts |
| Group | it2-2404SE |
| Subject | PL/SQL |
| DBMS | Oracle Database |

The database tasks use the Oracle HR `countries` and `departments` tables. Run each block separately with DBMS Output enabled. For `&` inputs, use a client that supports substitution variables, or replace them with values before running.

## 1. Create a record with personal information and print it

Store your name, year of birth, and place of birth in a PL/SQL record. Display all three fields.

```sql
DECLARE
    TYPE person_type IS RECORD (
        name VARCHAR2(100),
        birth_year NUMBER(4),
        birth_place VARCHAR2(100)
    );
    person person_type;
BEGIN
    person.name := 'Daniil Kalts';
    person.birth_year := &birth_year;
    person.birth_place := '&birth_place';

    DBMS_OUTPUT.PUT_LINE('Name: ' || person.name);
    DBMS_OUTPUT.PUT_LINE('Year of birth: ' || person.birth_year);
    DBMS_OUTPUT.PUT_LINE('Place of birth: ' || person.birth_place);
END;
```

## 2. Retrieve and print information about a country

Declare a record based on the `countries` table. Read `countryid` through a substitution variable, retrieve the country, and print its ID, name, and region. Test with `DE`, `UK`, and `US`.

```sql
DECLARE
    country countries%ROWTYPE;
    countryid countries.country_id%TYPE := '&countryid';
BEGIN
    SELECT *
    INTO country
    FROM countries
    WHERE country_id = countryid;

    DBMS_OUTPUT.PUT_LINE('Country ID: ' || country.country_id);
    DBMS_OUTPUT.PUT_LINE('Country name: ' || country.country_name);
    DBMS_OUTPUT.PUT_LINE('Region: ' || country.region_id);
END;
```

## 3. Store the squares of numbers from 1 to 8 in an INDEX BY table

Fill the collection using a loop, then print each number and its square.

```sql
DECLARE
    TYPE squares_type IS TABLE OF NUMBER
        INDEX BY PLS_INTEGER;
    squares squares_type;
BEGIN
    FOR i IN 1..8 LOOP
        squares(i) := i * i;
    END LOOP;

    FOR i IN 1..8 LOOP
        DBMS_OUTPUT.PUT_LINE(i || ' squared = ' || squares(i));
    END LOOP;
END;
```

## 4. Store and print the names of 10 departments

Start with department ID `10` and increase `deptno` by `10` after each retrieval. Store the department names in an INDEX BY table, then print them using another loop.

```sql
DECLARE
    TYPE names_type IS TABLE OF departments.department_name%TYPE
        INDEX BY PLS_INTEGER;
    names names_type;
    deptno departments.department_id%TYPE := 10;
BEGIN
    FOR i IN 1..10 LOOP
        SELECT department_name
        INTO names(i)
        FROM departments
        WHERE department_id = deptno;

        deptno := deptno + 10;
    END LOOP;

    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(names(i));
    END LOOP;
END;
```
