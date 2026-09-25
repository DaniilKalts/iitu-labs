BEGIN
MERGE INTO users target
USING (
    SELECT 'alice' username, 'alice@example.com' email, 'seed_hash_alice' password_hash, 'Alice' first_name, 'Morgan' last_name, '+77010000001' phone_number, DATE '1998-03-12' birth_date, TIMESTAMP '2025-12-01 09:00:00' created_at FROM dual
    UNION ALL SELECT 'bob', 'bob@example.com', 'seed_hash_bob', 'Bob', 'Wilson', '+77010000002', DATE '1995-07-24', TIMESTAMP '2025-12-02 09:15:00' FROM dual
    UNION ALL SELECT 'carol', 'carol@example.com', 'seed_hash_carol', 'Carol', 'Brown', '+77010000003', DATE '2000-01-17', TIMESTAMP '2025-12-03 09:30:00' FROM dual
    UNION ALL SELECT 'david', 'david@example.com', 'seed_hash_david', 'David', 'Taylor', '+77010000004', DATE '1993-11-05', TIMESTAMP '2025-12-04 09:45:00' FROM dual
    UNION ALL SELECT 'erin', 'erin@example.com', 'seed_hash_erin', 'Erin', 'Davis', '+77010000005', DATE '1999-06-09', TIMESTAMP '2025-12-05 10:00:00' FROM dual
    UNION ALL SELECT 'frank', 'frank@example.com', 'seed_hash_frank', 'Frank', 'Miller', '+77010000006', DATE '1991-04-21', TIMESTAMP '2025-12-06 10:15:00' FROM dual
    UNION ALL SELECT 'grace', 'grace@example.com', 'seed_hash_grace', 'Grace', 'Anderson', '+77010000007', DATE '1997-09-13', TIMESTAMP '2025-12-07 10:30:00' FROM dual
    UNION ALL SELECT 'henry', 'henry@example.com', 'seed_hash_henry', 'Henry', 'Thomas', '+77010000008', DATE '1994-02-28', TIMESTAMP '2025-12-08 10:45:00' FROM dual
    UNION ALL SELECT 'irene', 'irene@example.com', 'seed_hash_irene', 'Irene', 'Jackson', '+77010000009', DATE '2001-08-16', TIMESTAMP '2025-12-09 11:00:00' FROM dual
    UNION ALL SELECT 'jack', 'jack@example.com', 'seed_hash_jack', 'Jack', 'White', '+77010000010', DATE '1996-12-03', TIMESTAMP '2025-12-10 11:15:00' FROM dual
    UNION ALL SELECT 'kate', 'kate@example.com', 'seed_hash_kate', 'Kate', 'Harris', '+77010000011', DATE '1998-05-25', TIMESTAMP '2025-12-11 11:30:00' FROM dual
    UNION ALL SELECT 'leo', 'leo@example.com', 'seed_hash_leo', 'Leo', 'Martin', '+77010000012', DATE '1992-10-10', TIMESTAMP '2025-12-12 11:45:00' FROM dual
    UNION ALL SELECT 'mia', 'mia@example.com', 'seed_hash_mia', 'Mia', 'Thompson', '+77010000013', DATE '2002-03-19', TIMESTAMP '2025-12-13 12:00:00' FROM dual
    UNION ALL SELECT 'noah', 'noah@example.com', 'seed_hash_noah', 'Noah', 'Garcia', '+77010000014', DATE '1990-06-30', TIMESTAMP '2025-12-14 12:15:00' FROM dual
    UNION ALL SELECT 'olivia', 'olivia@example.com', 'seed_hash_olivia', 'Olivia', 'Martinez', '+77010000015', DATE '1999-01-08', TIMESTAMP '2025-12-15 12:30:00' FROM dual
    UNION ALL SELECT 'peter', 'peter@example.com', 'seed_hash_peter', 'Peter', 'Robinson', '+77010000016', DATE '1989-09-14', TIMESTAMP '2025-12-16 12:45:00' FROM dual
    UNION ALL SELECT 'quinn', 'quinn@example.com', 'seed_hash_quinn', 'Quinn', 'Clark', '+77010000017', DATE '2000-07-07', TIMESTAMP '2025-12-17 13:00:00' FROM dual
    UNION ALL SELECT 'rose', 'rose@example.com', 'seed_hash_rose', 'Rose', 'Lewis', '+77010000018', DATE '1996-04-11', TIMESTAMP '2025-12-18 13:15:00' FROM dual
    UNION ALL SELECT 'sam', 'sam@example.com', 'seed_hash_sam', 'Sam', 'Walker', '+77010000019', DATE '1993-08-22', TIMESTAMP '2025-12-19 13:30:00' FROM dual
    UNION ALL SELECT 'tina', 'tina@example.com', 'seed_hash_tina', 'Tina', 'Hall', '+77010000020', DATE '2001-11-29', TIMESTAMP '2025-12-20 13:45:00' FROM dual
) source
ON (target.username = source.username)
WHEN NOT MATCHED THEN
    INSERT (
        username,
        email,
        password_hash,
        first_name,
        last_name,
        phone_number,
        birth_date,
        created_at
    )
    VALUES (
        source.username,
        source.email,
        source.password_hash,
        source.first_name,
        source.last_name,
        source.phone_number,
        source.birth_date,
        source.created_at
    );

