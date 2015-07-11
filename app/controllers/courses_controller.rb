class CoursesController < ApplicationController

  def index
    @current_monday_courses = MeetingDate.all[-4].courses
    @current_tuesday_courses = MeetingDate.all[-3].courses
    @upcoming_monday_courses = MeetingDate.all[-2].courses
    @upcoming_tuesday_courses = MeetingDate.all[-1].courses

    this_month = MeetingDate.where('extract(month from third) = ?', Date.today.month)
    next_month = MeetingDate.where('extract(month from third) = ?', Date.today.month.next)
    @upcoming_courses = [this_month, next_month]
  end

  def show
    @class = Course.find_by(id: params[:id])
  end
end
