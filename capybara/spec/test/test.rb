require 'spec_helper'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'fileutils'

feature 'test' do
  before do
    page.driver.headers = {'User-Agent' => 'iPhone'}
    page.driver.resize 320, 568
  end

  after do |example|
    save_screenshot 'log/' + example.full_description.gsub(' ', '/') + '.png', full: true
  end

  scenario '新宿・代々木' do
  end
end
