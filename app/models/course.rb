class Course < ActiveRecord::Base
  belongs_to :venue
  has_many :course_instructors
  has_many :instructors, through: :course_instructors
  has_many :course_registrations
  has_many :students, through: :course_registrations
  has_many :course_meetings
  has_many :meeting_dates, through: :course_meetings
  has_many :course_reviews

  validates :title, presence: true
  validates :description, presence: true
  validates :time, presence: true
end
