

require File.join File.dirname(__FILE__), 'spec_helper'
require File.join File.dirname(__FILE__), '..', 'myapp.rb'

describe "My App" do
  include Rack::Test::Methods

  def app
    MyModule::MyApp
  end

  describe 'responds to "GET /" with' do
    before :each do # NOT 'before :all'; cf: http://j.mp/TpcQEV
      get '/'
    end

    it 'with an HTTP "OK" status code' do
      last_response.should be_ok
    end

    it 'with the correct body content' do
      last_response.body.should == "Hello World! a"
    end

  end

end

