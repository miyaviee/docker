require 'capybara/poltergeist'

Capybara.register_driver :poltergeist_sp do |app|
  Capybara::Poltergeist::Driver.new(app, :js_errors => true, :window_size => [320, 568])
end

session = Capybara::Session.new(:poltergeist_sp)

session.driver.headers = { 'User-Agent' => 'iPhone' }

session.visit 'http://r.gnavi.co.jp/sp/s/kansougei/'

session.save_screenshot 'index.png', :full => true

test = {
  'エリアから探す' => 'pref_list.png',
  '東京' => 'pref.png',
}

test.each do |k,v|
  session.click_link k
  session.save_screenshot v, :full => true
end

