source 'https://rubygems.org'
ruby "2.0.0"

gem 'rails', '4.0.0'
gem 'unicorn'
gem 'unicorn-worker-killer'
gem 'secure_headers'
gem 'jquery-rails'
gem 'haml-rails'
gem 'pg'
gem 'rack-canonical-host'
gem 'bourbon'
gem 'omniauth'
gem 'omniauth-facebook'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development do
  gem 'jumpup'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem "letter_opener"
end

group :test do
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'valid_attribute'
  gem 'email_spec'
  gem 'capybara'
  gem 'poltergeist'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'dotenv-rails'
  gem 'awesome_print'
end
