class CoursesController < ApplicationController

  def index
    this_month = MeetingDate.where('extract(month from third) = ?', Date.today.month)
    next_month = MeetingDate.where('extract(month from third) = ?', Date.today.month.next)
    @upcoming_courses = [this_month, next_month]
  end

  def show
    @class = Course.find_by(id: params[:id])
  end
end
