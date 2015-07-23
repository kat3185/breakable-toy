require 'rails_helper'

feature 'visit a course show page', %Q{
  As an user
  I want to visit a course page
  So I can find out more about the course
  Acceptance Criteria:
  [x] User click the "register now" button and is taken to a student info page
  [x] After the filling in and submitting student info, the user can register for
      courses for either this month or next month.
  [x] Registering for courses creates the appropriate course_registrations objects
} do

  let!(:course) { FactoryGirl.create(:course, :with_meetings, :with_instructors, :with_students) }

  scenario "guest visits the course show page" do
    visit course_path(course)
    expect(page).to have_content(course.title)
    expect(page).to have_content(course.body)
  end

  scenario "user visits the course show page" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    visit new_course_path

    expect(page).to have_content("You must be logged in as an administrator to create a class!")
    expect(page).to have_no_button("Submit Course")
  end

  scenario "admin visits the course show page" do
    user = FactoryGirl.create(:user, :admin)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    visit new_course_path
    expect(page).to have_no_content("You must be logged in as an administrator to create a class!")
    expect(page).to have_button("Submit Course")
  end

end
