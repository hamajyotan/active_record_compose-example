source "https://rubygems.org"

gem "rails", "~> 8.1.1"

# database
gem "sqlite3", ">= 2.1"

# webserver
gem "puma", ">= 5.0"

# assets
gem "importmap-rails"
gem "propshaft"
gem "turbo-rails"
gem "stimulus-rails"

gem "active_record_compose"
gem "bcrypt", "> 3.1.7"
gem "bootsnap", require: false
gem "solid_cable"
gem "solid_cache"
gem "solid_queue"
gem "thruster", require: false
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "letter_opener_web"
  gem "ruby-lsp", require: false
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
