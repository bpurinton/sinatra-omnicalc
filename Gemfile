source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'sinatra'
gem 'sinatra-contrib'

# Use Puma as the app server
gem 'puma', '~> 5.0'

# use active record
gem 'activerecord'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem "table_print"
  gem "appdev_support", github: "firstdraft/appdev_support", branch: "appdev-210-update-pryrc"
end

group :development, :test do
  gem "grade_runner", github: "firstdraft/grade_runner"
  gem 'pry'
  gem 'sqlite3', '~> 1.4'
end

group :test do
  gem 'capybara'
  gem "draft_matchers", github: "jelaniwoods/draft_matchers", branch: "main"
  gem 'rspec'
  gem 'rspec-html-matchers'
  gem 'webmock'
  gem 'webdrivers'
  gem 'i18n'
end
