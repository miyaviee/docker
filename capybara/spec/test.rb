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

  scenario 'test' do
    visit '?av=1&dt=20160501100000'
    page.save_screenshot page.title + '.png', full: true

    click_link 'エリアから探す'
    page.save_screenshot page.title + '.png', full: true

    all('a.js-slide-arrow').each {|a| a.click if a.text == '北海道・東北'}
    page.save_screenshot page.title + '.png', full: true

    click_link '北海道'
    page.save_screenshot page.title + '.png', full: true

    click_link 'もっとみる'
    page.save_screenshot page.title + '.png', full: true

    all('a').first.click
    page.save_screenshot page.title + '.png', full: true
  end
end
