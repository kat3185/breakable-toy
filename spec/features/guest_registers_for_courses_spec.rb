require 'rails_helper'

feature 'guest registers for classes', %Q{
  As a guest
  I want to be able to register for classes
  So I can learn more about swing dancing
  Acceptance Criteria:
  [x] User click the "register now" button and is taken to a student info page
  [x] After the filling in and submitting student info, the user can register for
      courses for either this month or next month.
  [x] Registering for courses creates the appropriate course_registrations objects
} do

  pending "guest registers for a class", js: true do
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

    visit courses_path
    click_button "Register for #{date.second.strftime('%B')} Classes"

    fill_in "First name", with: "Emiline"
    fill_in "Last name", with: "Katsman"
    fill_in "Email", with: "EKaz@gmail.com"
    find(:checkbox, "#{Course.first.title}", match: :first).set(true)
    select "Follow", from: "Role:", match: :first
    fill_in "Credit Card Number", with: "4242424242424242"
    fill_in "card_code", with: "123"
    select "1 - January", from: "card_month"
    select "2016", from: "card_year"
    click_button "Submit"
    sleep(5)
    emiline = Student.find_by(first_name: "Emiline")
    expect(emiline.courses.first).to be_a(Course)
    expect(emiline.course_registrations.first).to be_a(CourseRegistration)
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  pending "guest registers for four classes", js: true do
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

    visit courses_path
    click_button "Register for #{date.second.strftime('%B')} Classes"

    fill_in "First name", with: "Robbie"
    fill_in "Last name", with: "You"
    fill_in "Email", with: "YouRock@gmail.com"

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
    robbie = Student.find_by(first_name: "Robbie")
    expect(robbie.courses.first).to be_a(Course)
    expect(robbie.course_registrations.first).to be_a(CourseRegistration)
    expect(robbie.courses.count).to eq(4)
    expect(robbie.course_registrations.count).to eq(4)
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
