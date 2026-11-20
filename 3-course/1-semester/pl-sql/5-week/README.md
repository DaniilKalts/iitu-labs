# Lab 5. Creating functions and packages

Daniil Kalts  
Group: it2-2404SE

Use the database and test data from Lab 1. Run each package specification, package body, and test block separately in the order shown. View the results in DBMS Output.

## 1. Orders package

The `show_order` procedure from Lab 4 prints an order and its status. The `count_order_items` function takes an order ID and returns the number of item rows in that order.

```sql
CREATE OR REPLACE PACKAGE orders_pkg AS
    PROCEDURE show_order (
        p_order_id IN orders.id%TYPE
    );

    FUNCTION count_order_items (
        p_order_id IN orders.id%TYPE
    ) RETURN NUMBER;
END orders_pkg;
```

```sql
CREATE OR REPLACE PACKAGE BODY orders_pkg AS
    PROCEDURE show_order (
        p_order_id IN orders.id%TYPE
    ) AS
        my_order orders%ROWTYPE;
    BEGIN
        SELECT *
        INTO my_order
        FROM orders
        WHERE id = p_order_id;

        DBMS_OUTPUT.PUT_LINE('Order: ' || my_order.id);
        DBMS_OUTPUT.PUT_LINE('Status: ' || my_order.status_code);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Order not found: ' || p_order_id);
    END show_order;

    FUNCTION count_order_items (
        p_order_id IN orders.id%TYPE
    ) RETURN NUMBER AS
        item_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO item_count
        FROM order_items
        WHERE order_id = p_order_id;

        RETURN item_count;
    END count_order_items;
END orders_pkg;
```

```sql
DECLARE
    order_id orders.id%TYPE;
BEGIN
    SELECT NVL(MIN(id), -1)
    INTO order_id
    FROM orders;

    orders_pkg.show_order(order_id);
    DBMS_OUTPUT.PUT_LINE('Order items: ' || orders_pkg.count_order_items(order_id));
END;
```

## 2. Stock package

The `list_low_stock` and `add_low_stock_count` procedures come from Lab 4. The `count_low_stock` function takes a stock limit and returns how many products have a quantity below it.

```sql
CREATE OR REPLACE PACKAGE stock_pkg AS
    PROCEDURE list_low_stock (
        p_limit IN products.quantity%TYPE,
        p_count OUT PLS_INTEGER
    );

    PROCEDURE add_low_stock_count (
        p_limit IN products.quantity%TYPE,
        p_total IN OUT PLS_INTEGER
    );

    FUNCTION count_low_stock (
        p_limit IN products.quantity%TYPE
    ) RETURN NUMBER;
END stock_pkg;
```

```sql
CREATE OR REPLACE PACKAGE BODY stock_pkg AS
    PROCEDURE list_low_stock (
        p_limit IN products.quantity%TYPE,
        p_count OUT PLS_INTEGER
    ) AS
        CURSOR c_products IS
            SELECT
                name,
                quantity
            FROM products
            WHERE quantity < p_limit;
        product c_products%ROWTYPE;
    BEGIN
        p_count := 0;
        OPEN c_products;

        LOOP
            FETCH c_products INTO product;
            EXIT WHEN c_products%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE(product.name || ': ' || product.quantity);
            p_count := p_count + 1;
        END LOOP;

        CLOSE c_products;
    END list_low_stock;

    PROCEDURE add_low_stock_count (
        p_limit IN products.quantity%TYPE,
        p_total IN OUT PLS_INTEGER
    ) AS
    BEGIN
        p_total := p_total + count_low_stock(p_limit);
    END add_low_stock_count;

    FUNCTION count_low_stock (
        p_limit IN products.quantity%TYPE
    ) RETURN NUMBER AS
        product_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO product_count
        FROM products
        WHERE quantity < p_limit;

        RETURN product_count;
    END count_low_stock;
END stock_pkg;
```

```sql
DECLARE
    product_count PLS_INTEGER;
    total PLS_INTEGER := 5;
BEGIN
    stock_pkg.list_low_stock(10, product_count);
    DBMS_OUTPUT.PUT_LINE('Products found: ' || product_count);

    DBMS_OUTPUT.PUT_LINE('Before: ' || total);
    stock_pkg.add_low_stock_count(10, total);
    DBMS_OUTPUT.PUT_LINE('After: ' || total);

    DBMS_OUTPUT.PUT_LINE('Low-stock count: ' || stock_pkg.count_low_stock(10));
END;
```

