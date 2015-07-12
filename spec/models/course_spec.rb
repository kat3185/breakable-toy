require 'rails_helper'

RSpec.describe Course, type: :model do
  it 'is can have students and registrations' do
    course = FactoryGirl.create(:course, :with_students)

    expect(course.course_registrations.first).to be_a(CourseRegistration)
    expect(course.students.first).to be_a(Student)
  end
  it 'is can have instructors and belongs to a venue' do
    course = FactoryGirl.create(:course, :with_instructors)

    expect(course.instructors.first).to be_an(Instructor)
    expect(course.venue).to be_a(Venue)
  end

  it 'can meet on a specific day' do
    course = FactoryGirl.create(:course, :with_meetings)

    expect(course.meeting_dates.first).to be_a(MeetingDate)
  end

  it 'can have all the things' do
    course = FactoryGirl.create(:course, :with_meetings, :with_instructors, :with_students)
    expect(course.instructors.first).to be_an(Instructor)
    expect(course.venue).to be_a(Venue)
    expect(course.meeting_dates.first).to be_a(MeetingDate)
    expect(course.course_registrations.first).to be_a(CourseRegistration)
    expect(course.students.first).to be_a(Student)
  end

end
