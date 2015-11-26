ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
if Rails.env.production?
  abort("The Rails environment is running in production mode!")
end
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require "simplecov"
SimpleCov.start "rails"
require "spec_helper"
require "rspec/rails"
require "factory_girl_rails"
require "database_cleaner"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner.start
    DatabaseCleaner.clean_with(:truncation)
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
  config.include FactoryGirl::Syntax::Methods
  config.include Requests::JsonHelpers, type: :controller
  config.include Requests::SignInHelpers, type: :controller
end
