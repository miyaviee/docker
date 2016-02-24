require 'capybara/poltergeist'

Capybara.register_driver :poltergeist_sp do |app|
  Capybara::Poltergeist::Driver.new(app, :js_errors => true, :window_size => [320, 568])
end

session = Capybara::Session.new(:poltergeist_sp)

session.driver.headers = { 'User-Agent' => 'iPhone' }

session.visit 'http://192.168.33.10/sp/s/party/?av=1&dt=20160501100000'

session.save_screenshot 'index.png', :full => true

session.click_link 'エリアを選んでお店を探す'

session.save_screenshot 'pref_list.png', :full => true
