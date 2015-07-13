class MyDevise::RegistrationsController < Devise::RegistrationsController

  def create
    super
    if resource.save
      if !Student.where("lower(email) = ?", resource.email.downcase).empty?
        @student = Student.where("lower(email) = ?", resource.email.downcase).first
        @student.user = resource
        resource.student = @student
      end
    end
  end

end
