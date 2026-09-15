-- 1. Products that may need restocking
SELECT
    p.article,
    p.name product_name,
    b.name brand_name,
    p.quantity,
    p.price
FROM products p
JOIN brands b
    ON b.id = p.brand_id
WHERE p.quantity < 15
ORDER BY p.quantity, p.name;

-- 2. Complete product catalog
SELECT
    p.article,
    p.name product_name,
    b.name brand_name,
    c.name category_name,
    p.price,
    p.quantity
FROM products p
JOIN brands b
    ON b.id = p.brand_id
JOIN categories c
    ON c.id = p.category_id
ORDER BY c.name, b.name, p.name;

-- 3. Orders with customer, status, and calculated total
SELECT
    o.id order_id,
    u.username,
    os.name status_name,
    o.created_at,
    SUM(oi.quantity * oi.unit_price) order_total
FROM orders o
JOIN users u
    ON u.id = o.user_id
JOIN order_statuses os
    ON os.code = o.status_code
JOIN order_items oi
    ON oi.order_id = o.id
GROUP BY
    o.id,
    u.username,
    os.name,
    o.created_at
ORDER BY o.created_at;

-- 4. Customer activity summary
SELECT
    u.username,
    COUNT(DISTINCT o.id) order_count,
    NVL(SUM(
        CASE
            WHEN o.status_code <> 'CANCELLED'
            THEN oi.quantity * oi.unit_price
            ELSE 0
        END
    ), 0) total_spent,
    MAX(o.created_at) last_order_at
FROM users u
LEFT JOIN orders o
    ON o.user_id = u.id
LEFT JOIN order_items oi
    ON oi.order_id = o.id
GROUP BY
    u.id,
    u.username
ORDER BY total_spent DESC, u.username;

-- 5. Best-selling products
SELECT
    p.article,
    p.name product_name,
    SUM(oi.quantity) units_sold,
    SUM(oi.quantity * oi.unit_price) sales_revenue
FROM products p
JOIN order_items oi
    ON oi.product_id = p.id
JOIN orders o
    ON o.id = oi.order_id
WHERE o.status_code <> 'CANCELLED'
GROUP BY
    p.id,
    p.article,
    p.name
ORDER BY units_sold DESC, sales_revenue DESC;

-- 6. Brand performance, including brands without sales
SELECT
    b.name brand_name,
    COUNT(DISTINCT p.id) product_count,
    COUNT(DISTINCT o.id) order_count,
    SUM(
        CASE
            WHEN o.id IS NOT NULL THEN oi.quantity
            ELSE 0
        END
    ) units_sold,
    SUM(
        CASE
            WHEN o.id IS NOT NULL THEN oi.quantity * oi.unit_price
            ELSE 0
        END
    ) sales_revenue
FROM brands b
LEFT JOIN products p
    ON p.brand_id = b.id
LEFT JOIN order_items oi
    ON oi.product_id = p.id
LEFT JOIN orders o
    ON o.id = oi.order_id
    AND o.status_code <> 'CANCELLED'
GROUP BY
    b.id,
    b.name
ORDER BY sales_revenue DESC, b.name;

-- 7. Historical order prices compared with current prices
SELECT
    o.id order_id,
    p.article,
    p.name product_name,
    oi.unit_price order_price,
    p.price current_price,
    p.price - oi.unit_price price_change,
    ROUND(
        (p.price - oi.unit_price) / NULLIF(oi.unit_price, 0) * 100,
        2
    ) price_change_percent
FROM order_items oi
JOIN orders o
    ON o.id = oi.order_id
JOIN products p
    ON p.id = oi.product_id
WHERE o.status_code <> 'CANCELLED'
    AND p.price <> oi.unit_price
ORDER BY ABS(p.price - oi.unit_price) DESC;

-- 8. Monthly revenue with comparison to the previous month
WITH monthly_sales AS (
    SELECT
        TRUNC(CAST(o.created_at AS DATE), 'MM') sales_month,
        SUM(oi.quantity * oi.unit_price) revenue
    FROM orders o
    JOIN order_items oi
        ON oi.order_id = o.id
    WHERE o.status_code <> 'CANCELLED'
    GROUP BY TRUNC(CAST(o.created_at AS DATE), 'MM')
)
SELECT
    TO_CHAR(sales_month, 'YYYY-MM') sales_month,
    revenue,
    LAG(revenue) OVER (
        ORDER BY sales_month
    ) previous_month_revenue,
    revenue - LAG(revenue) OVER (
        ORDER BY sales_month
    ) revenue_change
FROM monthly_sales
ORDER BY sales_month;

-- 9. Customer spending leaderboard
WITH customer_totals AS (
    SELECT
        u.id user_id,
        u.username,
        SUM(oi.quantity * oi.unit_price) total_spent
    FROM users u
    JOIN orders o
        ON o.user_id = u.id
    JOIN order_items oi
        ON oi.order_id = o.id
    WHERE o.status_code <> 'CANCELLED'
    GROUP BY
        u.id,
        u.username
)
SELECT
    DENSE_RANK() OVER (
        ORDER BY total_spent DESC
    ) spending_rank,
    username,
    total_spent,
    ROUND(
        total_spent / SUM(total_spent) OVER () * 100,
        2
    ) percent_of_all_sales
FROM customer_totals
ORDER BY spending_rank, username;

-- 10. Nested review discussions as a comment tree
SELECT
    rc.review_id,
    p.name product_name,
    LEVEL comment_depth,
    LPAD(' ', 2 * (LEVEL - 1), ' ') || u.username author,
    rc.comment_text,
    rc.created_at,
    SYS_CONNECT_BY_PATH(TO_CHAR(rc.id), '/') comment_path
FROM review_comments rc
JOIN users u
    ON u.id = rc.user_id
JOIN reviews r
    ON r.id = rc.review_id
JOIN products p
    ON p.id = r.product_id
START WITH rc.parent_comment_id IS NULL
CONNECT BY NOCYCLE
    PRIOR rc.id = rc.parent_comment_id
    AND PRIOR rc.review_id = rc.review_id
ORDER SIBLINGS BY rc.created_at;
