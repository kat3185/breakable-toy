require 'rails_helper'

RSpec.describe Instructor, type: :model do
  it 'has a working factory' do
    teach = FactoryGirl.create(:instructor)
    expect(teach.full_name).to be_a(String)
    expect(teach.bio).to be_a(String)
    expect(teach.email).to be_a(String)
    expect(Instructor.first).to be_an(Instructor)
  end

end
