require 'rails_helper'

RSpec.describe MeetingDate, type: :model do
  it 'had a working factory' do
    date = FactoryGirl.create(:meeting_date)
    
    expect(date).to be_a(MeetingDate)
    expect(date.first).to be_a(Date)
    expect(date.second).to be_a(Date)
    expect(date.third).to be_a(Date)
    expect(date.fourth).to be_a(Date)
  end
end
