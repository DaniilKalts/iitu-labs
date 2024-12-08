DROP TABLE IF EXISTS user_notifications CASCADE;
DROP TABLE IF EXISTS reports CASCADE;
DROP TABLE IF EXISTS notifications CASCADE;
DROP TABLE IF EXISTS messages CASCADE;
DROP TABLE IF EXISTS subscriptions CASCADE;
DROP TABLE IF EXISTS bookmarks CASCADE;
DROP TABLE IF EXISTS comments CASCADE;
DROP TABLE IF EXISTS posts CASCADE;
DROP TABLE IF EXISTS goals_categories CASCADE;
DROP TABLE IF EXISTS goals CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS media CASCADE;
DROP TABLE IF EXISTS users CASCADE;

--

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(16) CHECK (LENGTH(first_name) BETWEEN 2 AND 16),
    last_name VARCHAR(16) CHECK (LENGTH(last_name) BETWEEN 2 AND 16),
    nickname VARCHAR(16) NOT NULL CHECK (LENGTH(nickname) BETWEEN 4 AND 16),
    avatar_id INT,
    description VARCHAR(220) CHECK (LENGTH(description) BETWEEN 20 AND 220),
    date_of_birth DATE CHECK (date_of_birth BETWEEN '1970-01-01' AND CURRENT_DATE - INTERVAL '7 years'),
    email VARCHAR(100) UNIQUE NOT NULL CHECK (email ~* '^[a-zA-Z0-9._%+-]+@gmail\.com$'),
    password VARCHAR(16) NOT NULL CHECK (LENGTH(password) BETWEEN 8 AND 16),
    last_login TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE media (
    media_id SERIAL PRIMARY KEY,
    author_id INT NOT NULL REFERENCES users(user_id) DEFERRABLE INITIALLY DEFERRED,
    media_type VARCHAR(10) NOT NULL CHECK (media_type IN ('image', 'video')),
    file_path VARCHAR(255) UNIQUE NOT NULL,
    thumbnail_path VARCHAR(255),
    file_size INT NOT NULL,
    width INT,
    height INT,
    duration FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE users
ADD CONSTRAINT fk_users_avatar_id FOREIGN KEY (avatar_id) REFERENCES media(media_id) DEFERRABLE INITIALLY DEFERRED;

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    author_id INT NOT NULL REFERENCES users(user_id),
    name VARCHAR(16) UNIQUE NOT NULL CHECK (LENGTH(name) BETWEEN 4 AND 16),
    description VARCHAR(100) CHECK (LENGTH(description) BETWEEN 20 AND 100),
    parent_category_id INT REFERENCES categories(category_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE goals (
    goal_id SERIAL PRIMARY KEY,
    author_id INT NOT NULL REFERENCES users(user_id),
    name VARCHAR(50) NOT NULL CHECK (LENGTH(name) BETWEEN 10 AND 50),
    description VARCHAR(200) CHECK (LENGTH(description) BETWEEN 51 AND 200),
    status VARCHAR(15) DEFAULT 'in progress' CHECK (status IN ('in progress', 'completed', 'overdue')),
    priority INT NOT NULL CHECK (priority BETWEEN 1 AND 10),
    deadline DATE CHECK (deadline > CURRENT_DATE),
    completed_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE goals_categories (
    goal_id INT NOT NULL REFERENCES goals(goal_id),
    category_id INT NOT NULL REFERENCES categories(category_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (goal_id, category_id)
);

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    goal_id INT NOT NULL REFERENCES goals(goal_id),
    media_id INT NOT NULL REFERENCES media(media_id),
    title VARCHAR(50) NOT NULL CHECK (LENGTH(title) BETWEEN 10 AND 50),
    description VARCHAR(1400) NOT NULL CHECK (LENGTH(description) BETWEEN 50 AND 1400),
    status VARCHAR(15) DEFAULT 'published' CHECK (status IN ('draft', 'published', 'archived')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    UNIQUE (post_id, media_id)
);

CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY,
    author_id INT NOT NULL REFERENCES users(user_id),
    post_id INT NOT NULL REFERENCES posts(post_id),
    parent_comment_id INT REFERENCES comments(comment_id),
    description VARCHAR(700) NOT NULL CHECK (LENGTH(description) BETWEEN 50 AND 700),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE bookmarks (
    bookmark_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    post_id INT NOT NULL REFERENCES posts(post_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    UNIQUE (user_id, post_id)
);

CREATE TABLE subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    followee_id INT NOT NULL REFERENCES users(user_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    UNIQUE (user_id, followee_id)
);

CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL REFERENCES users(user_id),
    recipient_id INT NOT NULL REFERENCES users(user_id),
    media_id INT REFERENCES media(media_id),
    content VARCHAR(1400),
    status VARCHAR(10) DEFAULT 'sent' CHECK (status IN ('sent', 'read')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE notifications (
    notification_id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL CHECK (LENGTH(title) BETWEEN 10 AND 50),
    description VARCHAR(400) NOT NULL CHECK (LENGTH(description) BETWEEN 20 AND 400),
    is_global BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE user_notifications (
    user_id INT REFERENCES users(user_id),
    notification_id INT REFERENCES notifications(notification_id),
    status VARCHAR(10) DEFAULT 'unread' CHECK (status IN ('unread', 'read')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (user_id, notification_id)
);

CREATE TABLE reports (
    report_id SERIAL PRIMARY KEY,
    author_id INT NOT NULL REFERENCES users(user_id),
    post_id INT REFERENCES posts(post_id),
    media_id INT REFERENCES media(media_id),
    description VARCHAR(700) NOT NULL CHECK (LENGTH(description) BETWEEN 50 AND 700),
    status VARCHAR(10) DEFAULT 'pending' CHECK (status IN ('pending', 'resolved', 'rejected')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
