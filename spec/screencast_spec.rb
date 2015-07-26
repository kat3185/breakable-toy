require "rails_helper"

feature "user registers for classes", %Q{
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
    sign_in_as(user)
    sleep(1)

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
    sleep(1)
    click_button "Submit"
    sleep(5)

    expect(kevin.courses.first).to be_a(Course)
    expect(kevin.course_registrations.first).to be_a(CourseRegistration)
    expect(kevin.courses.count).to eq(4)
    expect(kevin.course_registrations.count).to eq(4)
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario "guest registers for a class", js: true do
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

    click_button "Submit"
    expect(page).to have_content("This card number looks invalid.")
    sleep(1)
    fill_in "Credit Card Number", with: "4242424242424242"
    fill_in "card_code", with: "123"
    select "1 - January", from: "card_month"
    select "2016", from: "card_year"
    sleep(1)
    click_button "Submit"
    sleep(5)
    emiline = Student.find_by(first_name: "Emiline")
    expect(emiline.courses.first).to be_a(Course)
    expect(emiline.course_registrations.first).to be_a(CourseRegistration)
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario "guest registers for four classes", js: true do
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
    sleep(1)
    click_button "Submit"
    sleep(5)
  end

  scenario "user visits the new courses page" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit new_course_path
    sleep(5)
  end

  scenario "admin visits the new courses page", js: true do
    admin = FactoryGirl.create(:user, :admin)
    sign_in_as(admin)
    sleep(1)
    FactoryGirl.create(:venue)
    FactoryGirl.create_list(:instructor, 2)

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
      courses = FactoryGirl.create_list(:course, 2)

      courses.each do |course|
        FactoryGirl.create(:course_meeting, course: course, meeting_date: dates)
        FactoryGirl.create(:course_instructor, course: course, instructor: Instructor.first)
        FactoryGirl.create(:course_instructor, course: course, instructor: Instructor.second)
      end
    end

    visit new_course_path

    fill_in "Title", with: "Lindy Class"
    fill_in "Description", with: "learn stuff!"
    fill_in "Time", with: "730-830 PM"
    fill_in "Body", with: "lorum ipsum awesome class!"
    all("input[type=checkbox]").each(&:click)
    page.execute_script("$('#course_meeting_date__first').val('07/07/2015')")
    sleep(1)
    click_button("Submit Course")
    sleep(5)
  end

  scenario "admin can add a new instructor", js: true do
    FactoryGirl.create(:instructor)
    admin = FactoryGirl.create(:user, :admin)
    sign_in_as(admin)
    sleep(1)

    visit instructors_path
    select admin.email, from: "User"
    fill_in "Full name", with: "Rob McBob"
    fill_in "Body", with: "Rob McBob is not real, but I will make him real by running this test."
    fill_in "Email", with: "robmcbob@bob.rob"
    fill_in "Photo url", with: "ken.jpg"
    fill_in "Video url", with: "https://www.youtube.com/embed/puexHLZ8KQg"

    sleep(2)
    click_button "Submit Instructor"
    sleep(5)
  end
end
