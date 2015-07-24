require 'rails_helper'

feature 'create a new course', %Q{
  As an admin
  I want to be able to create a new course
  So I can let users know what upcoming courses we offer
} do

  scenario "guest visits the new courses page" do
    visit new_course_path
    expect(page).to have_content("You must be logged in as an administrator to create a class!")
    expect(page).to have_no_button("Submit Course")
  end

  scenario "user visits the new courses page" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit new_course_path

    expect(page).to have_content("You must be logged in as an administrator to create a class!")
    expect(page).to have_no_button("Submit Course")
  end

  scenario "admin visits the new courses page", js: true do
    admin = FactoryGirl.create(:user, :admin)
    sign_in_as(admin)
    FactoryGirl.create(:venue)
    FactoryGirl.create_list(:instructor, 2)
    FactoryGirl.create(:meeting_date)

    visit new_course_path

    expect(Course.all.count).to eq(0)
    expect(page).to have_no_content("You must be logged in as an administrator to create a class!")
    expect(page).to have_button("Submit Course")

    fill_in "Title", with: "Lindy Class"
    fill_in "Description", with: "learn stuff!"
    fill_in "Time", with: "730-830 PM"
    fill_in "Body", with: "lorum ipsum claaaaaaaaaass"
    all("input[type=checkbox]").each(&:click)
    page.execute_script("$('#course_meeting_date__first').val('08/08/2015')")
    click_button("Submit Course")

    expect(Course.all.count).to eq(1)

  end

end
