require 'rails_helper'

RSpec.describe Course, type: :model do
  it 'had a working factory' do
    course = FactoryGirl.create(:course)
    
    expect(course.title).to be_a(String)
    expect(course.description).to be_a(String)
    expect(course.time).to be_a(String)
    expect(course.venue).to be_a(Venue)
    expect(course).to be_a(Course)
    expect(course.venue.courses.first).to be_a(Course)
  end

  it 'can have students and registrations' do
    course = FactoryGirl.create(:course, :with_students)

    expect(course.course_registrations.first).to be_a(CourseRegistration)
    expect(course.students.first).to be_a(Student)
    expect(course.students.first.courses.first).to be_a(Course)
    expect(course.course_registrations.first.course).to be_a(Course)
  end

  it 'is can have instructors' do
    course = FactoryGirl.create(:course, :with_instructors)

    expect(course.instructors.first).to be_an(Instructor)
    expect(course.instructors.count).to eq(2)
    expect(course.instructors.first.courses.first).to be_a(Course)
  end

  it 'can meet on a specific day' do
    course = FactoryGirl.create(:course, :with_meetings)

    expect(course.meeting_dates.first).to be_a(MeetingDate)
    expect(course.meeting_dates.count).to eq(1)
    expect(course.meeting_dates.first.courses.first).to be_a(Course)
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
