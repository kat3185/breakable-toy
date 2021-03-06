require "rails_helper"

feature "visit instructors index", %Q{
  As a user
  I want to see information about instructors
  So I can learn about who the teachers are
} do

  scenario "visit instructors index" do
    FactoryGirl.create_list(:instructor, 2)
    visit instructors_path
    expect(page).to have_content(Instructor.first.full_name)
    expect(page).to have_content(Instructor.last.full_name)
    expect(page).to have_content(Instructor.first.body)
    expect(page).to have_no_button("Edit Instructor")
    expect(page).to have_no_content("Add a new instructor")
  end

  scenario "admin visits instructors index" do
    FactoryGirl.create_list(:instructor, 2)
    admin = FactoryGirl.create(:user, :admin)
    sign_in_as(admin)

    visit instructors_path
    expect(page).to have_content(Instructor.first.full_name)
    expect(page).to have_content(Instructor.last.full_name)
    expect(page).to have_content(Instructor.first.body)
    expect(page).to have_button("Edit Instructor")
    expect(page).to have_content("Add a new instructor")
  end

  scenario "admin can add a new instructor" do
    FactoryGirl.create_list(:instructor, 2)
    admin = FactoryGirl.create(:user, :admin)
    sign_in_as(admin)
    expect(Instructor.all.count).to eq(2)

    visit instructors_path
    expect(page).to have_content(Instructor.first.full_name)
    expect(page).to have_content(Instructor.last.full_name)
    expect(page).to have_content(Instructor.first.body)
    expect(page).to have_button("Edit Instructor")
    expect(page).to have_content("Add a new instructor")
    fill_in "Full name", with: "Rob McBob"
    fill_in "Body", with: "Rob McBob is not real, but I will make him real by running this test."
    fill_in "Email", with: "robmcbob@bob.rob"
    select admin.email, from: "User"
    click_button "Submit Instructor"
    expect(Instructor.all.count).to eq(3)
  end
end
