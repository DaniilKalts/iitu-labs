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
    Specify future stored information in the database.
  </span>
  <hr />
</div>

<h3>DreamHub Database Overview</h3>
<p>Welcome to the DreamHub database documentation! DreamHub isn’t your typical social media platform – it’s designed to create a space where people can focus on achieving their goals and connecting with others who are equally motivated. Think of it as a place for those who love progress, growth, and sharing real accomplishments.</p>

<h3>What DreamHub is All About</h3>
<p>DreamHub is all about creating goals and reaching them within a community that’s built around support and motivation. Users set goals across categories like "programming," "sports," "languages," and more specific subcategories such as "backend," "Python," or "workout." Until a goal is completed, details remain private, adding a bit of mystery and keeping distractions at bay.</p>

<h3>Key Features and Table Structure</h3>
<ul>
  <li><strong>Goal Completion and Posts</strong><br>
    When a user completes a goal, they can share a post about it. Each post needs a description (at least 100 words) and media (a photo or video) that captures the journey. Every post connects back to the original goal, giving context to the achievement and inspiring others.
  </li>
  <li><strong>Organized Bookmarks</strong><br>
    Users can bookmark posts that matter to them. These bookmarks are automatically organized by the user who created the post, making it easy to revisit inspiration later.
  </li>
  <li><strong>Subscriptions with Privacy</strong><br>
    Users can subscribe to others, but DreamHub keeps the number of subscribers and their details private to avoid comparison and encourage genuine interaction.
  </li>
  <li><strong>Direct Messaging for Collaboration</strong><br>
    Users can message each other directly – a perfect feature for reaching out, asking questions, or collaborating on goals.
  </li>
  <li><strong>Notifications</strong><br>
    Notifications help users stay on track with important updates, like task deadlines, app updates, or comments on their posts.
  </li>
  <li><strong>Content Reporting</strong><br>
    To keep content meaningful and relevant, DreamHub includes a reporting feature. Users can flag inappropriate or irrelevant content, add a detailed explanation, and attach screenshots if necessary.
  </li>
</ul>

<h3>Database Tables</h3>
<p>Here’s a quick overview of the tables:</p>
<ol>
  <li><strong>users</strong>: Basic user profile details, login credentials, etc.</li>
  <li><strong>categories</strong>: Main categories and subcategories for goal organization.</li>
  <li><strong>goals</strong>: User-created goals, with fields for status, priority, and deadline.</li>
  <li><strong>goals_categories</strong>: Links goals to categories.</li>
  <li><strong>media</strong>: Stores photos and videos uploaded by users.</li>
  <li><strong>posts</strong>: Houses posts about completed goals.</li>
  <li><strong>comments</strong>: Lets users comment on posts and share feedback.</li>
  <li><strong>bookmarks</strong>: Stores saved posts in an organized structure.</li>
  <li><strong>subscriptions</strong>: Manages user subscriptions with privacy in mind.</li>
  <li><strong>messages</strong>: Enables direct messaging between users.</li>
  <li><strong>notifications</strong>: Tracks app updates and interactions.</li>
  <li><strong>user_notifications</strong>: Links notifications to users.</li>
  <li><strong>reports</strong>: Logs reported content to keep DreamHub quality high.</li>
</ol>

<p>Each table is designed to fit into DreamHub’s unique approach to social media, helping users focus on their goals and engage with others meaningfully.</p>
