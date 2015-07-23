require 'rails_helper'

RSpec.describe MeetingDate, type: :model do
  let(:date) { FactoryGirl.create(:meeting_date) }

  it 'had a working factory' do
    expect(date).to be_a(MeetingDate)
    expect(date.first).to be_a(Date)
    expect(date.second).to be_a(Date)
    expect(date.third).to be_a(Date)
    expect(date.fourth).to be_a(Date)
  end

  it "#month_weekday" do
    expect(date.month_weekday).to eq("Monday July")
  end
end
