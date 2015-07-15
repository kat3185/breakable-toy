require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  it 'has a working factory' do
    expect(user.email).to be_a(String)
    expect(user.password).to be_a(String)
    expect(User.first).to be_a(User)
  end

  it 'can have a role associated with it' do
    expect(user.role).to eq(nil)
  end

  it 'can have one student' do
    student = FactoryGirl.create(:student)
    user.student = student
    student.user = user
    
    expect(user.student).to be_a(Student)
    expect(student.user).to be_a(User)
  end

  it 'can have one instructor' do
    instructor = FactoryGirl.create(:instructor)
    user.instructor = instructor
    instructor.user = user

    expect(user.instructor).to be_an(Instructor)
    expect(instructor.user).to be_a(User)
  end
end
