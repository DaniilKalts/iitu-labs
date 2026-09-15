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
);

CREATE INDEX ix_reviews_product_created
    ON reviews (product_id, created_at);

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
);

CREATE INDEX ix_review_comments_review_created
    ON review_comments (review_id, created_at);

CREATE INDEX ix_review_comments_user_created
    ON review_comments (user_id, created_at);

CREATE INDEX ix_review_comments_parent_created
    ON review_comments (parent_comment_id, created_at);

