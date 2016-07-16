@homepage_page2
Feature: Jordan In Store Private
  As a user
  I want to
  Register to jordan furniture in store private


#  @watir
#  Scenario: in store private verify the label on registration page
#    Given I am on jordans in store private home page
#    When I see first name label
#    Then I should see first name

  @watir
  Scenario: In store private Verify the global footer on homepage
    Given I am on jordans in store private home page
    When I look for Global Footer
    Then I should see correct footer links
    And correct privacy statement

  @watir
  Scenario: In store private Verify the global header on homepage
    Given I am on jordans in store private home page
    When I look for Global Header
    Then I should see correct header heading
    And correct header product details

  @watir
  Scenario Outline: In store private Verify all the footer links
    Given I am on jordans in store private home page
    When I should look for <footer_links>
    Then I should see the correct <footer_links> is opened
    Examples:
      |footer_links                |
      |Privacy & Security          |
      |FAQs                        |
      |Contact Us                  |
      |Website Terms & Conditions  |
      |Accessibility               |

  @watir
  Scenario: In store private Verify hamburger menu privacy link
    Given I am on jordans in store private home page
    When I select hamburger menu
    Then I should see the correct Privacy & Security is opened

#  @watir
#  Scenario: in store private Verify privacy pdf and opt out
#    Given I am on jordans in store private home page
#    When I select privacy pdf and opt out
#    Then I should see the modal title Jordan's Furniture PowerCharge® Card Important Disclosures

#    Error Messages
  @watir
  Scenario: In store private Verify the error messages
    Given I am on jordans in store private home page
    When I select continue button
    Then I should see jordans in store private error message inline
    And I see jordans in store private consolidate error messages in the end of the page

#Tool Tips
  @watir
  Scenario: In store private Verify the tool tips
    Given I am on jordans in store private home page
    When I select social security number
    And I select social income
    And I select email
    Then I should see the in-store private tool tips

     # FAQS content
  @watir
  Scenario: In store private Verify the FAQS in accessible menu
    Given I am on jordans in store private home page
    When I select accessible menu
    Then I should see the correct FAQS

    #Pre Decision Long AOD
  @watir
  Scenario: In store private Verify the Rate & Fee Information in accessible menu
    Given I am on jordans in store private home page
    When I select accessible menu
    Then I should see the jordan in-store private correct long Rate & Fee Information

  @watir
  Scenario: In store private verify the customer agreement in hamburger menu
    Given I am on jordans in store private home page
    When I select accessible menu
    Then I should see the jordan in-store private correct customer agreement

  @watir
  Scenario: In store private Verify privacy pdf and opt out
    Given I am on jordans in store private home page
    When I select accessible menu
    Then I should see the jordan in-store private correct privacy pdf and opt out


