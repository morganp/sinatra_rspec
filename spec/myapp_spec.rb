require File.dirname(__FILE__) + '/spec_helper'

describe "My App" do
  include Rack::Test::Methods

  def app
    #@app ||= Sinatra::Application
    MyModule::MyApp
  end

  it "should respond to /" do
    get '/'
    last_response.should be_ok
    last_response.body.should == "blah blah blah"
  end
end

