Given(/^I am on (jordans) (in store public ipad) home page$/) do |brand, section|
  homepage = JordanHomepageVersion2.new(@browser)
  section = section.downcase.gsub!(' ', '_')
  homepage.open(section, brand)
  homepage.splash_checkbox
  wait_for_some_time 2
end