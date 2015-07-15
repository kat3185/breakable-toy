class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      flash[:notice] = "Instructor created!"
      redirect_to instructors_path
    else
      flash[:notice] = @instructor.errors.full_messages
      render :new
    end
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    @instructor.update(instructor_params)
    if @instructor.save
      flash[:notice] = "I'm glad you stopped lying about yourself!"
      redirect_to instructors_path
    else
      flash[:notice] = @instructor.errors.full_messages
      render :edit
    end
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
    flash[:message] = "Instructor Obliterated!"
    redirect_to instructors_path
  end
  
  protected
  def instructor_params
    params.require(:instructor).permit(:full_name, :bio, :email)
  end
end
