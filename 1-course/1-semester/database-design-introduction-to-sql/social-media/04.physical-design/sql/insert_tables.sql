INSERT INTO users (first_name, last_name, nickname, avatar_id, description, date_of_birth, email, password, last_login)
VALUES 
('John', 'Doe', 'johndoe', NULL, 'Just an average user living his life.', '1990-05-15', 'johndoe@gmail.com', 'password1', NOW()),
('Jane', 'Smith', 'janesmith', NULL, 'Loves to explore new things and travel often.', '1985-08-20', 'janesmith@gmail.com', 'password2', NOW()),
('Alice', 'Johnson', 'alicej', NULL, 'Passionate coder and writer, learning daily.', '1992-02-10', 'alicej@gmail.com', 'password3', NOW()),
('Bob', 'Brown', 'bobbrown', NULL, 'An adventure seeker who loves nature and hiking.', '1988-09-25', 'bobbrown@gmail.com', 'password4', NOW()),
('Charlie', 'Davis', 'charlied', NULL, 'Enthusiastic about life and always learning new skills.', '1995-03-30', 'charlied@gmail.com', 'password5', NOW());

INSERT INTO categories (author_id, name, description, parent_category_id)
VALUES
(1, 'Health', 'All about staying healthy', NULL),
(2, 'Fitness', 'Workout and physical health', 1),
(3, 'Technology', 'Advancements in technology', NULL),
(1, 'Programming', 'Everything about coding', 3),
(4, 'Travel', 'Exploring new places', NULL);

INSERT INTO goals (author_id, name, description, status, priority, deadline, created_at)
VALUES
(1, 'Lose weight', 'This goal involves developing healthy eating and exercise habits to achieve a sustainable weight.', 'in progress', 8, '2025-01-01', NOW()),
(2, 'Learn JavaScript', 'Dedicate time daily to learning JavaScript fundamentals, ES6 features, and building real projects.', 'in progress', 6, '2025-06-01', NOW()),
(3, 'Read 20 books', 'Choose a diverse set of books from various genres, including fiction, non-fiction, and self-development.', 'in progress', 7, '2025-12-31', NOW()),
(4, 'Run a marathon', 'Train consistently for several months to complete a full marathon with a target time of under 4 hours.', 'in progress', 9, '2025-05-01', NOW()),
(5, 'Visit 10 countries', 'Plan and visit 10 unique countries to explore their cultures, cuisines, and landscapes within the next year.', 'in progress', 10, '2025-12-31', NOW());

INSERT INTO goals_categories (goal_id, category_id)
VALUES
(1, 2),
(2, 4),
(3, 1),
(4, 2),
(5, 5);

INSERT INTO media (author_id, media_type, file_path, file_size, created_at)
VALUES
(1, 'image', '/images/avatar1.png', 150, NOW()),
(2, 'image', '/images/avatar2.png', 200, NOW()),
(3, 'video', '/videos/tutorial.mp4', 5000, NOW()),
(4, 'image', '/images/scenery.png', 350, NOW()),
(5, 'video', '/videos/travel.mp4', 7000, NOW());

INSERT INTO posts (goal_id, media_id, title, description, status)
VALUES
(1, 1, 'Starting a fitness journey', 'Today marks the beginning of my health journey with consistent workouts and a balanced diet plan.', 'published'),
(2, 2, 'Learning JavaScript', 'Started with basics of JavaScript, diving into ES6 features, DOM manipulation, and project-based learning.', 'published'),
(3, 3, 'Book review', 'A great novel that I read last week, which explores deep themes of humanity, relationships, and resilience.', 'draft'),
(4, 4, 'Travel memories', 'Captured beautiful scenery during my trip, including stunning mountains, vibrant cities, and serene beaches.', 'published'),
(5, 5, 'Vacation vlog', 'Highlights from my recent vacation, featuring amazing cultural experiences, food exploration, and adventures.', 'published');

INSERT INTO comments (author_id, post_id, parent_comment_id, description)
VALUES
(2, 1, NULL, 'This is so inspiring! Keep it up! Your journey towards health and fitness is truly admirable. Best of luck!'),
(3, 1, 1, 'I agree! Great work. It is amazing to see people stay consistent with their goals and strive for improvement.'),
(4, 2, NULL, 'JavaScript can be tricky but fun! There are so many new features to explore, like async/await and modules.'),
(5, 4, NULL, 'Beautiful scenery, where is this? I would love to know more about this location and your experiences there.'),
(1, 5, NULL, 'Loved this vlog! Very well edited. The transitions, music, and overall flow were engaging and captivating.');

INSERT INTO bookmarks (user_id, post_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO subscriptions (user_id, followee_id)
VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);

INSERT INTO messages (sender_id, recipient_id, content, status)
VALUES
(1, 2, 'Hey! How are you?', 'sent'),
(2, 3, 'What’s up?', 'sent'),
(3, 4, 'Long time no see!', 'read'),
(4, 5, 'Check this out!', 'sent'),
(5, 1, 'Missed you!', 'sent');

INSERT INTO notifications (title, description, is_global)
VALUES
('Welcome to the platform!', 'We are excited to have you here.', TRUE),
('New feature update', 'Check out the latest features.', TRUE),
('Goal progress reminder', 'You are doing great! Keep it up.', FALSE);

INSERT INTO user_notifications (user_id, notification_id, status)
VALUES
(1, 1, 'read'),
(2, 2, 'unread'),
(3, 3, 'unread'),
(4, 1, 'read'),
(5, 2, 'unread');

INSERT INTO reports (author_id, post_id, media_id, description, status)
VALUES
(1, 1, NULL, 'This report is for inappropriate content observed in the post, which violates the community guidelines.', 'pending'),
(2, 2, NULL, 'This report is for spam content observed in the post. Please review and take necessary actions.', 'resolved'),
(3, 3, 3, 'This report is for copyright violation regarding the uploaded video. Please check for proper permissions.', 'pending'),
(4, 4, 4, 'This report is for offensive language used in the post. It could cause harm to the community members.', 'rejected'),
(5, 5, 5, 'This report highlights misinformation found in the post. It is critical to ensure accuracy for the audience.', 'pending');
