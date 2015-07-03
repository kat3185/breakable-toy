class CoursesController < ApplicationController

  def index
    @current_monday_courses = MeetingDate.all[-4].courses
    @current_tuesday_courses = MeetingDate.all[-3].courses
    @upcoming_monday_courses = MeetingDate.all[-2].courses
    @upcoming_tuesday_courses = MeetingDate.all[-1].courses
  end

  def show
    @class = Course.find_by(id: params[:id])
  end
end
