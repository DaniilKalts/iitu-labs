# Lab 6. Creating triggers

Daniil Kalts  
Group: it2-2404SE

Use the database and test data from Lab 1. For each trigger, the same test block is run twice: first without the trigger, then with it. Each test block ends with `ROLLBACK`, so the test data stays the same. Run each statement separately in the order shown. View the results in DBMS Output.

## 1. Review changes message

The `trg_reviews_changes` statement trigger runs once per statement, even when the statement changes many rows. It uses `INSERTING`, `UPDATING`, and `DELETING` to print which operation changed the reviews.

```sql
CREATE OR REPLACE TRIGGER trg_reviews_changes
    AFTER INSERT OR UPDATE OR DELETE ON reviews
    DISABLE
BEGIN
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('Trigger: reviews were inserted');
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('Trigger: reviews were updated');
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('Trigger: reviews were deleted');
    END IF;
END;
```

### Without the trigger

The trigger is created as `DISABLE`, so this test block runs without it.

```sql
BEGIN
    UPDATE reviews
    SET rating = rating;

    DBMS_OUTPUT.PUT_LINE('Rows updated: ' || SQL%ROWCOUNT);

    ROLLBACK;
END;
```

Result: Only the row count is printed.

### With the trigger

```sql
ALTER TRIGGER trg_reviews_changes ENABLE;
```

```sql
BEGIN
    UPDATE reviews
    SET rating = rating;

    DBMS_OUTPUT.PUT_LINE('Rows updated: ' || SQL%ROWCOUNT);

    ROLLBACK;
END;
```

Result: `Trigger: reviews were updated` is printed once before the row count, even though many rows were updated.

## 2. Product update time

The `trg_products_updated_at` row trigger sets `updated_at` to the current time whenever a product row is updated.

```sql
CREATE OR REPLACE TRIGGER trg_products_updated_at
    BEFORE UPDATE ON products
    FOR EACH ROW
    DISABLE
BEGIN
    :NEW.updated_at := LOCALTIMESTAMP;
END;
```

### Without the trigger

The trigger is created as `DISABLE`, so this test block runs without it.

```sql
DECLARE
    product_id products.id%TYPE;
    updated_at products.updated_at%TYPE;
BEGIN
    SELECT MIN(id)
    INTO product_id
    FROM products;

    UPDATE products
    SET price = price + 1
    WHERE id = product_id;

    SELECT updated_at
    INTO updated_at
    FROM products
    WHERE id = product_id;

    DBMS_OUTPUT.PUT_LINE('Product: ' || product_id);
    DBMS_OUTPUT.PUT_LINE('Updated at: ' || NVL(TO_CHAR(updated_at, 'YYYY-MM-DD HH24:MI:SS'), 'not set'));

    ROLLBACK;
END;
```

Result: `updated_at` keeps its old value from the test data.

### With the trigger

```sql
ALTER TRIGGER trg_products_updated_at ENABLE;
```

```sql
DECLARE
    product_id products.id%TYPE;
    updated_at products.updated_at%TYPE;
BEGIN
    SELECT MIN(id)
    INTO product_id
    FROM products;

    UPDATE products
    SET price = price + 1
    WHERE id = product_id;

    SELECT updated_at
    INTO updated_at
    FROM products
    WHERE id = product_id;

    DBMS_OUTPUT.PUT_LINE('Product: ' || product_id);
    DBMS_OUTPUT.PUT_LINE('Updated at: ' || NVL(TO_CHAR(updated_at, 'YYYY-MM-DD HH24:MI:SS'), 'not set'));

    ROLLBACK;
END;
```

Result: `updated_at` shows the time of the update.

## 3. Order status history

The history table stores each change of an order status. The `trg_orders_status_history` row trigger uses the `WHEN` clause, so it runs only when the status really changes.

```sql
CREATE TABLE order_status_history (
    id NUMBER(19,0) GENERATED ALWAYS AS IDENTITY,
    order_id NUMBER(19,0) NOT NULL,
    old_status VARCHAR2(20 CHAR) NOT NULL,
    new_status VARCHAR2(20 CHAR) NOT NULL,
    changed_at TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,

    CONSTRAINT pk_order_status_history PRIMARY KEY (id),

    CONSTRAINT fk_order_status_history_order FOREIGN KEY (order_id)
        REFERENCES orders (id) ON DELETE CASCADE
);
```

```sql
CREATE OR REPLACE TRIGGER trg_orders_status_history
    AFTER UPDATE OF status_code ON orders
    FOR EACH ROW
    DISABLE
    WHEN (OLD.status_code <> NEW.status_code)
BEGIN
    INSERT INTO order_status_history (order_id, old_status, new_status)
    VALUES (:OLD.id, :OLD.status_code, :NEW.status_code);
END;
```

### Without the trigger

The trigger is created as `DISABLE`, so this test block runs without it.

