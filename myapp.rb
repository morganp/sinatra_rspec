require 'rubygems'
require 'sinatra/base'
require 'active_record'

module MyModule
   class MyApp < Sinatra::Base
      set :raise_errors, Proc.new { false }
      set :sessions, false
      set :static, true
      set :show_exceptions, true 
      set :public, "public"


      #This should remove the need for speratre configure blocks for ActiveRecord 
      #set :root, File.dirname(__FILE__)
      # Not required for the Active record currently as loading db based on __FILE__

      configure :production, :development do
         puts "DB in Normal Mode"
      end

      configure  :test do
         puts "DB in Test Mode"
      end
      puts "ENV: #{environment}"
     
      ActiveRecord::Base.establish_connection(
         :adapter    => 'sqlite3',
         :database   => File.dirname(__FILE__) + '/db/test.db'
      )




      class Extension < ActiveRecord::Base
      end


      get '/' do
         ## When doing anything with Active Record even if not used the application fails to respond
        
         @thing = Extension.first
         #@thing ||= "a"
         "Hello World! #{@thing.name}"
      end
   end
end

if $0 == __FILE__
   MyModule::MyApp.run!
end
