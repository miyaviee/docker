require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

Capybara.register_driver :poltergeist_sp do |app|
  Capybara::Poltergeist::Driver.new(app, :js_errors => true, :window_size => [320, 568])
end

session = Capybara::Session.new(:poltergeist_sp)

session.driver.headers = { 'User-Agent' => 'iPhone' }

session.visit 'http://192.168.33.10/sp/s/party/?av=1&dt=20160501100000'

session.save_screenshot session.title + '.png', :full => true

session.click_link '変更'

session.save_screenshot session.title + '.png', :full => true

session.all('a.js-slide-arrow').each {|a| a.click if a.text == '北海道・東北'}

session.save_screenshot session.title + '.png', :full => true

session.click_link '北海道'

session.save_screenshot session.title + '.png', :full => true

session.click_link '全国版へ'

session.save_screenshot session.title + '.png', :full => true

session.click_link '変更'

session.save_screenshot session.title + '.png', :full => true

session.click_link '北海道'

session.save_screenshot session.title + '.png', :full => true

session.click_link '個室のあるお店'

session.save_screenshot session.title + '.png', :full => true

session.click_link '少人数で個室'

session.save_screenshot session.title + '.png', :full => true


