source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '7.0.0'
# Use postgres as the database for Active Record
gem 'pg', '~> 1.1.0'
# Use Puma as the app server
gem 'puma', '~> 5.5.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# use slugs rather than ids
gem 'friendly_id'

# APIs
gem 'discogs-wrapper'
gem 'lastfm'

# cron
gem 'whenever'

# pagination
gem 'pagy', '~> 5.2'

# search
gem 'ransack', github: 'activerecord-hackery/ransack'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'jsbundling-rails'
gem 'cssbundling-rails'
gem 'hotwire-rails'

group :development, :test do
  gem 'awesome_print'
  gem 'byebug'
  gem 'factory_bot_rails'
end

group :development do
  gem 'i18n-debug'
  gem 'listen',                 '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen',  '~> 2.0.0'
  gem 'web-console',            '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara',         '>= 2.15', '< 4.0'
  gem 'database_cleaner'
  gem 'faker',            git: 'https://github.com/stympy/faker.git', branch: 'master'
  gem 'rspec-rails',      '~> 4.0.1'
  gem 'selenium-webdriver'
  gem 'simplecov',        require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
