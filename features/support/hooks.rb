Before do |scenario|
  page.driver.browser.manage.window.resize_to(1400,750)
  page.driver.browser.manage.delete_all_cookies
end

After do |scenario|
  ## logic that will run after each scenario

  if(scenario.failed?)
  # TODO: take screenshots
  end

end

AfterStep do |scenario|
  # logic that will run after each step in a scenario
end







