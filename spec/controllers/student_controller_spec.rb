require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  it "#create_course_registrations" do
    controller = StudentsController.new
    student = FactoryGirl.create(:student)
    controller.instance_variable_set(:@student, student)
    FactoryGirl.create_list(:course, 5)
    course_list = [{ course_id: Course.first.id, role: "Follow" }, { course_id: Course.second.id, role: "Lead" },
       { course_id: Course.third.id, role: "" }, { course_id: "0", role: ""}]

    registrations = controller.send(:create_course_registrations, course_list)
    expect(registrations.count).to eq(2)
  end

  it "#owed for 2 courses with student discount" do
    controller = StudentsController.new
    two_with_discount = controller.send(:owed, 2, 1)
    expect(two_with_discount).to eq(7000)
  end

  it "#owed for 1 course with student discount" do
    controller = StudentsController.new
    one_with_discount = controller.send(:owed, 1, 1)
    expect(one_with_discount).to eq(4000)
  end

  it "#owed for 2 courses" do
    controller = StudentsController.new
    two_without_discount = controller.send(:owed, 2, 0)
    expect(two_without_discount).to eq(9000)
  end

  it "#owed for 1 course" do
    controller = StudentsController.new
    one_without_discount = controller.send(:owed, 1, 0)
    expect(one_without_discount).to eq(5000)
  end

  it "#current_user_or_create not logged in" do
    controller = StudentsController.new
    student = controller.send(:current_user_or_create, nil, {first_name: "Bob", last_name: "TheBob", email: "Rob@bob.robbob"} )
    expect(student).to be_a(Student)
  end

  it "#current_user_or_create is logged in" do
    controller = StudentsController.new
    bob = FactoryGirl.create(:student)
    current_user = FactoryGirl.create(:user, student: bob)
    student = controller.send(:current_user_or_create, current_user, nil )
    expect(student).to be_a(Student)
  end
end
