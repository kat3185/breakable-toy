require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can have a role associated with it' do
    user = FactoryGirl.create(:user)
    expect(user.role).to eq(nil)
  end
end