MERGE INTO brands target
USING (
    SELECT 'Apple' name FROM dual
    UNION ALL SELECT 'Samsung' FROM dual
    UNION ALL SELECT 'Lenovo' FROM dual
    UNION ALL SELECT 'ASUS' FROM dual
    UNION ALL SELECT 'Sony' FROM dual
    UNION ALL SELECT 'JBL' FROM dual
    UNION ALL SELECT 'Logitech' FROM dual
    UNION ALL SELECT 'Keychron' FROM dual
    UNION ALL SELECT 'LG' FROM dual
    UNION ALL SELECT 'Xiaomi' FROM dual
    UNION ALL SELECT 'Philips' FROM dual
    UNION ALL SELECT 'Bosch' FROM dual
    UNION ALL SELECT 'Canon' FROM dual
    UNION ALL SELECT 'GoPro' FROM dual
    UNION ALL SELECT 'Nike' FROM dual
    UNION ALL SELECT 'Adidas' FROM dual
) source
ON (target.name = source.name)
WHEN NOT MATCHED THEN
    INSERT (name, created_at)
    VALUES (source.name, TIMESTAMP '2025-12-01 08:00:00');

MERGE INTO categories target
USING (
    SELECT 'Electronics' name, 'Electronic devices and accessories' description FROM dual
    UNION ALL SELECT 'Home Appliances', 'Appliances for everyday home use' FROM dual
    UNION ALL SELECT 'Clothing', 'Clothes and footwear' FROM dual
) source
ON (target.name = source.name)
WHEN NOT MATCHED THEN
    INSERT (name, description, created_at)
    VALUES (source.name, source.description, TIMESTAMP '2025-12-01 08:15:00');

MERGE INTO categories target
USING (
    SELECT parent.id parent_category_id, data.name, data.description
    FROM (
        SELECT 'Electronics' parent_name, 'Computers' name, 'Laptops and personal computers' description FROM dual
        UNION ALL SELECT 'Electronics', 'Smartphones', 'Mobile phones and smartphones' FROM dual
        UNION ALL SELECT 'Electronics', 'Audio', 'Headphones and portable speakers' FROM dual
        UNION ALL SELECT 'Electronics', 'Accessories', 'Computer and mobile accessories' FROM dual
        UNION ALL SELECT 'Electronics', 'Monitors', 'Computer monitors and displays' FROM dual
        UNION ALL SELECT 'Electronics', 'Wearables', 'Smart watches and wearable devices' FROM dual
        UNION ALL SELECT 'Electronics', 'Cameras', 'Photo and action cameras' FROM dual
        UNION ALL SELECT 'Clothing', 'Shoes', 'Casual and sports shoes' FROM dual
    ) data
    JOIN categories parent
        ON parent.name = data.parent_name
) source
ON (target.name = source.name)
WHEN NOT MATCHED THEN
    INSERT (
        parent_category_id,
        name,
        description,
        created_at
    )
    VALUES (
        source.parent_category_id,
        source.name,
        source.description,
        TIMESTAMP '2025-12-01 08:30:00'
    );