```sql
DECLARE
    my_order orders%ROWTYPE;
    new_status orders.status_code%TYPE;
    history_count NUMBER;
BEGIN
    SELECT *
    INTO my_order
    FROM orders
    WHERE id = (SELECT MIN(id) FROM orders);

    SELECT MIN(code)
    INTO new_status
    FROM order_statuses
    WHERE code <> my_order.status_code;

    UPDATE orders
    SET status_code = new_status
    WHERE id = my_order.id;

    SELECT COUNT(*)
    INTO history_count
    FROM order_status_history
    WHERE order_id = my_order.id;

    DBMS_OUTPUT.PUT_LINE('Order: ' || my_order.id);
    DBMS_OUTPUT.PUT_LINE('Status: ' || my_order.status_code || ' -> ' || new_status);
    DBMS_OUTPUT.PUT_LINE('History rows: ' || history_count);

    ROLLBACK;
END;
```

Result: The history has 0 rows for the order.

### With the trigger

```sql
ALTER TRIGGER trg_orders_status_history ENABLE;
```

```sql
DECLARE
    my_order orders%ROWTYPE;
    new_status orders.status_code%TYPE;
    history_count NUMBER;
BEGIN
    SELECT *
    INTO my_order
    FROM orders
    WHERE id = (SELECT MIN(id) FROM orders);

    SELECT MIN(code)
    INTO new_status
    FROM order_statuses
    WHERE code <> my_order.status_code;

    UPDATE orders
    SET status_code = new_status
    WHERE id = my_order.id;

    SELECT COUNT(*)
    INTO history_count
    FROM order_status_history
    WHERE order_id = my_order.id;

    DBMS_OUTPUT.PUT_LINE('Order: ' || my_order.id);
    DBMS_OUTPUT.PUT_LINE('Status: ' || my_order.status_code || ' -> ' || new_status);
    DBMS_OUTPUT.PUT_LINE('History rows: ' || history_count);

    ROLLBACK;
END;
```

Result: The history has 1 row for the order.

## 4. Stock decrease

The `trg_order_items_stock` row trigger decreases the product quantity by the number of items added to an order. If there is not enough stock, it raises an error.

```sql
CREATE OR REPLACE TRIGGER trg_order_items_stock
    AFTER INSERT ON order_items
    FOR EACH ROW
    DISABLE
DECLARE
    stock products.quantity%TYPE;
BEGIN
    SELECT quantity
    INTO stock
    FROM products
    WHERE id = :NEW.product_id;

    IF stock < :NEW.quantity THEN
        RAISE_APPLICATION_ERROR(-20001, 'Not enough stock for product ' || :NEW.product_id);
    END IF;

    UPDATE products
    SET quantity = quantity - :NEW.quantity
    WHERE id = :NEW.product_id;
END;
```

### Without the trigger

The trigger is created as `DISABLE`, so this test block runs without it.

```sql
DECLARE
    my_order_id orders.id%TYPE;
    product products%ROWTYPE;
    stock_after products.quantity%TYPE;
BEGIN
    SELECT MIN(id)
    INTO my_order_id
    FROM orders;

    SELECT *
    INTO product
    FROM products
    WHERE id = (
        SELECT MIN(p.id)
        FROM products p
        WHERE p.quantity > 0
          AND NOT EXISTS (
              SELECT 1
              FROM order_items oi
              WHERE oi.order_id = my_order_id
                AND oi.product_id = p.id
          )
    );

    INSERT INTO order_items (order_id, product_id, quantity, unit_price)
    VALUES (my_order_id, product.id, 1, product.price);

    SELECT quantity
    INTO stock_after
    FROM products
    WHERE id = product.id;

    DBMS_OUTPUT.PUT_LINE('Product: ' || product.name);
    DBMS_OUTPUT.PUT_LINE('Stock before: ' || product.quantity);
    DBMS_OUTPUT.PUT_LINE('Stock after: ' || stock_after);

    ROLLBACK;
END;
```

Result: The stock after the insert is the same as before.

### With the trigger

```sql
ALTER TRIGGER trg_order_items_stock ENABLE;
```

```sql
DECLARE
    my_order_id orders.id%TYPE;
    product products%ROWTYPE;
    stock_after products.quantity%TYPE;
BEGIN
    SELECT MIN(id)
    INTO my_order_id
    FROM orders;

    SELECT *
    INTO product
    FROM products
    WHERE id = (
        SELECT MIN(p.id)
        FROM products p
        WHERE p.quantity > 0
          AND NOT EXISTS (
              SELECT 1
              FROM order_items oi
              WHERE oi.order_id = my_order_id
                AND oi.product_id = p.id
          )
    );

    INSERT INTO order_items (order_id, product_id, quantity, unit_price)
    VALUES (my_order_id, product.id, 1, product.price);

    SELECT quantity
    INTO stock_after
    FROM products
    WHERE id = product.id;

    DBMS_OUTPUT.PUT_LINE('Product: ' || product.name);
    DBMS_OUTPUT.PUT_LINE('Stock before: ' || product.quantity);
    DBMS_OUTPUT.PUT_LINE('Stock after: ' || stock_after);

    ROLLBACK;
END;
```

