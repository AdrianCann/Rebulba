source 'https://rubygems.org'

ruby '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

gem "backbone-on-rails"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', :require => 'bcrypt'

gem 'omniauth-facebook'
# Use unicorn as the app server
# gem 'unicorn'
gem "paperclip", "~> 4.1"
gem 'aws-sdk', '~> 1.5.7'
# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
gem 'figaro'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'debugger'
  gem "letter_opener"
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'launchy'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem "shoulda-matchers"
end

gem 'rails_12factor', group: :production
