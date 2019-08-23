source "https://rubygems.org"

gemspec

gem 'rails', '~> 6.0.0'
gem 'alchemy_cms', github: 'AlchemyCMS/alchemy_cms', branch: 'master'
gem 'sassc-rails'

unless ENV['CI']
  gem 'pry'
  gem 'spring-commands-rspec'
  gem 'launchy'
  gem 'github_fast_changelog', require: false
end

group :test do
  gem 'sqlite3' if ENV['DB'].nil? || ENV['DB'] == 'sqlite'
  gem 'mysql2'  if ENV['DB'] == 'mysql'
  gem 'pg', '~> 1.0' if ENV['DB'] == 'postgresql'
  if ENV['TRAVIS']
    gem "codeclimate-test-reporter", '~> 1.0', require: false
  end
end
