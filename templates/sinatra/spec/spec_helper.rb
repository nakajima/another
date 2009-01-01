ARGV.clear
 
require 'rubygems'
require 'spec'
require 'sinatra'
require 'sinatra/test/rspec'

require File.join(File.dirname(__FILE__), *%w[.. app])

# For view tests
require 'elementor'
require 'elementor/spec'