MERGE INTO products target
USING (
    SELECT
        brand.id brand_id,
        category.id category_id,
        data.article,
        data.name,
        data.description,
        data.price,
        data.quantity
    FROM (
        SELECT 'Apple' brand_name, 'Smartphones' category_name, '10000001' article, 'iPhone 16' name, 'Apple smartphone with 128 GB storage' description, 589990 price, 50 quantity FROM dual
        UNION ALL SELECT 'Samsung', 'Smartphones', '10000002', 'Galaxy S25', 'Samsung flagship smartphone', 499990, 40 FROM dual
        UNION ALL SELECT 'Lenovo', 'Computers', '10000003', 'ThinkPad E14', 'Business laptop with a 14 inch display', 449990, 25 FROM dual
        UNION ALL SELECT 'ASUS', 'Computers', '10000004', 'ROG Zephyrus G14', 'Compact gaming laptop', 899990, 12 FROM dual
        UNION ALL SELECT 'Apple', 'Computers', '10000005', 'MacBook Air M3', 'Lightweight laptop with Apple M3 processor', 749990, 18 FROM dual
        UNION ALL SELECT 'Sony', 'Audio', '10000006', 'WH-1000XM5', 'Wireless noise cancelling headphones', 199990, 30 FROM dual
        UNION ALL SELECT 'JBL', 'Audio', '10000007', 'Charge 5', 'Portable waterproof Bluetooth speaker', 79990, 35 FROM dual
        UNION ALL SELECT 'Logitech', 'Accessories', '10000008', 'MX Master 3S', 'Wireless productivity mouse', 59990, 60 FROM dual
        UNION ALL SELECT 'Keychron', 'Accessories', '10000009', 'K2 Mechanical Keyboard', 'Wireless mechanical keyboard', 49990, 45 FROM dual
        UNION ALL SELECT 'LG', 'Monitors', '10000010', 'UltraGear 27GP850', '27 inch gaming monitor', 249990, 20 FROM dual
        UNION ALL SELECT 'Samsung', 'Monitors', '10000011', 'Odyssey G5', 'Curved gaming monitor', 219990, 22 FROM dual
        UNION ALL SELECT 'Apple', 'Wearables', '10000012', 'Watch Series 10', 'Apple smart watch', 249990, 28 FROM dual
        UNION ALL SELECT 'Samsung', 'Wearables', '10000013', 'Galaxy Watch 7', 'Samsung smart watch', 179990, 26 FROM dual
        UNION ALL SELECT 'Xiaomi', 'Home Appliances', '10000014', 'Robot Vacuum S20', 'Robot vacuum cleaner with mapping', 129990, 24 FROM dual
        UNION ALL SELECT 'Philips', 'Home Appliances', '10000015', 'Air Fryer XL', 'Large capacity air fryer', 89990, 32 FROM dual
        UNION ALL SELECT 'Bosch', 'Home Appliances', '10000016', 'Coffee Machine Series 4', 'Automatic coffee machine', 249990, 15 FROM dual
        UNION ALL SELECT 'Canon', 'Cameras', '10000017', 'EOS R50', 'Mirrorless camera with kit lens', 399990, 10 FROM dual
        UNION ALL SELECT 'GoPro', 'Cameras', '10000018', 'Hero 13 Black', 'Waterproof action camera', 289990, 16 FROM dual
        UNION ALL SELECT 'Nike', 'Shoes', '10000019', 'Air Max 90', 'Classic everyday sneakers', 74990, 50 FROM dual
        UNION ALL SELECT 'Adidas', 'Shoes', '10000020', 'Ultraboost 22', 'Running shoes with responsive cushioning', 69990, 48 FROM dual
    ) data
    JOIN brands brand
        ON brand.name = data.brand_name
    JOIN categories category
        ON category.name = data.category_name
) source
ON (target.article = source.article)
WHEN NOT MATCHED THEN
    INSERT (
        brand_id,
        category_id,
        article,
        name,
        description,
        price,
        quantity,
        created_at
    )
    VALUES (
        source.brand_id,
        source.category_id,
        source.article,
        source.name,
        source.description,
        source.price,
        source.quantity,
        TIMESTAMP '2025-12-15 08:00:00'
    );

MERGE INTO order_statuses target
USING (
    SELECT 'PENDING' code, 'Pending' name, 'The order has been created' description FROM dual
    UNION ALL SELECT 'PAID', 'Paid', 'Payment has been received' FROM dual
    UNION ALL SELECT 'PROCESSING', 'Processing', 'The order is being prepared' FROM dual
    UNION ALL SELECT 'SHIPPED', 'Shipped', 'The order has been shipped' FROM dual
    UNION ALL SELECT 'DELIVERED', 'Delivered', 'The order has been delivered' FROM dual
    UNION ALL SELECT 'CANCELLED', 'Cancelled', 'The order has been cancelled' FROM dual
) source
ON (target.code = source.code)
WHEN NOT MATCHED THEN
    INSERT (code, name, description)
    VALUES (source.code, source.name, source.description);

