require 'rails_helper'

RSpec.describe CourseReview, type: :model do

  it "has a working factory" do
    FactoryGirl.create(:course_review)
    expect(CourseReview.first).to be_a(CourseReview)
    expect(CourseReview.first.body).to be_a(String)
  end

  it "can belong to a course" do
    course = FactoryGirl.create(:course)
    review = FactoryGirl.create(:course_review, course: course)
    expect(review.course).to eq(course)
  end

  it "can have a name" do
    review = FactoryGirl.create(:course_review, name: "Robbob")
    expect(review.name).to eq("Robbob")
  end
end
