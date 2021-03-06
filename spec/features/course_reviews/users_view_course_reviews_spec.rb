require "rails_helper"

feature "user views course reviews", %Q{
  As an admin
  I want to view course reviews
  So that I can recieve useful feedback from students
} do

  let!(:course_review) { FactoryGirl.create(:course_review) }

  scenario "guest views course reviews index" do
    visit course_reviews_path
    expect(page).to have_content("You must be logged in as an administrator to view this page.")
    expect(page).to have_no_content(course_review.body)
  end

  scenario "admin views course reviews index" do
    user = FactoryGirl.create(:user, :admin)
    sign_in_as(user)

    visit course_reviews_path
    expect(page).to have_no_content("You must be logged in as an administrator to view this page.")
    expect(page).to have_content(course_review.body)
  end
end
