<h1 style="color: #222222; text-align: center; border-bottom: none;">🚀 Project Work. Part #2.</h1>
<h2 style="color: #222222; text-align: center;">Database Design. Introduction to SQL.</h2>

<hr />

<div style="font-weight: 500">
  <span style="font-size: 20px; color: #222222">
    Full Name:
  </span>
  <span style="font-size: 18px;">
    Daniil Kalts.
  </span> <br />
  <span style="font-size: 20px; color: #222222">
    Group:
  </span>
  <span style="font-size: 18px;">
    IT2-2404SE.
  </span> <br />
  <span style="font-size: 20px; color: #222222">
    Goal:
  </span>
  <span style="font-size: 18px;">
    Perform a subject area analysis for a social media platform.
  </span> <br />
  <span style="font-size: 20px; color: #222222">
    Task:
  </span>
  <span style="font-size: 18px;">
    List entities and attriutes in the database.
  </span>
  <hr />
</div>

<ol>
  <li><b>users</b></li>
  <li><b>categories</b></li>
  <li><b>goals</b></li>
  <li><b>goals_categories</b></li>
  <li><b>media</b></li>
  <li><b>posts</b></li>
  <li><b>comments</b></li>
  <li><b>bookmarks</b></li>
  <li><b>subscriptions</b></li>
  <li><b>messages</b></li>
  <li><b>notifications</b></li>
  <li><b>user_notifications</b></li>
  <li><b>reports</b></li>
</ol>

<hr />