MERGE INTO orders target
USING (
    SELECT usr.id user_id, data.status_code, data.shipping_address, data.created_at
    FROM (
        SELECT 'alice' username, 'DELIVERED' status_code, 'Almaty, Abay Avenue 10' shipping_address, TIMESTAMP '2026-01-05 10:15:00' created_at FROM dual
        UNION ALL SELECT 'bob', 'DELIVERED', 'Astana, Mangilik El Avenue 25', TIMESTAMP '2026-01-18 12:30:00' FROM dual
        UNION ALL SELECT 'carol', 'CANCELLED', 'Almaty, Satpayev Street 18', TIMESTAMP '2026-02-02 09:10:00' FROM dual
        UNION ALL SELECT 'david', 'DELIVERED', 'Shymkent, Tauke Khan Avenue 40', TIMESTAMP '2026-02-15 14:20:00' FROM dual
        UNION ALL SELECT 'erin', 'DELIVERED', 'Karaganda, Bukhar Zhyrau Avenue 12', TIMESTAMP '2026-03-01 11:05:00' FROM dual
        UNION ALL SELECT 'frank', 'DELIVERED', 'Almaty, Dostyk Avenue 91', TIMESTAMP '2026-03-12 16:40:00' FROM dual
        UNION ALL SELECT 'grace', 'PAID', 'Astana, Kabanbay Batyr Avenue 7', TIMESTAMP '2026-04-04 13:25:00' FROM dual
        UNION ALL SELECT 'henry', 'PROCESSING', 'Pavlodar, Lermontov Street 55', TIMESTAMP '2026-04-19 18:10:00' FROM dual
        UNION ALL SELECT 'alice', 'DELIVERED', 'Almaty, Abay Avenue 10', TIMESTAMP '2026-05-03 10:45:00' FROM dual
        UNION ALL SELECT 'bob', 'DELIVERED', 'Astana, Mangilik El Avenue 25', TIMESTAMP '2026-05-17 15:30:00' FROM dual
        UNION ALL SELECT 'irene', 'PENDING', 'Aktobe, Abilkayyr Khan Avenue 30', TIMESTAMP '2026-06-01 09:50:00' FROM dual
        UNION ALL SELECT 'jack', 'DELIVERED', 'Almaty, Tole Bi Street 101', TIMESTAMP '2026-06-14 12:15:00' FROM dual
        UNION ALL SELECT 'carol', 'DELIVERED', 'Almaty, Satpayev Street 18', TIMESTAMP '2026-06-29 17:05:00' FROM dual
        UNION ALL SELECT 'david', 'DELIVERED', 'Shymkent, Tauke Khan Avenue 40', TIMESTAMP '2026-07-05 10:35:00' FROM dual
        UNION ALL SELECT 'erin', 'SHIPPED', 'Karaganda, Bukhar Zhyrau Avenue 12', TIMESTAMP '2026-07-18 14:55:00' FROM dual
        UNION ALL SELECT 'frank', 'DELIVERED', 'Almaty, Dostyk Avenue 91', TIMESTAMP '2026-08-02 11:20:00' FROM dual
        UNION ALL SELECT 'grace', 'CANCELLED', 'Astana, Kabanbay Batyr Avenue 7', TIMESTAMP '2026-08-10 16:15:00' FROM dual
        UNION ALL SELECT 'henry', 'DELIVERED', 'Pavlodar, Lermontov Street 55', TIMESTAMP '2026-08-21 13:40:00' FROM dual
        UNION ALL SELECT 'alice', 'PROCESSING', 'Almaty, Abay Avenue 10', TIMESTAMP '2026-09-01 09:25:00' FROM dual
        UNION ALL SELECT 'kate', 'DELIVERED', 'Astana, Saryarka Avenue 14', TIMESTAMP '2026-09-10 18:30:00' FROM dual
    ) data
    JOIN users usr
        ON usr.username = data.username
) source
ON (
    target.user_id = source.user_id
    AND target.created_at = source.created_at
)
WHEN NOT MATCHED THEN
    INSERT (
        user_id,
        status_code,
        shipping_address,
        created_at
    )
    VALUES (
        source.user_id,
        source.status_code,
        source.shipping_address,
        source.created_at
    );

