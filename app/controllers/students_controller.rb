class StudentsController < ApplicationController

  def new
    @student = Student.new
  end

  def index
    @students = Student.all
  end

  def create
    if Student.where(student_params).exists?
      @student = Student.where(student_params).first
      @student.assign_user(current_user) if current_user
      redirect_to new_student_registration_holder_path(@student.id)
    else
      @student = Student.new(student_params)
      @student.assign_user(current_user) if current_user
      if @student.save
        flash[:notice] = "Student instantiated."
        redirect_to new_student_registration_holder_path(@student.id)
      else
        flash[:notice] = "Student NOT instantiated."
        render :new
      end
    end
  end

  def edit
    binding.pry
  end

  def show
    @student = Student.find(params[:id])
  end

  def update
    binding.pry
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:message] = "Student obliterated."
    redirect_to students_path
  end

  protected
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end
end
