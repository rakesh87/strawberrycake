source 'https://rubygems.org'
ruby "2.1.0"

gem 'rails',                    '4.0.2'
gem 'unicorn',                  '4.6.3'
gem 'unicorn-worker-killer',    '0.4.2'
gem 'secure_headers',           '1.0.0'
gem 'jquery-rails',             '3.0.4'
gem 'haml-rails',               '0.4.0'
gem 'pg',                       '0.17.0'
gem 'rack-canonical-host',      '0.0.8'
gem 'bourbon',                  '3.1.8'
gem 'omniauth',                 '1.1.4'
gem 'omniauth-facebook',        '1.4.1'
gem 'jumpup-heroku',            github: 'Helabs/jumpup-heroku'

group :assets do
  gem 'sass-rails',             '4.0.1'
  gem 'coffee-rails',           '4.0.1'
  gem 'uglifier',               '2.2.1'
end

group :development do
  gem 'jumpup',                 '0.0.1'
  gem 'better_errors',          '1.0.1'
  gem 'binding_of_caller',      '0.7.2'
  gem "letter_opener",          '1.1.2'
end

group :test do
  gem 'shoulda-matchers',       '2.4.0'
  gem 'simplecov',              '0.7.1', require: false
  gem 'valid_attribute',        '1.3.1'
  gem 'email_spec',             '1.5.0'
  gem 'capybara',               '~> 2.1.0'
  gem 'poltergeist',            '1.4.1'
end

group :development, :test do
  gem 'rspec-rails',            '2.14.0'
  gem 'factory_girl_rails',     '4.3.0'
  gem 'pry-rails',              '0.3.2'
  gem 'dotenv-rails',           '0.9.0'
  gem 'awesome_print',          '1.2.0'
end
