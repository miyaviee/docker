require 'spec_helper'
require 'capybara/rspec'
require 'capybara/poltergeist'

feature 'test' do
  before do
    page.driver.headers = {'User-Agent' => 'iPhone'}
    page.driver.resize 320, 568
  end

  after do
    page.save_screenshot page.title + '.png', :full => true
  end

  scenario 'hokkaido' do
    visit 'http://r.gnavi.co.jp/sp/s/kansougei/'
  end
end
