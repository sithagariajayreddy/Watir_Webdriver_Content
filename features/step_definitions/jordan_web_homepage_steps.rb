Given(/^I am on registration home page$/) do
  puts "Test Executed on : #{Date.today.to_s}"
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  homepage.open
  wait_for_some_time 2
end

When(/^I see first name label$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  homepage.verify_textbox_firstname
end

Then(/^I should see first name$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  homepage.verify_textbox_firstname.should be true
end

When(/^I look for (Global Footer)$/) do |sheet_name|
  xls_parser = ParseXls.new
  @sheet_content = xls_parser.get_sheet(sheet_name)
  @sheet_content.nil?.should be false
end

When(/^I look for (Global Header)$/) do |sheet_name|
  xls_parser = ParseXls.new
  @sheet_content = xls_parser.get_sheet(sheet_name)
  @sheet_content.nil?.should be false
end

When(/^I look for (GLobal Footer Public)$/) do |sheet_name|
  xls_parser = ParseXls.new
  @sheet_content = xls_parser.get_sheet(sheet_name)
  @sheet_content.nil?.should be false
end

Then(/^I should see in store public ipad correct footer links$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  footer_links = @sheet_content[0]
  page_footer_links = homepage.get_footer_links
  puts "Actual : #{page_footer_links}"
  puts "\n Expected : #{footer_links}"
  expect(footer_links).to include(page_footer_links)
end

And(/^correct privacy statement in store public ipad$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  privacy_statement_sheet = @sheet_content[1]
  privacy_statement_page = homepage.get_privacy_statement_text
  puts"Actual: #{privacy_statement_page}"
  puts"Expected: #{privacy_statement_sheet}"
  expect(privacy_statement_sheet).to include(privacy_statement_page)
end

Then(/^I should see correct footer links$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  footer_links = [@sheet_content[1], @sheet_content[6] , @sheet_content[11] , @sheet_content[16] , @sheet_content[21]].join(" ")
  page_footer_links = homepage.get_footer_links
  puts "Actual : #{page_footer_links}"
  puts "\n Expected : #{footer_links}"
  expect(footer_links).to include(page_footer_links)
end

And(/^correct privacy statement$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  privacy_statement_sheet = @sheet_content[14]
  privacy_statement_page = homepage.get_privacy_statement_text
  puts"Actual: #{privacy_statement_page}"
  puts"Expected: #{privacy_statement_sheet}"
  expect(privacy_statement_sheet).to include(privacy_statement_page)
end


Then(/^I should see correct header heading$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  header_heading = @sheet_content[5]
  homepage.verify_header_heading(header_heading).should == true
end

And(/^correct header product details$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  header_product_detail = @sheet_content[5] + @sheet_content[8] + @sheet_content[11]
  product_header_text = homepage.get_header_product_detail
  puts "Actual : #{product_header_text}"
  puts "Expected : #{header_product_detail}"
 expect(header_product_detail).to include(product_header_text)
end

When(/^I should look for (.*)$/) do |footer_links|
 # wait_for_some_time 5
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  homepage.select_footer_links_by_name(footer_links)
  wait_for_some_time 2
end

Then(/^I should see the correct (.*) is opened$/) do  |footer_links|
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  case footer_links
    when 'Accessibility'
      @modal_title = homepage.get_new_page_title
    when 'Exit Application'
      homepage.exit_application
      @modal_title = homepage.get_homepage_title
    else
      @modal_title = homepage.get_modal_title
  end
  # if footer_links == 'Privacy/Security'
  #   footer_links = 'Privacy & Security'
  # end
  # if footer_links == 'Website Terms and Conditions'
  #   footer_links = 'Website Terms & Conditions'
  # end
  #wait_for_some_time 5
  case footer_links
    when "Accessibility"
      footer_links = "Capital One | Our Accessibility Commitment"
    when 'Exit Application'
      footer_links = "Jordans Furniture Power Charge Card"
    else
     "Do nothing"
  end
  wait_for_some_time 5
  @modal_title.should == footer_links
  puts "Actual: #{@modal_title}"
  puts "Expected:  #{footer_links}"
end

When(/^I select hamburger menu$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  homepage.select_hamburger_menu
  wait_for_some_time 3
  #@modal_title = homepage.get_modal_title
end

When(/^I select privacy pdf and opt out$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  homepage.select_privacy_pdf_opt_out
end

Then(/^I should see the modal title (.*)$/) do |page_title|
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  modal_title = homepage.get_privacy_opt_out_modal
  wait_for_some_time 3
  modal_title.include(page_title) == true
end

When(/^I select continue button$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  homepage.select_continue
end

Then(/^I should error message inline$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("HomepageInlineErrors").join(" ")
  page_errors = homepage.get_inline_errors
  puts "Actual : #{page_errors}"
  puts "Expected : #{sheet_content}"
  expect(sheet_content).to include(page_errors)
end

And(/^see consolidate error messages in the end of the page$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("HomepageEndErrors").join(" ")
  page_errors = homepage.get_form_end_errors
  puts "Actual : #{page_errors}"
  puts "Expected : #{sheet_content}"
  expect(sheet_content).to include(page_errors)
end

When(/^I select social security number$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("HomepageTooltips")
  @sheet_ssn_tool_tip = sheet_content[0]
  homepage.select_ssn
  @ssn_tool_tip = homepage.get_ssn_tool_tip
  # puts"Actual : #{@ssn_tool_tip}"
  # puts"Expected : #{@sheet_ssn_tool_tip}"
end

And(/^I select social income$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("HomepageTooltips")
  @sheet_income_tool_tip = sheet_content[1]
  homepage.select_income
  @income_tool_tip = homepage.get_income_tool_tip
  # puts"Actual : #{@income_tool_tip}"
  # puts"Expected : #{@sheet_income_tool_tip}"
end

And(/^I select email$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("HomepageTooltips")
  @sheet_email_tool_tip = sheet_content[2]
  homepage.select_email
  @email_tool_tip = homepage.get_email_tool_tip
end

Then(/^I should see tool tips$/) do
  expect(@sheet_ssn_tool_tip).to include(@ssn_tool_tip)
  expect(@sheet_income_tool_tip).to eq(@income_tool_tip)
  puts"Actual : #{ @ssn_tool_tip}"
  puts"Expected : #{@sheet_ssn_tool_tip}"
  puts"Actual : #{  @income_tool_tip}"
  puts"Expected : #{ @sheet_income_tool_tip}"
end

Then(/^I should see the in-store private tool tips$/) do
  expect(@sheet_ssn_tool_tip).to eq(@ssn_tool_tip)
  expect(@sheet_income_tool_tip).to eq(@income_tool_tip)
  expect(@sheet_email_tool_tip).to eq(@email_tool_tip)
  puts"Actual : #{ @email_tool_tip}"
  puts"Expected : #{@sheet_email_tool_tip}"
  puts"Actual : #{@ssn_tool_tip}"
  puts"Expected : #{@sheet_ssn_tool_tip}"
  puts"Actual : #{  @income_tool_tip}"
  puts"Expected : #{ @sheet_income_tool_tip}"
end

When(/^I select accessible menu$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  homepage.select_accessible_menu
end

Then(/^I should see the correct long Rate & Fee Information$/) do
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("AccessibleMenu")
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  rate_and_fee_text = homepage.get_rate_fee_content_long
  puts "Actual : \n#{rate_and_fee_text}"
  puts "\nExpected : \n#{sheet_content[2]}"
  # rate_and_fee_text.include?(sheet_content[0]).should == true
  expect(sheet_content[2]).to include(rate_and_fee_text)
end

Then(/^I should see the correct customer agreement$/) do
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("AccessibleMenu")
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  page_customer_agreement_text = homepage.get_customer_agreement
  puts "\nActual : #{page_customer_agreement_text}"
  puts "\nExpected : #{sheet_content[3]}"
  expect(sheet_content[3]).to include(page_customer_agreement_text)
end

Then(/^I should see the correct privacy pdf and opt out$/) do
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("AccessibleMenu")
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  page_privacy_text = homepage.get_privacy_pdf_and_opt_out
  puts "Actual : #{page_privacy_text}"
  puts "Expected : #{sheet_content[1]}"
  expect(sheet_content[1]).to include(page_privacy_text)
end


Then(/^I should see jordans in store private error message inline$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("InPrivateInlineError").join(" ")
  page_errors = homepage.get_inline_errors
  puts"Actual : #{page_errors}"
  puts"Expected : #{sheet_content}"
  expect(sheet_content).to include(page_errors)
  # (sheet_content == page_errors).should == true
end

And(/^I see jordans in store private consolidate error messages in the end of the page$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("InPrivateErrors").join(" ")
  page_errors = homepage.get_form_end_errors
  puts"Actual : #{ page_errors}"
  puts"Expected : #{sheet_content}"
  expect(sheet_content).to include(page_errors)
  # sheet_content.each do |row|
  #   unless page_errors.include?(row)
  #     puts row
  #     # .should be true
  #   end
  # end
  # (sheet_content.include?()).should == true
end

Then(/^I should see jordans in\-store public error message inline$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("InPrivateInlineError").join(" ")
  page_errors = homepage.get_inline_errors
  puts"Actual : #{page_errors}"
  puts"Expected : #{sheet_content}"
  expect(sheet_content).to include(page_errors)
end

And(/^I should see jordans in\-store public consolidate error messages in the end of the page$/) do
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("InPrivateErrors").join(" ")
  page_errors = homepage.get_form_end_errors
  puts"Actual : #{ page_errors}"
  puts"Expected : #{sheet_content}"
  expect(sheet_content).to include(page_errors)
end

Then(/^I should see the jordan in\-store private correct long Rate & Fee Information$/) do
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("PrivateAccessibleMenu")
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  rate_and_fee_text = homepage.get_rate_fee_content_long
  puts "Actual : \n#{rate_and_fee_text}"
  puts "\nExpected : \n#{sheet_content[0]}"
  # rate_and_fee_text.include?(sheet_content[0]).should == true
  expect(sheet_content[0]).to include(rate_and_fee_text)
end

Then(/^I should see the jordan in\-store private correct customer agreement$/) do
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("PrivateAccessibleMenu")
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  customer_agreement_text = homepage.get_customer_agreement
  puts "Actual : \n#{customer_agreement_text}"
  puts "\nExpected : \n#{sheet_content[1]}"
  # rate_and_fee_text.include?(sheet_content[2]).should == true
  expect(sheet_content[1]).to include(customer_agreement_text)
end

Then(/^I should see the jordan in\-store private correct privacy pdf and opt out$/) do
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("PrivateAccessibleMenu")
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  page_privacy_text = homepage.get_privacy_pdf_and_opt_out
  puts "Actual : #{page_privacy_text}"
  puts "Expected : #{sheet_content[2]}"
  #page_privacy_text.include?(sheet_content[2]).should == true
  expect(sheet_content[2]).to include(page_privacy_text)
end


Then(/^I should see the jordan instore public correct long Rate & Fee Information$/) do
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("PrivateAccessibleMenu")
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  rate_and_fee_text = homepage.get_rate_fee_content_long
  puts "Actual : \n#{rate_and_fee_text}"
  puts "\nExpected : \n#{sheet_content[0]}"
  # rate_and_fee_text.include?(sheet_content[0]).should == true
  expect(sheet_content[0]).to include(rate_and_fee_text)
end

Then(/^I should see the jordan instore public correct customer agreement$/) do
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("PrivateAccessibleMenu")
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  customer_agreement_text = homepage.get_customer_agreement
  puts "Actual : \n#{customer_agreement_text}"
  puts "\nExpected : \n#{sheet_content[1]}"
  # rate_and_fee_text.include?(sheet_content[2]).should == true
  expect(sheet_content[1]).to include(customer_agreement_text)
end

Then(/^I should see the jordan instore public correct privacy pdf and opt out$/) do
  xls_parser = ParseXls.new
  sheet_content = xls_parser.get_sheet("PrivateAccessibleMenu")
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  page_privacy_text = homepage.get_privacy_pdf_and_opt_out
  puts "Actual : #{page_privacy_text}"
  puts "Expected : #{sheet_content[2]}"
  #page_privacy_text.include?(sheet_content[2]).should == true
  expect(sheet_content[2]).to include(page_privacy_text)
end


Then(/^I should see the correct FAQS$/) do
  xls_parser = ParseXls.new
  sheet_faqs = xls_parser.get_sheet("FAQS").join(" ")
  (ENV_VER =='2') ? homepage = JordanHomepageVersion3.new(@browser) : homepage = JordanHomepageVersion2.new(@browser)
  page_faqs = homepage.get_faqs
  puts "Actual : #{page_faqs}"
  puts "Expected : #{sheet_faqs}"
  expect(sheet_faqs).to include(page_faqs)
end