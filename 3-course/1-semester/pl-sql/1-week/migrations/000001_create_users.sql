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
);

