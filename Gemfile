# frozen_string_literal: true

source "https://rubygems.org"

# gem "rails"

gem "sinatra-activerecord"
gem "rake"
gem "sqlite3"
gem "activerecord"
gem "require_all"

group :development do
  # Used to generate seed data
  # https://github.com/faker-ruby/faker
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'main'
  
  gem "pry"
end

# These gems will only be used when we are running tests
group :test do
  gem "database_cleaner"
  gem "rspec"
end