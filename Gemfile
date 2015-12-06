source 'https://rubygems.org'

gem 'rails', '4.2.4'
gem 'mysql2', '~> 0.3.18'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
# gem 'omniauth-linkedin'
# gem 'omniauth-vkontakte'
# gem 'omniauth-github'
gem 'cancancan'

gem 'russian' # russian lang
gem 'kaminari' # paginations
gem 'mini_magick' # image processing
gem 'carrierwave' # file upload
gem 'aasm' # state machine
gem 'airbrake' # errbit notifications
gem 'bootstrap-sass', '~> 3.3' # bootstrap
gem 'autoprefixer-rails' # css prefixer
gem 'nprogress-rails' # turbolinks progressbar
gem 'searchlight', '~> 3.1.1'
gem 'config'
gem 'dotenv-rails'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :development do
  gem 'better_errors'
  gem 'meta_request'
  gem 'sextant'
  gem 'quiet_assets'
  gem 'bullet'
  gem 'brakeman', require: false
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end

group :production, :development do
  gem 'puma'
end

group :production do
  gem 'utf8-cleaner'
end

group :test, :development do
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'poltergeist'
  gem 'database_cleaner'
  # gem 'selenium-webdriver'
  gem 'rubocop', require: false
  gem 'faker'
end
