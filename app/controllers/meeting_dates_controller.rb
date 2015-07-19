class MeetingDatesController < ApplicationController
  def destroy
    @date = MeetingDate.find(params[:id])
    @date.destroy
    flash[:message] = "Date obliterated."
    redirect_to courses_path
  end
end
