require 'rubygems'
require 'spec'
require 'rr'

require File.dirname(__FILE__) + '/../lib/<%= project_name.underscore %>'

Spec::Runner.configure { |c| c.mock_with(:rr) }