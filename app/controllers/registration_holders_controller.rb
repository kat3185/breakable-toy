class RegistrationHoldersController < ApplicationController
  def new
    @registration_holder = RegistrationHolder.new(student_id: params[:student_id])
    @student = Student.find(params[:student_id])
    @this_month = MeetingDate.where('extract(month from first) = ?', Date.today.month)
    @next_month = MeetingDate.where('extract(month from first) = ?', Date.today.month.next)
  end

  def create
    @registrations = RegistrationHolder.new(holder_params)
    @registrations.student_id = params[:student_id]
    if @registrations.amount_owed.to_i == true #changed from > for deploy with stripe disabled
      Stripe.api_key = STRIPE_TEST_SECRET_KEY

      token = params[:stripeToken]
      begin
        charge = Stripe::Charge.create(
          amount: @registrations.amount_owed, # amount in cents, again
          currency: "usd",
          source: token,
          description: "Example charge"
        )
      rescue Stripe::CardError => e
      end
    end
    if true || charge && charge.paid #just for deploy
      @registrations = @registrations.create_each_registration
      @registrations.each(&:process)
      flash[:notice] = "Registration Created!"
      redirect_to student_path(params[:student_id])
    else
      flash[:notice] = e
      render :new
    end
  end

  protected
  def holder_params
    params.require(:registration_holder).permit(:first_role,
                                                :second_role,
                                                :third_role,
                                                :fourth_role,
                                                :fifth_role,
                                                :sixth_role,
                                                :month)
  end
end
