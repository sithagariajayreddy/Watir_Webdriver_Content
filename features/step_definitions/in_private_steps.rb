Given(/^I am on (jordans) (in store private) home page$/) do |brand, section|
  homepage = JordanHomepageVersion2.new(@browser)
  section = section.downcase.gsub!(' ', '_')
  homepage.open(section, brand)
  wait_for_some_time 2
end