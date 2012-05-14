ENV['RACK_ENV'] = 'test'
APP_ROOT = File.expand_path('../../..', __FILE__)

require File.join(APP_ROOT, 'server')
Bundler.require :test
require 'capybara/cucumber'
Capybara.app = Sinatra::Application.new
Capybara.default_driver = ENV['SELENIUM'] ? :selenium : :webkit

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
