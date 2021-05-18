source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

# base
gem 'rails', '~> 5.2'

# DB
gem 'mysql2', '~> 0.5', '< 0.6.0'

# server
gem 'puma', '~> 4.3'
gem 'thin', "~> 1.7" # https接続（bundle exec thin start --ssl)

# view
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '~> 4.1'
gem 'coffee-rails', '~> 4.2'
gem 'bootstrap', '~> 4.1'
gem 'jquery-rails', "~> 4.3"
gem 'jquery-ui-rails', "~> 6.0"
gem "font-awesome-rails", "~> 4.7"
gem 'toastr-rails', "~> 1.0"

# ログイン周り
gem 'omniauth', "~> 1.8"
gem 'omniauth-facebook', "~> 5.0"
gem 'devise', '~> 4.4'

# 環境変数
gem 'dotenv-rails', "~> 2.4"

# 画像
gem 'carrierwave', "~> 1.2"
gem 'rmagick', "~> 2.16"

# エラー画面をわかりやすく整形してくれる
gem 'better_errors', "~> 2.4"
gem 'binding_of_caller', "~> 0.8"

# ruby/railsの文法管理
gem 'rubocop', "~> 0.56"

# modelなどにテーブルの注釈追加
gem 'annotate', "~> 2.7"

# gemのバージョンを追加
gem 'pessimize', "~> 0.4"

# viewでmodel絡みのメソッドを書きたいときのためのdecorator
gem 'active_decorator', "~> 1.0"

# スクレイピング用
gem 'nokogiri', "~> 1.8"

# enumの日本語化
gem 'enum_help', "~> 0.0"

# 検索用
gem 'ransack', "~> 2.0"

# else
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '~> 1.3', require: false

# ページネーション
gem 'kaminari', '~> 0.17'
gem 'kaminari-bootstrap', '~> 3.0'

# i18n日本語
gem 'rails-i18n', "~> 5.1"

group :production do
  gem 'pg', "~> 1.1"
  gem 'fog-aws'
end

group :development do
  gem 'web-console', '~> 3.6'
  gem 'listen', '~> 3.1', '< 3.2'
  gem 'spring', "~> 2.0"
  gem 'spring-watcher-listen', '~> 2.0'
  gem 'spring-commands-rspec', "~> 1.0"
  gem 'pry-rails', "~> 0.3"
  gem 'pry-byebug', "~> 3.6"
end

group :test do
  gem 'capybara', '~> 3.1', '< 4.0'
  gem 'selenium-webdriver', "~> 3.12"
  gem 'chromedriver-helper', "~> 1.2"
end

group :development, :test do
  gem 'byebug', "~> 10.0", platforms: [:mri, :mingw, :x64_mingw]

  # Rspec
  gem 'rspec-rails', "~> 3.7"
  gem 'factory_bot_rails', "~> 4.10"
  gem 'active_decorator-rspec', "~> 0.0"
  gem 'database_cleaner', "~> 1.7"

  # N+1問題検出
  gem 'bullet', "~> 5.7"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
