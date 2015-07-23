require "rails_helper"

feature "visit a course show page", %Q{
  As an user
  I want to visit a course page
  So I can find out more about the course
} do

  let!(:course) { FactoryGirl.create(:course, :with_meetings, :with_instructors, :with_students) }

  scenario "guest visits the course show page" do
    visit course_path(course)
    expect(page).to have_content(course.title)
    expect(page).to have_content(course.body)
  end

  scenario "user visits the course show page" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit course_path(course)

    expect(page).to have_content(course.title)
    expect(page).to have_content(course.body)
    expect(page).to have_no_button("Edit Course")
  end

  scenario "admin visits the course show page" do
    user = FactoryGirl.create(:user, :admin)
    sign_in_as(user)
    visit course_path(course)

    expect(page).to have_content(course.title)
    expect(page).to have_content(course.body)
    expect(page).to have_button("Edit Course")
  end

end
