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

  pending "user with an associated student registers for a class", js: true do
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
    sign_in_as(user)

    visit courses_path
    click_button "Register for #{date.second.strftime('%B')} Classes"

    all("input[type=checkbox]").each(&:click)

    all("select#student_course_registrations__role").each do |menu|
      menu.select("Follow")
    end

    fill_in "Credit Card Number", with: "4242424242424242"
    fill_in "card_code", with: "123"
    select "1 - January", from: "card_month"
    select "2016", from: "card_year"

    click_button "Submit"
    sleep(5)

    expect(kevin.courses.first).to be_a(Course)
    expect(kevin.course_registrations.first).to be_a(CourseRegistration)
    expect(kevin.courses.count).to eq(4)
    expect(kevin.course_registrations.count).to eq(4)
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  pending "user with an associated student registers for a class", js: true do
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
    sign_in_as(user)

    visit courses_path
    click_button "Register for #{date.second.strftime('%B')} Classes"

    click_button "Submit"

    expect(page).to have_content("This card number looks invalid.")
  end
end
