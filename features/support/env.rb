require 'capybara/cucumber'
require 'rspec/expectations'
require_relative('../../pages/television_review_page')

Capybara.default_driver = :selenium

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome,switches: %w[--disable-popup-blocking)])
end

Capybara.default_driver = :selenium_chrome
Capybara.javascript_driver = :selenium_chrome
Capybara.default_max_wait_time = 10

module CustomWorld
  def television_review_page
    TelevisionReviewPage.new
  end
end

World(CustomWorld)