MERGE INTO order_items target
USING (
    SELECT
        ord.id order_id,
        product.id product_id,
        data.quantity,
        data.unit_price,
        data.created_at
    FROM (
        SELECT 'alice' username, TIMESTAMP '2026-01-05 10:15:00' order_created_at, '10000001' article, 1 quantity, 559990 unit_price, TIMESTAMP '2026-01-05 10:16:00' created_at FROM dual
        UNION ALL SELECT 'alice', TIMESTAMP '2026-01-05 10:15:00', '10000008', 1, 54990, TIMESTAMP '2026-01-05 10:16:00' FROM dual
        UNION ALL SELECT 'bob', TIMESTAMP '2026-01-18 12:30:00', '10000002', 1, 479990, TIMESTAMP '2026-01-18 12:31:00' FROM dual
        UNION ALL SELECT 'bob', TIMESTAMP '2026-01-18 12:30:00', '10000013', 1, 169990, TIMESTAMP '2026-01-18 12:31:00' FROM dual
        UNION ALL SELECT 'carol', TIMESTAMP '2026-02-02 09:10:00', '10000003', 1, 429990, TIMESTAMP '2026-02-02 09:11:00' FROM dual
        UNION ALL SELECT 'carol', TIMESTAMP '2026-02-02 09:10:00', '10000009', 1, 44990, TIMESTAMP '2026-02-02 09:11:00' FROM dual
        UNION ALL SELECT 'david', TIMESTAMP '2026-02-15 14:20:00', '10000004', 1, 879990, TIMESTAMP '2026-02-15 14:21:00' FROM dual
        UNION ALL SELECT 'david', TIMESTAMP '2026-02-15 14:20:00', '10000006', 1, 189990, TIMESTAMP '2026-02-15 14:21:00' FROM dual
        UNION ALL SELECT 'erin', TIMESTAMP '2026-03-01 11:05:00', '10000014', 1, 119990, TIMESTAMP '2026-03-01 11:06:00' FROM dual
        UNION ALL SELECT 'erin', TIMESTAMP '2026-03-01 11:05:00', '10000015', 2, 84990, TIMESTAMP '2026-03-01 11:06:00' FROM dual
        UNION ALL SELECT 'frank', TIMESTAMP '2026-03-12 16:40:00', '10000016', 1, 239990, TIMESTAMP '2026-03-12 16:41:00' FROM dual
        UNION ALL SELECT 'frank', TIMESTAMP '2026-03-12 16:40:00', '10000007', 1, 74990, TIMESTAMP '2026-03-12 16:41:00' FROM dual
        UNION ALL SELECT 'grace', TIMESTAMP '2026-04-04 13:25:00', '10000005', 1, 729990, TIMESTAMP '2026-04-04 13:26:00' FROM dual
        UNION ALL SELECT 'grace', TIMESTAMP '2026-04-04 13:25:00', '10000008', 1, 57990, TIMESTAMP '2026-04-04 13:26:00' FROM dual
        UNION ALL SELECT 'henry', TIMESTAMP '2026-04-19 18:10:00', '10000010', 2, 239990, TIMESTAMP '2026-04-19 18:11:00' FROM dual
        UNION ALL SELECT 'henry', TIMESTAMP '2026-04-19 18:10:00', '10000009', 1, 47990, TIMESTAMP '2026-04-19 18:11:00' FROM dual
        UNION ALL SELECT 'alice', TIMESTAMP '2026-05-03 10:45:00', '10000012', 1, 239990, TIMESTAMP '2026-05-03 10:46:00' FROM dual
        UNION ALL SELECT 'alice', TIMESTAMP '2026-05-03 10:45:00', '10000001', 1, 579990, TIMESTAMP '2026-05-03 10:46:00' FROM dual
        UNION ALL SELECT 'bob', TIMESTAMP '2026-05-17 15:30:00', '10000011', 1, 209990, TIMESTAMP '2026-05-17 15:31:00' FROM dual
        UNION ALL SELECT 'bob', TIMESTAMP '2026-05-17 15:30:00', '10000002', 2, 489990, TIMESTAMP '2026-05-17 15:31:00' FROM dual
        UNION ALL SELECT 'irene', TIMESTAMP '2026-06-01 09:50:00', '10000017', 1, 389990, TIMESTAMP '2026-06-01 09:51:00' FROM dual
        UNION ALL SELECT 'irene', TIMESTAMP '2026-06-01 09:50:00', '10000018', 1, 279990, TIMESTAMP '2026-06-01 09:51:00' FROM dual
        UNION ALL SELECT 'jack', TIMESTAMP '2026-06-14 12:15:00', '10000019', 1, 69990, TIMESTAMP '2026-06-14 12:16:00' FROM dual
        UNION ALL SELECT 'jack', TIMESTAMP '2026-06-14 12:15:00', '10000020', 2, 64990, TIMESTAMP '2026-06-14 12:16:00' FROM dual
        UNION ALL SELECT 'carol', TIMESTAMP '2026-06-29 17:05:00', '10000006', 1, 194990, TIMESTAMP '2026-06-29 17:06:00' FROM dual
        UNION ALL SELECT 'carol', TIMESTAMP '2026-06-29 17:05:00', '10000007', 2, 77990, TIMESTAMP '2026-06-29 17:06:00' FROM dual
        UNION ALL SELECT 'david', TIMESTAMP '2026-07-05 10:35:00', '10000003', 1, 439990, TIMESTAMP '2026-07-05 10:36:00' FROM dual
        UNION ALL SELECT 'david', TIMESTAMP '2026-07-05 10:35:00', '10000010', 1, 244990, TIMESTAMP '2026-07-05 10:36:00' FROM dual
        UNION ALL SELECT 'erin', TIMESTAMP '2026-07-18 14:55:00', '10000015', 1, 87990, TIMESTAMP '2026-07-18 14:56:00' FROM dual
        UNION ALL SELECT 'erin', TIMESTAMP '2026-07-18 14:55:00', '10000014', 1, 124990, TIMESTAMP '2026-07-18 14:56:00' FROM dual
        UNION ALL SELECT 'frank', TIMESTAMP '2026-08-02 11:20:00', '10000005', 1, 739990, TIMESTAMP '2026-08-02 11:21:00' FROM dual
        UNION ALL SELECT 'frank', TIMESTAMP '2026-08-02 11:20:00', '10000012', 1, 244990, TIMESTAMP '2026-08-02 11:21:00' FROM dual
        UNION ALL SELECT 'grace', TIMESTAMP '2026-08-10 16:15:00', '10000004', 1, 889990, TIMESTAMP '2026-08-10 16:16:00' FROM dual
        UNION ALL SELECT 'grace', TIMESTAMP '2026-08-10 16:15:00', '10000011', 1, 214990, TIMESTAMP '2026-08-10 16:16:00' FROM dual
        UNION ALL SELECT 'henry', TIMESTAMP '2026-08-21 13:40:00', '10000016', 1, 244990, TIMESTAMP '2026-08-21 13:41:00' FROM dual
        UNION ALL SELECT 'henry', TIMESTAMP '2026-08-21 13:40:00', '10000017', 1, 394990, TIMESTAMP '2026-08-21 13:41:00' FROM dual
        UNION ALL SELECT 'alice', TIMESTAMP '2026-09-01 09:25:00', '10000018', 1, 284990, TIMESTAMP '2026-09-01 09:26:00' FROM dual
        UNION ALL SELECT 'alice', TIMESTAMP '2026-09-01 09:25:00', '10000019', 2, 72990, TIMESTAMP '2026-09-01 09:26:00' FROM dual
        UNION ALL SELECT 'kate', TIMESTAMP '2026-09-10 18:30:00', '10000001', 1, 584990, TIMESTAMP '2026-09-10 18:31:00' FROM dual
        UNION ALL SELECT 'kate', TIMESTAMP '2026-09-10 18:30:00', '10000020', 1, 67990, TIMESTAMP '2026-09-10 18:31:00' FROM dual
    ) data
    JOIN users usr
        ON usr.username = data.username
    JOIN orders ord
        ON ord.user_id = usr.id
        AND ord.created_at = data.order_created_at
    JOIN products product
        ON product.article = data.article
) source
ON (
    target.order_id = source.order_id
    AND target.product_id = source.product_id
)
WHEN NOT MATCHED THEN
    INSERT (
        order_id,
        product_id,
        quantity,
        unit_price,
        created_at
    )
    VALUES (
        source.order_id,
        source.product_id,
        source.quantity,
        source.unit_price,
        source.created_at
    );

