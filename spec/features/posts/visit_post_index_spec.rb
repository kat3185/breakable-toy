require 'rails_helper'

feature 'visit posts index', %Q{
  As a user
  I want to see information about instructors
  So I can learn about who the teachers are
  Acceptance Criteria:
  [x] User can view a page with classes on it
  [x] Users can start registration process from this page
} do
  let!(:admin) { FactoryGirl.create(:user, :admin) }
  let!(:post) { FactoryGirl.create(:post) }

  scenario "visit posts index" do
    visit root_path

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.body)
    expect(page).to have_no_button("Edit Post")
  end

  scenario "visit posts index" do
    sign_in_as(admin)
    visit root_path

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.body)
    expect(page).to have_button("Edit Post")
  end

end
