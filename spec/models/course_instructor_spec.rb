require "rails_helper"

RSpec.describe CourseInstructor, type: :model do
  it "has a working factory" do
    teach = FactoryGirl.create(:course_instructor)

    expect(teach).to be_a(CourseInstructor)
    expect(teach.instructor).to be_an(Instructor)
    expect(teach.course).to be_a(Course)
  end
end
