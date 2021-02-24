source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'mysql2'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'active_model_serializers'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'devise'
gem 'bugsnag'

gem 'execjs', '2.7.0'

gem 'mobility', '~> 0.8.13'
gem "administrate"
gem "administrate-field-mobility", "0.0.1"
gem 'administrate-field-paperclip'
gem 'kt-paperclip'
gem 'aws-sdk-s3', require: false

# needed by sendgrid
gem 'mail-x_smtpapi'
gem 'premailer-rails'

gem 'fcm'

# character count in textarea
gem 'voncount'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.0.1'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'spring-commands-rspec'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'airborne'
  gem 'rspec-collection_matchers'
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
