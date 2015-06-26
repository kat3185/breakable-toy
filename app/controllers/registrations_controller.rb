class RegistrationsController < ApplicationController
  def new
    @student = Student.find(params[:student_id])
    @registration = Registration.new
  end

end
