require "rails_helper"

feature "visit students index", %Q{
  As an admin
  I want to see a list of students
  So I can look up relevant information
} do

  let!(:student) { FactoryGirl.create(:student) }
  let!(:admin) { FactoryGirl.create(:user, :admin) }

  scenario "user visits the students index" do
    visit students_path
    expect(page).to have_content("You must be logged in as an administrator to view the list of students.")
    expect(page).to have_no_content(Student.first.first_name)
  end

  scenario "admin visits the students index" do
    sign_in_as(admin)
    visit students_path
    expect(page).to have_no_content("You must be logged in as an administrator to view the list of students.")
    expect(page).to have_content(Student.first.first_name)
  end
end
