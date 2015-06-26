class MeetingDate  < ActiveRecord::Base
  has_many :course_meetings
  has_many :courses, through: :course_meetings

  validates :first, presence: true
end
