require 'rubygems'
require 'sinatra/base'

module MyModule
  class MyApp < Sinatra::Base
    set :raise_errors, Proc.new { false }
    set :sessions, false
    set :static, true
    set :show_exceptions, false 
    set :public, "public"

      get '/' do
        "Hello World!"
      end
   end
end

if $0 == __FILE__
   MyModule::MyApp.run!
end
