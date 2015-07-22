class Instructor < ActiveRecord::Base
  has_many :course_instructors
  has_many :courses, through: :course_instructors
  belongs_to :user
  accepts_nested_attributes_for :user

  

  validates :full_name, presence: true
  validates :body, presence: true
  validates :email, presence: true
end
