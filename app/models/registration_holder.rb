class RegistrationHolder < ActiveRecord::Base
  belongs_to :student

  def assign_courses
    dates = MeetingDate.where('extract(month from third) = ?', self.month)
    courses = dates.map {|day| day.courses}.flatten!
    courses = courses.map { |course| course.id }
    self.first_course = courses[0]
    self.second_course = courses[1]
    self.third_course = courses[2] if courses[2]
    self.fourth_course = courses[3] if courses[3]
    self.fifth_course = courses[4] if courses[4]
    self.sixth_course = courses[5] if courses[5]
  end

  def create_each_registration
    assign_courses
    registrations = []
    registrations << CourseRegistration.new(student_id: self.student_id,
                                     course_id: self.first_course,
                                     role: self.first_role)

    registrations << CourseRegistration.new(student_id: self.student_id,
                                      course_id: self.second_course,
                                      role: self.second_role)

    registrations << CourseRegistration.new(student_id: self.student_id,
                                      course_id: self.third_course,
                                      role: self.third_role)

    registrations << CourseRegistration.new(student_id: self.student_id,
                                     course_id: self.fourth_course,
                                     role: self.fourth_role)

                                     registrations
  end
end