MERGE INTO reviews target
USING (
    SELECT
        usr.id user_id,
        product.id product_id,
        data.rating,
        data.review_text,
        data.created_at
    FROM (
        SELECT 'alice' username, '10000001' article, 5 rating, 'Excellent phone with a fast camera and long battery life.' review_text, TIMESTAMP '2026-01-12 10:00:00' created_at FROM dual
        UNION ALL SELECT 'bob', '10000002', 4, 'Very good display and performance, but the price is high.', TIMESTAMP '2026-01-25 11:00:00' FROM dual
        UNION ALL SELECT 'carol', '10000003', 4, 'Reliable laptop for work and university projects.', TIMESTAMP '2026-07-15 12:00:00' FROM dual
        UNION ALL SELECT 'david', '10000004', 5, 'Powerful gaming laptop with a compact design.', TIMESTAMP '2026-03-01 13:00:00' FROM dual
        UNION ALL SELECT 'frank', '10000005', 5, 'Light, quiet, and fast enough for daily development work.', TIMESTAMP '2026-08-10 14:00:00' FROM dual
        UNION ALL SELECT 'carol', '10000006', 5, 'Noise cancellation works extremely well during travel.', TIMESTAMP '2026-07-10 15:00:00' FROM dual
        UNION ALL SELECT 'frank', '10000007', 3, 'Good sound, but the device is heavier than expected.', TIMESTAMP '2026-03-20 16:00:00' FROM dual
        UNION ALL SELECT 'grace', '10000008', 5, 'Comfortable mouse with useful programmable buttons.', TIMESTAMP '2026-04-10 17:00:00' FROM dual
        UNION ALL SELECT 'henry', '10000009', 4, 'Nice typing experience and stable wireless connection.', TIMESTAMP '2026-05-01 18:00:00' FROM dual
        UNION ALL SELECT 'david', '10000010', 4, 'Smooth image and accurate colors for work and games.', TIMESTAMP '2026-07-16 10:30:00' FROM dual
        UNION ALL SELECT 'bob', '10000011', 3, 'Good monitor, although the stand could be better.', TIMESTAMP '2026-05-25 11:30:00' FROM dual
        UNION ALL SELECT 'alice', '10000012', 5, 'Useful health tracking and excellent integration with the phone.', TIMESTAMP '2026-05-10 12:30:00' FROM dual
        UNION ALL SELECT 'bob', '10000013', 4, 'Comfortable watch with a bright display.', TIMESTAMP '2026-01-26 13:30:00' FROM dual
        UNION ALL SELECT 'erin', '10000014', 4, 'Cleans the apartment well and maps rooms correctly.', TIMESTAMP '2026-03-10 14:30:00' FROM dual
        UNION ALL SELECT 'erin', '10000015', 4, 'Easy to use and large enough for a family meal.', TIMESTAMP '2026-03-11 15:30:00' FROM dual
        UNION ALL SELECT 'frank', '10000016', 3, 'Makes good coffee, but cleaning takes some time.', TIMESTAMP '2026-03-22 16:30:00' FROM dual
        UNION ALL SELECT 'irene', '10000017', 5, 'Compact camera with excellent image quality.', TIMESTAMP '2026-06-12 17:30:00' FROM dual
        UNION ALL SELECT 'frank', '10000018', 5, 'Stable video and very convenient for outdoor activities.', TIMESTAMP '2026-08-15 18:30:00' FROM dual
        UNION ALL SELECT 'jack', '10000019', 4, 'Comfortable sneakers for daily walking.', TIMESTAMP '2026-06-20 19:00:00' FROM dual
        UNION ALL SELECT 'kate', '10000020', 4, 'Comfortable running shoes with good cushioning.', TIMESTAMP '2026-09-15 20:00:00' FROM dual
    ) data
    JOIN users usr
        ON usr.username = data.username
    JOIN products product
        ON product.article = data.article
) source
ON (
    target.user_id = source.user_id
    AND target.product_id = source.product_id
)
WHEN NOT MATCHED THEN
    INSERT (
        user_id,
        product_id,
        rating,
        review_text,
        created_at
    )
    VALUES (
        source.user_id,
        source.product_id,
        source.rating,
        source.review_text,
        source.created_at
    );

