
## Blog Application with Real-Time Features
A modern blog application built with Ruby on Rails, we have used Ruby 3.2.2 and Rails 7.2, featuring real-time interactions, authentication, authorization, and a responsive UI using Hotwire, Stimulus, and Bootstrap.

## Summary of Features Implemented:
Authentication: Complete user authentication with Devise
Blog Posts: Users can create, edit, delete, and view posts
Comments: Users can comment on posts with real-time updates
Hotwire/Turbo: All forms use Turbo for seamless updates
Stimulus JS: Enhanced form interactions and notifications
Action Cable: Real-time comment broadcasting
Search: Search functionality for posts
Responsive Design: Bootstrap-based responsive UI
Authorization: Users can only edit/delete their own content
Real-time Updates: Comments appear instantly without page refresh


## How It Works:
For the comment creator: They see the comment with edit/delete options via Turbo Stream response
For other users: They see the comment via Action Cable broadcast using the safe partial (no Devise helpers)
Action Cable broadcasts: Use the comment_broadcast partial that doesn't rely on current_user
Real-time updates: All users viewing the post will see new comments, updates, and deletions in real-time

## Installation
Clone the repository:
git clone https://github.com/your-username/blog-app.git

cd blog-app

Install dependencies:
bundle install

Setup the database:
rails db:create
rails db:migrate

Start the server:
rails server

Open your browser and visit http://localhost:3000 to see the app in action.

## Contributing
Contributions are welcome! Please feel free to submit a pull request or open an issue for any improvements or bug fixes.
