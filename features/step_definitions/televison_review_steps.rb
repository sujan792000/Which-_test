Given(/^I am on the television review page$/) do
  television_review_page.go_to('http://www.which.co.uk/reviews/televisions')
end

Then(/^breadcrumb "([^"]*)" should displayed$/) do |breadcrumb|
  television_review_page.bread_crum_text.should == breadcrumb
end

And(/^number of results text should be displayed$/) do
  television_review_page.results_text.should == 'television reviews'
  television_review_page.total_items_per_page.should <= 48
end

And(/^Two google add frame should be displayed$/) do
  television_review_page.google_add_frame
end

When(/^I click sort by high to low$/) do
  television_review_page.select_sort_by
end

Then(/^highest price tv should be displayed$/) do
  for i in 2..5
    expect(television_review_page.get_each_television_price(i) > television_review_page.get_each_television_price(i + 1))
  end
end

When(/^I choose screen size as "([^"]*)" inches$/) do |screen_size|
  television_review_page.select_filter_screen_size(screen_size)
end

Then(/^screen size between "([^"]*)" and "([^"]*)" televisions are should be displayed$/) do |start_size, end_size|
  for i in 2..6
    television_review_page.television_size.to_ishould be_between(start_size.to_i, end_size.to_i)
  end
end