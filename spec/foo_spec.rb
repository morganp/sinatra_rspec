  require 'rubygems'
  require 'active_record'

      puts File.dirname(__FILE__) + '/../db/test.db'
      ActiveRecord::Base.establish_connection(
         :adapter    => 'sqlite3',
         :database   => File.dirname(__FILE__) + '/../db/test.db'
      )

      class Extension < ActiveRecord::Base
      end

describe "ActiveRecord Extension" do

   it "Can create new and save" do
      ext = Extension.new(:name => "Z")
      ext.save.should be_true
   end

   it  "can retrieve first" do
      ext = Extension.first
      ext.name.should == "a"
   end

end
