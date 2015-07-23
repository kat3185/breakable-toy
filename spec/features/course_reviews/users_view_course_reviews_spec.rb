require 'rails_helper'

feature 'user views course reviews', %Q{
  As an authenticated user
  I want to sign out
  So that my identity is forgotten about on the machine I'm using
} do

  let!(:course_review) { FactoryGirl.create(:course_review) }

  scenario "guest views course reviews index" do
    visit course_reviews_path
    expect(page).to have_content("You must be logged in as an administrator to view this page.")
    expect(page).to have_no_content(course_review.body)
  end

  scenario "admin views course reviews index" do
    user = FactoryGirl.create(:user, :admin)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit course_reviews_path
    expect(page).to have_no_content("You must be logged in as an administrator to view this page.")
    expect(page).to have_content(course_review.body)
  end
end
