source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'rails_12factor'
gem 'puma', '~> 4.1'
gem 'webpacker', '~> 4.0'
gem 'bootsnap', '>= 1.5.1', require: false
gem 'sass-rails', require: false
gem 'rails-i18n'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'uglifier', '>=1.3.0'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'ffaker'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
end
