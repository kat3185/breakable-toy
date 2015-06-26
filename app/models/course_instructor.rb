class CourseInstructor < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :course

  validates :course_id, presence: true
  validates :instructor_id, presence: true
end
