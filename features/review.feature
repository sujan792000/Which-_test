Feature: As a user I want to open the television review page
  and accessing individual reviews

  Scenario: Should displayed correct details in the page
    Given I am on the television review page
    Then breadcrumb "TV & home entertainment" should displayed
    And number of results text should be displayed
    And Two google add frame should be displayed

  Scenario: Should be able displayed televisions by sort order
    Given I am on the television review page
    When I click sort by high to low
   Then highest price tv should be displayed

  Scenario: Should be able to displayed televisions by screen size
    Given I am on the television review page
    When I choose screen size as "24_32" inches
    Then screen size between "24" and "32" televisions are should be displayed

  # Additional Scenarios

#  Scenario: Should be able to displayed televisions by screen size and brand
#    Given I am on the television review page
#    When I choose screen size as "24-32 inches"
#    And I choose price brand as "LG"
#    Then Screen size between 24 to 32 LG televisions are should be displayed
#
#
#  Scenario OutLine: Should be able to displayed televisions by screen size and brand
#    Given I am on the television review page
#    When I choose combinations of filters <screen_size> <brands>
#    And I choose another combinations of filters <screen_type> <resolution>
#    Then televisions are should be displayed
#
#  Examples:
#  |screen_size|brands|screen_type|resolution|
#  |39-46|Samsung|LED|Full-HD|