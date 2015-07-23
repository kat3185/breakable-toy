require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  it "#create_dates" do
    controller = CoursesController.new
    dates = controller.send(:create_dates, "2016-08-07")
    expect(dates).to be_a(MeetingDate)
    expect(dates.first).to be_a(Date)
    expect(dates.fourth).to be_a(Date)
  end
end
