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
    @student = current_user_or_create(current_user, student_params)
    registrations = create_course_registrations(params[:student][:course_registrations])
    if false #stripe disabled by this
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
        flash[:message] = e
      end
    end
    if true || charge && charge.paid #stripe disabled by this
      registrations.each(&:process)
    end
    CourseRegistrationMailer.new_registration(registrations).deliver_later
    flash[:notice] = "Registeration complete!"
    redirect_to student_path(@student)
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
    if course[:course_id] != "0" && course[:role] != "0"
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

    end
  end

  def current_user_or_create(current_user, student_params)
    (current_user.student if current_user) || Student.find_or_create_by(student_params)
  end
end
