source "https://rubygems.org"

gem "rails", "4.2.4"
gem "rails-api"
gem "active_model_serializers"
gem "jwt"
gem "rack-cors", require: "rack/cors"
gem "bcrypt"

group :development, :test do
  gem "rspec-rails"
  gem "sqlite3"
  gem "pry"
  gem "spring"
  gem "factory_girl_rails"
  gem "database_cleaner"
  gem "codeclimate-test-reporter", require: nil
  gem "simplecov", require: false
end

group :production do
  gem "pg"
  gem "rails_12factor"
  gem "puma", "2.11.1"
end
