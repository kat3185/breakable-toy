require 'rails_helper'

RSpec.describe CourseRegistration, type: :model do
  it 'has a working factory' do
    reg = FactoryGirl.create(:course_registration)

    expect(reg).to be_a(CourseRegistration)
    expect(reg.course).to be_a(Course)
    expect(reg.student).to be_a(Student)
    expect(reg.role).to be_a(String)
  end

  it "#process" do
    complete_holder = FactoryGirl.create(:registration_holder, :with_courses)
    registrations = complete_holder.create_each_registration

    expect(registrations.count).to eq(4)
    registrations.each do |registration|
      registration.process
    end

    expect(CourseRegistration.all.count).to eq(3)
  end
end
