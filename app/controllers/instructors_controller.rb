class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
    @instructor = Instructor.new
  end

  def create
    if current_user && current_user.admin?
      @instructor = Instructor.new(instructor_params)
      if @instructor.save
        flash[:notice] = "Instructor created!"
        redirect_to instructors_path
      else
        flash[:notice] = @instructor.errors.full_messages
        render :index
      end
    else
      redirect_to "http://www.reddit.com"
    end
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    if current_user && current_user.admin? || current_user.instructor == @instructor
      @instructor.update(instructor_params)
      if @instructor.save
        flash[:notice] = "I'm glad you stopped lying about yourself!"
        redirect_to instructors_path
      else
        flash[:notice] = @instructor.errors.full_messages
        render :edit
      end
    else
      redirect_to "http://www.reddit.com"
    end
  end

  def destroy
    if current_user && current_user.admin?
      @instructor = Instructor.find(params[:id])
      @instructor.destroy
      flash[:message] = "Instructor Obliterated!"
      redirect_to instructors_path
    else
      redirect_to "http://www.reddit.com"
    end
  end

  protected

  def instructor_params
    params.require(:instructor).permit(:full_name, :body, :email, :photo_url, :video_url)
  end
end
