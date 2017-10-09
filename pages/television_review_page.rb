class TelevisionReviewPage
  include Capybara::DSL
  include RSpec::Matchers

  def go_to(page_url)
    visit(page_url)
  end

  def bread_crum_text
    find(:css, "nav[aria-label='Breadcrumbs']>ul>li>a>span").text
  end

  def results_text
    find(:css, 'h1').text
  end

  def google_add_frame
    page.assert_selector('iframe[title="3rd party ad content"]', :count == 2)
  end

  def select_sort_by
    select('Price (high to low)', from: 'product_listing_sorter')
  end

  def get_each_television_price(item)
    price = page.find(:css, "ul[data-test-element='product-list']>li[itemprop='itemListElement']:nth-child(#{item}) p[itemprop='price']").text
    price.to_i
  end

  def total_items_per_page
    page.all(:css, "ul[data-test-element='product-list']>li[itemprop='itemListElement']").count
  end

  def select_filter_screen_size(screen_size)
    page.execute_script("$('#{facet_xpath(screen_size)}').click();")
  end

  def television_size
    size = page.find(:css, "ul[data-test-element='product-list']>li[itemprop='itemListElement']:nth-child(2) ._1ULbH").text
    size.delete! '"'
  end

  def facet_xpath(screen_size)
    case screen_size
      when "17_22"
        css = "#screen_size_17_23"
      when "24_32"
        css = "#screen_size_24_33"
      when "39_46"
        css = "#screen_size_39_47"
      when "47_50"
        css = "#screen_size_47_51"
      when "51_56"
        css = "#screen_size_51_56"
      when "60_65"
        css = "#screen_size_60_66"
    end
    css
  end

end