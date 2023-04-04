$LOAD_PATH.unshift(File.join(__dir__, '..', 'spec'))

# Load Rails
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

# Load RSpec
require 'rspec/rails'
require 'factory_bot_rails'
require 'database_cleaner'

# Add additional requires below this line. Rails is not loaded until this point!

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
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
