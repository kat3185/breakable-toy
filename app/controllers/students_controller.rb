class StudentsController < ApplicationController

  def new
    @student = Student.new
  end

  def index
    @students = Student.all
  end

  def create
    if current_user && current_user.student.nil?
      @student.user = current_user
      current_user.student = @student
    end
    if Student.where(student_params).exists?
      @student = Student.where(student_params)
      redirect_to new_student_registration_holder_path(@student.first.id)
    else
      @student = Student.new(student_params)
      if @student.save
        flash[:notice] = "Student instantiated."
        redirect_to new_student_registration_holder_path(@student.id)
      else
        flash[:notice] = "Student NOT instantiated."
        render :new
      end
    end
  end

  def show
    @student = Student.find(params[:id])
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
