CREATE TABLE order_statuses (
    code VARCHAR2(20 CHAR) NOT NULL,
    name VARCHAR2(100 CHAR) NOT NULL,
    description VARCHAR2(500 CHAR),

    CONSTRAINT pk_order_statuses PRIMARY KEY (code),

    CONSTRAINT uq_order_statuses_name UNIQUE (name)
);

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
);

CREATE INDEX ix_orders_user_created
    ON orders (user_id, created_at);

CREATE INDEX ix_orders_status_created
    ON orders (status_code, created_at);

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
);

CREATE INDEX ix_order_items_product_order
    ON order_items (product_id, order_id);

