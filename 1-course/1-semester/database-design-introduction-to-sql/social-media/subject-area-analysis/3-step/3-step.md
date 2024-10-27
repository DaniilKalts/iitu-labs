<h1 style="color: #222222; text-align: center; border-bottom: none;">🚀 Project Work. Part #1.</h1>
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
    Describe relations between tables in the database.
  </span>
  <hr />
</div>

<ol>
  <li><b>categories</b>
    <ul>
      <li>categories - users (many-to-one)</li>
      <li>categories - categories (self-referencing one-to-many (for hierarchical structure))</li>
    </ul>
  </li>
  <li><b>goals</b>
    <ul>
      <li>goals - users (many-to-one)</li>
    </ul>
  </li>
  <li><b>goals_categories</b>
    <ul>
      <li>goals - categories (many-to-many)</li>
    </ul>
  </li>
  <li><b>media</b>
    <ul>
      <li>media - users (many-to-one)</li>
    </ul>
  </li>
  <li><b>posts</b>
    <ul>
      <li>posts - goals (many-to-one)</li>
      <li>posts - media (one-to-one)</li>
    </ul>
  </li>
  <li><b>comments</b>
    <ul>
      <li>comments - users (many-to-one)</li>
      <li>comments - posts (many-to-one)</li>
      <li>comments - comments (self-referencing one-to-many (for replies))</li>
    </ul>
  </li>
  <li><b>bookmarks</b>
    <ul>
      <li>bookmarks - users (many-to-one)</li>
      <li>bookmarks - posts (many-to-one)</li>
    </ul>
  </li>
  <li><b>subscriptions</b>
    <ul>
      <li>subscription - users (many-to-one)</li>
    </ul>
  </li>
  <li><b>messages</b>
    <ul>
      <li>messages - users (many-to-one)</li>
      <li>messages - media (one-to-one)</li>
    </ul>
  </li>
  <li><b>user_notifications</b>
    <ul>
      <li>notifications - users (many-to-one)</li>
    </ul>
  </li>
  <li><b>reports</b>
    <ul>
      <li>reports - users (many-to-one)</li>
    </ul>
  </li>
</ol>
