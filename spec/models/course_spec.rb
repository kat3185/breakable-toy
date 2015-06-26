require 'rails_helper'

RSpec.describe Course, type: :model do
  it 'is properly associated with other classes' do
    course = FactoryGirl.create(:course, :with_students)
    binding.pry
    expect()
  end


end
