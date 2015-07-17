class CourseRegistrationsController < ApplicationController

  def destroy
    if current_user && current_user.admin?
      @registration = CourseRegistration.find(params[:id])
      @registration.destroy
      flash[:notice] = "Registation removed."
      redirect_to courses_path
    else
      redirect_to "http://www.reddit.com"
    end
  end

end
