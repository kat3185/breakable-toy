require 'coveralls'
Coveralls.wear!('rails')
require 'support/user_sign_in_helper.rb'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before :each do
    ActionMailer::Base.deliveries.clear
  end

  config.include UserSignInHelper
end
