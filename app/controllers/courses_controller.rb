class CoursesController < ApplicationController

  def index
    this_month = MeetingDate.where('extract(month from third) = ?', Date.today.month)
    next_month = MeetingDate.where('extract(month from third) = ?', Date.today.month.next)
    @upcoming_courses = [this_month, next_month]
  end

  def new
    @course = Course.new
    @dates = MeetingDate.all.map { |a| [a.month_weekday, a.id] }
  end

  def create
    @course = Course.new(course_params)
    @date = MeetingDate.find(params[:meeting_date])
    if @course.save
      flash[:notice] = "Your course was created!"
      CourseMeeting.create(course: @course, meeting_date: @date)
      redirect_to courses_path
    else
      flash[:notice] = @course.errors.full_messages
      render :new
    end
  end

  def show
    @class = Course.find_by(id: params[:id])
  end

  def edit
    @course = Course.find_by(id: params[:id])
    @dates = MeetingDate.all.map { |a| [a.month_weekday, a.id] }
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    @date = MeetingDate.find(params[:meeting_date])
    if @course.meeting_dates.first != @date
      old_meeting = CourseMeeting.find_by(course: @course, meeting_date: @course.meeting_dates.first)
      old_meeting.delete
      new_meeting = CourseMeeting.new(course: @course, meeting_date: @date)
      new_meeting.save
    end
    if @course.save
      flash[:notice] = "Your course is now more correct!"
      redirect_to courses_path
    else
      flash[:notice] = @course.errors.full_messages
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      flash[:notice] = "That class was wimpy anyway."
    else
      flash[:notice] = "I'm sorry Dave, I can't do that."
    end
    redirect_to courses_path
  end


  protected
  def course_params
    params.require(:course).permit(:title, :description, :time, :venue_id)
  end
end
