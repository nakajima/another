require 'spec/spec_helper'
 
describe 'the app' do
  include Elementor
  
  attr_reader :response, :page, :first
  
  it "should not blow up" do
    get_it '/'
    response.should be_ok
  end
end