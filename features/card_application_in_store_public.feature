@card_info3
Feature: In store private Card information
  As a user
  I want to
  provide card information


#  @watir
#  Scenario: in store private Submit the card information
#    Given I am on xxx in store public ipad home page
#    When I provide the in store public ipad customer information
#    And I select continue button
#    And I agree to term and conditions
#    Then I should see the confirmation pending message


  ##Pre Decision Short AOD
  @watir
  Scenario: In store public private verify the Pre Decision Short AOD
    Given I am on xxx in store public ipad home page
    When In Store public I provide first name as Test ssn 999999999 and address as Approved
    And I select continue button
    Then I should see the correct short Rate & Fee Information


  @watir
  Scenario: In store public verify the Electronic Disclosure Consent
    Given I am on xxxx in store public ipad home page
    When In Store public I provide first name as Test ssn 999999999 and address as Approved
    And I select continue button
    Then I should see the xxxx instore public correct Electronic Disclosure Consent
    And I agree to term and conditions

  @watir
  Scenario: In store public Verify the processing page
    Given I am on xxxx in store public ipad home page
    When In Store public I provide first name as Test ssn 999999999 and address as Approved
    And I select continue button
    And I agree to term and conditions
    Then I should see the processing page

  @watir
  Scenario Outline: In store public Verify Message Submit the card information
    Given I am on xxx in store public ipad home page
    When In Store public I provide first name as Test ssn 999999999 and address as <addressLine1>
    And I select continue button
    And I agree to term and conditions
    Then I should see the confirmation message as <final_message>
    Examples:
      |addressLine1	          |	final_message                                                        |
      |Approved	              | Congratulations, Test! You're approved.                               |
      |Declined	              |	Thanks for applying.  We need more time to review your application, so look out for a letter from us in 10-30 days with more information.|
      |Pending-SendLetter     | Thanks for applying.  We need more time to review your application, so look out for a letter from us in 10-30 days with more information.|
      |Pending-CallMe	      |	Please call us now at 555-555-5555 to complete this application.       |
      |404-PartnerRef	      |	Thanks for your patience               |
      |404-AppRef		      |	Thanks for your patience               |
      |400		              |	Thanks for your patience               |
      |500		              |	Thanks for your patience               |
      |Approved-Preferred     |	Congratulations, Test! You're approved.                               |
      |Approved-PreferredPlus |	Congratulations, Test! You're approved.                               |
