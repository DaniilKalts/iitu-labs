# Lab 3. Handling exceptions

Daniil Kalts  
Group: it2-2404SE

Use the database and test data from Lab 1. Run each block separately and view the results in DBMS Output.

## 1. Predefined exception

Get an order that does not exist. `NO_DATA_FOUND` is raised automatically when a `SELECT INTO` returns no rows.

```sql
DECLARE
    my_order orders%ROWTYPE;
BEGIN
    SELECT * INTO my_order
    FROM orders
    WHERE id = -1;

    DBMS_OUTPUT.PUT_LINE('Order: ' || my_order.id);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No order found');
END;
```

## 2. Non-predefined exception

Oracle raises ORA-01407 when an update tries to set a `NOT NULL` column to `NULL`. Associate this Oracle error with a name using `PRAGMA EXCEPTION_INIT`.

```sql
DECLARE
    e_null_value EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_null_value, -1407);
BEGIN
    UPDATE products
    SET name = NULL
    WHERE id = (SELECT MIN(id) FROM products);

    DBMS_OUTPUT.PUT_LINE('Product updated');
EXCEPTION
    WHEN e_null_value THEN
        DBMS_OUTPUT.PUT_LINE('Product name cannot be NULL');
END;
```

The update fails because `products.name` is `NOT NULL`. The exception handler catches the error and prints the message. This block needs at least one product from Lab 1.

## 3. User-defined exception

Check a value and raise our own exception when it is negative.

```sql
DECLARE
    product_quantity NUMBER := -5;
    e_negative_quantity EXCEPTION;
BEGIN
    IF product_quantity < 0 THEN
        RAISE e_negative_quantity;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Quantity: ' || product_quantity);
EXCEPTION
    WHEN e_negative_quantity THEN
        DBMS_OUTPUT.PUT_LINE('Quantity cannot be negative');
END;
```

## Questions

### 1. What is an exception?

An exception is an error or unusual condition that interrupts the normal execution of a PL/SQL block.

### 2. What types of exceptions exist in PL/SQL?

There are predefined exceptions, non-predefined Oracle errors, and user-defined exceptions.

### 3. How are exceptions handled?

The code that handles exceptions is written in the `EXCEPTION` section. A matching `WHEN` handler runs when an exception is raised.

### 4. Describe the structure of the exception handling section.

It comes after `BEGIN` statements and before `END`. It contains one or more `WHEN` handlers. `WHEN OTHERS` can handle any exception not caught by an earlier handler.

```sql
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Another error');
```

### 5. What are predefined Oracle server errors and how are they handled?

They are common Oracle errors that already have names in PL/SQL, such as `NO_DATA_FOUND` and `ZERO_DIVIDE`. Handle them by using their names in a `WHEN` clause.

### 6. What are non-predefined Oracle server errors and how are they handled?

They are Oracle errors without a predefined PL/SQL name. Declare an exception and connect it to the Oracle error number with `PRAGMA EXCEPTION_INIT`, then handle it by its declared name.

### 7. What are user-defined exceptions and how are they handled?

They are exceptions declared by the programmer for application-specific conditions. Declare the exception, raise it with `RAISE`, and handle it in the `EXCEPTION` section.
