class CourseRegistrationMailer < ApplicationMailer
  def new_registration(registrations)
    @registrations = registrations
    mail(
      to: registrations.first.student.email,
      subject: "New School Swing registration for #{registrations.first.course.meeting_dates.first.third.strftime("%B")} classes!"
    )
  end
end
