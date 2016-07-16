@homepage_page3
Feature: Jordan In Store Public
  As a user
  I want to
  Register to jordan furniture in store public


#  @watir
#  Scenario: in store public verify the label on registration page
#    Given I am on jordans in store public ipad home page
#    When I see first name label
#    Then I should see first name

  @watir
  Scenario: In store public Verify the global footer on homepage
    Given I am on jordans in store public ipad home page
    When I look for GLobal Footer Public
    Then I should see in store public ipad correct footer links
    And  correct privacy statement in store public ipad

  @watir
  Scenario: In store public Verify the global header on homepage
    Given I am on jordans in store public ipad home page
    When I look for Global Header
    Then I should see correct header heading
    And correct header product details

  @watir
  Scenario Outline: In store public Verify all the footer links
    Given I am on jordans in store public ipad home page
    When I should look for <footer_links>
    Then I should see the correct <footer_links> is opened
    Examples:
      |footer_links                 |
      |Exit Application             |
      |Privacy & Security           |
      |FAQs                         |
      |Contact Us                   |
      |Website Terms & Conditions   |
      |Accessibility                |

  @watir
  Scenario: In store public Verify hamburger menu privacy link
    Given I am on jordans in store public ipad home page
    When I select hamburger menu
    Then I should see the correct Privacy & Security is opened

#  @watir
#  Scenario: in store public Verify privacy pdf and opt out
#    Given I am on jordans in store public ipad home page
#    When I select privacy pdf and opt out
#    Then I should see the modal title Jordan's Furniture PowerCharge® Card Important Disclosures

#    Error Messages
  @watir
  Scenario: In store public Verify the error messages
    Given I am on jordans in store public ipad home page
    When I select continue button
    Then I should see jordans in-store public error message inline
    And I should see jordans in-store public consolidate error messages in the end of the page

    #Tool Tips
  @watir
  Scenario: In store public Verify the tool tips
    Given I am on jordans in store public ipad home page
    When I select social security number
    And I select social income
    Then I should see tool tips

     # FAQS content
  @watir
  Scenario: In store public Verify the FAQS in accessible menu
    Given I am on jordans in store public ipad home page
    When I select accessible menu
    Then I should see the correct FAQS

    #Pre Decision Long AOD
  @watir
  Scenario: In store public Verify the Rate & Fee Information in accessible menu
    Given I am on jordans in store public ipad home page
    When I select accessible menu
    Then I should see the jordan instore public correct long Rate & Fee Information

  @watir
  Scenario: In store public verify the customer agreement in hamburger menu
    Given I am on jordans in store public ipad home page
    When I select accessible menu
    Then I should see the jordan instore public correct customer agreement

  @watir
  Scenario: In store public Verify privacy pdf and opt out
    Given I am on jordans in store public ipad home page
    When I select accessible menu
    Then I should see the jordan instore public correct privacy pdf and opt out
