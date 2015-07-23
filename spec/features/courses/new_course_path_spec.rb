require 'rails_helper'

feature 'create a new course', %Q{
  As an admin
  I want to be able to create a new course
  So I can let users know what upcoming courses we offer
  Acceptance Criteria:
  [x] User click the "register now" button and is taken to a student info page
  [x] After the filling in and submitting student info, the user can register for
      courses for either this month or next month.
  [x] Registering for courses creates the appropriate course_registrations objects
} do

  scenario "guest visits the new courses page" do
    visit new_course_path
    expect(page).to have_content("You must be logged in as an administrator to create a class!")
    expect(page).to have_no_button("Submit Course")
  end

  scenario "user visits the new courses page" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit new_course_path

    expect(page).to have_content("You must be logged in as an administrator to create a class!")
    expect(page).to have_no_button("Submit Course")
  end

  scenario "admin visits the new courses page" do
    user = FactoryGirl.create(:user, :admin)
    sign_in_as(user)
    
    visit new_course_path
    expect(page).to have_no_content("You must be logged in as an administrator to create a class!")
    expect(page).to have_button("Submit Course")
  end

end
