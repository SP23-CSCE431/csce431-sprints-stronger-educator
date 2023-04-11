$LOAD_PATH.unshift(File.join(__dir__, '..', 'spec'))

# Load Rails
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

# Load RSpec
require 'rspec/rails'
require 'factory_bot_rails'
require 'database_cleaner'
require 'simplecov'
SimpleCov.start

# Add additional requires below this line. Rails is not loaded until this point!

# module IntegrationSpecHelper
#   def login_with_oauth(service = :Google)
#     Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
#     visit upload_path
#     click_link 'Sign in with Google'
#   end
# end

# Include FactoryBot methods
FactoryBot.find_definitions

# Configure RSpec
RSpec.configure do |config|
  # Use transactional fixtures
  config.use_transactional_fixtures = true

  # Use FactoryBot methods
  config.include FactoryBot::Syntax::Methods

  # Use Devise helpers
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :request

  # Use Capybara DSL
  config.include Capybara::DSL

  # Clean up the database
  config.before(:suite) do
    Rails.application.load_seed # loads seeds.rb
  end
  # config.before(:suite) do
  #   DatabaseCleaner.clean_with(:truncation)
  # end
  #
  config.after(:each) do
    DatabaseCleaner.strategy = :transaction
  end
  #
  # config.before(:each, js: true) do
  #   DatabaseCleaner.strategy = :truncation
  # end
  #
  config.after(:each) do
    DatabaseCleaner.start
  end
  #
  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end

  # config.include IntegrationSpecHelper, :type => :request

  # OmniAuth.config.test_mode = true
  #
  # OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
  #   :provider => 'google',
  #   :uid => '123545'
  #   # etc.
  # })

end



OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
  :provider => 'google',
  :uid => '123545',
  :info => {
    :name => "Test",
    :email => "test@test.com"
  },
  :credentials => {
    :token => "token",
    :secret => "secret"
  }
  # etc.
})