MERGE INTO review_comments target
USING (
    SELECT
        review.id review_id,
        author.id user_id,
        data.comment_text,
        data.created_at
    FROM (
        SELECT 'alice' reviewer_username, '10000001' article, 'bob' author_username, 'Was the battery still good after several months?' comment_text, TIMESTAMP '2026-01-13 09:00:00' created_at FROM dual
        UNION ALL SELECT 'bob', '10000002', 'alice', 'How does the camera perform at night?', TIMESTAMP '2026-01-26 09:15:00' FROM dual
        UNION ALL SELECT 'carol', '10000003', 'david', 'Is the keyboard comfortable for long typing sessions?', TIMESTAMP '2026-07-16 09:30:00' FROM dual
        UNION ALL SELECT 'david', '10000004', 'frank', 'How loud are the fans while gaming?', TIMESTAMP '2026-03-02 09:45:00' FROM dual
        UNION ALL SELECT 'frank', '10000005', 'grace', 'Is 8 GB of memory sufficient for development?', TIMESTAMP '2026-08-11 10:00:00' FROM dual
        UNION ALL SELECT 'carol', '10000006', 'henry', 'Are the headphones comfortable during long flights?', TIMESTAMP '2026-07-11 10:15:00' FROM dual
        UNION ALL SELECT 'frank', '10000007', 'irene', 'How long does the battery last at medium volume?', TIMESTAMP '2026-03-21 10:30:00' FROM dual
        UNION ALL SELECT 'grace', '10000008', 'jack', 'Does it work well on glass surfaces?', TIMESTAMP '2026-04-11 10:45:00' FROM dual
        UNION ALL SELECT 'henry', '10000009', 'kate', 'Which switch type did you choose?', TIMESTAMP '2026-05-02 11:00:00' FROM dual
        UNION ALL SELECT 'david', '10000010', 'leo', 'Is text clear enough for programming?', TIMESTAMP '2026-07-17 11:15:00' FROM dual
    ) data
    JOIN users reviewer
        ON reviewer.username = data.reviewer_username
    JOIN products product
        ON product.article = data.article
    JOIN reviews review
        ON review.user_id = reviewer.id
        AND review.product_id = product.id
    JOIN users author
        ON author.username = data.author_username
) source
ON (
    target.review_id = source.review_id
    AND target.user_id = source.user_id
    AND target.created_at = source.created_at
)
WHEN NOT MATCHED THEN
    INSERT (
        review_id,
        user_id,
        parent_comment_id,
        comment_text,
        created_at
    )
    VALUES (
        source.review_id,
        source.user_id,
        NULL,
        source.comment_text,
        source.created_at
    );

