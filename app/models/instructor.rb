class Instructor < ActiveRecord::Base
  has_many :course_instructors
  has_many :courses, through: :course_instructors

  validates :full_name, presence: true
  validates :bio, presence: true
  validates :email, presence: true
end
