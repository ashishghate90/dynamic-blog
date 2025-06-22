require 'rails_helper'

RSpec.describe "Blog functionality", type: :system do
  it "allows user to create post and comment" do
    # Create a user
    user = User.create!(
      name: "Test User",
      email: "test@example.com", 
      password: "password123"
    )

    # Sign in
    visit new_user_session_path
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password123"
    click_button "Log in"

    # Create a post
    click_link "New Post"
    fill_in "Title", with: "Test Post"
    fill_in "Content", with: "This is a test post content"
    click_button "Create Post"

    expect(page).to have_text("Test Post")
    expect(page).to have_text("This is a test post content")

    # Add a comment
    fill_in "Content", with: "This is a test comment"
    click_button "Post Comment"

    expect(page).to have_text("This is a test comment")
  end
end