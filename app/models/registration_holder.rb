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

  def amount_owed
    course_count = 0
    course_count += 1 if first_role != "None"
    course_count += 1 if second_role != "None"
    course_count += 1 if third_role != "None"
    course_count += 1 if fourth_role != "None"
    if course_count > 1
      return 9000
    elsif course_count == 1
      return 5000
    else
      return "Error!"
    end
  end

  def create_each_registration
    assign_courses
    registrations = []
    registrations << CourseRegistration.new(student_id: self.student_id,
                                            course_id: first_course,
                                            role: first_role,
                                            paid: true)

    registrations << CourseRegistration.new(student_id: self.student_id,
                                            course_id: second_course,
                                            role: second_role,
                                            paid: true)

    registrations << CourseRegistration.new(student_id: self.student_id,
                                            course_id: third_course,
                                            role: third_role,
                                            paid: true)

    registrations << CourseRegistration.new(student_id: self.student_id,
                                            course_id: fourth_course,
                                            role: fourth_role,
                                            paid: true)

    registrations
  end
end
