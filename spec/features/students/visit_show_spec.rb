require "rails_helper"

feature "visit student show", %Q{
  As a user
  I want to see information about my classes
  So I can track what classes I have taken
} do
  let!(:student) { FactoryGirl.create(:student) }
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }

  scenario "guest visits student show page" do
    visit student_path(student)
    expect(page).to have_content("Check your e-mail for confirmation of registration,")
    expect(page).to have_no_content(student.first_name)
  end

  scenario "user visits student show page" do
    sign_in_as(user)
    visit student_path(student)
    expect(page).to have_content("Check your e-mail for confirmation of registration,")
    expect(page).to have_no_content(student.first_name)
  end

  scenario "users visits their own student show page" do
    sign_in_as(user)
    this_student = FactoryGirl.create(:student, user: user)

    visit student_path(this_student)
    expect(page).to have_no_content("Check your e-mail for confirmation of registration,")
    expect(page).to have_content(this_student.first_name)
  end

  scenario "admins visits a student show page" do
    sign_in_as(admin)

    visit student_path(student)
    expect(page).to have_no_content("Check your e-mail for confirmation of registration,")
    expect(page).to have_content(student.first_name)
  end
end
