require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryGirl.create(:post) }

  it "has a working factory" do
    expect(post.title).to be_a(String)
    expect(post.body).to be_a(String)
    expect(post.user).to be_a(User)
  end
end
