class CourseRegistrationsController < ApplicationController

  def update
    binding.pry
  end

  def destroy
    @registration = CourseRegistration.find(params[:id])
    @registration.destroy
    flash[:notice] = "Student removed."
    redirect_to courses_path
  end

end
