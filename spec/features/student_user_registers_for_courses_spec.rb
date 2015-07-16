require 'rails_helper'

feature 'user registers for classes', %Q{
  As a user
  I want to be able to register for classes
  So I can learn more about swing dancing
  Acceptance Criteria:
  [x] User click the "register now" button and is taken to a student info page
  [x] After the filling in and submitting student info, the user can register for
      courses for either this month or next month.
  [x] Registering for courses creates the appropriate course_registrations objects
} do

  scenario "user with an associated student registers for a class", js: true do
    date = FactoryGirl.create(:meeting_date)
    FactoryGirl.create(:meeting_date,
                               first: Date.new(2015, 8, 4),
                               second: Date.new(2015, 8, 11),
                               third: Date.new(2015, 8, 18),
                               fourth: Date.new(2015, 8, 25))
    FactoryGirl.create(:meeting_date,
                               first: Date.new(2015, 7, 5),
                               second: Date.new(2015, 7, 12),
                               third: Date.new(2015, 7, 19),
                               fourth: Date.new(2015, 7, 26))
    date2 = FactoryGirl.create(:meeting_date,
                               first: Date.new(2015, 8, 3),
                               second: Date.new(2015, 8, 10),
                               third: Date.new(2015, 8, 17),
                               fourth: Date.new(2015, 8, 24))

    MeetingDate.all.each do |dates|
     courses = FactoryGirl.create_list(:course, 2, :with_instructors)

     courses.each do |course|
       FactoryGirl.create(:course_meeting, course: course, meeting_date: dates)
     end
    end
    kevin = FactoryGirl.create(:student, first_name: "Kevin")
    user = FactoryGirl.create(:user)
    kevin.user = user
    user.student = kevin
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit courses_path
    click_button "Register for #{date.second.strftime('%B')} Classes"

    expect(page).to have_button("Register for #{date.second.strftime('%B')} Classes")
    expect(page).to have_button("Register for #{date2.second.strftime('%B')} Classes")

    select "Follow", from: "registration_holder[first_role]", match: :first
    select "Lead", from: "registration_holder[second_role]", match: :first
    select "Lead", from: "registration_holder[third_role]", match: :first
    select "Follow", from: "registration_holder[fourth_role]", match: :first

    fill_in "Credit Card Number", with: "4242424242424242", match: :first
    fill_in "card_code", with: "123", match: :first
    select "1 - January", from: "card_month", match: :first
    select "2016", from: "card_year", match: :first

    click_button "Register for #{date.second.strftime('%B')} Classes"
    expect(page).to have_content("Registration Created!")
    kevin.reload
    expect(kevin.courses.first).to be_a(Course)
    expect(kevin.course_registrations.first).to be_a(CourseRegistration)
    expect(kevin.courses.count).to eq(4)
    expect(kevin.course_registrations.count).to eq(4)

  end
end
