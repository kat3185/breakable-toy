class CoursesController < ApplicationController

  def index
    this_month = MeetingDate.where('extract(month from third) = ?', Date.today.month)
    next_month = MeetingDate.where('extract(month from third) = ?', Date.today.month.next)
    @upcoming_courses = [this_month, next_month]
  end

  def new
    @course = Course.new
    @dates = [["", 0]] + MeetingDate.all.map { |a| [a.month_weekday, a.id] }
    @date = MeetingDate.new
  end

  def create
    if current_user.admin?
      @course = Course.new(course_params)
      if params[:meeting_date] == "0"
        @date = create_dates(params[:course][:meeting_date][0][:first])
        @date.save
      else
        @date = MeetingDate.find(params[:meeting_date])
      end
      if @course.save
        flash[:notice] = "Your course was created!"
        CourseMeeting.create(course: @course, meeting_date: @date)
        redirect_to courses_path
      else
        flash[:notice] = @course.errors.full_messages
        render :new
      end
    else
      redirect_to "http://www.reddit.com"
    end
  end

  def show
    @class = Course.find_by(id: params[:id])
    @course_review = CourseReview.new
    @course_reviews = CourseReview.where(course_id: params[:id])
  end

  def edit
    @course = Course.find_by(id: params[:id])
    @dates = MeetingDate.all.map { |a| [a.month_weekday, a.id] }
    @date = MeetingDate.new
  end

  def update
    if current_user && current_user.admin?
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
    else
      redirect_to "http://www.reddit.com"
    end
  end

  def destroy
    if current_user && current_user.admin?
      @course = Course.find(params[:id])
      if @course.destroy
        flash[:notice] = "That class was wimpy anyway."
      else
        flash[:notice] = "I'm sorry Dave, I can't do that."
      end
      redirect_to courses_path
    else
      redirect_to "http://www.reddit.com"
    end
  end


  protected
  def course_params
    params.require(:course).permit(:title, :description, :time, :body, :venue_id)
  end

  def create_dates(first_date)
    date = MeetingDate.new
    first = Date.parse(first_date)
    date.first = first
    date.second = first.next_day(7)
    date.third = first.next_day(14)
    date.fourth = first.next_day(21)
    date
  end
end
