require 'rails_helper'

RSpec.describe RegistrationHolder, type: :model do
  let(:holda) { FactoryGirl.create(:registration_holder) }

  it "has a working factory" do
    expect(holda).to be_a(RegistrationHolder)
    expect(holda.first_role).to be_a(String)
    expect(holda.second_role).to be_a(String)
    expect(holda.third_role).to be_a(String)
    expect(holda.fourth_role).to be_a(String)
    expect(holda.month).to be_an(Integer)
    expect(holda.student).to be_a(Student)
  end

  it "#assign_courses" do
    FactoryGirl.create_list(:course, 4, :with_meetings)
    holda.assign_courses

    expect(holda.first_course).to be_an(Integer)
    expect(holda.second_course).to be_an(Integer)
    expect(holda.third_course).to be_an(Integer)
    expect(holda.fourth_course).to be_an(Integer)
  end

  it "#create_each_registration" do
    FactoryGirl.create_list(:course, 4, :with_meetings)
    registrations = holda.create_each_registration

    expect(registrations).to be_an(Array)
    expect(registrations.first).to be_a(CourseRegistration)
  end

  it "can factory up a complete registration holder" do
    complete_holder = FactoryGirl.create(:registration_holder, :with_courses)
    expect(complete_holder.first_course).to be_an(Integer)
    registrations = complete_holder.create_each_registration

    expect(registrations.fourth.role).to eq("None")
    expect(registrations).to be_an(Array)
    expect(registrations.first).to be_a(CourseRegistration)
  end
end
