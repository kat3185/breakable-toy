class RegistrationHolder < ActiveRecord::Base
  belongs_to :student

  def assign_courses
    courses = MeetingDate.all[-4..-3].map {|day| day.courses}.flatten!
    courses = courses.map { |course| course.id }
    self.first_course = courses[0]
    self.second_course = courses[1]
    self.third_course = courses[2]
    self.fourth_course = courses[3]
  end

  def create_each_registration
    assign_courses
    registrations = []
    registrations << Registration.new(student_id: self.student_id,
                                     course_id: self.first_course,
                                     role: self.first_role)

    registrations << Registration.new(student_id: self.student_id,
                                      course_id: self.second_course,
                                      role: self.second_role)

    registrations << Registration.new(student_id: self.student_id,
                                      course_id: self.third_course,
                                      role: self.third_role)

    registrations << Registration.new(student_id: self.student_id,
                                     course_id: self.fourth_course,
                                     role: self.fourth_role)

                                     registrations
  end
end
