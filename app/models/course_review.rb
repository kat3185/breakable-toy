class CourseReview < ActiveRecord::Base
  belongs_to :course

  validates :body, presence: true
end
