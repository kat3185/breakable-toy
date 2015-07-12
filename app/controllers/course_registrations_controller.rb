class CourseRegistrationsController < ApplicationController

  def destroy
    @registration = CourseRegistration.find(params[:id])
    @registration.destroy
    flash[:notice] = "Student removed."
    redirect_to courses_path
  end

end
