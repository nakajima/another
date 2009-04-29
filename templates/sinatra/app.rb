require 'rubygems'
require 'sinatra/base'

class <%= module_name %> < Sinatra::Default
  set :root, File.dirname(__FILE__)
  set :static, true
  set :public, File.join(root, 'public')
  
  get '/' do
    erb :index
  end
end