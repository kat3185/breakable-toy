require 'rails_helper'

feature 'visit students index', %Q{
  As a user
  I want to see information about instructors
  So I can learn about who the teachers are
  Acceptance Criteria:
  [x] User can view a page with classes on it
  [x] Users can start registration process from this page
} do

  let!(:student) { FactoryGirl.create(:student) }
  let!(:admin) { FactoryGirl.create(:user, :admin) }

  scenario "user visits the students index" do
    visit students_path
    expect(page).to have_content("You must be logged in as an administrator to view the list of students.")
    expect(page).to have_no_content(Student.first.first_name)
  end

  scenario "admin visits the students index" do
    sign_in_as(admin)
    visit students_path
    expect(page).to have_no_content("You must be logged in as an administrator to view the list of students.")
    expect(page).to have_content(Student.first.first_name)
  end
end