Result: The stock after the insert is 1 less than before.

## Questions

### 1. What are triggers for?

A trigger is a named PL/SQL block that Oracle runs automatically when a certain event happens. Triggers are used to fill values automatically, check business rules, keep related data in sync, and log changes.

### 2. What are the types of triggers depending on the execution time?

`BEFORE` triggers run before the triggering statement or row change. `AFTER` triggers run after it. `INSTEAD OF` triggers run in place of the DML statement on a view.

### 3. What are the types of triggers depending on triggering events?

DML triggers fire on `INSERT`, `UPDATE`, or `DELETE`. DDL triggers fire on statements such as `CREATE`, `ALTER`, or `DROP`. Database event triggers fire on events such as `LOGON`, `LOGOFF`, `STARTUP`, `SHUTDOWN`, or `SERVERERROR`.

### 4. Describe statement level triggers with examples.

A statement trigger runs once for the whole statement, even if the statement changes no rows or many rows. It has no `FOR EACH ROW` clause and cannot use `:OLD` and `:NEW`. `trg_reviews_changes` is a statement trigger.

### 5. Describe row level triggers with examples.

A row trigger runs once for each row changed by the statement. It has the `FOR EACH ROW` clause and can use `:OLD` and `:NEW`. `trg_products_updated_at`, `trg_order_items_stock`, and `trg_orders_status_history` are row triggers.

### 6. What is the sequence of execution of statement and row triggers?

1. `BEFORE` statement triggers.
2. For each changed row: `BEFORE` row triggers, the row change, then `AFTER` row triggers.
3. `AFTER` statement triggers.

### 7. Describe new and old qualifiers, and their structure.

`:OLD` and `:NEW` are pseudorecords with the same fields as the table row. `:OLD` holds the values before the change, and `:NEW` holds the values after it. In an `INSERT`, the `:OLD` fields are null. In a `DELETE`, the `:NEW` fields are null. A `BEFORE` row trigger can change `:NEW` values.

### 8. What is the section WHEN for?

The `WHEN` clause sets a condition for a row trigger. The trigger body runs only for rows where the condition is true. Inside `WHEN`, `OLD` and `NEW` are written without colons, as in `trg_orders_status_history`.

### 9. How a trigger is created.

Run `CREATE OR REPLACE TRIGGER` with the trigger name, timing, event, table, optional `FOR EACH ROW` and `WHEN` clauses, and the trigger body.

### 10. How the triggering events can be grouped?

Join several events with `OR`, such as `INSERT OR UPDATE OR DELETE`. In the body, use `INSERTING`, `UPDATING`, and `DELETING` to check which event fired the trigger. `UPDATE OF column` limits the update event to certain columns.

### 11. When INSTEAD OF triggers are used?

`INSTEAD OF` triggers are used on views that cannot be changed directly, for example views that join several tables. The trigger runs its own DML on the base tables instead of the original statement.

### 12. How to create a disabled trigger?

Add `DISABLE` to the `CREATE TRIGGER` statement before the `WHEN` clause or the trigger body. All triggers in this lab are created this way.

### 13. How to enable or disable a trigger?

Use `ALTER TRIGGER name ENABLE` or `ALTER TRIGGER name DISABLE`. To change all triggers on a table, use `ALTER TABLE name ENABLE ALL TRIGGERS` or `ALTER TABLE name DISABLE ALL TRIGGERS`.

### 14. What is a mutating table?

A mutating table is a table that is being changed by the current DML statement. A row trigger cannot query or change the table on which it fires, or Oracle raises `ORA-04091`. For example, a row trigger on `order_items` cannot select from `order_items`, but `trg_order_items_stock` can update `products`.

### 15. What is a compound trigger?

A compound trigger combines several timing points for one table in one trigger. Its sections share variables, so it can collect data in row sections and use it in a statement section. This is a common way to avoid the mutating table error.

### 16. In which sequence the sections in a compound trigger must be defined?

The declaration section comes first. The timing sections can be written in any order, but each one can appear only once:

1. `BEFORE STATEMENT`
2. `BEFORE EACH ROW`
3. `AFTER EACH ROW`
4. `AFTER STATEMENT`

They run in this order.

### 17. How to create a compound trigger?

Use `CREATE OR REPLACE TRIGGER ... FOR event ON table COMPOUND TRIGGER`, add shared declarations, then the timing sections, and end with `END trigger_name;`.

```sql
CREATE OR REPLACE TRIGGER trg_products_price_count
    FOR UPDATE OF price ON products
    COMPOUND TRIGGER

    changed_count PLS_INTEGER := 0;

    AFTER EACH ROW IS
    BEGIN
        changed_count := changed_count + 1;
    END AFTER EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Prices changed: ' || changed_count);
    END AFTER STATEMENT;
END trg_products_price_count;
```

### 18. For which database objects can a compound trigger be created?

A compound DML trigger can be created on a table or a view. On a view, it can have only the `INSTEAD OF EACH ROW` section. Compound triggers are only DML triggers, so they cannot be created on a schema or a database.
