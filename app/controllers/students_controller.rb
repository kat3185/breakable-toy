class StudentsController < ApplicationController
  def new
    binding.pry
    @student = Student.new
  end
  def index
  end

  def create
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

  protected
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end
end
