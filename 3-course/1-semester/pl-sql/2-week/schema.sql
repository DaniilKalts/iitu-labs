DECLARE
    PROCEDURE create_table_if_missing(
        p_table_name VARCHAR2,
        p_ddl        VARCHAR2
    ) IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM user_tables
        WHERE table_name = UPPER(p_table_name);

        IF v_count = 0 THEN
            EXECUTE IMMEDIATE p_ddl;
        END IF;
    END;

    PROCEDURE create_index_if_missing(
        p_index_name VARCHAR2,
        p_ddl        VARCHAR2
    ) IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM user_indexes
        WHERE index_name = UPPER(p_index_name);

        IF v_count = 0 THEN
            EXECUTE IMMEDIATE p_ddl;
        END IF;
    END;
BEGIN
    create_table_if_missing('users', q'[
        CREATE TABLE users (
            id NUMBER(19,0) GENERATED ALWAYS AS IDENTITY,
            username VARCHAR2(50 CHAR) NOT NULL,
            email VARCHAR2(255 CHAR) NOT NULL,
            password_hash VARCHAR2(255 CHAR) NOT NULL,
            first_name VARCHAR2(100 CHAR) NOT NULL,
            last_name VARCHAR2(100 CHAR) NOT NULL,
            phone_number VARCHAR2(30 CHAR),
            birth_date DATE,
            created_at TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
            updated_at TIMESTAMP,

            CONSTRAINT pk_users PRIMARY KEY (id),

            CONSTRAINT uq_users_username UNIQUE (username),
            CONSTRAINT uq_users_email UNIQUE (email)
        )
    ]');

    create_table_if_missing('brands', q'[
        CREATE TABLE brands (
            id NUMBER(19,0) GENERATED ALWAYS AS IDENTITY,
            name VARCHAR2(100 CHAR) NOT NULL,
            created_at TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
            updated_at TIMESTAMP,

            CONSTRAINT pk_brands PRIMARY KEY (id),

            CONSTRAINT uq_brands_name UNIQUE (name)
        )
    ]');

    create_table_if_missing('categories', q'[
        CREATE TABLE categories (
            id NUMBER(19,0) GENERATED ALWAYS AS IDENTITY,
            parent_category_id NUMBER(19,0),
            name VARCHAR2(100 CHAR) NOT NULL,
            description VARCHAR2(500 CHAR),
            created_at TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
            updated_at TIMESTAMP,

            CONSTRAINT pk_categories PRIMARY KEY (id),

            CONSTRAINT uq_categories_name UNIQUE (name),

            CONSTRAINT fk_categories_parent FOREIGN KEY (parent_category_id)
                REFERENCES categories (id)
        )
    ]');

    create_table_if_missing('products', q'[
        CREATE TABLE products (
            id NUMBER(19,0) GENERATED ALWAYS AS IDENTITY,
            brand_id NUMBER(19,0) NOT NULL,
            category_id NUMBER(19,0) NOT NULL,
            article VARCHAR2(30 CHAR) NOT NULL,
            name VARCHAR2(200 CHAR) NOT NULL,
            description CLOB,
            price NUMBER(12,2) NOT NULL,
            quantity NUMBER(10,0) DEFAULT 0 NOT NULL,
            created_at TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
            updated_at TIMESTAMP,

            CONSTRAINT pk_products PRIMARY KEY (id),

            CONSTRAINT uq_products_article UNIQUE (article),

            CONSTRAINT fk_products_brand FOREIGN KEY (brand_id)
                REFERENCES brands (id),
            CONSTRAINT fk_products_category FOREIGN KEY (category_id)
                REFERENCES categories (id),

            CONSTRAINT ck_products_price CHECK (price >= 0),
            CONSTRAINT ck_products_quantity CHECK (quantity >= 0)
        )
    ]');

    create_table_if_missing('order_statuses', q'[
        CREATE TABLE order_statuses (
            code VARCHAR2(20 CHAR) NOT NULL,
            name VARCHAR2(100 CHAR) NOT NULL,
            description VARCHAR2(500 CHAR),

            CONSTRAINT pk_order_statuses PRIMARY KEY (code),

            CONSTRAINT uq_order_statuses_name UNIQUE (name)
        )
    ]');

    create_table_if_missing('orders', q'[
        CREATE TABLE orders (
            id NUMBER(19,0) GENERATED ALWAYS AS IDENTITY,
            user_id NUMBER(19,0) NOT NULL,
            status_code VARCHAR2(20 CHAR) NOT NULL,
            shipping_address VARCHAR2(500 CHAR) NOT NULL,
            created_at TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
            updated_at TIMESTAMP,

            CONSTRAINT pk_orders PRIMARY KEY (id),

            CONSTRAINT fk_orders_user FOREIGN KEY (user_id)
                REFERENCES users (id),
            CONSTRAINT fk_orders_status FOREIGN KEY (status_code)
                REFERENCES order_statuses (code)
        )
    ]');

    create_table_if_missing('order_items', q'[
        CREATE TABLE order_items (
            id NUMBER(19,0) GENERATED ALWAYS AS IDENTITY,
            order_id NUMBER(19,0) NOT NULL,
            product_id NUMBER(19,0) NOT NULL,
            quantity NUMBER(10,0) NOT NULL,
            unit_price NUMBER(12,2) NOT NULL,
            created_at TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,

            CONSTRAINT pk_order_items PRIMARY KEY (id),

            CONSTRAINT uq_order_items_product UNIQUE (order_id, product_id),

            CONSTRAINT fk_order_items_order FOREIGN KEY (order_id)
                REFERENCES orders (id) ON DELETE CASCADE,
            CONSTRAINT fk_order_items_product FOREIGN KEY (product_id)
                REFERENCES products (id),

            CONSTRAINT ck_order_items_quantity CHECK (quantity > 0),
            CONSTRAINT ck_order_items_unit_price CHECK (unit_price >= 0)
        )
    ]');

    create_table_if_missing('reviews', q'[
        CREATE TABLE reviews (
            id NUMBER(19,0) GENERATED ALWAYS AS IDENTITY,
            user_id NUMBER(19,0) NOT NULL,
            product_id NUMBER(19,0) NOT NULL,
            rating NUMBER(1,0) NOT NULL,
            review_text CLOB,
            created_at TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
            updated_at TIMESTAMP,

            CONSTRAINT pk_reviews PRIMARY KEY (id),

            CONSTRAINT uq_reviews_user_product UNIQUE (user_id, product_id),

            CONSTRAINT fk_reviews_user FOREIGN KEY (user_id)
                REFERENCES users (id),
            CONSTRAINT fk_reviews_product FOREIGN KEY (product_id)
                REFERENCES products (id),

            CONSTRAINT ck_reviews_rating CHECK (rating BETWEEN 1 AND 5)
        )
    ]');

    create_table_if_missing('review_comments', q'[
        CREATE TABLE review_comments (
            id NUMBER(19,0) GENERATED ALWAYS AS IDENTITY,
            review_id NUMBER(19,0) NOT NULL,
            user_id NUMBER(19,0) NOT NULL,
            parent_comment_id NUMBER(19,0),
            comment_text CLOB NOT NULL,
            created_at TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
            updated_at TIMESTAMP,

            CONSTRAINT pk_review_comments PRIMARY KEY (id),

            CONSTRAINT fk_review_comments_review FOREIGN KEY (review_id)
                REFERENCES reviews (id) ON DELETE CASCADE,
            CONSTRAINT fk_review_comments_user FOREIGN KEY (user_id)
                REFERENCES users (id),
            CONSTRAINT fk_review_comments_parent FOREIGN KEY (parent_comment_id)
                REFERENCES review_comments (id) ON DELETE SET NULL,

            CONSTRAINT ck_review_comments_parent CHECK (
                parent_comment_id IS NULL OR parent_comment_id <> id
            )
        )
    ]');

    create_index_if_missing(
        'ix_categories_parent',
        'CREATE INDEX ix_categories_parent ON categories (parent_category_id)'
    );

    create_index_if_missing(
        'ix_products_brand',
        'CREATE INDEX ix_products_brand ON products (brand_id)'
    );

    create_index_if_missing(
        'ix_products_category_price',
        'CREATE INDEX ix_products_category_price ON products (category_id, price)'
    );

    create_index_if_missing(
        'ix_products_quantity',
        'CREATE INDEX ix_products_quantity ON products (quantity)'
    );

    create_index_if_missing(
        'ix_orders_user_created',
        'CREATE INDEX ix_orders_user_created ON orders (user_id, created_at)'
    );

    create_index_if_missing(
        'ix_orders_status_created',
        'CREATE INDEX ix_orders_status_created ON orders (status_code, created_at)'
    );

    create_index_if_missing(
        'ix_order_items_product_order',
        'CREATE INDEX ix_order_items_product_order ON order_items (product_id, order_id)'
    );

    create_index_if_missing(
        'ix_reviews_product_created',
        'CREATE INDEX ix_reviews_product_created ON reviews (product_id, created_at)'
    );

    create_index_if_missing(
        'ix_review_comments_review_created',
        'CREATE INDEX ix_review_comments_review_created ON review_comments (review_id, created_at)'
    );

    create_index_if_missing(
        'ix_review_comments_user_created',
        'CREATE INDEX ix_review_comments_user_created ON review_comments (user_id, created_at)'
    );

    create_index_if_missing(
        'ix_review_comments_parent_created',
        'CREATE INDEX ix_review_comments_parent_created ON review_comments (parent_comment_id, created_at)'
    );
END;
