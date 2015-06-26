class CourseMeeting < ActiveRecord::Base
  belongs_to :course
  belongs_to :meeting_date

  validates :course_id, presence: true
  validates :meeting_date_id, presence: true
end
