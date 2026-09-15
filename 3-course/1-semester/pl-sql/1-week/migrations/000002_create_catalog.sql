CREATE TABLE brands (
    id NUMBER(19,0) GENERATED ALWAYS AS IDENTITY,
    name VARCHAR2(100 CHAR) NOT NULL,
    created_at TIMESTAMP DEFAULT LOCALTIMESTAMP NOT NULL,
    updated_at TIMESTAMP,

    CONSTRAINT pk_brands PRIMARY KEY (id),

    CONSTRAINT uq_brands_name UNIQUE (name)
);

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
);

CREATE INDEX ix_categories_parent
    ON categories (parent_category_id);

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
);

CREATE INDEX ix_products_brand
    ON products (brand_id);

CREATE INDEX ix_products_category_price
    ON products (category_id, price);

CREATE INDEX ix_products_quantity
    ON products (quantity);