MERGE INTO review_comments target
USING (
    SELECT
        parent.review_id,
        author.id user_id,
        parent.id parent_comment_id,
        data.comment_text,
        data.created_at
    FROM (
        SELECT TIMESTAMP '2026-01-13 09:00:00' parent_created_at, 'alice' author_username, 'Yes, it still lasts a full day with normal use.' comment_text, TIMESTAMP '2026-01-13 12:00:00' created_at FROM dual
        UNION ALL SELECT TIMESTAMP '2026-01-26 09:15:00', 'bob', 'Night photos are good when the scene is not moving.', TIMESTAMP '2026-01-26 12:15:00' FROM dual
        UNION ALL SELECT TIMESTAMP '2026-07-16 09:30:00', 'carol', 'Yes, the keyboard is firm and comfortable for long sessions.', TIMESTAMP '2026-07-16 12:30:00' FROM dual
        UNION ALL SELECT TIMESTAMP '2026-03-02 09:45:00', 'david', 'They are noticeable in performance mode but acceptable.', TIMESTAMP '2026-03-02 12:45:00' FROM dual
        UNION ALL SELECT TIMESTAMP '2026-08-11 10:00:00', 'frank', 'It is enough for basic work, but 16 GB is a safer choice.', TIMESTAMP '2026-08-11 13:00:00' FROM dual
        UNION ALL SELECT TIMESTAMP '2026-07-11 10:15:00', 'carol', 'Yes, the padding remained comfortable during a five hour flight.', TIMESTAMP '2026-07-11 13:15:00' FROM dual
        UNION ALL SELECT TIMESTAMP '2026-03-21 10:30:00', 'frank', 'I usually get around fifteen hours.', TIMESTAMP '2026-03-21 13:30:00' FROM dual
        UNION ALL SELECT TIMESTAMP '2026-04-11 10:45:00', 'grace', 'Yes, it tracks reliably on my glass desk.', TIMESTAMP '2026-04-11 13:45:00' FROM dual
    ) data
    JOIN review_comments parent
        ON parent.created_at = data.parent_created_at
    JOIN users author
        ON author.username = data.author_username
) source
ON (
    target.review_id = source.review_id
    AND target.user_id = source.user_id
    AND target.created_at = source.created_at
)
WHEN NOT MATCHED THEN
    INSERT (
        review_id,
        user_id,
        parent_comment_id,
        comment_text,
        created_at
    )
    VALUES (
        source.review_id,
        source.user_id,
        source.parent_comment_id,
        source.comment_text,
        source.created_at
    );

MERGE INTO review_comments target
USING (
    SELECT
        parent.review_id,
        author.id user_id,
        parent.id parent_comment_id,
        data.comment_text,
        data.created_at
    FROM (
        SELECT TIMESTAMP '2026-01-13 12:00:00' parent_created_at, 'bob' author_username, 'Thanks, that answers my question.' comment_text, TIMESTAMP '2026-01-13 14:00:00' created_at FROM dual
        UNION ALL SELECT TIMESTAMP '2026-08-11 13:00:00', 'grace', 'Understood, I will choose the 16 GB version.', TIMESTAMP '2026-08-11 15:00:00' FROM dual
    ) data
    JOIN review_comments parent
        ON parent.created_at = data.parent_created_at
    JOIN users author
        ON author.username = data.author_username
) source
ON (
    target.review_id = source.review_id
    AND target.user_id = source.user_id
    AND target.created_at = source.created_at
)
WHEN NOT MATCHED THEN
    INSERT (
        review_id,
        user_id,
        parent_comment_id,
        comment_text,
        created_at
    )
    VALUES (
        source.review_id,
        source.user_id,
        source.parent_comment_id,
        source.comment_text,
        source.created_at
    );

COMMIT;
END;

