class Registration  < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  def process
    if role != "None" || Registration.find_by(course_id: self.course_id, student_id: self.student_id).nil?
      save!
    end
  end

  validates :student_id, presence: true
  validates :course_id, presence: true
end
