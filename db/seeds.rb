# Create sample users
user1 = User.create!(
  name: "John Doe",
  email: "john@example.com",
  password: "password123",
  password_confirmation: "password123"
)

user2 = User.create!(
  name: "Jane Smith", 
  email: "jane@example.com",
  password: "password123",
  password_confirmation: "password123"
)

user3 = User.create!(
  name: "Bob Wilson",
  email: "bob@example.com", 
  password: "password123",
  password_confirmation: "password123"
)

# Create sample posts
post1 = Post.create!(
  title: "Welcome to Our Dynamic Blog",
  content: "This is our first blog post! We're excited to share our thoughts and ideas with you. This blog features real-time comments powered by Action Cable and Hotwire.",
  user: user1
)

post2 = Post.create!(
  title: "Getting Started with Ruby on Rails",
  content: "Ruby on Rails is an amazing web framework that makes building web applications fast and enjoyable. In this post, we'll explore some of the key features that make Rails so powerful.",
  user: user2
)

post3 = Post.create!(
  title: "The Power of Hotwire and Stimulus",
  content: "Hotwire brings the speed of single-page applications without the complexity. Combined with Stimulus, you can create rich, interactive experiences with minimal JavaScript.",
  user: user3
)

# Create sample comments
Comment.create!(
  content: "Great post! Looking forward to more content like this.",
  user: user2,
  post: post1
)

Comment.create!(
  content: "Thanks for sharing this. Very informative!",
  user: user3,
  post: post1
)

Comment.create!(
  content: "Rails is indeed amazing. I've been using it for years and still love it.",
  user: user1,
  post: post2
)

Comment.create!(
  content: "Hotwire has been a game-changer for our team. Great explanation!",
  user: user1,
  post: post3
)

puts "Created #{User.count} users"
puts "Created #{Post.count} posts"  
puts "Created #{Comment.count} comments"