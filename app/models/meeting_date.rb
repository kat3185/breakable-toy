class MeetingDate  < ActiveRecord::Base
  has_many :course_meetings
  has_many :courses, through: :course_meetings

  def month_weekday
    first.strftime('%A %B')
  end

  validates :first, presence: true
end
