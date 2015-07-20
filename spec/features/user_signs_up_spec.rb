require 'rails_helper'

feature 'user registers', %Q{
  As a visitor
  I want to register
  So that I can create an account
} do

  # Acceptance Criteria:
  # * I must specify a valid email address,
  #   password, and password confirmation
  # * If I don't specify the required information, I am presented with
  #   an error message

  scenario 'provide valid registration information' do
    visit new_user_registration_path

    fill_in "First name", with: "John"
    fill_in "Last name", with: "McExample"
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
    expect(User.first.student).to eq(Student.first)
  end

  scenario 'provide invalid registration information' do
    visit new_user_registration_path

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'user signs up after having already registered for classes' do
    student = FactoryGirl.create(:student)
    visit new_user_registration_path

    fill_in "First name", with: student.first_name
    fill_in "Last name", with: student.last_name
    fill_in 'Email', with: student.email
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
    student.reload
    expect(student.user).to be_a(User)
    expect(User.first.student).to eq(student)
  end
end
