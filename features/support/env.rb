require 'rspec'
require 'watir-webdriver'
require 'cucumber'
require 'rake'
require 'spreadsheet'
require 'yaml'
require 'page-object'
require 'yaml'

include Selenium
include RSpec::Matchers

require File.dirname(__FILE__) + "/../pages/pages"
ENV_VER = "2"
include Automation