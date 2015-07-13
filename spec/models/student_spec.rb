require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) { FactoryGirl.create(:student) }

  it 'has a working factory' do
    expect(student.first_name).to be_a(String)
    expect(student.last_name).to be_a(String)
    expect(student.email).to be_a(String)
    expect(Student.first).to be_a(Student)
  end

  it "#full_name" do
    expect(student.full_name).to eq("#{student.first_name} #{student.last_name}")
  end

  it "#assign_user(current_user)" do
    user = FactoryGirl.create(:user)
    student.assign_user(user)
    expect(student.user.email).to eq(user.email)
    expect(user.student.first_name).to eq(student.first_name)
  end
end
