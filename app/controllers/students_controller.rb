class StudentsController < ApplicationController

  def new
    @month = params[:format]
    @student = Student.new
    @registration = CourseRegistration.new
  end

  def index
    @students = Student.all
  end

  def create
    if current_user
      @student = current_user.student
    else
      @student = Student.new(student_params)
      @student.save
      binding.pry
    end
    if @student.id
      registrations = create_course_registrations(params[:student][:course_registrations])
      if false #remove to make functional
        Stripe.api_key = STRIPE_TEST_SECRET_KEY
        token = params[:stripeToken]

        begin
          charge = Stripe::Charge.create(
            amount: owed(registrations.count, params[:student][:discount][:current_student]), # amount in cents, again
            currency: "usd",
            source: token,
            description: "Example charge"
          )
        rescue Stripe::CardError => e
        end
      end
      if true || charge && charge.paid #remove true to make functional
        registrations.each(&:process)
      end
      flash[:notice] = "Registeration complete!"
      redirect_to student_path(@student)
    else
      flash[:notice] = e
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    if @student.save
      flash[:notice] = "Student updated!"
      redirect_to student_path(@student)
    else
      flash[:notice] = @student.errors.full_messages
      render :edit
    end
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

  def create_course_registrations(course_list)
    registrations = Array.new
    course_list.each do |course|
      if course[:course_id] != "0" && course[:role] != ""
        registration = CourseRegistration.new(course_id: course[:course_id],
                                              student: @student,
                                              role: course[:role])
        if registration.save
          registrations << registration
        end
      end
    end
    registrations
  end

  def owed(course_count, discount)
    if course_count > 1
      return 9000 unless discount == 1
      return 7000
    elsif course_count == 1
      return 5000 unless discount == 1
      return 4000
    else
      return "ERROR"
    end
  end
end
