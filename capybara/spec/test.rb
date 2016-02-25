require 'spec_helper'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

Capybara.register_driver :poltergeist_sp do |app|
  Capybara::Poltergeist::Driver.new(app, :js_errors => true, :window_size => [320, 568])
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :poltergeist_sp
  config.app_host = 'http://192.168.33.10/sp/s/party/'
end

feature 'test' do
  before {page.driver.headers = { 'User-Agent' => 'iPhone'}}

  scenario 'test' do
    visit '?av=1&dt=20160501100000'
    page.save_screenshot page.title + '.png', full: true
  end
end
