# Lab 2. Creating anonymous blocks

Daniil Kalts  
Group: it2-2404SE

Use the database and test data from Lab 1. Run each block separately and view the results in DBMS Output.

## 1. Record and IF

Get the first order and check its status.

```sql
DECLARE
    my_order orders%ROWTYPE;
BEGIN
    SELECT * INTO my_order
    FROM orders
    WHERE id = (SELECT MIN(id) FROM orders);

    DBMS_OUTPUT.PUT_LINE('Order: ' || my_order.id);
    DBMS_OUTPUT.PUT_LINE('Status: ' || my_order.status_code);

    IF my_order.status_code = 'DELIVERED' THEN
        DBMS_OUTPUT.PUT_LINE('Delivered');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Not delivered');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No orders');
END;
```

## 2. INDEX BY table

Put the names of low-stock products into a collection, then print them.

```sql
DECLARE
    TYPE names_type IS TABLE OF products.name%TYPE
        INDEX BY PLS_INTEGER;
    names names_type;
    i PLS_INTEGER := 0;
BEGIN
    FOR product IN (
        SELECT name FROM products WHERE quantity < 10
    ) LOOP
        i := i + 1;
        names(i) := product.name;
    END LOOP;

    FOR j IN 1..names.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(names(j));
    END LOOP;
END;
```

## 3. Explicit cursor

Print low-stock products using OPEN, FETCH and CLOSE.

```sql
DECLARE
    CURSOR c_products IS
        SELECT name, quantity FROM products WHERE quantity < 10;
    product c_products%ROWTYPE;
BEGIN
    OPEN c_products;
    LOOP
        FETCH c_products INTO product;
        EXIT WHEN c_products%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(product.name || ': ' || product.quantity);
    END LOOP;
    CLOSE c_products;
END;
```

## 4. Cursor with a parameter

Print orders for user ID 1. Change 1 to another user ID if needed.

```sql
DECLARE
    CURSOR c_orders(customer_id orders.user_id%TYPE) IS
        SELECT id, status_code FROM orders WHERE user_id = customer_id;
    my_order c_orders%ROWTYPE;
BEGIN
    OPEN c_orders(1);
    LOOP
        FETCH c_orders INTO my_order;
        EXIT WHEN c_orders%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(my_order.id || ': ' || my_order.status_code);
    END LOOP;
    CLOSE c_orders;
END;
```

## 5. Cursor FOR loop

Print the product ID and rating for each review.

```sql
DECLARE
    CURSOR c_reviews IS
        SELECT product_id, rating FROM reviews;
BEGIN
    FOR review IN c_reviews LOOP
        DBMS_OUTPUT.PUT_LINE(review.product_id || ': ' || review.rating || '/5');
    END LOOP;
END;
```

## 6. CASE

Print order item quantities and label them as small, medium or large.

```sql
BEGIN
    FOR item IN (SELECT id, quantity FROM order_items) LOOP
        DBMS_OUTPUT.PUT_LINE('Item ' || item.id || ': ' || item.quantity);
        CASE
            WHEN item.quantity >= 5 THEN
                DBMS_OUTPUT.PUT_LINE('Large');
            WHEN item.quantity >= 2 THEN
                DBMS_OUTPUT.PUT_LINE('Medium');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Small');
        END CASE;
    END LOOP;
END;
```

## Questions

### 1. Structure of an anonymous block

DECLARE is for declarations, BEGIN is for statements, EXCEPTION is for errors, END finishes the block. DECLARE and EXCEPTION are optional.

### 2. Types of blocks

Anonymous blocks, procedures and functions. A block can contain another block.

### 3. Declaring variables

Write the name and data type before BEGIN. Use := to assign a value. End the declaration with a semicolon.

```sql
price NUMBER := 100;
name VARCHAR2(50);
```

### 4. Composite data types

Records and collections: INDEX BY tables, nested tables and VARRAYs.

### 5. Record and INDEX BY table

A record has fields, like id and status. An INDEX BY table has elements accessed by keys, like names(1).

### 6. Two ways to create a record

Using a table:

```sql
my_order orders%ROWTYPE;
```

Using a custom type:

```sql
TYPE order_type IS RECORD (
    id NUMBER,
    status VARCHAR2(20)
);
my_order order_type;
```

### 7. Creating an INDEX BY table

Declare the type and a variable in DECLARE:

```sql
TYPE names_type IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
names names_type;
```

Assign an element after BEGIN:

```sql
names(1) := 'Alice';
```

### 8. %TYPE

Uses the data type of a column or variable.

```sql
price products.price%TYPE;
```

### 9. %ROWTYPE

Creates a record with the fields of a table row or cursor result.

```sql
my_order orders%ROWTYPE;
```

### 10. Loops

LOOP repeats until we exit. WHILE repeats while a condition is true. Numeric FOR goes through a range. Cursor FOR goes through query rows.

### 11. CASE types

Simple CASE checks one value. Searched CASE checks conditions.

```sql
CASE status
    WHEN 'DELIVERED' THEN DBMS_OUTPUT.PUT_LINE('Done');
    ELSE DBMS_OUTPUT.PUT_LINE('Other');
END CASE;
```

```sql
CASE
    WHEN quantity < 10 THEN DBMS_OUTPUT.PUT_LINE('Low stock');
    ELSE DBMS_OUTPUT.PUT_LINE('Enough');
END CASE;
```

### 12. Implicit cursors

Oracle handles them automatically for SQL statements. SQL%FOUND means a row was affected or returned. SQL%NOTFOUND means no rows. SQL%ROWCOUNT is the number of rows. SQL%ISOPEN is always false.

SELECT INTO raises NO_DATA_FOUND if no row matches.

### 13. Explicit cursors

We declare them ourselves to process query results one row at a time.

### 14. Explicit cursor attributes

%ISOPEN checks if the cursor is open. %FOUND checks if the last fetch returned a row. %NOTFOUND checks if it did not. %ROWCOUNT counts fetched rows.

### 15. Declaring a cursor

Defines its name, query and optional parameters. The query does not run yet.

### 16. Opening a cursor

Runs the query and prepares the result for fetching.

### 17. Fetching a cursor

Copies the next row into variables or a record.

### 18. Closing a cursor

Releases its resources. We must reopen it before fetching again.
