require 'rails_helper'

RSpec.describe Student, type: :model do

  it "#full_name" do
    student = FactoryGirl.create(:student)
    expect(student.full_name).to eq("#{student.first_name} #{student.last_name}")
  end
  
  it "#assign_user(current_user)" do
    student = FactoryGirl.create(:student)
    user = FactoryGirl.create(:user)
    student.user = user
    user.student = student
    expect(student.user.email).to eq(user.email)
    expect(user.student.first_name).to eq(student.first_name)
  end
end
