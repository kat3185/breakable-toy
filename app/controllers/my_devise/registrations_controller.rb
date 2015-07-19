class MyDevise::RegistrationsController < Devise::RegistrationsController
  def new
    @student = Student.new
    super
  end

  def create
    super
    if resource.save
      if !Student.where("lower(email) = ?", resource.email.downcase).empty?
        @student = Student.find_by("lower(email) = ?", resource.email.downcase)
      else
        @student = Student.new(student_params)
        @student.save
      end
      @student.user = resource
      resource.student = @student
    end
  end

  protected

  def student_params
    a = params.require(:student).permit(:first_name, :last_name)
    b = params.require(:user).permit(:email)
    a.merge(b)
  end
end
