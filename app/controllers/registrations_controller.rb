class RegistrationsController < ApplicationController
  def new
    @student = Student.find(params[:student_id])
    @current_courses = MeetingDate.all[-2..-1].map {|day| day.courses}.flatten!
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    flash[:notice] = "Student removed."
    redirect_to courses_path
  end

end
