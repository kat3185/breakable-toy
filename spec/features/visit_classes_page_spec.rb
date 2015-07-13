require 'rails_helper'

feature 'visit courses page', %Q{
  As a user
  I want to see information about upcoming classes
  So I can decide if I want to take them
  Acceptance Criteria:
  [x] User can view a page with classes on it
  [x] Users can start registration process from this page
} do

  scenario 'visit the courses page' do
    date = FactoryGirl.create(:meeting_date)
    date2 = FactoryGirl.create(:meeting_date,
                               first: Date.new(2015, 8, 4),
                               second: Date.new(2015, 8, 11),
                               third: Date.new(2015, 8, 18),
                               fourth: Date.new(2015, 8, 25))
    FactoryGirl.create_list(:course, 4, :with_instructors)

    Course.all.each do |course|
      FactoryGirl.create(:course_meeting, course: course, meeting_date: date)
    end

    FactoryGirl.create_list(:course, 4, :with_instructors)

    Course.all.each do |course|
      FactoryGirl.create(:course_meeting, course: course, meeting_date: date2)
    end
    visit courses_path

    expect(page).to have_link(Course.first.title)
    expect(page).to have_link(Course.last.title)
    expect(page).to have_content(Course.first.instructors.first.full_name)
    expect(page).to have_content(Course.first.venue.building_name)
    expect(page).to have_content("Leads: ")
    expect(page).to have_button("Register for #{date.second.strftime('%B')} Classes")
  end
end
