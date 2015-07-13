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

  scenario 'guest registers for a class' do
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
    click_button "Instantiate student"

    expect(page).to have_button("Register for #{date.second.strftime('%B')} Classes")
    expect(page).to have_button("Register for #{date2.second.strftime('%B')} Classes")
    select "Follow", from: "registration_holder[first_role]", match: :first
    click_button "Register for #{date.second.strftime('%B')} Classes"
    expect(page).to have_content("Registration Created!")
    emiline = Student.find_by(first_name: "Emiline")
    expect(emiline.courses.first).to be_a(Course)
    expect(emiline.course_registrations.first).to be_a(CourseRegistration)
  end

  scenario 'guest registers for four classes' do
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
    click_button "Instantiate student"

    expect(page).to have_button("Register for #{date.second.strftime('%B')} Classes")
    expect(page).to have_button("Register for #{date2.second.strftime('%B')} Classes")
    select "Follow", from: "registration_holder[first_role]", match: :first
    select "Lead", from: "registration_holder[second_role]", match: :first
    select "Lead", from: "registration_holder[third_role]", match: :first
    select "Follow", from: "registration_holder[fourth_role]", match: :first
    click_button "Register for #{date.second.strftime('%B')} Classes"
    expect(page).to have_content("Registration Created!")
    robbie = Student.find_by(first_name: "Robbie")
    expect(robbie.courses.first).to be_a(Course)
    expect(robbie.course_registrations.first).to be_a(CourseRegistration)
    expect(robbie.courses.count).to eq(4)
    expect(robbie.course_registrations.count).to eq(4)
  end
end
