require 'rubygems'
require 'spec'
require 'rr'
require File.dirname(__FILE__) + '/../lib/another'

Spec::Runner.configure do |config|
  config.mock_with(:rr)
end