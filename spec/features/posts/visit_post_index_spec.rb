require "rails_helper"

feature "visit posts index", %Q{
  As a user
  I want to see recent announcements
  So I can what is happening with the studio
} do
  let!(:admin) { FactoryGirl.create(:user, :admin) }
  let!(:post) { FactoryGirl.create(:post) }

  scenario "visit posts index" do
    visit root_path

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.body)
    expect(page).to have_no_button("Edit Post")
  end

  scenario "visit posts index" do
    sign_in_as(admin)
    visit root_path

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.body)
    expect(page).to have_button("Edit Post")
  end

end
