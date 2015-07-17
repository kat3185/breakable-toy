class CourseReview  < ActiveRecord::Base
  has_one :course

  validates :body, presence: true
end
