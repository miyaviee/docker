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
  config.app_host = 'http://r.gnavi.co.jp/sp/s/kansougei/'
end

feature 'test' do
  before {page.driver.headers = { 'User-Agent' => 'iPhone'}}
  after  {page.save_screenshot page.title + '.png', full: true}

  scenario 'hokkaido' do
    visit current_path

    click_link 'エリアから探す'

    all('a.js-slide-arrow').each {|a| a.click if a.text == '北海道・東北'}

    click_link '北海道'
  end
end
