require 'rails_helper'

RSpec.describe CourseMeeting, type: :model do
  it 'has a working factory' do
    meet = FactoryGirl.create(:course_meeting)
    
    expect(meet).to be_a(CourseMeeting)
    expect(meet.course).to be_a(Course)
    expect(meet.meeting_date).to be_a(MeetingDate)
  end
end
