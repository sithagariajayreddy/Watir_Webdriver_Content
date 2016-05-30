require 'rspec'
require 'watir-webdriver'
require 'cucumber'
require 'rake'
require 'spreadsheet'
require 'roo'
require 'page-object'
require 'faker'
require 'yaml'




include RSpec::Matchers

require File.dirname(__FILE__) + "/../pages/config/driver_config"
require File.dirname(__FILE__) + "/../pages/jordan_pages/jordan_page_version2.0/jordan_homepage_version2"
require File.dirname(__FILE__) + "/../pages/jordan_pages/jordan_page_version3.0/jordan_homepage_version3"
require File.dirname(__FILE__) + "/../pages/jordan_pages/jordan_page_version2.0/card_submission_version2"
require File.dirname(__FILE__) + "/../pages/jordan_pages/jordan_page_version3.0/card_submission_version3"
require File.dirname(__FILE__) + "/../pages/jordan_pages/parse_xls"
require File.dirname(__FILE__) + "/../pages/get_homepage_url"

include Automation