require 'rails_helper'

feature 'register for classes', %Q{
  As a user
  I want to be able to register for classes
  So I can learn more about swing dancing
  Acceptance Criteria:
  [ ] User click the "register now" button and is taken to a student info page
  [ ] After the filling in and submitting student info, the user can register for
      courses for either this month or next month.
  [ ] Registering for courses creates the appropriate course_registrations objects
} do

  scenario 'register for a class' do
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
    FactoryGirl.create(:meeting_date,
                               first: Date.new(2015, 8, 3),
                               second: Date.new(2015, 8, 10),
                               third: Date.new(2015, 8, 17),
                               fourth: Date.new(2015, 8, 24))

    MeetingDate.all.each do |dates|
      FactoryGirl.create_list(:course, 2, :with_instructors)

      Course.all.each do |course|
        FactoryGirl.create(:course_meeting, course: course, meeting_date: dates)
      end
    end

    visit courses_path
    click_button "Register for #{date.second.strftime('%B')} classes"

    fill_in "First name", with: "Emiline"
    fill_in "Last name", with: "Katsman"
    fill_in "Email", with: "EKaz@gmail.com"
    click_button "Instantiate student"

    expect(page).to have_button("Register for #{date.second.strftime('%B')} Classes")
    select "Follow", from: "registration_holder[first_role]", match: :first
    click_button "Register for #{date.second.strftime('%B')} Classes"
    expect(page).to have_content("Registration Created!")
    emiline = Student.find_by(first_name: "Emiline")
    expect(emiline.courses.first).to be_a(Course)
    expect(emiline.course_registrations.first).to be_a(CourseRegistration)


  end
end