## 3. Reviews package

The `show_review_ratings` procedure from Lab 4 prints each product ID and rating. The `count_reviews` function takes no parameters and returns the total number of reviews.

```sql
CREATE OR REPLACE PACKAGE reviews_pkg AS
    PROCEDURE show_review_ratings;

    FUNCTION count_reviews RETURN NUMBER;
END reviews_pkg;
```

```sql
CREATE OR REPLACE PACKAGE BODY reviews_pkg AS
    PROCEDURE show_review_ratings AS
        CURSOR c_reviews IS
            SELECT
                product_id,
                rating
            FROM reviews;
        review c_reviews%ROWTYPE;
    BEGIN
        OPEN c_reviews;

        LOOP
            FETCH c_reviews INTO review;
            EXIT WHEN c_reviews%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE(review.product_id || ': ' || review.rating || '/5');
        END LOOP;

        CLOSE c_reviews;
    END show_review_ratings;

    FUNCTION count_reviews RETURN NUMBER AS
        review_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO review_count
        FROM reviews;

        RETURN review_count;
    END count_reviews;
END reviews_pkg;
```

```sql
BEGIN
    reviews_pkg.show_review_ratings;
    DBMS_OUTPUT.PUT_LINE('Reviews: ' || reviews_pkg.count_reviews());
END;
```

## Questions

### 1. Define a function in PL/SQL.

A function is a named PL/SQL subprogram that returns a value. The header declares the return type, and the `RETURN` statement sends the value to the caller.

### 2. What are the different ways of invoking functions?

Call a function in a PL/SQL expression, such as an assignment, a condition, or an argument to another subprogram. If the function meets Oracle's rules for SQL calls, it can also be used in a SQL expression.

```sql
SELECT stock_pkg.count_low_stock(10) AS product_count
FROM dual;
```

### 3. What is a package and how is it structured?

A package groups related PL/SQL components, such as procedures, functions, types, and variables. It has a specification and can have a body.

### 4. What is the purpose of creating packages?

Packages keep related code together, make it easier to reuse, and let us hide details that callers do not need.

### 5. What are private and public components of a package?

Public components are declared in the specification and can be used by callers with access to the package. Private components are declared only in the body and are available within the package body.

### 6. What is a package specification?

The specification lists the public components. For procedures and functions, it gives their names, parameters, and function return types.

### 7. What is a package body?

The body contains the code for the package's procedures and functions. It can also contain private declarations and initialization code.

### 8. What is the difference between a procedure declared in the package specification and one declared only in the body?

A procedure declared in the specification can be called from outside the package. A procedure declared only in the body can be called within the package body.

### 9. What is a forward declaration?

A forward declaration gives a subprogram's header before its implementation. The implementation appears later in the same block or package body and uses the same header.

### 10. When must a forward declaration be used?

Use one when a subprogram calls another subprogram whose definition comes later and whose declaration is not yet visible. For example, two private procedures that call each other need a forward declaration for one of them.

### 11. What is overloading and what are its limitations?

Overloading lets several subprograms share a name when PL/SQL can tell their parameter lists apart. Standalone subprograms cannot be overloaded. Changing only the parameter mode, a subtype in the same type family, or the function's return type is not enough to distinguish overloads.

### 12. What is the package state?

Package state is the current set of values of the package's variables, constants, and cursors. Normally each database session has its own package state, which is kept between calls.

### 13. How is a package created?

Run `CREATE OR REPLACE PACKAGE` to create the specification. If a body is needed, run `CREATE OR REPLACE PACKAGE BODY` next.

### 14. Is it allowed to initialize variables in the package specification?

Yes. A variable can have an initial value in its declaration, such as `total NUMBER := 0;`.

### 15. How are subprograms called from inside their own package?

Use the subprogram name directly. For example, `add_low_stock_count` calls `count_low_stock(p_limit)`.

### 16. How are subprograms called from outside their package?

Use the package name followed by the public subprogram name, such as `stock_pkg.count_low_stock(10)`.

### 17. What is a bodiless package?

A bodiless package has only a specification. It can declare types, constants, variables, or exceptions that need no definitions in a body.

### 18. What is the BEGIN section in a package?

The optional `BEGIN` section at the end of a package body contains initialization code. Oracle normally runs it once for a session when that session first uses the package.
