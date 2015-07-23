require 'rails_helper'

feature 'visit posts new', %Q{
  As a user
  I want to see information about instructors
  So I can learn about who the teachers are
  Acceptance Criteria:
  [x] User can view a page with classes on it
  [x] Users can start registration process from this page
} do
  let!(:admin) { FactoryGirl.create(:user, :admin) }
  let!(:post) { FactoryGirl.create(:post) }

  scenario "visit posts new" do
    visit new_post_path
    expect(page).to have_content("You must be logged in as an administrator to create a new post!")
    expect(page).to have_no_button("Submit Post")
  end

  scenario "visit posts new" do
    sign_in_as(admin)
    visit new_post_path
    expect(page).to have_no_content("You must be logged in as an administrator to create a new post!")
    expect(page).to have_button("Submit Post")
  end
end