<ol>
  <li><b>users:</b>
    <ul>
      <li>user_id (PK)</li>
      <li>first_name (VARCHAR, minimum 2 characters, maximum 16 characters)</li>
      <li>last_name (VARCHAR, minimum 2 characters, maximum 16 characters)</li>
      <li>nickname (VARCHAR, minimum 4 characters, maximum 16 characters, NOT NULL)</li>
      <li>avatar_id (FK to media.media_id)</li>
      <li>description (VARCHAR, minimum 20 characters, maximum 220 characters)</li>
      <li>date_of_birth (DATE, between 1970 and current year minus 7 years)</li>
      <li>email (VARCHAR, must end with "@gmail.com", maximum 100 characters, UNIQUE, NOT NULL)</li>
      <li>password (VARCHAR, minimum 8 characters, maximum 16 characters, NOT NULL)</li>
      <li>last_login (DATETIME)</li>
      <li>created_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
      <li>updated_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
    </ul>
  </li>
  <li><b>categories:</b>
    <ul>
      <li>category_id (PK)</li>
      <li>author_id (FK to users.user_id, NOT NULL)</li>
      <li>name (VARCHAR, minimum 4 characters, maximum 16 characters, UNIQUE, NOT NULL)</li>
      <li>description (VARCHAR, minimum 20 characters, maximum 100 characters)</li>
      <li>parent_category_id (FK to categories.category_id)</li>
      <li>created_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
    </ul>
  </li>
  <li><b>goals:</b>
    <ul>
      <li>goal_id (PK)</li>
      <li>author_id (FK to users.user_id, NOT NULL)</li>
      <li>name (VARCHAR, minimum 10 characters, maximum 50 characters, NOT NULL)</li>
      <li>description (VARCHAR, minimum 51 characters, maximum 200 characters)</li>
      <li>status (ENUM: 'in progress', 'completed', 'overdue', default 'in progress')</li>
      <li>priority (INTEGER, between 1 and 10, NOT NULL)</li>
      <li>deadline (DATE, must be a future date and greater than created_at)</li>
      <li>completed_at (DATETIME)</li>
      <li>created_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
      <li>updated_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
    </ul>
  </li>
  <li><b>goals_categories:</b>
    <ul>
      <li>goal_id (FK to goals.goal_id, NOT NULL)</li>
      <li>category_id (FK to categories.category_id, NOT NULL)</li>
      <li>created_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
      <li>PRIMARY KEY (goal_id, category_id)</li>
    </ul>
  </li>
  <li><b>media:</b>
    <ul>
      <li>media_id (PK)</li>
      <li>author_id (FK to users.user_id, NOT NULL)</li>
      <li>media_type (ENUM: 'image', 'video', NOT NULL)</li>
      <li>file_path (VARCHAR, maximum 255 characters, UNIQUE, NOT NULL)</li>
      <li>thumbnail_path (VARCHAR, maximum 255 characters, nullable)</li>
      <li>file_size (INTEGER, size in kilobytes or megabytes, NOT NULL)</li>
      <li>width (INTEGER, nullable)</li>
      <li>height (INTEGER, nullable)</li>
      <li>duration (FLOAT, nullable)</li>
      <li>created_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
      <li>updated_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
    </ul>
  </li>
  <li><b>posts:</b>
    <ul>
      <li>post_id (PK)</li>
      <li>goal_id (FK to goals.goal_id, NOT NULL)</li>
      <li>media_id (FK to media.media_id, NOT NULL)</li>
      <li>title (VARCHAR, minimum 10 characters, maximum 50 characters, NOT NULL)</li>
      <li>description (VARCHAR, minimum 50 characters, maximum 1400 characters, NOT NULL)</li>
      <li>status (ENUM: 'draft', 'published', 'archived', default 'published')</li>
      <li>created_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
      <li>updated_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
      <li>UNIQUE (post_id, media_id)</li>
    </ul>
  </li>
  <li><b>comments:</b>
    <ul>
      <li>comment_id (PK)</li>
      <li>author_id (FK to users.user_id, NOT NULL)</li>
      <li>post_id (FK to posts.post_id, NOT NULL)</li>
      <li>parent_comment_id (FK to comments.comment_id)</li>
      <li>description (VARCHAR, minimum 50 characters, maximum 700 characters, NOT NULL)</li>
      <li>created_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
      <li>updated_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
    </ul>
  </li>
  <li><b>bookmarks:</b>
    <ul>
      <li>bookmark_id (PK)</li>
      <li>user_id (FK to users.user_id, NOT NULL)</li>
      <li>post_id (FK to posts.post_id, NOT NULL)</li>
      <li>created_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
      <li>UNIQUE (user_id, post_id)</li>
    </ul>
  </li>
  <li><b>subscriptions:</b>
    <ul>
      <li>subscription_id (PK)</li>
      <li>user_id (FK to users.user_id, NOT NULL)</li>
      <li>followee_id (FK to users.user_id, NOT NULL)</li>
      <li>created_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
      <li>UNIQUE (user_id, followee_id)</li>
    </ul>
  </li>
  <li><b>messages:</b>
    <ul>
      <li>message_id (PK)</li>
      <li>sender_id (FK to users.user_id, NOT NULL)</li>
      <li>recipient_id (FK to users.user_id, NOT NULL)</li>
      <li>media_id (FK to media.media_id)</li>
      <li>content (VARCHAR, maximum 1400 characters)</li>
      <li>status (ENUM: 'sent', 'read', default 'sent')</li>
      <li>created_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
      <li>updated_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
    </ul>
  </li>
  <li><b>notifications:</b>
    <ul>
      <li>notification_id (PK)</li>
      <li>title (VARCHAR, minimum 10 characters, maximum 50 characters, NOT NULl)</li>
      <li>description (VARCHAR, minimum 20 characters, maximum 400 characters, NOT NULl)</li>
      <li>is_global (BOOLEAN, default FALSE)</li>
      <li>created_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
    </ul>
  </li>
  <li><b>user_notifications:</b>
    <ul>
      <li>user_id (FK to users.user_id)</li>
      <li>notification_id (FK to notifications.notification_id)</li>
      <li>status (ENUM: 'unread', 'read', default 'unread')</li>
      <li>created_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
      <li>updated_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
      <li>PRIMARY KEY (user_id, notification_id)<li>
    </ul>
  </li>
  <li><b>reports:</b>
    <ul>
      <li>report_id (PK)</li>
      <li>author_id (FK to users.user_id, NOT NULL)</li>
      <li>post_id (FK to posts.post_id)</li>
      <li>media_id (FK to media.media_id)</li>
      <li>description (VARCHAR, minimum 50 characters, maximum 700 characters, NOT NULL)</li>
      <li>status (ENUM: 'pending', 'resolved', 'rejected', default 'pending', NOT NULL)</li>
      <li>created_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
      <li>updated_at (DATETIME, default CURRENT_TIMESTAMP, NOT NULL)</li>
    </ul>
  </li>
</ol>
