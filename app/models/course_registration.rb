class CourseRegistration  < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  def process
    self.paid = true
    save!
  end

  validates :student_id, presence: true
  validates :course_id, presence: true
end
