class RegistrationHoldersController < ApplicationController
  def new
    @registration_holder = RegistrationHolder.new(student_id: params[:student_id])
    @student = Student.find(params[:student_id])
    @current_courses = MeetingDate.all[-4..-3].map {|day| day.courses}.flatten!
  end

  def create
    @registrations = RegistrationHolder.new(holder_params)
    @registrations.student_id = params[:student_id]
    @registrations = @registrations.create_each_registration
    @registrations.each do |registration|
      registration.process
    end
    flash[:notice] = "Registration Created!"
    redirect_to courses_path
  end

  protected
  def holder_params
    params.require(:registration_holder).permit(:first_role,
                                                :second_role,
                                                :third_role,
                                                :fourth_role,
                                                :fifth_role,
                                                :sixth_role)
  end
end
