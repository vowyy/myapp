source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.3.3'

# base
gem 'rails', '~> 5.2.0'

# DB
gem 'mysql2', '>= 0.4.4', '< 0.6.0'

# server
gem 'puma', '~> 3.11'
gem 'thin' # https接続（bundle exec thin start --ssl)

# view
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'jquery-rails'

# else
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

# ログイン周り
gem 'omniauth'
gem 'omniauth-facebook'
gem 'devise', '~> 4.2'

# 環境変数
gem 'dotenv-rails'

# 画像
gem 'carrierwave'
gem 'rmagick'

# エラー画面をわかりやすく整形してくれる
gem 'better_errors'
gem 'binding_of_caller'

gem 'rubocop'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  # Rspec
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
