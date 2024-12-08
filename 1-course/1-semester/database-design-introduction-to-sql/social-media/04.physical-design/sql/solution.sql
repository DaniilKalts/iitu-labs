-- 01. REtrieve the first name, last name, and email of all users.
SELECT first_name, last_name, email 
FROM users;

-- 02. Find all posts with the status 'published'.
SELECT * 
FROM posts 
WHERE status = 'published';

-- 03. Retrieve users born between 1985 and 1995.
SELECT first_name, last_name, date_of_birth 
FROM users 
WHERE date_of_birth BETWEEN '1985-01-01' AND '1995-12-31';

-- 04. Find all users whose email starts with 'jane'.
SELECT first_name, last_name, email 
FROM users 
WHERE email LIKE 'jane%';

-- 05. List all categories ordered by created_at in descending order.
SELECT * 
FROM categories 
ORDER BY created_at DESC;

-- 06. Count how many posts are in the 'published' status.
SELECT COUNT(*) AS published_posts 
FROM posts 
WHERE status = 'published';

-- 07. Group comments by post_id and count how many comments each post has.
SELECT post_id, COUNT(*) AS comment_count 
FROM comments 
GROUP BY post_id;

-- 08. Find posts that have more than 2 comments.
SELECT post_id, COUNT(*) AS comment_count 
FROM comments 
GROUP BY post_id 
HAVING COUNT(*) > 2;

-- 09. Find users who have commented on the post titled 'Learning JavaScript'.
SELECT DISTINCT u.first_name, u.last_name 
FROM users u 
WHERE u.user_id IN (
    SELECT c.author_id 
    FROM comments c 
    INNER JOIN posts p ON c.post_id = p.post_id 
    WHERE p.title = 'Learning JavaScript'
);

-- 10. Find all users who are either authors of posts or authors of comments.
SELECT DISTINCT author_id 
FROM posts 
UNION 
SELECT DISTINCT author_id 
FROM comments;

-- 11. Find all posts that do not have any associated media.
SELECT * 
FROM posts 
WHERE media_id IS NULL;

-- 12. Retrieve the first_name and last_name of users along with the titles of the posts they authored.
SELECT u.first_name, u.last_name, p.title 
FROM users u 
INNER JOIN posts p ON u.user_id = p.goal_id;

-- 13. Find all users and the categories they have authored (if any). Include users even if they haven't authored a category.
SELECT u.first_name, u.last_name, c.name AS category_name 
FROM users u 
LEFT JOIN categories c ON u.user_id = c.author_id;

-- 14. Find all categories and their authors (if any). Include categories even if they have no associated authors.
SELECT c.name AS category_name, u.first_name, u.last_name 
FROM categories c 
RIGHT JOIN users u ON c.author_id = u.user_id;

-- 15. List all users and categories, even if there’s no relationship, and identify missing links.
SELECT u.first_name, u.last_name, c.name AS category_name 
FROM users u 
FULL JOIN categories c ON u.user_id = c.author_id
WHERE u.user_id IS NULL OR c.category_id IS NULL;

-- 16. Find the top 3 users with the highest number of posts.
SELECT u.first_name, u.last_name, COUNT(p.post_id) AS post_count 
FROM users u 
INNER JOIN posts p ON u.user_id = p.goal_id
GROUP BY u.user_id, u.first_name, u.last_name 
ORDER BY post_count DESC 
LIMIT 3;

-- 17. Find the most commented post and its author's name.
SELECT p.title, u.first_name, u.last_name, comment_count 
FROM posts p 
INNER JOIN (
    SELECT post_id, COUNT(*) AS comment_count 
    FROM comments 
    GROUP BY post_id 
    ORDER BY comment_count DESC 
    LIMIT 1
) top_post ON p.post_id = top_post.post_id
INNER JOIN users u ON p.goal_id = u.user_id;

-- 18. List users with the count of their published and draft posts.
SELECT u.first_name, u.last_name, 
       SUM(CASE WHEN p.status = 'published' THEN 1 ELSE 0 END) AS published_count,
       SUM(CASE WHEN p.status = 'draft' THEN 1 ELSE 0 END) AS draft_count
FROM users u
LEFT JOIN posts p ON u.user_id = p.goal_id
GROUP BY u.user_id, u.first_name, u.last_name;

-- 19. Retrieve the name of the user and the litlte of their post with the longest description.
SELECT u.first_name, u.last_name, p.title, LENGTH(p.description) AS description_length
FROM users u
INNER JOIN posts p ON u.user_id = p.goal_id
ORDER BY description_length DESC
LIMIT 1; 

-- 20. List the top 5 users who have authored the most comments, along with their comment count.
SELECT u.first_name, u.last_name, COUNT(c.comment_id) as comment_count
FROM users u
INNER JOIN comments c on u.user_id = c.author_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY comment_count DESC
LIMIT 5;
