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
    filename = "log/#{example.full_description}.png".gsub ' ', '/'
    dirname = File.dirname filename
    FileUtils.mkdir_p dirname unless File.exist? dirname
    page.save_screenshot filename, :full => true
  end

  scenario '東京の少人数で個室' do
    visit 'http://192.168.33.10/'
    click_link '個室のあるお店'
    select '東京', from: 'theme', visible: false
    sleep 3
    click_link '少人数で個室'
  end
end
