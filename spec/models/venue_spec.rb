require 'rails_helper'

RSpec.describe Venue, type: :model do
  it 'had a working factory' do
    venue = FactoryGirl.create(:venue)
    expect(venue).to be_a(Venue)
    expect(venue.building_name).to be_a(String)
    expect(venue.address).to be_a(String)
  end
end
