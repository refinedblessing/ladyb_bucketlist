source "https://rubygems.org"

gem "rails", "4.2.4"
gem "rails-api"
gem "sqlite3"
gem "active_model_serializers"
gem "doorkeeper"
gem "doorkeeper-jwt"
gem "jwt"
gem "rack-cors", require: "rack/cors"
gem "bcrypt"

group :development, :test do
  gem "rspec-rails"
  gem "pry"
  gem "spring"
  gem "factory_girl_rails"
  gem "database_cleaner"
  gem "codeclimate-test-reporter", require: nil
end

group :production do
  gem "pg"
  gem "rails_12factor"
  gem "puma", "2.11.1"
end
