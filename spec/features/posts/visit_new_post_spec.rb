require "rails_helper"

feature "visit posts new", %Q{
  As an admin
  I want to create a new post
  So I can share with the community what the studio is up to
} do
  let!(:admin) { FactoryGirl.create(:user, :admin) }
  let!(:post) { FactoryGirl.create(:post) }

  scenario "visit posts new" do
    visit new_post_path
    expect(page).to have_content("You must be logged in as an administrator to create a new post!")
    expect(page).to have_no_button("Submit Post")
  end

  scenario "visit posts new" do
    sign_in_as(admin)
    visit new_post_path
    expect(page).to have_no_content("You must be logged in as an administrator to create a new post!")
    expect(page).to have_button("Submit Post")
  end
end
