require File.dirname(__FILE__) + '/spec_helper'

describe "My App" do
  include Rack::Test::Methods

   def app
      #@app ||= Sinatra::Application
      set :environment, :test
      MyModule::MyApp
   end

  it "should respond to /" do
      puts ":environment " + environment
    get '/'
    last_response.should be_ok
    last_response.body.should == "Hello World! a"
  end
end

